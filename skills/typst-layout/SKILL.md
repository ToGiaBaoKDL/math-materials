---
name: typst-layout
description: "Thiết kế và chỉnh bố cục đề, bài giảng toán bằng Typst: theme, typography, đáp án, bảng, nhóm hình, header/footer và ngắt trang. Dùng khi cải thiện độ dễ đọc hoặc phong cách tài liệu; giữ nguyên nội dung và mô hình hình học."
---

# Thiết kế bố cục tài liệu toán

Đọc README, template và preview hiện có. Áp dụng phong cách của repo và yêu cầu người dùng cho loại tài liệu đang làm.

Chọn phong cách theo yêu cầu mới nhất và mẫu đã duyệt cho từng tài liệu. Đề đơn giản ưu tiên chữ đen, nhãn màu, thông tin đề và header/footer gọn; bài giảng sinh động có thể dùng mảng màu, tab, góc cắt và huy hiệu. Dùng palette và component chung; giữ công thức, hình toán và thứ tự đọc rõ ràng.

## Ownership

- Phụ trách `templates/theme.typ`, `components.typ`, `exam.typ`, `lesson.typ`: palette, font, cấu hình trang, nhịp khoảng cách và component dùng chung. Token nét và sắc độ mặt nằm trong `figure-style`; bộ hàm `templates/drawing.typ` thuộc `typst-figures`.
- Trong `main.typ`, phụ trách cấu trúc trình bày: gọi component, số cột đáp án, đặt/scale nhóm hình và ngắt trang. Nội dung câu hỏi và lựa chọn thuộc `math-transcription`; tọa độ, nét và khung nội bộ của hình thuộc `typst-figures`.
- Phụ trách thông tin template và nguồn tham khảo thiết kế trong `implementation` của manifest. Mapping câu/trang nguồn thuộc transcription; `qa` và `output` thuộc review.
- Khi người dùng thay bản chuẩn, hợp nhất template và cập nhật build/metadata theo bản đã duyệt. Giữ nội dung và mô hình hình học; chỉ duy trì bản song song khi phạm vi công việc yêu cầu.

## Tham khảo và chọn thiết kế

- Khi cần tìm phong cách mới, ưu tiên mẫu công khai của nhà xuất bản hoặc tài liệu THPT có nguồn rõ. Xem trang bài tập và trang nhiều công thức/hình, không chỉ xem bìa.
- Khi có mẫu do người dùng cung cấp, xác định mẫu nào chi phối font, lề, phần đầu, header/footer hoặc hình. Phần nội dung sai trong mẫu không được nhập vào tài liệu; ghi phạm vi áp dụng trong manifest.
- Nhận diện font/cỡ chữ từ ảnh là ước lượng. Đối chiếu hình dạng và chiều rộng chữ; chọn font có thật trong môi trường, kiểm tra tiếng Việt ở đủ kiểu thường/đậm/nghiêng/đậm nghiêng và ghi font thay thế. Căn đều đoạn văn khi mẫu yêu cầu; ô đáp án và header/footer căn riêng theo cấu trúc.
- Rút ra quyết định cụ thể: thứ bậc chữ, chiều rộng cột, khoảng cách công thức, cách tách mục, vị trí hình, tab header và folio. Dựng thiết kế riêng theo palette của repo; không đưa chữ, logo hoặc hình nguồn tham khảo vào đề.
- Trang trí gắn với khối mà nó nhận diện. Căn huy hiệu với nền và kiểm tra khoảng đệm, góc cắt, giới hạn nền; các thành phần footer dùng cùng trục. Điều chỉnh hình dạng và màu để tạo điểm nhấn, tránh đặt họa tiết ở tọa độ trang cố định không liên quan đến nội dung.
- Ghi tài liệu và ứng dụng thực tế vào manifest. Chỉ ghi đã xem trang hình khi thật sự đã xem; giữ mẫu tải về ở thư mục tạm nếu không phục vụ build.
- Mặc định dùng đỏ làm màu nhấn và cạnh hình, đen cho chữ/nhãn và trắng cho nền. Nét khuất cùng tông đỏ nhưng nhạt hơn nét thấy; cấu hình độ đậm qua `figure-style.edge-opacity`. Giữ các tông đỏ đã được duyệt; không tự thêm màu nhấn khác. Độ nhạt/đậm của mặt theo hướng sáng do hình học xác định; theme chỉ cung cấp màu gốc, hướng sáng và khoảng sắc độ.
- Tập trung độ đậm, cỡ chữ, lề, khoảng cách và kích thước header/footer trong theme. Căn caption/folio theo lề của tài liệu; đo nhãn dài để vừa khung. Main chỉ truyền nội dung, dữ kiện và bố trí; số liệu thuộc bài toán giữ ở model.
- Đề cần nhịp đọc gọn; bài giảng có thể dùng thêm khung định nghĩa/ví dụ nếu nội dung đã có. Màu nhấn hỗ trợ phân cấp; nội dung chính giữ tương phản tốt cả khi in đen trắng.

## Công thức và nhịp trang

- Đáp án chọn 1/2/4 cột theo chiều rộng đã đo và thứ tự trong nguồn. Căn nhãn lựa chọn với công thức; giữ khoảng cách ngang và dọc qua token/component chung.
- Công thức inline có thể vượt khung dòng mặc định. Trong ô đáp án, cho Typst tính đầy đủ tử/mẫu và chỉ số bằng `text(top-edge: "bounds", bottom-edge: "bounds")` cho `math.equation`; đo cùng style dùng để vẽ. Chừa khoảng trống giữa giới hạn thực của hai hàng, không chỉ tăng leading của đoạn văn.
- Giữ công thức inline ngắn trong một khối khi việc tách tại dấu toán làm khó đọc; tránh để từ kết thúc câu đứng một mình. Sau khi đổi font/cỡ chữ, đo lại khoảng hở giữa các hàng phân số trên PDF, kể cả khi token khoảng cách chưa đổi.
- Chọn công thức inline/display theo chiều rộng và chiều cao đã đo ở đúng font/cỡ chữ, không dựa vào độ dài mã toán. Với công thức display, truyền nội dung toán thực vào `math.equation(block: true)`; không ghép các box inline để giả lập công thức block. Kiểm tra khoảng hở bằng giới hạn glyph thực. Giữ câu dẫn với công thức theo sau; ngắt chuỗi dài tại các quan hệ hoặc bước biến đổi.
- Bài học nhiều bản dùng chung nội dung và header/footer. Bản có dòng viết dùng nét ngang nhẹ, số dòng theo câu; giữ nhãn và dòng đầu cùng đề bài. Để nội dung tự phân trang, chỉ ép trang khi nguồn hoặc yêu cầu cần tách; tránh trang gần trống do ngắt trước mục mới.
- Giữ cách đặt chỉ dẫn inline hoặc ở dòng riêng theo ý định nguồn. Đổi khoảng cách toàn trang cần kiểm tra lại đoạn có phân số, góc, căn, tích phân và ghi chú đậm nghiêng.
- Nhãn câu rõ, câu hỏi và đáp án được nhóm hợp lý; tránh chữ lẻ, công thức chạm hàng kế và câu hỏi nằm xa hình của nó. Ưu tiên điều chỉnh khoảng trắng, chiều rộng cột và phân trang trước khi thu nhỏ chữ.
- Căn nhóm hình theo giới hạn phần hình thực từ figures: tâm, mép trên/dưới hoặc đường nền tùy nguồn. Scale đồng đều; lỗi khung hoặc phép chiếu được sửa ở figures.
- Header/footer có thể dùng màu đậm, tab nhiều lớp và folio có hình dạng riêng. Giữ chữ gọn, căn hai bên theo cùng trục giữa hoặc baseline và chừa khoảng trống với thân bài, mép giấy.
- Với đề hoặc PDF đọc từng trang, giữ mã đề và số trang trong một cụm có vị trí cố định để tra cứu. Chỉ đổi bên theo trang chẵn/lẻ khi thực sự trình bày tài liệu đóng gáy. Folio theo mapping đã thống nhất; phân biệt số trang nguồn với số trang PDF.

## Đầu ra và kiểm tra

Xuất template và bố cục Typst tái sử dụng, giữ style trong component thay vì vá từng câu. Build/render, xem mọi trang bị ảnh hưởng và phóng các công thức nhiều tầng. Giao kiểm tra nguồn và bản PDF cuối cho `typst-review`; chỉ thêm script hoặc file phụ khi nhu cầu cụ thể đã xuất hiện.

Tham chiếu kỹ thuật: [Typst text edges](https://typst.app/docs/reference/text/text/#parameters-top-edge).
