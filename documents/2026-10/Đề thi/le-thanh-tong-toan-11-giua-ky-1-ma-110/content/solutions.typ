#import "/templates/exam.typ": exam-section, exam-table
#import "/templates/lesson.typ": formula
#import "/templates/theme.typ": exam-palette as palette
#let p(body) = block(above: 5mm, below: 5mm, body)
#let answer-key() = {
  align(center, text(size: 16pt, weight: "bold", fill: palette.primary)[ĐÁP ÁN VÀ LỜI GIẢI THAM KHẢO])
  align(center, text(size: 11pt, style: "italic")[Lời giải tham khảo trong nguồn: AI & TOANMATH.com])
  exam-section("I", [TRẮC NGHIỆM BỐN PHƯƠNG ÁN LỰA CHỌN.])
  exam-table(columns: (1fr,) * 12, header: range(1, 13).map(n => [#n]), ..(
    "B",
    "A",
    "B",
    "D",
    "A",
    "D",
    "C",
    "D",
    "A",
    "C",
    "A",
    "B",
  ).map(x => [#x]))
  exam-section("II", [TRẮC NGHIỆM ĐÚNG – SAI.])
  exam-table(
    columns: (1fr,) * 5,
    header: ([Câu], [a)], [b)], [c)], [d)]),
    [1],
    [Đ],
    [S],
    [Đ],
    [S],
    [2],
    [Đ],
    [Đ],
    [Đ],
    [S],
  )
  exam-section("III", [TRẮC NGHIỆM TRẢ LỜI NGẮN.])
  exam-table(columns: (1fr,) * 4, header: range(1, 5).map(n => [Câu #n]), [2,6], [2,4], [3], [2611])
}
#let multiple = (
  [#p[Xét dãy $1;-3;-7;-11;-15$: mỗi số hạng, kể từ số hạng thứ hai, bằng số hạng đứng ngay trước nó cộng với $-4$. Đây là cấp số cộng với công sai $d=-4$.]
    #p[Các dãy còn lại không có hiệu hai số hạng liên tiếp không đổi, chẳng hạn dãy C có $3-1=2$, $6-3=3$.]
    #p[*Chọn B.*]],
  [#p[$cos x=1 <=> x=k 2pi thin (k in ZZ)$.]
    #p[*Chọn A.*]],
  [#p[Theo điều kiện để đường thẳng song song với mặt phẳng: nếu $a subset.not (P)$ và $a$ song song với một đường thẳng $b$ nằm trong $(P)$ thì $a parallel (P)$.]
    #p[*Chọn B.*]],
  [#p[Theo định nghĩa, hai mặt phẳng song song với nhau nếu chúng không có điểm chung nào.]
    #p[*Chọn D.*]],
  [#p[Ta có $u_36=u_1+35d => 72=2+35d => d=2$.]
    #p[*Chọn A.*]],
  [#p[$cos x=cos alpha <=> x=plus.minus alpha+k 2pi thin (k in ZZ)$.]
    #p[Do đó $S={alpha+k 2pi;-alpha+k 2pi | k in ZZ}$.]
    #p[*Chọn D.*]],
  [#p[Vì $A B C D$ là hình bình hành nên $C D parallel A B$. Mà $A B subset (S A B)$ và $C D subset.not (S A B)$, do đó $C D parallel (S A B)$.]
    #p[*Chọn C.*]],
  [#p[Các cặp mặt đối diện của hình hộp song song với nhau nên A, B, C đúng.]
    #p[Gọi $O,O'$ lần lượt là tâm của $A B C D$ và $A' B' C' D'$. Hai mặt phẳng $(B D D' B')$ và $(A C C' A')$ cùng chứa $O,O'$ nên chúng cắt nhau theo giao tuyến $O O'$. Vậy mệnh đề D sai.]
    #p[*Chọn D.*]],
  [#p[Số ghế của các hàng lập thành cấp số cộng có $u_1=15$, $d=3$. Số ghế hàng thứ 20 là $u_20=u_1+19d=15+19 dot 3=72$.]
    #p[*Chọn A.*]],
  [#p[Theo tính chất của hình lăng trụ, các mặt bên của hình lăng trụ đều là hình bình hành.]
    #p[*Chọn C.*]],
  [#formula(($sin 2x=cos x <=> 2sin x cos x-cos x=0,$, $<=> cos x(2sin x-1)=0,$))
    #p[Suy ra $cos x=0$ hoặc $sin x=1/2$. Trên đoạn $[0;pi]$, ta có:]
    #p[$cos x=0 <=> x=pi/2$; $sin x=1/2 <=> x=pi/6$ hoặc $x=(5pi)/6$.]
    #p[Tổng các nghiệm là $pi/2+pi/6+(5pi)/6=(3pi)/2$.]
    #p[*Chọn A.*]],
  [#p[Vì $I,J$ lần lượt là trọng tâm các tam giác $A B C,A B D$ nên $I in A M$, $J in A N$. Do đó mặt phẳng $(I J M N)$ chính là mặt phẳng $(A M N)$.]
    #p[Trong tam giác $B C D$, $M N$ là đường trung bình nên $M N parallel C D$. Mà $M N subset (I J M N)$ và $C D subset.not (I J M N)$, suy ra $C D parallel (I J M N)$.]
    #p[*Chọn B.*]],
)
#let true-false = (
  [#p[Số tiền tiết kiệm mỗi ngày lập thành cấp số cộng có $u_1=10 thin 000$, $d=2 thin 000$.]
    #p[*a) Đúng.* Mỗi ngày tiết kiệm nhiều hơn ngày liền trước 2 000 đồng nên công sai $d=2 thin 000$.]
    #p[*b) Sai.* $u_10=u_1+9d=10 thin 000+9 dot 2 thin 000=28 thin 000$ (đồng), không phải 30 000 đồng.]
    #p[*c) Đúng.* Ta có:]
    #formula(($S_15=(15(2u_1+14d))/2=(15(20 thin 000+28 thin 000))/2=360 thin 000$,))
    #p[Vậy tổng số tiền sau 15 ngày là 360 000 đồng.]
    #p[*d) Sai.* Ta có:]
    #formula(($S_35=(35(2u_1+34d))/2=(35(20 thin 000+68 thin 000))/2=1 thin 540 thin 000$,))
    #p[Vì $1 thin 540 thin 000<2 thin 000 thin 000$ nên sau 35 ngày học sinh chưa đủ tiền mua xe đạp.]],
  [#p[*a) Đúng.* Trong tam giác $S A B$, có $(S M)/(S A)=(S N)/(S B)$ nên $M N parallel A B$ (định lí Thales đảo). Mà $A B subset (A B C)$ và $M N subset.not (A B C)$ nên $M N parallel (A B C)$.]
    #p[*b) Đúng.* Tương tự, $N P parallel B C$. Mặt phẳng $(M N P)$ chứa hai đường thẳng cắt nhau $M N,N P$ lần lượt song song với $A B,B C$ nằm trong $(A B C)$, nên $(M N P) parallel (A B C)$.]
    #p[*c) Đúng.* Từ $M N parallel A B$, $N P parallel B C$, $M P parallel A C$ suy ra $M N=2/3 A B=4$, $N P=2/3 B C=4$, $M P=2/3 A C=4$ (cm). Vậy tam giác $M N P$ đều.]
    #p[*d) Sai.* Qua $M$ chỉ có một mặt phẳng song song với $(A B C)$. Theo ý b), $(alpha)$ trùng với $(M N P)$. Các đoạn giao tuyến là $M N,N P,P M$, tạo thành tam giác đều cạnh $4 "cm"$.]
    #p[Diện tích tam giác $M N P$ là $(4^2 sqrt(3))/4=4sqrt(3) "cm"^2$, khác $(9sqrt(3))/4 "cm"^2$.]],
)
#let short = (
  [#p[Ta có $u_4=(2 dot 4+5)/(4+1)=13/5="2,6"$.]
    #p[*Đáp số: 2,6.*]],
  [#p[Theo hình vẽ, $M$ là điểm tựa ở mép miệng bể, $O$ là đầu thước chạm đáy bể và $N$ là điểm trên thước nằm trên mặt nước. Ta có $N O=3 "m"$, $M N=2 "m"$, suy ra $M O=5 "m"$.]
    #p[Ba mặt phẳng $(A' B' C' D')$ (miệng bể), $(I J K L)$ (mặt nước) và $(A B C D)$ (đáy bể) đôi một song song. Chúng cắt hai đường thẳng $M O$ và $A A'$ lần lượt tại $M,N,O$ và $A',I,A$.]
    #p[Theo định lí Thales trong không gian:]
    #formula(($(A I)/(A A')=(O N)/(O M)=3/5 => A I=3/5 dot 4="2,4" "m".$,))
    #p[Vậy mực nước còn lại trong bể là $"2,4" "m"$.]
    #p[*Đáp số: 2,4.*]],
  [#p[Gọi $K$ là tâm hình bình hành $A C C' A'$. Khi đó $K$ là trung điểm của $A C'$ và của $A' C$.]
    #p[Trong tam giác $A A' C'$, $A' K$ là đường trung tuyến nên $G in A' K$ và $A' G=2/3 A' K$. Mà $A' K=1/2 A' C$ nên $G in A' C$ và $(A' G)/(A' C)=1/3$.]
    #p[Trong mặt phẳng $(A' B C)$, qua $G$ kẻ đường thẳng song song với $B C$, cắt $A' B$ tại $T$. Theo định lí Thales: $(A' T)/(A' B)=(A' G)/(A' C)=1/3$.]
    #p[Trong mặt phẳng $(A B B' A')$, qua $T$ kẻ đường thẳng song song với $A A'$, cắt $A B$ tại $H$. Theo định lí Thales: $(A H)/(A B)=(A' T)/(A' B)=1/3$.]
    #p[Mặt phẳng $(G T H)$ có $G T parallel B C$ và $T H parallel A A' parallel B B'$ nên $(G T H) parallel (B C C' B')$, suy ra $G H parallel (B C C' B')$.]
    #p[Mặt phẳng qua $G$ song song với $(B C C' B')$ là duy nhất nên điểm $H$ thỏa mãn yêu cầu là duy nhất, với $A B=3A H$. Vậy $x=3$.]
    #p[*Đáp số: 3.*]],
  [#p[Hình thứ nhất có 1 ô. Từ hình thứ $k$ chuyển sang hình thứ $k+1$, ta thêm một lớp mới gồm $6k$ ô (lớp thứ hai có 6 ô, lớp thứ ba có 12 ô, …).]
    #formula(($f(n)=1+6(1+2+...+(n-1)),$, $=1+6 dot (n(n-1))/2=3n(n-1)+1.$))
    #p[Kiểm tra: $f(2)=7$, $f(3)=19$, đúng với đề bài.]
    #p[Vậy $f(30)=3 dot 30 dot 29+1=2611$.]
    #p[*Đáp số: 2611.*]],
)
#let essay = (
  [#p[Ta có $sin(2x-pi/3)=sin(x+pi/4)$ khi và chỉ khi:]
    #p[$2x-pi/3=x+pi/4+k 2pi$ hoặc $2x-pi/3=pi-x-pi/4+k 2pi$, với $k in ZZ$.]
    #p[Tương đương $x=(7pi)/12+k 2pi$ hoặc $3x=(13pi)/12+k 2pi$.]
    #p[Vậy phương trình có nghiệm $x=(7pi)/12+k 2pi$ hoặc $x=(13pi)/36+(k 2pi)/3$, với $k in ZZ$.]],
  [#p[*a)* Vì $A B C D$ là hình bình hành tâm $O$ nên $O$ là trung điểm của $A C$. Trong tam giác $S A C$, $O M$ là đường trung bình nên $O M parallel S C$.]
    #p[Trong tam giác $S A D$, $M N$ là đường trung bình nên $M N parallel A D$. Mà $A D parallel B C$ nên $M N parallel B C$.]
    #p[Mặt phẳng $(O M N)$ chứa hai đường thẳng cắt nhau $O M,M N$ lần lượt song song với $S C,B C$ nằm trong $(S B C)$. Vậy $(O M N) parallel (S B C)$.]
    #p[*b)* Trong tam giác $A B C$, $O E$ là đường trung bình nên $O E parallel B C$. Mà $M N parallel B C$ nên $O E parallel M N$. Do đó bốn điểm $O,E,M,N$ cùng nằm trong một mặt phẳng, suy ra $E in (O M N)$.]
    #p[Mặt khác $F in O N subset (O M N)$ nên $E F subset (O M N)$. Theo câu a), $(O M N) parallel (S B C)$, do đó $E F parallel (S B C)$.]],
  [#p[*a)* Ta có $h(5)=20+15sin(pi/10 dot 5-pi/2)=20+15sin 0=20$.]
    #p[Vậy sau 5 phút cabin ở độ cao $20 "m"$.]
    #p[*b)* $h(t)="27,5" <=> 15sin(pi/10 t-pi/2)="7,5"$, hay $sin(pi/10 t-pi/2)=1/2$.]
    #p[Suy ra $pi/10 t-pi/2=pi/6+k 2pi$ hoặc $pi/10 t-pi/2=(5pi)/6+k 2pi$, với $k in ZZ$.]
    #p[Tương đương $t=20/3+20k$ hoặc $t=40/3+20k$.]
    #p[Với $0<=t<=20$, chỉ nhận $k=0$, được $t=20/3 approx "6,67"$ và $t=40/3 approx "13,33"$.]
    #p[Vậy cabin đạt độ cao $"27,5" "m"$ tại các thời điểm *6,67 phút* và *13,33 phút*.]],
)
#let solutions() = {
  for (number, title, items) in (
    ("I", [LỜI GIẢI PHẦN I], multiple),
    ("II", [LỜI GIẢI PHẦN II], true-false),
    ("III", [LỜI GIẢI PHẦN III], short),
    ("IV", [LỜI GIẢI PHẦN IV], essay),
  ) {
    exam-section(number, title)
    for (i, body) in items.enumerate() {
      block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu #(i + 1).])
      body
    }
  }
}
