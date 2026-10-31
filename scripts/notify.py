#!/usr/bin/env python3
import argparse
import asyncio
import os
import tomllib
from pathlib import Path

from announcements import announcement_config, drive_publication, render
from config import ROOT
from document_model import documents, load_manifest


async def send(text, secret):
    from telegram import Bot, LinkPreviewOptions

    token = os.environ.get("TELEGRAM_BOT_TOKEN") or secret.get("bot_token")
    chat = os.environ.get("TELEGRAM_CHAT_ID") or secret.get("chat_id")
    if not token or not chat:
        raise ValueError("Set bot_token and chat_id in the secret file or TELEGRAM_BOT_TOKEN/TELEGRAM_CHAT_ID")
    thread = secret.get("thread_id")
    if thread is not None and (not isinstance(thread, int) or thread <= 0):
        raise ValueError("thread_id must be a positive integer")
    async with Bot(token) as bot:
        message = await bot.send_message(
            chat_id=chat,
            text=text,
            parse_mode="HTML",
            link_preview_options=LinkPreviewOptions(is_disabled=True),
            message_thread_id=thread,
            connect_timeout=15,
            read_timeout=30,
            write_timeout=30,
        )
    print(f"Sent Telegram message_id={message.message_id}")


def main():
    parser = argparse.ArgumentParser(description="Preview or send one document announcement to Telegram")
    parser.add_argument("--document", required=True, help="Unique document name fragment or full ID")
    parser.add_argument("--secret", type=Path, default=ROOT / ".secret/telegram-credentials.toml")
    parser.add_argument("--credentials", type=Path)
    parser.add_argument("--starts-at")
    parser.add_argument("--template", choices=("tinh-hoa", "livestream", "exam"))
    parser.add_argument("--location", default="Lớp Zoom")
    parser.add_argument("--drive-month")
    parser.add_argument("--send", action="store_true", help="Send; default only renders HTML locally")
    args = parser.parse_args()
    try:
        document = documents(args.document)[0]
        config = announcement_config(load_manifest(document), args.starts_at, args.location, args.template)
        links = drive_publication(document, args.drive_month, args.credentials)
        text = render(config, links)
        if not args.send:
            print(text)
            return
        if not args.secret.is_file() and not (
            os.environ.get("TELEGRAM_BOT_TOKEN") and os.environ.get("TELEGRAM_CHAT_ID")
        ):
            raise ValueError(
                f"Telegram credentials file not found: {args.secret}. Set SECRET=/path/to/credentials.toml"
            )
        secret = tomllib.loads(args.secret.read_text()) if args.secret.is_file() else {}
        asyncio.run(send(text, secret))
    except Exception as error:
        # Transport exceptions may contain the Bot API URL (including the token).
        if isinstance(error, ValueError) and not isinstance(error, tomllib.TOMLDecodeError):
            parser.exit(1, f"Announcement failed: {error}\n")
        parser.exit(
            1, f"Announcement failed ({type(error).__name__}); no automatic retry. Check chat before resending.\n"
        )


if __name__ == "__main__":
    main()
