import hashlib
import mimetypes

FOLDER = "application/vnd.google-apps.folder"
FIELDS = "id,name,mimeType,md5Checksum,webViewLink"


def checksum(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "md5").hexdigest()


class Drive:
    def __init__(self, service):
        self.service = service
        self.cache = {}

    def children(self, parent):
        if parent not in self.cache:
            items, token = [], None
            escaped = parent.replace("\\", "\\\\").replace("'", "\\'")
            while True:
                result = (
                    self.service.files()
                    .list(
                        q=f"'{escaped}' in parents and trashed = false",
                        pageSize=1000,
                        pageToken=token,
                        supportsAllDrives=True,
                        includeItemsFromAllDrives=True,
                        fields=f"nextPageToken,files({FIELDS})",
                    )
                    .execute(num_retries=0)
                )
                items.extend(result.get("files", []))
                token = result.get("nextPageToken")
                if not token:
                    break
            self.cache[parent] = items
        return self.cache[parent]

    def find(self, parent, name, folder=False, required=True):
        matches = [item for item in self.children(parent) if item["name"] == name]
        if len(matches) > 1:
            raise ValueError(f"Drive: duplicate name {name!r} under {parent}; resolve before continuing.")
        if not matches:
            if required:
                raise ValueError(f"Drive: missing {name!r}. Upload the complete set first.")
            return None
        item = matches[0]
        if (item["mimeType"] == FOLDER) != folder:
            raise ValueError(f"Drive: incompatible file type for {name!r}.")
        return item

    def ensure_folder(self, parent, name):
        found = self.find(parent, name, folder=True, required=False)
        if found:
            return found["id"]
        created = (
            self.service.files()
            .create(body={"name": name, "parents": [parent], "mimeType": FOLDER}, fields=FIELDS, supportsAllDrives=True)
            .execute(num_retries=0)
        )
        self.cache.pop(parent, None)
        return created["id"]

    def upload(self, parent, name, local):
        from googleapiclient.http import MediaFileUpload

        existing = self.find(parent, name, required=False)
        digest = checksum(local)
        if existing and existing.get("md5Checksum") == digest:
            return "unchanged", existing
        if existing and existing["mimeType"].startswith("application/vnd.google-apps."):
            raise ValueError(f"Drive: cannot replace native Google file or shortcut {name!r}.")
        media = MediaFileUpload(
            str(local),
            mimetype=mimetypes.guess_type(name)[0] or "application/octet-stream",
            chunksize=8 * 1024 * 1024,
            resumable=True,
        )
        if existing:
            request = self.service.files().update(
                fileId=existing["id"], media_body=media, fields=FIELDS, supportsAllDrives=True
            )
        else:
            request = self.service.files().create(
                body={"name": name, "parents": [parent]}, media_body=media, fields=FIELDS, supportsAllDrives=True
            )
        result = None
        while result is None:
            _, result = request.next_chunk(num_retries=0)
        self.cache.pop(parent, None)
        if result.get("md5Checksum") != digest:
            raise ValueError(f"Drive checksum mismatch after upload: {name}. Rerun to reconcile.")
        if existing and result["id"] != existing["id"]:
            raise ValueError(f"Drive file ID changed unexpectedly: {name}")
        return "updated" if existing else "created", result
