import json
import re

from build import ROOT

AUTH_SCOPES = ["https://www.googleapis.com/auth/spreadsheets", "https://www.googleapis.com/auth/drive"]
DEFAULT_TOKEN = ROOT / ".secret/thaythangtoan4-token.json"
DEFAULT_CLIENT = ROOT / ".secret/dxt-toan-2027-client.json"


def credentials(path=None, client=None):
    from google.auth.transport.requests import Request
    from google.oauth2.credentials import Credentials
    from google.oauth2.service_account import Credentials as ServiceCredentials

    if client:
        from google_auth_oauthlib.flow import InstalledAppFlow

        flow = InstalledAppFlow.from_client_secrets_file(str(client), AUTH_SCOPES)
        creds = flow.run_local_server(port=0, prompt="consent", access_type="offline")
        granted = set(getattr(creds, "granted_scopes", None) or creds.scopes or [])
        if not set(AUTH_SCOPES).issubset(granted) or not creds.refresh_token:
            raise ValueError("Google authorization incomplete; grant Drive and Sheets access with make drive-auth.")
        if path is None:
            from googleapiclient.discovery import build

            user = (
                build("drive", "v3", credentials=creds, cache_discovery=False)
                .about()
                .get(fields="user(emailAddress)")
                .execute(num_retries=0)["user"]
            )
            email = user["emailAddress"].lower()
            name = email.removesuffix("@gmail.com")
            name = re.sub(r"[^a-z0-9@._-]", "_", name)
            path = ROOT / ".secret" / f"{name}-token.json"
    else:
        path = path or DEFAULT_TOKEN
        if not path.is_file():
            raise ValueError(f"Authorize first: make drive-auth CLIENT=path/to/oauth-client.json CREDENTIALS={path}")
        info = json.loads(path.read_text())
        if info.get("type") == "service_account":
            return ServiceCredentials.from_service_account_info(info, scopes=AUTH_SCOPES)
        creds = Credentials.from_authorized_user_info(info)
        available = set(creds.scopes or [])
        if not set(AUTH_SCOPES).issubset(available):
            raise ValueError("Google token lacks required scopes; run make drive-auth to authorize again.")
        if not creds.valid:
            if not creds.refresh_token:
                raise ValueError("Google credentials have no refresh token; run make drive-auth.")
            creds.refresh(Request())
    path.parent.mkdir(parents=True, exist_ok=True)
    path.touch(mode=0o600, exist_ok=True)
    path.chmod(0o600)
    path.write_text(creds.to_json() + "\n")
    if client:
        print(f"Google authorization saved to {path}")
    return creds
