#import "/templates/exam.typ": exam-question
#import "/templates/exam-lesson.typ": exam-section
#let q=exam-question.with(keep-together:true,question-gap:4.5mm,statement-gap:3mm,question-label-color:rgb("#B00012"),question-tag:none)
#let fig(name,width)=block(width:100%,breakable:false,above:5mm,below:3mm,align(center,image("../figures/"+name,width:width)))
#let questions()=[
#exam-section("I",[TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN],instruction:[Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.])
#q(1,[Trong không gian tọa độ $O x y z$ cho ba điểm $M(1;1;1)$, $N(2;3;4)$, $P(7;7;5)$. Điểm $Q(a;b;c)$ thỏa mãn điều kiện tứ giác $M N P Q$ là hình bình hành. Tính tổng $a+b+c$:],answers:([$13$.],[$9$.],[$10$.],[$12$.]))
#q(2,[In the coordinate space $O x y z$, given the point $M(3;-2;0)$; $N(2;4;1)$. The coordinates of the vector $arrow(M N)$ are:],answers:([$(1;-6;-1)$.],[$(-1;6;1)$.],[$(1;0;6)$.],[$(-1;6;-1)$.]))
#q(3,[Một vật chuyển động thẳng có phương trình vị trí là $S(t)=frac(1,3)t^3-3t^2+5t+2$ với $t≥0$, trong đó $t$ tính bằng giây và $s$ tính bằng mét. Trong khoảng thời gian nào vận tốc của vật tăng?],answers:([$(0;+infinity)$.],[$(1;5)$.],[$(4;+infinity)$.],[$(3;+infinity)$.]))
#q(4,[Cho hàm số $y=f(x)$ có bảng biến thiên như hình vẽ.
#fig("variation.svg",126mm)
Tổng số đường tiệm cận đứng và tiệm cận ngang của đồ thị hàm số đã cho là],answers:([$2$.],[$1$.],[$3$.],[$4$.]))
#q(5,[Cho hàm số $y=f(x)$ liên tục trên tập $RR$ và đồ thị được cho bởi hình bên dưới.
#fig("cubic.svg",65.55mm)
Hàm số đạt cực đại tại điểm],answers:([$x=-1$.],[$x=3$.],[$x=2$.],[$x=0$.]))
#q(6,[Cho hàm số $y=f(x)$ có $f'(x)=(x+2)(x+1)(x^2-1)$. Số điểm cực trị của hàm số $y=f(x)$ là],answers:([$1$.],[$2$.],[$3$.],[$4$.]))
#q(7,[Cho hàm số $y=frac(2x^2-x+2,x-1)$. Đồ thị hàm số có một tiệm cận đứng $x=a$ và một tiệm cận xiên $y=c x+d$. Giá trị của $a+2c-3d$ bằng],answers:([$3$.],[$2$.],[$-1$.],[$5$.]))
#q(8,[Tiệm cận đứng của đồ thị hàm số $y=frac(2x+3,4-x)$ là đường thẳng có phương trình:],answers:([$y=-2$.],[$x=-2$.],[$x=4$.],[$x=frac(1,2)$.]))
#q(9,[Cho hình lập phương $A B C D.A'B'C'D'$ với $O$ là tâm của hình lập phương. Khẳng định nào sau đây là đúng?],answers:([$arrow(A O)=frac(1,3)(arrow(A B)+arrow(A D)+arrow(A A'))$.],[$arrow(A O)=frac(1,2)(arrow(A B)+arrow(A D)+arrow(A A'))$.],[$arrow(A O)=frac(1,4)(arrow(A B)+arrow(A D)+arrow(A A'))$.],[$arrow(A O)=frac(2,3)(arrow(A B)+arrow(A D)+arrow(A A'))$.]),columns:2)
#q(10,[Một loại thuốc được dùng cho một bệnh nhân và nồng độ thuốc trong máu của bệnh nhân được giám sát bởi bác sĩ. Biết rằng nồng độ thuốc trong máu của bệnh nhân sau khi tiêm vào cơ thể trong $t$ giờ được tính theo công thức $g(t)=frac(3t^2+2t+3,t^2+1)$. Sau khi tiêm thuốc mấy giờ thì nồng độ thuốc trong máu của bệnh nhân cao nhất?],keep-together:false,keep-body:false,answers:([$1$.],[$0,5$.],[$3$.],[$2$.]))
#block(width:100%,breakable:false,above:4.5mm)[
#grid(columns:(1fr,57mm),gutter:6mm,align:horizon,
 [#q(11,[Cho hàm số $y=f(x)$ có đồ thị như hình vẽ. Khẳng định nào sau đây đúng?],answers:([Hàm số nghịch biến trên khoảng $(-2;1)$.],[Hàm số đồng biến trên khoảng $(-2;1)$.],[Hàm số nghịch biến trên khoảng $(-infinity;0)$.],[Hàm số đồng biến trên khoảng $(0;1)$.]),columns:1,question-gap:0pt)],
 image("../figures/quartic.svg",width:57mm))
]
#q(12,[The minimum value of the function $f(x)=x^3-7x^2+11x-2$ on the interval $[0;2]$ is equal to:],answers:([$-2$.],[$0$.],[$3$.],[$11$.]))

#exam-section("II",[TRẮC NGHIỆM ĐÚNG – SAI],instruction:[Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chỉ chọn đúng hoặc sai.])
#q(1,[Cho hình lập phương $A B C D.A'B'C'D'$ có cạnh bằng $2a$. Gọi $O$ là tâm của hình vuông $B C C'B'$ và $G$ là trọng tâm tam giác $A D C$.],statements:(
 [Góc giữa hai vectơ $arrow(D A')$ và $arrow(A C)$ bằng $60 degree$.],
 [$arrow(B D')=arrow(B B')+arrow(D A)+arrow(B A)$.],
 [$arrow(G O)=x arrow(A B)+y arrow(A D)+z arrow(A A')$ với $3x+6y+2z=2$.],
 [$arrow(A B') dot arrow(D D')=2a^2 sqrt(2)$.]))
#q(2,[Từ một tấm bìa hình chữ nhật có chiều rộng 30 cm và chiều dài 80 cm, người ta cắt ở bốn góc bốn hình vuông có cạnh $x$ (cm) với $5≤x≤10$ và gấp lại để tạo thành chiếc hộp có dạng hình hộp chữ nhật không nắp như hình. Gọi $V(x)$ là thể tích được biểu diễn theo $x$ của chiếc hộp.
#fig("box-net.svg",162mm)
],keep-together:false,keep-body:false,statements:(
 [Đáy chiếc hộp có kích thước được biểu diễn theo $x$ lần lượt là $80-x$ và $30-x$.],
 [Thể tích chiếc hộp là $V(x)=x(30-2x)(80-2x)$.],
 [Để thể tích khối hộp tạo thành lớn nhất thì diện tích hình vuông bị cắt bỏ ở mỗi góc bằng $44,4$ cm² (làm tròn đến hàng phần mười).],
 [Thể tích lớn nhất của chiếc hộp là $7407$ cm³ (làm tròn đến hàng đơn vị).]))
#q(3,[Cho hàm số $y=x^3-3x^2+1$. Gọi $A,B$ là hai điểm cực trị của đồ thị hàm số và $C(1;4)$.],statements:(
 [Phương trình đường thẳng $A B$ là $y=2x-1$.],
 [Diện tích tam giác $A B C$ là 5 (đơn vị diện tích).],
 [Hàm số đồng biến trên khoảng $(2;+infinity)$.],
 [Hàm số đạt cực đại tại $x=2$.]))
#q(4,[Cho hàm số $y=f(x)=frac(x^2+2x-2,x-1)$ có đồ thị $(C)$. Các mệnh đề sau đúng hay sai?],statements:(
 [Phương trình đường tiệm cận xiên của đồ thị hàm số là $y=a x+b$ với $a-2b=-5$.],
 [Giá trị cực tiểu của hàm số là $y_"CT"=2$.],
 [Giá trị nhỏ nhất của hàm số trên đoạn $[-3;frac(1,2)]$ bằng $-frac(1,4)$.],
 [Hàm số nghịch biến trên khoảng $(0;1)$ và đồng biến trên khoảng $(2;+infinity)$.]))

#exam-section("III",[TRẮC NGHIỆM TRẢ LỜI NGẮN],instruction:[Thí sinh trả lời từ câu 1 đến câu 6.])
#q(1,[Đồ thị trong hình bên dưới là của hàm số $y=frac(a x+b,x+c)$ (với $a,b,c in RR$). Khi đó giá trị của biểu thức $2a+15b-10c$ bằng bao nhiêu?
#fig("rational.svg",68.77mm)
],keep-together:false,keep-body:false)
#q(2,[Một xưởng sản xuất nón có giá bán mỗi chiếc nón là 50 nghìn đồng, hàm chi phí sản xuất cho $x$ chiếc nón là $C(x)=0,01x^2+20x+1000$ (nghìn đồng). Hãy xác định số lượng nón cần sản xuất để xưởng đạt lợi nhuận tối đa.])
#q(3,[Trong không gian với hệ trục tọa độ $O x y z$ và coi mặt phẳng $(O x y)$ song song với mặt đất, một tấm bảng đồng chất có dạng hình vuông $A B C D$ tâm $O'$ được treo nghiêng bởi 4 sợi dây $I A,I B,I C,I D$ gắn cố định tại điểm $I(0;0;9)$ như hình vẽ. Biết điểm $O'(0;0;5)$, $A(-sqrt(2);sqrt(2);5)$, điểm $D(a;b;c)$ với $a>0,c>5$ và góc $angle O'I D$ đạt giá trị lớn nhất. Gọi $arrow(F)_1,arrow(F)_2,arrow(F)_3,arrow(F)_4$ lần lượt là lực căng của dây $I B,I C,I D,I A$, biết $abs(arrow(F)_1)=50$ N và $abs(arrow(F)_2)=45$ N.
#fig("hanging-board.svg",78mm)
Tính khối lượng $m$ (kg) của tấm bảng (làm tròn kết quả đến hàng phần mười) (cho gia tốc trọng trường $g=9,8$ m/s² và trọng lượng của tấm bảng được tính bằng công thức $P=m g$).],keep-together:false,keep-body:false)
#q(4,[Số lượng vi khuẩn trong một môi trường nuôi cấy có thể được mô hình hóa bởi hàm số $N(t)=-0,001t^3+0,1t^2-0,5t+10$, trong đó $t$ là thời gian tính bằng giờ và $N$ là số lượng vi khuẩn tính bằng nghìn con. Tính tốc độ thay đổi số lượng vi khuẩn tại thời điểm 8 giờ theo đơn vị nghìn con/giờ (làm tròn kết quả đến hàng phần mười)?])
#q(5,[Cho đồ thị hàm số $f(x)=frac(3x^2-2x-5,x-2)$ có giao điểm của hai đường tiệm cận là $I(a;b)$. Giá trị của biểu thức $C=2a+3b$ là bao nhiêu?])
#q(6,[Người ta cần thiết kế đoạn một cây cầu cong nối giữa hai điểm $A$ và $B$ trên hai bờ sông sao cho cây cầu này có hình dạng thẩm mỹ và ổn định. Để mô phỏng hình dáng của cây cầu, người ta sử dụng một hàm bậc ba trong hệ tọa độ $O x y$ (đơn vị: feet). Bằng cách đo đạc tại thực địa, ta xác định được đường cong của cây cầu đi qua hai điểm có tọa độ lần lượt là $A(-1200;80)$; $B(1200;60)$ và điểm giữa cây cầu (tại $x=0$) có độ cao là 200 feet. Tiếp tuyến tại điểm giữa cây cầu (tại $x=0$) cắt trục hoành tại điểm có hoành độ là $-1000$ feet (Hình vẽ). Hàm bậc ba mô phỏng đường cong của cây cầu là $y=f(x)$, tính gần đúng giá trị $f(200)$, kết quả làm tròn đến hàng đơn vị.
#fig("bridge.jpeg",93.6mm)
],keep-together:false)
]
