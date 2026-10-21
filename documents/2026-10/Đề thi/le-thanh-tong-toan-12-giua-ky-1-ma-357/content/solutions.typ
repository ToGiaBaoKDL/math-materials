#import "/templates/exam.typ": exam-section, exam-table
#import "/templates/lesson.typ": formula
#import "/templates/theme.typ": exam-palette as palette
#let p(body) = block(above: 4mm, below: 4mm, body)
#let answer-key() = {
  align(center, text(size: 16pt, weight: "bold", fill: palette.primary)[ĐÁP ÁN VÀ LỜI GIẢI THAM KHẢO])
  align(center, text(size: 11pt, style: "italic")[Lời giải tham khảo trong nguồn: AI & TOANMATH.com])
  exam-section("I", [TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN.])
  exam-table(columns: (1fr,) * 12, header: range(1, 13).map(n => [#n]), ..(
    "C",
    "D",
    "A",
    "C",
    "C",
    "B",
    "A",
    "D",
    "D",
    "D",
    "B",
    "A",
  ).map(x => [#x]))
  exam-section("II", [TRẮC NGHIỆM ĐÚNG SAI.])
  exam-table(
    columns: (1fr,) * 5,
    header: ([Ý], [Câu 1], [Câu 2], [Câu 3], [Câu 4]),
    [a)],
    [S],
    [Đ],
    [S],
    [Đ],
    [b)],
    [S],
    [S],
    [Đ],
    [S],
    [c)],
    [Đ],
    [Đ],
    [S],
    [S],
    [d)],
    [Đ],
    [Đ],
    [Đ],
    [S],
  )
  exam-section("III", [TRẮC NGHIỆM TRẢ LỜI NGẮN.])
  exam-table(columns: (1fr,) * 6, header: range(1, 7).map(n => [Câu #n]), [0,03], [150], [1080], [11,3], [6,09], [1,98])
}
#let multiple = (
  [#p[Với $y=-2x^3-x+2026$, ta có $y'=-6x^2-1<0, forall x in RR$. Vậy hàm số nghịch biến trên $RR$.]
    #p[*Chọn C.*]],
  [#p[Ta có $y=x+2/(x+1)$ và $y'=1-2/(x+1)^2$.]
    #p[Tại các điểm cực trị: $y'=0 => (x+1)^2=2 => 2/(x+1)=x+1$.]
    #p[Do đó, cả hai điểm cực trị đều thuộc đường thẳng $y=x+(x+1)=2x+1$.]
    #p[*Chọn D.*]],
  [#p[Vì $arrow(B B')=arrow(D D')$, ta có:]
    #formula(($arrow(u)=(arrow(D C')+arrow(C' A))+(arrow(A D')-arrow(D D'))$, $=arrow(D A)+arrow(A D)=arrow(0) .$))
    #p[*Chọn A.*]],
  [#p[Với $y=x+1-2/(x-2)$, ta có $lim_(x->plus.minus infinity) [y-(x+1)]=lim_(x->plus.minus infinity) (-2)/(x-2)=0$.]
    #p[Vậy đường tiệm cận xiên là $y=x+1$. *Chọn C.*]],
  [#p[Khi $x->-infinity$, ta có:]
    #formula(($y+1=2x+sqrt(4x^2-4)$, $=(-4)/(sqrt(4x^2-4)-2x)->0 .$))
    #p[Vậy đường tiệm cận ngang là $y=-1$. *Chọn C.*]],
  [#p[Ta có $y'=6x^2-10x=2x(3x-5)$. Suy ra $y'>0$ trên các khoảng $(-infinity;0)$ và $(5/3;+infinity)$.]
    #p[Trong các phương án đã cho, hàm số đồng biến trên $(2;+infinity)$. *Chọn B.*]],
  [#p[Từ đồ thị, trên khoảng $(-infinity;0)$, hàm số đạt giá trị lớn nhất tại $x=-2$. Giá trị lớn nhất là $f(-2)=2$.]
    #p[*Chọn A.*]],
  [#p[Gọi $M$ là trung điểm của $A B$. Do các tam giác $S A B$ và $A B C$ cân tại $S$ và $C$ nên $A B perp S M$ và $A B perp C M$.]
    #p[Suy ra $A B perp (S M C)$, do đó $A B perp S C$. Vậy $(arrow(S C),arrow(B A))=90 degree$.]
    #p[*Chọn D.*]],
  [#p[Khoảng biến thiên của mẫu số liệu ghép nhóm là $R="5,0"-"2,5"="2,5"$. *Chọn D.*]],
  [#p[Đặt độ dài cạnh đáy và cạnh bên bằng $a$. Ta có $arrow(B C')=arrow(B C)+arrow(C C')$ và $arrow(A' B')=arrow(A B)$.]
    #p[Vì $arrow(C C') perp arrow(A B)$ nên:]
    #formula(($arrow(B C') dot arrow(A' B')=arrow(B C) dot arrow(A B)$, $=a^2 cos 120 degree=-a^2/2 .$))
    #p[Mặt khác, $B C'=a sqrt(2)$. Do đó:]
    #formula(($cos(arrow(B C'), arrow(A' B'))=(-a^2/2)/(a sqrt(2) dot a)=-1/(2sqrt(2)) .$,))
    #p[Suy ra góc cần tìm xấp xỉ $"110,70" degree$, làm tròn được $111 degree$. *Chọn D.*]],
  [#p[Ta có $arrow(A B)=(1;1;1)$. Vì $A,B,M$ thẳng hàng nên $M=(t;-2+t;3+t)$.]
    #p[Do $M in (O x y)$ nên $3+t=0 => t=-3$. Vậy $M(-3;-5;0)$ và $a+b+c=-8$.]
    #p[*Chọn B.*]],
  [#p[Ta có $f'(x)=3x^2-30=3(x^2-10)$. Trên đoạn $[2;19]$, hàm số giảm đến $x=sqrt(10)$ rồi tăng.]
    #p[Vì vậy $x_0=sqrt(10)$ và $m=f(sqrt(10))=-20sqrt(10)$. Suy ra $T=m x_0=-200$.]
    #p[*Chọn A.*]],
)
#let true-false = (
  [#p[Từ bảng biến thiên, hàm số đạt cực đại tại $x=-1$, cực tiểu tại $x=1$ và đồng biến trên các khoảng $(-infinity;-1)$, $(1;+infinity)$.]
    #p[Đặt $f(x)=a x^3+b x^2+c x+d$. Từ $f'(-1)=f'(1)=0$, suy ra $b=0$, $c=-3a$. Kết hợp với $f(-1)=3$, $f(1)=-5$, ta được $2a+d=3$ và $-2a+d=-5$.]
    #p[Suy ra $a=2$, $d=-1$. Vậy $f(x)=2x^3-6x-1$.]
    #p[a) *Sai.* Hàm số đạt cực đại tại $x=-1$.]
    #p[b) *Sai.* Hàm số nghịch biến trên $(-1;1)$ nên không đồng biến trên $(-5;+infinity)$.]
    #p[c) *Đúng*, vì $f(0)=-1$.]
    #p[d) *Đúng*, vì $f(-1)=3$ và $f(2)=16-12-1=3$.]],
  [#p[Tổng tần số là $n=4+11+7+8+8+2=40$. Các giá trị đại diện lần lượt là 42,5; 47,5; 52,5; 57,5; 62,5; 67,5.]
    #p[a) *Đúng.*]
    #formula((
      $overline(x)=(4 dot "42,5"+11 dot "47,5"+7 dot "52,5"+8 dot "57,5"+8 dot "62,5"+2 dot "67,5")/40="53,875" .$,
    ))
    #p[b) *Sai.* Phương sai $s^2=1/40 sum_(i=1)^6 n_i(x_i-overline(x))^2="51,234375"$. Độ lệch chuẩn $s=sqrt("51,234375") approx "7,16"$.]
    #p[c) *Đúng.* Vì $n/4=10$ và tần số tích lũy của hai nhóm đầu lần lượt là 4, 15 nên nhóm chứa tứ phân vị thứ nhất là $[45;50)$.]
    #formula(($Q_1=45+(10-4)/11 dot 5 approx "47,7" .$,))
    #p[d) *Đúng.* Vì $(3n)/4=30$, ta có $Q_3=55+(30-22)/8 dot 5=60$.]
    #formula(($Delta Q=Q_3-Q_1=60-(45+30/11) approx "12,3" .$,))],
  [#p[Doanh thu của chuyến xe là $F(x)=x(300-(5x)/2)^2$, với $0<x<=45$.]
    #formula(($F'(x)=(300-(5x)/2)(300-(15x)/2) .$,))
    #p[Trên khoảng đang xét, $F'(x)>0$ khi $0<x<40$ và $F'(x)<0$ khi $40<x<45$. Vậy doanh thu lớn nhất đạt được khi chở 40 hành khách: $F(40)=40 dot 200^2=1600000$ đồng.]
    #p[a) *Sai.* Công thức doanh thu phải là $F(x)=x(300-(5x)/2)^2$.]
    #p[b) *Đúng*, vì $F(40)=1600000>1500000$.]
    #p[c) *Sai.* Xe cần chở 40 người để doanh thu lớn nhất.]
    #p[d) *Đúng.* Doanh thu lớn nhất là 1,6 triệu đồng.]],
  [#p[Ta có $A(0;-343;75)$ và $D(0;0;227)$.]
    #p[a) *Đúng.*]
    #p[b) *Sai.* Ta có $arrow(D A)=(0;-343;-152)$ và $arrow(A O)=(0;343;-75)$. Gọi góc giữa hai vectơ là $alpha$. Khi đó:]
    #formula((
      $cos alpha=(arrow(D A) dot arrow(A O))/(abs(arrow(D A)) dot abs(arrow(A O)))$,
      $=(-343^2+152 dot 75)/(sqrt(343^2+152^2) sqrt(343^2+75^2)) .$,
    ))
    #p[Suy ra $alpha approx "143,8" degree$.]
    #p[c) *Sai.* Điểm trên đường thẳng $A D$ có tọa độ dạng $(0;-343t;227-152t)$. Tại giao điểm với mặt nước: $227-152t=0 => t=227/152$.]
    #p[Vậy giao điểm là $(0;-77861/152;0)$, khác điểm $(0;-77861;0)$.]
    #p[d) *Sai.* Ta có $M(0;-230;75)$. Vì $M N parallel O z$ và $N in A D$ nên $z_N=227-(152 dot 230)/343$.]
    #formula(($M N=z_N-75=(152(343-230))/343=17176/343 approx "50,08" "m" .$,))],
)
#let short = (
  [#p[Các nhóm là $["0,94";"0,97")$, $["0,97";"1,00")$, $["1,00";"1,03")$, $["1,03";"1,06")$. Tần số tương ứng là 4; 6; 6; 4. Giá trị đại diện tương ứng là 0,955; 0,985; 1,015; 1,045.]
    #formula(($overline(x)=(4 dot "0,955"+6 dot "0,985"+6 dot "1,015"+4 dot "1,045")/20=1 .$,))
    #formula(($s^2=(4("0,955"-1)^2+6("0,985"-1)^2+6("1,015"-1)^2+4("1,045"-1)^2)/20="0,000945" .$,))
    #p[Vậy độ lệch chuẩn $s=sqrt("0,000945") approx "0,03" "kg"$. *Đáp số: 0,03.*]],
  [#p[Chi phí sản xuất trung bình cho mỗi sản phẩm là $overline(C)(x)=C(x)/x=150+900/x$.]
    #p[Ta có $lim_(x->+infinity) overline(C)(x)=150$. Theo ý giới hạn của đáp án nguồn, $t=150$. *Đáp số: 150.*]],
  [#p[Tốc độ bơm nước là $v(t)=V'(t)=(90t^2-t^3)/100=(t^2(90-t))/100$.]
    #p[Ta có $v'(t)=(3t(60-t))/100$. Trên $(0;90)$, hàm số $v(t)$ tăng đến $t=60$ rồi giảm.]
    #p[Vì vậy $v_max=v(60)=(60^2 dot 30)/100=1080$. *Đáp số: 1080.*]],
  [#p[Gọi hai kích thước đáy hộp là $a,b$ và chiều cao là $h$, cùng tính bằng cm. Do các cạnh xiên trong hình khai triển tạo với cạnh hình vuông góc $45 degree$, ta có:]
    #formula(($(a+b+2h)/sqrt(2)=6 => (a+b)/2=3sqrt(2)-h .$,))
    #p[Thể tích hộp thỏa mãn $V=a b h <= ((a+b)/2)^2 h=h(3sqrt(2)-h)^2$. Dấu bằng xảy ra khi $a=b$.]
    #p[Xét $g(h)=h(3sqrt(2)-h)^2$, với $0<h<3sqrt(2)$. Ta có $g'(h)=(3sqrt(2)-h)(3sqrt(2)-3h)$.]
    #p[Suy ra $g(h)$ tăng trên $(0;sqrt(2))$ và giảm trên $(sqrt(2);3sqrt(2))$. Vậy thể tích lớn nhất đạt được khi $h=sqrt(2)$ và $a=b=2sqrt(2)$.]
    #p[Khi đó $V_max=(2sqrt(2))^2 dot sqrt(2)=8sqrt(2) approx "11,3" "cm"^3$. *Đáp số: 11,3.*]],
  [#p[Trải phẳng các mặt tường mà dây điện đi qua. Đường dây ngắn nhất trở thành đoạn thẳng nối hai đầu dây trên hình trải phẳng.]
    #p[Độ chênh lệch độ cao giữa hai đầu dây là $Delta z=5/2-1=3/2 "m"$.]
    #p[Nếu đi qua phía bức tường $(O y z)$, cột nhô ra làm tăng quãng đường ngang thêm $2 dot "0,2"="0,4" "m"$. Khoảng cách theo phương ngang trên hình trải phẳng là $L_1=1+4+1/2+2 dot "0,2"="5,9" "m"$.]
    #p[Nếu đi vòng qua phía đối diện, khoảng cách theo phương ngang là $L_2=(3-1)+4+(3-1/2)="8,5" "m"$.]
    #p[Vì $L_1<L_2$, độ dài dây tối thiểu là $ell_min=sqrt("5,9"^2+(3/2)^2) approx "6,09" "m"$. *Đáp số: 6,09.*]],
  [#p[Ta có $A B=1/2 "m"$ và $D(1/2;0;1)$. Gọi $I$ là tâm hình vuông $A B C D$. Khi đó $I(1/4;1/4;1)$ và $I A=(A B sqrt(2))/2=sqrt(2)/4 "m"$.]
    #p[Vì $S.A B C D$ là hình chóp tứ giác đều nên $S I perp (A B C D)$. Cạnh bên của khối chóp là $S A="0,6" "m"$. Áp dụng định lí Pythagore trong tam giác vuông $S I A$:]
    #formula(($S I=sqrt(S A^2-I A^2)=sqrt("0,6"^2-(sqrt(2)/4)^2)=sqrt(94)/20 "m" .$,))
    #p[Vì khối chóp nằm phía trên trụ nên $S(1/4;1/4;1+sqrt(94)/20)$.]
    #p[Do đó $a+b+c=1/4+1/4+1+sqrt(94)/20=3/2+sqrt(94)/20 approx "1,98"$. *Đáp số: 1,98.*]],
)
#let solutions() = {
  for (number, title, items) in (
    ("I", [LỜI GIẢI PHẦN I], multiple),
    ("II", [LỜI GIẢI PHẦN II], true-false),
    ("III", [LỜI GIẢI PHẦN III], short),
  ) {
    exam-section(number, title)
    for (i, body) in items.enumerate() {
      block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu #(i + 1).])
      body
    }
  }
}
