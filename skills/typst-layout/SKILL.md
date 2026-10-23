---
name: typst-layout
description: "Thiết kế và chỉnh bố cục đề, bài giảng toán bằng Typst: theme, typography, đáp án, bảng, nhóm hình, header/footer và ngắt trang. Dùng khi cải thiện độ dễ đọc hoặc phong cách tài liệu; giữ nguyên nội dung và mô hình hình học."
---

# Thiết kế bố cục tài liệu toán

Đọc README, template và preview hiện có. Áp dụng phong cách của repo và yêu cầu người dùng cho loại tài liệu đang làm.

Chọn phong cách theo yêu cầu mới nhất và mẫu đã duyệt cho từng tài liệu. Đề đơn giản ưu tiên chữ đen, nhãn màu, thông tin đề và header/footer gọn; bài giảng sinh động có thể dùng mảng màu, tab, góc cắt và huy hiệu. Dùng palette và component chung; giữ công thức, hình toán và thứ tự đọc rõ ràng.

Quy tắc vận hành liên quan: [document-model](../../docs/document-model.md).

## Ownership

- Phụ trách `templates/theme.typ`, `components.typ`, `exam.typ`, `lesson.typ`, `branding.typ`, `exam-branding.typ`, `writing.typ`: palette, font, cấu hình trang, nhịp khoảng cách và component dùng chung. Token nét và sắc độ mặt nằm trong `figure-style`; bộ hàm `templates/drawing.typ` thuộc `typst-figures`.
- Trong `main.typ`, phụ trách cấu trúc trình bày: gọi component, số cột đáp án, đặt/scale nhóm hình và ngắt trang. Nội dung câu hỏi và lựa chọn thuộc `math-transcription`; tọa độ, nét và khung nội bộ của hình thuộc `typst-figures`.
- Phụ trách thông tin template và nguồn tham khảo thiết kế trong `provenance` của manifest (chỉ quyết định nội dung/nguồn đặc thù; convention thiết kế lưu trong skill/theme). Mapping câu/trang nguồn thuộc transcription; `qa` và `output` thuộc review.
- Khi người dùng thay bản chuẩn, hợp nhất template và cập nhật build/metadata theo bản đã duyệt. Giữ nội dung và mô hình hình học; chỉ duy trì bản song song khi phạm vi công việc yêu cầu.

## Tham khảo và chọn thiết kế

- Khi cần tìm phong cách mới, ưu tiên mẫu công khai của nhà xuất bản hoặc tài liệu THPT có nguồn rõ. Xem trang bài tập và trang nhiều công thức/hình, không chỉ xem bìa.
- Khi có mẫu do người dùng cung cấp, xác định mẫu nào chi phối font, lề, phần đầu, header/footer hoặc hình. Phần nội dung sai trong mẫu không được nhập vào tài liệu; ghi phạm vi áp dụng trong manifest.
- Nhận diện font/cỡ chữ từ ảnh là ước lượng. Đối chiếu hình dạng và chiều rộng chữ; chọn font có thật trong môi trường, kiểm tra tiếng Việt ở đủ kiểu thường/đậm/nghiêng/đậm nghiêng và ghi font thay thế. Căn đều đoạn văn khi mẫu yêu cầu; ô đáp án và header/footer căn riêng theo cấu trúc.
- Rút ra quyết định cụ thể: thứ bậc chữ, chiều rộng cột, khoảng cách công thức, cách tách mục, vị trí hình, tab header và folio. Dựng thiết kế riêng theo palette của repo; không đưa chữ, logo hoặc hình nguồn tham khảo vào đề.
- Trang trí gắn với khối mà nó nhận diện. Căn huy hiệu với nền và kiểm tra khoảng đệm, góc cắt, giới hạn nền; các thành phần footer dùng cùng trục. Điều chỉnh hình dạng và màu để tạo điểm nhấn, tránh đặt họa tiết ở tọa độ trang cố định không liên quan đến nội dung.
- Ghi tài liệu và ứng dụng thực tế vào manifest. Chỉ ghi đã xem trang hình khi thật sự đã xem; giữ mẫu tải về ở thư mục tạm nếu không phục vụ build.
- Tách màu nhận diện trang khỏi màu minh họa. Giữ nhận diện riêng của đề thi và chuyên đề dưới đây; phối màu hình theo [typst-figures](../typst-figures/SKILL.md), không ép mọi hình dùng cạnh đỏ hoặc mặt pastel.
- Tập trung độ đậm, cỡ chữ, lề, khoảng cách và kích thước header/footer trong theme. Căn caption/folio theo lề của tài liệu; đo nhãn dài để vừa khung. Main chỉ truyền nội dung, dữ kiện và bố trí; số liệu thuộc bài toán giữ ở model.
- Đề cần nhịp đọc gọn; bài giảng có thể dùng thêm khung định nghĩa/ví dụ nếu nội dung đã có. Màu nhấn hỗ trợ phân cấp; nội dung chính giữ tương phản tốt cả khi in đen trắng.

Profile Tinh Hoa/Livestream dùng chung template lesson; đề thi dùng exam và mặc định bản gộp. Theo [mô hình tài liệu](../../docs/document-model.md), không suy bộ đầu ra từ category hay sự tồn tại của PDF cũ.

## Convention template hiện hành

Dùng template làm nguồn triển khai, skill làm quy tắc tái sử dụng. Khi thay convention được duyệt, cập nhật cả hai; không lưu lịch sử chỉnh từng mm trong README. Không lấy nội dung trường, năm học, mã đề từ ảnh tham khảo.

### Font và thành phần chung

- Thân chữ Times New Roman, đen, regular; FreeSerif dự phòng ký hiệu thiếu. Toán dùng New Computer Modern Math. Không tăng độ đậm toàn bộ thân bài ngoài yêu cầu.
- Font 9Slide gốc ở `assets/fonts/dxt/`, nạp qua `--font-path assets/fonts`; không làm đậm giả font vốn có nét đậm. Noto Sans dùng cho UI; Arial cho khóa học và tác giả. Kiểm tra font nhúng và dấu tiếng Việt khi đổi font.
- Header bảng nền đỏ đô `#980D2B` theo token `plot-style.table-fill`, chữ trắng đậm; đường chia các ô header phải nhìn rõ (dùng nét trắng tương phản). Ô dữ liệu giữ chữ đen dễ đọc. Ô mã đề/bảng biến thiên dùng nền hồng nhạt và chữ đậm tương phản khi template quy định.
- Bảng biến thiên chia các ô cùng vai trò đều nhau; căn giữa dấu, vô cùng và nội dung theo cả hai chiều. Nhãn lựa chọn và công thức dùng cùng trục bắt đầu. Tên trường trích trong câu hỏi in đậm đen.
- Tăng khoảng cách giữa các câu bằng token riêng, không chỉ tăng leading. Không đặt `set par` giữa nhãn `[DXT]` và câu dẫn làm tách dòng; scope thay đổi quanh cả câu. Phân số inline dùng dạng gọn khi thích hợp, vẫn giữ tử/mẫu rõ và nhịp dòng đều.

### Đề thi

- `templates/exam.typ` và `exam-branding.typ`; A4, lề ngang 12 mm, trên 18 mm, dưới 16 mm. Thân đề và đáp án 13 pt, leading mặc định 1,1 em. Leading theo cấu hình tài liệu; không nhầm mặc định theme với override của bản đã duyệt.
- Cover khung trắng bo góc 3 mm, viền đỏ 1 pt; cột trái/phải 56%/44%. Hai khối tiêu đề Noto Sans bold cùng cỡ, tối đa 14 pt; nếu không vừa, ngắt ở cụm nghĩa rồi chọn cỡ chung vừa cả hai cột. Không ép ngang chữ. Cho phép trái 2 dòng/phải 3 dòng; căn trên để dòng đầu ngang nhau, chữ căn giữa theo chiều ngang. Không cắt vụn tên riêng hoặc năm học.
- Tên đơn vị xanh lá tươi bão hòa `palette.section-green` (`#009B19`), bold và stroke 0,12 pt cùng màu; tên kỳ thi đỏ `#C6001D`, cùng độ đậm. Không pha trắng/giảm opacity. Không hiển thị “ĐỀ CHÍNH THỨC”. Đường kẻ nhạt bên trái cách cụm tên đơn vị 1 mm, không hạ theo chiều cao khối phải.
- Cột phải đệm trái 8 mm. Ba hàng thông tin hai bên cùng cao độ: số trang ↔ môn và lớp gộp thành “Môn: Toán 12”; thời gian ↔ ngày thi nếu có; ghi chú phát đề ↔ mã đề. Không hiển thị hàng Lớp riêng. Ngày thi nằm dưới Môn và trên Mã đề, nhãn “Ngày thi:” in đậm. Cỡ thông tin 12,5 pt, dòng thời gian 12 pt, ghi chú 11,5 pt. Đồng hồ 20 mm, đầy đủ không bị cắt, có khoảng hở với chữ. Họ tên/số báo danh cùng một dòng chia đôi; dưới có đường đỏ nét đứt theo component.
- Họa tiết góc dưới phải dùng `assets/branding/icons/exam-corner.svg`: tam giác đỏ và hai hình bình hành, cắt gọn theo khung bo góc. Không kéo dài họa tiết hoặc để lấn nội dung.
- Tiêu đề phần: chỉ nhãn “PHẦN I/II/III” có nền đỏ nhận diện đề thi, chữ trắng đậm. Tên phần phía sau xanh lá `#009B19`, bold + stroke 0,12 pt; hướng dẫn màu đen. Áp dụng mọi phần và variant. **Xanh lá này cho heading/phần đề thi, không thay convention chuyên đề.**
- Header/footer chữ Noto Sans Regular 11 pt, stroke 0,12 pt cùng màu; nhận diện đỏ đề thi `#C8102E`, icon liên hệ, mã đề nếu có và trang thực. Không dùng dải DXT/logo chuyên đề.
- Câu hỏi được nối qua trang; không bắt buộc nguyên câu trong một trang. `de-dap-an` nối đáp án từ trang mới, dùng chung header/footer và số trang liên tục; không chèn một bộ header/footer đáp án lồng vào. Bản đáp án riêng vẫn có header/footer. Chỉ tạo variant theo phạm vi nguồn/yêu cầu.

### Ma trận và bản đặc tả

- `templates/matrix.typ`, A4 ngang; dùng header/footer và heading bài giảng. Khung xanh ghi “MA TRẬN ĐỀ KIỂM TRA…”, dòng đỏ ghi tên trường; môn/lớp, năm học và thời gian nằm ở subtitle. Không gắn dòng tác giả giảng dạy cho ma trận của trường.
- Giữ cấu trúc nhóm cột và số liệu nguồn, gồm cột Tự luận nếu có. Header bảng nền trắng, chữ đen đậm; ô dữ liệu nền trắng, viền đỏ. Lặp header khi bảng sang trang; giữ mỗi hàng đặc tả nguyên khối nếu vừa trang.
- Các nhóm DT1, DT2, DT3, Tự luận dùng màu theo từng bản gốc (Hướng Hóa: xanh lá/xanh dương/vàng/xám; Triệu Phong: tím/cam/xanh lá); header tên nhóm và Biết/Hiểu/VD dùng cùng màu nền với thân cột tương ứng, không tăng độ đậm màu riêng cho header. Giữ chữ header in đậm.
- Bôi đậm giá trị ở STT, Chương/Chủ đề, các cột Tổng (Biết/Hiểu/VD), Tỉ lệ và toàn bộ ba hàng tổng kết: Tổng số lệnh hỏi, Tổng điểm, Tỉ lệ %. Hàng Tỉ lệ % tô vàng sáng toàn hàng.
- Căn giữa số liệu, căn trái yêu cầu cần đạt; giữ ghi chú cùng trang ma trận khi có thể. Không tự sửa các tổng chưa khớp. Với hai ma trận Hướng Hóa/Triệu Phong hiện tại, bỏ khối chữ ký cuối theo yêu cầu người dùng; không suy rộng việc bỏ chữ ký cho nguồn khác.

### Chuyên đề / bài giảng

- `templates/lesson.typ` và `branding.typ`; thân chữ 14 pt, leading 0,92 em, cách đoạn 3,5 mm; lề ngang 12 mm, trên 24 mm, dưới 22 mm. Dùng token chung cho khoảng cách câu/ý và khung phương pháp.
- `lesson-heading` giữ tên khóa học (ví dụ “KHÓA TINH HOA TOÀN DIỆN”), Arial Bold 20,5 pt, chữ trắng trên xanh. Tiêu đề chính ghi đầy đủ, 9Slide Tieu de dai 25 pt, đỏ `#C00000`; tên dài chọn Tieu de rat dai 01 rồi 02. Nếu phần trong ngoặc thuộc tiêu đề chính như “12 CÂU HỎI…”, giữ cùng vai trò chữ đỏ lớn, không tự hạ thành subtitle hoặc thêm chữ “Chuyên đề”. Subtitle thực dùng 9Slide Noi dung dai 11,5 pt.
- Dòng “Biên soạn và giảng dạy: Thầy Đỗ Xuân Thắng” theo component tác giả, Arial Italic 11 pt. Màu phụ thuộc kiểu heading đã chọn: `plain` đỏ, kiểu có khung đen; không tự đổi kiểu của tài liệu đang dùng.
- Tiêu đề mục dùng huy hiệu lục giác xanh, chữ trắng; tên mục 9Slide 13,5 pt đỏ trên nền trắng, viền/gờ xanh và đuôi nét đứt. Không áp dụng nhãn phần đề thi cho chuyên đề.
- Header/footer DXT dải đỏ `#A80F2D`, chữ trắng, logo gốc `assets/branding/logo-original.png`, số trang `Trang n/N`, nhất quán trên đề/đề cách/đáp án. Header cao 13 mm; tab rộng trên 44 mm, dưới 27 mm; chéo trắng bắt đầu 30 mm. Logo đường kính 11 mm, cách trái 3 mm, căn giữa dọc; tên thầy bắt đầu sau tab 2 mm. Giữ khoảng hở logo với mép và đường chéo, không bóp méo logo.
- Đề bài ngoài khung; phương pháp/công thức ghi nhớ trong khung nền đỏ rất nhạt, viền đủ bốn cạnh. Công thức display dùng component `formula`, tránh cộng dồn khoảng trắng.
- Bản không cách đọc liên tục, không ép một câu/trang. Bản cách thêm dòng viết theo độ dài bài, giữ đề dẫn với vùng viết, không thêm dòng sau lý thuyết. Các bộ hiện hành dùng bước dòng 9 mm qua cấu hình tài liệu; mặc định `writing-style.ruled-gap` vẫn 8 mm, cần truyền đúng override khi áp dụng mẫu 9 mm. Có thể bố trí hai câu ngắn/trang; không để dòng viết chạm footer.

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
