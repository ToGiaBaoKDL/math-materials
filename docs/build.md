# Build và kiểm tra

[README](../README.md) · [Mô hình tài liệu](document-model.md) · [Xuất bản](publishing.md)

## Môi trường và lệnh

Cần `uv`, Typst, Python 3, GNU Make, font Times New Roman/Arial/Noto Sans/FreeSerif và bộ 9Slide trong `assets/fonts/dxt/` và bộ công cụ Poppler (`pdfinfo`, `pdftotext`). New Computer Modern Math được Typst cung cấp. Hình vector dùng các hàm vẽ gốc của Typst, không cần package bên ngoài.

Chạy từ gốc repo:

```sh
make list                                 # Liệt kê tài liệu và biến thể
make build                                # Build tất cả PDF
make build DOC=phan-boi-chau               # Chọn bằng đoạn tên duy nhất
make build DOC=buoi-10 VARIANT=de-cach
make build DOC=buoi-11                    # Bài giảng: 3 bản đề / dòng viết / đáp án
make help

# Cũng chấp nhận ID đầy đủ; DOCUMENT là alias tương thích của DOC
make build DOC="2026-10/Đề thi/phan-boi-chau-toan-12-giua-ky-1-ma-1108"
```

## Quá trình build

Makefile gọi `scripts/build.py` với `--font-path assets/fonts`, tìm tài liệu theo `documents/<tháng>/<loại>/<id>/main.typ`. Nếu manifest có `variants`, mỗi bản khai báo `filename` và `inputs` truyền vào Typst qua `sys.inputs`; nếu không, xuất `document.pdf`. Build cập nhật đường dẫn, số trang, byte và checksum trong `output` hoặc `outputs`. Build cố định creation timestamp theo ngày tiếp nhận trong manifest để cùng mã nguồn/toolchain cho checksum ổn định. PDF dùng chuẩn 1.5, nhúng font và giữ văn bản có thể chọn/tìm kiếm. Khi PDF thay đổi, trạng thái review là `pending` cho đến khi bản xuất được đối chiếu; phiên bản công cụ và kết quả kiểm tra lưu trong manifest.

## Render hình

Các hình cần hiển thị nét ổn định giữa trình đọc PDF có thể khai báo `figure_renders` trong manifest: `entry`, `output` (tương đối với thư mục tài liệu), `inputs`, `ppi`. Build dựng ảnh 600 dpi từ mã Typst trước khi biên dịch PDF; mã hình vector vẫn là nguồn chỉnh sửa.

`assets/targets/` được Git bỏ qua. Build ghi đè đầu ra hiện tại, không cần lệnh clean. Không có lệnh preview hoặc ảnh preview trang; `figure_renders` tạo tài nguyên hình để đưa vào PDF, không phải ảnh preview trang.

## Kiểm tra Python

Chạy `make check` để kiểm tra Ruff, định dạng và type bằng Pyright cho toàn bộ `scripts/`. Chạy `make format` để sửa các lỗi lint tự động an toàn và định dạng code. `uv run` cài nhóm dependency `dev` trong `pyproject.toml`; các dependency Google API và OLE giúp Pyright kiểm tra đúng thư viện mà script dùng.

## Duyệt bản xuất

Build thành công chưa xác nhận nội dung và bố cục đúng. Thực hiện [typst-review](../skills/typst-review/SKILL.md) trước khi đánh dấu hoàn tất; khi bản PDF thay đổi, kiểm tra lại những phần bị ảnh hưởng. Upload và ghi Sheet là các bước riêng trong [xuất bản](publishing.md).
