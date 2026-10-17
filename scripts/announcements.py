from datetime import datetime
from html import escape
from urllib.parse import urlparse

LABELS = {
    "de": "File đề (file ko cách)",
    "de-cach": "File đề (file cách)",
    "dap-an": "File đáp án/ Lời giải chi tiết",
    "de-dap-an": "File đề + đáp án",
}


def render(config, links):
    allowed = {"title", "starts_at", "location", "intro", "closing", "homework", "links", "document", "drive_month"}
    if extra := config.keys() - allowed:
        raise ValueError(f"Unknown announcement fields: {', '.join(sorted(extra))}")
    for field in ("title", "starts_at", "location", "intro"):
        if not isinstance(config.get(field), str) or not config[field].strip():
            raise ValueError(f"Announcement requires {field}")
    starts = datetime.strptime(config["starts_at"], "%Y-%m-%dT%H:%M")
    weekday = "Chủ nhật" if starts.weekday() == 6 else f"Thứ {starts.weekday() + 2}"
    if not links or links.keys() - LABELS.keys():
        raise ValueError("Provide at least one link using de, de-cach, dap-an or de-dap-an")
    if not isinstance(config.get("homework", False), bool):
        raise ValueError("homework must be true or false")
    closing = config.get("closing", "")
    if not isinstance(closing, str):
        raise ValueError("closing must be text")
    blocks = [
        f"🔰 <b>[PHÁT ĐỀ] {escape(config['title'])}</b>",
        escape(config["intro"]),
        f"⏰ <b>Thời gian học:</b> {starts:%Hh%M}, {weekday} ({starts:%d/%m/%Y})\n"
        f"📍 <b>Địa điểm:</b> {escape(config['location'])}",
    ]
    for variant, label in LABELS.items():
        if variant not in links:
            continue
        url = links[variant]
        if not isinstance(url, str) or urlparse(url).scheme != "https" or not urlparse(url).netloc:
            raise ValueError(f"Invalid HTTPS link for {variant}")
        if config.get("homework", False) and variant in ("de", "de-cach"):
            label += " + BTVN"
        blocks.append(f"🔰 <b>{label}:</b>\n{escape(url)}")
    if closing:
        blocks.append("🔰 " + escape(closing))
    text = "\n\n".join(blocks)
    # Conservative bound includes markup; never split a release announcement midway.
    if len(text.encode("utf-16-le")) // 2 > 4096:
        raise ValueError("Announcement too long; shorten it to fit one Telegram message")
    return text


def drive_links(document, month, token=None):
    from drive import Drive
    from google_auth import credentials
    from googleapiclient.discovery import build
    from publishing import DRIVE_ROOT, check_month, document_files, documents

    path = documents(document)[0]
    files = document_files(path)
    drive = Drive(build("drive", "v3", credentials=credentials(token), cache_discovery=False))
    parent = DRIVE_ROOT
    for name in (check_month(month), path.parent.parent.name, path.parent.name):
        folder = drive.find(parent, name, folder=True)
        assert folder is not None
        parent = folder["id"]
    return drive.verified_links(parent, {key: value for key, value in files.items() if key != "goc"})
