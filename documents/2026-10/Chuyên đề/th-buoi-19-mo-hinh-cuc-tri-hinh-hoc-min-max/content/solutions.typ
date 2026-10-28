#import "../figures.typ": solution-figure
#import "../layout.typ": math-flow, aligned-math
#let solutions = (
"mau-1": [
Ta có: $d lr(( N ";" lr(( P )) )) ≤ M N ⇒ d lr(( N ";" lr(( P )) )) _(max) = M N$

$⇒ M N ⊥ lr(( P )) ⇒ arrow(n _(lr(( P )))) = arrow(M N) = lr(( 1 ";" - 1 ";" 1 ))$

#math-flow(([$lr(( P ))cases(display(text("qua") M lr(( - 1 ";" 2 ";" 4 ))), display(arrow(n _(lr(( P )))) = lr(( 1 ";" - 1 ";" 1 ))))$],))
 có phương trình: $x - y + z - 1 = 0$

$⇒ d lr(( O ";" lr(( P )) )) = frac(abs(- 1), sqrt(3)) = frac(sqrt(3), 3)$.

*Chọn A.*
],
"mau-2": [
Gọi $lr(( P ))$ là mặt phẳng qua $B$ và $d ⊥ lr(( P )) ⇒ arrow(n _(lr(( P )))) = arrow(u _(d)) = lr(( 2 ";" 1 ";" 1 ))$

$⇒$ phương trình $lr(( P )) : 2 x + y + z - 1 = 0$

#math-flow(([$cases(display(Δ text("qua") B), display(Δ ⊥ d))$],[$⇒ Δ ⊂ lr(( P ))$],))

Gọi $H$ là hình chiếu vuông góc của $A$ trên $lr(( P ))$

$K$ là hình chiếu vuông góc của $A$ trên $Δ$

$⇒ A K ≥ A H ⇒ A K _(min) = A H$

$⇒$ đường thẳng $Δ$ qua $B$ và qua $H$

Gọi $lr(( γ ))$ là đường thẳng qua $A$ và vuông góc với $lr(( P ))$

$⇒$ phương trình 
#math-flow(([$lr(( γ )) : cases(display(x = 6 + 2 t), display(y = 3 + t), display(z = - 2 + t))$],))

$H ∈ lr(( γ )) ⇒ H lr(( 6 + 2 t ";" 3 + t ";" - 2 + t ))$

$H ∈ lr(( P )) ⇒ 2 lr(( 6 + 2 t )) + lr(( 3 + t )) + lr(( - 2 + t )) - 1 = 0 ⇔ 6 t + 12 = 0 ⇔ t = - 2$

$⇒ H lr(( 2 ";" 1 ";" - 4 ))$ mà $B lr(( 1 ";" 0 ";" - 1 )) ⇒ arrow(B H) = lr(( 1 ";" 1 ";" - 3 ))$

$⇒ arrow(u _(Δ)) = arrow(B H) = lr(( 1 ";" 1 ";" - 3 ))$.

*Chọn B.*
],
"mau-3": [
Gọi $H$ là hình chiếu của $M$ trên $lr(( P ))$

$K$ là hình chiếu của $M$ trên $Δ$

$⇒ M H ≤ M K ⇒ M H _(max) = M K$

$⇒arrow(M K)$ là vecto pháp tuyến của $lr(( P ))$

Tìm $K$ là hình chiếu vuông góc của $M$ trên $Δ$

$t = 1 ⇒ K lr(( 3 ";" 1 ";" 4 ))$

$⇒ arrow(M K) = lr(( 1 ";" - 4 ";" 1 ))⇒$ chỉ có đáp án C đúng

*Chọn C.*
],
"mau-4": [
#solution-figure("angle-example")

Ta có: 
#math-flow(([$cases(display(arrow(u _(Δ)) = lr(( 2 ";" 1 ";" - 1 ))), display(arrow(n _(lr(( P )))) = lr(( 2 ";" - 1 ";" 2 ))))$],))

Lấy $I ∈ Δ$

Gọi $H$ là hình chiếu vuông góc của $I$ trên $lr(( P ))$

Kẻ $H K$ vuông góc với giao tuyến $d$ của $lr(( P ))$ và $lr(( Q ))lr(( K ∈ d ))$

$⇒ ∠ lr(( lr(( P )) ";" lr(( Q )) )) = ∠ I K H ⇒ sin I K H = frac(I H, I K)$

Do $I H$ là hằng số, để $∠ I K H$ nhỏ nhất $⇔ I K max$

Mà $I K ≤ I E lr(( E = Δ ∩ lr(( P )) )) ⇒ I K max = I E$

$⇒ ∠ lr(( lr(( P )) ";" lr(( Q )) )) min = ∠ I E H$

Khi đó: 
#math-flow(([$cases(display(d ⊥ Δ), display(arrow(u _(d)) ⊥ arrow(n _(lr(( P ))))))$],[$⇒ arrow(u _(d))$],[$= lr([ arrow(u _(Δ)) ";" arrow(n _(lr(( P )))) ])$],[$= lr(( 1 ";" - 6 ";" - 4 ))$],))

$⇒ arrow(n _(lr(( Q )))) = lr([ arrow(u _(d)) ";" arrow(u _(Δ)) ]) = lr(( 10 ";" - 7 ";" 13 ))$

#math-flow(([$⇒ cases(display(a = - 7), display(b = 13))$],[$⇒ a + b$],[$= - 7 + 13$],[$= 6$],))
.

*Chọn C.*
],
"mau-5": [
Ta có: mặt cầu $lr(( S ))$ có 
#math-flow(([$cases(display(text("tâm") I lr(( 1 ";" - 2 ";" - 3 ))), display(R = 5))$],))

$⇒ I A = 3 < R ⇒ A$ nằm trong mặt cầu

Khi đó: $M H ^(2) = R ^(2) - I H ^(2)$ (với $H$ là trung điểm của $M N$)

Để $M N _(min) ⇔ M H _(min) ⇔ I H _(max)$

Mà $I H ≤ I A ⇒ I H _(max) = I A$

$⇒ M N _(min) = 2 M H = 2 sqrt(R ^(2) - I A ^(2)) = 2 . sqrt(5 ^(2) - 3 ^(2)) = 8$.

*Chọn A.*
],
"mau-6": [
#solution-figure("sphere-origin")

Gọi 
#math-flow(([$M lr(( x ";" y ";" z ))$],[$⇒ cases(display(M A ^(2) = lr(( x + 2 )) ^(2) + lr(( y - 2 )) ^(2) + lr(( z + 2 )) ^(2)), display(M B ^(2) = lr(( x - 3 )) ^(2) + lr(( y + 3 )) ^(2) + lr(( z - 3 )) ^(2)))$],))

Theo yêu cầu bài toán: $frac(M A, M B) = frac(2, 3) ⇔ 9 M A ^(2) = 4 M B ^(2)$

#math-flow(([$⇔ 9 lr([ lr(( x + 2 )) ^(2) + lr(( y - 2 )) ^(2) + lr(( z + 2 )) ^(2) ])$],[$= 4 lr([ lr(( x - 3 )) ^(2) + lr(( y + 3 )) ^(2) + lr(( z - 3 )) ^(2) ])$],))

$⇔ 5 lr(( x ^(2) + y ^(2) + z ^(2) )) + 60 x - 60 y + 60 z = 0$

$⇔ x ^(2) + y ^(2) + z ^(2) + 12 x - 12 y + 12 z = 0$

$⇒ M$ thuộc mặt cầu 
#math-flow(([$lr(( S )) cases(display(text("tâm") I lr(( - 6 ";" 6 ";" - 6 ))), display(R = 6 sqrt(3)))$],))

$⇒ O M _(max) = O I + R = 6 sqrt(3) + 6 sqrt(3) = 12 sqrt(3)$.

*Chọn A.*
],
"mau-7": [
Theo giả thiết $M A = 2 M B ⇒ M A ^(2) = 4 M B ^(2)$

Gọi 
#math-flow(([$M lr(( x ";" y ";" z ))$],[$⇒ cases(display(M A ^(2) = lr(( x - 1 )) ^(2) + lr(( y - 2 )) ^(2) + lr(( z - 3 )) ^(2)), display(M B ^(2) = x ^(2) + lr(( y - 4 )) ^(2) + lr(( z - 5 )) ^(2)))$],))

#math-flow(([$⇒ lr(( x - 1 )) ^(2) + lr(( y - 2 )) ^(2) + lr(( z - 3 )) ^(2)$],[$= 4 lr([ x ^(2) + lr(( y - 4 )) ^(2) + lr(( z - 5 )) ^(2) ])$],))

$⇔ 3 lr(( x ^(2) + y ^(2) + z ^(2) )) + 2 x - 28 y - 34 z + 150 = 0$

$⇔ x ^(2) + y ^(2) + z ^(2) + frac(2, 3) x - frac(28, 3) y - frac(34, 3) z + 50 = 0$

$⇒ M ∈$ mặt cầu 
#math-flow(([$lr(( S )) cases(display(text("tâm") I lr(( - frac(1, 3) ";" frac(14, 3) ";" frac(17, 3) ))), display(R = 2))$],))

Ta có: $d lr(( I ";" lr(( P )) )) = frac(29, 9) > R ⇒ lr(( P ))$ không cắt $lr(( S ))$

$⇒ d lr(( M ";" lr(( P )) )) min = d lr(( I ";" lr(( P )) )) - R = frac(29, 9) - 2 = frac(11, 9)$.

*Chọn D.*
],
"mau-8": [
Gọi $lr(( C ))$ là đường giao tuyến của $lr(( S ))$ và $lr(( O x y ))⇒ M ∈ lr(( C ))$

Ta có: 
#math-flow(([$cases(display(R = 5), display(d lr(( I ";" lr(( O x y )) )) = abs(z _(I)) = 3))$],))

$⇒ r _(lr(( C ))) = sqrt(R ^(2) - d ^(2) lr(( I ";" lr(( O x y )) ))) = 4$

Vì $A lr(( 0 ";" 2 ";" 0 )) ∈ lr(( O x y )) ⇒$ Mô hình cực trị thuộc $lr(( O x y ))$

#math-flow(([$⇒ cases(display(A M _(max) = r _(lr(( C ))) + A H), display(A M _(min) = abs(r _(lr(( C ))) - A H)))$],))

Gọi $H$ là hình chiếu của $I lr(( - 1 ";" 2 ";" 3 ))$ trên $lr(( O x y )) ⇒ H lr(( - 1 ";" 2 ";" 0 ))$

#math-flow(([$⇒ A H$],[$= 1$],[$⇒ cases(display(A M _(max) = r _(lr(( C ))) + A H = 4 + 1 = 5), display(A M _(min) = abs(4 - 1) = 3))$],))

#math-flow(([$⇒ cases(display(m = 5), display(n = 3))$],[$⇒ m + n$],[$= 5 + 3$],[$= 8$],))

*Chọn B.*
],
"mau-9": [
Mặt cầu $lr(( S ))$ có 
#math-flow(([$cases(display(text("tâm") I lr(( - 1 ";" 2 ";" 1 ))), display(R = sqrt(1 ^(2) + 2 ^(2) + 1 ^(2) - 5) = 1))$],))

$⇒ d lr(( I ";" lr(( P )) )) = frac(abs(- 1 - 4 + 2 - 3), 3) = 2 > R$

$⇒ lr(( S ))$ và $lr(( P ))$ không có điểm chung

Ta có: 
#math-flow(([$cases(display(arrow(u) = lr(( 1 ";" 0 ";" 1 ))), display(arrow(n _(lr(( P )))) = lr(( 1 ";" - 2 ";" 2 ))))$],[$⇒ cos lr(( arrow(u) ";" arrow(n _(lr(( P )))) ))$],[$= frac(3, sqrt(2) . 3)$],[$= frac(sqrt(2), 2)$],))

$⇒ ∠ lr(( arrow(u) ";" arrow(n _(lr(( P )))) )) = 45 degree ⇒ ∠ lr(( M N ";" lr(( P )) )) = 45 degree$

Gọi $H$ là hình chiếu vuông góc của $N$ trên $lr(( P ))$

$⇒ M N = frac(N H, sin 45 degree) = sqrt(2) . N H$

$⇒ M N _(max) ⇔ N H _(max)$. Khi đó $N H _(max) = d lr(( I ";" lr(( P )) )) + R = 2 + 1 = 3$

$⇒ M N _(max) = sqrt(2) . N H _(max) = 3 sqrt(2)$.

*Chọn C.*
],
"tu-luyen-1": [
*Chọn C*

Ta có: $d lr(( M "," lr(( P )) )) ≤ M A$

Nên $d lr(( M "," lr(( P )) )) _(max) = M A$ khi $A$ là hình chiếu của $M$ trên mặt phẳng $lr(( P ))$ .

Suy ra $A M ⊥ lr(( P )) ⇒ arrow(A M) = lr(( - 3 ";" - 3 ";" - 3 ))$ là vectơ pháp tuyến của $lr(( P ))$ .

$lr(( P ))$ đi qua $A lr(( 1 ";" 7 ";" 2 ))$ và nhận $arrow(A M) = lr(( - 3 ";" - 3 ";" - 3 ))$ là vectơ pháp tuyến nên có phương trình

$- 3 lr(( x - 1 )) - 3 lr(( y - 7 )) - 3 lr(( z - 2 )) = 0 ⇔ x + y + z - 10 = 0$ .
],
"tu-luyen-2": [
*Chọn D*

#solution-figure("angle-practice")

Đường thẳng $Δ : frac(x, 2) = frac(y, 2) = frac(z, 1)$ được viết lại dưới dạng tham số 
#math-flow(([$Δ : cases(display(x = 2 t), display(y = 2 t), display(z = t))$],))

Xét hệ phương trình 
#math-flow(([$cases(display(x = 2 t), display(y = 2 t), display(z = t), display(x + 2 y - 2 z = 0))$],[$⇔ cases(display(t = 0), display(x = 0), display(y = 0), display(z = 0))$],))
. Do đó $Δ$ cắt $lr(( P ))$ tại điểm $A lr(( 0 ";" 0 ";" 0 )) ≡ "O"$.

Lại có $Δ$ và $lr(( P ))$ không vuông góc nhau nên ta đi chứng minh góc nhỏ nhất giữa $lr(( P ))$ và $lr(( Q ))$ là góc giữa $Δ$ và $lr(( P ))$. Thật vậy trên $Δ$ lấy $B$ khác $A$, kẻ $B H$ vuông góc với $lr(( P ))$ tại $H$ và $B K$ vuông góc $d$ tại $K$ ($d$ là giao tuyến của $lr(( P ))$ và $lr(( Q ))$) tại $K$. Khi đó góc giữa $lr(( Q ))$ và $lr(( P ))$ là góc $hat(B K H)$.

$H A ≥ H K ⇒tan hat(B K H) = frac(B H, H K) ≥ frac(B H, H A) = tan hat(B A H)$

#math-flow(([$cases(display(hat(B K H) "," hat(B A H) < 90 degree), display(tan hat(B K H) ≥ tan hat(B A H)))$],[$⇒ hat(B K H)$],[$≥ hat(B A H)$],[$= lr(( hat(Δ "," lr(( P ))) ))$],[$= arcsin frac(4, 9)$],))

Đẳng thức xảy ra $⇔ K ≡ A ⇔ Δ ⊥ d .$

Do đó, góc giữa hai mặt phẳng $lr(( P ))$ và $lr(( Q ))$ là nhỏ nhất khi và chỉ khi $lr(( Q ))$ chứa $lr(( Δ ))$ và cắt $lr(( P ))$ theo một giao tuyến vuông góc $Δ$.

) Viết phương trình của $lr(( Q ))$

Đường thẳng $Δ$ có vectơ chỉ phương $arrow(u _(1)) = lr(( 2 ";" 2 ";" 1 ))$, $lr(( P ))$ có vectơ pháp tuyến $arrow(n _(1)) = lr(( 1 ";" 2 ";" - 2 ))$ nên $d$ có vectơ chỉ phương $arrow(u _(2)) = lr([ arrow(u _(1)) "," arrow(n _(1)) ]) = lr(( - 6 ";" 5 ";" 2 ))$.

$lr(( Q ))$ chứa $Δ$ và d nên nhận $arrow(n _(2)) = lr([ arrow(u _(2)) ";" arrow(u _(1)) ]) = lr(( 1 ";" 10 ";" - 22 ))$ làm vectơ pháp tuyến.

Vậy mặt phẳng $lr(( Q ))$ đi qua $A lr(( 0 ";" 0 ";" 0 ))$ và nhận $arrow(n _(2)) = lr(( 1 ";" 10 ";" - 22 ))$ làm vectơ pháp tuyến nên có phương trình $x + 10 y - 22 z = 0$.
],
"tu-luyen-3": [
*Chọn C*

#solution-figure("line-max")

Gọi $( P ' )$ chứa $A$ và song song $( P )$ suy ra $( P ' ) : x + y + 2 z - 4 = 0$.

Ta thấy $B ∈ ( P ' )$ do đó $d ( B "," d )$ đạt giá trị lớn nhất là $A B .$

Khi đó $d$ vuông góc với $A B$ và $d$ vuông góc với giá của $arrow(n)$ là VTPT của $( P )$.

Suy ra một VTCP của $d$ là $arrow(u) = lr([ arrow(n) "," arrow(A B) ]) = ( 2 ";" 2 ";" - 2 )$.

Kết hợp với điểm $A$ thuộc $d$ nên ta chọn đáp án C.
],
"tu-luyen-4": [
*Chọn A*

#solution-figure("angle-planes")

$d : frac(x, 1) = frac(y + 1, - 2) = frac(2 - z, 1)$ có VTCP $arrow(u) = lr(( 1 ";" - 2 ";" - 1 ))$.

$lr(( Q )) : 2 x - y - 2 z - 2 = 0$ có VTPT $arrow(n) = lr(( 2 ";" - 1 ";" - 2 ))$.

Gọi $α$ là góc tạo bởi $d$ và $lr(( Q ))$, ta có $sin α = abs(cos lr(( arrow(u) "," arrow(n) ))) = frac(sqrt(6), 3)$.

Từ hình vẽ, ta có $lr(( d "," lr(( Q )) )) = hat(M B H)$ và $lr(( lr(( P )) "," lr(( Q )) )) = hat(M C H)$.

Ta thấy $sin hat(M C H) = frac(M H, M C) ≥ frac(M H, M B) = frac(sqrt(6), 3)$.

Vậy góc $lr(( lr(( P )) "," lr(( Q )) )) = hat(M C H)$ nhỏ nhất khi $sin hat(M C H) = frac(sqrt(6), 3)$ hay $cos hat(M C H) = frac(sqrt(3), 3)$

Viết phương trình mặt phẳng (P)

*CÁCH 1:*

Mặt phẳng $lr(( P )) : A x + B y + C z + D = 0$

Ta có 
#math-flow(([$cases(display(arrow(n _(lr(( P )))) . arrow(u) = 0), display(cos lr(( arrow(n) "," arrow(n _(lr(( P )))) )) = frac(sqrt(3), 3)))$],[$⇔ cases(display(A - 2 B - C = 0), display(frac(abs(2 A - B - 2 C), 3 sqrt(A ^(2) + B ^(2) + C ^(2))) = frac(sqrt(3), 3)))$],))

#math-flow(([$⇔ cases(display(A = 2 B + C), display(abs(3 B) = sqrt(3 lr(( lr(( 2 B + C )) ^(2) + B ^(2) + C ^(2) )))))$],[$⇔ cases(display(A = 2 B + C), display(6 B ^(2) + 6 C ^(2) + 12 B C = 0 lr(( 1 ))))$],))

Nếu $B = 0$ suy ra $A = C = 0$ loại.

Nếu $B ≠ 0$ từ $lr(( 1 ))$ suy ra $lr(( frac(C, B) )) ^(2) + 2 frac(C, B) + 1 = 0 ⇔ frac(C, B) = - 1 ⇒ C = - B$ suy ra $A = B$.

Mặt phẳng $lr(( P )) : B x + B y - B z + D = 0$ đi qua điểm $N lr(( 0 ";" - 1 ";" 2 )) ∈ d$ suy ra $D = 3 B$.

Vậy phương trình mặt phẳng $lr(( P )) : x + y - z + 3 = 0$. Suy ra $d lr(( A ";" lr(( P )) )) = sqrt(3)$.

*CÁCH 2*

Gọi $Δ = ( P ) ∩ ( Q )$ thì góc giữa $( P )$ và $( Q )$ nhỏ nhất khi và chỉ khi $Δ ⊥ d$. Do đó, mặt phẳng (P) thỏa đề bài là mặt phẳng chứa $d$ và cắt (Q) theo giao tuyến $Δ$ sao cho $Δ ⊥ d$.

#math-flow(([$cases(display(Δ ⊂ ( Q )), display(Δ ⊥ d))$],[$⇒ Δ$],))
 nhận $"u" _(Δ) = lr([ arrow(u) _(d) "," arrow(n) _(Q) ]) $ làm vec tơ chỉ phương.

$ ( P )$ chứa $d$ và $Δ⇒ ( P )$ qua $M ( 0 ";" - 1 ";" 2 ) ∈ d$ và nhận $arrow(n) = lr([ arrow(u) _(d) "," arrow(u) _(Δ) ]) = ( 6 ";" 6 ";" - 6 )$ làm vectơ

pháp tuyến $⇒ std.box(stroke: #0.5pt, inset: #3pt, ( P ) : x + y - z + 3 = 0) .$ Vậy $d lr(( A ";" lr(( P )) )) = sqrt(3)$.
],
"tu-luyen-5": [
*Chọn A*

#solution-figure("angle-axis")

Chứng minh góc giữa (P) và (Q) bé nhất là góc giữa Ox và (P).

Giả sử $(Q) equiv (A K I)$. Ta có $lr(( lr(( P )) "," lr(( Q )) )) = hat(A K I)$ , $lr(( O x "," lr(( P )) )) = hat(A I H)$

Xét $Δ A H I "," Δ A H K$ là tam giác vuông chung cạnh AH.

#math-flow(([$Δ I H K "," hat(K)$],[$= 90 °$],[$⇒ H K$],[$≤ H I$],[$⇒ hat(K "A" H)$],[$≤ hat(I A H)$],[$⇔ 90 ° - hat(A K H)$],[$≤ 90 ° - hat(A I H)$],[$⇒ hat(A K H)$],[$≥ hat(A I H)$],))

$O x$ có VTCP $arrow(i) lr(( 1 ";" 0 ";" 0 ))$

$lr(( P ))$ có VTPT $arrow(n) _(P) = lr(( 1 ";" - 1 ";" 2 ))$

Góc giữa $O x$ và mặt phẳng $lr(( P ))$ là $α$ : $sin α = frac(abs(arrow(i) . arrow(n) _(P)), abs(arrow(i)) . abs(arrow(n) _(P))) = frac(1, sqrt(6))$

Góc giữa $lr(( Q ))$ và mặt phẳng $lr(( P ))$ thoả: 
#aligned-math[$ cos α &= frac(abs(arrow(n) _(P) . arrow(n) _(Q)), abs(arrow(n) _(P)) . abs(arrow(n) _(Q))) \
&= sqrt(1 - sin ^(2) α) \
&= frac(sqrt(5), sqrt(6)) $]
 .

Phương trình mặt phẳng $lr(( Q )) : B y + C z = 0$

Ta có: 
#math-flow(([$vec(frac(abs(- B + 2 C), sqrt(B ^(2) + C ^(2)) . sqrt(6)) = frac(sqrt(5), sqrt(6)) ⇔ abs(- B + 2 C) = sqrt(5 B ^(2) + 5 C ^(2)), ⇔ 4 B ^(2) + 4 B C + C ^(2) = 0 ⇔ C = - 2 B, delim: #none)$],))

Chọn B = 1, C = -2.
],
"tu-luyen-6": [
*Chọn D*

#solution-figure("sphere-section")

Mặt cầu $lr(( S ))$ có tâm $I lr(( 1 ";" 2 ";" 3 ))$, bán kính $R = 3$.

Ta có $I A = sqrt(6) < R⇒ A$ nằm trong mặt cầu $lr(( S ))$.

Do đó mặt phẳng $lr(( P ))$ qua $A$ luôn cắt mặt cầu $lr(( S ))$ theo thiết diện là hình tròn $lr(( C ))$ có bán kính $r = sqrt(R ^(2) - I H ^(2))$(với $H$ là hình chiếu của $I lr(( 1 ";" 2 ";" 3 ))$ trên $lr(( P ))$).

Ta luôn có $I A ≥ I H ⇒ sqrt(R ^(2) - I H ^(2)) ≥ sqrt(R ^(2) - I A ^(2)) ⇒ r ≥ sqrt(R ^(2) - I A ^(2))$.

Diện tích của hình tròn $lr(( C ))$ nhỏ nhất khi bán kính $r$ nhỏ nhất, tức là $r = sqrt(R ^(2) - I A ^(2)) ⇔ H ≡ A$.

Khi đó $I A ⊥ lr(( P ))⇒$ mặt phẳng $lr(( P ))$ nhận $arrow(I A) = lr(( - 1 ";" - 2 ";" - 1 ))$ làm một VTPT.

Vậy phương trình mặt phẳng $lr(( P ))$: $- x - 2 y - lr(( z - 2 )) = 0 ⇔ x + 2 y + z - 2 = 0 .$
],
"tu-luyen-7": [
*Chọn A*

#solution-figure("sphere-center")

Ta có $( P ) : x + y - z - 1 = 0 "," G = A B ∩ ( P )$

Thế điểm $A ( - 4 ";" 1 ";" 5 ) "," B ( 6 ";" - 1 ";" 1 )$ vào phương trình mặt phẳng thì ta thấy

$( x _(A) + y _(A) - z _(A) - 1 ) ( x _(B) + y _(B) - z _(B) - 1 ) < 0⇒ A$ và $B$ nằm khác phía so với mặt phẳng $( P )$.

Ta có: $arrow(A B) = ( 10 ";" - 2 ";" - 4 ) ⇒ arrow(u) = ( - 5 ";" 1 ";" 2 )$ là VTCP của $A B$.

Gọi $E$ là trung điểm của $A B$ với $E ( 1 ";" 0 ";" 3 )$ và $F$ là hình chiếu của $A$ lên mặt phẳng $( P )$.

Gọi $I$ là tâm của mặt cầu $( S )$ cần tìm. Vì $I ∈ ( P )$ nên suy ra điểm $I$ phải thuộc giao tuyến giữa mặt phẳng $( P )$ và mặt phẳng trung trực của $A B$ là $( Q )$ với $arrow(n _(( Q ))) = arrow(u) = ( - 5 ";" 1 ";" 2 )$

Suy ra mặt phẳng $( Q ) : - 5 x + y + 2 z - 1 = 0$.

Vậy để bán kính mặt cầu $( S )$ nhỏ nhất thì tâm $I$ phải thuộc cả mặt phẳng $( A E F )$

Ta có: 
#math-flow(([$( A B ) : cases(display(x = - 4 - 5 t), display(y = 1 + t), display(z = 5 + 2 t)) ( t ∈ R )$],))
 mà $G = A B ∩ ( P )$ nên

Suy ra 
#math-flow(([$- 4 - 5 t + 1 + t - 5 - 2 t - 1$],[$= 0$],[$⇔ t$],[$= - frac(3, 2)$],[$⇒ G lr(( frac(7, 2) ";" frac(- 1, 2) ";" 2 ))$],[$⇒ cases(display(arrow(A G) = lr(( frac(15, 2) ";" frac(- 3, 2) ";" - 3 ))), display(arrow(E G) = lr(( frac(5, 2) ";" frac(- 1, 2) ";" - 1 ))))$],))

#math-flow(([$⇒ cases(display(A G = frac(3 sqrt(30), 2)), display(E G = frac(sqrt(30), 2)))$],[$⇒ cases(display(A F = d ( A ";" ( P ) ) = 3 sqrt(3)), display(G F = sqrt(G A ^(2) - A F ^(2)) = frac(9 sqrt(2), 2)))$],[$⇒ cases(display(frac(G E, G F) = frac(I E, A F)), display(I E = frac(G E . A F, G F) = sqrt(5)))$],))

Vậy suy ra bán kính nhỏ nhất của mặt cầu $( S )$ là $I A = sqrt(I E ^(2) + frac(A B ^(2), 4)) = sqrt(35)$.

*Cách 2.*

Mặt phẳng trung trực đoạn $A B$ có phương trình là $( Q ) : - 5 x + y + 2 z - 1 = 0$.

Gọi $I$ là tâm mặt cầu. Khi đó $I ∈ Δ = lr(( P )) ∩ lr(( Q ))$.

Tọa độ điểm $I$ thỏa mãn hệ 
#math-flow(([$cases(display(- 5 x + y + 2 z - 1 = 0), display(x + y - z - 1 = 0))$],))
.

Cho $x = t ⇒ z = 2 t "," y = t + 1 ⇒ I lr(( t ";" t + 1 ";" 2 t ))$.

Khi đó 
#math-flow(([$R ^(2)$],[$= I A ^(2)$],[$= lr(( t + 4 )) ^(2) + t ^(2) + lr(( 2 t - 5 )) ^(2)$],[$= 6 lr(( t - 1 )) ^(2) + 35$],[$≥ 35$],))
.

Vậy $min R = sqrt(35)$.
],
"tu-luyen-8": [
Tìm quỹ tích điểm $M$

$d lr(( M ";" d )) = 2 ⇒ M$ thuộc mặt trụ có trục là đường thẳng $d$, bán kính bằng $2$

Ta thấy $d ⊥ lr(( P ))$ mà $M ∈ lr(( P ))$

$⇒ M$ thuộc đường tròn $lr(( C _(1) ))$ là giao tuyến của $lr(( P ))$ và mặt trụ, với $lr(( C _(1) )) ⊂ lr(( P ))$ và bán kính $R _(1) = 2 lr(( 1 ))$

Tìm quỹ tích điểm $N$

Gọi $N lr(( x ";" y ";" z ))$, theo giả thiết: $N A ^(2) = 4 N B ^(2)$

#math-flow(([$⇔ lr(( x + 1 )) ^(2) + lr(( y + 3 )) ^(2) + lr(( z - 11 )) ^(2)$],[$= 4 lr([ lr(( x - frac(1, 2) )) ^(2) + y ^(2) + lr(( z - 8 )) ^(2) ])$],))

$⇔ 3 lr(( x ^(2) + y ^(2) + z ^(2) )) - 6 x - 6 y - 42 z + 126 = 0$

$⇔ x ^(2) + y ^(2) + z ^(2) - 2 x - 2 y - 14 z + 42 = 0$

#math-flow(([$⇒ N ∈ lr(( S )) cases(display(text("tâm") I _(2) lr(( 1 ";" 1 ";" 7 ))), display(text("bán kính") R _(2) = 3))$],))

Mà $N ∈ lr(( P )) : y - 1 = 0 ⇒ N ∈ lr(( C _(2) )) = lr(( P )) ∩ lr(( S ))$

Nhận thấy $I _(2) lr(( 1 ";" 1 ";" 7 )) ∈ lr(( P )) ⇒ lr(( P ))$ qua tâm $I _(2)$ của $lr(( S ))$

#math-flow(([$⇒ N ∈ lr(( C _(2) )) cases(display(text("tâm") I _(2) lr(( 1 ";" 1 ";" 7 ))), display(text("bán kính") R _(2) = 3))$],))

Vậy mô hình cực trị:

#solution-figure("circles-apart")

$M N _(min) = I _(1) I _(2) - R _(1) - R _(2) = 6 - 2 - 3 = 1$.

*Chọn A.*
],
"tu-luyen-9": [
Mặt cầu $lr(( S ))$ có 
#math-flow(([$cases(display(text("tâm") I lr(( - 1 ";" 2 ";" 1 ))), display(R = sqrt(1 ^(2) + 2 ^(2) + 1 ^(2) - 5) = 1))$],))

$⇒ d lr(( I ";" lr(( P )) )) = frac(abs(- 1 - 4 + 2 - 3), 3) = 2 > R$

$⇒ lr(( S ))$ và $lr(( P ))$ không có điểm chung

Ta có: 
#math-flow(([$cases(display(arrow(u) = lr(( 1 ";" 0 ";" 1 ))), display(arrow(n _(lr(( P )))) = lr(( 1 ";" - 2 ";" 2 ))))$],[$⇒ cos lr(( arrow(u) ";" arrow(n _(lr(( P )))) ))$],[$= frac(3, sqrt(2) . 3)$],[$= frac(sqrt(2), 2)$],))

$⇒ ∠ lr(( arrow(u) ";" arrow(n _(lr(( P )))) )) = 45 degree ⇒ ∠ lr(( M N ";" lr(( P )) )) = 45 degree$

Gọi $H$ là hình chiếu vuông góc của $N$ trên $lr(( P ))$

$⇒ M N = frac(N H, sin 45 degree) = sqrt(2) . N H$

$⇒ M N _(max) ⇔ N H _(max)$. Khi đó $N H _(max) = d lr(( I ";" lr(( P )) )) + R = 2 + 1 = 3$

$⇒ M N _(max) = sqrt(2) . N H _(max) = 3 sqrt(2)$.

*Chọn C.*
],
"tu-luyen-10": [
Cần biết:

Cho đường tròn $lr(( C ))$ cố định và điểm $E$ nằm trong $lr(( C ))$

Đường thẳng $d$ thay đổi qua $E$ cắt $lr(( C ))$ tại hai điểm $A ";" B$

$⇒ A B$ ngắn nhất $⇔ I E ⊥ d$

Giải:

Mặt cầu $lr(( S ))$ có 
#math-flow(([$cases(display(text("tâm") I lr(( 3 ";" 2 ";" 5 ))), display(text("bán kính") R = 6))$],))

$⇒ I E = sqrt(1 ^(2) + 1 ^(2) + 2 ^(2)) = sqrt(6) < R ⇒ E$ nằm trong mặt cầu

#solution-figure("chord")

$lr(( P )) ∩ lr(( S )) = lr(( C )) ⇒ Δ ∩ lr(( S )) = Δ ∩ lr(( C )) = lr(\{ A ";" B \})$

#math-flow(([$⇒ A B _(min)$],[$⇔ Δ ⊥ H E$],[$⇒ cases(display(Δ ⊥ H E), display(Δ ⊥ I H))$],[$⇒ Δ ⊥ lr(( I H E ))$],[$⇒ cases(display(Δ ⊥ I E), display(Δ ⊥ arrow(n _(lr(( P ))))))$],))

Mà 
#math-flow(([$cases(display(arrow(I E) = lr(( - 1 ";" - 1 ";" - 2 ))), display(arrow(n _(lr(( P )))) = lr(( 2 ";" 2 ";" - 1 ))))$],[$⇒ arrow(u _(Δ))$],[$= lr([ arrow(I E) ";" arrow(n _(lr(( P )))) ])$],[$= lr(( 5 ";" - 5 ";" 0 ))$],[$= lr(( 1 ";" - 1 ";" 0 ))$],))

Chọn 
#math-flow(([$arrow(u)$],[$= lr(( - 2 ";" a ";" b ))$],[$⇒ arrow(u)$],[$= lr(( - 2 ";" 2 ";" 0 ))$],[$⇒ cases(display(a = 2), display(b = 0))$],[$⇒ S$],[$= a - b$],[$= 2 - 0$],[$= 2$],))
.

*Chọn A.*
],
"tu-luyen-11": [
*Chọn A*

#solution-figure("circle-diameter")

Mặt cầu $( S ) : ( x + 2 ) ^(2) + ( y - 4 ) ^(2) + z ^(2) = 39$ có tâm là $I lr(( - 2 ";" 4 ";" 0 ))$ , bán kính $R = sqrt(39)$ .

Gọi $M ( x "," y "," z ) ∈ ( S )$ . Ta có: $x ^(2) + y ^(2) + z ^(2) = 19 - 4 x + 8 y$ .

$M A ^(2) = ( x - 1 ) ^(2) + y ^(2) + z ^(2) = 20 - 6 x + 8 y$ .

$arrow(M B) = ( 2 - x ";" 1 - y ";" 3 - z )$ ; $arrow(M C) = ( - x ";" 2 - y ";" - 3 - z )$ .

#aligned-math[$ arrow(M B) . arrow(M C) &= - 2 x + x ^(2) + 2 - 3 y + y ^(2) - 9 + z ^(2) \
&= 19 - 4 x + 8 y - 2 x - 3 y - 7 \
&= - 6 x + 5 y + 12 $]
 .

Suy ra $M A ^(2) + 2 arrow(M B) . arrow(M C)= - 18 x + 18 y + 44$ .

Theo giả thiết $M A ^(2) + 2 arrow(M B) . arrow(M C) = 8⇔ - 18 x + 18 y + 44 = 8⇔ - x + y + 2 = 0$ .

Do đó $M ∈ ( P ) : - x + y + 2 = 0$ .

Ta có $d ( I ";" ( P ) ) = frac(abs(8), sqrt(2)) = sqrt(32) < sqrt(39)$ nên mặt phẳng $( P )$ cắt mặt cầu $( S )$ theo giao tuyến là đường tròn $lr(( C ))$ có bán kính $R _(1)$ với $R _(1) = sqrt(R ^(2) - d ^(2)) = sqrt(39 - 32) = sqrt(7)$ .

Mặt khác ta có 
#math-flow(([$cases(display(D "," M ∈ lr(( P ))), display(D "," M ∈ lr(( S ))))$],[$⇒D "," M ∈ ( C )$],))
 . Do đó độ dài $M D$ lớn nhất bằng $2 R _(1) = 2 sqrt(7)$ .
],
"tu-luyen-12": [
*Chọn D*

Vì $lr(( α ))$ qua A ta có: $- ( - 4 ) + c = 0 ⇒ c = - 4$.

Vì $lr(( α ))$ qua B ta có: $2 a + c = 0 ⇒ a = 2$.

$⇒lr(( α ))$: $2 x + b y - z - 4 = 0$.

Mặt cầu $( S )$ có tâm $I lr(( 1 ";" - 2 ";" 3 ))$,$R = 3 sqrt(3)$.

Chiều cao khối nón: 
#aligned-math[$ h &= d _(lr(( I "," α ))) \
&= frac(abs(2 - 2 b - 3 - 4), sqrt(4 + b ^(2) + 1)) \
&= frac(abs(2 b + 5), sqrt(b ^(2) + 5)) $]
.

Bán kính đường tròn: 
#aligned-math[$ r &= sqrt(R ^(2) - h ^(2)) \
&= sqrt(27 - lr(( frac(abs(2 b + 5), sqrt(b ^(2) + 5)) )) ^(2)) \
&= sqrt(27 - frac(lr(( 2 b + 5 )) ^(2), b ^(2) + 5)) $]
.

Thể tích khối nón: 
#aligned-math[$ V &= frac(1, 3) π r ^(2) h \
&= frac(1, 3) π lr(( 27 - frac(lr(( 2 b + 5 )) ^(2), b ^(2) + 5) )) frac(abs(2 b + 5), sqrt(b ^(2) + 5)) $]

Tới đây ta có thể Thử các trường hợp đáp án.

Hoặc ta làm tự luận như sau:

Đặt $t = frac(abs(2 b + 5), sqrt(b ^(2) + 5))$ và xét hàm số $f lr(( t )) = lr(( 27 - t ^(2) )) t$ trên đoạn $lr([ 0 ";" 3 sqrt(3) ])$.

Ta có: $f' lr(( t )) = 27 - 3 t ^(2)$;
#math-flow(([$f' lr(( t ))$],[$= 0$],[$⇔ lr(bracket.l vec(t = 3, t = - 3 lr(( l )), delim: #none) )$],))
. Ta có bảng biến thiên:

#solution-figure("variation")

Do đó thể tích khối nón lớn nhất khi và chỉ khi 
#math-flow(([$t$],[$= 3$],[$⇔ lr(( frac(abs(2 b + 5), sqrt(b ^(2) + 5)) )) ^(2)$],[$= 3 ^(2)$],[$⇔ 4 b ^(2) + 20 b + 25$],[$= 9 b ^(2) + 45$],))

$⇔ 5 b ^(2) - 20 b + 20 = 0 ⇔ b = 2$.

Vì vậy $a - b + c = - 4$.
],
"tu-luyen-13": [
*Chọn D*

#solution-figure("inversion")

Nhận xét: điểm $A "," B$ nằm ngoài mặt cầu $lr(( S ))$. Mặt cầu $lr(( S ))$ có tâm $I lr(( - 1 ";" 4 ";" 0 )) "," R = 2 sqrt(2)$.

Ta có: $I A = 4 sqrt(2) = 2 R "," E = I A ∩ lr(( S )) ⇒ E lr(( 1 ";" 2 ";" 0 ))$.

Gọi $F$ là trung điểm của $I E ⇒ F lr(( 0 ";" 3 ";" 0 ))$.

Tam giác $I F M$ và $I M A$ có $hat(A I M)$ chung và $frac(I F, I M) = frac(1, 2) = frac(I M, I A) ⇒ Δ A I M ∼ Δ M I F$.

Suy ra $frac(M A, F M) = frac(A I, M I) = 2 ⇒ M A = 2 M F$.

Ta có: $M A + 2 M B = 2 lr(( M F + M B )) ≥ 2 F B = 6 sqrt(2)$.

Vì $F$ nằm trong $lr(( S ))$ và $B$ nằm ngoài $lr(( S ))$ nên dấu $' ' = ' '$ xảy ra khi $M = B F ∩ lr(( S ))$.
],
)
