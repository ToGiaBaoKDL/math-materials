# Mô hình tài liệu

[README](../README.md) · [Build](build.md) · [Xuất bản](publishing.md)

## Loại tài liệu và kế hoạch xuất bản

`scripts/document_model.py` là nguồn quy tắc chung. `kind` xác định profile; thư mục phân loại trong đường dẫn dùng để tổ chức tài liệu, không tự quyết định format hoặc variant.

| `kind` | Format | Đầu ra mặc định khi đủ nguồn | Drive / Sheet |
|---|---|---|---|
| `tinh-hoa` | `lesson` | `de`, `de-cach`, `dap-an` | Chuyên đề; đề và đề cách cùng dòng, đáp án ngay dưới |
| `livestream` | `lesson` | `de`, `de-cach` | Livestream; một dòng có hai link |
| `matrix` | `matrix` (A4 ngang, nhận diện lesson) | `de` → `ma-tran.pdf` | Drive và Sheet: Ma trận; một bản ma trận và đặc tả, chưa có format notify |
| `exam` | `exam` | `de-dap-an` | Đề thi; một dòng, link bản gộp và tổng số trang |

Build mặc định, upload, Sheet và link tự động của notify cùng dùng `publication_variants`. Notify vẫn độc lập, không tự chạy sau các bước khác.

ID/thư mục ma trận dùng mã kỳ `gk1`, `gk2`, `ck1`, `ck2`, bỏ tên môn `toan` và có hậu tố năm học dạng `26-27` (ví dụ `ma-tran-huong-hoa-12-gk1-26-27`) để phân biệt cùng trường qua các năm.

Ma trận dùng profile `matrix`, lưu trong thư mục `Ma trận`; không giả lập câu hỏi hoặc lời giải (`scope.has_questions = false`, `scope.has_solutions = false`). Chỉ khai báo một recipe `de` cho toàn bộ ma trận và đặc tả.

`scope.has_questions` và `scope.has_solutions` ghi phần nguồn thực sự có. Khi đề thi chưa có lời giải, chỉ xuất bản đề đã có, chưa đặt nhãn bản gộp. Nếu chỉ có đáp án, có thể xuất bản đáp án trước rồi bổ sung đề sau. Không tự tạo lời giải. Nguồn chưa đủ bộ yêu cầu được thể hiện bằng scope; compile thành công không có nghĩa bộ nguồn đã hoàn chỉnh.

`publication.combine_answers` là override boolean tùy chọn: mặc định bật cho `exam`, tắt cho hai loại bài giảng. Bật gộp cần variant `de-dap-an` đã triển khai trong Typst; flag không ghép máy móc hai PDF hoặc tạo nội dung thiếu. Các override phải đi kèm variant phù hợp, không khai báo chỉ để lặp lại mặc định. `publication.category` chỉ dùng khi cần đổi đích xuất bản; không đổi thư mục phân loại local.

## Cấu trúc lưu trữ

```text
assets/sources/YYYY-MM/<category>/<document-id>/source.*
documents/YYYY-MM/<category>/<document-id>/
  manifest.json
  main.typ
  content/       # Khi cần tách nội dung
  figures/       # Mô hình và tài nguyên riêng
assets/targets/YYYY-MM/<category>/<document-id>/*.pdf
```

Thư mục phân loại local gồm `Đề thi`, `Chuyên đề`, `Livestream`, `Ma trận`. Dùng cùng tháng/thư mục phân loại/ID ở ba cây thư mục. Tháng là tháng tiếp nhận, độc lập với `DRIVE_MONTH` khi xuất bản. Giữ ID cũ khi đổi thư mục phân loại; tài liệu chuyên đề mới dùng tiền tố `th-`.

Đề thi dùng ID `<truong>-<lop>-<loai>[-<dot>][-ma-<ma-de>]-<nam-hoc>`.
Loại đề: `kscl` (khảo sát chất lượng), `ktdk` (kiểm tra định kỳ), `gk` (giữa kỳ), `ck` (cuối kỳ).
Học kỳ viết liền với loại: `gk1`, `gk2`, `ck1`, `ck2` (giữa/cuối kỳ 1/2); giữ lần khảo sát `kscl-lan1`, hoặc tháng kiểm tra `ktdk-thang10` để phân biệt các đợt.
Số lần và tháng viết liền trong một block: `lan1`, `lan2`, `thang10`; không dùng `lan-1`, `thang-10`.
Năm học viết gọn ở cuối: `26-27` tương ứng `2026–2027`; metadata và nội dung đề giữ năm đầy đủ.
Giữ số 0 đầu mã đề; nguồn không có mã thì bỏ cả cụm `ma-...`, không tự đặt mã.
Ví dụ: `nguyen-binh-khiem-12-kscl-lan1-ma-0115-26-27`.
Áp dụng cùng ID cho `documents`, `assets/sources`, `assets/targets` và các tham chiếu trong manifest.

ID và tên tài nguyên dùng chữ thường không dấu, nối bằng `-`, không có dấu cách hoặc `#`; giữ tên nguồn gốc trong manifest. Font đổi tên file không đổi family. Nguồn gốc chỉ đọc; bản crop/xoay phục vụ kiểm tra lưu riêng. Ảnh bổ sung vào đúng bộ hiện có dù nhận ngày khác; trang nguồn dùng số trang thực, không suy từ thứ tự upload.

Tài nguyên chung ở `templates/`, `assets/fonts/`, `assets/branding/`; không sao chép theme hoặc hàm hình sang từng tài liệu. `assets/targets/` được Git bỏ qua; chỉ tạo thư mục phụ khi có nội dung.

## Manifest schema 1

`load_manifest` kiểm tra version, kind, ID, ngày, tiêu đề, scope, mapping và tên file trước khi build hoặc xuất bản. Không dùng manifest làm nhật ký chỉnh thiết kế; Git lưu lịch sử, skills/theme lưu convention hiện hành.

| Trường | Nội dung |
|---|---|
| `schema_version` | `1` |
| `id`, `kind`, `received_date`, `status` | Định danh, profile, ngày tiếp nhận và trạng thái xử lý |
| `metadata.title` | Tiêu đề bắt buộc ở một vị trí duy nhất; các metadata nguồn khác ở cùng object |
| `sources` | Đường dẫn nguồn, tên gốc, byte, SHA-256 |
| `scope` | Hai boolean `has_questions`, `has_solutions`; số câu/phạm vi trang nguồn nếu biết |
| `content_mapping` | Danh sách `{id, role, source}`; ID duy nhất, role là source/question/solution/figure; source giữ vị trí và dữ kiện đối chiếu |
| `provenance` | Lỗi/corrections nguồn, bằng chứng đọc công thức, quyết định nội dung và mapping tài nguyên; không chứa lịch sử sửa màu/spacing |
| `variants` | Các recipe Typst khả dụng: tên variant → `{filename, inputs}` |
| `publication` | Chỉ các override cần thiết, như `combine_answers`, `category` |
| `drive` | `folder` phải khớp đích profile/override; `filenames` giữ tên hiển thị hiện có |
| `figure_renders` | Entry/output/input/PPI cho hình render trước khi build |
| `outputs`, `qa` | Kết quả build và kiểm tra của đúng bản xuất |

Đường dẫn trong manifest tính từ gốc repo, riêng entry/output của `figure_renders` tính từ thư mục tài liệu. Mapping không tự thay nội dung: khóa phần/câu trong mã Typst liên kết câu với lời giải; không dùng index mảng phẳng viết tay.

`variants` là recipe khả dụng, không phải danh sách mặc định upload. Các recipe riêng của đề thi được giữ để đối chiếu hoặc build chủ động bằng `VARIANT`; profile chỉ xuất bản gộp. File cũ đã build có thể còn ở targets nhưng không tự được upload vì không thuộc kế hoạch xuất bản. Tên local thông dụng là `de.pdf`, `de-cach.pdf`, `dap-an.pdf`, `de-dap-an.pdf`.

Quy tắc chép nguồn: [math-transcription](../skills/math-transcription/SKILL.md). Quy tắc trình bày: [typst-layout](../skills/typst-layout/SKILL.md).

Đề thi có thể xuất thêm bản có dòng viết khi `publication.include_writing: true`; cần khai báo recipe `de-cach`. Khi chỉ có câu hỏi, bộ xuất là `de` + `de-cach`; khi gộp đáp án, bộ xuất là `de-dap-an` + `de-cach`. Mặc định không bật để các recipe cũ chỉ dành cho kiểm tra không tự được xuất bản. Cấu hình này dùng chung cho build, upload và Sheet.
