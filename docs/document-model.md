# Mô hình tài liệu

[README](../README.md) · [Build](build.md) · [Xuất bản](publishing.md)

## Cấu trúc lưu trữ

```text
math-materials/
├── README.md
├── docs/                                 # Mô hình, build và xuất bản
├── assets/
│   ├── fonts/dxt/                         # Font 9Slide nguyên bản do người dùng cung cấp
│   ├── sources/YYYY-MM/<Đề thi|Chuyên đề|Livestream>/<document-id>/   # DOCX/ảnh/PDF đầu vào
│   └── targets/YYYY-MM/<Đề thi|Chuyên đề|Livestream>/<document-id>/   # PDF đầu ra
├── documents/YYYY-MM/<Đề thi|Chuyên đề|Livestream>/<document-id>/
│   ├── manifest.json                      # Mapping và trạng thái
│   ├── main.typ                           # Mã nguồn tài liệu
│   ├── content/                           # Chỉ tách khi tài liệu dài
│   └── figures/                           # Mã hình .typ / SVG nếu cần
├── templates/                             # Theme/component .typ dùng chung
├── scripts/build.py                       # Build các bản xuất theo manifest
└── skills/<skill>/SKILL.md                 # Bốn skill theo trách nhiệm
```

Tên file tài nguyên dùng chữ thường không dấu, nối bằng `-`, không có dấu cách hoặc `#`; tên gốc giữ trong manifest. Tên family bên trong font không đổi khi đổi tên file `.ttf`. Thư mục gốc chỉ giữ README, Makefile và các thư mục chức năng; không để ảnh/font upload rời ở gốc. Chỉ lưu bản mẫu cũ khi cần giữ lịch sử. Chỉ bỏ bản trùng sau khi checksum khớp với bản lưu chính.

Đây là quy ước tổ chức; các thư mục tùy chọn chỉ được tạo khi cần. Mô hình hình học và tài nguyên riêng nằm trong thư mục tài liệu; theme, component và hàm vẽ dùng chung nằm trong `templates/`. Tài liệu mới import bộ hàm chung thay vì sao chép mã vẽ hoặc style.

## Định danh và nguồn

- `YYYY-MM` là tháng tiếp nhận; phân loại `Đề thi`, `Chuyên đề` hoặc `Livestream`. Ngày tiếp nhận đầy đủ vẫn lưu trong manifest.
- `<document-id>` dùng chữ thường, không dấu, nối bằng `-`; chọn tên theo môn, lớp, chủ đề hoặc mã đề để phân biệt tài liệu.
- Dùng cùng tháng, loại và ID ở `sources`, `documents`, `targets`. Nhiều tài liệu trong một tháng dùng ID khác nhau.
- Trang nguồn đặt tên theo số trang thực: `page-01.jpg`, `page-02.jpg`, ... Không suy ra số trang từ thứ tự upload.
- Ảnh bổ sung của cùng tài liệu đưa vào bộ đã có, dù nhận vào ngày khác; cập nhật manifest.
- Bản xuất Google Docs lưu thành `source.docx`; URL và tên gốc nằm trong manifest. Nguồn nội dung và mẫu trình bày là hai vai trò riêng.
- Giữ nguyên nội dung nguồn. Bản xoay/cắt/tăng tương phản phục vụ đọc nguồn, nếu có, lưu riêng.
- Nếu cần giữ nhiều bản PDF, dùng `document-v01.pdf`, `document-v02.pdf` và cập nhật mapping.

Mỗi `manifest.json` lưu ID/ngày, metadata từ nguồn, tên file gốc, đường dẫn ảnh, số trang gốc, SHA-256, trạng thái xử lý và đường dẫn Typst/PDF. Đường dẫn tính từ gốc kho; phân biệt đường dẫn dự kiến với file đã tạo. Ghi điểm thiếu/mờ, kết quả kiểm tra và mapping theo câu/hình tại đây khi cần; không thêm trường rỗng hoặc file ghi chú riêng.

Chuyên đề dùng ID có tiền tố `th-`; đề thi không thêm tiền tố này. Tháng trong đường dẫn là tháng tiếp nhận, độc lập với tháng đích khi xuất bản.

## Manifest và biến thể

Manifest là nơi lưu dữ liệu riêng của từng tài liệu; không đưa danh sách variant hoặc ngoại lệ của từng bộ vào convention chung.

| Thành phần | Ý nghĩa |
|---|---|
| Nguồn và metadata | Danh tính tài liệu, ngày tiếp nhận, tên gốc, đường dẫn, checksum, phạm vi và mapping câu/trang |
| `implementation` | Template và quyết định triển khai |
| `variants` | Các bản xuất thực sự cần; mỗi bản có `filename` và `inputs` |
| `output` / `outputs` | Kết quả build: đường dẫn, số trang, byte, checksum |
| `qa` | Kết quả kiểm tra của đúng bản xuất hiện tại |
| `figure_renders` | Hình cần render trước khi biên dịch; xem [build](build.md) |
| `drive.filenames` | Tên hiển thị của từng PDF trên Drive; xem [xuất bản](publishing.md) |

Các variant dùng chung nội dung Typst, chọn cách xuất qua `sys.inputs`:

| Variant | Nội dung | Tên local thông dụng |
|---|---|---|
| `de` | Đề, không có dòng viết | `de.pdf` |
| `de-cach` | Đề có vùng viết lời giải | `de-cach.pdf` |
| `dap-an` | Đáp án/lời giải trong phạm vi đã thống nhất | `dap-an.pdf` |
| `de-dap-an` | Đề và đáp án chung một file | `de-dap-an.pdf` |

Không bắt buộc tài liệu nào cũng có đủ bốn bản. Nguồn chỉ có đề thì chưa tạo đáp án; không có `variants` thì build xuất `document.pdf`. Quy tắc nội dung nằm trong [math-transcription](../skills/math-transcription/SKILL.md), bố cục từng bản trong [typst-layout](../skills/typst-layout/SKILL.md).

Category chỉ phân loại tài liệu, không quyết định bộ variant. Mọi category dùng cùng quy tắc: khai báo những bản thực sự có; đáp án có thể bổ sung trước hoặc sau đề. Bộ 12 câu Livestream hiện có `de` và `de-cach` vì chưa có nguồn đáp án. Category local vẫn là `Livestream`, tạm định tuyến Drive/Sheet vào `Chuyên đề` qua `publication_category`.

`publication.combine_answers` là flag boolean trong manifest, mặc định `false`. Khi bật, cần có variant `de-dap-an` đã build; Sheet ghi bản gộp thay cho hai dòng riêng. Flag không tự tạo lời giải hoặc ghép PDF chưa được dựng. Nguyễn Khuyến bật flag này. Có `de-cach` thì luôn ghi link bản cách, kể cả khi dùng bản gộp.
