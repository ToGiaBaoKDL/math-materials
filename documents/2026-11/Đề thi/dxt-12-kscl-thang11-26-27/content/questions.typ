#import "../figures/diagrams.typ": *
#import "tables.typ": *

#let questions = (
  (key: "I-1", section: "I", number: 1,
    stem: [Phương trình $sin x = - 1$ có nghiệm là:],
    statements: [],
    choices: ([$x = frac(π, 2) + k 2 π "," k ∈ ℤ$.],[$x = π + k 2 π "," k ∈ ℤ$.],[$x = k π "," k ∈ ℤ$.],[$x = - frac(π, 2) + k 2 π "," k ∈ ℤ$.],),
    solution: [Ta có: $sin x = - 1 ⇔ x = - frac(π, 2) + k 2 π "," k ∈ ℤ$.],
    answer: [D],
    qfig: none, sfig: none, width: 64mm, lines: 3),
  (key: "I-2", section: "I", number: 2,
    stem: [Trong không gian với hệ tọa độ $O x y z$, hình chiếu vuông góc của điểm $M lr(( 2 ";" - 2 ";" 1 ))$ trên mặt phẳng $lr(( O x y ))$ có tọa độ là],
    statements: [],
    choices: ([$lr(( 2 ";" - 2 ";" 0 ))$.],[$lr(( 0 ";" 0 ";" 1 ))$.],[$lr(( 0 ";" - 2 ";" 1 ))$.],[$lr(( 2 ";" 0 ";" 1 ))$.],),
    solution: [Hình chiếu vuông góc của điểm $M lr(( 2 ";" - 2 ";" 1 ))$ trên mặt phẳng $lr(( O x y ))$ có tọa độ là $lr(( 2 ";" - 2 ";" 0 ))$.],
    answer: [A],
    qfig: none, sfig: none, width: 64mm, lines: 3),
  (key: "I-3", section: "I", number: 3,
    stem: [Cho hình lập phương $A B C D . A' B' C' D'$. Vecto nào dưới đây bằng $arrow(A D)$?],
    statements: [],
    choices: ([$arrow(B C')$.],[$arrow(D C)$.],[$arrow(B' C')$.],[$arrow(A B)$.],),
    solution: [Ta có $arrow(A D) = arrow(B C) = arrow(A' D') = arrow(B' C')$.],
    answer: [C],
    qfig: cube(), sfig: none, width: 56mm, lines: 3),
  (key: "I-4", section: "I", number: 4,
    stem: [Cho hình lăng trụ $A B C . A' B' C'$, $M$ là trung điểm của $B B'$. Đặt $arrow(C A) = arrow(a)$, $arrow(C B) = arrow(b)$, $arrow(A A') = arrow(c)$. Khẳng định nào sau đây đúng?],
    statements: [],
    choices: ([$arrow(A M) = arrow(b) - arrow(a) + frac(1, 2) arrow(c)$],[$arrow(A M) = arrow(a) + arrow(c) - frac(1, 2) arrow(b)$.],[$arrow(A M) = arrow(b) + arrow(c) - frac(1, 2) arrow(a)$.],[$arrow(A M) = arrow(a) - arrow(c) + frac(1, 2) arrow(b)$.],),
    solution: [Ta có: $ arrow(A M) &= arrow(A B)+arrow(B M)=arrow(C B)-arrow(C A)+1/2 arrow(B B') \ &= arrow(C B)-arrow(C A)+1/2 arrow(A A')=arrow(b)-arrow(a)+1/2 arrow(c). $],
    answer: [A],
    qfig: none, sfig: prism(), width: 65mm, lines: 4),
  (key: "I-5", section: "I", number: 5,
    stem: [Cho hàm số $f lr(( x ))$ có đạo hàm $f' lr(( x )) = lr(( x + 1 )) x ^(2) lr(( x - 3 )) ^(3) "," ∀ x ∈ ℝ$. Hàm số đã cho có bao nhiêu điểm cực trị?],
    statements: [],
    choices: ([$3$.],[$2$.],[$5$.],[$1$.],),
    solution: [Ta có $f'(x)=0$ khi và chỉ khi $x=-1$, $x=0$ hoặc $x=3$. Do $f' lr(( x )) = 0$ có $3$ nghiệm, trong đó $x = 0$ là nghiệm kép nên hàm số $f lr(( x ))$ có $2$ cực trị.],
    answer: [B],
    qfig: none, sfig: none, width: 64mm, lines: 3),
  (key: "I-6", section: "I", number: 6,
    stem: [Cho hàm số $y = f ( x )$ liên tục trên đoạn $[ - 1 ";" 3 ]$ và có đồ thị như hình vẽ. Gọi $M$ và $m$ lần lượt là giá trị lớn nhất và nhỏ nhất của hàm số đã cho trên $[ - 1 ";" 2 ]$. Tính giá trị $M - m$ bằng],
    statements: [],
    choices: ([$4$],[$0$],[$1$],[$5$],),
    solution: [$ M = 2 ";"  m = - 2 $],
    answer: [A],
    qfig: graph("range"), sfig: none, width: 60mm, lines: 3),
  (key: "I-7", section: "I", number: 7,
    stem: [Khảo sát thời gian tập thể dục của một số học sinh khối 11 thu được mẫu số liệu ghép nhóm sau:
#data-table()
Trung vị mẫu số liệu trên gần số nào nhất?],
    statements: [],
    choices: ([41,23.],[51,54.],[40,55.],[50,44.],),
    solution: [Ta có: $n = 5 + 9 + 13 + 10 + 6 = 43$.

Vị trí trung vị $n/2 = "21,5"$ nằm trong lớp $[40;60)$, suy ra $ M_e = 40 + ("21,5"-14)/13 ⋅ 20 approx "51,54". $],
    answer: [B],
    qfig: none, sfig: none, width: 64mm, lines: 3),
  (key: "I-8", section: "I", number: 8,
    stem: [Trong không gian $O x y z$, cho điểm $A lr(( - 5 ";" 2 ";" 3 ))$ và điểm $B$ là điểm đối xứng với $A$ qua $O y$. Độ dài đoạn thẳng $A B$ bằng],
    statements: [],
    choices: ([$2 sqrt(38)$.],[$2 sqrt(34)$.],[$sqrt(34)$.],[$sqrt(38)$.],),
    solution: [Theo bài ra ta có: $B lr(( 5 ";" 2 ";" - 3 ))$.

Khi đó: $A B = sqrt(10 ^(2) + lr(( - 6 )) ^(2)) = 2 sqrt(34)$.],
    answer: [B],
    qfig: none, sfig: none, width: 64mm, lines: 3),
  (key: "I-9", section: "I", number: 9,
    stem: [Cho hàm số đa thức bậc ba $y = a x ^(3) + b x ^(2) + c x + d lr(( a ≠ 0 ))$ có đồ thị như hình vẽ. Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],
    statements: [],
    choices: ([$lr(( - 2 ";" 0 ))$.],[$lr(( 0 ";" + ∞ ))$.],[$(-1;1)$.],[$lr(( 1 ";" + ∞ ))$.],),
    solution: [Hàm số đã cho nghịch biến trên khoảng $lr(( 1 ";" + ∞ ))$.],
    answer: [D],
    qfig: graph("cubic"), sfig: none, width: 65mm, lines: 3),
  (key: "I-10", section: "I", number: 10,
    stem: [Trong không gian với hệ tọa độ $O x y z$, cho vectơ $arrow(a) = lr(( 1 ";" - 2 ";" 0 ))$ và $arrow(b) = 2 arrow(a)$. Tìm tọa độ của vectơ $arrow(b)$.],
    statements: [],
    choices: ([$arrow(b) = lr(( 2 ";" 4 ";" 2 ))$.],[$arrow(b) = lr(( 2 ";" - 4 ";" 0 ))$.],[$arrow(b) = lr(( 3 ";" 0 ";" 2 ))$.],[$arrow(b) = lr(( 2 ";" 4 ";" 0 ))$.],),
    solution: [Cho $arrow(u) ( x ";" y ";" z )$ khi đó $arrow(v) = k arrow(u) = lr(( k . x ";" k . y ";" k . z ))$. Ta có $arrow(b) = 2 arrow(a) = lr(( 2 ";" - 4 ";" 0 ))$],
    answer: [B],
    qfig: none, sfig: none, width: 64mm, lines: 3),
  (key: "I-11", section: "I", number: 11,
    stem: [Cho cấp số cộng $lr(( u _(n) ))$ có $u _(1) = - 3 ";" u _(6) = 27$. Tính công sai $d$.],
    statements: [],
    choices: ([$d = 7$.],[$d = 5$.],[$d = 8$.],[$d = 6$.],),
    solution: [Nhắc lại: Công thức số hạng tổng quát của cấp số cộng $u _(n) = u _(1) + lr(( n - 1 )) d$, với $u _(1)$ là số hạng đầu tiên của cấp số cộng, $d$ là công sai.

Ta có $u _(6) = u _(1) + 5 d = 27 ⇒ d = 6$.],
    answer: [D],
    qfig: none, sfig: none, width: 64mm, lines: 3),
  (key: "I-12", section: "I", number: 12,
    stem: [Cho hình chóp $S.A B C D$ có đáy là hình vuông cạnh $a ";" S A ⊥ lr(( A B C D ))$ và $S A = a$. Tính số đo góc nhị diện $lr([ S "," C D "," A ])$.],
    statements: [],
    choices: ([$45 °$.],[$30 °$.],[$60 °$.],[$120 °$.],),
    solution: [Ta có $A D perp C D$ và $A D subset (A C D)$ (1). Vì $S A perp (A B C D)$ nên $S A perp C D$. Kết hợp với $A D perp C D$, suy ra $C D perp (S A D)$, do đó $C D perp S D$, với $S D subset (S D C)$ (2).

Từ (1) và (2), góc nhị diện $[S,C D,A]=hat(S D A)=45 degree$, vì $S A=A D=a$ nên tam giác $S A D$ vuông cân tại $A$.],
    answer: [A],
    qfig: none, sfig: pyramid(angle:true), width: 68mm, lines: 4),
  (key: "II-1", section: "II", number: 1,
    stem: [Cho hàm số $y = frac(a x ^(2) + b x + c, x + m)$ có đồ thị như hình vẽ],
    statements: [a) Hàm số đã cho nghịch biến trên khoảng $lr(( - 2 ";" - 1 ))$.

b) Đồ thị hàm số có đường tiệm cận xiên $y = x - 1$.

c) Gọi $A "," B$ là hai điểm cực trị của đồ thị hàm số đã cho, diện tích của tam giác OAB bằng 4 đơn vị diện tích (với $O$ là gốc tọa độ).

d) $a + b + c + m = 6$.],
    choices: (),
    solution: [a) Trên khoảng $lr(( - 2 ";" - 1 ))$ đồ thị có hướng “đi xuống” suy ra hàm số đã cho nghịch biến trên khoảng $lr(( - 2 ";" - 1 ))$. Mệnh đề đúng.

b) Đồ thị hàm số có đường tiệm cận xiên là $y = x + 1$. Mệnh đề sai.

c) Gọi hai điểm cực trị là $A lr(( - 2 ";" - 2 )) "," B lr(( 0 ";" 2 ))$ $⇒ S _(Δ O A B) = frac(1, 2) O B . d lr(( A ";" O B )) = frac(1, 2) . 2 . 2 = 2$ đơn vị diện tích. Mệnh đề sai.

d) Do tiệm cận đứng của đồ thị hàm số có phương trình $x = - 1 ⇒ m = 1$

Đồ thị hàm số cắt trục tung tại điểm $B(0;2)$ nên $c/m=2$. Với $m=1$, suy ra $c=2$.

Đặt $f lr(( x )) = frac(a x ^(2) + b x + 2, x + 1)$

Tiệm cận xiên của đồ thị hàm số là $y = x + 1 ⇒ limits(lim)_(x → ∞) frac(f lr(( x )), x) = 1 ⇔ a = 1 ⇒ f lr(( x )) = frac(x ^(2) + b x + 2, x + 1)$

Đồ thị hàm số qua $A lr(( - 2 ";" - 2 )) ⇒ frac(lr(( - 2 )) ^(2) + b lr(( - 2 )) + 2, - 2 + 1) = - 2 ⇔ b = 2$

Vậy $a+b+c+m=1+2+2+1=6$. Mệnh đề đúng.],
    answer: [Đ – S – S – Đ],
    qfig: graph("rational"), sfig: none, width: 65mm, lines: 9),
  (key: "II-2", section: "II", number: 2,
    stem: [Bác Bình dự định làm một bể cá bằng kính cường lực dạng hình hộp chữ nhật không nắp. Bể có thể tích $3 "m" ^(3)$ và có chiều dài gấp đôi chiều rộng. Chi phí làm bể gồm hai phần: phần làm đáy bể là 500 ngàn đồng trên $1 m ^(2)$ và phần làm mặt xung quanh là 400 ngàn đồng trên $1 m ^(2)$. Chi phí vận hành bể cá trong một tháng là 400 ngàn đồng.],
    statements: [a) Chi phí vận hành bể cá trong một năm là 4,8 triệu đồng.

b) Nếu chiều rộng của bể là 1m thì chiều cao của bể là 3m.

c) Nếu chiều rộng của bể là $x lr(( m ))$ thì diện tích xung quanh của bể là $frac(9, x) lr(( m ^(2) ))$.

d) Chi phí ít nhất để làm bể là 4,44 triệu đồng (làm tròn đến hàng phần trăm).],
    choices: (),
    solution: [*a) Đúng.*

Chi phí vận hành bể trong 1 năm là: $400 . 12 = 4800$ (nghìn đồng) hay $"4,8"$ triệu đồng.

*b) Sai.*

Vì chiều dài gấp đôi chiều rộng nên khi chiều rộng là 1 m, chiều dài là 2 m. Chiều cao của bể là $h=3/(1 ⋅ 2)="1,5"$ m.

*c) Đúng.*

Giả sử chiều rộng của bể là $x$ $lr(( m "," x > 0 ))$. Khi đó chiều dài của bể là $2 x lr(( m ))$.

Chiều cao của bể là: $frac(3, x . 2 x) = frac(3, 2 x ^(2))$.

Diện tích xung quanh của bể là: $lr(( x + 2 x )) . 2 . frac(3, 2 x ^(2)) = frac(9, x)$ $lr(( m ^(2) ))$.

*d) Đúng.*

Diện tích đáy bể là $2 x ^(2) lr(( m ^(2) ))$.

Chi phí để làm bể là: $500 . 2 x ^(2) + 400 . frac(9, x) = 1000 x ^(2) + frac(3600, x)$ (nghìn đồng).

Đặt $y = f lr(( x )) = 1000 x ^(2) + frac(3600, x)$, $x > 0$.

Ta có $f' lr(( x )) = 2000 x - frac(3600, x ^(2))$.

$f' lr(( x )) = 0 ⇔ x = root(3, "1,8")$.

Bảng biến thiên:
#tank-variation()

Vậy $f lr(( x ))$ đạt giá trị nhỏ nhất $≈ 4439$ (nghìn đồng) hay chi phí ít nhất để làm bể là 4,44 triệu đồng.],
    answer: [Đ – S – Đ – Đ],
    qfig: tank(), sfig: none, width: 70mm, lines: 9),
  (key: "II-3", section: "II", number: 3,
    stem: [Trong hệ toạ độ Oxyz, đơn vị mỗi trục là mét, mặt sàn là mặt (Oxy), trục Oz hướng lên, có hai bức tường (1) và (2) nằm lần lượt trên các mặt phẳng (Oyz) và (Oxz) (tham khảo hình vẽ). Một tia Laze được chiếu từ điểm $S$ xuyên qua một lỗ nhỏ tại $A lr(( 0 ";" 6 ";" 5 ))$ trên bức tường (1), tia sáng này phản xạ tại điểm B trên mặt sàn rồi đến bức tường (2) tại điểm $C lr(( 12 ";" 0 ";" 7 ))$. Theo tính chất phản xạ ta có $A B$ và $B C$ cùng tạo với mặt sàn các góc bằng nhau. Khi đó],
    statements: [a) Hình chiếu vuông góc của điểm C trên mặt sàn (Oxy) là điểm $C' lr(( 0 ";" 0 ";" 7 ))$.

b) Nếu $B lr(( x _(B) ";" y _(B) ";" 0 ))$ thì $arrow(A B) = lr(( x _(B) ";" y _(B) - 6 ";" - 5 ))$.

c) Tung độ của điểm $B$ là $y _(B) = 5$.

d) Biết điểm $S$ cách lỗ $A$ một khoảng là $S A = 3$ (mét) và $S lr(( a ";" b ";" c ))$ thì $a + b + c = 12$.],
    choices: (),
    solution: [(a) Sai.

Nguyên tắc chung:

Trong hệ trục tọa độ Oxyz, hình chiếu vuông góc của một điểm $M lr(( x _(M) ";" y _(M) ";" z _(M) ))$ lên các mặt phẳng được xác định:

Hình chiếu lên mặt $lr(( O x y )) :$ Tọa độ là $lr(( x _(M) ";" y _(M) ";" 0 ))$.

Hình chiếu lên mặt (Oxz): Tọa độ là $lr(( x _(M) ";" 0 ";" z _(M) ))$.

Hình chiếu lên mặt (Oyz): Tọa độ là $lr(( 0 ";" y _(M) ";" z _(M) ))$.

Sử dụng nguyên tắc trên, suy ra hình chiếu vuông góc của điểm $C lr(( 12 ";" 0 ";" 7 ))$ trên mặt sàn (Oxy) là điểm $C' lr(( 12 ";" 0 ";" 0 ))$.

(b) Đúng.

Nếu $B lr(( x _(B) ";" y _(B) ";" 0 ))$ thì $arrow(A B) = lr(( x _(B) ";" y _(B) - 6 ";" - 5 ))$.

(c) Sai.

Gọi $C' lr(( 12 ";" 0 ";" 0 ))$ là hình chiếu của điểm C trên mặt phẳng (Oxy).

Lấy điểm $K lr(( x _(K) ";" y _(K) ";" z _(K) ))$ là điểm đối xứng của $C$ qua $C'$.

Suy ra $C'$ là trung điểm của đoạn thẳng $C K$.

$ cases(display(frac(x _(K) + 12, 2) = 12), display(frac(y _(K) + 0, 2) = 0), display(frac(z _(K) + 7, 2) = 0))$ $⇔ cases(display(x _(K) = 12), display(y _(K) = 0), display(z _(K) = - 7)) $

$⇒ K lr(( 12 ";" 0 ";" - 7 ))$.

Xét hai tam giác vuông $"Δ" C C' B$ và $"Δ" C' B K$, ta có $C C' = C' K$

$C' B$: cạnh chung

Suy ra $"Δ" C C' B = "Δ" K C' B lr(( c - g - c ))$. $⇒ hat(C B C') = hat(K B C')$

hay $α _(2) = α _(3)$.

Mà $α _(1) = α _(2)$ (theo tính chất phản xạ của ánh sáng) nên $α _(1) = α _(3)$ (hai góc ở vị trí đối đỉnh).

Do đó ba điểm $K$, $B$, $A$ thẳng hàng.

Ta có $arrow(A B) = k arrow(A K)$ $⇔ lr(( x _(B) ";" y _(B) - 6 ";" - 5 )) = k lr(( 12 ";" - 6 ";" - 12 ))$

$ cases(x_B=12k,y_B-6=-6k,-5=-12k) ⇔ cases(x_B=5,y_B=7/2,k=5/12). $ Suy ra $B(5;7/2;0)$.

(d) Đúng.

Ta có $A B = sqrt(5 ^(2) + lr(( frac(7, 2) - 6 )) ^(2) + ( - 5 ) ^(2)) = frac(15, 2) ";"$ $S A = 3$.

Suy ra $frac(A B,S A)=5/2$, hay $2 arrow(A B)=5 arrow(S A)$. Do đó $ 2(5;-5/2;-5)=5(-a;6-b;5-c). $

$ cases(10=-5a, -5=30-5b, -10=25-5c) ⇔ cases(a=-2,b=7,c=7). $

Vậy $a + b + c = 12$.],
    answer: [S – Đ – S – Đ],
    qfig: laser(), sfig: laser(detail:true), width: 69mm, lines: 9),
  (key: "II-4", section: "II", number: 4,
    stem: [Hai xạ thủ mỗi người một viên đạn bắn vào bia với xác suất bắn trúng của người thứ nhất là $"0,9"$ và của người thứ hai là $"0,75"$. Biết rằng kết quả bắn trúng hoặc không trúng bia của hai xạ thủ là độc lập với nhau.],
    statements: [a) Khả năng xạ thủ thứ nhất không bắn trúng bia là $10 % .$

b) Khả năng cả hai viên đạn đều trúng bia là $67 % .$

c) Xác suất có đúng $1$ viên đạn bắn trúng bia là $"0,3" .$

d) Khả năng có ít nhất $1$ viên đạn bắn trúng bia là $"95,7" % .$],
    choices: (),
    solution: [Gọi $A$ là biến cố "Xạ thủ thứ nhất bắn trúng bia", $P ( A ) = "0,9"$.

Gọi $B$ là biến cố "Xạ thủ thứ hai bắn trúng bia", $P ( B ) = "0,75"$.

Vì $A$ và $B$ là hai biến cố độc lập nên $overline(A)$ và $overline(B)$ cũng độc lập. Ta có:

$P ( overline(A) ) = 1 - P ( A ) = 1 - "0,9" = "0,1"$.

$P ( overline(B) ) = 1 - P ( B ) = 1 - "0,75" = "0,25"$.

*a) Đúng.*

Xác suất xạ thủ thứ nhất không trúng bia là $P ( overline(A) ) = "0,1" = 10 %$.

*b) Sai.*

Xác suất cả hai cùng trúng bia là $ P(A inter B)=P(A) ⋅ P(B)="0,9" ⋅ "0,75"="0,675"="67,5"%. $

*c) Đúng.*

Biến cố có đúng $1$ viên trúng bia là $( A ∩ overline(B) ) ∪ ( overline(A) ∩ B )$.

Xác suất cần tìm là

$ P &= P(A) ⋅ P(overline(B))+P(overline(A)) ⋅ P(B) \ &= "0,9" ⋅ "0,25"+"0,1" ⋅ "0,75"="0,3". $

*d) Sai.*

Biến cố có ít nhất $1$ viên trúng bia là biến cố đối của "Cả hai đều không trúng bia".

Xác suất cần tìm:

$ P &= 1-P(overline(A) inter overline(B)) \ &=1-P(overline(A)) ⋅ P(overline(B)) \ &=1-"0,1" ⋅ "0,25"="0,975"="97,5"%. $],
    answer: [Đ – S – Đ – S],
    qfig: none, sfig: none, width: 64mm, lines: 9),
  (key: "III-1", section: "III", number: 1,
    stem: [Cho hàm số $y = frac(x ^(2) - 2 x - 2, x + 1)$ có đồ thị $lr(( C ))$ và điểm $M lr(( 1 ";" - 3 )) .$ Gọi $A "," B$ là hai điểm cực trị của đồ thị $lr(( C ))$. Tính diện tích của tam giác $M A B .$],
    statements: [],
    choices: (),
    solution: [Ta có $ y' = ((2x-2)(x+1)-(x^2-2x-2))/(x+1)^2 = (x^2+2x)/(x+1)^2. $

$ y ' = 0 ⇔ x ^(2) + 2 x = 0 ⇔ lr(bracket.l vec(x = 0, x = - 2, delim: #none) ) . $

Đồ thị hàm số có hai điểm cực trị là $A lr(( 0 ";" - 2 ))$ và $B lr(( - 2 ";" - 6 )) .$

Xét bài toán trong hệ trục không gian $O x y z$ ta có $A lr(( 0 ";" - 2 ";" 0 ))$, $B lr(( - 2 ";" - 6 ";" 0 ))$, $M lr(( 1 ";" - 3 ";" 0 ))$

$ arrow(A M) lr(( 1 ";" - 1 ";" 0 ))$, $arrow(A B) lr(( - 2 ";" - 4 ";" 0 )) . $

Có $[arrow(A M),arrow(A B)]=(0;0;-6)$ nên $ S_(triangle M A B)=1/2 abs([arrow(A M),arrow(A B)])=1/2 sqrt((-6)^2)=3. $],
    answer: [3],
    qfig: none, sfig: none, width: 65mm, lines: 8),
  (key: "III-2", section: "III", number: 2,
    stem: [Một đa giác đều có $20$ đỉnh, tất cả các cạnh của đa giác sơn màu xanh và tất cả các đường chéo của đa giác đó sơn màu đỏ. Gọi $X$ là tập hợp tất cả các tam giác có ba đỉnh là các đỉnh của đa giác đều trên. Người ta chọn ngẫu nhiên từ $X$ một tam giác. Xác suất để chọn được tam giác có ba cạnh cùng màu là $frac(a, b)$ $( a ∈ ℕ ","  b ∈ ℕ ^(*)$ và $frac(a, b)$ là phân số tối giản). Khi đó $a + b$ bằng bao nhiêu?],
    statements: [],
    choices: (),
    solution: [Không gian mẫu: $n lr(( Ω )) = C _(20)^(3) = 1140 .$

Gọi biến cố $A$: “chọn được tam giác có ba cạnh cùng màu từ tập $X$”

Do tam giác có ba cạnh cùng màu nên ba cạnh là đường chéo của đa giác đều 20 đỉnh

(cùng màu đỏ)

Giả sử đa giác đều có 20 đỉnh là $A _(1) A _(2) A _(3) . . . A _(19) A _(20)$.

Chọn một đỉnh từ 20 đỉnh ta có $C_20^1$ cách. Ta còn 19 đỉnh.

Nếu chọn $A _(1)$ thì ta phải loại $A _(2)$ và $A _(20)$. Khi đó ta còn 17 đỉnh còn lại.

Ta sẽ chọn 2 đỉnh từ 17 đỉnh còn lại với điều kiện 2 đỉnh này không liền kề nhau nên có $C _(16)^(2)$cách chọn

Sau đó ta lần lượt chọn đỉnh ban đầu là $A _(2) "," A _(3) "," . . . "," A _(19) "," A _(20)$

Trong quá trình chọn đỉnh sẽ có 3 trường hợp bị lặp lại.

Khi đó: $n lr(( A )) = frac(C _(20)^(1) . C _(16)^(2), 3) = 800$

Vậy: $P lr(( A )) = frac(n lr(( A )), n lr(( Ω ))) = frac(800, 1140) = frac(40, 57)$ $⇒ a = 40 ","  b = 57 ⇒ a + b = 40 + 57 = 97 .$],
    answer: [97],
    qfig: none, sfig: none, width: 65mm, lines: 8),
  (key: "III-3", section: "III", number: 3,
    stem: [Trong không gian với hệ toạ độ $O x y z$, cho ba điểm $A "," B "," C$ biết $arrow(A B) lr(( 3 ";" - 3 ";" 3 ))$, $arrow(A C) lr(( - 3 ";" 3 ";" - 9 ))$. Điểm $M$ thuộc đoạn $B C$ thoả mãn $2 B M = M C$. Gọi $lr(( a ";" b ";" c ))$ là toạ độ $arrow(A M)$. Tính $26 a + b - 2001 c .$],
    statements: [],
    choices: (),
    solution: [Do điểm $M$ thuộc đoạn $B C$ thoả mãn $2 B M = M C$ nên $arrow(B M) = frac(1, 3) arrow(B C) .$

Khi đó $ arrow(A M) &= arrow(A B)+arrow(B M)=arrow(A B)+1/3 arrow(B C) \ &=arrow(A B)+1/3(arrow(A C)-arrow(A B))=2/3 arrow(A B)+1/3 arrow(A C). $

Mà $arrow(A B) lr(( 3 ";" - 3 ";" 3 ))$, $arrow(A C) lr(( - 3 ";" 3 ";" - 9 ))$ nên $arrow(A M) lr(( 1 ";" - 1 ";" - 1 ))$.

Vậy $26 a + b - 2001 c = 26 . 1 - 1 - 2001 . ( - 1 ) = 2026 .$],
    answer: [2026],
    qfig: none, sfig: none, width: 65mm, lines: 8),
  (key: "III-4", section: "III", number: 4,
    stem: [Cho hình chóp $S . A B C D$ có đáy là hình vuông và $S A$ vuông góc với đáy, $S A = 3 "," A B = 2$. Tính khoảng cách từ điểm $C$ đến mặt phẳng $lr(( S B D ))$ (làm tròn đến hàng phần trăm).],
    statements: [],
    choices: (),
    solution: [Ta có $d(C,(S B D))/d(A,(S B D))=frac(O C,O A)=1.$ Suy ra $d(C,(S B D))=d(A,(S B D))$. Kẻ $A H ⊥ S O ⇒ A H ⊥ lr(( S B D )) ⇒ d lr(( A "," lr(( S B D )) )) = A H$

Ta có $1/(A H)^2=1/(S A)^2+1/(A O)^2=1/3^2+1/(sqrt(2))^2.$ Suy ra $A H=(3 sqrt(22))/11 approx "1,28"$. Vậy $d lr(( C "," lr(( S B D )) )) = A H ≈ "1,28"$.],
    answer: [1,28],
    qfig: pyramid(), sfig: pyramid(detail:true), width: 55mm, lines: 8),
  (key: "III-5", section: "III", number: 5,
    stem: [Một công viên nhỏ trong một khu dân cư có dạng hình chữ nhật với chiều rộng là 40 m và chiều dài là 60 m. Ban quản lý lát gạch phần đất dạng parabol và hình tròn bán kính 10 m như hình vẽ. Phần còn lại sẽ trồng cỏ và cây xanh. Ban quản lý dự định làm một đoạn đường nhỏ nối hai phần lát gạch. Biết $A B = 20 "m" "," O H = 30 "m"$, hỏi chiều dài ngắn nhất của đoạn đường đó là bao nhiêu mét (làm tròn đến hàng phần chục)?],
    statements: [],
    choices: (),
    solution: [Gắn hệ trục toạ độ như hình vẽ. Ta có $B ( 10 ";" - 30 ) "," I ( 20 ";" 20 )$. Vì parabol có đỉnh là $O$ nên có phương trình dạng $y = a x ^(2) ( * )$. Thay toạ độ $B$ vào (∗) ta được $a = - frac(3, 10)$.

Gọi $M lr(( x ";" - frac(3 x ^(2), 10) ))$ là điểm thuộc parabol với $x ∈ [ 0 ";" 10 ]$. Ta có $I M=sqrt((x-20)^2+(3/10 x^2+20)^2).$ Giá trị nhỏ nhất của $I M$ xấp xỉ 27,7 m. Độ dài ngắn nhất của đoạn đường là $"27,7"-10="17,7"$ m.],
    answer: [17,7],
    qfig: park(), sfig: park(detail:true), width: 47mm, lines: 8),
  (key: "III-6", section: "III", number: 6,
    stem: [Cho một nhóm $15$ học sinh có chiều cao khác nhau gồm $5$ học sinh nữ có chiều cao tăng dần ký hiệu lần lượt là $G _(1) "," G _(2) "," G _(3) "," G _(4) "," G _(5)$ và $10$ học sinh nam. Hỏi có bao nhiêu cách xếp $15$ học sinh đó thành một hàng ngang sao cho nếu tính từ trái sang phải thì các học sinh nữ có chiều cao tăng dần, các học sinh nam cũng có chiều cao tăng dần; giữa học sinh $G _(1)$ và $G _(2)$ có ít nhất $2$ học sinh nam, giữa học sinh $G _(4)$ và $G _(5)$ có ít nhất $1$ học sinh nam và nhiều nhất $4$ học sinh nam?],
    statements: [],
    choices: (),
    solution: [Gọi $x _(1)$ là số học sinh nam được xếp bên trái $G _(1)$,

$x _(2)$ là số học sinh nam được xếp giữa $G _(1)$ và $G _(2)$,

$x _(3)$ là số học sinh nam được xếp giữa $G _(2)$ và $G _(3)$,

$x _(4)$ là số học sinh nam được xếp giữa $G _(3)$ và $G _(4)$,

$x _(5)$ là số học sinh nam được xếp giữa $G _(4)$ và $G _(5)$,

$x _(6)$ là số học sinh nam được xếp bên phải $G _(5)$.

Khi đó bộ số $( x _(1) ";" x _(2) ";" x _(3) ";" x _(4) ";" x _(5) ";" x _(6) )$ hoàn toàn xác định vị trí của các học sinh nữ và ta có $cases(display(x _(1) + x _(2) + x _(3) + x _(4) + x _(5) + x _(6) = 10), display(x _(1) "," x _(3) "," x _(4) "," x _(6) ≥ 0 ";" x _(2) ≥ 2 ";" 1 ≤ x _(5) ≤ 4))$

Đặt $y _(1) = x _(1) + 1 "," y _(2) = x _(2) - 1 ";" y _(3) = x _(3) + 1 "," y _(4) = x _(4) + 1 "," y _(6) = x _(6) + 1$.

Khi đó số cách xếp thỏa mãn yêu cầu là số nghiệm nguyên dương ($y _(1) "," y _(2) "," y _(3) "," y _(4) "," y _(6)$) của phương trình $y _(1) + y _(2) + y _(3) + y _(4) + y _(6) = 13 - x _(5)$, với $1 ≤ x _(5) ≤ 4$.

+) Xét $x _(5) = 1$, ta có $y _(1) + y _(2) + y _(3) + y _(4) + y _(6) = 12$. Ta xét dãy gồm $12$ chữ số $1$ như sau:

$1 - 1 - 1 - 1 - 1 - 1 - 1 - 1 - 1 - 1 - 1 - 1$.

Giữa hai số $1$ liên tiếp có một khoảng trống. Ta chỉ cần chọn 4 vị trí khoảng trống để ngăn cách sẽ tạo thành $5$ đoạn ứng với bộ $(y_1;y_2;y_3;y_4;y_6)$. Vậy số nghiệm trong trường hợp này là $C_11^4$.

+) Xét $x_5=2$, lập luận tương tự ta có số nghiệm là $C_10^4$.

+) Xét $x _(5) = 3$, lập luận tương tự ta có số nghiệm là $C _(9)^(4)$

+) Xét $x _(5) = 4$, lập luận tương tự ta có số nghiệm là $C _(8)^(4)$

Vậy số cách xếp là $C _(11)^(4) + C _(10)^(4) + C _(9)^(4) + C _(8)^(4) = 736 .$],
    answer: [736],
    qfig: none, sfig: none, width: 65mm, lines: 8),
)
