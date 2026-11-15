#import "figures.typ": figure
#let solutions=(
"bai-mau-1":[

#figure("image25.svg")

#block(inset:(left:5mm),above:3mm,below:3mm)[a) Tính $d lr(( B ";" lr(( S C D )) ))$]

Đổi $B → A : B A ∥ C D ⇒ B A ∥ lr(( S C D ))$

$⇒$ Trường hợp đổi điểm song song

$ ⇒ d lr(( B ";" lr(( S C D )) )) = d lr(( A ";" lr(( S C D )) )) lr(( 1 )) $

Tính $d lr(( A ";" lr(( S C D )) )) = A H = frac(S A . A D, sqrt(S A ^(2) + A D ^(2))) = frac(a . 2 a, sqrt(a ^(2) + lr(( 2 a )) ^(2))) = frac(2 a sqrt(5), 5) lr(( 2 ))$

Từ $lr(( 1 )) "," lr(( 2 )) ⇒ d lr(( B ";" lr(( S C D )) )) = frac(2 a sqrt(5), 5)$.

#block(inset:(left:5mm),above:3mm,below:3mm)[b) Tính $d lr(( C ";" lr(( S B D )) ))$]

Đổi $C → A : A C ∩ lr(( S B D )) = O$

$ ⇒ frac(d lr(( C ";" lr(( S B D )) )), d lr(( A ";" lr(( S B D )) ))) = frac(C O, A O) = 1 ⇒ d lr(( C ";" lr(( S B D )) )) = d lr(( A ";" lr(( S B D )) )) lr(( 3 )) $

Tính $d lr(( A ";" lr(( S B D )) )) = A I = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

Có $S A = a$

$ A K = frac(A B . A D, sqrt(A B ^(2) + A D ^(2))) = frac(a . 2 a, sqrt(a ^(2) + lr(( 2 a )) ^(2))) = frac(2 a sqrt(5), 5) $

$ ⇒ d lr(( A ";" lr(( S B D )) )) = frac(a . frac(2 a sqrt(5), 5), sqrt(a ^(2) + lr(( frac(2 a sqrt(5), 5) )) ^(2))) = frac(2 a, 3) lr(( 4 )) $

Từ $lr(( 3 )) "," lr(( 4 )) ⇒ d lr(( C ";" lr(( S B D )) )) = frac(2 a, 3)$.
],
"bai-mau-2":[

#figure("image51.svg")

Đổi $M → C ";" M C ∩ lr(( S B D )) = S$

$ ⇒ frac(d lr(( M ";" lr(( S B D )) )), d lr(( C ";" lr(( S B D )) ))) = frac(M S, C S) = frac(1, 2) ⇒ d lr(( M ";" lr(( S B D )) )) = frac(1, 2) d lr(( C ";" lr(( S B D )) )) $

Đổi $C → A : A C ∩ lr(( S B D )) = O$

$ ⇒ frac(d lr(( C ";" lr(( S B D )) )), d lr(( A ";" lr(( S B D )) ))) = frac(C O, A O) = 1 ⇒ d lr(( C ";" lr(( S B D )) )) = d lr(( A ";" lr(( S B D )) )) $

$ ⇒ d lr(( M ";" lr(( S B D )) )) = frac(1, 2) d lr(( A ";" lr(( S B D )) )) lr(( 1 )) $

Tính $d lr(( A ";" lr(( S B D )) ))$

$ frac(1, d ^(2)) = frac(1, S A ^(2)) + frac(1, A B ^(2)) + frac(1, A D ^(2)) = frac(1, lr(( a sqrt(2) )) ^(2)) + frac(1, a ^(2)) + frac(1, a ^(2)) = frac(5, 2 a ^(2)) $

$ ⇒ d ^(2) = frac(2 a ^(2), 5) ⇒ d = sqrt(frac(2 a ^(2), 5)) = frac(sqrt(10) a, 5) lr(( 2 )) $

Từ $lr(( 1 )) "," lr(( 2 )) ⇒ d lr(( M ";" lr(( S B D )) )) = frac(1, 2) . frac(sqrt(10) a, 5) = frac(sqrt(10) a, 10)$.

Chọn B.
],
"bai-mau-3":[

#figure("image70.svg")

Đổi $B → O : B O ∩ lr(( S C D )) = D$

$ ⇒ frac(d lr(( B ";" lr(( S C D )) )), d lr(( O ";" lr(( S C D )) ))) = frac(B D, O D) = 2 ⇒ d lr(( B ";" lr(( S C D )) )) = 2 d lr(( O ";" lr(( S C D )) )) lr(( 1 )) $

Tính $d lr(( O ";" lr(( S C D )) )) = O H = frac(S O . O K, sqrt(S O ^(2) + O K ^(2)))$

Có $B D = A C = a sqrt(2) ⇒ O B = frac(a sqrt(2), 2)$

$ S O = sqrt(S B ^(2) - O B ^(2)) = sqrt(lr(( frac(a sqrt(5), 2) )) ^(2) - lr(( frac(a sqrt(2), 2) )) ^(2)) = frac(a sqrt(3), 2) $

$ O K = frac(1, 2) B C = frac(a, 2) $

$ ⇒ d lr(( O ";" lr(( S C D )) )) = frac(frac(a sqrt(3), 2) . frac(a, 2), sqrt(lr(( frac(a sqrt(3), 2) )) ^(2) + lr(( frac(a, 2) )) ^(2))) = frac(a sqrt(3), 4) lr(( 2 )) $

Từ $lr(( 1 )) "," lr(( 2 )) ⇒ d lr(( B ";" lr(( S C D )) )) = 2 . frac(a sqrt(3), 4) = frac(a sqrt(3), 2)$.

Chọn C.
],
"bai-mau-4":[

#figure("image88.svg")

Đáy $A B C D$ gồm hai tam giác đều là $Δ A B D$ và $Δ B C D$ cạnh $a$

Đổi $B → A ";" B A ∥ lr(( S C D )) ⇒ d lr(( B ";" lr(( S C D )) ))  = d lr(( A ";" lr(( S C D )) )) lr(( 1 ))$

Tính $d lr(( A ";" lr(( S C D )) )) = A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

Có $S A = a$

$ A K = B E = frac(a sqrt(3), 2) $

$ ⇒ d lr(( A ";" lr(( S C D )) )) = frac(a . frac(a sqrt(3), 2), sqrt(a ^(2) + lr(( frac(a sqrt(3), 2) )) ^(2))) = frac(a sqrt(21), 7) lr(( 2 )) $

Từ $lr(( 1 )) "," lr(( 2 )) ⇒ d lr(( B ";" lr(( S C D )) )) = frac(a sqrt(21), 7)$.

Chọn A.
],
"bai-mau-5":[

#figure("image112.svg")

$lr(( S A B )) ⊥ lr(( A B C D )) ⇒$ chiều cao của hình chóp là chiều cao của $Δ S A B ⇒$ hình vẽ

Đổi $A → H : A H ∥ lr(( S C D )) ⇒ d lr(( A ";" lr(( S C D )) )) = d lr(( H ";" lr(( S C D )) ))$

$ d lr(( H ";" lr(( S C D )) )) = H I = frac(S H . H K, sqrt(S H ^(2) + H K ^(2))) $

Có $S H = frac(1, 2) A B = frac(a sqrt(2), 2)$

$ H K = a sqrt(2) $

$ ⇒ d lr(( H ";" lr(( S C D )) )) = frac(frac(a sqrt(2), 2) . a sqrt(2), sqrt(lr(( frac(a sqrt(2), 2) )) ^(2) + lr(( a sqrt(2) )) ^(2))) = frac(a sqrt(10), 5) $

$ ⇒ d lr(( A ";" lr(( S C D )) )) = frac(a sqrt(10), 5). $

Chọn B.
],
"bai-mau-6":[

#figure("image126.svg")

Đổi $A → H : A H ∩ lr(( S B D )) = B ⇒ frac(d lr(( A ";" lr(( S B D )) )), d lr(( H ";" lr(( S B D )) ))) = frac(A B, H B) = 2$

$ ⇒ d lr(( A ";" lr(( S B D )) )) = 2 d lr(( H ";" lr(( S B D )) )) lr(( 1 )) $

Tính $d lr(( H ";" lr(( S B D )) )) = H I = frac(S H . H K, sqrt(S H ^(2) + H K ^(2)))$

Có $S H = frac(a sqrt(3), 2)$

$ H K = frac(1, 2) A O = frac(1, 4) A C = frac(a sqrt(2), 4) $

$ ⇒ H I = frac(frac(a sqrt(3), 2) . frac(a sqrt(2), 4), sqrt(lr(( frac(a sqrt(3), 2) )) ^(2) + lr(( frac(a sqrt(2), 4) )) ^(2))) = frac(a sqrt(21), 14) lr(( 2 )) $

Từ $lr(( 1 )) "," lr(( 2 )) ⇒ d lr(( A ";" lr(( S B D )) )) = 2 . frac(a sqrt(21), 14) = frac(a sqrt(21), 7)$.

Chọn B.
],
"bai-mau-7":[

#figure("image145.svg")

Đổi $M → A : M A ∩ lr(( A ' B C )) = I$

$ ⇒ frac(d lr(( M ";" lr(( A ' B C )) )), d lr(( A ";" lr(( A ' B C )) ))) = frac(M I, A I) = frac(M C, A A ') = frac(1, 2) ⇒ d lr(( M ";" lr(( A ' B C )) )) = frac(1, 2) d lr(( A ";" lr(( A ' B C )) )) lr(( 1 )) $

Tính $d lr(( A ";" lr(( A ' B C )) )) = A H = frac(A A ' . A K, sqrt(A A ' ^(2) + A K ^(2)))$

Có $A A ' = 2 a$

$ A K = frac(a sqrt(3), 2) $

$ ⇒ d lr(( A ";" lr(( A ' B C )) )) = frac(2 a . frac(a sqrt(3), 2), sqrt(lr(( 2 a )) ^(2) + lr(( frac(a sqrt(3), 2) )) ^(2))) = frac(2 a sqrt(57), 19) lr(( 2 )) $

Từ $lr(( 1 )) "," lr(( 2 )) ⇒ d lr(( M ";" lr(( A ' B C )) )) = frac(1, 2) . frac(2 a sqrt(57), 19) = frac(a sqrt(57), 19)$.

Chọn D.
],
"bai-mau-8":[

#figure("image167.svg")

$ S A = sqrt(S D ^(2) - A D ^(2)) = sqrt(lr(( a sqrt(5) )) ^(2) - lr(( 2 a )) ^(2)) = a $

$⇒ Δ S A B$ cân tại $A$ mà $A H ⊥ S B ⇒ H$ là trung điểm của $S B$

Đổi $H → B : H B ∩ lr(( S C D )) = S ⇒ frac(d lr(( H ";" lr(( S C D )) )), d lr(( B ";" lr(( S C D )) ))) = frac(H S, B S) = frac(1, 2)$

$ ⇒ d lr(( H ";" lr(( S C D )) )) = frac(1, 2) d lr(( B ";" lr(( S C D )) )) lr(( 1 )) $

Đổi $B → A : B A ∩ lr(( S C D )) = E ⇒ frac(d lr(( B ";" lr(( S C D )) )), d lr(( A ";" lr(( S C D )) ))) = frac(B E, A E) = frac(1, 2)$

$ ⇒ d lr(( B ";" lr(( S C D )) )) = frac(1, 2) d lr(( A ";" lr(( S C D )) )) lr(( 2 )) $

Từ $lr(( 1 )) "," lr(( 2 )) ⇒ d lr(( H ";" lr(( S C D )) )) = frac(1, 4) d lr(( A ";" lr(( S C D )) )) lr(( 3 ))$

Tính $d lr(( A ";" lr(( S C D )) )) = A K = frac(S A . A C, sqrt(S A ^(2) + A C ^(2))) = frac(a . a sqrt(2), sqrt(a ^(2) + lr(( a sqrt(2) )) ^(2))) = frac(a sqrt(6), 3) lr(( 4 ))$

Từ $lr(( 3 )) "," lr(( 4 )) ⇒ d lr(( H ";" lr(( S C D )) )) = frac(1, 4) . frac(a sqrt(6), 3) = frac(a sqrt(6), 12)$.

Chọn A.
],
"tu-luyen-1":[

#figure("image192.svg")

Mô hình chóp tứ giác đều $⇒$ hình vẽ.

Đổi điểm: 

Đổi $B → O$: $O B ∩ lr(( S C D )) = D$.

$⇒$ Đổi điểm giao cắt.

$⇒ frac(d lr(( B ";" lr(( S C D )) )), d lr(( O ";" lr(( S C D )) ))) = frac(B D, O D) = 2 ⇒ d lr(( B ";" lr(( S C D )) )) = 2 d lr(( O ";" lr(( S C D )) )) quad "(1)"$.

Tính $d lr(( O ";" lr(( S C D )) )) = O H = frac(S O . O K, sqrt(S O ^(2) + O K ^(2)))$.

Có $S O = a sqrt(2)$

$ O K = frac(1, 2) B C = frac(1, 2) a $

$ ⇒ O H = frac(a ^(2) . sqrt(2) . frac(1, 2), a . sqrt(2 + frac(1, 4))) = frac(a sqrt(2), 3) ⇒ d lr(( O ";" lr(( S C D )) )) = frac(sqrt(2), 3) a quad "(2)". $

Từ (1) + (2) $⇒ d lr(( B ";" lr(( S C D )) )) = frac(2 sqrt(2), 3) a$.

Chọn A.
],
"tu-luyen-2":[

#figure("image220.svg")

Đáy $A B C D$ là hình thoi có góc $∠ A B C = 60 ° ⇒ A B C D$ cấu tạo bởi 2 tam giác đều là $A B C$ và $A C D$ cạnh $a$.

Đổi điểm:

Đổi $B → A$: $B A ∥ C D ⇒ B A ∥ lr(( S C D ))$.

$⇒$ Đổi điểm $∥ ⇒ d lr(( B ";" lr(( S C D )) )) = d lr(( A ";" lr(( S C D )) )) quad "(1)"$.

Tính $d lr(( A ";" lr(( S C D )) )) = A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$.

Có $S A = sqrt(S C ^(2) - A C ^(2)) = a sqrt(2 ^(2) - 1 ^(2)) = a sqrt(3)$

$ A K = frac(sqrt(3), 2) lr(( "cạnh tam giác đều" )) = frac(sqrt(3), 2) a $

$ ⇒ d lr(( A ";" lr(( S C D )) )) = frac(a ^(2) . sqrt(3) . frac(sqrt(3), 2), a . sqrt(3 + frac(3, 4))) = frac(a sqrt(15), 5) quad "(2)". $

Từ (1) + (2) $⇒ d lr(( B ";" lr(( S C D )) )) = frac(sqrt(15), 5) a$.

Chọn A.
],
"tu-luyen-3":[

#figure("image240.svg")

Hình chóp có mặt bên $lr(( S B C )) ⊥$ đáy $⇒$ hình vẽ.

Đổi điểm:

Đổi $B → H$: $B H ∩ lr(( S A C )) = C$.

$⇒$ đổi điểm giao cắt.

$⇒ frac(d lr(( B "," lr(( S A C )) )), d lr(( H "," lr(( S A C )) ))) = frac(B C, H C) = 2 ⇒ d lr(( B "," lr(( S A C )) )) = 2 d lr(( H "," lr(( S A C )) )) quad "(1)"$.

Tính $d lr(( H ";" lr(( S A C )) )) = frac(S H . H K, sqrt(S H ^(2) + H K ^(2))) .$

+) $Δ S B C$ đều có $B C = sqrt(A B ^(2) + A C ^(2)) = 2 a ⇒ S H = frac(sqrt(3), 2) . lr(( 2 a )) = a sqrt(3)$

+) $H K ∥ A B$ và $H K = frac(1, 2) A B = frac(a, 2) ⇒ d lr(( H "," lr(( S A C )) )) = frac(a ^(2) sqrt(3) . frac(1, 2), a sqrt(3 + frac(1, 4))) = frac(a sqrt(39), 13) quad "(2)"$.

Từ (1) + (2) $⇒ d lr(( B ";" lr(( S A C )) )) = frac(2 sqrt(39), 13) a .$

Chọn C.
],
"tu-luyen-4":[

#figure("image271.svg")

Mô hình:

+) Đáy là hình thoi có $∠ A = 60 °$

$⇒ Δ A B D$ và $Δ B C D$ đều cạnh $2 a .$

+) Mặt bên $S A B$ là $Δ$ đều và đáy $lr(( S A B )) ⊥$ đáy.

$⇒$ chiều cao hình chóp là $S H$ (với $H$ là trung điểm $A B$) $⇒$ hình vẽ.

Đổi điểm:

Đổi $B → H$: $B H ∩ lr(( S A C )) = A$.

$⇒$ Đổi điểm giao cắt.

$⇒ frac(d lr(( B ";" lr(( S A C )) )), d lr(( H ";" lr(( S A C )) ))) = frac(B A, H A) = 2 ⇒ d lr(( B ";" lr(( S A C )) )) = 2 d lr(( H ";" lr(( S A C )) )) quad "(1)"$.

Tính $d lr(( H ";" lr(( S A C )) )) →$ “chân đường cao, 3 nét dựng”

+) Nét 1: Kẻ $H K ⊥ A C ⇒ H K ∥ B D$ (do 2 đường chéo hình thoi vuông góc với nhau) $⇒ H K = frac(1, 2) B O = frac(1, 4) B D = frac(a, 2) .$

+) Nét 2: Nối $S K .$

+) Nét 3: Hạ $H I ⊥ S K ⇒ d lr(( H ";" lr(( S A C )) )) = H I .$

+) Có: $H I = frac(S H . H K, sqrt(S H ^(2) + H K ^(2))) .$

$ S H = frac(sqrt(3), 2) . 2 a = a sqrt(3) $

$ H K = frac(a, 2) $

$ ⇒ H I = frac(a ^(2) . sqrt(3) . frac(1, 2), a . sqrt(3 + frac(1, 4))) = frac(a sqrt(39), 13) ⇒ d lr(( H ";" lr(( S A C )) )) = frac(a sqrt(39), 13) quad "(2)". $

Từ (1) + (2) $⇒ d lr(( B ";" lr(( S A C )) )) = frac(2 sqrt(39), 13) a .$

Chọn D.
],
"tu-luyen-5":[

#figure("image301.svg")

Mô hình:

+) Đáy là hình thoi có $∠ A = 60 ° ⇒ Δ A B D$ và $Δ B C D$ đều cạnh $2 a .$

+) Mặt bên $S A B$ là $Δ$ đều và đáy $lr(( S A B )) ⊥$ đáy.

$⇒$ chiều cao hình chóp là chiều cao của $Δ S A B ⇒ S H ⊥ lr(( A B C D ))$ (với $H$ là trung điểm $A B$) $⇒$ hình vẽ.

Đổi điểm:

Đổi $B → H$: $B H ∥ lr(( S C D ))$.

$⇒$ đổi điểm song song.

$⇒ d lr(( B "," lr(( S C D )) )) = d lr(( H "," lr(( S C D )) )) quad "(1)"$

Tính $d lr(( H ";" lr(( S C D )) )) →$ “chân đường cao, 3 nét dựng”

+) Nét 1: Từ $H$ kẻ vuông góc với $C D ⇒$ đó chính là  $D H$ (do $Δ A B D$ đều $D H ⊥ A B$ mà $A B ∥ C D ⇒ D H ⊥ C D$)

$⇒$“ Nếu không nhìn thấy thì em phải phẳng hóa đáy ”

+) Nét 2: Nối $S D .$

+) Nét 3: Kẻ $H K ⊥ S D ⇒ d lr(( H ";" lr(( S C D )) )) = H K = frac(S H . H D, sqrt(S H ^(2) + H D ^(2))) .$

Có: $H K = frac(S H . H D, sqrt(S H ^(2) + H D ^(2)))$.

$ S H = frac(sqrt(3), 2) . 2 a = a sqrt(3) $

$ H D = frac(sqrt(3), 2) . 2 a = a sqrt(3) $

$ ⇒ d lr(( H ";" lr(( S C D )) )) = frac(a ^(2) . sqrt(3) . sqrt(3), a . sqrt(3 + 3)) = frac(3, sqrt(6)) . a = frac(a sqrt(6), 2) ⇒ d lr(( H ";" lr(( S C D )) )) = frac(a sqrt(6), 2) quad "(2)" $

Từ (1) + (2) $⇒ d lr(( B ";" lr(( S C D )) )) = frac(sqrt(6), 2) a .$

Chọn C.
],
"tu-luyen-6":[

#figure("image334.svg")

Mô hình: Chóp có mặt bên vuông góc với đáy.

$ Δ S A B "cân tại" S $

$ lr(( S A B )) ⊥ lr(( "đáy" )) $

$ ⇒ S H ⊥ lr(( A B C )) $

 với $H$ là trung điểm của $A B ⇒$ hình vẽ.

$ S A = S B = a $

$ ⇒ A B = sqrt(S A ^(2) + S B ^(2)) = a sqrt(2). $

$⇒ Δ A B C$ đều cạnh $a sqrt(2)$.

Đổi điểm:

Đổi $B → H$: $B H ∩ lr(( S A C )) = A$.

$⇒$ đổi điểm giao cắt $⇒ frac(d lr(( B ";" lr(( S A C )) )), d lr(( H ";" lr(( S A C )) ))) = frac(B A, H A) = 2$

$⇒ d lr(( B ";" lr(( S A C )) )) = 2 d lr(( H ";" lr(( S A C )) )) quad "(1)"$

Tính $d lr(( H ";" lr(( S A C )) )) →$ “chân đường cao, 3 nét dựng”

+) Nét 1: Kẻ $H K ⊥ A C$ ($H K ∥ B I$, do $Δ A B C$ đều $⇒ B I ⊥ A C$)

$ ⇒ H K = frac(1, 2) B I = frac(1, 2) . frac(sqrt(3), 2) . a sqrt(2) = frac(sqrt(6), 4) a . $

+) Nét 2: Nối $S K .$

+) Nét 3: Kẻ $H E ⊥ S K ⇒ d lr(( H ";" lr(( S A C )) )) = H E = frac(S H . H K, sqrt(S H ^(2) + H K ^(2))) .$

Có: $S H = frac(1, 2) . A B = frac(a sqrt(2), 2)$

$ H K = frac(sqrt(6), 4) . a $

$ ⇒ d lr(( H ";" lr(( S A C )) )) = frac(a ^(2) . frac(sqrt(2), 2) . frac(sqrt(6), 4), a . sqrt(frac(2, 4) + frac(6, 16))) = frac(sqrt(42), 14) . a quad "(2)" $

Từ (1) + (2) $⇒ d lr(( B ";" lr(( S A C )) )) = frac(sqrt(42), 7) a .$

Chọn A.
],
"tu-luyen-7":[

#figure("image363.svg")

Hình vẽ $⇒$ phải đúng.

Đổi điểm:

“ Có thể đổi trực tiếp từ $C → H$ bằng cách kẻ giao cắt $C H ∩ B D ⇒$ tỷ lệ ”

$→$ Bài này thầy sẽ giải bằng “đổi điểm gián tiếp, thông qua điểm trung gian”

Đổi $C → A$: $A C ∩ lr(( S B D )) = O$.

$ ⇒ frac(d lr(( C ";" lr(( S B D )) )), d lr(( A ";" lr(( S B D )) ))) = frac(C O, A O) = 1 ⇒ d lr(( C ";" lr(( S B D )) )) = d lr(( A ";" lr(( S B D )) )) quad "(1)" $

Đổi $A → H$: $A H ∩ lr(( S B D )) = B$.

$ ⇒ frac(d lr(( A ";" lr(( S B D )) )), d lr(( H ";" lr(( S B D )) ))) = frac(A B, H B) = 2 ⇒ d lr(( A ";" lr(( S B D )) )) = 2 d lr(( H ";" lr(( S B D )) )) quad "(2)" $

Từ (1) + (2) $⇒ d lr(( C ";" lr(( S B D )) )) = 2 d lr(( H ";" lr(( S B D )) )) quad "(*)"$

Tính $d lr(( H ";" lr(( S B D )) )) = frac(S H . H K, sqrt(S H ^(2) + H K ^(2)))$

Có: $S H = frac(a sqrt(3), 2)$

$ H K = frac(1, 2) A O = frac(1, 4) A C = frac(sqrt(2), 4) . a $

$ ⇒ d lr(( H ";" lr(( S B D )) )) = frac(a ^(2) . frac(sqrt(3), 2) . frac(sqrt(2), 4), a . sqrt(frac(3, 4) + frac(2, 16))) = frac(sqrt(21), 14) . a quad "(**)" $

Từ (\*) + (\*\*) $⇒ d lr(( C ";" lr(( S B D )) )) = frac(sqrt(21), 7) a .$

Chọn B.
],
"tu-luyen-8":[
#set par(justify:false)
#figure("image385.svg")

Mô hình: lăng trụ đứng có tất cả các cạnh bằng $a$.

Đổi điểm $M → A$. Gọi $I = M A ∩ A'C$, khi đó $I ∈ (A' B C)$. Theo phương pháp đổi điểm giao cắt:

$ frac(d(M; (A' B C)), d(A; (A' B C))) = frac(M I, A I). $

Vì $Δ M I C ∼ Δ A I A'$ nên

$ frac(M I, A I) = frac(M C, A A') = frac(1, 2). $

Suy ra

$ d(M; (A' B C)) = frac(1, 2) d(A; (A' B C)) quad "(1)" $

Tính $d(A; (A' B C))$ theo mô hình chân đường cao, với ba nét dựng:

$ d(A; (A' B C)) = A H = frac(A A' dot A K, sqrt((A A')^2 + A K^2)). $

Có $A A' = a$ và $A K = frac(a sqrt(3), 2)$. Do đó

$ A H &= frac(a dot frac(a sqrt(3), 2), sqrt(a^2 + (frac(a sqrt(3), 2))^2)) \
      &= frac(a sqrt(21), 7) quad "(2)" $

Từ (1) và (2), ta được

$ d(M; (A' B C)) = frac(a sqrt(21), 14). $

Chọn A.
],
"tu-luyen-9":[

#figure("image413.svg")

Mô hình $⇒$ Hình vẽ

Với đáy là hình thang vuông góc tại $A "," B$ có 

$ A B = a "," B C = a $

$ A D = 2 a $

$⇒$ ta có một góc vuông là $A C ⊥ C D .$

Đổi điểm:

Chân đường cao là $H$, ta nhìn thấy ngay, nên đổi trực tiếp từ $B$ về $H$.

Đổi $B → H$: $B H ∥ C D ⇒ B H ∥ lr(( S C D ))$.

$⇒$ đổi điểm song song $⇒ d lr(( B ";" lr(( S C D )) )) = d lr(( H ";" lr(( S C D )) )) quad "(1)"$.

Tính $d lr(( H ";" lr(( S C D )) )) →$ “chân đường cao, 3 nét dựng”

+) Nét 1: Kẻ $H I ⊥ C D ⇒ H I ∥ A C$ (Do $A C ⊥ C D$)

$⇒ H I$ là đường trung bình $Δ D A C ⇒ H I = frac(1, 2) A C = frac(sqrt(2), 2) a .$

+) Nét 2: Nối $S I .$

+) Nét 3: Kẻ $H K ⊥ S I ⇒ d lr(( H ";" lr(( S C D )) )) = H K = frac(S H . H I, sqrt(S H ^(2) + H I ^(2))) .$

Có: $S H = frac(a sqrt(6), 2)$

$ H I = frac(a sqrt(2), 2) $

$ ⇒ H K = frac(a ^(2) . frac(sqrt(6), 2) . frac(sqrt(2), 2), a . sqrt(frac(6, 4) + frac(2, 4))) = frac(sqrt(6), 4) . a ⇒ d lr(( H ";" lr(( S C D )) )) = frac(a sqrt(6), 4) quad "(2)" $

Từ (1) + (2) $⇒ d lr(( B ";" lr(( S C D )) )) = frac(sqrt(6), 4) a .$

Chọn C.
],
)
