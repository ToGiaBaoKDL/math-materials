#import "/templates/exam.typ": exam-question, exam-section, exam-end
#import "/templates/writing.typ": writing-space, final-writing-space
#import "../figures.typ": fig
#import "/templates/contacts.typ": contact-links
#let below(name)=block(width:100%,above:3mm,below:3mm,breakable:false,align(center,fig(name)))
#let questions(variant:"de")={
 let base=exam-question.with(question-label-color:black,question-tag:[\[DXT\]],statement-gap:5.5mm,answer-gap:3.5mm,question-gap:6.5mm)
 let q(n,body,answers:(),statements:(),lines:auto,last:false,visual:none,..args)={
  let render()=if visual==none {base(n,body,answers:answers,statements:statements,..args)}else{grid(columns:(1fr,if visual=="tank" {50mm}else{67mm}),gutter:5mm,align:horizon,base(n,body,answers:answers,statements:statements,..args),if visual=="tank" {scale(x:75%,y:75%,reflow:true,fig(visual))}else{fig(visual)})}
  if variant=="de-cach" {context {
   let desired=if lines!=auto {lines}else if statements.len()>0 {10}else if answers.len()>0 {4}else{12}
   let prompt=[#render()]
   let available=210mm - measure(prompt,width:186mm).height - measure(writing-space(0,gap:9mm),width:186mm).height
   let count=calc.min(desired,calc.max(2,calc.floor(available/9mm)))
   block(breakable:false)[#prompt #writing-space(count,gap:9mm)]
   if not last {final-writing-space(gap:9mm)}
   if not last {v(6mm)}
  }}else{block(width:100%,breakable:visual==none,render())}
 }
 exam-section("I",[CÂU TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN.],instruction:[Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.])
 q(1,[Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
 #below("v1")
 Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],answers:([$(-1;0)$.],[$(0;1)$.],[$(1;+infinity)$.],[$(-infinity;0)$.]),columns:4,keep-together:true)
 q(2,[Cho hàm số $y=f(x)$ có bảng biến thiên trên $[-5;7)$ như sau
 #below("v2")
 Mệnh đề nào dưới đây đúng?],answers:([$max_([-5;7)) f(x)=6$.],[$max_([-5;7)) f(x)=9$.],[$min_([-5;7)) f(x)=6$.],[$min_([-5;7)) f(x)=2$.]),columns:2,keep-together:true)
 q(3,[Đường cong sau là đồ thị của hàm số nào trong các hàm số dưới đây],visual:"rational",answers:([$y=(2x-3)/(x-1)$.],[$y=(2x-1)/(x-1)$.],[$y=(x-3)/(x-2)$.],[$y=(2x+3)/(x-1)$.]),columns:2,keep-together:true)
 q(4,[Tiệm cận đứng của đồ thị hàm số $y=(x-1)/(x+2)$ là],answers:([$x=-1$.],[$x=2$.],[$x=1$.],[$x=-2$.]),columns:4)
 q(5,[Cho hàm số $y=a x^3+b x^2+c x+d$ có đồ thị như hình vẽ. Mệnh đề nào sau đây đúng?],visual:"cubic",answers:([$a<0,b>0,c<0,d>0$.],[$a<0,b<0,c<0,d>0$.],[$a>0,b>0,c<0,d>0$.],[$a<0,b<0,c>0,d>0$.]),columns:1,keep-together:true)
 q(6,[Trong không gian với hệ trục tọa độ $O x y z$, cho $arrow(a)=2arrow(j)-arrow(i)-3arrow(k)$. Tọa độ của $arrow(a)$ là],answers:([$(2;-3;-1)$.],[$(2;-1;-3)$.],[$(-3;2;-1)$.],[$(-1;2;-3)$.]),columns:4)
 q(7,[Cho $arrow(a)$ và $arrow(b)$ là hai vectơ cùng hướng và đều khác vectơ $arrow(0)$. Mệnh đề nào sau đây đúng?],answers:([$arrow(a) dot arrow(b)=0$.],[$arrow(a) dot arrow(b)=-1$.],[$arrow(a) dot arrow(b)=abs(arrow(a)) abs(arrow(b))$.],[$arrow(a) dot arrow(b)=-abs(arrow(a)) abs(arrow(b))$.]),columns:4)
 q(8,[Trong không gian $O x y z$, cho điểm $A(1;1;1)$. Tìm tọa độ hình chiếu vuông góc của điểm $A$ trên mặt phẳng $(O x z)$.],answers:([$(1;0;1)$.],[$(0;1;1)$.],[$(1;1;0)$.],[$(0;1;0)$.]),columns:4)
 q(9,[Cho hàm số $y=f(x)$ có đồ thị như hình vẽ dưới đây. Hàm số đã cho đồng biến trên khoảng nào dưới đây?],visual:"oblique",answers:([$(-1;2)$.],[$(0;+infinity)$.],[$(-infinity;1)$.],[$(-1;1)$.]),columns:2,keep-together:true)
 q(10,[Trong không gian $O x y z$, hình chiếu vuông góc của điểm $A(1;2;5)$ lên trục $O x$ có tọa độ là],answers:([$(0;2;0)$.],[$(1;0;0)$.],[$(0;0;5)$.],[$(0;2;5)$.]),columns:4)
 q(11,[Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Đặt $arrow(S A)=arrow(a)$, $arrow(S B)=arrow(b)$, $arrow(S C)=arrow(c)$, $arrow(S D)=arrow(d)$. Khẳng định nào dưới đây là đúng?],answers:([$arrow(a)+arrow(c)=arrow(b)+arrow(d)$.],[$arrow(a)+arrow(b)+arrow(c)+arrow(d)=arrow(0)$.],[$arrow(a)+arrow(d)=arrow(b)+arrow(c)$.],[$arrow(a)+arrow(b)=arrow(c)+arrow(d)$.]),columns:2)
 q(12,[Cho hàm số $f(x)$ có bảng biến thiên như hình vẽ dưới đây.
 #below("v12")
 Giá trị cực tiểu của hàm số đã cho là],answers:([$3$.],[$-1$.],[$4$.],[$-2$.]),columns:4,keep-together:true)
 exam-section("II",[CÂU TRẮC NGHIỆM ĐÚNG/SAI.],instruction:[Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d), ở mỗi câu, thí sinh chọn đúng hoặc sai.])
 q(1,[Nhà máy $A$ chuyên sản xuất một loại sản phẩm cho nhà máy $B$. Hai nhà máy thỏa thuận rằng, hằng tháng $A$ cung cấp cho $B$ số lượng sản phẩm theo đơn đặt hàng của $B$ (tối đa 100 tấn sản phẩm). Nếu số lượng đặt hàng là $x$ tấn sản phẩm thì giá bán cho mỗi tấn sản phẩm được biểu diễn bởi công thức: $P(x)=45-"0,001"x^2$ (triệu đồng). Chi phí để $A$ sản xuất $x$ tấn sản phẩm trong một tháng là $C(x)=100+30x$ triệu đồng (gồm 100 triệu đồng chi phí cố định và 30 triệu đồng cho mỗi tấn sản phẩm).],statements:([Chi phí để $A$ sản xuất 10 tấn sản phẩm trong tháng là 400 triệu đồng.],[Số tiền $A$ thu được khi bán 10 tấn sản phẩm cho $B$ là 600 triệu đồng.],[Lợi nhuận mà $A$ thu được khi bán $x$ tấn sản phẩm $(0≤x≤100)$ cho $B$ được biểu diễn bởi công thức $H(x)=-"0,001"x^3+15x-100$.],[Bên $A$ bán cho $B$ là 70,7 tấn sản phẩm mỗi tháng thì thu được lợi nhuận lớn nhất. (Làm tròn đến hàng phần chục).]))
 q(2,[Trong không gian $O x y z$, cho hai điểm $M,N$ sao cho $arrow(O M)=(2;3;-1)$, $arrow(O N)=(-1;1;1)$.],statements:([Tọa độ của điểm $M,N$ lần lượt là $M(2;3;-1)$, $N(-1;1;1)$.],[Hình chiếu của điểm $M$ trên trục $O y$ có tọa độ là $(-2;3;1)$.],[Gọi $E$ là điểm đối xứng của điểm $M$ qua $N$. Tọa độ của điểm $E$ là $(-4;-1;3)$.],[Tọa độ đỉnh $D(3;2;-2)$ sao cho tứ giác $O M N D$ là hình bình hành.]))
 q(3,[Cho hàm số $y=f(x)=(x^2+4x-1)/(x-1)$ có đồ thị là $(C)$.],statements:([Tập xác định của hàm số $y=f(x)$ là $RR without {1}$.],[Tiệm cận đứng của đồ thị hàm số là đường thẳng có phương trình $y=1$.],[Tâm đối xứng của đồ thị hàm số $y=f(x)$ là điểm $I(1;2)$.],[Phương trình đường tiệm cận xiên của đồ thị hàm số $f(x)$ là $y=2x+5$.]))
 q(4,[Cho hàm số $y=f(x)$ xác định trên $RR$ và có bảng xét dấu của $f'(x)$ như hình vẽ.
 #below("signs")],statements:([Điểm cực tiểu của hàm số đã cho là $x=7$.],[$f(7)$ là giá trị cực đại của hàm số đã cho.],[Hàm số đồng biến trên khoảng $(7;+infinity)$.],[$f(11)>f(7)$.]))
 exam-section("III",[CÂU HỎI TRẮC NGHIỆM TRẢ LỜI NGẮN.],instruction:[Thí sinh trả lời từ câu 1 đến câu 6.])
 q(1,[Cho hàm số $y=(3x-3)/sqrt(x^2-1)$. Gọi $a$ là số đường tiệm cận đứng và $b$ là số đường tiệm cận ngang của đồ thị hàm số đã cho. Giá trị $20a+10b^2$ bằng bao nhiêu?],lines:9)
 q(2,[Ông Nam cần xây dựng một bể nước mưa có thể tích $V=8$ (m³) dạng hình hộp chữ nhật với chiều dài gấp $4/3$ lần chiều rộng, đáy và nắp đổ bê tông, cốt thép; xung quanh xây bằng gạch và xi măng. Biết rằng chi phí trung bình là 990.000 đồng/m² và ở nắp để hở một khoảng hình vuông có diện tích bằng $2/9$ diện tích nắp bể. Chi phí thấp nhất mà ông Nam phải chi trả là bao nhiêu triệu đồng (làm tròn đến hàng đơn vị).],visual:"tank",lines:14)
 q(3,[Cho một tấm bìa hình vuông $A B C D$ cạnh bằng 10 cm. Cắt tấm bìa theo các tam giác cân $A E B$, $B F C$, $C G D$, $D H A$ sau đó gấp các tam giác $A E H$, $B E F$, $C F G$, $D G H$ sao cho bốn đỉnh $A,B,C,D$ trùng nhau tạo thành khối chóp tứ giác đều (tham khảo hình vẽ bên dưới). Khi đó thể tích lớn nhất của khối chóp tứ giác đều tạo thành bằng $(a sqrt(b))/c$ (cm³) với $a,b,c$ là các số nguyên dương. Tính $P=a+b+c$.
 #below("fold")],lines:14)
 q(4,[Trong không gian, cho hình chóp $S.A B C D$ có đáy là hình bình hành tâm $O$ và $M$ là điểm thay đổi trên đoạn $S O$. Tỉ số $(S M)/(S O)$ là bao nhiêu khi $P=M S^2+M A^2+M B^2+M C^2+M D^2$ nhỏ nhất.],lines:10)
 q(5,[Cho hàm số $y=f(x)=(2x^2+26x+18)/(x+13)$ có điểm cực tiểu $x=x_1$ và điểm cực đại bằng $x=x_2$. Tính $P=-2x_1+x_2$.],lines:10)
 q(6,[Cho hàm số $y=(-x^2+a x+b)/(x+c)$ có bảng biến thiên như hình vẽ
 #below("last")
 Tính $a+b+c$.],lines:10,last:true,keep-together:true)
 if variant=="de-cach" {final-writing-space(gap:9mm)}
 exam-end()
 if variant=="de" {v(1fr)}
 block(width:100%,breakable:false,above:3mm,below:0pt)[
  #set text(fill:black,size:12pt,weight:"regular")
  #set par(justify:false,leading:0.5em)
  #move(dy:5mm,block(width:100%)[
   #align(center)[Xem lại video record buổi học tại YouTube Thầy Đỗ Xuân Thắng (\@toanthaythangdxt)]
   #v(1mm)
   #align(center,text(fill:rgb("#B00012"),contact-links(color:rgb("#B00012"))))
  ])
 ]
}
