# Xuất bản lên Drive và Google Sheet

[README](../README.md) · [Mô hình tài liệu](document-model.md) · [Build](build.md)

Build, upload và ghi Sheet là ba bước riêng. Build không tự upload; chỉ ghi Sheet sau khi bộ file đã được duyệt và upload đủ. Nên push mã nguồn đã duyệt lên GitHub trước khi ghi Sheet để link code mở đúng nội dung.

## Chọn đích và phạm vi

| Tham số | Ý nghĩa |
|---|---|
| `DRIVE_MONTH=YYYY-MM` | Bắt buộc cho upload và Sheet; chọn folder tháng Drive và khối tháng Sheet, không lọc tháng nguồn local |
| `DATE=YYYY-MM-DD` | Ngày ghi Sheet; độc lập với tháng đích |
| `DOC` | Chọn tài liệu bằng đoạn tên duy nhất hoặc ID đầy đủ; `DOCUMENT` là alias |
| `CATEGORY` | Chọn nhóm `Đề thi`, `Chuyên đề` hoặc `Livestream` |
| `VARIANT` | Chọn một PDF khi upload; vẫn gửi kèm nguồn. Lệnh Sheet không nhận tham số này |
| `REMOTE` | Chỉ dùng cho `upload-rclone`, mặc định `dxt-gdrive` |
| `CREDENTIALS` | File token dùng chung cho upload và Sheet |

Không chọn bộ lọc tài liệu thì xử lý tất cả tài liệu phù hợp. Tháng đích không đổi đường dẫn local hoặc ngày tiếp nhận trong manifest.

| Chế độ | Hành vi |
|---|---|
| Upload `DRY_RUN=1` | In mapping local; không kết nối, kiểm tra hay ghi Drive |
| Sheet `DRY_RUN=1` | Đọc Drive/Sheet để xác minh; không ghi Sheet |

## Đích xuất bản

Folder Drive cha của các tháng có ID `11EmKdVdsShhjyQpzlozlr8bEVDiThA8R`. Trong tháng đích, Drive giữ cấu trúc `<loại>/<document-id>/` như [mô hình local](document-model.md). Script tìm ID folder theo từng cấp, tạo folder còn thiếu; gặp nhiều folder trùng tên cùng cấp thì dừng. Không cố định ID folder tháng trong code.

Sheet mặc định là [sổ tài liệu](https://docs.google.com/spreadsheets/d/1q7giSA18z4UkTomn9xQBqrDgdjssXeUSDj4fTtVYOVs/edit), hai tab `Chuyên đề` và `Đề thi`. Khối tháng có nhãn `Tháng MM-YYYY`; vẫn nhận diện dạng cũ `Tháng MM/YYYY` để tránh tạo trùng.

## Tên file và nguồn

Tên PDF trên Drive được khai báo trong `drive.filenames` của manifest; tên local theo [variant](document-model.md). Các hậu tố hiển thị là ` - ĐỀ.pdf`, ` - ĐỀ CÁCH.pdf`, ` - ĐÁP ÁN.pdf` hoặc ` - ĐỀ + ĐÁP ÁN.pdf`.

Upload luôn kèm `source.*` từ thư mục nguồn tương ứng, kể cả khi chọn một variant; không thêm manifest nguồn. Tên nguồn suy ra từ tên đề, thay hậu tố ` - ĐỀ.pdf` bằng ` - GỐC` và giữ đuôi gốc. Ví dụ:

```text
KHÓA TH - BUỔI 10 - MIN - MAX HÌNH HỌC - ĐỀ.pdf
KHÓA TH - BUỔI 10 - MIN - MAX HÌNH HỌC - GỐC.docx
```

## Upload và cập nhật file

Upload dùng Google Drive API và token OAuth chung với Sheet. So MD5 local/remote trước khi gửi; nếu khác, cập nhật bằng `files.update(fileId=...)` để giữ ID và URL, sau đó xác minh checksum trả về. File chưa có mới dùng `files.create`; tên trùng hoặc khác loại (folder, Google Docs, shortcut) thì dừng. Upload sao chép một chiều với mapping tên: cập nhật file cùng tên, bỏ qua file không đổi, không xóa file khác trên Drive. Upload kiểm tra PDF tồn tại và checksum khớp manifest trước khi chạy; sau khi sửa mã nguồn cần build lại.

```sh
make upload DRIVE_MONTH=2026-10 DOC=buoi-10 DRY_RUN=1
make upload DRIVE_MONTH=2026-10 DOC=buoi-10
make upload DRIVE_MONTH=2026-10 CATEGORY="Chuyên đề"
make upload DRIVE_MONTH=2026-10 DOC=nguyen-khuyen VARIANT=de-dap-an
```

## Xác thực Google dùng chung

Dùng Google Sheets API và Drive API qua `google-api-python-client`, `google-auth-oauthlib`. `uv run` cài dependency khai báo trong script vào môi trường riêng, không cần thay Python của build/upload.

Thiết lập một lần:

1. Trong Google Cloud project của bạn, bật **Google Sheets API** và **Google Drive API**, tạo OAuth client loại **Desktop app**; tải JSON về `.secret/dxt-toan-2027-client.json`.
2. Tài khoản dùng chung cần quyền sửa Sheet và quyền thêm/cập nhật file trong folder Drive đích.
3. Chạy `make drive-auth CLIENT=.secret/dxt-toan-2027-client.json`, chọn `thaythangtoan4@gmail.com` và cấp quyền. Token tự đặt tên theo email đăng nhập, ví dụ `.secret/thaythangtoan4-token.json` với `thaythangtoan4@gmail.com` (Git bỏ qua, quyền file 600). Upload và Sheet mặc định dùng `.secret/thaythangtoan4-token.json`; chọn tài khoản khác bằng `CREDENTIALS=.secret/<tên>-token.json`. Email ngoài Gmail giữ cả tên miền trong tên file để tránh trùng. Có thể truyền `CREDENTIALS` khi đăng nhập để chọn tên riêng. Cả hai tự refresh khi cần; không tự mở trình duyệt đăng nhập.
4. Nếu đã có service account được chia sẻ quyền sửa Sheet và quyền thao tác trên Drive phù hợp, truyền `CREDENTIALS=.secret/dxt-sheets-service-account.json` trực tiếp, không cần `sheets-auth`.

Upload và Sheet dùng cùng tài khoản `thaythangtoan4@gmail.com`, cùng token và cùng bộ scope. Không yêu cầu thêm `drive.readonly` vì `drive` đã bao gồm quyền đọc. Token cũ chỉ có `drive.readonly` cần cấp quyền lại bằng `make drive-auth` trước khi dùng cả hai lệnh. Lệnh `sheets-auth` được giữ tương thích và cũng cấp cùng bộ quyền: `spreadsheets` + `drive`. Không tự mở đăng nhập trong lúc upload/ghi Sheet.

Scope `drive` cần để cập nhật các file cũ được rclone tạo; `drive.file` không cấp quyền chung lên các file đó ([Google: scopes](https://developers.google.com/workspace/drive/api/guides/api-specific-auth)). Không thay đổi quyền chia sẻ file.

## Mapping cột Sheet

| Cột | Dòng đề | Dòng đáp án |
|---|---|---|
| A – Tháng | Dùng ô tháng đã gộp | Chung ô tháng |
| B – Ngày/Tháng/Năm | `DATE`, hiển thị dd/mm/yyyy | Trống |
| C – File gốc thầy gửi | Link `ĐỀ - GỐC` đến file nguồn đã upload | Trống |
| D – Tiêu đề | Tên đề theo convention, bỏ `.pdf`, căn trái | Tên đáp án theo convention, bỏ `.pdf`, căn trái |
| E – Link code tài liệu gốc | Link `Github` đến thư mục mã nguồn trên nhánh `main` của `ToGiaBaoKDL/math-materials` | Trống |
| F – File pdf (ko cách) | Link `ĐỀ - KHÔNG CÁCH` | Link `ĐÁP ÁN` |
| G – File pdf (cách) | Link `ĐỀ - CÁCH` | Trống |
| H – Số trang/File ko cách | Số trang `de.pdf` | Số trang `dap-an.pdf` |
| I – Thù lao | Không ghi | Không ghi |

Khi manifest bật `publication.combine_answers: true`, cần có `de-dap-an` đã build/upload và Sheet dùng một dòng cho bản gộp: tên kết thúc `ĐỀ + ĐÁP ÁN`, cột F ghi link `ĐỀ + ĐÁP ÁN`, cột G ghi đề cách nếu có, cột H là tổng số trang file gộp; không thêm dòng đáp án riêng. Mặc định flag tắt: dùng dòng đề (F đề, G đề cách) và dòng đáp án ngay dưới, theo variant thực sự có; việc có file `de-dap-an` không tự bật chế độ gộp. Nếu chưa có đề không cách, bản cách vẫn được ghi ở G trên dòng đề; chưa có variant nào thì không cập nhật ô tương ứng, giữ link cũ nếu đã có. Chỉ có đáp án thì ghi dòng đáp án riêng và ghép đúng vị trí khi bổ sung đề sau.

Link là chữ có hyperlink, không dùng công thức phụ thuộc locale, không thay quyền chia sẻ file. Số trang lấy từ PDF local đã kiểm tra.

## Cập nhật dòng và khối tháng

- Tìm dòng cũ bằng tiêu đề hoặc link PDF trong đúng khối tháng; chưa có thì dùng dòng trống, không nhân đôi dòng đã tồn tại.
- Ghép cặp theo tên tài liệu bỏ hậu tố ` - ĐỀ`/` - ĐÁP ÁN`; đáp án nằm ngay dưới đề. Nếu đáp án có trước, giữ riêng đến khi thêm đề rồi đưa đề lên trên.
- Cặp đang tách được xếp lại bằng cách di chuyển nguyên dòng, giữ link, định dạng và thù lao; không ghi đè tài liệu khác. Khôi phục ô gộp tháng sau khi sắp dòng.
- Chưa có khối tháng thì tạo 30 dòng bên dưới và sao chép định dạng. Khối đầy thì chèn đúng số dòng còn thiếu ở cuối khối, sao chép định dạng A:I và chiều cao dòng liền trước, mở rộng ô gộp tháng; các tháng phía dưới được đẩy xuống nguyên vẹn.
- Giữ cột thù lao và định dạng hiện có. Gửi toàn bộ cập nhật trong một batch sau khi kiểm tra đủ.

```sh
make sheet DRIVE_MONTH=2026-10 DATE=2026-10-15 DOC=buoi-11 DRY_RUN=1
make sheet DRIVE_MONTH=2026-10 DATE=2026-10-15 DOC=buoi-11
make sheet DRIVE_MONTH=2026-10 DATE=2026-10-15 CATEGORY="Chuyên đề"
```

## Kiểm tra và điều kiện dừng

Trước khi ghi Sheet, script tìm đúng ID folder/file trên Drive và đối chiếu MD5 với file local. Thiếu file hoặc khác nội dung thì dừng, cần upload lại. Folder trùng tên cần được xử lý trước khi tiếp tục; dry run upload không xác minh tình trạng Drive.

Luồng Google API không tự retry thao tác ghi; khi lỗi, chạy lại để tìm file hiện có và so checksum trước khi gửi tiếp. Không tự xóa hoặc tạo lại file sau lỗi. Tránh chạy đồng thời nhiều tiến trình upload cùng đích.

## Rclone trong giai đoạn chuyển tiếp

`make upload-rclone DRIVE_MONTH=2026-10 DOC=buoi-10` chạy `scripts/upload_rclone.py`, dùng chung mapping và kiểm tra local với luồng mới. `REMOTE` chỉ áp dụng lệnh này. Bản cũ vẫn giữ retry: rclone dùng `--tpslimit 3 --tpslimit-burst 1 --retries 3 --low-level-retries 1`; script upload không thêm vòng lặp retry riêng. Ghi Sheet không tự retry.

## Phân chia mã nguồn

- `publishing.py`: chọn tài liệu, kiểm tra PDF và mapping tên; dùng chung cho cả hai uploader và Sheet.
- `google_auth.py`: scope, đăng nhập và refresh token chung.
- `drive.py`: tìm folder/file, cache danh sách con, tạo folder và upload theo checksum.
- `upload.py` / `sheets.py`: điều phối nghiệp vụ riêng; `upload_rclone.py` giữ backend cũ.

## Livestream

Livestream dùng cùng quy tắc variant và xếp dòng như các category khác. Bộ 12 câu hiện có đề và đề cách; không tự tạo đáp án khi nguồn chưa có. Tạm dùng folder Drive và tab Sheet `Chuyên đề`, dù category local là `Livestream`. Bộ lọc `CATEGORY=Livestream` vẫn chọn nhóm local. Khi đổi category local, không tự di chuyển dữ liệu đã có trên Drive/Sheet.
