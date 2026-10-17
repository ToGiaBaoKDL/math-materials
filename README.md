# Math Materials

Dựng lại đề thi và bài giảng toán từ ảnh, PDF hoặc DOCX bằng Typst; xuất PDF có nội dung chính xác, hình minh họa và bố cục theo convention DXT.

## Bắt đầu

Cần `uv`, Typst, GNU Make, font và Poppler; xem [môi trường build](docs/build.md).

```sh
make list
make build DOC=buoi-10
make build DOC=buoi-10 VARIANT=de-cach
make check
make help
```

Sau khi duyệt PDF, thực hiện [upload và cập nhật Sheet](docs/publishing.md). Hai lệnh dùng chung token OAuth; cấp quyền bằng `make drive-auth`. Luồng cũ còn tại `make upload-rclone` trong giai đoạn chuyển tiếp.

## Tài liệu hệ thống

| Tài liệu | Nội dung |
|---|---|
| [Mô hình tài liệu](docs/document-model.md) | Phân loại, đường dẫn, nguồn, manifest và variant |
| [Build và kiểm tra](docs/build.md) | Môi trường, lệnh build, render hình, metadata và kiểm tra Python |
| [Xuất bản](docs/publishing.md) | Drive, xác thực, tên file, mapping Sheet và quy tắc cập nhật |

## Cấu trúc

```text
assets/sources/    # Nguồn gốc
assets/targets/    # PDF đầu ra, được Git bỏ qua
assets/branding/   # Logo và icon
assets/fonts/      # Font đóng gói
documents/        # Manifest và mã Typst từng tài liệu
templates/        # Theme, component và hàm vẽ chung
scripts/          # Build, upload và Sheet
docs/             # Mô hình và hành vi hệ thống
skills/           # Hướng dẫn thực hiện và convention
```

## Skills

| Skill | Trách nhiệm |
|---|---|
| [math-transcription](skills/math-transcription/SKILL.md) | Chép và đối chiếu nguồn, nội dung, metadata và mapping |
| [typst-layout](skills/typst-layout/SKILL.md) | Heading, font, cỡ chữ, bảng, phân trang và template |
| [typst-figures](skills/typst-figures/SKILL.md) | Hình học, nét, nhãn, phối màu và tương phản |
| [typst-review](skills/typst-review/SKILL.md) | Kiểm tra PDF, kết quả build và trạng thái QA |

Mỗi quy tắc được mô tả tại tài liệu phụ trách; nơi khác dẫn liên kết. Docs giải thích mô hình và hành vi hệ thống, skills hướng dẫn thực hiện. Dữ liệu và ngoại lệ riêng của từng bộ nằm trong manifest tương ứng. Khi thay hành vi, cập nhật docs liên quan cùng mã nguồn; khi thay convention thiết kế, cập nhật skill và template. Phân chia trách nhiệm giữa skills không yêu cầu các agent riêng.
