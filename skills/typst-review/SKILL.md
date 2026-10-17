---
name: typst-review
description: "Kiểm tra và xuất bản PDF đề hoặc bài giảng Typst trong phạm vi nguồn đã thống nhất: đối chiếu nội dung, hình vector, bố cục, font, preview và checksum. Dùng khi rà bản xuất hoặc xác nhận hoàn tất tài liệu."
---

# Kiểm tra bản xuất Typst

Đọc README, manifest, nguồn và các thay đổi vừa thực hiện. Kiểm tra theo phạm vi thực tế; ảnh thiếu không được xem là một đề hoàn chỉnh.

Quy tắc vận hành liên quan: [build](../../docs/build.md).

## Ownership

- Phụ trách thao tác build/render, `scripts/build.py` và bản xuất trong `assets/targets/`; cập nhật `output`/`outputs` và `qa` trong manifest.
- Đọc nội dung, hình và template để kiểm tra. Lỗi câu chữ/dữ kiện chuyển về `math-transcription`, lỗi hình học/nét/khung về `typst-figures`, lỗi typography/căn/ngắt trang về `typst-layout`.
- Ownership chỉ chia trách nhiệm thao tác; không yêu cầu tạo agent riêng. Khi sửa lỗi trong cùng phiên, áp dụng phạm vi của skill phụ trách trước khi kiểm tra lại.

Đối chiếu thiết kế theo [typst-layout](../typst-layout/SKILL.md) và màu/nét theo [typst-figures](../typst-figures/SKILL.md); không duy trì thêm một bảng convention trong skill review.

## Nội dung và hình

- Đối chiếu số câu, lựa chọn, số liệu, dấu toán, số mũ/chỉ số, vector, prime, tên điểm và đơn vị với nguồn. PDF chỉ chứa nội dung trong phạm vi và phần bổ sung đã được yêu cầu.
- Xem toàn trang rồi phóng hình: nét thấy/khuất, nhãn, vùng tô/gạch, đối xứng, tiếp tuyến và giao tuyến. Kiểm tra dữ kiện mô hình, và tọa độ vector xuất nếu quan hệ cần xác nhận chính xác.
- Khi đổi style hình, kiểm tra độ dày các cạnh theo theme, phân biệt với hachure; sắc độ mặt và nét đứt vẫn rõ khi nhìn toàn trang. Khi chuyển hàm dùng chung, đối chiếu tọa độ vector và bbox văn bản trước/sau để phát hiện thay đổi ngoài ý muốn.
- Đối chiếu vai trò đường cắt/gấp với bài toán, nét thấy/khuất với hướng nhìn. Kiểm tra tông mặt theo hướng sáng và mapping với hình khai triển. Khi refactor header/footer, kiểm tra toàn bộ chữ và hình trong biên trang, caption/folio căn theo lề; compile thành công chưa xác nhận các lớp `place` nằm đúng chỗ.
- Với nhóm hình, so sánh giới hạn phần hình nhìn thấy theo tiêu chí căn đã chọn. Khung có cùng chiều cao chưa đủ; hình khai triển và khối dựng phải tương ứng.
- Với nhiều hàng phân số, đo khoảng cách từ mẫu số hàng trên đến tử số hàng dưới ở cả hai cột. Kiểm tra hình render để xác nhận nét gạch và chữ không chạm nhau.
- Dùng `pdftotext -layout` hoặc bbox để xác nhận ghi chú nối ngay sau câu hỏi hay nằm ở dòng riêng. Đối chiếu preview để xác nhận kiểu chữ và ngắt dòng có chủ ý.

## Xuất và ghi kết quả

- Chạy lệnh build của repo; kiểm tra số trang và mapping. Header/footer phải đúng nội dung, căn cùng trục và có khoảng trống với thân bài; mã đề/folio giữ đúng vị trí theo kiểu tài liệu. Xem mọi trang bị thay đổi, mở rộng kiểm tra khi lỗi hoặc thay đổi mới có ảnh hưởng khác.
- Khi có nhiều bản, kiểm tra cùng bộ câu, thứ tự và lý thuyết; chỉ bản đáp án có nội dung lời giải, bản có dòng viết có đủ dòng. Kiểm tra số trang riêng, hình xuất theo vai trò nguồn và preview đúng PDF của từng bản. Bản vừa build giữ review `pending` đến khi kiểm tra xong.
- Khi cần xác nhận chất lượng xuất, dùng `pdfinfo`, `pdffonts`, `pdfimages -list` và `pdftotext`: font nhúng, văn bản chọn được, hình vector và nội dung nằm trong biên trang. Compile thành công chỉ xác nhận cú pháp.
- Khi đổi font, kiểm tra dấu tiếng Việt ở đủ kiểu chữ trên bản render và text trích xuất. Font có hình dạng gần mẫu vẫn cần hỗ trợ đúng ký tự; ghi font thay thế và chỉ xác nhận cỡ/font gốc khi có bằng chứng.
- Khi hợp nhất hoặc đổi template, đối chiếu text và preview từ mã mới với bản đã duyệt. Khi người dùng đổi bản chuẩn, cập nhật đường dẫn và QA cho bản đó; khi cần bảo toàn một bản xuất, kiểm tra checksum trước/sau.
- Kiểm tra checksum nguồn để xác nhận file gốc được giữ. Cập nhật đường dẫn thực, số trang, byte và SHA-256 của PDF sau lần build cuối; preview phải thuộc đúng bản PDF đó.
- Ghi riêng việc đã chạy, kiểm tra bằng mắt và điểm còn chưa rõ. Không ghi `passed` cho bước chưa làm hoặc mang kết quả cũ sang bản xuất đã thay đổi.

Đầu ra là PDF đã kiểm tra, manifest phản ánh đúng bản xuất, cùng lỗi còn ảnh hưởng đến phạm vi nếu có. Giữ ghi chú riêng của tài liệu trong manifest; không tạo báo cáo Markdown bổ sung.

Không tạo ảnh preview trang hoặc dùng make preview. Mở PDF trực tiếp khi kiểm tra bố cục; figure_renders là tài nguyên hình của PDF, không phải preview trang.
