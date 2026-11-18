#import "figures.typ": figure, figure-pair
#let solutions=(
"mau-1":[
#set par(justify:false)
#figure("image36.svg")

Đáp án: 9.

Gọi $M$ là trung điểm $B C$.

Ta có $A M ⊥ B C$ (vì $A B C$ là tam giác đều)

Vì $A A ' ⊥ lr(( A B C ))$ nên $A A ' ⊥ A M$.

Do đó $d lr(( A A ' "," B C )) = A M$.

Vì $A M$ là đường cao tam giác đều $A B C$ nên $A M = frac(6 sqrt(3) . sqrt(3), 2) = 9   lr(( "cm" ))$
],
"mau-2":[
#set par(justify:false)
Đáp án: $"8,94"$.

#figure("image52.svg")

Kẻ $A H ⊥ B D$, khi đó tam giác $A B D$ vuông tại $A$

Ta có $A A ' ⊥ (A B C D) ⇒ A A ' ⊥ A H ","$ lại có $A H ⊥ B D$

$⇒ d lr(( A A ' ";" B D )) = A H$

$frac(1, A H ^(2)) = frac(1, A B ^(2)) + frac(1, A D ^(2)) ⇒ A H = 4 sqrt(5) ≈ "8,94"$.
],
"mau-3":[
#set par(justify:false)
a)

#figure-pair("image65.svg", "image80.svg")

Nhận thấy: $cases(display(B D ⊥ A C), display(B D ⊥ S A)) ⇒ B D ⊥ lr(( S A C )) ⇒ B D ⊥ S C$

$⇒$ Trường hợp 2 đường thẳng chéo nhau $⊥$ với nhau

Mặt phẳng $lr(( S A C ))$ chứa $S C$ và $lr(( S A C )) ⊥ B D$

Gọi $O = B D ∩ lr(( S A C ))$

Trong mặt phẳng $lr(( S A C ))$ kẻ $O I ⊥ S C ";" lr(( I ∈ S C ))$ $⇒ O I$ là đoạn vuông góc chung của $B D$ và $S C$

$⇒ d lr(( B D ";" S C )) = O I$

Xét $Δ S A C$

+) Cách 1:

$Δ O I C ∽ Δ S A C$ $⇒ frac(O I, S A) = frac(O C, S C)$ $⇒ O I = frac(O C, S C) . S A$

$⇒ O I = frac(frac(sqrt(2), 2) a, sqrt(3) a) . a = frac(sqrt(6), 6) a$

+) Cách 2: $O I = frac(1, 2) A K = frac(1, 2) frac(S A . A C, sqrt(S A ^(2) + A C ^(2))) = frac(a, 2) . frac(sqrt(2), sqrt(3)) = frac(sqrt(6), 6) a$

Đáp số: $d lr(( B D ";" S C )) = O I = frac(a sqrt(6), 6)$

b)

#figure-pair("image87.svg", "image97.svg")

Nhận thấy $A C$ không vuông góc với $S D$ $⇒$ Dựng mặt phẳng song song

- Trong mặt phẳng $lr(( A B C D ))$, kẻ $D t$ song song với $A C$ $⇒ A C ∥ lr(( S D ";" D t ))$

- $d lr(( A C ";" S D )) = d lr(( A C ";" lr(( S D ";" D t )) )) = d lr(( A ";" lr(( S D ";" D t )) ))$ $= A H$

Tính $A H$

Xét $Δ S A K$ có: $A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

Có: $cases(display(S A = a), display(A K = O D = frac(1, 2) B D = frac(a sqrt(2), 2)))$ $⇒ A H = frac(1 . frac(sqrt(2), 2), sqrt(1 ^(2) + lr(( frac(sqrt(2), 2) )) ^(2))) a = frac(sqrt(3), 3) a$

Đáp số: $d lr(( A C ";" S D )) = frac(a sqrt(3), 3)$
],
"mau-4":[
#set par(justify:false)
#figure("image106.svg")

Trong mặt phẳng $lr(( A B C D )) ","$ kẻ $B t ∥ A C$ $⇒ A C ∥ lr(( S B ";" B t ))$

$⇒ d lr(( A C ";" S B )) = d lr(( A C ";" lr(( S B ";" B t )) )) = d lr(( A ";" lr(( S B ";" B t )) )) = A H$

$⇒ A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

#figure("image112.svg")

Ta có: $cases(display(S A = 2 a), display(A K = B E = frac(A B . B C, sqrt(A B ^(2) + B C ^(2))) = frac(a sqrt(2), sqrt(3)) = frac(a sqrt(6), 3)))$ $⇒ A H = a frac(2 . frac(sqrt(6), 3), sqrt(4 + frac(6, 9))) = frac(2 a sqrt(7), 7)$

Vậy $d lr(( A C ";" S B )) = frac(2 a sqrt(7), 7)$
],
"mau-5":[
#set par(justify:false)
#figure("image128.svg")

- Trong mặt phẳng $lr(( O A B )) ","$ kẻ $A t ∥ O M$ $⇒ d lr(( O M ";" A C )) = d lr(( O M ";" lr(( A C ";" A t )) ))$ $= d lr(( O ";" lr(( A C ";" A t )) )) = O H$

$⇒ O H = frac(O C . O K, sqrt(O C ^(2) + O K ^(2)))$

#figure("image134.svg")

Có: $cases(display(O C = 2 a), display(O K = A M = frac(1, 2) A B = frac(a sqrt(2), 2)))$ $⇒ O H = a frac(2 . frac(sqrt(2), 2), sqrt(2 ^(2) + frac(2, 4))) = frac(2, 3) a$

$⇒ d lr(( O M ";" A C )) = frac(2 a, 3)$

Chọn D.
],
"mau-6":[
#set par(justify:false)
#grid(
  columns: (1fr, 58mm),
  column-gutter: 5mm,
  align: (left + horizon, center + horizon),
  [
    Vì $A B ∥ C D$ nên $A B ∥ (S C D)$. Do đó
    $d(A B ";" S C) = d(A ";" (S C D))$.

    $O$ là trung điểm của $A C$ và $C ∈ (S C D)$ nên
    $d(A ";" (S C D)) = 2 d(O ";" (S C D)) = 2 O H$.

    Trong tam giác vuông $O H K$, ta có
    $O H = O K sin 45° = frac(a, 2) dot frac(sqrt(2), 2)$.

    Vậy $d(A B ";" S C) = 2 O H = frac(a, sqrt(2))$. Chọn A.
  ],
  figure("image147.svg"),
)
],
"mau-7":[
#set par(justify:false)
#figure("image169.svg")

$H K ∥ B D$ do $H K$ là đường trung bình của $Δ A B D$ $⇒ H K ∥ lr(( S B D ))$

$⇒ d lr(( H K ";" S D )) = d lr(( H K ";" lr(( S B D )) )) = d lr(( H ";" S B D )) = H F = frac(S H . H E, sqrt(S H ^(2) + H E ^(2)))$

Có: +) $S H = sqrt(S D ^(2) - H D ^(2))$ $= sqrt(frac(17 a^2, 4) - A H ^(2) - A D ^(2)) = a sqrt(frac(17, 4) - frac(1, 4) - 1) = a sqrt(3)$

+) $H E = frac(1, 4) A C = frac(sqrt(2), 4) a$

$⇒ H F = a frac(sqrt(3) . frac(sqrt(2), 4), sqrt(3 + frac(2, 16))) = frac(sqrt(3), 5) a$

Chọn D.
],
"mau-8":[
#set par(justify:false)
#figure("image193.svg")

Gọi $N$ là trung điểm của $B B '$ $⇒ M N ∥ B ' C$ $⇒ B ' C ∥ lr(( A M N ))$

$⇒ d lr(( B ' C ";" A M )) = d lr(( B ' C ";" A M N )) = d lr(( C ";" lr(( A M N )) )) = d lr(( B ";" lr(( A M N )) ))$

Có $B A M N$ là tam diện vuông tại đỉnh $B$

$⇒ frac(1, d^2 lr(( B ";" lr(( A M N )) ))) = frac(1, B A ^(2)) + frac(1, B M ^(2)) + frac(1, B N ^(2))$ $= frac(1, 1) + frac(1, lr(( frac(1, 2) )) ^(2)) + frac(1, lr(( frac(sqrt(2), 2) )) ^(2)) = 7$ $⇒ d lr(( B ";" lr(( A M N )) )) = frac(sqrt(7), 7)$

Chọn A.
],
"tu-luyen-1":[
#set par(justify:false)
Đáp án: $"4,9"$.

#figure("image209.svg")

Kẻ đường cao $A H$ của tam giác $A B C$, vì $A H$ là đường vuông góc chung của $B C$ và $A A'$ nên $A H$ là khoảng cách giữa $B C$ và $A A'$

ta có $frac(1, 2) A H . B C = sqrt(p lr(( p - a )) lr(( p - b )) lr(( p - c ))) = S _(Δ A B C)$

Suy ra $A H = 2 sqrt(6) ≅ "4,898979"$ làm tròn hàng phần mười là $A H ≅ "4,9"$
],
"tu-luyen-2":[
#set par(justify:false)
$∠ lr(( S C ";" A B C D )) = ∠ S C A = 45 °$

$⇒ Δ S A C$ vuông cân tại đỉnh $A ⇒ S A = A C = a sqrt(2)$

Tính $d lr(( A C ";" S B ))$

Ta nhận thấy do $S B$ và $A C$ không vuông góc với nhau $⇒$ Dựng mặt phẳng song song

+ Trong mặt phẳng $lr(( A B C D )) ","$ kẻ $B t ∥ A C ⇒ A C ∥ lr(( S B ";" B t ))$

$⇒ d lr(( A C ";" S B )) = d lr(( A C ";" lr(( S B ";" B t )) )) = d lr(( A ";" lr(( S B ";" B t )) )) = A H$ (hình vẽ)

#figure("image239.svg")

+ Tính $A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

Trong đó, $cases(display(S A = a sqrt(2)), display(A K = B O = frac(a sqrt(2), 2) ))$ suy ra $A H = frac(a sqrt(2) . frac(a sqrt(2), 2), sqrt(2 a^2 + frac(a^2, 2))) = frac(sqrt(10), 5) a$

Vậy $d lr(( S B ";" A C )) = frac(sqrt(10), 5) a$

Chọn B.
],
"tu-luyen-3":[
#set par(justify:false)
#figure-pair("image252.svg", "image254.svg")

Xét hình phẳng của đáy $A B C D$.

Kẻ $B t ∥ A C ⇒ d lr(( A C ";" S B )) = d lr(( A C ";" lr(( S B ";" B t )) )) = A H$ (hình vẽ)

Tính $A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

Trong đó, $cases(display(S A = a), display(A K = B E = frac(A B . B C, sqrt(A B ^(2) + B C ^(2))) = frac(a . 2 a, sqrt(a ^(2) + 4 a ^(2))) = frac(2 a sqrt(5), 5)))$ $⇒ A H = frac(1 . frac(2 sqrt(5), 5), sqrt(1 ^(2) + lr(( frac(2 sqrt(5), 5) )) ^(2))) a = frac(2, 3) a$

Vậy $d lr(( S B ";" A C )) = frac(2, 3) a$

Chọn B.
],
"tu-luyen-4":[
#set par(justify:false)
Vẽ $B C$ ở dưới đáy để $O M$ nằm dưới đáy

#figure("image272.svg")

Kẻ $B t ∥ O M ⇒ O M ∥ lr(( A B ";" B t ))$

Kẻ $O K ⊥ B t ⇒ O K ∥ B M$

Kẻ $O H ⊥ A K$

Khi đó, $d lr(( O M ";" A B )) = d lr(( O M ";" lr(( A B ";" B t )) )) = d lr(( O ";" lr(( A B ";" B t )) )) = O H = frac(O A . O K, sqrt(O A ^(2) + O K ^(2)))$

Trong đó, $cases(display(O A = a), display(O K = B M = frac(1, 2) B C = frac(1, 2) lr(( 2 sqrt(2) a )) = a sqrt(2)))$ $⇒ O H = frac(1 . sqrt(2), sqrt(1 ^(2) + lr(( sqrt(2) )) ^(2))) a = frac(sqrt(6), 3) a$

$⇒ d lr(( O M ";" A B )) = frac(sqrt(6), 3) a$

Chọn D.
],
"tu-luyen-5":[
#set par(justify:false)
Ta thấy $S A ⊥ B C ⇒$ Ta tiến hành dựng đoạn vuông góc chung để xác định khoảng cách

#figure("image292.svg")

Kẻ $A H ⊥ B C$ $⇒ cases(display(A H ⊥ S A ), display(A H ⊥ B C lr(( A H ⊂ lr(( A B C )) ))), display(A ∈ S A ";" H ∈ B C))$

$⇒ A H$ là đoạn vuông góc chung của $S A$ và $B C .$

$⇒ d lr(( S A ";" B C )) = A H = frac(A B . A C, sqrt(A B ^(2) + A C ^(2))) = frac(a . a sqrt(2), sqrt(a ^(2) + lr(( a sqrt(2) )) ^(2))) = frac(sqrt(6), 3) a$

Chọn D.
],
"tu-luyen-6":[
#set par(justify:false)
#figure("image319.svg")

$A B ∥ C D ⇒ A B ∥ lr(( S C D ))$ $⇒ d lr(( A B ";" S D )) = d lr(( A B ";" lr(( S C D )) )) = d lr(( H ";" lr(( S C D )) )) = H F = frac(S H . H E, sqrt(S H ^(2) + H E ^(2)))$

Trong đó: +) $H E ∥ B C$ và $H E = B C = a$

+) $∠ lr(( S C ";" lr(( A B C D )) )) = ∠ S C H = 45 °$

$⇒ Δ S C H$ vuông cân tại $H ⇒ S H = H C = sqrt(B C ^(2) + B H ^(2))$ $= sqrt(a ^(2) + lr(( frac(a, 2) )) ^(2)) = frac(sqrt(5), 2) a$

$⇒ H F = frac(frac(sqrt(5), 2) . 1, sqrt(lr(( frac(sqrt(5), 2) )) ^(2) + 1 ^(2))) . a$ $= frac(sqrt(5), 3) a$

Vậy $d lr(( A B ";" S D )) = frac(a sqrt(5), 3)$

Chọn C.
],
"tu-luyen-7":[
#set par(justify:false)
#figure("image347.svg")

Kẻ $E F$ qua $O$ và $E F ∥ A B$ $⇒ cases(display(A B ∥ lr(( S E F ))), display(O ∈ lr(( S E F ))))$

$⇒ d lr(( A B ";" S O )) = d lr(( A B ";" lr(( S E F )) )) = d lr(( A ";" lr(( S E F )) )) = A H$ (kẻ $A H ⊥ S E$ ) $= frac(S A . A E, sqrt(S A ^(2) + A E ^(2)))$

Trong đó: +) $A E = frac(1, 2) A D = frac(a, 2)$

+) $∠ S B D = 60 °$ mà $S B = S D ⇒ Δ S B D$ là tam giác đều

$⇒ S B = S D = B D = a sqrt(2)$ $⇒ S A = sqrt(S B ^(2) - A B ^(2)) = sqrt(2 a ^(2) - a ^(2)) = a$ $⇒ A H = frac(a . frac(a, 2), sqrt(a ^(2) + lr(( frac(a, 2) )) ^(2))) = frac(sqrt(5), 5) a$

$⇒ d lr(( A B ";" S O )) = frac(a sqrt(5), 5)$

Chọn D.
],
"tu-luyen-8":[
#set par(justify:false)
#figure("image377.svg")

Ta đi chứng minh: $D M ⊥ C N ⇒ D M ⊥ lr(( S C N )) ⇒ D M ⊥ S C$

Phẳng hóa đáy:

#figure("image381.svg")

$Δ A D M = Δ D C N lr(( c - c - c ))$ $⇒ ∠ A D M = ∠ D C N lr(( 1 ))$

Mà $∠ A D M + ∠ H D C = 90 ° lr(( 2 ))$

Từ $lr(( 1 ))$ và $lr(( 2 )) ⇒ ∠ D C N + ∠ H D C = 90 ° ⇒ ∠ D H C = 90 ° ⇒ D H ⊥ H C$ (điều phải chứng minh)

$⇒ 2$ đường thẳng chéo nhau $D M$ và $S C$ vuông góc với nhau

$⇒$ Ta đi dựng đoạn vuông góc chung bằng cách kẻ $H K ⊥ S C lr(( K ∈ S C )) ⇒$ Đoạn vuông góc chung là $H K$

$⇒ d lr(( D M ";" S C )) = H K = frac(S H . H C, sqrt(S H ^(2) + H C ^(2)))$

Trong đó: +) $S H = a sqrt(3)$

+) Tính $H C :$ Xét $Δ D N C$ có: $C H . C N = C D ^(2)$

$⇒ C H = frac(C D ^(2), C N) = frac(a ^(2), frac(a sqrt(5), 2)) = frac(2 a, sqrt(5))$

$⇒ H K = frac(sqrt(3) . frac(2, sqrt(5)), sqrt(3 + lr(( frac(2, sqrt(5)) )) ^(2))) . a = frac(2 sqrt(57), 19) a$

$⇒ d lr(( D M ";" S C )) = frac(2 sqrt(57), 19) a$ . Chọn A.
],
"tu-luyen-9":[
#set par(justify:false)
Kẻ $M N ∥ B ' C$ $⇒ frac(B N, B C) = frac(B M, B B ') = frac(2, 3)$

#figure("image420.svg")

Khi đó, $B ' C ∥ lr(( A M N )) ⇒ d lr(( B ' C ";" A M )) = d lr(( B ' C ";" lr(( A M N )) )) = d lr(( C ";" lr(( A M N )) ))$ $lr(( 1 ))$

Đổi điểm: $cases(display(C → B), display(C B ∩ lr(( A M N )) = N))$ $⇒ frac(d lr(( C ";" lr(( A M N )) )), d lr(( B ";" lr(( A M N )) ))) = frac(C N, B N)$ $= frac(1, 2) ⇒ d lr(( C ";" lr(( A M N )) )) = frac(1, 2) d lr(( B ";" lr(( A M N )) ))$  $lr(( 2 ))$

Từ $lr(( 1 ))$ và $lr(( 2 )) ⇒ d lr(( B ' C ";" A M )) = frac(1, 2) d lr(( B ";" lr(( A M N )) ))$  $lr(( 3 ))$

Tính $d lr(( B ";" lr(( A M N )) ))$

Xét tam diện vuông $A B M N$ có 3 góc vuông tại $B$

$⇒ frac(1, d ^(2) lr(( B ";" lr(( A M N )) ))) = frac(1, A B ^(2)) + frac(1, B M ^(2)) + frac(1, B N ^(2)) = frac(1, a ^(2)) lr(( frac(1, 4 ^(2)) + frac(1, 6 ^(2)) + frac(1, 2 ^(2)) ))$

$⇒ d lr(( B ";" lr(( A M N )) )) = frac(12, 7) a lr(( 4 ))$

Từ $lr(( 3 ))$ và $lr(( 4 )) ⇒ d lr(( B ' C ";" A M )) = frac(6, 7) a$

Chọn B.
],
"tu-luyen-10":[
#set par(justify:false)
#figure("image457.svg")

Kẻ $I t ∥ A C ⇒ A C ∥ lr(( A ' I ";" I t ))$

$⇒ d lr(( A C ";" A ' I )) = d lr(( A C ";" lr(( A ' I ";" I t )) )) = d lr(( A ";" lr(( A ' I ";" I t )) )) = A H = frac(A A ' . A K, sqrt(A A ' ^(2) + A K ^(2)))$

Trong đó:

+) $A K = frac(1, 2) B E = frac(a sqrt(3), 4)$

+) $∠ lr(( A ' C ";" A B B ' A ' )) = ∠ C A ' I = 30 °$ $⇒ A ' C = frac(C I, sin 30 °) = frac(frac(a sqrt(3), 2), frac(1, 2)) = a sqrt(3)$

$⇒ A A ' = sqrt(A ' C ^(2) - A C ^(2)) = sqrt(3 a ^(2) - a ^(2)) = a sqrt(2)$ $⇒ A H = frac(a sqrt(2) . frac(a sqrt(3), 4), sqrt(2 a ^(2) + frac(3 a ^(2), 16)))$ $= frac(sqrt(210), 35) a$

Vậy $d lr(( A C ";" A ' I )) = frac(sqrt(210), 35) a$

Chọn B.
],
"tu-luyen-11":[
#set par(justify:false)
#figure("image476.svg")

Đáp án: $frac(2 sqrt(42),7)$.

Vì $S . A B C D$ là hình chóp tứ giác đều, nên $A B C D$ là hình vuông

Gọi $O$ là giao điểm của $A C$ và $B D ⇒ S O ⊥ lr(( A B C D ))$

Kẻ $O K ⊥ C D$, nên $K$ là trung điểm của $C D$ lại có $S O ⊥ C D ⇒ C D ⊥ lr(( S O K ))$

Kẻ $O H ⊥ S K ⇒ C D ⊥ O H ⇒ O H ⊥ lr(( S C D )) ⇒ d lr(( O ";" lr(( S C D )) )) = O H$

Ta có $A B ∥ C D ⇒ d lr(( A B ";" S D )) = d lr(( A B ";" lr(( S C D )) )) = d lr(( A ";" lr(( S C D )) )) = 2 d lr(( O ";" lr(( S C D )) ))$

Xét tam giác vuông $A B C$ có $A C = 2 sqrt(2) ⇒ O C = sqrt(2) "," S C = 2 sqrt(2) ⇒ S O = sqrt(S C ^(2) - O C ^(2)) = sqrt(6) ";" O K = frac(1, 2) A D = 1$

Xét tam giác vuông $S O K$ có $frac(1, O H ^(2)) = frac(1, S O ^(2)) + frac(1, O K ^(2)) ⇒ O H = frac(sqrt(42), 7) ⇒ d(A B ";" S D) = 2 O H = frac(2 sqrt(42),7) .$
],
"tu-luyen-12":[
#set par(justify:false)
Đáp án: 2,4.

#figure("image496.svg")

Trong mặt phẳng $lr(( A B C ))$, dựng điểm $D$ sao cho tứ giác $A B C D$ là hình chữ nhật.

Dựng $A K ⊥ S D$.

Dễ thấy $C D ⊥ lr(( S A D )) ⇒ C D ⊥ A K$.

Nên $A K ⊥ lr(( S C D ))$.

Ta có $lr(vec(C D ∥ A B, C D ⊂ lr(( S C D )), delim: #none) \}) ⇒ A B ∥ lr(( S C D )) ⇒ d lr(( A B "," S C )) = d lr(( A B "," lr(( S C D )) )) = d lr(( A "," lr(( S C D )) )) = A K$.

Xét tam giác vuông $S A D ⇒ frac(1, A K ^(2)) = frac(1, S A ^(2)) + frac(1, A D ^(2)) ⇒ A K = frac(12, 5)$.
],
"tu-luyen-13":[
#set par(justify:false)
#figure("image518.svg")

Có $lr(( A B B ' A ' ))$  chứa $A M$ và $lr(( A B B ' A ' )) ∥ C C '$

$⇒ d lr(( A M ";" C C ' )) = d lr(( C C ' ";" lr(( A B B ' A ' )) )) = d lr(( C ";" A B A ' B ' )) = C K$

Ta có: $C K = frac(2 S _(Δ A B C), A B)$

Mà $S _(Δ A B C) = frac(1, 2) A C . B C . sin 120 ° = frac(1, 2) . a . 2 a . frac(sqrt(3), 2) = frac(sqrt(3), 2) a ^(2)$

$A B = sqrt(A C ^(2) + B C ^(2) - 2 A C . B C . cos 120 °) = a sqrt(1 ^(2) + 2 ^(2) - 2 . 1 . 2 lr(( - frac(1, 2) ))) = sqrt(7) a$ $⇒ C K = frac(sqrt(3) a ^(2), sqrt(7) a) = frac(sqrt(21), 7) a$

Chọn D.
],
"tu-luyen-14":[
#set par(justify:false)
#figure("image538.svg")

Có: $C ' D ∥ B ' A ⇒ B ' A ∥ lr(( C ' B D ))$ (chứa $B D$)

$⇒ d lr(( B ' A ";" B D )) = d lr(( B ' A ";" lr(( C ' B D )) )) = d lr(( A ";" lr(( C ' B D )) )) = d lr(( C ";" lr(( C ' B D )) ))$ $= C H = frac(C O . C C ', sqrt(C O ^(2) + (C C') ^(2)))$

+) $C O = frac(1, 2) a$ ; $C C ' = sqrt(A C ' ^(2) - A C ^(2)) = sqrt(5 a ^(2) - a ^(2)) = 2 a$ ;$C H = frac(frac(1, 2) . 2, sqrt(frac(1, 4) + 4)) . a = frac(2 sqrt(17), 17) a$

Chọn D.
],
"tu-luyen-15":[
#set par(justify:false)
Đáp án: 0,85

#figure("image555.svg", scale: 115%)

Gọi M là trung điểm của $S B$; O là giao điểm của $A C$ và $B D$ nên O là trung điểm của $B D$.

Do $O M$ là đường trung bình của tam giác $S B D$ nên $S D ∥ O M$ và $O M ⊂ lr(( A M C ))$ nên $S D ∥ lr(( A M C ))$.

Khi đó: $d lr(( S D "," A C )) = d lr(( S D "," lr(( A M C )) )) = d lr(( S "," lr(( A M C )) )) = d lr(( B "," lr(( A M C )) ))$ (M là trung điểm của $S B$).

Gọi K là trung điểm của $H B$.

Khi đó $M K = frac(1, 2) S H = frac(sqrt(2), 2)$ và $M K ∥ S H$ nên $M K ⊥ lr(( A B C D ))$.

Mà $O B = frac(3, 2) O K$ nên $d lr(( B "," lr(( A M C )) )) = frac(3, 2) d lr(( K "," lr(( A M C )) ))$.

Mặt khác $O K = O B - K B = O B - frac(1, 2) H B = O B - frac(1, 3) O B = frac(2, 3) O B = frac(2 sqrt(2), 3)$.

Vậy $d lr(( S D "," A C )) = frac(3, 2) d lr(( K "," lr(( A M C )) )) = frac(3, 2) frac(M K . O K, sqrt(M K ^(2) + O K ^(2))) = frac(3 sqrt(2), 5) ≈ "0,85"$.
],
)