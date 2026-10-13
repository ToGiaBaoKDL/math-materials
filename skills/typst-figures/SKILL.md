---
name: typst-figures
description: "Vẽ và sửa hình toán vector bằng Typst từ dữ kiện và hình nguồn, gồm mô hình, phép chiếu, giao tuyến và quy ước nét. Dùng khi dựng hình hoặc cập nhật hàm vẽ chung; bố trí hình trên trang thuộc typst-layout."
---

# Dựng hình toán vector

Đọc README, nguồn hình và nội dung câu hỏi liên quan. Dùng palette và quy ước nét sẵn có của repo.

## Ownership

- Phụ trách `templates/drawing.typ` cho hàm vẽ chung và `figures/*.typ`/SVG riêng cho mô hình, tọa độ, phép chiếu, đường/mặt, nét gạch, nhãn, khung và giới hạn hình xuất.
- Nhận dữ kiện/nhãn từ nguồn hoặc `math-transcription`. Màu và quy ước chung trong `templates/` do `typst-layout` quản lý.
- Giao hình cùng kích thước khung và giới hạn phần hình thực cho layout. Việc đặt nhóm hình, khoảng cách với văn bản và ngắt trang thuộc layout; sửa hình học hoặc giới hạn nội bộ thuộc skill này.
- Các kiểm tra của skill là kiểm tra cục bộ; `typst-review` quản lý kết quả QA của bản PDF hoàn chỉnh.

## Mô hình và nét

- Xem hình gốc ở mức phóng đủ đọc nhãn, kích thước, đường thấy/khuất, đường cắt/gấp và vùng tô. Phân biệt dữ kiện toán với tỉ lệ minh họa; không thêm số đo suy luận vào hình đầu ra.
- Dùng primitives Typst, CeTZ hoặc SVG vector. Định nghĩa một hệ tọa độ và một phép biến đổi chung cho điểm, cạnh, mặt, giao tuyến và nhãn. Hình khai triển và khối dựng dùng cùng bộ kích thước.
- Import hàm và vai trò nét từ `templates/drawing.typ`, sắc độ từ `figure-style` trong theme. Theo mặc định của repo, cạnh thấy/khuất, cắt và gấp dùng chung độ dày và tông đỏ; nét khuất nhạt hơn nét thấy. Đường cắt trên hình khai triển giữ đỏ đậm dù dùng nét đứt, vì nét đứt ở đây biểu thị thao tác cắt. Hachure là nét phụ. Chỉ đổi quy ước khi nguồn hoặc yêu cầu có chủ ý khác.
- Sắc độ mặt của hình khai triển phải tương ứng với mặt trên khối dựng. Tô trên các mặt có thật; không thêm đường chia mặt hay cạnh để tạo bóng. Vùng tô đặt dưới nét, không làm mất nét khuất hoặc giao tuyến.
- Với mặt phẳng 3D, dùng pháp tuyến và hướng sáng chung để chọn tông đỏ; mặt hướng sáng nhạt hơn, mặt khuất sáng đậm hơn. Hướng sáng dùng để tô mặt; hướng nhìn dùng để xác định nét thấy/khuất, không dùng màu thay cho kiểm tra che khuất.
- Trong hình khai triển, nét cắt và nét gấp theo mô tả bài toán/ảnh nguồn. Khi bài yêu cầu cắt theo nét đứt, không gán cùng quy ước cho đường gấp nếu khiến người đọc hiểu là cắt rời các mặt. Với khối 3D, cạnh hiện khi ít nhất một mặt kề hướng về người nhìn; cạnh bị cả hai mặt che khuất dùng nét đứt.
- Với đường tròn chiếu thành ellipse, kiểm tra tâm, trục chính, đường kính và đối xứng theo hướng nhìn. Khi nguồn có đáy đứng cân, dùng hai hàng chiếu bán kính vuông góc để tránh shear làm ellipse nghiêng.
- Đường sinh tạo biên nón phải tiếp tuyến ellipse đáy; tìm điểm tiếp xúc từ mô hình và hướng nhìn thay vì chọn điểm cực trị tùy ý.
- Dựng giao tuyến từ phương trình hình và mặt phẳng. Ví dụ nón có trục x: `y²+z²=(R*x/L)²`, mặt phẳng `z=d` cho `x=sqrt(y²+d²)/(R/L)`, miền `|y|≤sqrt(R²-d²)`. Tham số hóa theo y giúp đường cong trơn gần đỉnh.
- Xác định nét thấy/khuất theo hướng nhìn và pháp tuyến; chia đường tại điểm chuyển. Từng nét gạch phải nằm trong miền cắt. Vẽ vùng tô trước, nét khuất rồi biên thấy; nhãn có khoảng trống và không đè lên cạnh.
- Khung hình phải chứa đủ biên và nhãn. Với các hình cần căn cùng đỉnh/đáy, tính giới hạn phần hình thực; điều chỉnh phép biến đổi toàn hình, giữ tỉ lệ các phương. Không dịch riêng điểm để che lỗi mô hình.
- Nhãn số đo hoặc hướng có nhiều chữ cần chiều rộng đủ để không xuống dòng ngoài ý muốn. Dùng tham số của hàm nhãn chung; kiểm tra không đè đường dóng, nhãn lân cận hoặc mép khung.
- Khi thu nhỏ, đổi một hệ số chung cho toàn bộ tọa độ và đường cong; giữ cỡ nhãn đủ đọc. Nền bao ngoài và khung trang trí thuộc layout, không gắn vào hình. Với phong cách đơn giản, chỉ tô nhẹ các mặt/vùng cần phân biệt, giữ nét cắt, gấp và khuất theo nguồn.
- Chỉ comment công thức hoặc quyết định khó suy ra từ mã.

## Đầu ra và kiểm tra

Xuất hàm/component hình vector và thông tin kích thước đủ để layout bố trí. Build và phóng preview để kiểm tra nhãn, nét, đối xứng, tiếp tuyến, miền cắt và quan hệ giữa hình khai triển với khối dựng. Khi quan hệ hình học nhạy với phép chiếu, kiểm tra cả mô hình và tọa độ vector đã xuất; giới hạn khung bằng nhau chưa chứng minh hai hình đã căn nhau.
