#import "/templates/exam.typ": exam-question, exam-section, exam-table, exam-end
#import "../figures.typ": fig as original-fig
#import "/templates/writing.typ": writing-space, final-writing-space
#import "/templates/theme.typ": writing-style, palette
#let questions(variant:"de") = {
 let fig(name) = scale(x:if variant == "de" {92%} else {100%},y:if variant == "de" {92%} else {100%},reflow:true,original-fig(name))
 let base = exam-question.with(keep-body:false,statement-gap:4mm,answer-gap:3.5mm)
 let q(number,body,answers:(),statements:(),..args) = {
  if variant == "de-cach" { context {
   let count=if statements.len()>0 {12} else if answers.len()>0 {6} else {16}
   let prompt = [#base(number,body,answers:answers,statements:statements,..args)]
   let available = 230mm - measure(prompt,width:186mm).height - measure(writing-space(0,gap:9mm),width:186mm).height
   let count = calc.min(count,calc.max(2,calc.floor(available / 9mm)))
   block(breakable:false)[
    #base(number,body,answers:answers,statements:statements,..args)
    #writing-space(count,gap:9mm)
   ]
   final-writing-space(gap:9mm)
   v(6mm)
  }} else {
   base(number,body,answers:answers,statements:statements,..args)
  }
 }
 exam-section("I",[CÂU TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN.],instruction:[Mỗi câu hỏi thí sinh chỉ chọn một phương án.])
 q(1,[Đường thẳng nào dưới đây là tiệm cận đứng của đồ thị hàm số $y=frac(-8x-9,x-3)$?],columns:4,answers:([$x=3$.],[$x=frac(1,3)$.],[$y=-8$.],[$y=8$.]))
 q(2,[Trong không gian $O x y z$, hình chiếu vuông góc của điểm $M(-3;4;-4)$ lên mặt phẳng $(O y z)$ có tọa độ là],columns:4,answers:([$( -3;4;0)$.],[$(-3;0;-4)$.],[$(0;4;0)$.],[$(0;4;-4)$.]))
 q(3,[Một người chia thời lượng (đơn vị: giây) thực hiện các cuộc gọi điện thoại của mình trong một tuần thành sáu nhóm và lập bảng tần số ghép nhóm như sau:
 #block(above:3mm,below:3mm,table(
  columns:(26mm,1fr,1fr,1fr,1fr,1fr,1fr),align:center+horizon,
  inset:5pt,stroke:0.8pt+rgb("#C8102E"),
  table.header(..([Nhóm],[$[0;40)$],[$[40;80)$],[$[80;120)$],[$[120;160)$],[$[160;200)$],[$[200;240)$]).enumerate().map(((i,t)) => table.cell(
   fill:rgb("#980D2B"),
   stroke:(top:0.8pt+rgb("#980D2B"),bottom:0.8pt+rgb("#C8102E"),left:0.8pt+if i==0 {rgb("#980D2B")} else {white},right:0.8pt+if i==6 {rgb("#980D2B")} else {white}),
   text(fill:white,weight:"bold",t)
  ))),
  [Tần số],[6],[11],[8],[8],[5],[2],
 ))
 Tứ phân vị thứ ba $Q_3$ (đơn vị: giây) của mẫu số liệu ghép nhóm trên bằng],columns:4,answers:([$105$.],[$25$.],[$frac(965,8)$.],[$145$.]))
 q(4,[Cho hàm số $y=frac(a x+b,c x+d)$ $(a c != 0, a d-b c != 0)$ có đồ thị như hình vẽ. Đường tiệm cận đứng của đồ thị hàm số đã cho có phương trình là
 #fig("rational")],columns:4,answers:([$x=-frac(4,3)$.],[$x=-frac(5,3)$.],[$y=-frac(4,3)$.],[$x=frac(8,3)$.]))
 q(5,[Cho hàm số $y=f(x)$ có đồ thị như hình vẽ. Đồ thị hàm số đã cho có tiệm cận xiên là
 #fig("oblique")],columns:2,answers:([$y=-x-frac(1,2)$.],[$y=frac(1,2)-x$.],[$x=-frac(1,2)$.],[$y=x+frac(1,2)$.]))
 q(6,[Cho hình lăng trụ $A B C.A' B' C'$ (xem hình vẽ). Phát biểu nào sau đây là đúng?
 #fig("prism")],columns:2,answers:([$arrow(B A)+arrow(A' C')=arrow(A' A)$.],[$arrow(B C)+arrow(A A')=arrow(B C')$.],[$arrow(A B')+arrow(B C)=arrow(C' A)$.],[$arrow(A B)+arrow(C C')=arrow(A C)$.]))
 q(7,[Cho hàm số $y=f(x)$ xác định trên $RR without {-1;1}$, liên tục trên mỗi khoảng xác định và có bảng biến thiên như sau
 #fig("variation")
 Đồ thị hàm số có bao nhiêu đường tiệm cận?],columns:4,answers:([$2$.],[$3$.],[$5$.],[$4$.]))
 q(8,[Giá trị nhỏ nhất của hàm số $f(x)=x^4-6x^2+1$ bằng],columns:4,answers:([$1$.],[$0$.],[$-8$.],[$-10$.]))
 q(9,[Tập nghiệm của phương trình $9 tan x+3 sqrt(3)=0$ là],columns:2,answers:([$S={frac(pi,3)+k pi | k in ZZ}$.],[$S={frac(pi,6)+k pi | k in ZZ}$.],[$S={-frac(pi,3)+k pi | k in ZZ}$.],[$S={-frac(pi,6)+k pi | k in ZZ}$.]))
 q(10,[Cho cấp số cộng $(u_n)$ với $u_1=3$ và công sai $d=7$. Giá trị của $u_4$ bằng],columns:4,answers:([$1029$.],[$24$.],[$17$.],[$346$.]))
 q(11,[Trong mặt phẳng $O x y$, khoảng cách từ điểm $M(-8;-5)$ đến đường thẳng $Delta:4x-3y-383=0$ bằng],columns:4,answers:([$40$.],[$frac(400,sqrt(7))$.],[$80$.],[$79$.]))
 q(12,[Miền nghiệm của bất phương trình $2x-5y+26>0$ là nửa mặt phẳng chứa điểm nào?],columns:4,answers:([$(-6;2)$.],[$(-5;8)$.],[$(-6;3)$.],[$(-7;3)$.]))
 exam-section("II",[CÂU TRẮC NGHIỆM ĐÚNG SAI.],instruction:[Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.])
 q(1,[Từ một miếng bìa hình vuông cạnh bằng $190$ cm, người ta cắt bỏ $4$ phần ở $4$ góc như hình vẽ và giữ lại một mảnh được tô màu (gồm $1$ hình vuông cạnh bằng $x$ cm và $4$ tam giác cân). Tiến hành gấp mảnh còn lại thành một hình chóp tứ giác đều $(H)$.
 #fig("pyramid-net")],statements:(
 [Diện tích đáy của hình chóp $(H)$ bằng $4x$ cm².],
 [Diện tích phần bị cắt bỏ là $S=36100-190x$ cm².],
 [Thể tích của khối chóp $(H)$ là $V=frac(1,3)x^2 sqrt(36100-380x)$ cm³.],
 [Thể tích của khối chóp $(H)$ lớn nhất khi $x=76$ cm.],))
 q(2,[Giả sử công thức $log E="11,7"+"1,5" M$ cho biết mối liên hệ giữa năng lượng $E$ tạo ra (tính theo erg, $1$ erg tương đương $10^(-7)$ jun) với độ lớn $M$ theo thang Richter của một trận động đất.
 #fig("earthquake")],statements:(
 [Nếu năng lượng được tạo ra là $32 dot 10^17$ erg thì trận động đất phải có độ lớn bằng $"4,6"$ độ Richter (làm tròn kết quả đến hàng phần mười).],
 [Trận động đất có độ lớn $4$ độ Richter tạo ra năng lượng bằng $10^"17,7"$ erg.],
 [Trận động đất có độ lớn $8$ độ Richter tạo ra năng lượng gấp $100$ lần so với trận động đất có độ lớn $6$ độ Richter.],
 [Trận động đất Tōhoku (Nhật Bản, 2011) có độ lớn khoảng $"9,0"$ độ Richter và trận động đất Tứ Xuyên (Trung Quốc, 2008) có độ lớn khoảng $"7,9"$ độ Richter. Năng lượng trận động đất Tōhoku giải phóng gấp khoảng $45$ lần năng lượng của trận động đất Tứ Xuyên (làm tròn kết quả đến hàng đơn vị).],))
 q(3,[Cho hình hộp $A B C D.A' B' C' D'$ có $A B=15$, $A D=12$, $A A'=9$, $hat(B A A')=hat(D A A')=90 degree$, $hat(B A D)=120 degree$. Gọi $O$ là tâm của hình bình hành $B C C' B'$ và $G$ là trọng tâm tam giác $A D C$.
 #fig("box")],statements:(
 [$arrow(B D')=arrow(B B')+arrow(B C)+arrow(C D)$.],
 [Nếu $arrow(B D) dot arrow(A' D')=k$ thì $6k+3=327$.],
 [Góc giữa hai vectơ $arrow(D A')$ và $arrow(A C)$ nhỏ hơn $106 degree$.],
 [Độ dài đoạn thẳng $G O$ bằng $sqrt(577)$.],))
 q(4,[Cho hàm số $f(x)=2x^3-12x^2+18x-2$.],statements:(
 [Hàm số đã cho có đạo hàm là $f'(x)=6x^2-24x+18$.],
 [Hàm số đã cho đạt cực đại tại điểm $x=3$.],
 [Hàm số đã cho đồng biến trên khoảng $(4;8)$.],
 [Giá trị nhỏ nhất của hàm số $f(x)$ trên đoạn $[-1;2]$ bằng $-34$.],))
 exam-section("III",[CÂU TRẮC NGHIỆM TRẢ LỜI NGẮN.])
 q(1,[Cho một hình bát giác đều có tám đỉnh $A$, $B$, $C$, $D$, $E$, $F$, $G$, $H$. Người ta gắn ngẫu nhiên vào $8$ đỉnh này $8$ số tự nhiên $8;9;10;11;12;13;14;15$ (mỗi đỉnh gắn một số). Chọn ngẫu nhiên một tam giác có $3$ đỉnh lấy từ $8$ đỉnh của bát giác đã cho. Gọi $P$ là xác suất để thu được một tam giác vuông với $3$ số trên $3$ đỉnh của tam giác đó lập thành một cấp số cộng. Biết $P=frac(m,n)$ ($m$, $n$ là các số tự nhiên, $frac(m,n)$ là phân số tối giản). Tính $7m+15n$.
 #fig("octagon")])
 q(2,[Nhiệt độ bên trong một lò nung gốm được mô hình hóa bằng hàm số $f(x)=x^3+a x^2+b x+c$ (đơn vị: độ C), với $x$ $(1<=x<=10, x in NN)$ là thứ tự lần đo kể từ khi bắt đầu nạp phôi (hai lần đo liên tiếp cách nhau $5$ phút) và $f(x)$ là nhiệt độ đo được ở lần đo thứ $x$. Ở lần đo đầu tiên nhiệt độ lò là $114$ độ C, sau đó giảm dần do phôi nguội được đưa vào và đến lần đo thứ $4$ nhiệt độ xuống thấp nhất, chỉ còn $96$ độ C. Kể từ lần đo thứ $4$ trở đi, bộ đốt hoạt động trở lại nên nhiệt độ tăng dần. Tính nhiệt độ đo được ở lần đo thứ $8$.
 #fig("kiln")])
 q(3,[Trong không gian với hệ trục tọa độ $O x y z$, một đơn vị dài trên các trục tương ứng với $10$ mét trên thực tế. Trên một khu đất bằng phẳng (mặt phẳng $(O x y)$), có hai trạm phát tín hiệu định vị đặt cố định tại $A(6;0;0)$ và $B(-6;0;0)$. Một thiết bị dò tìm $M$ di chuyển trên mặt đất, có bộ thu tín hiệu từ cả hai trạm; theo đó thiết bị chỉ hoạt động ổn định tại các vị trí sao cho tổng khoảng cách từ $M$ đến hai trạm $A$, $B$ luôn bằng $20$ đơn vị (tương ứng $200$ mét trên thực tế). Tại vị trí $C(0;12;3)$ có đặt một trạm chỉ huy. Khoảng cách ngắn nhất từ thiết bị $M$ đến trạm chỉ huy $C$ bằng bao nhiêu mét (làm tròn đến hàng đơn vị).
 #fig("stations")])
 q(4,[Cho hình vẽ bên gồm $4$ tam giác. Người ta chọn $3$ số phân biệt từ tập hợp $S={1;2;dots;28}$ để xếp vào $3$ tam giác ở $3$ góc. Sau đó, tính tổng lập phương của $3$ số đó rồi ghi kết quả vào tam giác còn lại ở giữa. Gọi $M$ là số cách xếp sao cho số ghi ở tam giác giữa là một số chia hết cho $9$. Tính $M-15$.
 #fig("triangles")])
 q(5,[Trên công trường xây dựng, một công nhân muốn tạo ra một dụng cụ để đựng vật liệu lỏng từ một tấm thép hình chữ nhật tâm $O$ có $A B="3,12"$ m, $A D="2,34"$ m. Do tấm thép bị hỏng một phần
 #fig("steel")
 nên người đó cắt bỏ tam giác $O B C$ và hàn hai mép $O B$, $O C$ với nhau để thu được một hình tứ diện $O A B D$ (không có mặt $A B D$). Dụng cụ này sẽ được vùi đất xung quanh sao cho đỉnh $O$ quay xuống và mặt $A B D$ hướng lên trên, khi đựng đầy vật liệu lỏng thì phần không gian trong lòng dụng cụ hoàn toàn bị lấp đầy. Tính thể tích của vật liệu lỏng được đựng đầy trong dụng cụ. (Làm tròn kết quả đến hàng phần mười của đơn vị m³ và xem độ dày của tấm thép không đáng kể).],keep-body:false)
 let last-question = [
 #q(6,[Nếu một doanh nghiệp sản xuất $x$ sản phẩm trong một tháng ($x in NN^*;1<=x<=4500$) thì doanh thu nhận được khi bán hết số sản phẩm đó là $F(x)=-"0,01"x^2+400x$ (nghìn đồng), trong khi chi phí sản xuất bình quân cho mỗi sản phẩm là $G(x)=frac(25000,x)+180$ (nghìn đồng). Giả sử số sản phẩm sản xuất ra luôn được bán hết. Trong một tháng, doanh nghiệp đó cần sản xuất ít nhất bao nhiêu sản phẩm để lợi nhuận thu được lớn hơn $140$ triệu đồng?])
 ]
 if variant == "de" {
  block(height:1fr,breakable:false,above:6mm)[#last-question #v(1fr) #exam-end()]
 } else {
  last-question
  exam-end()
 }
}
