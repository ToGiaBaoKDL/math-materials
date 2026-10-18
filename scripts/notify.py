#!/usr/bin/env python3
import argparse
import asyncio
import os
import tomllib
from pathlib import Path

from announcements import drive_links, render
from config import ROOT


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
    parser = argparse.ArgumentParser(description="Preview or send one lesson announcement to Telegram")
    parser.add_argument("--config", type=Path, required=True)
    parser.add_argument("--secret", type=Path, default=ROOT / ".secret/telegram.toml")
    parser.add_argument("--credentials", type=Path)
    parser.add_argument("--title")
    parser.add_argument("--starts-at")
    parser.add_argument("--location")
    parser.add_argument("--send", action="store_true", help="Send; default only renders HTML locally")
    args = parser.parse_args()
    try:
        config = tomllib.loads(args.config.read_text())
        for field in ("title", "starts_at", "location"):
            if value := getattr(args, field):
                config[field] = value
        links = config.get("links")
        if links is not None and (config.get("document") or config.get("drive_month")):
            raise ValueError("Choose explicit links OR document + drive_month, not both")
        if links is None:
            if not config.get("document") or not config.get("drive_month"):
                raise ValueError("Provide links or both document and drive_month")
            links = drive_links(config["document"], config["drive_month"], args.credentials)
        if not isinstance(links, dict):
            raise ValueError("links must be a TOML table")
        text = render(config, links)
        if not args.send:
            print(text)
            return
        secret = tomllib.loads(args.secret.read_text()) if args.secret.exists() else {}
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
