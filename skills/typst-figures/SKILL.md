---
name: typst-figures
description: "Vẽ và sửa hình toán vector bằng Typst từ dữ kiện và hình nguồn, gồm mô hình, phép chiếu, giao tuyến và quy ước nét. Dùng khi dựng hình hoặc cập nhật hàm vẽ chung; bố trí hình trên trang thuộc typst-layout."
---

# Dựng hình toán vector

Đọc README, nguồn hình và nội dung câu hỏi liên quan. Dùng palette và quy ước nét sẵn có của repo.

Quy tắc vận hành liên quan: [document-model](../../docs/document-model.md).

## Ownership

- Phụ trách `templates/drawing.typ` cho hàm vẽ chung và `figures/*.typ`/SVG riêng cho mô hình, tọa độ, phép chiếu, đường/mặt, nét gạch, nhãn, khung và giới hạn hình xuất.
- Nhận dữ kiện/nhãn từ nguồn hoặc `math-transcription`. Màu và quy ước chung trong `templates/` do `typst-layout` quản lý.
- Giao hình cùng kích thước khung và giới hạn phần hình thực cho layout. Việc đặt nhóm hình, khoảng cách với văn bản và ngắt trang thuộc layout; sửa hình học hoặc giới hạn nội bộ thuộc skill này.
- Các kiểm tra của skill là kiểm tra cục bộ; `typst-review` quản lý kết quả QA của bản PDF hoàn chỉnh.

## Mô hình và nét

- Xem hình gốc ở mức phóng đủ đọc nhãn, kích thước, đường thấy/khuất, đường cắt/gấp và vùng tô. Phân biệt dữ kiện toán với tỉ lệ minh họa; không thêm số đo suy luận vào hình đầu ra.
- Dùng primitives Typst, CeTZ hoặc SVG vector. Định nghĩa một hệ tọa độ và một phép biến đổi chung cho điểm, cạnh, mặt, giao tuyến và nhãn. Hình khai triển và khối dựng dùng cùng bộ kích thước.
- Import hàm và vai trò nét từ `templates/drawing.typ`, token từ theme. Nét cạnh mặc định 0,8 pt, hachure 0,35 pt; cạnh thấy/gấp/cắt nhất quán độ dày theo vai trò. Màu chọn theo convention phối màu bên dưới, không bắt buộc đỏ. Nét đứt biểu thị khuất/cắt/gấp theo bài toán, không phải trang trí; không làm nét khuất nhạt đến mất tương phản.
- Sắc độ mặt của hình khai triển phải tương ứng với mặt trên khối dựng. Tô trên các mặt có thật; không thêm đường chia mặt hay cạnh để tạo bóng. Vùng tô đặt dưới nét, không làm mất nét khuất hoặc giao tuyến.
- Với mặt phẳng 3D, dùng pháp tuyến và hướng sáng chung để chọn sắc độ của màu mặt; mặt hướng sáng nhạt hơn, mặt khuất sáng đậm hơn. Hướng sáng dùng để tô mặt; hướng nhìn dùng để xác định nét thấy/khuất, không dùng màu thay cho kiểm tra che khuất.
- Trong hình khai triển, nét cắt và nét gấp theo mô tả bài toán/ảnh nguồn. Khi bài yêu cầu cắt theo nét đứt, không gán cùng quy ước cho đường gấp nếu khiến người đọc hiểu là cắt rời các mặt. Với khối 3D, cạnh hiện khi ít nhất một mặt kề hướng về người nhìn; cạnh bị cả hai mặt che khuất dùng nét đứt.
- Với đường tròn chiếu thành ellipse, kiểm tra tâm, trục chính, đường kính và đối xứng theo hướng nhìn. Khi nguồn có đáy đứng cân, dùng hai hàng chiếu bán kính vuông góc để tránh shear làm ellipse nghiêng.
- Đường sinh tạo biên nón phải tiếp tuyến ellipse đáy; tìm điểm tiếp xúc từ mô hình và hướng nhìn thay vì chọn điểm cực trị tùy ý.
- Dựng giao tuyến từ phương trình hình và mặt phẳng. Ví dụ nón có trục x: `y²+z²=(R*x/L)²`, mặt phẳng `z=d` cho `x=sqrt(y²+d²)/(R/L)`, miền `|y|≤sqrt(R²-d²)`. Tham số hóa theo y giúp đường cong trơn gần đỉnh.
- Xác định nét thấy/khuất theo hướng nhìn và pháp tuyến; chia đường tại điểm chuyển. Từng nét gạch phải nằm trong miền cắt. Vẽ vùng tô trước, nét khuất rồi biên thấy; nhãn có khoảng trống và không đè lên cạnh.
- Khung hình phải chứa đủ biên và nhãn. Với các hình cần căn cùng đỉnh/đáy, tính giới hạn phần hình thực; điều chỉnh phép biến đổi toàn hình, giữ tỉ lệ các phương. Không dịch riêng điểm để che lỗi mô hình.
- Nhãn số đo hoặc hướng có nhiều chữ cần chiều rộng đủ để không xuống dòng ngoài ý muốn. Dùng tham số của hàm nhãn chung; kiểm tra không đè đường dóng, nhãn lân cận hoặc mép khung.
- Khi thu nhỏ, đổi một hệ số chung cho toàn bộ tọa độ và đường cong; giữ cỡ nhãn đủ đọc. Nền bao ngoài và khung trang trí thuộc layout, không gắn vào hình. Chỉ tô các mặt/vùng cần phân biệt theo palette đã chọn, giữ nét cắt, gấp và khuất theo nguồn.
- Chỉ comment công thức hoặc quyết định khó suy ra từ mã.

## Hình cho bài toán thực tế

- **Đề thi:** chỉ dựng lại/cải thiện hình có trong đề gốc. Câu gốc không có hình thì không tự vẽ thêm, kể cả bài toán thực tế hoặc hình học; chỉ bổ sung khi người dùng yêu cầu riêng. Áp dụng cả bản đề, đề cách và phần đề trong bản gộp đáp án. Hình riêng của lời giải được xử lý theo phạm vi lời giải đã thống nhất.
- **Chuyên đề/Tinh Hoa và livestream:** câu toán thực tế có thể dựng thêm hình minh họa phù hợp dữ kiện khi cần hỗ trợ hiểu đề. Giữ và cải thiện hình đã có; không thêm số liệu suy ra, đáp án hoặc nhãn số ngoài đề.
- Mỗi câu dùng một hình hoặc một nhóm hình có cùng mục đích, tránh chèn hình trùng lặp. Chuẩn bị khung hình gọn để có thể đặt cạnh câu hỏi bằng grid hai cột theo [typst-layout](../typst-layout/SKILL.md); không mặc định mọi hình đều đứng riêng dưới câu hỏi.

## Phối màu minh họa

- Đề thi mới từ 27/10/2026: ưu tiên tông đỏ theo ảnh `assets/branding/dxt-red-reference.jpg`, cạnh/đường cong `#B00012`, mặt hồng đỏ nhạt, vàng ấm bổ trợ. Quy tắc này ưu tiên hơn màu đường cong xanh mặc định bên dưới; ảnh thực tế giữ nguyên màu. Các tài liệu đã duyệt giữ màu hiện tại khi chưa được yêu cầu đổi.

- Áp dụng chung cho **đề thi, chuyên đề và livestream**, ở mọi variant: màu tô mặt/vùng minh họa pha **25% trắng** qua `figure-fill(color)` trong `templates/drawing.typ`, dùng token `figure-style.fill-white` trong theme. Gọi đúng một lần ở nơi tô (kể cả ellipse, rect và curve), giữ màu đục để vùng chồng không đậm thêm. Không làm nhạt chữ, nét viền, nét khuất, điểm, đường cong đồ thị hoặc chi tiết tối mang vai trò đường biên. Bảng màu dưới là màu gốc trước khi pha trắng; không pha lại màu đã xử lý.
- Khối 3D dùng một tông màu; phân biệt mặt và cạnh bằng sắc độ đậm nhạt cùng tông. Giữ nét khuất đủ tương phản và nét đứt theo hình học. Hình khai triển đi kèm dùng sắc độ tương ứng với các mặt của khối.

- Màu hình độc lập với màu nhận diện heading. Dùng các màu sáng, dịu và hài hòa; đa dạng giữa các hình, tránh dùng xanh dương cho mọi hình. Ưu tiên hai màu chính và một màu nhấn khi cần phân biệt đối tượng; không luân phiên màu tùy tiện giữa các cạnh. Giữ cùng màu cho cùng hình ở mọi variant.
- Các màu đã được duyệt để lựa chọn (không phải ép dùng tất cả):

  | Màu | Mã | Vai trò gợi ý |
  |---|---|---|
  | Salmon Pink | `#FF91A4` | Mặt/vùng chính; thay màu hồng cũ khi áp dụng yêu cầu này |
  | Cinnamon | `#7B3F00` | Mặt khối hoặc nền nâu ấm |
  | Xanh lá tươi gần LX 2566 | `#BFFF36` | Vùng tô sáng; mã ước lượng từ ảnh, không phải mã hãng xác nhận |
  | Cyan | `#55DCE5` | Mặt phụ, đáy, vùng nước |
  | Mint | `#B5E9DE` | Nền nhẹ bổ trợ |
  | Vàng sáng | `#FFD43B` | Vùng nhấn hoặc mặt sàn |
  | Xanh dương / cam | `#0077C8` / `#C45A00` | Cạnh hoặc cặp màu tương phản |
  | Xanh lá đậm | `#17623E` | Viền/đường phụ khi cần tương phản |

- Ví dụ phối: Salmon Pink–cyan, lime–cyan với viền đậm, Cinnamon–mint với nét khuất sáng. Chọn theo vai trò và diện tích: một vùng chủ đạo, vùng phụ nhỏ hơn, nét/nhãn tương phản. Không tăng mọi màu lên neon cùng lúc. Pha trắng theo token chung, giữ khác biệt giữa mặt sáng và mặt tối; vẫn có thể dùng nền nhẹ khi cần tách nét.
- Trên Cinnamon, nét đứt kem `#FFF3D6` nhìn rõ; trên mặt sáng có thể dùng nâu đậm `#482500`. Kiểm tra tương phản ở cả nền tô và nền trắng, không mặc định giảm opacity nét khuất. Giữ nhãn đen ở nơi đọc rõ, dịch nhãn khỏi cạnh thay vì thêm ô nền trắng che hình.
- Đường cong hàm số mặc định xanh dương đậm sáng `#005FE6`, nét 1,5 pt qua `plot-style.curve`; không dùng convention tím cũ. Đường dóng phụ phải phân biệt rõ với đường cong.
- Nền màu ôm miền hình thực; không thêm hình chữ nhật dư chỉ để có background. Vùng nước/đất hay mặt phẳng hỗ trợ phải đúng phạm vi minh họa. Phối màu không được làm mất đường gấp, mũi tên hoặc dữ kiện của nguồn.

## Nhãn và nhóm hình

- Nhãn mặt phẳng, ví dụ `(Oxy)`, đặt trong góc trống của miền mặt phẳng với một cung nhỏ ở góc bao nhãn; không đặt lơ lửng giữa mặt phẳng. Cung chỉ nhận diện mặt phẳng, không ghi số đo góc.

- Giữ mũi tên trên đoạn/đường theo nguồn; đặt nhãn trục, gốc tọa độ và vạch số gần đúng vị trí, không đè đường. Nhãn góc nằm gần đỉnh trong miền góc khi đủ chỗ; các điểm đánh dấu nhất quán.
- Đường xuyên mặt phẳng chia đoạn thấy/khuất tại giao điểm: đoạn bị che dùng nét đứt, đoạn lộ dùng nét liền; không xóa toàn bộ đường nối. Dựng đúng quan hệ đối xứng và vị trí khối nhỏ, không cho các khối chồng nhau khi nguồn tách rời.
- Nhóm khai triển → khối gấp căn tâm ngang theo phần hình thực, kích thước vừa đủ lớn và có khoảng cách; phép chiếu phải cho thấy cấu trúc rõ. Caption hai hình cùng baseline và cách hình đủ thoáng; ảnh minh họa cân kích thước với đồ thị kề bên.

## Đầu ra và kiểm tra

Xuất hàm/component hình vector và thông tin kích thước đủ để layout bố trí. Build và phóng preview để kiểm tra nhãn, nét, đối xứng, tiếp tuyến, miền cắt và quan hệ giữa hình khai triển với khối dựng. Khi quan hệ hình học nhạy với phép chiếu, kiểm tra cả mô hình và tọa độ vector đã xuất; giới hạn khung bằng nhau chưa chứng minh hai hình đã căn nhau.
