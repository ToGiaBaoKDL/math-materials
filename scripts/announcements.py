from datetime import datetime
from html import escape
from pathlib import Path
from typing import Any
from urllib.parse import urlparse

LABELS = {
    "de": "File đề (file ko cách)",
    "de-cach": "File đề (file cách)",
    "dap-an": "File đáp án/ Lời giải chi tiết",
    "de-dap-an": "File đề + đáp án",
}


def announcement_config(
    manifest: dict[str, Any], starts_at: str | None = None, location: str = "Lớp Zoom"
) -> dict[str, Any]:
    kind = manifest["kind"]
    metadata = manifest["metadata"]
    config: dict[str, Any] = {"kind": kind}
    if kind == "tinh-hoa":
        for field in ("title", "topic"):
            validate_text(metadata, field)
        lesson = metadata.get("lesson")
        if type(lesson) is not int or lesson < 1:
            raise ValueError("Document metadata requires a positive lesson number")
        if not starts_at:
            raise ValueError("Set STARTS_AT=YYYY-MM-DDTHH:MM for the lesson")
        config.update(
            title=f"{metadata['title']} [CĐ {metadata['topic']}]",
            intro=f"Helo các em, chị gửi File đề Buổi {lesson} tối mai học, các em tải về và làm bài trước nhé.",
            starts_at=starts_at,
            location=location,
            homework=metadata.get("homework", False),
            closing="Video record + File tài liệu sẽ có trên Website thầy trước 19h ngày hôm sau buổi học, có anh Khoa sẽ thông báo cho các em nhé. @All",
        )
    elif kind == "exam":
        for field in ("title", "subject", "school_year"):
            validate_text(metadata, field)
            config[field] = metadata[field]
        config.update(
            group_url="https://zalo.me/g/n2me9hw5l29ahqe8idlx",
            closing="Thầy Thắng chúc em học tập hiệu quả. Đạt 9+ GHK1 nhé!! Siuuuu 🏆🏆",
        )
    elif kind == "livestream":
        config["intro"] = (
            "Chan thôii các em ơi, 22:00 tối nay trên kênh Tóp Tóp chính của thầy Thắng toanthaythangdxt nhé"
        )
    else:
        raise ValueError(f"Unknown announcement kind: {kind}")
    return config


def lesson_blocks(config: dict[str, Any], links: dict[str, str]) -> list[str]:
    starts = datetime.strptime(config["starts_at"], "%Y-%m-%dT%H:%M")
    weekday = "Chủ nhật" if starts.weekday() == 6 else f"Thứ {starts.weekday() + 2}"
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
        if config.get("homework", False) and variant in ("de", "de-cach"):
            label += " + BTVN"
        blocks.append(f"🔰 <b>{label}:</b>\n{escape(url)}")
    if closing:
        blocks.append("🔰 " + escape(closing))
    return blocks


def validate_text(config: dict[str, Any], field: str) -> None:
    value = config.get(field)
    if not isinstance(value, str) or not value.strip():
        raise ValueError(f"Announcement requires {field}")


def livestream_blocks(config: dict[str, Any], links: dict[str, str]) -> list[str]:
    return [
        "<b>[PHÁT ĐỀ LIVESTREAM TỐI NAY]</b> " + escape(config["intro"]),
        "\n".join(
            f"{label}: {escape(links[variant])}"
            for variant, label in (("de-cach", "File cách"), ("de", "File không cách"))
            if variant in links
        ),
    ]


def exam_blocks(config: dict[str, Any], links: dict[str, str]) -> list[str]:
    validate_url(config["group_url"], "group_url")
    return [
        "🎁 <b>FILE ĐỀ + FILE GIẢI CHI TIẾT THAM KHẢO: "
        + escape(config["title"])
        + "</b>\n➥ MÔN: "
        + escape(config["subject"])
        + " | NĂM HỌC "
        + escape(config["school_year"]),
        "📍 File đề + File đáp án giải tham khảo: " + escape(links["de-dap-an"]),
        "🔥 Tham gia miễn phí Group Mukbang Toán Thực Tế &amp; Xác Suất cùng đội VIPDXT: "
        + escape(config["group_url"]),
        escape(config["closing"]),
    ]


REQUIRED_FIELDS = {
    "tinh-hoa": {"title", "starts_at", "location", "intro"},
    "livestream": {"intro"},
    "exam": {"title", "subject", "school_year", "group_url", "closing"},
}
OPTIONAL_FIELDS = {"tinh-hoa": {"homework", "closing"}, "livestream": set(), "exam": set()}
LINK_VARIANTS = {"tinh-hoa": set(LABELS), "livestream": {"de", "de-cach"}, "exam": {"de-dap-an"}}
RENDERERS = {"tinh-hoa": lesson_blocks, "livestream": livestream_blocks, "exam": exam_blocks}


def render(config: dict[str, Any], links: dict[str, str]) -> str:
    kind = config.get("kind")
    if not isinstance(kind, str) or kind not in RENDERERS:
        raise ValueError("kind is required: tinh-hoa, livestream or exam")
    allowed = REQUIRED_FIELDS[kind] | OPTIONAL_FIELDS[kind] | {"kind", "drive_month"}
    if extra := config.keys() - allowed:
        raise ValueError(f"Unknown announcement fields: {', '.join(sorted(extra))}")
    for field in sorted(REQUIRED_FIELDS[kind]):
        validate_text(config, field)
    if not links or links.keys() - LINK_VARIANTS[kind]:
        raise ValueError(f"Invalid publication links for {kind}")
    for variant, url in links.items():
        validate_url(url, variant)
    text = "\n\n".join(RENDERERS[kind](config, links))
    # Conservative bound includes markup; never split a release announcement midway.
    if len(text.encode("utf-16-le")) // 2 > 4096:
        raise ValueError("Announcement too long; shorten it to fit one Telegram message")
    return text


def validate_url(url: Any, field: str) -> None:
    if not isinstance(url, str) or urlparse(url).scheme != "https" or not urlparse(url).netloc:
        raise ValueError(f"Invalid HTTPS link for {field}")


def drive_publication(path: Path, month: str | None = None, token: Path | None = None) -> dict[str, str]:
    from config import DRIVE_ROOT
    from drive import Drive
    from google_auth import credentials
    from googleapiclient.discovery import build
    from publishing import document_files, publication_category, publication_month

    files = document_files(path)
    drive = Drive(build("drive", "v3", credentials=credentials(token), cache_discovery=False))
    parent = DRIVE_ROOT
    for name in (publication_month(path, month), publication_category(path), path.parent.name):
        folder = drive.find(parent, name, folder=True)
        assert folder is not None
        parent = folder["id"]
    published = {key: value for key, value in files.items() if key != "goc"}
    return drive.verified_links(parent, published)
