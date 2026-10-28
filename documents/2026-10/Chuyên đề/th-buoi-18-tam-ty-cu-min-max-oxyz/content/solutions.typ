#import "../figures.typ": diagram
#import "../layout.typ": math-flow, aligned-math
#let solutions = (
  "mau-1": [
Xét 
#aligned-math[$ P &= abs(arrow(M A) - arrow(M B) - arrow(M C)) \
&= abs(lr(( arrow(M I) + arrow(I A) )) - lr(( arrow(M I) + arrow(I B) )) - lr(( arrow(M I) + arrow(I C) ))) \
&= abs(- arrow(M I) + lr(( arrow(I A) - arrow(I B) - arrow(I C) ))) $]

Tìm điểm $I$ sao cho $lr(( arrow(I A) - arrow(I B) - arrow(I C) )) = arrow(0)$

Gọi 
#math-flow(([$I lr(( x ";" y ";" z ))$],[$⇒ cases(display(arrow(I A) = lr(( 8 - x ";" 5 - y ";" - 11 - z ))), display(arrow(I B) = lr(( 5 - x ";" 3 - y ";" - 4 - z ))), display(arrow(I C) = lr(( 1 - x ";" 2 - y ";" - 6 - z ))))$],))

#math-flow(([$⇒ arrow(I A) - arrow(I B) - arrow(I C)$],[$= arrow(0)$],[$⇔ cases(display(lr(( 8 - x )) - lr(( 5 - x )) - lr(( 1 - x )) = 0), display(lr(( 5 - y )) - lr(( 3 - y )) - lr(( 2 - y )) = 0), display(lr(( - 11 - z )) - lr(( - 4 - z )) - lr(( - 6 - z )) = 0))$],[$⇔ cases(display(x = - 2), display(y = 0), display(z = 1))$],[$⇒ I lr(( - 2 ";" 0 ";" 1 ))$],))

$⇒ P = abs(- arrow(M I)) = M I →$ đạt Min

Ta có: 
#math-flow(([$lr(( S )) : cases(display(text("tâm") H lr(( 2 ";" 4 ";" - 1 ))), display(R = 3))$],))

Có $I H = sqrt(4 ^(2) + 4 ^(2) + 2 ^(2)) = 6 > R ⇒ I$ nằm ngoài $lr(( S ))$

$⇒ I M _(min) = I H - R = 6 - 3 = 3$

Khi đó $M$ là trung điểm của 
#math-flow(([$I H$],[$⇒ M lr(( 0 ";" 2 ";" 0 ))$],[$⇒ cases(display(a = 0), display(b = 2), display(c = 0))$],))

Vậy $a + b = 0 + 2 = 2$.

*Chọn C.*
],
  "mau-2": [
#aligned-math[$ P &= abs(arrow(M A) - arrow(M B) + arrow(M C)) + abs(arrow(M B)) \
&= abs(arrow(M I) + lr(( arrow(I A) - arrow(I B) + arrow(I C) ))) + abs(arrow(M B)) $]

Tìm điểm $I$ sao cho $arrow(I A) - arrow(I B) + arrow(I C) = arrow(0)$ 
#math-flow(([$⇒ cases(display(x _(I) = frac(- 1 + 0 + 0, 1) = - 1), display(y _(I) = frac(0 + 1 + 0, 1) = 1), display(z _(I) = frac(1, 1) = 1))$],[$⇒ I lr(( - 1 ";" 1 ";" 1 ))$],))

$⇒ P = abs(arrow(M I)) + abs(arrow(M B)) = M I + M B →$ Đạt Min

Ta có: $lr(( 2 x _(I) - 2 y _(I) + z _(I) + 7 )) . lr(( 2 x _(B) - 2 y _(B) + z _(B) + 7 )) = 4 . 9 = 36 > 0$

$⇒ I "," B$ nằm cùng phía đối với $lr(( P ))$

Gọi $B '$ là điểm đối xứng của $B$ qua $lr(( P ))$

Gọi $Δ$ là đường thẳng qua $B$ và vuông góc với $lr(( P ))$

#v(2mm)
#align(center, diagram("reflection"))
#v(3mm)

$⇒$ Phương trình 
#math-flow(([$Δ : cases(display(x = 2 t), display(y = - 1 - 2 t), display(z = t))$],))

Gọi $H = Δ ∩ lr(( P )) ⇒ H lr(( 2 t ";" - 1 - 2 t ";" t )) ∈ Δ$

Mà $H ∈ lr(( P )) ⇒ 2 lr(( 2 t )) - 2 lr(( - 1 - 2 t )) + t + 7 = 0 ⇔ 9 t + 9 = 0 ⇔ t = - 1$

$⇒ H lr(( - 2 ";" 1 ";" - 1 ))$ $⇒ B ' lr(( - 4 ";" 3 ";" - 2 ))$

Khi $P = M I + M B = M I + M B ' ≥ I B '$

$⇒ P _(min) = I B ' = sqrt(22)$ khi $M = I B ' ∩ lr(( P ))$

*Chọn A.*
],
  "mau-3": [
*Chọn B*

Gọi $M = ( a ";" b ";" c )$.

Ta có $f(A) dot f(B)=(-34) dot (-68)=2312>0$.

Suy ra điểm $A ( - 8 ";" 1 ";" 1 )$ và điểm $B ( 2 ";" 1 ";" 3 )$ nằm về cùng 1 phía so với mặt phẳng $( P )$.

Khi đó $abs(M A - M B) ≤ A B$ (tính chất 3 cạnh của tam giác) suy ra $abs(M A - M B)$ đạt giá trị lớn nhất khi $M "," A "," B$ thẳng hàng và $M$ nằm ngoài đoạn thẳng $A B$ hay $M$ là giao điểm của đường thẳng $A B$ với $( P )$.

Đường thẳng $A B$ có véc tơ chỉ phương $arrow(A B) = ( 10 ";" 0 ";" 2 )$ và qua điểm $B ( 2 ";" 1 ";" 3 )$ nên có phương trình 
#math-flow(([$cases(display(x = 2 + 5 t), display(y = 1), display(z = 3 + t))$],))
Suy ra $- 4 ( 2 + 5 t ) - 3 . 1 + 3 ( 3 + t ) - 66 = 0 ⇔ - 17 t = 68 ⇔ t = - 4$.

Vậy $M ( - 18 ";" 1 ";" - 1 )$ hay $x _(0) y _(0) z _(0) = 18 .$
],
  "mau-4": [
Làm tương tự câu 2

Ta có: $I lr(( - 3 ";" 3 ";" 3 )) ∈ lr(( P ))$

$⇒ M I _(min)$ khi $M ≡ I ⇒ M lr(( - 3 ";" 3 ";" 3 ))$

#math-flow(([$⇒ cases(display(a = - 3), display(b = 3), display(c = 3))$],[$⇒ a + b + c$],[$= - 3 + 3 + 3$],[$= 3$],))
*Chọn C.*
],
  "mau-5": [
Ta có: 
#aligned-math[$ P &= 2 M A ^(2) - M B ^(2) \
&= 2 lr(( arrow(M A) )) ^(2) - lr(( arrow(M B) )) ^(2) \
&= 2 lr(( arrow(M I) + arrow(I A) )) ^(2) - lr(( arrow(M I) + arrow(I B) )) ^(2) $]

#math-flow(([$= lr(( arrow(M I) )) ^(2) + 2 lr(( arrow(I A) )) ^(2) - lr(( arrow(I B) )) ^(2) + 2 arrow(M I) lr(( 2 arrow(I A) - arrow(I B) ))$],[$= M I ^(2) + 2 I A ^(2) - I B ^(2) + 2 arrow(M I) lr(( 2 arrow(I A) - arrow(I B) ))$],))

Tìm điểm $I$ sao cho $2 arrow(I A) - arrow(I B) = arrow(0)$

#math-flow(([$⇒ cases(display(x _(I) = frac(5, 1) = 5), display(y _(I) = frac(5, 1) = 5), display(z _(I) = frac(- 1, 1) = - 1))$],[$⇒ I lr(( 5 ";" 5 ";" - 1 ))$],))

$⇒ P = M I ^(2) + 2 I A ^(2) - I B ^(2)$

Mà 
#math-flow(([$cases(display(I A = 3), display(I B = 6))$],[$⇒ P$],[$= M I ^(2) + 2 . 3 ^(2) - 6 ^(2)$],[$= M I ^(2) - 18$],))

#math-flow(([$⇒ cases(display(P _(min) text("khi") M I _(min)), display(P _(max) text("khi") M I _(max)))$],))

Ta có: mặt cầu $lr(( S ))$ có 
#math-flow(([$cases(display(text("tâm") H lr(( 1 ";" 2 ";" - 1 ))), display(R = 3))$],))

$⇒ I H = 5 > R ⇒ I$ nằm ngoài mặt cầu $lr(( S ))$

#math-flow(([$⇒ cases(display(M I _(min) = I H - R = 2 text("khi") M ≡ M _(1)), display(M I _(max) = I H + R = 8 text("khi") M ≡ M _(2)))$],))

#math-flow(([$⇒ cases(display(m = P _(max) = 8 ^(2) - 18 = 46), display(n = P _(min) = 2 ^(2) - 18 = - 14))$],[$⇒ m - n$],[$= 46 - lr(( - 14 ))$],[$= 60$],))

*Chọn C.*
],
  "mau-6": [
Ta có: 
#aligned-math[$ T &= 2 M A ^(2) + 3 M B ^(2) \
&= 2 lr(( arrow(M A) )) ^(2) + 3 lr(( arrow(M B) )) ^(2) \
&= 2 lr(( arrow(M I) + arrow(I A) )) ^(2) + 3 lr(( arrow(M I) + arrow(I B) )) ^(2) \
&= 5 M I ^(2) + 2 I A ^(2) + 3 I B ^(2) + 2 arrow(M I) . lr(( 2 arrow(I A) + 3 arrow(I B) )) $]

Tìm $I$ sao cho: $2 arrow(I A) + 3 arrow(I B) = arrow(0)$

#math-flow(([$⇒ cases(display(x _(I) = frac(- 5, 5) = - 1), display(y _(I) = frac(5, 5) = 1), display(z _(I) = frac(5, 5) = 1))$],[$⇒ I lr(( - 1 ";" 1 ";" 1 ))$],))
 $⇒ T = 5 M I ^(2) + lr(( 2 I A ^(2) + 3 I B ^(2) ))$

Mà 
#math-flow(([$cases(display(I A ^(2) = 27), display(I B ^(2) = 12))$],[$⇒ T$],[$= 5 M I ^(2) + 90$],))

$T _(min) ⇔ M I _(min) ⇔ M$ là hình chiếu vuông góc của $I$ trên mặt phẳng $lr(( P ))$

$⇒ M I _(min) = d lr(( I ";" lr(( P )) )) = frac(abs(- 2 - 1 + 2 - 8), 3) = 3$

$⇒ T _(min) = 5 . 3 ^(2) + 90 = 135$.

*Chọn A.*
],
  "mau-7": [
Ta có: 
#aligned-math[$ P &= M A ^(2) - 2 M B ^(2) \
&= lr(( arrow(M A) )) ^(2) - 2 lr(( arrow(M B) )) ^(2) \
&= lr(( arrow(M I) + arrow(I A) )) ^(2) - 2 lr(( arrow(M I) + arrow(I B) )) ^(2) \
&= - M I ^(2) + lr(( I A ^(2) - 2 I B ^(2) )) + 2 arrow(M I) lr(( arrow(I A) - 2 arrow(I B) )) $]

Tìm điểm $I$ sao cho $arrow(I A) - 2 arrow(I B) = arrow(0)$ $⇒ I lr(( 3 ";" - 4 ";" 5 ))$

$⇒ P = - M I ^(2) + underbrace(lr(( I A ^(2) - 2 I B ^(2) )), "const")$

$⇒ P _(max) ⇔ M I _(min) ⇔ M$ là hình chiếu vuông góc của $I$ trên $lr(( O x y ))$ $⇒ M lr(( 3 ";" - 4 ";" 0 ))$.

*Chọn C.*
],
  "mau-8": [
Ta có:

#aligned-math[$ S &= 2 N A ^(2) + N B ^(2) + N C ^(2) \
&= 2 lr(( arrow(N A) )) ^(2) + lr(( arrow(N B) )) ^(2) + lr(( arrow(N C) )) ^(2) \
&= 2 lr(( arrow(N I) + arrow(I A) )) ^(2) + lr(( arrow(N I) + arrow(I B) )) ^(2) + lr(( arrow(N I) + arrow(I C) )) ^(2) \
&= 4 N I ^(2) + 2 I A ^(2) + I B ^(2) + I C ^(2) + 2 arrow(N I) . lr(( 2 arrow(I A) + arrow(I B) + arrow(I C) )) $]

Tìm điểm $I$ sao cho $2 arrow(I A) + arrow(I B) + arrow(I C) = arrow(0)$ $⇒ I lr(( 0 ";" 1 ";" 2 ))$

$⇒ S text(" đạt GTNN") ⇔ N I text(" nhỏ nhất") ⇔ N$ là hình chiếu của $I$ trên $lr(( P ))$ $⇒ N lr(( - 1 ";" 2 ";" 1 ))$.

*Chọn D.*

],
  "tu-luyen-1": [
*Đáp án: $- 2$.*

Gọi $I$ là trung điểm $A B$ suy ra $I lr(( - frac(3, 2) ";" - frac(1, 2) ";" frac(4049, 2) ))$ và $arrow(I A) + arrow(I B) = arrow(0)$

Ta có: 
#aligned-math[$ M A ^(2) + M B ^(2) &= arrow(M A) ^(2) + arrow(M B) ^(2) \
&= lr(( arrow(M I) + arrow(I A) )) ^(2) + lr(( arrow(M I) + arrow(I B) )) ^(2) \
&= 2 arrow(M I) ^(2) + I A ^(2) + I B ^(2) \
&= 2 M I ^(2) + I A ^(2) + I B ^(2) $]

Vậy $M A ^(2) + M B ^(2)$ nhỏ nhất $⇔$ $2 M I ^(2)$ nhỏ nhất. Vì $M lr(( a ";" b ";" 0 )) ∈ lr(( O x y ))$ nên $M$ là hình chiếu của $I$ trên $lr(( O x y ))$. Suy ra $M lr(( - frac(3, 2) ";" - frac(1, 2) ";" 0 ))$ nên $a + b = - 2 .$
],
  "tu-luyen-2": [
*Chọn D*

Gọi $I lr(( a ";" b ";" c ))$ là điểm thỏa mãn $arrow(I A) + 2 arrow(I B) + 3 arrow(I C) = arrow(0)$.

Ta có 
#math-flow(([$arrow(I A) lr(( 1 - a ";" 2 - b ";" 3 - c )) "," arrow(I B) lr(( - a ";" 1 - b ";" 1 - c )) "," arrow(I C) lr(( 1 - a ";" - b ";" - 2 - c ))$],))

#math-flow(([$arrow(I A) + 2 arrow(I B) + 3 arrow(I C)$],[$= arrow(0)$],[$⇔ cases(display(1 - a - 2 a + 3 - 3 a = 0), display(2 - b + 2 - 2 b - 3 b = 0), display(3 - c + 2 - 2 c - 6 - 3 c = 0))$],[$⇔ cases(display(6 a = 4), display(6 b = 4), display(6 c = - 1))$],[$⇔ cases(display(a = frac(2, 3)), display(b = frac(2, 3)), display(c = - frac(1, 6)))$],))
 $I lr(( frac(2, 3) ";" frac(2, 3) ";" - frac(1, 6) ))$.

Ta chứng minh được $T = 6 M I ^(2) + I A ^(2) + 2 I B ^(2) + 3 I C ^(2)$. Do đó T đạt GTNN khi $M I$ đạt GTNN $⇔$ M là hình chiếu vuông góc của I trên mặt phẳng (P).

Ta có 
#math-flow(([$M I : cases(display(x = frac(2, 3) + t), display(y = frac(2, 3) + t), display(z = - frac(1, 6) + t))$],))
, 
#math-flow(([$M ∈ M I$],[$⇒ M lr(( t + frac(2, 3) ";" t + frac(2, 3) ";" t - frac(1, 6) )) "," M ∈ lr(( P ))$],[$⇒ 3 t + frac(19, 6)$],[$= 0$],[$⇔ t$],[$= - frac(19, 18)$],))

#math-flow(([$⇒ M lr(( - frac(7, 18) ";" - frac(7, 18) ";" - frac(11, 9) ))$],[$⇒ d lr(( M ";" lr(( Q )) ))$],[$= frac(abs(- frac(7, 9) + frac(7, 18) + frac(22, 9) + 3), 3)$],[$= frac(91, 54)$],))
],
  "tu-luyen-3": [
*Chọn B*

Gọi $I lr(( x ";" y ";" z ))$ là điểm thỏa mãn $arrow(I A) + 2 arrow(I B) + 3 arrow(I C) = arrow(0)$.

Ta có $arrow(I A) = lr(( - 10 - x ";" - 5 - y ";" 8 - z ))$, $arrow(I B) = lr(( 2 - x ";" 1 - y ";" - 1 - z ))$, $arrow(I C) = lr(( 2 - x ";" 3 - y ";" - z ))$.

Khi đó, 
#math-flow(([$cases(display(lr(( - 10 - x )) + 2 lr(( 2 - x )) + 3 lr(( 2 - x )) = 0), display(lr(( - 5 - y )) + 2 lr(( 1 - y )) + 3 lr(( 3 - y )) = 0), display(lr(( 8 - z )) + 2 lr(( - 1 - z )) + 3 lr(( - z )) = 0))$],))
 
#math-flow(([$⇔ cases(display(x = 0), display(y = 1), display(z = 1))$],))
 $⇒$ $I lr(( 0 ";" 1 ";" 1 ))$.

Với điểm $M$ thay đổi trên $lr(( P ))$, ta có

$M A ^(2) + 2 M B ^(2) + 3 M C ^(2)$ 
#math-flow(([$= lr(( arrow(M I) + arrow(I A) )) ^(2) + 2 lr(( arrow(M I) + arrow(I B) )) ^(2) + 3 lr(( arrow(M I) + arrow(I C) )) ^(2)$],[$= 6 M I ^(2) + I A ^(2) + 2 I B ^(2) + 3 I C ^(2) + 2 arrow(M I) lr(( arrow(I A) + 2 arrow(I B) + 3 arrow(I C) ))$],[$= 6 M I ^(2) + I A ^(2) + 2 I B ^(2) + 3 I C ^(2)$],)) (Vì $arrow(I A) + 2 arrow(I B) + 3 arrow(I C) = arrow(0)$).

Ta lại có $I A ^(2) + 2 I B ^(2) + 3 I C ^(2)$ $= 185 + 2 . 8 + 3 . 9$ $= 228$.

Do đó, $M A ^(2) + 2 M B ^(2) + 3 M C ^(2)$ đạt giá trị nhỏ nhất $⇔$ $M I$ đạt giá trị nhỏ nhất

$⇔$ $M$ là hình chiếu vuông góc của $I$ trên $lr(( P ))$.

Khi đó, $M I = d lr(( I "," lr(( P )) )) = 3$.

Vậy giá trị nhỏ nhất của $M A ^(2) + 2 M B ^(2) + 3 M C ^(2)$ bằng

$6 M I ^(2) + 228$ $= 6 . 9 + 228$ $= 282$.

Giá trị nhỏ nhất của $M A ^(2) + 2 M B ^(2) + 3 M C ^(2)$ đạt được khi và chỉ khi $M$ là hình chiếu vuông góc của $I$ trên $lr(( P ))$.

Lưu ý thêm cách tìm điểm $M$ như sau:

Gọi $Δ$ là đường thẳng qua $I$ và vuông góc với $lr(( P ))$. Phương trình của $Δ$: 
#math-flow(([$cases(display(x = t), display(y = 1 + 2 t), display(z = 1 - 2 t))$],))
Ta có $M = Δ ∩ lr(( P ))$. Xét phương trình

$t + 2 lr(( 1 + 2 t )) - 2 lr(( 1 - 2 t )) - 9 = 0$ $⇔ 9 t - 9 = 0$ $⇔ t = 1$ $⇒$ $M lr(( 1 ";" 3 ";" - 1 ))$.
],
  "tu-luyen-4": [
*Chọn A*

Gọi $I lr(( x ";" y ";" z ))$ là điểm thỏa mãn $arrow(I A) + 2 arrow(I B) + 3 arrow(I C) = arrow(0)$.

Ta có 
#math-flow(([$cases(display(arrow(I A) = lr(( 3 - x ";" 1 - y ";" 1 - z ))), display(arrow(I B) = lr(( 7 - x ";" 3 - y ";" 9 - z ))), display(arrow(I C) = lr(( 2 - x ";" 2 - y ";" 2 - z ))))$],))
#math-flow(([$arrow(I A) + 2 arrow(I B) + 3 arrow(I C)$],[$= arrow(0)$],[$⇔ cases(display(23 - 6 x = 0), display(13 - 6 y = 0), display(25 - 6 z = 0))$],))
 
#math-flow(([$⇔ cases(display(x = frac(23, 6)), display(y = frac(13, 6)), display(z = frac(25, 6)))$],))
 $⇒ I lr(( frac(23, 6) ";" frac(13, 6) ";" frac(25, 6) ))$.

#aligned-math[$ abs(arrow(M A) + 2 arrow(M B) + 3 arrow(M C)) &= abs(6 arrow(M I) + lr(( arrow(I A) + 2 arrow(I B) + 3 arrow(I C) ))) \
&= abs(6 arrow(M I)) \
&= 6 M I $]
$abs(arrow(M A) + 2 arrow(M B) + 3 arrow(M C))$ đạt giá trị nhỏ nhất $⇔$ $M$ là hình chiếu của $I$ lên mặt phẳng $lr(( P ))$.

Gọi đường thẳng $lr(( d ))$ đi qua $I$ và vuông góc $lr(( P ))$.

Ta có $lr(( d ))$ đi qua $I lr(( frac(23, 6) ";" frac(13, 6) ";" frac(25, 6) ))$ và nhận $arrow(n _(p)) = lr(( 1 ";" 1 ";" 1 ))$ làm véc tơ chỉ phương.

Suy ra phương trình 
#math-flow(([$lr(( d )) : cases(display(x = frac(23, 6) + t), display(y = frac(13, 6) + t), display(z = frac(25, 6) + t))$],))
$M ∈ lr(( d )) ⇔ M lr(( frac(23, 6) + t ";" frac(13, 6) + t ";" frac(25, 6) + t ))$

$M ∈ lr(( P ))$ $⇔ frac(23, 6) + t + frac(13, 6) + t + frac(25, 6) + t - 3 = 0$ $⇔ t = frac(- 43, 18)$ $⇔ M lr(( frac(13, 9) ";" frac(- 2, 9) ";" frac(16, 9) ))$.

Do đó 
#math-flow(([$cases(display(a = frac(13, 9)), display(b = frac(- 2, 9)), display(c = frac(16, 9)))$],))
 $⇒$ $2 a - 10 b + c = frac(62, 9)$.
],
  "tu-luyen-5": [
*Đáp án: $1$.*

Ta thấy hai điểm $A ";" B$ nằm cùng phía so với mặt phẳng $lr(( O x y ))$. Lấy điểm $A'$ đối xứng với điểm $A$ qua mặt phẳng $lr(( O x y ))$ thì $A' ( 2 ";" 3 ";" - 4 )$ và $M A = M A'$.

Khi đó $M A + M B = M A' + M B ≥ A' B$. Tổng khoảng cách $M A + M B$ ngắn nhất bằng $A' B$.

Dấu “=” xảy ra $⇔ M "," A ' "," B$ thẳng hàng hay $M$ là giao của $A ' B$ với mặt phẳng $lr(( O x y ))$.

Mà $frac(M A ', M B) = frac(d lr(( A' "," lr(( O x y )) )), d lr(( B "," lr(( O x y )) ))) = frac(4, 2) = 2$ nên 
#math-flow(([$arrow(A' M)$],[$= 2 arrow(M B)$],[$⇔ cases(display(x _(M) - 2 = 2 lr(( 1 - x _(M) ))), display(y _(M) - 3 = 2 lr(( 1 - y _(M) ))), display(z _(M) + 4 = 2 lr(( 2 - z _(M) ))))$],[$⇔ cases(display(x _(M) = frac(4, 3)), display(y _(M) = frac(5, 3)), display(z _(M) = 0))$],))
Suy ra $M lr(( frac(4, 3) ";" frac(5, 3) ";" 0 ))$

Vậy $T = 2 m - n = 2 . frac(4, 3) - frac(5, 3) = 1$.
],
  "tu-luyen-6": [
*Chọn D*

Gọi $I$ là trung điểm của $A B$, suy ra $I lr(( 1 ";" 1 ";" 1 ))$; $arrow(A B) = lr(( 4 ";" 2 ";" 0 ))$.

Phương trình mặt phẳng trung trực của $A B$: $lr(( α )) : 2 x + y - 3 = 0$.

Vì $lr(( 2 . 3 + 1 . 2 - 3 )) . lr(( 2 . 5 + 1 . 3 - 3 )) = 50 > 0$ nên $B$, $C$ nằm về một phía so với $lr(( α ))$, suy ra $A$, $C$ nằm về hai phía so với $lr(( α ))$.

Điểm $M$ thỏa mãn $M A = M B$ khi $M ∈ lr(( α ))$. Khi đó $M B + M C = M A + M C ≥ A C$.

$M B + M C$ nhỏ nhất bằng $A C$ khi $M = A C ∩ lr(( α ))$.

Phương trình đường thẳng $A C$: 
#math-flow(([$cases(display(x = - 1 + 2 t), display(y = t), display(z = 1 + 2 t))$],))
. Từ đó học sinh giải tìm được tọa độ điểm M.
],
  "tu-luyen-7": [
*Chọn B*

Gọi $I ( m ";" n ";" p )$ là điểm thỏa mãn: $3 arrow(I A) - 2 arrow(I B) = arrow(0) .$

Ta có $arrow(I A) = ( 1 - m ";" - n ";" 2 - p ) ";" arrow(I B) = ( 3 - m ";" 1 - n ";" - 1 - p ) .$

#math-flow(([$3 arrow(I A) - 2 arrow(I B)$],[$= arrow(0)$],[$⇔ cases(display(3 ( 1 - m ) - 2 ( 3 - m ) = 0), display(3 ( - n ) - 2 ( 1 - n ) = 0), display(3 ( 2 - p ) - 2 ( - 1 - p ) = 0))$],[$⇔ cases(display(m = - 3), display(n = - 2), display(p = 8))$],[$⇒ I ( - 3 ";" - 2 ";" 8 ) .$],))

Ta có 
#aligned-math[$ abs(3 arrow(M A) - 2 arrow(M B)) &= abs(3 ( arrow(M I) + arrow(I A) ) - 2 ( arrow(M I) + arrow(I B) )) \
&= abs(arrow(M I)) \
&= M I . $]

Khi đó, $abs(3 arrow(M A) - 2 arrow(M B))$ đạt giá trị nhỏ nhất, $M ∈ ( P )$ $⇔ M I$ nhỏ nhất, $M ∈ ( P )$

$⇔ M$ là hình chiếu vuông góc của $I$ trên $( P ) .$

Gọi $Δ$ là đường thẳng qua $I$ và vuông góc với $( P ) .$ Khi đó $Δ$ nhận vectơ pháp tuyến của $( P )$ là $arrow(n) = ( 1 ";" 1 ";" 1 )$ làm vecto chỉ phương 
#math-flow(([$⇒ Δ : cases(display(x = - 3 + t), display(y = - 2 + t), display(z = 8 + t)) .$],))

Tọa độ $M$ là nghiệm của hệ 
#math-flow(([$cases(display(x = - 3 + t), display(y = - 2 + t), display(z = 8 + t), display(x + y + z - 1 = 0))$],[$⇔ cases(display(t = - frac(2, 3)), display(x = - frac(11, 3)), display(y = - frac(8, 3)), display(z = frac(22, 3)))$],[$⇒ cases(display(a = - frac(11, 3)), display(b = - frac(8, 3)), display(c = frac(22, 3)))$],[$⇒ S$],[$= 9 a + 3 b + 6 c$],[$= 3 .$],))
],
  "tu-luyen-8": [
*Chọn B*

#v(5mm)
#align(center, diagram("projection"))
#v(3mm)

Gọi $I$ là trung điểm $A B ⇒ I lr(( 3 ";" 1 ";" 4 ))$. Gọi $H$ là hình chiếu của $I$ xuống mặt phẳng $lr(( α ))$.

Ta có 
#aligned-math[$ arrow(M A) . arrow(M B) &= lr(( arrow(M I) + arrow(I A) )) . lr(( arrow(M I) + arrow(I B) )) \
&= M I ^(2) + arrow(M I) . lr(( arrow(I A) + arrow(I B) )) - I A ^(2) \
&= M I ^(2) - I A ^(2) $]
Do $I A$ không đổi nên $arrow(M A) . arrow(M B)$ nhỏ nhất khi $M I$ nhỏ nhất $⇔ M I = I H ⇔ M ≡ H$.

Gọi $Δ$ là đường thẳng đi qua $I$ và vuông góc với mặt phẳng $lr(( α ))$. Khi đó $Δ$ nhận $arrow(n _(lr(( α )))) = lr(( 1 ";" 2 ";" - 3 ))$ làm vectơ chỉ phương. Do đó $Δ$ có phương trình 
#math-flow(([$cases(display(x = 3 + t), display(y = 1 + 2 t), display(z = 4 - 3 t))$],))
$H ∈ Δ ⇔ H lr(( 3 + t ";" 1 + 2 t ";" 4 - 3 t ))$.

$H ∈ lr(( α )) ⇔ lr(( 3 + t )) + 2 lr(( 1 + 2 t )) - 3 lr(( 4 - 3 t )) - 7 = 0$ $⇔ t = 1 ⇔ H lr(( 4 ";" 3 ";" 1 ))$.

Vậy $M lr(( 4 ";" 3 ";" 1 ))$.
],
  "tu-luyen-9": [
*Chọn B*

Gọi điểm $I$ thỏa mãn $3 arrow(I A) + arrow(I B) = arrow(0) ⇒ I lr(( 6 ";" 3 ";" - 1 ))$.

Khi đó 
#aligned-math[$ 3 M A ^(2) + M B ^(2) &= 3 lr(( arrow(M I) + arrow(I A) )) ^(2) + lr(( arrow(M I) + arrow(I B) )) ^(2) \
&= 4 M I ^(2) + 3 I A ^(2) + I B ^(2) + 2 arrow(M I) . lr(( 3 arrow(I A) + arrow(I B) )) \
&= 4 M I ^(2) + 3 I A ^(2) + I B ^(2) $].

Do $3 I A ^(2) + I B ^(2)$ không đổi vì ba điểm $A ";" B ";" I$ cố định nên $3 M A ^(2) + M B ^(2)$ đạt giá trị nhỏ nhất khi $M I$ nhỏ nhất. Khi đó $M$ là giao điểm của đường thẳng $I J$ với mặt cầu $lr(( S ))$, ($J lr(( 2 ";" 1 ";" 3 ))$ là tâm của mặt cầu $lr(( S ))$).

Ta có phương trình đường thẳng $I J$ là 
#math-flow(([$cases(display(x = 2 + 2 t), display(y = 1 + t), display(z = 3 - 2 t))$],))
 
#math-flow(([$⇒ I J ∩ lr(( S ))$],[$= lr(bracket.l vec(M _(1) lr(( 4 ";" 2 ";" 1 )), M _(2) lr(( 0 ";" 0 ";" 5 )), delim: #none) )$],))
Kiểm tra $I M _(1) < I M _(2) lr(( 3 < 9 ))$ nên $M _(1) lr(( 4 ";" 2 ";" 1 ))$ là điểm cần tìm. Vậy $T = a . b . c = 8$.
],
  "tu-luyen-10": [
Ta có: $M A = 3 M B ⇒ M A ^(2) = 9 M B ^(2) ⇔ lr(( arrow(M A) )) ^(2) = 9 lr(( arrow(M B) )) ^(2)$

#math-flow(([$⇔ lr(( arrow(M I) + arrow(I A) )) ^(2)$],[$= 9 lr(( arrow(M I) + arrow(I B) )) ^(2)$],[$⇔ 8 M I ^(2) + lr(( 9 I B ^(2) - I A ^(2) )) + 2 arrow(M I) lr(( 9 arrow(I B) - arrow(I A) ))$],[$= 0$],))

Tìm điểm $I$ sao cho $9 arrow(I B) - arrow(I A) = arrow(0) ⇔ arrow(I A) = 9 arrow(I B)$

Có $arrow(I A)$ và $arrow(I B)$ cùng phương, cùng hướng $⇒ B$ nằm giữa $A$ và $I$

#math-flow(([$⇒ cases(display(I A = 9 I B), display(A B = 4))$],[$⇒ cases(display(I A = frac(9, 8) A B), display(A B = 4), display(I A = 9 I B))$],[$⇔ cases(display(I A = frac(9, 2)), display(I B = frac(1, 2)))$],))

#math-flow(([$⇒ 8 M I ^(2) + lr(( 9 I B ^(2) - I A ^(2) ))$],[$= 0$],[$⇔ M I ^(2)$],[$= frac(1, 8) lr(( I A ^(2) - 9 I B ^(2) ))$],[$= frac(1, 8) . lr([ lr(( frac(9, 2) )) ^(2) - 9 . lr(( frac(1, 2) )) ^(2) ])$],[$= frac(9, 4)$],))

$⇒ M I = frac(3, 2) ⇒ M ∈$ mặt cầu tâm $I$ bán kính bằng $frac(3, 2)$.

*Chọn B.*
],
  "tu-luyen-11": [
*Chọn B*

Vì $M ∈ d$ nên giả sử $M lr(( 1 - t ";" 2 + t ";" - t ))$.

Ta có: $M A ^(2) = 3 t ^(2) + 14 t + 29 ";" M B ^(2) = 3 t ^(2) - 4 t + 2 ";" M C ^(2) = 3 t ^(2) + 10 t + 21$

$⇒ P = M A ^(2) + 2 M B ^(2) + 3 M C ^(2) = 18 t ^(2) + 36 t + 96 = 18 lr(( t + 1 )) ^(2) + 78 ≥ 78$

Do đó $P = M A ^(2) + 2 M B ^(2) + 3 M C ^(2)$ đạt giá trị nhỏ nhất khi và chỉ khi $t = - 1$, khi đó:

$M lr(( 2 ";" 1 ";" 1 )) ⇒ a + b + c = 4$.
],
  "tu-luyen-12": [
*Chọn B*

Gọi $I$ là trung điểm của $A B$, ta có $I = lr(( 2 ";" - 1 ";" 4 ))$.

Khi đó: $M A ^(2) + M B ^(2) = arrow(M A) ^(2) + arrow(M B) ^(2)$ $= lr(( arrow(M I) + arrow(I A) )) ^(2) + lr(( arrow(M I) + arrow(I B) )) ^(2)$

$= 2 arrow(M I) ^(2) + arrow(I A) ^(2) + arrow(I B) ^(2) + 2 arrow(M I) . lr(( arrow(I A) + arrow(I B) ))$ $= 2 M I ^(2) + I A ^(2) + I B ^(2)$ $= 2 M I ^(2) + 6$.

Do đó $M A ^(2) + M B ^(2)$ đạt giá trị nhỏ nhất khi và chỉ khi $M I$ có độ dài ngắn nhất, điều này xảy ra khi và chỉ khi $M$ là hình chiếu vuông góc của $I$ trên đường thẳng $d$.

Phương trình mặt phẳng $lr(( P ))$ đi qua $I$ và vuông góc với đường thẳng $d$ là

$1 . lr(( x - 2 )) - 2 . lr(( y + 1 )) + 2 . lr(( z - 4 )) = 0$ hay $lr(( P )) : x - 2 y + 2 z - 12 = 0$.

Phương trình tham số của đường thẳng $d$ là: 
#math-flow(([$cases(display(x = 1 + t), display(y = 2 - 2 t), display(z = 3 + 2 t))$],))
Tọa độ điểm $M$ cần tìm là nghiệm $lr(( x ";" y ";" z ))$ của hệ phương trình:

#math-flow(([$cases(display(x = 1 + t), display(y = 2 - 2 t), display(z = 3 + 2 t), display(x - 2 y + 2 z - 12 = 0))$],))
 
#math-flow(([$⇔ cases(display(x = 2), display(y = 0), display(z = 5), display(t = 1))$],))
. Vậy $M lr(( 2 ";" 0 ";" 5 ))$.
],
  "tu-luyen-13": [
*Đáp án: $- 1$.*

Với mọi điểm I bất kì ta có:

#math-flow(([$vec(S = lr(( arrow(M I) + arrow(I A) )) . lr(( arrow(M I) + arrow(I B) )) + 3 lr(( arrow(M I) + arrow(I B) )) . lr(( arrow(M I) + arrow(I C) )) + 4 lr(( arrow(M I) + arrow(I C) )) . lr(( arrow(M I) + arrow(I A) )), = 8 M I ^(2) + arrow(M I) lr(( 5 arrow(I A) + 4 arrow(I B) + 7 arrow(I C) )) + arrow(I A) . arrow(I B) + 3 arrow(I B) . arrow(I C) + 4 arrow(I A) . arrow(I C), delim: #none)$],))

Chọn điểm I sao cho: $5 arrow(I A) + 4 arrow(I B) + 7 arrow(I C) = arrow(0)$

Gọi 
#math-flow(([$I lr(( x ";" y ";" z ))$],[$⇒ cases(display(5 lr(( 1 - x )) + 4 lr(( - 2 - x )) + 7 lr(( 0 - x )) = 0), display(5 lr(( - 1 - y )) + 4 lr(( 0 - y )) + 7 lr(( 1 - y )) = 0), display(5 lr(( 2 - z )) + 4 lr(( 3 - z )) + 7 lr(( - 2 - z )) = 0))$],[$⇔ cases(display(x = - frac(3, 16)), display(y = frac(1, 8)), display(z = frac(1, 2)))$],[$⇒ I lr(( - frac(3, 16) ";" frac(1, 8) ";" frac(1, 2) ))$],))

Khi đó: $S = 8 M I ^(2) + arrow(I A) . arrow(I B) + 3 arrow(I B) . arrow(I C) + 4 arrow(I A) . arrow(I C)$

S đạt giá trị nhỏ nhất khi và chỉ khi MI nhỏ nhất. Khi đó M là hình chiếu của I lên mặt phẳng Oxy.

Suy ra: $M lr(( - frac(3, 16) ";" frac(1, 8) ";" 0 )) ⇒ T = 16 lr(( - frac(3, 16) )) + 16 . frac(1, 8) + 3 . 0 = - 1$.
],
  "tu-luyen-14": [
*Đáp số: $"16,7"$.*

Ta có:

#aligned-math[$ arrow(D A) &= (1; -7; -2) \
arrow(D B) &= (-1; -1; 5) \
arrow(D C) &= (1; 33; -17) $]

Vì $4 arrow(D A) + 5 arrow(D B) + arrow(D C) = arrow(O)$

#math-flow(([$⇒ 4 M A ^(2) + 5 M B ^(2) + M C ^(2)$],[$= 4 lr(( arrow(M D) + arrow(D A) )) ^(2) + 5 lr(( arrow(M D) + arrow(D B) )) ^(2) + lr(( arrow(M D) + arrow(D C) )) ^(2)$],[$= 10 M D ^(2) + 1730$],))

Ta có:$P = M D ^(4) - frac(16, 3) . M D ^(3) - 10 . M D ^(2) - 1730$

Đặt $u = M D ≥ 0$ 
#math-flow(([$⇒ M D ^(4) - frac(16, 3) . M D ^(3) - 10 . M D ^(2) - 1730$],[$= u ^(4) - frac(16, 3) . u ^(3) - 10 u ^(2) - 1730$],[$= f lr(( u ))$],))

#math-flow(([$f ' lr(( u ))$],[$= 4 u ^(3) - 16 u ^(2) - 20 u$],[$= 0$],[$⇔ lr(bracket.l vec(u = 5 ., u = 0 ., u = - 1 ( L ), delim: #none) )$],))

$⇒ limits(min)_(lr([ 0 ";" + ∞ ))) f lr(( u )) = f lr(( 5 )) = frac(- 6065, 3)$.

Biểu thức $P$ đạt giá trị nhỏ nhất khi và chỉ khi $M D = 5 ⇔ lr(( a - 2 )) ^(2) + lr(( b - 5 )) ^(2) + lr(( c - 1 )) ^(2) = 25 .$

Mặt khác:

#math-flow(([$vec(lr([ lr(( a - 2 )) . 1 + lr(( b - 5 )) . 1 + ( c - 1 ) . 1 ]) ^(2) ≤ lr([ lr(( a - 2 )) ^(2) + lr(( b - 5 )) ^(2) + lr(( c - 1 )) ^(2) ]) lr(( 1 ^(2) + 1 ^(2) + 1 ^(2) )) = 75, ⇒ Q = a + b + c ≤ 5 sqrt(3) + 8 ≈ "16,7" ., delim: #none)$],))
],
)
