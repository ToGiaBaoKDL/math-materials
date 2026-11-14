#import "figures.typ": figure
#let solutions=(
"bai-mau-1":[
Tính $d lr(( A ";" lr(( S B C )) )) ?$


#figure("image40.svg")


$A$ là chân đường cao

$d lr(( A "," lr(( S B C )) ))$:

+) Kẻ $A K ⊥ B C ⇒ K ≡ B$

+) $S B$

+) Kẻ $A H ⊥ S B ⇒ d lr(( A "," lr(( S B C )) )) = A H$

Tính $A H$:

$ A H = frac(S A . A B, sqrt(S A ^(2) + A B ^(2))) = frac(2 a . a, sqrt(lr(( 2 a )) ^(2) + a ^(2))) = frac(2 sqrt(5) a, 5) $

Chọn A.
],
"bai-mau-2":[

#figure("image54.svg")


#block(inset:(left:5mm),above:3mm,below:3mm)[a) $d lr(( A ";" lr(( S C D )) ))$]

Ta có $d lr(( A ";" lr(( S C D )) )) = A H = frac(S A . A D, sqrt(S A ^(2) + A D ^(2))) = frac(a . 2 a, sqrt(a ^(2) + lr(( 2 a )) ^(2))) = frac(2 a sqrt(5), 5)$

#block(inset:(left:5mm),above:3mm,below:3mm)[b) $d lr(( A ";" lr(( S B D )) ))$]

+) Nét 1: Kẻ $A K ⊥ B D lr(( K ∈ B D ))$

+) Nét 2: Nối $S K$

+) Nét 3: Kẻ $A I ⊥ S K lr(( I ∈ S K )) ⇒ d lr(( A . lr(( S B D )) )) = A I$

Có $d lr(( A ";" lr(( S B D )) )) = A I = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

Ta có $S A = a$ và

$ A K = frac(A B dot A D, sqrt(A B^2 + A D^2)) = frac(a dot 2a, sqrt(a^2+(2a)^2)) = frac(2a sqrt(5),5). $

$ ⇒ d lr(( A ";" lr(( S B D )) )) = A I = frac(a . frac(2 a sqrt(5), 5), sqrt(a ^(2) + lr(( frac(2 a sqrt(5), 5) )) ^(2))) = frac(2 a, 3). $
],
"bai-mau-3":[

#figure("image75.svg")


$ d lr(( A ";" lr(( S C D )) )) = ? $

+) Hình thoi $A B C D$ có $hat(B A D) = 120 °$

$⇒ A B C D$ cấu tạo từ hai tam giác đều là $Δ A C D$ và $Δ B A C$ cạnh $2 a$

+) Dựng khoảng cách từ $A$ đến $lr(( S C D )) ⇒$ ba nét dựng

$ ⇒ d lr(( A ";" lr(( S C D )) )) = A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2))) $

Có $cases(display(S A = a), display(A K = frac(sqrt(3), 2) . lr(( "cạnh" _(Δ A C D) )) = frac(sqrt(3), 2) . 2 a = a sqrt(3)))$

$ ⇒ d lr(( A ";" lr(( S C D )) )) = A H = frac(a . a sqrt(3), sqrt(a ^(2) + lr(( a sqrt(3) )) ^(2))) = frac(sqrt(3), 2) a. $

Chọn B.
],
"bai-mau-4":[

#figure("image101.svg")


$A B C D$ cấu tạo bởi hai tam giác đều là $Δ A B D$ và $Δ B C D$ cạnh $a$

Tính $d lr(( A ";" lr(( S C D )) )) = A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

Có $cases(display(S A = a), display(A K = B E = frac(a sqrt(3), 2))) ⇒ d lr(( A ";" lr(( S C D )) )) = frac(a . frac(a sqrt(3), 2), sqrt(a ^(2) + lr(( frac(a sqrt(3), 2) )) ^(2))) = frac(a sqrt(21), 7)$

Chọn A.
],
"bai-mau-5":[

#figure("image113.svg")


$lr(( hat(S B ";" lr(( A B C D ))) )) = hat(S B O) = 45 ° ⇒ Δ S O B$ vuông cân tại $O$

$ d lr(( O ";" lr(( S C D )) )) = O H = frac(S O . O K, sqrt(S O ^(2) + O K ^(2))) $

Có $cases(display(O K = frac(1, 2) B C = frac(a, 2)), display(S O = O B = frac(1, 2) B D = frac(a sqrt(2), 2))) ⇒ d lr(( O ";" lr(( S C D )) )) = frac(frac(a sqrt(2), 2) . frac(a, 2), sqrt(lr(( frac(a sqrt(2), 2) )) ^(2) + lr(( frac(a, 2) )) ^(2))) = frac(a sqrt(6), 6)$.
],
"bai-mau-6":[

#figure("image124.svg")


Lăng trụ tam giác đều là:

+ Lăng trụ đứng $⇔$ cạnh bên vuông góc với đáy

+ Đáy là tam giác đều

$A$ là chân đường cao $⇒$ bài toán “3 nét dựng”

$ ⇒ d lr(( A ";" lr(( A ' B C )) )) = A H = frac(A A ' . A K, sqrt(A A ' ^(2) + A K ^(2))) $

Có $cases(display(A K = frac(a sqrt(3), 2) lr(( Δ A B C "đều" ))), display(lr(( hat(A ' B ";" lr(( A B C ))) )) = hat(A ' B A) = 60 ° ⇒ A A ' = tan 60 ° . A B = a sqrt(3)))$

$ ⇒ d lr(( A ";" lr(( A ' B C )) )) = frac(a sqrt(3) . frac(a sqrt(3), 2), sqrt(lr(( a sqrt(3) )) ^(2) + lr(( frac(a sqrt(3), 2) )) ^(2))) = frac(a sqrt(15), 5) $
],
"bai-mau-7":[

#figure("image143.svg")


$Δ A C D$ vuông tại $C$

Tính $d lr(( A ";" lr(( S C D )) )) = A H = frac(S A . A C, sqrt(S A ^(2) + A C ^(2)))$

Có $cases(display(A C = sqrt(A B ^(2) + B C ^(2)) = sqrt(a ^(2) + a ^(2)) = a sqrt(2)), display(S A = sqrt(S D ^(2) - A D ^(2)) = sqrt(lr(( a sqrt(5) )) ^(2) - lr(( 2 a )) ^(2)) = a))$

$ ⇒ d lr(( A ";" lr(( S C D )) )) = frac(a . a sqrt(2), sqrt(a ^(2) + lr(( a sqrt(2) )) ^(2))) = frac(a sqrt(6), 3) $

Chọn C.
],
"bai-mau-8":[

#figure("image155.svg")


$ d lr(( A ";" lr(( S C D )) )) = A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2))) $

Có $cases(display(S A = sqrt(S D ^(2) - A D ^(2)) = sqrt(lr(( a sqrt(5) )) ^(2) - lr(( 2 a )) ^(2)) = a), display(A K = frac(2 S _(Δ A C D), C D) = frac(2 . frac(1, 2) . C E . A D, sqrt(C E ^(2) + E D ^(2))) = frac(2 a . 2 a, sqrt(lr(( 2 a )) ^(2) + a ^(2))) = frac(4 sqrt(5) a, 5)))$

$ ⇒ d lr(( A ";" lr(( S C D )) )) = frac(a . frac(4 a sqrt(5), 5), sqrt(a ^(2) + lr(( frac(4 a sqrt(5), 5) )) ^(2))) = frac(4 a sqrt(21), 21). $

Chọn A.
],
"tu-luyen-1":[
Tính $d lr(( A ";" lr(( S B C )) )) ?$


#figure("practice1.svg")


$A$ là chân đường cao  $⇒$ 3 nét dựng

+) Nét 1: Kẻ $A K ⊥ B C$

$⇒ K ≡ B ","$ do $Δ A B C$ vuông tại $B$.

+) Nét 2: Nối $S B$

+) Nét 3: Kẻ $A H ⊥ S B$.

$ ⇒ A H ⊥ lr(( S B C )) ⇒ d lr(( A ";" lr(( S B C )) )) = A H $

Tính $A H$

Xét $Δ S A B$ có: $A H = frac(S A . A B, sqrt(S A ^(2) + A B ^(2))) = frac(a . a, sqrt(a ^(2) + a ^(2))) = frac(a sqrt(2), 2)$.

Chọn D.
],
"tu-luyen-2":[
Tính $d lr(( A ";" lr(( S B C )) )) ?$


#figure("image191.svg")


$A$ là chân đường cao $⇒$ Bài toán 3 nét dựng

+) Nét 1: Kẻ $A K ⊥ B C$

+) Nét 2: Nối $S K$

+) Nét 3: Hạ $A H ⊥ S K$

$ ⇒ d lr(( A ";" lr(( S B C )) )) = A H $

Tính $A H$: $A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

Có: $cases(display(S A = 2 a), display(A K = frac(A B . A C, sqrt(A B ^(2) + A C ^(2))) = frac(1 . sqrt(3), sqrt(1 ^(2) + lr(( sqrt(3) )) ^(2))) . a = frac(sqrt(3), 2) a))$

$ ⇒ A H = frac(2 . frac(sqrt(3), 2), sqrt(2 ^(2) + lr(( frac(sqrt(3), 2) )) ^(2))) . a = frac(2 sqrt(57), 19) a $

$ ⇒ d lr(( A ";" S B C )) = frac(2 sqrt(57), 19) a $

Chọn D.
],
"tu-luyen-3":[
Tính $d lr(( A ";" lr(( S B C )) )) ?$


#figure("image209.svg")


$S A ⊥ (A B C)$ nên $A$ là chân đường cao của hình chóp.

$⇒$ Bài toán 3 nét dựng

+) Nét 1: Kẻ $A K ⊥ B C$(do $Δ A B C$ đều $⇒ K$là trung điểm $B C$)

+) Nét 2: Nối $S K$

+) Nét 3: Kẻ $A H ⊥ S K$

$ ⇒ d lr(( A ";" lr(( S B C )) )) = A H $

Tính $A H$:   $A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

Ta có: $cases(display(S A = a), display(A K = frac(sqrt(3), 2) a))$

$ ⇒ A H = frac(1 . frac(sqrt(3), 2), sqrt(1 ^(2) + lr(( frac(sqrt(3), 2) )) ^(2))) . a = frac(sqrt(21), 7) a $

$ ⇒ d lr(( A ";" lr(( S B C )) )) = frac(sqrt(21), 7) a $

Chọn C.
],
"tu-luyen-4":[
Tính $d lr(( A ";" S B C )) ?$


#figure("image236.svg")


$A$ là chân đường cao

$⇒$ Bài toán 3 nét dựng

$⇒ d lr(( A ";" lr(( S B C )) )) = A H$(Hình vẽ)

Tính $A H$



$ A H = frac(S A . A B, sqrt(S A ^(2) + A B ^(2))) = frac(1 . sqrt(3), sqrt(1 ^(2) + lr(( sqrt(3) )) ^(2))) . a = frac(sqrt(3), 2) a $

$ ⇒ d lr(( A ";" lr(( S B C )) )) = frac(a sqrt(3), 2) $



Chọn D.
],
"tu-luyen-5":[
Tính $d lr(( A ";" S B D )) ?$


#figure("image253.svg")


$A$ là chân đường cao $⇒$ 3 nét dựng

+) Nét 1: Kẻ $A K ⊥ B D$

($K ≡ O$, do đáy là hình vuông nên 2 đường chéo $⊥$ với nhau)

+) Nét 2: Nối $S O$

+) Nét 3: Kẻ $A H ⊥ S O$

$ ⇒ d lr(( A ";" lr(( S B D )) )) = A H $

Tính $A H$:   $A H = frac(S A . A O, sqrt(S A ^(2) + A O ^(2)))$

Có: $cases(display(S A = 2 a), display(A O = frac(1, 2) . A C = frac(1, 2) . a sqrt(2) = frac(a sqrt(2), 2)))$



$ ⇒ A H = frac(2 . frac(sqrt(2), 2), sqrt(2 ^(2) + lr(( frac(sqrt(2), 2) )) ^(2))) . a = frac(2 a, 3) $

$ ⇒ d lr(( A ";" lr(( S B D )) )) = frac(2 a, 3) $



Chọn A.
],
"tu-luyen-6":[
Tính $d lr(( O ";" lr(( S C D )) )) ?$


#figure("image273.svg")


$O$ là chân đường cao $⇒$ 3 nét dựng

4 mặt bên như nhau nên ta chọn 1 mặt bất kỳ, chọn mặt $( S C D )$ cho dễ dựng đẹp.

$ d lr(( O ";" lr(( S C D )) )) = O H = frac(O K . S O, sqrt(O K ^(2) + S O ^(2))) $

$ cases(display(O K = frac(1, 2) B C = frac(a, 2)), display(S O = a sqrt(2))) $

$ ⇒ d lr(( O ";" lr(( S C D )) )) = frac(frac(1, 2) . sqrt(2), sqrt(lr(( frac(1, 2) )) ^(2) + lr(( sqrt(2) )) ^(2))) . a = frac(a sqrt(2), 3) $

Chọn D.
],
"tu-luyen-7":[
Tính $d lr(( A ";" lr(( A' B C )) )) ?$


#figure("image289.svg")


$A$ là chân đường cao $⇒$ 3 nét dựng

+) Nét 1: Kẻ $A K ⊥ B C$ ($K$ là trung điểm $B C$, do $Δ A B C$ đều)

+) Nét 2: Nối $A ' K$

+) Nét 3: Kẻ $A H ⊥ A ' K ⇒ d lr(( A ";" lr(( A' B C )) )) = A H$

Tính $A H$

Xét $Δ A ' A K$ vuông tại $A$ có: $A H = frac(A A ' . A K, sqrt(A A ' ^(2) + A K ^(2)))$

Có: $cases(display(A A ' = a), display(A K = frac(a sqrt(3), 2)))$ ( Chiều cao trong $Δ$ đều)



$ ⇒ A H = frac(1 . frac(sqrt(3), 2), sqrt(1 ^(2) + lr(( frac(sqrt(3), 2) )) ^(2))) . a = frac(sqrt(21), 7) a $

$ ⇒ d lr(( A ";" lr(( A ' B C )) )) = frac(sqrt(21), 7) a $



Chọn C.
],
"tu-luyen-8":[
#figure("image317.svg")

Tính $d lr(( A ";" lr(( B C D )) ))$?


*Cách 1:*

Mô hình: $A B = 3 ";" A C = 4 ";" B C = 5 ⇒ Δ A B C$ vuông tại $A$.

$D A ⊥ ( A B C ) ⇒ A$là chân đường cao $⇒$ Bài toán 3 nét dựng

+) Nét 1: Kẻ $A K ⊥ B C$

+) Nét 2: Nối $D K$

+) Nét 3: Kẻ $A H ⊥ D K ⇒ d lr(( A ";" lr(( B C D )) )) = A H$

Tính $A H$:   $A H = frac(D A . A K, sqrt(D A ^(2) + A K ^(2)))$

Có: $cases(display(D A = 4), display(A K = frac(A B . A C, sqrt(A B ^(2) + A C ^(2))) = frac(3 . 4, sqrt(3 ^(2) + 4 ^(2))) = frac(12, 5)))$

$ ⇒ A H = frac(4 . frac(12, 5), sqrt(4 ^(2) + lr(( frac(12, 5) )) ^(2))) = frac(6 sqrt(34), 17) $

$ ⇒ d lr(( A ";" lr(( B C D )) )) = frac(6 sqrt(34), 17) $

*Cách 2: Ghi nhớ công thức nhanh của tam diện $⊥$*

Cho $S . A B C$ có $S A ⊥ lr(( A B C ))$,

$A B C$ là $Δ ⊥$ tại $A ⇒$ tại đỉnh $A$ có 3 góc vuông

$⇒$ Gọi $S . A B C$ là $Δ$ diện $⊥$ đỉnh $A$

$ ⇒ frac(1, d ^(2) lr(( A ";" S B C ))) = frac(1, S A ^(2)) + frac(1, A B ^(2)) + frac(1, A C ^(2)) $

*Chứng minh:*

Ta có $d lr(( A ";" lr(( S B C )) )) = A H$

$frac(1, A H ^(2)) = frac(1, S A ^(2)) + frac(1, A K ^(2))$ mà $frac(1, A K ^(2)) = frac(1, A B ^(2)) + frac(1, A C ^(2))$

$⇒ frac(1, A H ^(2)) = frac(1, S A ^(2)) + frac(1, A B ^(2)) + frac(1, A C ^(2))$(đpcm)

Áp dụng giải bài 8

Tứ diện $D . A B C$ là tứ diện vuông tại đỉnh $A$.

$⇒$ Không cần dựng khoảng cách ta áp dụng công thức khoảng cách trong $Δ$ diện $⊥$ ta có:

$frac(1, d ^(2) lr(( A ";" lr(( B C D )) ))) = frac(1, A D ^(2)) + frac(1, A B ^(2)) + frac(1, A C ^(2))$=$frac(1, 4 ^(2)) + frac(1, 3 ^(2)) + frac(1, 4 ^(2))$



$ ⇒ frac(1, d ^(2) lr(( A ";" lr(( B C D )) ))) = frac(17, 72) $

$ ⇒ d lr(( A ";" lr(( B C D )) )) = frac(6 sqrt(34), 17) $



Chọn C.
],
"tu-luyen-9":[
Tính $d lr(( A ";" lr(( S B C )) )) ?$


#figure("image371.svg")


$A$ là chân đường cao $⇒$ 3 nét dựng $⇒ d lr(( A ";" lr(( S B C )) )) = A H$

Tính $A H$:    $A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

Có: $cases(display(S A = 3 a), display(A K = sin ∠ A B C . A B = sin 60 ° . a = frac(a sqrt(3), 2)))$



$ ⇒ A H = frac(3 . frac(sqrt(3), 2), sqrt(3 ^(2) + lr(( frac(sqrt(3), 2) )) ^(2))) . a = frac(3 a sqrt(13), 13) $

$ ⇒ d lr(( A ";" lr(( S B C )) )) = frac(3 a sqrt(13), 13) $



Chọn D.
],
"tu-luyen-10":[
Tính $d lr(( A ";" lr(( A' B K )) ))$


#figure("image392.svg")


“Đây là 1 bài toán khó”

Ở bài toán này các em cần tiếp cận kỹ thuật “Mở rộng mặt phẳng” để đưa về bài toán chân đường cao

Hình chiếu của $K$ xuống đáy là $C$, không thuộc giao tuyến cần dùng; ta mở rộng mặt phẳng $(A' B K)$ để áp dụng mô hình chân đường cao $A$.

$⇒$ Cần mở rộng mp $lr(( A' B K ))$ xuống mặt phẳng đáy

Kéo dài $A' K ∩ A C = E ⇒ lr(( A' B K )) ≡ lr(( A' B E ))$

Ta cũng thấy $K C$ là đường trung bình của $Δ E A A' ⇒ C$là trung điểm của $A E$

$ ⇒ A E = 2 A C = 4 a $

$ ⇒ d lr(( A ";" lr(( A' B K )) )) = d lr(( A ";" lr(( A' B E )) )) $

$⇒$ là bài toán chân đường cao, 3 nét dựng

+) Nét 1: Kẻ $A I ⊥ B E$

+) Nét 2: Nối $A' I$

+) Nét 3: Kẻ $A H ⊥ A' I$

$ ⇒ d lr(( A ";" lr(( A' B E )) )) = A H $

Tính $A H$:  $A H = frac(A A' . A I, sqrt((A A') ^(2) + A I ^(2)))$

+) $A A' = 2 a$

+) $A I = frac(2 S _(Δ A B E), B E)$

Có: $cases(display(S _(Δ A B E) = frac(1, 2) . A B . A E . sin A = frac(1, 2) . a . 4 a . sin 120 ° = sqrt(3) a ^(2)), display(B E ^(2) = A B ^(2) + A E ^(2) - 2 A B . A E . cos ∠ A = a ^(2) + (4 a) ^(2) - 2 . a . 4 a . cos 120 ° = 21 a ^(2)))$

$ ⇒ B E = a sqrt(21) $



$ ⇒ A I = frac(2 . sqrt(3) a ^(2), a sqrt(21)) = frac(2 a sqrt(7), 7) $

$ ⇒ A H = frac(2 . frac(2 sqrt(7), 7), sqrt(2 ^(2) + lr(( frac(2 sqrt(7), 7) )) ^(2))) . a = frac(a sqrt(2), 2) $

$ ⇒ d lr(( A ";" lr(( A' B E )) )) = frac(a sqrt(2), 2) $



Chọn D.
],
)
