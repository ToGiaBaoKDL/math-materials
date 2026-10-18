#import "/templates/exam.typ": exam-section, exam-table
#import "/templates/theme.typ": exam-palette as palette
#let answer-key() = {
 align(center,text(weight:"bold",fill:palette.primary,size:15pt)[ĐÁP ÁN VÀ LỜI GIẢI THAM KHẢO])
 align(center,text(style:"italic",size:11pt)[Được thực hiện bởi AI & TOANMATH.com])
 exam-section("I",[TRẮC NGHIỆM BỐN PHƯƠNG ÁN LỰA CHỌN.])
 exam-table(columns:12,header:range(1,13).map(n=>[Câu #n]),..("B","C","C","C","D","C","D","A","B","A","A","A").map(x=>[#x]))
 exam-section("II",[CÂU TRẮC NGHIỆM ĐÚNG SAI.])
 exam-table(columns:5,header:([Ý],[Câu 1],[Câu 2],[Câu 3],[Câu 4]),[a)],[Đ],[Đ],[Đ],[Đ],[b)],[Đ],[S],[S],[Đ],[c)],[S],[S],[S],[S],[d)],[S],[Đ],[Đ],[Đ])
 exam-section("III",[CÂU TRẮC NGHIỆM TRẢ LỜI NGẮN.])
 exam-table(columns:6,header:range(1,7).map(n=>[Câu #n]),[2500],[18],[4,33],[15],[0,17],[36])
}
#let mc = (
 "1": [Dựa vào đồ thị, trên khoảng $(-1;1)$ đồ thị đi xuống từ trái sang phải nên hàm số nghịch biến trên khoảng $(-1;1)$. Chọn *B*.],
 "2": [Số hạng thứ 5 của cấp số nhân là $u_5=u_1 q^4=3 dot (-2)^4=48$. Chọn *C*.],
 "3": [Hình chiếu của $M(x;y;z)$ lên $(O y z)$ là $M_1(0;3;-5)$ nên $y=3,z=-5$. Hình chiếu lên $(O x z)$ là $M_2(-2;0;-5)$ nên $x=-2,z=-5$. Vậy $M(-2;3;-5)$. Chọn *C*.],
 "4": [Vì lăng trụ đều nên tam giác $A B C$ đều và $A A' perp (A B C)$.
 $ arrow(A B) dot arrow(A C)=a^2/2, quad arrow(A A') dot arrow(A B)=arrow(A A') dot arrow(A C)=0. $
 Do đó
 $ arrow(A B') dot arrow(A' C)=(arrow(A B)+arrow(A A')) dot (arrow(A C)-arrow(A A'))=a^2/2-9a^2=-17a^2/2. $
 Mặt khác $abs(arrow(A B'))=abs(arrow(A' C))=a sqrt(10)$ nên côsin cần tìm bằng $-17/20$. Chọn *C*.],
 "5": [$log_a(a^2 b)=log_a a^2+log_a b=2+5=7$. Chọn *D*.],
 "6": [Đạo hàm đổi dấu khi qua ba điểm $x=-1,x=0,x=1$; qua $x=2$ đạo hàm không đổi dấu. Hàm số liên tục trên $RR$ nên có 3 điểm cực trị. Chọn *C*.],
 "7": [Thể tích khối chóp $V=1/3 S_(A B C) h=1/3 dot 10 dot 3=10$. Chọn *D*.],
 "8": [Vì $M$ thuộc đoạn $A B$ và $M A=2M B$ nên $arrow(M A)=-2 arrow(M B)$, suy ra
 $ arrow(O M)=(arrow(O A)+2 arrow(O B))/3. $
 Thay tọa độ ta được $M(7/3;-5/3;8/3)$. Chọn *A*.],
 "9": [Để liên tục tại $x=1$, tử số phải bằng 0 tại đó: $a+2-5=0$, suy ra $a=3$.
 $ f(1)=lim_(x->1) (3x^2+2x-5)/(x^2-3x+2)=lim_(x->1) ((x-1)(3x+5))/((x-1)(x-2))=-8. $
 Chọn *B*.],
 "10": [Gọi cạnh hình vuông nhỏ là $x$, $0<x<25/2$. Hộp có chiều cao $x$ và đáy vuông cạnh $25-2x$.
 $ V(x)=x(25-2x)^2, quad V'(x)=(25-2x)(25-6x). $
 Trong miền xét, $V'(x)=0$ khi $x=25/6$; đạo hàm đổi dấu từ dương sang âm. Vậy thể tích lớn nhất khi $x=25/6 "cm"$. Chọn *A*.],
 "11": [Số người thành thạo ít nhất một trong hai thứ tiếng là $31+21-5=47$. Xác suất cần tìm bằng $47/50$. Chọn *A*.],
 "12": [Trong tam giác $A B C$:
 $ A C=sqrt(A B^2+B C^2-2A B dot B C cos 135 degree)=sqrt(10), quad S_(A B C)=1. $
 Kẻ $B H perp A C$ tại $H$, suy ra $B H=2/sqrt(10)$. Vì $S A perp (A B C)$ nên $B H perp (S A C)$, do đó $B H perp S C$.
 Kẻ $B K perp S C$ tại $K$. Khi đó $S C perp (B H K)$ và $H K perp S C$. Góc phẳng nhị diện cần tìm là $angle B K H$.
 Trong tam giác $S B C$: $S B=sqrt(7)$, $B C=2$, $S C=sqrt(15)$,
 $ cos angle B S C=9/sqrt(105), quad sin angle B S C=sqrt(8/35), quad B K=S B sin angle B S C=2 sqrt(2)/sqrt(5). $
 Tam giác $B H K$ vuông tại $H$ cho $sin angle B K H=(B H)/(B K)=1/2$, nên $angle B K H=30 degree$. Chọn *A*.],
)
#let tf = (
 "1": [a) *Đúng.* $f'(x)=-18/(x+2)<0$ với mọi $x>-2$.

 b) *Đúng.* Điều kiện $x+2>0$ tương đương $x>-2$, nên $D=(-2;+infinity)$.

 c) *Sai.* $f(x)>=42$ tương đương $ln(x+2)<=8/3$, hay $-2<x<=e^(8/3)-2 approx 12,39$. Các nghiệm nguyên là $-1,0,1,...,12$: có 14 nghiệm.

 d) *Sai.* $g(x)=90-18 ln(x+2)+3x$, $g'(x)=-18/(x+2)+3=0$ khi $x=4$. So sánh tại hai đầu mút và điểm cực trị:
 $ min_([1;5]) g(x)=g(4)=102-18 ln 6. $],
 "2": [a) *Đúng.* Hộp có $4+6+7=17$ viên, lấy đồng thời 5 viên nên $n(Omega)=C_17^5=6188$.

 b) *Sai.* Biến cố đối là lấy 5 viên không có màu đỏ, chọn từ 11 viên trắng và xanh. Xác suất cần tìm:
 $ P=1-C_11^5/C_17^5=2045/2210 approx 0,925<0,93. $

 c) *Sai.* Xác suất lấy 5 viên đỏ là $C_6^5/C_17^5=6/6188=3/3094$.

 d) *Đúng.* Điều kiện cấp số cộng:
 $ (z-x)+(y-z)=2(x-y) equiv x=y. $
 Vì $x+y+z=5$ và $x,y,z>=1$ nên $(x;y;z)$ là $(1;1;3)$ hoặc $(2;2;1)$.
 $ P=(C_4^1 C_6^1 C_7^3+C_4^2 C_6^2 C_7^1)/C_17^5=(840+630)/6188=105/442. $],
 "3": [a) *Đúng.* Hình chiếu của $A(1;2;12)$ lên $(O x y)$ là $H(1;2;0)$.

 b) *Sai.* Khoảng cách từ $B(10;14;-8)$ đến sàn là $abs(-8)=8 "m"$.

 c) *Sai.* Tam giác $A H M$ vuông tại $H$ cho $H M=sqrt(15^2-12^2)=9 "m"$.

 d) *Đúng.* $M$ nằm trên đường tròn tâm $H$, bán kính 9 trên sàn. Gọi $K(10;14;0)$ là hình chiếu của $B$ lên sàn. Ta có $B K=8$, $H K=sqrt(9^2+12^2)=15$.
 $ M B=sqrt(64+K M^2). $
 Khoảng cách nhỏ nhất khi $M$ trên đoạn $H K$, với $K M=15-9=6$. Vậy $M B_min=sqrt(64+36)=10 "m"$.],
 "4": [a) *Đúng.* Khoảng biến thiên $R=210-60=150$ phút.

 b) *Đúng.* Cỡ mẫu $n=35$;
 $ Q_1=90+((35/4-6)/6) dot 30=103,75, $
 $ Q_3=150+((3 dot 35/4-23)/6) dot 30=166,25. $
 Khoảng tứ phân vị $Delta_Q=Q_3-Q_1=62,5$ phút.

 c) *Sai.* Với các giá trị đại diện $75;105;135;165;195$, độ lệch chuẩn $s_A approx 33,72<s_B=45$. Nhóm $A$ có thời gian tự học đồng đều hơn.

 d) *Đúng.* Có 6 học sinh tự học từ 180 phút trở lên (2 thuộc $A$, 4 thuộc $B$), và 29 học sinh còn lại (17 thuộc $A$, 12 thuộc $B$).
 Số cách chọn đúng 2 học sinh từ nhóm 6 và có cả hai nhóm là
 $ C_6^2 C_29^2-C_2^2 C_17^2-C_4^2 C_12^2=5558. $
 Xác suất $P=5558/C_35^4=5558/52360$.],
)
#let short = (
 "1": [Gọi $M(x;y;z)$ là vị trí sau $120 "s"$. Từ các khoảng cách:
 $ cases((x-3)^2+(y-2)^2+(z-1)^2=1, (x-2)^2+(y-6)^2+(z-4)^2=25, (x-4)^2+(y-5)^2+(z-7)^2=49, (x-6)^2+(y-4)^2+(z-5)^2=36). $
 Trừ từng phương trình để khử các số hạng bình phương:
 $ cases(x-4y-3z=-9, x+3y+6z=14, 3x+2y+4z=14) equiv cases(x=2,y=2,z=1). $
 Do đó $O M=sqrt(2^2+2^2+1^2)=3$ đơn vị, bằng $300000 "m"$.
 $ v=300000/120=2500 "m/s". $
 Đáp số: *2500*.],
 "2": [Gọi $O$ là tâm tam giác đều $A B C$, $M$ là trung điểm $B C$. Vì $A' A=A' B=A' C=4$ nên $A' O perp (A B C)$.
 Ta có $B C perp A M$ và $B C perp A' O$, nên $B C perp (A' A M)$. Mặt phẳng $(B C C' B')$ chứa $B C$ và song song $A A'$, vì vậy góc giữa hai mặt phẳng bằng $angle A' A O=60 degree$.
 Trong tam giác vuông $A' A O$:
 $ O A=4 cos 60 degree=2, quad A' O=4 sin 60 degree=2 sqrt(3). $
 $ A B=O A sqrt(3)=2 sqrt(3), quad S_(A B C)=((2 sqrt(3))^2 sqrt(3))/4=3 sqrt(3). $
 Thể tích $V=S_(A B C) A' O=18$. Đáp số: *18*.],
 "3": [Chọn $B(0;0;0)$, các tia tọa độ lần lượt trùng $B A,B C,B B'$. Khi đó $A'(3;0;4)$, $D(3;4;0)$, $C'(0;4;4)$, $C(0;4;0)$.
 Kiến 2 đi theo $D C'=5 "m"$, rồi xuống $C' C$. Khi cách tổ $1 "m"$, nó ở $M_2(0;4;1)$, đã đi $8 "m"$.
 $ t=8/(0,06)=400/3 "s", quad s_1=0,02 dot 400/3=8/3 "m". $
 Vì $A' B=5>8/3$, kiến 1 vẫn trên $A' B$, với $B M_1=7/3$. Từ $arrow(B M_1)=7/15 arrow(B A')$ suy ra $M_1(7/5;0;28/15)$.
 $ M_1 M_2=sqrt((7/5)^2+4^2+(28/15-1)^2)=sqrt(4210)/15 approx 4,33 "m". $
 Đáp số: *4,33*.],
 "4": [Gọi $x,y$ (tấn) lần lượt là lượng gỗ keo và bạch đàn mua mỗi tháng. Điều kiện:
 $ cases(0<=x<=9,0<=y<=10,200x+300y>=2800,300x+150y>=2400) equiv cases(0<=x<=9,0<=y<=10,2x+3y>=28,2x+y>=16). $
 Chi phí $F(x;y)=1,2x+1,5y$ (triệu đồng). Miền nghiệm là tứ giác có các đỉnh $(5;6),(9;10/3),(9;10),(3;10)$.
 Giá trị chi phí tại các đỉnh lần lượt là $15;15,8;25,8;18,6$.
 Vậy chi phí nhỏ nhất là *15 triệu đồng*.],
 "5": [Đặt $A M=x,C N=y$, $0<x,y<1$. Tính chất hai tiếp tuyến cho $M P=M A=x$, $N P=N C=y$, nên $M N=x+y$.
 Tam giác $B M N$ vuông tại $B$:
 $ (1-x)^2+(1-y)^2=(x+y)^2 equiv y=(1-x)/(x+1). $
 Suy ra $B M=1-x$, $B N=2x/(x+1)$ và
 $ S(x)=1/2 B M dot B N=(x(1-x))/(x+1). $
 $ S'(x)=(-x^2-2x+1)/(x+1)^2=0 equiv x=sqrt(2)-1. $
 Xét dấu đạo hàm trên $(0;1)$, diện tích lớn nhất là $3-2 sqrt(2) approx 0,17$. Đáp số: *0,17*.],
 "6": [Gọi $S$ là tổng mỗi hàng. Hàng trên cùng có một ô nên $S<=11$. Tổng sáu số là $3S>=2+3+4+5+6+7=27$, nên $S in {9;10;11}$.

 Với $S=9$, hàng ba ô chỉ có bộ ${2;3;4}$; các số còn lại đều từ 5 trở lên nên hàng hai ô không thể có tổng 9.

 Với $S=10$, hàng một ô là 10, hàng ba ô là ${2;3;5}$, hàng hai ô là ${4;6}$: có một phân hoạch.

 Với $S=11$, hàng một ô là 11; hai phân hoạch còn lại là ${2;3;6}$ và ${4;7}$, hoặc ${2;4;5}$ và ${3;8}$.

 Mỗi phân hoạch có $1! dot 2! dot 3!=12$ cách xếp vào các ô. Tổng số cách là $3 dot 12=36$. Đáp số: *36*.],
)
#let solutions()={
 for (part,items) in (("I",mc),("II",tf),("III",short)) {
  exam-section(part,[LỜI GIẢI CHI TIẾT.])
  for (number,body) in items {
   block(sticky:true,above:4mm,below:2mm,text(weight:"bold",fill:palette.primary)[Câu #number.])
   body
   parbreak()
  }
 }
}
