---
name: math-transcription
description: Chép đề và bài giảng toán từ ảnh/PDF/DOCX sang nội dung Typst, giữ chính xác câu chữ, công thức, lựa chọn và phạm vi nguồn. Dùng khi nhập tài liệu mới hoặc sửa lỗi nội dung; việc dựng hình và thiết kế trang thuộc các skill khác.
---

# Chép nội dung toán từ nguồn

Đọc README ở gốc repo và manifest của tài liệu để xác định cấu trúc, nguồn và phạm vi đã thống nhất.

## Ownership

- Phụ trách nội dung câu hỏi trong `main.typ` hoặc `content/*.typ`: câu chữ, công thức, số câu, thứ tự lựa chọn, thông tin đề và chỉ dẫn từ nguồn.
- Phụ trách các trường manifest về nguồn, metadata nguồn, mức độ đầy đủ, phạm vi, ghi chú nội dung và mapping câu/trang. Giữ các trường `implementation`, `output` và `qa` của những trách nhiệm khác.
- Nguồn gốc là đầu vào chỉ đọc. Giao dữ kiện và nhãn hình cho `typst-figures`; giao cấu trúc nội dung và ý định xuống dòng cho `typst-layout`.
- Phân biệt nguồn nội dung với ảnh tham khảo thiết kế. Không nhập tiêu đề, hướng dẫn hoặc dữ kiện của mẫu khi người dùng chỉ yêu cầu học cách trình bày; ghi rõ những phần mẫu đã được xác nhận là sai.

## Đọc và nhập nguồn

- Xem từng trang; phóng hoặc crop vùng khó đọc vào thư mục tạm. Giữ file gốc, tên file gốc, số trang thực và checksum trong manifest. Không suy số trang từ thứ tự nhận ảnh.
- Giữ nguyên câu chữ, kể cả cách viết khác thường. Đối chiếu dấu âm, số mũ/chỉ số, vector, prime, góc, khoảng đóng/mở, dấu thập phân, tên điểm và đơn vị.
- Với DOCX, kiểm kê công thức Word, MathType OLE/WMF và hình nhúng; trích text không đủ để đọc các đối tượng này. Khi giải mã MathType, kiểm tra đã đọc hết cấu trúc từng công thức và không có công thức rỗng; đối chiếu dữ liệu OLE với bản WMF xem trước nếu có. Không dùng ảnh công thức thay cho biểu thức Typst.
- Khi cần nhiều bản xuất, dùng chung nội dung và giữ cấu trúc thực tế của nguồn. Theo quy ước bài học của repo, cả `de`, `de-cach`, `dap-an` giữ lý thuyết nếu có; chỉ bản đáp án chứa lời giải nguồn. Giữ số câu bắt đầu lại theo từng nhóm; phân biệt hình của đề/lý thuyết với hình chỉ thuộc lời giải.
- Dùng biểu thức toán Typst có thể chọn/tìm kiếm; phân số, căn và chỉ số phải có cấu trúc toán đúng. Tách nội dung khỏi màu, khoảng cách và hình dạng component.
- Phân biệt chủ ý xuống dòng với dòng tự wrap trong ảnh. Ghi chú nối sau câu hỏi vẫn nằm trong đoạn đó; chỉ dẫn có chủ ý ở dòng riêng dùng tham số tương ứng của component.
- Nội dung thiếu/mờ và phạm vi bản trích nằm trong manifest. Không suy đoán phần thiếu, sửa lỗi nguồn, thêm lời giải, đáp án hay chú thích biên tập vào PDF khi người dùng chưa yêu cầu.
- Với hình, ghi nhận dữ kiện xác định mô hình, nhãn, đường cắt/gấp và nét thấy/khuất. Các độ dài minh họa chưa được đề xác định cần được phân biệt với dữ kiện.

## Đầu ra và kiểm tra

Đầu ra là nội dung Typst đã đối chiếu với nguồn và mapping theo câu/trang, kèm các điểm chưa rõ còn ảnh hưởng đến phạm vi. Build sau khi thay đổi để phát hiện ký hiệu hoặc công thức sai cú pháp. Đối chiếu lại các đoạn vừa sửa trên preview; giao kiểm tra toàn bộ bản xuất cho `typst-review` khi cần hoàn tất tài liệu.

Giữ skill trong một `SKILL.md`; chỉ thêm tài nguyên khi có nhu cầu lặp lại cụ thể.
