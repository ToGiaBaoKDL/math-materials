#import "../layout.typ": math-flow
#let fig(name)=align(center,image("../figures/"+name+".svg",width:90mm))
#let theory-one()=[
*1. Công thức.* Cho hàm số $f$ liên tục trên $[a;b]$, $a<b$. Diện tích hình phẳng giới hạn bởi đồ thị $y=f(x)$, trục hoành và hai đường thẳng $x=a$, $x=b$ là:
$ S=integral_a^b abs(f(x))dif x. $
#fig("theory-signed-area")
Nếu chưa biết cận, giải phương trình $f(x)=0$ và xác định các giao điểm tạo nên miền cần tính. Với toàn bộ miền hữu hạn giữa đồ thị và trục hoành, lấy hai nghiệm ngoài cùng làm cận.

*2. Cách bỏ dấu giá trị tuyệt đối.*

*Bước 1.* Tìm các nghiệm $x_1,…,x_n$ của $f(x)=0$ trong $(a;b)$ và sắp xếp $a=x_0<x_1<…<x_n<x_(n+1)=b$.

*Bước 2.* Chia tích phân tại các nghiệm. Trên mỗi khoảng, $f$ không đổi dấu, nên:
$ S=sum_(i=0)^n abs(integral_(x_i)^(x_(i+1)) f(x)dif x). $
Có thể dựa vào đồ thị để xét dấu: phần trên trục hoành lấy tích phân, phần dưới trục hoành lấy đối của tích phân.

*Bài tập vận dụng*
]
#let theory-two()=[
*1. Công thức.* Cho $f$, $g$ liên tục trên $[a;b]$, $a<b$. Diện tích hình phẳng giới hạn bởi $y=f(x)$, $y=g(x)$ và hai đường thẳng $x=a$, $x=b$ là:
$ S=integral_a^b abs(f(x)-g(x))dif x. $
#fig("theory-two-curves")
Nếu chưa biết cận, giải phương trình $f(x)=g(x)$ để xác định các giao điểm giới hạn miền cần tính.

Ví dụ, hai đồ thị cắt nhau tại ba hoành độ $x_1<x_2<x_3$. Tổng diện tích hai miền giữa chúng là:
$ S=integral_(x_1)^(x_3)abs(f(x)-g(x))dif x. $
#fig("theory-intersections")
*2. Cách bỏ dấu giá trị tuyệt đối.*

*Bước 1.* Giải $f(x)=g(x)$ trên $(a;b)$; sắp xếp các nghiệm $a=x_0<x_1<…<x_n<x_(n+1)=b$.

*Bước 2.* Chia tích phân tại các giao điểm:
$ S=sum_(i=0)^n abs(integral_(x_i)^(x_(i+1))(f(x)-g(x))dif x). $
Trên mỗi khoảng, lấy hàm nằm trên trừ hàm nằm dưới. Có thể dùng hình vẽ để xác định thứ tự hai đồ thị.

*Bài tập vận dụng*
]
