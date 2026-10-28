#import "/templates/exam.typ": exam-question
#import "/templates/exam-lesson.typ": exam-section
#import "../figures.typ": diagram
#let q=exam-question.with(keep-together:true,question-gap:5mm,statement-gap:3.5mm)
#let side(body,fig)=grid(columns:(1fr,62mm),gutter:6mm,align:top,body,align(right,diagram(fig)))
#let baseline-choices(values, columns: 1)=grid(
 columns:(1fr,)*columns,column-gutter:8mm,row-gutter:3mm,
 ..values.enumerate().map(((i,value))=>[
  #set par(justify:false)
  #text(weight:"bold",fill:rgb("#005BBB"))[#("ABCD".at(i)).]#h(2mm)#value
 ]))
#let figq(n,body,fig,answers)=block(width:100%,breakable:false,above:5mm,below:0pt)[
 #grid(columns:(1fr,if ("cubic","decreasing","rational").contains(fig) {62mm}else if fig == "extrema" {76mm}else{72mm}),gutter:6mm,align:horizon,
 q(n,[#body
 #v(4mm)
 #baseline-choices(answers,columns:if ("cubic","decreasing","rational").contains(fig) {2}else{1})],question-gap:0pt),
 align(right,diagram(fig)))
]
#let below(fig)=block(width:100%,above:4mm,below:2mm,align(center,diagram(fig)))
#let questions()=[
#exam-section("I",[TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN],instruction:[Phần I (3,0 điểm). Học sinh trả lời từ câu 1 đến câu 12. Mỗi câu học sinh chỉ chọn một phương án.])
#figq(1,[Cho hàm số $y=f(x)$ liên tục trên $[-1;5]$ và có đồ thị như hình vẽ. Gọi $M$ và $m$ lần lượt là giá trị lớn nhất và nhỏ nhất của hàm số đã cho trên $[-1;5]$. Giá trị của $M-m$ bằng],"extrema",([$1$.],[$4$.],[$6$.],[$5$.]))
#q(2,[Cho hàm số $y=f(x)$ xác định trên đoạn $[-sqrt(3);sqrt(5)]$ và có bảng biến thiên như hình vẽ. Khẳng định nào sau đây là *đúng*?
#below("table-finite")
#v(3mm)
#baseline-choices(([$max_([-sqrt(3);sqrt(5)]) y=2$.],[$min_([-sqrt(3);sqrt(5)]) y=0$.],[$min_([-sqrt(3);sqrt(5)]) y=1$.],[$max_([-sqrt(3);sqrt(5)]) y=2sqrt(5)$.]),columns:2)])
#figq(3,[Cho hàm số $y=f(x)=a x^3+b x^2+c x+d$ có đồ thị như hình vẽ bên. Hàm số đã cho đồng biến trên khoảng nào dưới đây?],"cubic",([$(-infinity;-1)$.],[$(0;+infinity)$.],[$(-2;2)$.],[$(-1;2)$.]))
#figq(4,[Hàm số nào dưới đây có đồ thị như hình vẽ?],"decreasing",([$y=-2x^3+x^2$.],[$y=-x^3+1$.],[$y=-4x^3+1$.],[$y=3x^2+1$.]))
#q(5,[Cho hàm số $y=f(x)$ xác định trên $RR without {1}$, có $lim_(x arrow.r +infinity) f(x)=2$ và $lim_(x arrow.r 1^+) f(x)=+infinity$. Khẳng định nào sau đây là đúng?],answers:([Đồ thị hàm số không có đường tiệm cận ngang.],[Đồ thị hàm số có tiệm cận ngang $x=2$ và tiệm cận đứng $y=1$.],[Đồ thị hàm số có tiệm cận ngang $y=2$ và tiệm cận đứng $x=1$.],[Đồ thị hàm số chỉ có một đường tiệm cận đứng là $x=1$.]),columns:1)
#q(6,[Một vật chuyển động có phương trình $s(t)=3cos t$, trong đó $t$ tính bằng giây và $s(t)$ tính bằng mét. Vận tốc tức thời của vật tại thời điểm $t=1$ giây là],answers:([$-2,52$ m/s.],[$2,52$ m/s.],[$-1,62$ m/s.],[$1,62$ m/s.]))
#figq(7,[Cho hàm số $y=a x^3+3x+d$ $(a;d in RR)$ có đồ thị như hình bên. Mệnh đề nào sau đây đúng?],"signs",([$a>0,d>0$.],[$a<0,d<0$.],[$a>0,d<0$.],[$a<0,d>0$.]))
#q(8,[Cho hàm số $f(x)=x^3-3x$. Tích giữa giá trị lớn nhất và giá trị nhỏ nhất của hàm số trên đoạn $[-2;2]$ bằng],answers:([$-4$.],[$6$.],[$3$.],[$2$.]))
#q(9,[Đồ thị hàm số $y=(x^2-3x+2)/(x+1)$ có bao nhiêu đường tiệm cận?],answers:([$1$.],[$0$.],[$2$.],[$3$.]))
#q(10,[Đường tiệm cận đứng của đồ thị hàm số $y=(2x-1)/(x+1)$ là đường thẳng có phương trình],answers:([$x=-1$.],[$x=1$.],[$y=2$.],[$y=-1$.]))
#figq(11,[Đường cong trong hình bên là đồ thị của hàm số nào dưới đây?],"rational",([$y=(-x-1)/(x-1)$.],[$y=(x+1)/(x-1)$.],[$y=x^4-x^2$.],[$y=x^2$.]))
#q(12,[Cho hàm số $y=f(x)$ có bảng biến thiên như sau. Điểm cực đại của hàm số đã cho là
#below("table-extrema")],answers:([$x=0$.],[$x=2$.],[$x=4$.],[$x=6$.]))
#exam-section("II",[TRẮC NGHIỆM ĐÚNG – SAI],instruction:[Phần II (4,0 điểm). Học sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, học sinh chỉ chọn Đúng hoặc Sai.])
#q(1,[Cho hàm số $y=f(x)$ xác định, liên tục trên $RR$ và có bảng biến thiên như hình bên dưới.
#below("table-tf")],keep-together:false,statements:([Đồ thị hàm số có hai điểm cực trị.],[Hàm số đạt giá trị lớn nhất bằng 20 tại $x=-2$.],[Bất phương trình $f(-2) dot f'(x)>0$ có nghiệm thuộc khoảng $(3;+infinity)$.],[Phương trình $f(x)+7=0$ có tổng các nghiệm nhỏ hơn $-1$.]))
#q(2,[Cho hàm số $y=(x-2)/(x+1)$.],statements:([Hàm số đồng biến trên mỗi khoảng $(-infinity;-1)$ và $(-1;+infinity)$.],[Đồ thị hàm số có đường tiệm cận đứng $x=-1$ và đường tiệm cận ngang $y=1$.],[Đồ thị hàm số cắt trục tung tại điểm $A(0;2)$.],[Trên đoạn $[0;3]$, tổng giá trị lớn nhất và giá trị nhỏ nhất của hàm số bằng $-7/4$.]))
#q(3,[Cho hàm số $y=(x^2-2x+2)/(x-1)$.],statements:([Đồ thị hàm số cắt trục tung tại điểm có tung độ bằng $-2$.],[Hàm số không có điểm cực đại.],[Đồ thị hàm số có đường tiệm cận đứng là $x=1$ và đường tiệm cận xiên là $y=x-1$.],[Khoảng cách từ gốc tọa độ $O(0;0)$ đến đường tiệm cận xiên của đồ thị hàm số bằng 1.]))
#q(4,keep-together:false,keep-body:true,[Một xưởng sản xuất $A$ kí hợp đồng cung cấp cho siêu thị $B$ mỗi tháng là $x$ thùng dầu ăn. Biết siêu thị $B$ tiêu thụ tối đa 130 thùng/tháng. Đơn giá trong hợp đồng được xác định bởi giá trị biểu thức $P(x)=6-0,000075x^2$ (triệu đồng/thùng). Để cung ứng $x$ thùng dầu ăn cho bên $B$, người ta ước tính chi phí tương ứng xưởng $A$ cần bỏ ra mỗi tháng là $C(x)=10+3,55x-0,00025x^2$ (triệu đồng).],statements:([Nếu hợp đồng là 35 thùng/tháng thì chi phí của xưởng $A$ mỗi tháng cho đơn hàng này là 133,94 triệu đồng (làm tròn kết quả đến chữ số thập phân thứ hai).],[Nếu hợp đồng là 35 thùng/tháng thì mỗi tháng bên $B$ phải thanh toán cho xưởng $A$ là 209,91 triệu đồng (làm tròn kết quả đến chữ số thập phân thứ hai).],[Nếu hợp đồng là 40 thùng/tháng thì lợi nhuận mỗi tháng mà xưởng $A$ thu về từ hợp đồng này nhỏ hơn 85 triệu đồng.],[Để lợi nhuận của xưởng $A$ là lớn nhất, xưởng này cần kí được hợp đồng cung cấp cho bên $B$ mỗi tháng $a$ thùng sản phẩm. Khi đó $6a>632$.]))
#exam-section("III",[TRẮC NGHIỆM TRẢ LỜI NGẮN],instruction:[Phần III (3,0 điểm). Học sinh trả lời từ câu 1 đến câu 6.])
#q(1,side([Bạn An dùng đoạn dây kim loại dài 2 m để tạo thành hình $P Q R S T$ (như hình vẽ), trong đó $P Q S T$ là một hình chữ nhật và $Q R S$ là một nửa đường tròn. Gọi diện tích phần hình phẳng được bao bởi hình $P Q R S T$ là $A$ (m²). Biết $T P=S Q=x$ (m) và $P Q=y$ (m). Để diện tích $A$ lớn nhất thì giá trị của $x$ bằng bao nhiêu? (Làm tròn đến chữ số thập phân thứ hai.)],"wire"))
#q(2,[Tại trường *THPT Phan Đình Phùng*, để giảm nhiệt độ trong các phòng học từ nhiệt độ ban đầu là $28 degree C$, một hệ thống điều hòa làm mát được vận hành trong 10 phút. Gọi $T$ (đơn vị $degree C$) là nhiệt độ của phòng sau $t$ phút kể từ thời điểm bật máy được cho bởi công thức $T=-0,008t^3-0,16t+28$ với $t in [0;10]$. Nhiệt độ thấp nhất của phòng trong 10 phút đầu là bao nhiêu độ C?])
#q(3,[Cho hàm số $y=(a x+b)/(x+d)$ (với $a,b,d in RR$) có đồ thị nhận đường thẳng $x=2$ làm tiệm cận đứng và đường thẳng $y=-1$ làm tiệm cận ngang. Biết đồ thị hàm số đi qua điểm $M(1;-3)$. Giá trị của biểu thức $S=a+b+d$ bằng bao nhiêu?])
#q(4,[Đường tiệm cận xiên của đồ thị hàm số $y=(2x^2-x+4)/(x-1)$ là đường thẳng $y=m x+n$. Giá trị của $m dot n$ bằng bao nhiêu?])
#q(5,[Một vật được phóng lên từ mặt đất theo phương thẳng đứng với tốc độ ban đầu là 32,5 m/s (bỏ qua sức cản của không khí), độ cao (tính bằng mét) của vật sau $t$ giây được cho bởi công thức $h(t)=32,5t-4,9t^2$. Vận tốc của vật sau 2 giây bằng bao nhiêu m/s?])
#q(6,[Bác Toàn muốn làm một bể cá hình hộp chữ nhật không nắp có thể tích 2 m³, sao cho tỉ lệ giữa chiều dài đáy bể và chiều cao bể bằng 1,6. Bác cũng quyết định làm thêm một vách kính (cùng loại kính dùng cho mặt xung quanh) chắn ngang bể để khi thả cá có thể nuôi cách ly một số loại (xem hình minh họa). Tham khảo thị trường, bác được biết giá loại kính để làm mặt xung quanh bể là 170 000 đồng/m², giá loại kính để làm đáy bể là 260 000 đồng/m², bỏ qua các mép dán và mối nối. Nếu chi phí mua kính làm bể là nhỏ nhất thì tỉ lệ giữa chiều dài và chiều rộng của đáy bể bằng $m/n$. Tỉ số $m/n$ bằng bao nhiêu? (Làm tròn đến chữ số thập phân thứ hai.)
#block(width:100%,above:7mm,below:3mm,align(center,image("../figures/fish_tank.png",width:85.8mm)))])
]
