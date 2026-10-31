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
- Tách màu nhận diện trang khỏi màu minh họa. Dùng nhận diện chuyên đề cho đề thi mới theo convention dưới đây; phối màu hình theo [typst-figures](../typst-figures/SKILL.md), không ép mọi hình dùng cạnh đỏ hoặc mặt pastel.
- Tập trung độ đậm, cỡ chữ, lề, khoảng cách và kích thước header/footer trong theme. Căn caption/folio theo lề của tài liệu; đo nhãn dài để vừa khung. Main chỉ truyền nội dung, dữ kiện và bố trí; số liệu thuộc bài toán giữ ở model.
- Đề cần nhịp đọc gọn; bài giảng có thể dùng thêm khung định nghĩa/ví dụ nếu nội dung đã có. Màu nhấn hỗ trợ phân cấp; nội dung chính giữ tương phản tốt cả khi in đen trắng.

Profile Tinh Hoa/Livestream dùng template lesson; đề thi mới dùng exam-lesson và mặc định bản gộp (profile vẫn là exam). Theo [mô hình tài liệu](../../docs/document-model.md), không suy bộ đầu ra từ category hay sự tồn tại của PDF cũ.

## Convention template hiện hành

Dùng template làm nguồn triển khai, skill làm quy tắc tái sử dụng. Khi thay convention được duyệt, cập nhật cả hai; không lưu lịch sử chỉnh từng mm trong README. Không lấy nội dung trường, năm học, mã đề từ ảnh tham khảo.

### Khoảng viết và bố trí hình — áp dụng cả ba dạng

- Phần lý thuyết bài giảng trình bày tuần tự từ trên xuống: đoạn giải thích rồi hình căn giữa phía dưới, không ép vào grid cạnh chữ. Câu hỏi linh hoạt grid hai cột hoặc hình ngay dưới toàn bộ câu dẫn; tránh ngắt câu dẫn thành hai khối quanh hình.

Áp dụng cho **đề thi, chuyên đề/Tinh Hoa và livestream**, kể cả đề thi xuất thêm bản `de-cach`.

- Với bản cách, đánh giá lượng thao tác cần viết của từng câu trước khi chọn số dòng. Câu nhận biết rất dễ, chỉ chọn đáp án hoặc làm một phép tính nhỏ chỉ chừa ít khoảng trống: giữ tối thiểu khoảng 3 dòng viết. Không cấp khoảng giải dài đồng loạt theo số câu hoặc loại trắc nghiệm.
- Câu nhiều bước, chứng minh hoặc nhiều ý được chừa thêm khoảng theo lời giải dự kiến. Không suy độ khó chỉ từ độ dài câu dẫn hoặc việc có hình. Khi chưa chắc, ước lượng các bước giải cần thiết để chọn khoảng phù hợp.
- Giữ câu hỏi cùng phần đầu vùng viết; cho phép nhiều câu ngắn trên một trang. Ưu tiên đưa câu tiếp theo lên nếu đủ chỗ, với tối thiểu khoảng 3 dòng cho câu dễ. Sau khi phân trang theo số dòng cần thiết, phần cuối trang còn dư trong bản cách phải có dòng viết nối tiếp bằng `final-writing-space`, không để một mảng trắng hoàn toàn. Không dùng `v(1fr)` trống để đẩy HẾT xuống cuối bản cách; dành phần dư cho dòng viết và giữ khoảng an toàn với footer.
- Với câu có hình, linh hoạt dùng grid hai cột: câu hỏi bên trái, hình bên phải; chọn tỉ lệ cột theo độ dài đề và kích thước hình, không bắt buộc chia đôi bằng nhau. Đáp án hoặc các ý dài có thể trải toàn chiều rộng bên dưới.
- Ảnh đặt dưới toàn bộ câu hỏi cần khoảng hở thực khoảng 6–8 mm trước ảnh và 3–5 mm sau ảnh. Chèn khoảng cách ở cấp bố cục ngoài `align` để không bị mất do khoảng cách block lồng nhau; kiểm tra mép ảnh so với dòng chữ cuối.
- Khi đặt hình bên cạnh, giữ toàn bộ câu dẫn liền mạch trong cột chữ, căn đầu cột; không tách nửa câu phía trên và nửa câu vào grid căn giữa gây khoảng hở. Đáp án/ý a–d đặt sát câu dẫn, không căn giữa theo chiều cao hình. Hình căn phải trong cột riêng và dùng khung sát nội dung.
- Ưu tiên đặt cạnh bên cho hình đơn nhỏ, tránh để hình nhỏ đứng riêng ngay dưới câu hỏi tạo khoảng trống lớn. Hình rộng, nhóm nhiều hình hoặc câu có công thức dài vẫn có thể đặt dưới nếu dễ đọc hơn. Giữ nhãn đủ lớn, không ép hình/câu vào cột hẹp hoặc làm sai thứ tự đọc.
- Việc có cần dựng thêm hình hay không theo [typst-figures](../typst-figures/SKILL.md): đề thi không có hình gốc thì không tự thêm hình minh họa.

### Font và thành phần chung

- Thân chữ Times New Roman, đen, regular; FreeSerif dự phòng ký hiệu thiếu. Toán dùng New Computer Modern Math. Không tăng độ đậm toàn bộ thân bài ngoài yêu cầu.
- Font 9Slide gốc ở `assets/fonts/dxt/`, nạp qua `--font-path assets/fonts`; không làm đậm giả font vốn có nét đậm. Noto Sans dùng cho UI; Arial cho khóa học và tác giả. Kiểm tra font nhúng và dấu tiếng Việt khi đổi font.
- Header bảng nền đỏ đô `#980D2B` theo token `plot-style.table-fill`, chữ trắng đậm; đường chia các ô header phải nhìn rõ (dùng nét trắng tương phản). Viền ngoài hàng header (trên, trái ô đầu, phải ô cuối) phải dùng màu viền bảng; chỉ đường chia nội bộ dùng trắng, không dùng stroke trắng cho toàn bộ cạnh header làm mất khung. Ô dữ liệu giữ chữ đen dễ đọc. Ô mã đề/bảng biến thiên dùng nền hồng nhạt và chữ đậm tương phản khi template quy định.
- Bảng biến thiên chia các ô cùng vai trò đều nhau; căn giữa dấu, vô cùng và nội dung theo cả hai chiều. Nhãn lựa chọn và công thức dùng cùng trục bắt đầu. Tên trường trích trong câu hỏi in đậm đen.
- Tăng khoảng cách giữa các câu bằng token riêng, không chỉ tăng leading. Không đặt `set par` giữa nhãn `[DXT]` và câu dẫn làm tách dòng; scope thay đổi quanh cả câu. Phân số inline dùng dạng gọn khi thích hợp, vẫn giữ tử/mẫu rõ và nhịp dòng đều.

### Đề thi

- Từ đề mới nhận ngày 27/10/2026, dùng `templates/exam-lesson.typ`: heading, header và footer tái sử dụng component chuyên đề. Các đề đã duyệt trước đó giữ template cũ đến khi có yêu cầu đổi.
- A4, lề ngang 12 mm, trên 24 mm, dưới 22 mm; thân chữ 13 pt, leading 0,85 em. Đảm bảo nội dung liền mạch, giữ câu và các lựa chọn cùng trang khi vừa; không tạo khoảng trống để mô phỏng ngắt trang nguồn.
- Heading dùng `lesson-heading`: tên trường trong nhãn, tên kỳ thi bên dưới, kèm năm học, môn, thời gian, mã đề. Giữ thông tin đơn vị cấp trên nếu nguồn có. Tiêu đề phần dùng `lesson-section`, huy hiệu I/II/III, không thêm chữ DẠNG.
- Header/footer dùng dải DXT/logo của chuyên đề; footer giữ mã đề và số trang thực. Dùng `exam-lesson-palette`: đỏ `#B00012` ước lượng từ `assets/branding/dxt-red-reference.jpg`. Giữ điểm nhấn xanh lá nguyên bản chuyên đề ở nhãn trường, huy hiệu/viền tiêu đề phần, họa tiết header và dải footer; màu đỏ của hình không thay các điểm nhấn xanh lá này. Không nhập nội dung quảng cáo của ảnh vào đề.
- Các hình mới của đề thi dùng đỏ làm màu chính: cạnh/đồ thị đỏ rõ, mặt đỏ hồng nhạt pha 25% trắng qua `figure-fill`; vàng ấm làm màu phụ khi cần. Chữ và nhãn vẫn đen. Ảnh thực tế giữ màu gốc.
- Giữ họ tên và số báo danh; không chép ghi chú biên tập vào PDF. Bảng đáp án dùng dữ liệu đúng mã đề từ nguồn, không tự tạo lời giải.
- Chữ HẾT nằm cuối trang nội dung, có khoảng an toàn với footer; trong bản cách lấp phần dư bằng dòng viết.

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

- Bản đáp án: giãn dòng lời giải thoáng hơn (leading 0,92 em), giữ khoảng đoạn gọn. Nội dung đọc liên tục; chuỗi biến đổi dài gióng dấu quan hệ và cho phép ngắt trang giữa các hàng. Giữ câu dẫn và toàn bộ lựa chọn trắc nghiệm trong cùng khung/cùng trang khi khối vừa một trang; không tách riêng hàng A–D sang trang kế. Chỉ giữ khối đề, không khóa kèm toàn bộ lời giải hoặc nhiều khối công thức gây khoảng trắng lớn cuối trang.

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

- Nhãn A–D căn theo baseline của công thức, đặc biệt ngang chữ max/min; khoảng xét đặt bên dưới toán tử. Không căn nhãn vào tâm chiều cao toàn công thức có giới hạn dưới.
