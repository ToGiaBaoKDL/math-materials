# Build và kiểm tra

[README](../README.md) · [Mô hình tài liệu](document-model.md) · [Xuất bản](publishing.md)

## Môi trường và lệnh

Cần `uv`, Typst, Python 3.13+, GNU Make, font Times New Roman/Arial/Noto Sans/FreeSerif và bộ 9Slide trong `assets/fonts/dxt/` và bộ công cụ Poppler (`pdfinfo`, `pdftotext`). New Computer Modern Math được Typst cung cấp. Hình vector dùng các hàm vẽ gốc của Typst, không cần package bên ngoài.

Chạy từ gốc repo:

```sh
make list                                 # Liệt kê tài liệu và biến thể
make build DOC=buoi-10                    # Build một tài liệu
make build DOC=phan-boi-chau               # Chọn bằng đoạn tên duy nhất
make build DOC=buoi-10 VARIANT=de-cach
make build DOC=buoi-11                    # Bài giảng: 3 bản đề / dòng viết / đáp án
make help

# Cũng chấp nhận ID đầy đủ
make build DOC="2026-10/Đề thi/phan-boi-chau-12-gk1-ma-1108-26-27"
```

## Quá trình build

Makefile gọi `scripts/build.py` với `--font-path assets/fonts`, tìm tài liệu theo `documents/<tháng>/<loại>/<id>/main.typ`. Manifest schema 1 khai báo các recipe `variants` gồm `filename` và `inputs` truyền vào Typst qua `sys.inputs`. Build mặc định chọn đầu ra bằng profile chung trong `document_model.py`; `VARIANT` cho phép build chủ động một recipe để kiểm tra. Build cập nhật đường dẫn, số trang, byte và checksum trong `outputs`. Build cố định creation timestamp theo ngày tiếp nhận trong manifest để cùng mã nguồn/toolchain cho checksum ổn định. PDF dùng chuẩn 1.5, nhúng font và giữ văn bản có thể chọn/tìm kiếm. Khi PDF thay đổi, trạng thái review là `pending` cho đến khi bản xuất được đối chiếu; phiên bản công cụ và kết quả kiểm tra lưu trong manifest.

## Render hình

Các hình cần hiển thị nét ổn định giữa trình đọc PDF có thể khai báo `figure_renders` trong manifest: `entry`, `output` (tương đối với thư mục tài liệu), `inputs`, `ppi`. Build dựng ảnh 600 dpi từ mã Typst trước khi biên dịch PDF; mã hình vector vẫn là nguồn chỉnh sửa. Cache nằm tại `.figure-cache.json` trong thư mục targets của tài liệu: so hash mã/tài nguyên tài liệu, template, branding, nguồn/font, input/PPI và phiên bản Typst, đồng thời kiểm tra hash ảnh đầu ra. Không kiểm kê được font hệ thống thì rebuild. Đổi variant PDF mà các input hình không đổi sẽ dùng lại ảnh. Cache không đánh dấu QA là đã duyệt.

`assets/targets/` được Git bỏ qua. Build ghi đè đầu ra hiện tại, không cần lệnh clean. Không có lệnh preview hoặc ảnh preview trang; `figure_renders` tạo tài nguyên hình để đưa vào PDF, không phải ảnh preview trang.

## Kiểm tra Python

Chạy `make check` để kiểm tra Ruff, định dạng và type bằng Pyright cho toàn bộ `scripts/`. Chạy `make format` để sửa các lỗi lint tự động an toàn và định dạng code. Mọi CLI chạy bằng `uv run python scripts/...`; dependency runtime khai báo một lần tại `[project].dependencies`, Ruff/Pyright ở nhóm `dev`. Chạy `uv sync` theo `uv.lock`. Các import SDK Google/Telegram và OLE được trì hoãn tại ranh giới thao tác cần thư viện; import nội bộ/stdlib đặt ở đầu module, type-only dùng `TYPE_CHECKING`.

Template dùng Typstyle 0.15.2, rộng 120 ký tự, thụt 2 spaces: `make format-typst` / `make check-typst` (cần `typstyle` trong PATH, hoặc truyền `TYPSTYLE=/path/to/typstyle`). Format không thay nội dung nguồn; sau refactor phải đối chiếu PDF.

## Duyệt bản xuất

Build thành công chưa xác nhận nội dung và bố cục đúng. Thực hiện [typst-review](../skills/typst-review/SKILL.md) trước khi đánh dấu hoàn tất; khi bản PDF thay đổi, kiểm tra lại những phần bị ảnh hưởng. Upload và ghi Sheet là các bước riêng trong [xuất bản](publishing.md).

## Tổ chức scripts

Giữ một tầng module với tên theo trách nhiệm; chưa cần thêm package hoặc lớp service trung gian. CLI chỉ điều phối, các module dùng chung không import ngược CLI.

| Nhóm | Module | Trách nhiệm |
| --- | --- | --- |
| CLI | `build.py`, `upload.py`, `sheets.py`, `notify.py` | Build, upload, cập nhật Sheet, gửi thông báo độc lập |
| Xác thực | `google_auth.py` | Một CLI `make google-auth`, một token dùng chung Drive và Sheets |
| Mô hình | `document_model.py`, `publishing.py` | Schema/profile và kế hoạch file, tên xuất bản, thứ tự trên Sheet |
| Hạ tầng | `config.py`, `drive.py`, `pdf.py`, `figure_cache.py` | Cấu hình, Drive API, metadata PDF, cache render hình |
| Nội dung | `announcements.py`, `mathtype.py` | Định dạng thông báo và đọc công thức nguồn |

Kế hoạch upload chỉ chọn PDF theo profile và file nguồn `source.*`; không đưa `manifest.json`, cache hay mã Typst lên Drive.

## Trích công thức DOCX

Chạy `uv run python scripts/mathtype.py <source.docx> /tmp/equations.json` để giải mã công thức MathType MTEF 5 thành biểu thức Typst. Script kiểm tra đã đọc hết dữ liệu OLE và đối chiếu với dữ liệu MTEF trong preview WMF nhúng nếu có. Nếu OLE không còn stream `Equation Native` nhưng WMF vẫn chứa MTEF, parser khôi phục biểu thức từ preview và liệt kê riêng trong `recovered_from_preview`; không tính là cặp đã đối chiếu. WMF không có MTEF cần được đọc riêng, không tự suy công thức. Đây là kiểm tra dữ liệu công thức, không thay thế duyệt nội dung và bố cục tài liệu.

Parser dùng chung bộ đọc tab-stop cho ruler độc lập và payload ruler gắn trong line/pile; hỗ trợ mũi tên đơn có nhãn trên/dưới. Dấu chấm phẩy được xuất như ký tự literal và `//` được chuẩn hoá thành dấu song song để tránh bị hiểu là cú pháp Typst. Cấu trúc/variation chưa hỗ trợ phải báo lỗi, không bỏ qua công thức. MTEF 3 chưa được hỗ trợ.

Tham chiếu định dạng: [Wiris MTEF 5](https://docs.wiris.com/en_US/mathtype-mtef-v5-mathtype-40-and-later). Dữ liệu ruler đính kèm được kiểm tra trực tiếp trên cả OLE và WMF trong các nguồn DOCX.
