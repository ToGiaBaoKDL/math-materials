# Thông báo Telegram

[README](../README.md) · [Xuất bản Drive/Sheet](publishing.md)

Dùng `python-telegram-bot` với `Bot.send_message`, không chạy polling/webhook hay server. Template thuần trong `scripts/announcements.py`; CLI và gửi tin trong `scripts/notify.py`. HTML được escape cho mọi nội dung dynamic, link preview bị tắt. Không tự retry gửi tin vì timeout có thể xảy ra sau khi Telegram đã nhận; kiểm tra chat trước khi chạy lại.

## Ba format thông báo

`kind` chọn format theo mô hình tài liệu: `tinh-hoa`, `livestream`, `exam`. Với `document`, CLI tự đọc kind từ manifest (không dựa vào thư mục Drive hoặc tab Sheet); nếu khai báo kind khác manifest sẽ báo lỗi. Với link trực tiếp, bắt buộc khai báo `kind`; không có format mặc định ngầm.

- **Tinh Hoa/chuyên đề:** giữ format buổi học hiện tại, cấu hình bên dưới.
- **Livestream:** [mẫu cấu hình](examples/announcement-livestream.toml), `intro` giữ nguyên lời nhắn; các thông tin giờ và kênh nằm trong nội dung này. Link theo thứ tự file cách, file không cách; không có đáp án.
- **Đề thi:** [mẫu cấu hình](examples/announcement-exam.toml), các trường `title`, `subject`, `school_year`, `group_url`, `closing` bắt buộc. Chỉ nhận link `de-dap-an` để nhãn thông báo phản ánh đúng file gộp.

Các mẫu giữ nguyên câu chữ được yêu cầu. Kiểm tra giờ/ngày, tiêu đề và link trước khi gửi. Mỗi khối cách nhau một dòng trống; icon mở đầu có một dấu cách, không tách các cúp liên tiếp ở cuối lời chúc. Livestream đặt nhãn và URL trên cùng dòng, hai link liền nhau. Đề thi giữ dòng môn/năm học ngay dưới tiêu đề.

```sh
make notify CONFIG=docs/examples/announcement-livestream.toml
make notify CONFIG=docs/examples/announcement-exam.toml
```

Thông báo vẫn là tác vụ độc lập, không nối tự động vào build/upload/Sheet.

## Cấu hình buổi học

Copy [mẫu Buổi 11](examples/announcement-tinh-hoa.toml) vào thư mục tài liệu nếu muốn lưu cùng mã nguồn, hoặc `.secret/` cho bản nháp riêng. Đây là mẫu ngày cũ, cần sửa lịch/nội dung trước khi gửi.

| Trường | Quy tắc |
|---|---|
| `title`, `intro`, `location` | Bắt buộc; văn bản thuần, không nhập HTML |
| `starts_at` | Chuỗi `YYYY-MM-DDTHH:MM`, giờ Việt Nam; tự tính thứ trong tuần, chỉ hiển thị lịch học, không hẹn giờ gửi |
| `homework` | Boolean; thêm `+ BTVN` vào nhãn hai bản đề khi thực sự có bài tập |
| `closing` | Đoạn kết tùy chọn; thông tin record/người thông báo nằm ở đây |
| `links` | Bảng URL HTTPS theo variant `de`, `de-cach`, `dap-an`, `de-dap-an`; bỏ variant không có |
| `document`, `drive_month` | Thay cho toàn bộ bảng `links`; tìm folder/file bằng Google API theo kế hoạch xuất bản chung và kiểm tra MD5 với PDF local |

Hai cách lấy link không dùng đồng thời. Link trực tiếp phục vụ tài liệu ngoài repo và preview offline; người gửi chịu trách nhiệm kiểm tra quyền truy cập. Với link tự động, dùng OAuth chung, mapping và Drive client hiện có; không đổi quyền chia sẻ. Preview chế độ này có đọc Drive, không ghi. Link file nguồn không đưa vào thông báo học sinh.

## Secret và chat đích

Tạo bot qua BotFather rồi tự điền `.secret/telegram.toml` (đã được Git bỏ qua), đặt quyền `chmod 600 .secret/telegram.toml`:

```toml
bot_token = "TOKEN_FROM_BOTFATHER"
chat_id = "@your_channel"
# Hoặc chat_id số âm của nhóm; bot cần được thêm vào nhóm.
# thread_id = 123  # Topic trong forum, tùy chọn
```

Bot phải có quyền gửi; với channel, cấp quyền đăng bài. Token Telegram tách khỏi OAuth Google. Không truyền token qua tham số command line hoặc commit token. Biến môi trường `TELEGRAM_BOT_TOKEN`, `TELEGRAM_CHAT_ID` ghi đè giá trị trong file. CLI có `--secret` để chọn cấu hình chat khác; `--credentials` chọn token Google khi cần.

Giữ nguyên câu chữ được truyền vào; không sửa chính tả, cách xưng hô hay bỏ `@All` trong nội dung. `@All` trong mẫu được giữ như văn bản, không phải broadcast trên Telegram. Sau mỗi emoji mở đầu dòng có một dấu cách. Giữa các khối tiêu đề, lời mở, lịch học, từng link và lời kết có một dòng trống; thời gian/địa điểm liền nhau, nhãn file/URL liền nhau. Template chỉ hiển thị variant có link; không tự sinh đáp án hoặc nội dung BTVN.

## Preview và gửi

```sh
make notify CONFIG=docs/examples/announcement-tinh-hoa.toml
# Chỉ gửi sau khi sửa mẫu và kiểm tra nội dung/chat đích:
make notify CONFIG=path/to/announcement-tinh-hoa.toml SEND=1
```

CLI hỗ trợ override trường thường thay đổi, không cần sửa file:

```sh
uv run python scripts/notify.py --config path/to/announcement-tinh-hoa.toml \
  --starts-at 2026-10-22T20:00 --location "Lớp Zoom"
```

Mặc định in HTML ra terminal, không đọc token Telegram hoặc gửi tin. `--send` mới gửi và in `message_id` khi thành công. Mỗi lần gửi chủ động tạo một tin mới; chưa có tự động đăng lịch hoặc chống gửi lặp. Tin quá dài bị từ chối thay vì cắt giữa nội dung.

Tham khảo: [python-telegram-bot](https://docs.python-telegram-bot.org/en/stable/telegram.bot.html), [Telegram Bot API](https://core.telegram.org/bots/api#sendmessage).
