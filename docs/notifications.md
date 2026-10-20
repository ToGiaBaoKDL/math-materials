# Thông báo Telegram

[README](../README.md) · [Xuất bản Drive/Sheet](publishing.md)

Thông báo là tác vụ độc lập, không tự chạy sau build, upload hoặc Sheet. `DOC` chọn đúng một tài liệu; `kind` từ manifest quyết định template. Không có config announcements, tham số CONFIG hay link file nhập thủ công.

## Nguồn dữ liệu

- `metadata.title`: tên tài liệu dành cho người đọc, không phải tên file hoặc slug. Đề thi dùng tên kỳ thi và trường đầy đủ.
- Tinh Hoa thêm `metadata.lesson` (số buổi), `metadata.topic` (tên chuyên đề), `metadata.homework` (có BTVN hay không). Tiêu đề hiển thị `<title> [CĐ <topic>]`; lời mở tự chèn `Buổi <lesson>`.
- Đề thi thêm `metadata.subject`, `metadata.school_year`.
- Câu chữ dùng chung của ba format nằm trong `scripts/announcements.py`. Livestream hiển thị File không cách trước File cách; giữ lời mở về 22:00 và kênh Tóp Tóp; đề thi giữ link nhóm và lời chúc đã duyệt.
- Link PDF luôn đọc từ Drive qua OAuth chung, theo kế hoạch xuất bản; đối chiếu MD5 với PDF local. Không đưa file nguồn vào thông báo, không đổi quyền chia sẻ. Tiêu đề không suy từ tên PDF trên Drive.

## Xem trước và gửi

```sh
make notify DOC=buoi-13 STARTS_AT=2026-10-22T20:00
make notify DOC=nguyen-khuyen
make notify DOC=th-on-tap-gk1-toan-12-thuc-te-ham-so
# Sau khi kiểm tra nội dung và chat đích:
make notify DOC=buoi-13 STARTS_AT=2026-10-22T20:00 SEND=1
```

`STARTS_AT` là lịch học theo giờ Việt Nam, không hẹn giờ gửi; bắt buộc cho Tinh Hoa. `LOCATION` mặc định `Lớp Zoom`. `DRIVE_MONTH` chỉ dùng khi đích khác tháng tài liệu. `CREDENTIALS` chọn token Google khác khi cần. Mặc định đọc Drive và in HTML, không gửi Telegram.

HTML được escape, các khối cách nhau một dòng trống, icon cách nội dung một dấu cách. Giữ nguyên cách xưng hô và `@All` (văn bản, không phải broadcast Telegram). Tin quá dài bị từ chối, không chia tự động.

## Secret và chat đích

Dùng `python-telegram-bot`, không cần polling/webhook. Tạo `.secret/telegram-credentials.toml`, quyền 600; không commit secret:

```toml
bot_token = "TOKEN_FROM_BOTFATHER"
chat_id = "@your_channel"
# thread_id = 123
```

Bot cần quyền gửi vào chat/channel. Token Telegram tách khỏi OAuth Google. `TELEGRAM_BOT_TOKEN`, `TELEGRAM_CHAT_ID` ghi đè secret; Dùng `SECRET=path/to/credentials.toml` qua Make hoặc `--secret` qua CLI để chọn file khác. Không truyền token qua command line.

`SEND=1` gửi một tin mới và in `message_id`. Không retry tự động vì Telegram có thể đã nhận trước khi timeout; kiểm tra chat trước khi gửi lại. Không tự đăng lịch hoặc chống gửi lặp.
