#import "figures.typ": figure
#let solutions=(
"bai-hoc-1":[

#figure("image36.svg")


#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[a) $lr(( S C D ))$ và $lr(( A B C D ))$.]

B1: Tìm giao tuyến chung

$ lr(( S C D )) ∩ lr(( A B C D )) = C D $

B2: Xác định 1 mặt phẳng vuông góc với $C D$



$ cases(display(S A ⊥ C D lr(( "do" S A ⊥ lr(( A B C D )) ))), display(A D ⊥ C D lr(( "do ABCD là hình vuông" )))) $

$ ⇒ lr(( S A D )) ⊥ C D $



B3: $cases(display(lr(( S A D )) ∩ lr(( S C D )) = S D), display(lr(( S A D )) ∩ lr(( A B C D )) = A D))$

$⇒ ∠((S C D);(A B C D))=∠(S D;A D)=hat(S D A)$. Trong tam giác $S A D$ vuông tại $A$, $tan hat(S D A)=S A/(A D)=sqrt(3)$, nên góc cần tìm bằng $60°$.

#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[b) $lr(( S B D ))$ và $lr(( A B C D ))$.]

B1: $lr(( S B D )) ∩ lr(( A B C D )) = B D$

B2:  $cases(display(S A ⊥ B D lr(( "do" S A ⊥ lr(( A B C D )) ))), display(A C ⊥ B D lr(( "do ABCD là hình vuông" )))) ⇒ lr(( S A C )) ⊥ B D$

$ cases((S A C) ∩ (S B D)=S O,(S A C) ∩ (A B C D)=A C). $

$ ⇒ ∠ lr(( lr(( S B D )) ";" lr(( A B C D )) )) = ∠ lr(( S O ";" A C )) = ∠ S O A $

Xét $Δ S O A$ vuông tại $A$ có: $cases(display(S A = a sqrt(3)), display(O A = frac(1, 2) A C = frac(a sqrt(2), 2)))$



$ ⇒ tan ∠ S O A = frac(S A, O A) = frac(a sqrt(3), frac(a sqrt(2), 2)) = sqrt(6) $

$ ⇒ ∠ S O A ≈ 67 ° 48 ' $

$ ⇒ ∠ lr(( lr(( S B D )) ";" lr(( A B C D )) )) ≈ 67 ° 48 ' $



#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[c) Gọi $I$ là trung điểm của $B C$. Tính góc giữa $lr(( S D I ))$ và $lr(( A B C D ))$.]


#figure("image54.svg")


B1: $lr(( S D I )) ∩ lr(( A B C D )) = D I$

B2: $cases(display(S A ⊥ D I), display("Kẻ" A K ⊥ D I)) ⇒ lr(( S A K )) ⊥ D I$

B3: $cases(display(lr(( S A K )) ∩ lr(( S D I )) = S K), display(lr(( S A K )) ∩ lr(( A B C D )) = A K))$

$ ⇒ ∠ lr(( lr(( S D I )) ";" lr(( A B C D )) )) = ∠ lr(( S K ";" A K )) = ∠ S K A $

Xét $Δ S A K$ vuông tại $A$ có: $cases(display(S _(Δ A D I) = frac(1, 2) S _(A B C D)), display(A K = frac(2 S _(Δ A D I), D I)))$

+) $S _(Δ A D I) = frac(1, 2) S _(A B C D) = frac(1, 2) a ^(2)$

+) $D I = sqrt(D C ^(2) + C I ^(2)) = sqrt(a ^(2) + lr(( frac(a, 2) )) ^(2)) = sqrt(1 ^(2) + lr(( frac(1, 2) )) ^(2)) . a = frac(a sqrt(5), 2)$

$ ⇒ A K = frac(2 . lr(( frac(1, 2) a ^(2) )), frac(a sqrt(5), 2)) = frac(2 sqrt(5), 5) . a $



$ ⇒ tan ∠ S K A = frac(S A, A K) = frac(a sqrt(3), frac(2 sqrt(5), 5) . a) = frac(sqrt(15), 2) $

$ ⇒ ∠ S K A = 62 ° 41 ' $



#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[d) Gọi $E$ là điểm đối xứng của $A$ qua $D$. Tính góc giữa $lr(( S C E ))$ và $lr(( A B C D ))$.]

Mô hình

Hình thang $A B C E$ vuông tại $A$ và $B$ có:  $cases(display(A B = B C = a), display(A E = 2 a)) ⇒ A C ⊥ C E$

Tính $∠ lr(( lr(( S C E )) ";" lr(( A B C D )) ))$

+) $lr(( S C E )) ∩ lr(( A B C D )) = C E$

+) $lr(( S A C )) ⊥ C E$

+) $cases(display(lr(( S A C )) ∩ lr(( S C E )) = S C), display(lr(( S A C )) ∩ lr(( A B C D )) = A C))$

$ ⇒ ∠ lr(( lr(( S C E )) ";" lr(( A B C D )) )) = ∠ lr(( S C ";" A C )) = ∠ S C A $

Xét $Δ S A C$ vuông tại $A$ có: $cases(display(S A = a sqrt(3)), display(A C = a sqrt(2)))$



$ ⇒ tan ∠ S C A = frac(S A, A C) = frac(a sqrt(3), a sqrt(2)) = frac(sqrt(6), 2) $

$ ⇒ ∠ S C A = 50 ° 46 ' $


],
"bai-hoc-2":[

#figure("image86.svg")


#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[a) Tính góc giữa mp $lr(( A ' B C ))$ và $lr(( A B C ))$.]

Giao tuyến chung $B C$

$cases(display(A A ' ⊥ B C), display("Kẻ" A K ⊥ B C ⇒ "K là trung điểm BC"))$

$ ⇒ lr(( A ' A K )) ⊥ B C $

$cases(display(lr(( A ' A K )) ∩ lr(( A ' B C )) = A ' K), display(lr(( A ' A K )) ∩ lr(( A B C )) = A K))$

$ ⇒ ∠ lr(( lr(( A ' B C )) ";" lr(( A B C )) )) = ∠ lr(( A ' K ";" A K )) = ∠ A ' K A $

Xét $Δ A ' A K$ vuông tại $A$ có: $cases(display(A A ' = frac(3 a, 2)), display(A K = frac(a sqrt(3), 2)))$



$ ⇒ tan ∠ A ' K A = frac(A A ', A K) = frac(frac(3 a, 2), frac(a sqrt(3), 2)) = sqrt(3) $

$ ⇒ ∠ A ' K A = 60 ° $

$ ⇒ ∠ lr(( lr(( A ' B C )) ";" lr(( A B C )) )) = 60 ° $



#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[b) Tính góc giữa $A ' C$ và $lr(( A B B ' A ' ))$.]

Vì $C E ⊥ (A B B' A')$ nên hình chiếu vuông góc của $C$ lên $(A B B' A')$ là $E$, còn $A'$ thuộc mặt phẳng này. Do đó hình chiếu của $A'C$ là $A'E$, suy ra $∠(A'C;(A B B'A'))=hat(C A'E)$.

Xét $Δ C A ' E$ vuông tại $E$ có: $cases(display(C E = frac(a sqrt(3), 2)), display(A ' C = sqrt(A A ' ^(2) + A C ^(2)) = sqrt(lr(( frac(3 a, 2) )) ^(2) + a ^(2)) = frac(a sqrt(13), 2)))$



$ ⇒ sin ∠ C A ' E = frac(E C, A ' C) = frac(frac(a sqrt(3), 2), frac(a sqrt(13), 2)) = frac(sqrt(39), 13) $

$ ⇒ ∠ C A ' E = 28 ° 43 ' $


],
"bai-hoc-3":[

#figure("image109.svg")


Gọi $M$ là trung điểm $A B$ khi đó $cases(display(C M ⊥ A B), display(C M ⊥ S A)) ⇒ C M ⊥ lr(( S A B ))$.

Trong mặt phẳng $lr(( S A B ))$, từ $M$ kẻ $M K ⊥ S B$ tại $K$.

Khi đó: $cases(display(S B ⊥ M K), display(S B ⊥ C M)) ⇒ S B ⊥ lr(( C M K )) ⇒ S B ⊥ C K$.

Ta có: $cases(display(lr(( S A B )) ∩ lr(( S B C )) = S B), display(M K ⊥ S B), display(C K ⊥ S B)) ⇒ "số đo góc" lr([ C "," S B "," A ]) = hat(C K M)$.

$Δ B K M ∼ Δ B A S$ nên $frac(K M, S A) = frac(B M, S B) = frac(a, a sqrt(6)) = frac(1, sqrt(6)) ⇒ K M = frac(a, sqrt(3))$.

Xét $Δ C K M$ vuông tại $M$ ta có: $tan hat(C K M) = frac(C M, M K) = sqrt(3) ⇒ hat(C K M) = 60 °$.
],
"bai-hoc-4":[

#figure("image135.svg")


*Chọn D.*

Gọi $I$ là hình chiếu vuông góc của $A$ trên $D B$.

Tam giác $A B D$ vuông tại $A$, có $frac(1, A I ^(2)) = frac(1, A B ^(2)) + frac(1, A D ^(2)) = frac(5, 4 a ^(2)) ⇒ A I = frac(2 a, sqrt(5))$

$B D ⊥ A' I$ vì $D B ⊥ lr(( A I A' ))$

Do đó góc phẳng nhị diện $lr([ A' "," B D "," A ])$ bằng $hat(A I A')$.

Tam giác $A I A'$ vuông tại $A$, $tan hat(A' I A) = frac(A A', A I) = frac(sqrt(5), 2)$

Suy ra $α = 180 ° - hat(A I A') ⇒ tan α = - tan hat(A I A') = frac(- sqrt(5), 2)$.
],
"bai-hoc-5":[

#figure("image154.svg")


Đáp án: $112$

Mô tả kim tự tháp như hình vẽ

Gọi $O$ là tâm hình vuông $A B C D$, khi đó $S O ⊥ lr(( A B C D ))$, $S O = "146,6"$, $A B = "230,4"$.

$ cases(display(B D ⊥ A C), display(B D ⊥ S O)) ⇒ B D ⊥ lr(( S A C )) ⇒ B D ⊥ S A. $

Xét $lr(( S A O ))$, hạ $O M ⊥ S A ⇒ S A ⊥ lr(( M B D ))$ nên góc phẳng nhị diện $lr([ B "," S A "," D ])$ là $hat(B M D)$.

Ta có $A B = "230,4" ⇒ A C ≈ "325,83" ⇒ A O = O B ≈ "162,92"$.

Xét $Δ S A O$: $frac(1, O M ^(2)) = frac(1, S O ^(2)) + frac(1, O A ^(2)) ⇒ O M ≈ "108,98"$

Xét $Δ M O B$: $M B ^(2) = O M ^(2) + O B ^(2) ⇒ M B ≈ 196 ⇒ M D ≈ 196$.

Xét $Δ B M D$: $cos hat(B M D) = frac(M B ^(2) + M D ^(2) - B D ^(2), 2 M B . M D) ≈ - "0,382" ⇒ hat(B M D) ≈ 112 °$
],
"tu-luyen-1":[

#figure("image192.svg")


#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[a) Tính góc giữa $lr(( S B C ))$ và $lr(( A B C ))$.]

*Phương pháp:*

Mô hình: Là hình chóp có hai mặt bên $⊥$ đáy $⇒$ giao tuyến của 2 mặt phẳng đó $⊥$ đáy

Bước 1: Giao tuyến chung $B C$

Bước 2: Xác định mặt phẳng $⊥ B C$

- Bước 3:

$ cases(display(lr(( S A I )) ∩ lr(( S B C )) = S I), display(lr(( S A I )) ∩ lr(( A B C )) = A I)) $

$ ∠ lr(( lr(( S B C )) ";" lr(( A B C )) )) = ∠ lr(( S I ";" A I )) = ∠ S I A $

*Cách giải:*

Ta có:

$ cases(display(lr(( S A B )) ⊥ lr(( A B C ))), display(lr(( S A C )) ⊥ lr(( A B C ))), display(lr(( S A B )) ∩ lr(( S A C )) = S A)) ⇒ S A ⊥ lr(( A B C )) $

Ta có: $S A ⊥ B C$

Kẻ $A I ⊥ B C$ ($I$ là trung điểm $B C$ do $Δ A B C$ cân tại $A$)

$ ⇒ lr(( S A I )) ⊥ B C $

Xét $Δ S A I ⊥ A$ có: $B C = sqrt(A B ^(2) + A C ^(2)) = sqrt(a ^(2) + a ^(2)) = a sqrt(2)$

$ ⇒ A I = frac(1, 2) B C = frac(a sqrt(2), 2) $

$Δ S B C$ cân tại $S ⇒ S _(Δ S B C) = frac(1, 2) S I . B C$



$ = frac(1, 2) S I . a sqrt(2) = a ^(2) $

$ ⇒ S I = a sqrt(2) $



$ ⇒ cos ∠ S I A = frac(A I, S I) = frac(frac(a sqrt(2), 2), a sqrt(2)) = frac(1, 2) ⇒ ∠ S I A = 60 ° $

$ ⇒ ∠ lr(( lr(( S B C )) ";" lr(( A B C )) )) = ∠ S I A = 60 ° $

#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[b) Tính góc giữa $S B$ và mp $lr(( S A C ))$.]

*Cách giải:*

$ S B ∩ lr(( S A C )) = lr(\{ S \}) $

Hình chiếu vuông góc của $B$ trên $lr(( S A C ))$ là điểm $A lr(( "do" B A ⊥ lr(( S A C )) ))$

Do đó hình chiếu vuông góc của $S B$ lên $lr(( S A C ))$ là $S A .$

$ ⇒ ∠ lr(( S B ";" lr(( S A C )) )) = ∠ lr(( S B ";" S A )) = ∠ B S A $

Xét  $Δ S A B$ vuông tại $A$ có: $cases(display(A B = a), display(S A = tan ∠ S I A . A I = tan 60 ° . frac(a sqrt(2), 2) = frac(a sqrt(6), 2)))$

$ ⇒ tan ∠ A S B = frac(A B, S A) = frac(a, frac(a sqrt(6), 2)) = frac(2, sqrt(6)) = frac(sqrt(6), 3) $



$ ⇒ ∠ A S B ≈ 39 ° 14 ' $

$ ⇒ ∠ lr(( S B ";" lr(( S A C )) )) ≈ 39 ° 14 ' $


],
"tu-luyen-2":[

#figure("image234.svg")


#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[a) Góc giữa mp $lr(( A ' B C ))$ và $lr(( A B C ))$.]

*Phương pháp:*

Mô hình: Lăng trụ $Δ$ đều là lăng trụ có các cạnh bên $⊥$ đáy và đáy là $Δ$ đều

Xác định giao tuyến chung giữa hai mặt phẳng

Tìm mặt phẳng vuông góc với giao tuyến chung

Xác định góc giữa hai mặt phẳng bằng góc giữa hai đường thẳng lần lượt nằm trong hai mặt phẳng và cùng vuông góc với giao tuyến.

- Bước 1: xác định giao tuyến chung $B C$

- Bước 2:

Ta có: $A A ' ⊥ B C$ (do $A A ' ⊥$ đáy)

Kẻ $A K ⊥ B C$ ($K$ là trung điểm $B C$, do $Δ A B C$ đều)

$ ⇒ lr(( A A ' K )) ⊥ B C $

- Bước 3:

$ cases(display(lr(( A A ' K )) ∩ lr(( A B C )) = A K), display(lr(( A ' A K )) ∩ lr(( A ' B C )) = A ' K)) $

$ ⇒ ∠ lr(( lr(( A ' B C )) ";" lr(( A B C )) )) = ∠ lr(( A ' K ";" A K )) = ∠ A ' K A $

Xét $Δ A ' A K ⊥ A$ có: $cases(display(A A ' = a sqrt(3)), display(A K = frac(a sqrt(3), 2)))$

$ ⇒ tan ∠ A ' K A = frac(A A ', A K) = frac(a sqrt(3), frac(a sqrt(3), 2)) = 2 $

$ ⇒ ∠ A ' K A ≈ 63 ° 26 ' $

$ ⇒ ∠ lr(( lr(( A ' B C )) ";" lr(( A B C )) )) ≈ 63 ° 26 ' $

#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[b) Gọi $I$ là trung điểm của $A B$ . Tính góc giữa $lr(( A ' I C ))$ và $lr(( A B B ' A ' ))$.]

*Phương pháp:*

Chứng minh có một đường trong mặt này vuông góc với mặt phẳng kia nên hai mặt phẳng vuông góc với nhau.

*Cách giải:*


#figure("image250.svg")


Nhận thấy :

$ cases(display(I C ⊥ A B), display(I C ⊥ A A ')) ⇒ I C ⊥ lr(( A B B ' A ' )) $

Mà $I C ⊂ lr(( A ' I C ))$



$ ⇒ lr(( A ' I C )) ⊥ lr(( A B B ' A ' )) $

$ ⇒ ∠ lr(( lr(( A ' I C )) ";" lr(( A B B ' A ' )) )) = 90 ° $


],
"tu-luyen-3":[

#figure("image268.svg")


*Phương pháp:*

Vì là hình chóp tứ giác đều nên góc giữa các mặt bên và đáy là bằng nhau $⇒$ tính $cos ∠ lr(( lr(( S C D )) ";" lr(( A B C D )) ))$

- Bước 1: Giao tuyến chung $C D$

- Bước 2: Xác định 1 mặt phẳng $⊥$ giao tuyến $C D$

- Bước 3:

$ cases(display(lr(( S O K )) ∩ lr(( S C D )) = S K), display(lr(( S O K )) ∩ lr(( A B C D )) = O K)) ⇒ ∠ lr(( lr(( S C D )) ";" lr(( A B C D )) )) = ∠ S K O $

*Cách giải:*

Ta có: $S O ⊥ C D$

Kẻ $O K ⊥ C D$ ($O K ∥ A D ∥ B C$ và $K$ là trung điểm $C D$)

$ ⇒ lr(( S O K )) ⊥ C D $

Đặt cạnh đáy $= x ⇒$ cạnh bên $= 2 x$

$ ⇒ cases(display(O K = frac(1, 2) B C = frac(x, 2)), display(S K = sqrt(S C ^(2) - C K ^(2)) = sqrt(lr(( 2 x )) ^(2) - lr(( frac(x, 2) )) ^(2)) = frac(sqrt(15), 2) x)) $

$ ⇒ cos ∠ S K O = frac(O K, S K) = frac(frac(x, 2), frac(sqrt(15), 2) x) = frac(sqrt(15), 15) $

$ ⇒ cos ∠ lr(( lr(( S C D )) ";" lr(( A B C D )) )) = frac(sqrt(15), 15) $
],
"tu-luyen-4":[

#figure("image294.svg")


#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[a) Diện tích tam giác $S A D$.]

*Phương pháp:*

Xác định góc giữa hai mặt phẳng $lr(( S C D ))$ và $lr(( A B C D ))$.

Sử dụng công thức tính diện tích của tam giác vuông.

*Cách giải:*

Hình chóp có đáy là hình thang $A B C D$ có $cases(display(∠ A = ∠ B = 90 °), display(A B = B C = frac(1, 2) A D = a)) ⇒ A C ⊥ C D$

Xác định $∠ lr(( lr(( S C D )) ";" lr(( A B C D )) ))$

- Bước 1: xác định giao tuyến chung $C D$

- Bước 2: $cases(display(S A ⊥ C D), display(A C ⊥ C D)) ⇒ lr(( S A C )) ⊥ C D$

- Bước 3: $cases(display(lr(( S A C )) ∩ lr(( S C D )) = S C), display(lr(( S A C )) ∩ lr(( A B C D )) = A C)) ⇒ ∠ lr(( lr(( S C D )) ";" lr(( A B C D )) )) = ∠ lr(( S C ";" A C )) = ∠ S C A$

$⇒ ∠ S C A = 45 ° ⇒ Δ S A C ⊥$ cân tại $A$

$ ⇒ S A = A C = sqrt(A B ^(2) + B C ^(2)) = a sqrt(2) $

$ S _(Δ S A D) = frac(1, 2) S A . A D = frac(1, 2) a sqrt(2) . 2 a = a ^(2) sqrt(2) $

#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[b) Góc giữa $S D$ và mp $lr(( S A C ))$.]

*Phương pháp giải:*

Xác định hình chiếu vuông góc của $S D$ lên mặt phẳng $lr(( S A C ))$ từ đó xác định góc giữa đường thẳng và mặt phẳng cần tìm.

*Cách giải:*

$ S D ∩ lr(( S A C )) = lr(\{ S \}) $

Hình chiếu vuông góc của $D$ trên $lr(( S A C ))$  là $C lr(( d o D C ⊥ lr(( S A C )) ))$

$ ⇒ ∠(S D;(S A C))=∠(S D;S C)=hat(D S C). $

Xét $Δ S C D ⊥ C$ có:

$ cases(display(S D = sqrt(S A ^(2) + A D ^(2)) = sqrt(lr(( a sqrt(2) )) ^(2) + lr(( 2 a )) ^(2)) = a sqrt(6)), display(C D = sqrt(C E ^(2) + E D ^(2)) = sqrt(a ^(2) + a ^(2)) = a sqrt(2))) $

$ ⇒ sin ∠ D S C = frac(C D, S D) = frac(a sqrt(2), a sqrt(6)) = frac(sqrt(3), 3) $

$ ⇒ ∠ lr(( S D ";" lr(( S A C )) )) ≈ 35 ° 16 ' $

#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[c) Góc giữa $lr(( S B D ))$ và $lr(( A B C D ))$.]

- Bước 1: xác định giao tuyến chung $B D$

- Bước 2: Xác định 1 mặt phẳng $⊥ B D$

Xác định góc giữa hai mặt phẳng bằng góc giữa hai đường thẳng lần lượt nằm trong hai mặt phẳng và cùng vuông góc với giao tuyến.

*Cách giải:*

Ta có: $S A ⊥ B D$ ; Kẻ $A K ⊥ B D ⇒ lr(( S A K )) ⊥ B D$

$ cases(display(lr(( S A K )) ∩ lr(( S B D )) = S K), display(lr(( S A K )) ∩ lr(( A B C D )) = A K)) $

$ ⇒ ∠ lr(( lr(( S B D )) ";" lr(( A B C D )) )) = ∠ lr(( S K ";" A K )) = ∠ S K A $

Xét $Δ S A K ⊥ A$ có:

$ cases(display(S A = a sqrt(2)), display(A K = frac(A B . A D, sqrt(A B ^(2) + A D ^(2))) = frac(a . 2 a, sqrt(a ^(2) + lr(( 2 a )) ^(2))) = frac(2 sqrt(5), 5) a)) $

$ ⇒ tan ∠ S K A = frac(S A, A K) = frac(a sqrt(2), frac(2 sqrt(5), 5) a) = frac(sqrt(10), 2) $

$ ⇒ ∠ S K A ≈ 57 ° 41 ' $

$ ⇒ ∠ lr(( lr(( S B D )) ";" lr(( A B C D )) )) ≈ 57 ° 41 ' $
],
"tu-luyen-5":[

#figure("image340.svg")


*Phương pháp:*

- Bước 1: xác định giao tuyến chung $S C$

- Bước 2: Xác định 1 mặt phẳng $⊥ S C$

Xác định góc giữa hai mặt phẳng bằng góc giữa hai đường thẳng lần lượt nằm trong hai mặt phẳng và cùng vuông góc với giao tuyến.

*Cách giải:*

+) Kẻ $A K ⊥ S B lr(( 1 ))$, ta sẽ chứng minh được $A K ⊥ lr(( S B C ))$, thật vậy:

Ta có: $cases(display(B C ⊥ A B), display(B C ⊥ S A lr(( "do" S A ⊥ lr(( A B C )) )))) ⇒ B C ⊥ lr(( S A B )) ⇒ B C ⊥ A K lr(( 2 ))$

Từ $lr(( 1 ))$ và $lr(( 2 )) ⇒ A K ⊥ lr(( S B C )) ⇒ A K ⊥ S C$

+) Kẻ $A E ⊥ S C ⇒ lr(( A K E )) ⊥ S C$

Ta có:

$ cases(display(lr(( A K E )) ∩ lr(( S A C )) = A E), display(lr(( A K E )) ∩ lr(( S B C )) = E K)) ⇒ ∠ lr(( lr(( S A C )) ";" lr(( S B C )) )) = ∠ lr(( A E ";" E K )) = ∠ A E K $

Xét $Δ A K E ⊥ K lr(( "do" A K ⊥ lr(( S B C )) ⇒ A K ⊥ K E ))$

Trong tam giác $S A B$ vuông tại $A$, đường cao $A K$ thỏa mãn:
$A K=(S A dot A B)/sqrt(S A^2+A B^2)=(a dot a)/sqrt(a^2+a^2)=(a sqrt(2))/2.$
Trong tam giác $S A C$ vuông tại $A$:
$A E=(S A dot A C)/sqrt(S A^2+A C^2)=(a dot a sqrt(2))/sqrt(a^2+(a sqrt(2))^2)=(a sqrt(6))/3.$


#figure("image354.svg")


$ ⇒ sin ∠ A E K = frac(A K, A E) = frac(frac(a sqrt(2), 2), frac(a sqrt(6), 3)) = frac(sqrt(3), 2) $

$ ⇒ ∠ A E K = 60 ° $

$ ⇒ ∠ lr(( lr(( S A C )) "," lr(( S B C )) )) = 60 ° $
],
"tu-luyen-6":[

#figure("image374.svg")


*Phương pháp:*

- Bước 1: xác định giao tuyến chung $C D$

- Bước 2: Xác định 1 mặt phẳng $⊥ C D$

Xác định góc giữa hai mặt phẳng bằng góc giữa hai đường thẳng lần lượt nằm trong hai mặt phẳng và cùng vuông góc với giao tuyến.

*Cách giải:*

Ta có: $S H ⊥ C D$

Kẻ $H K ⊥ C D$ (việc xác định vị trí của điểm $K$ ta nên phẳng hóa đáy $A B C D$ theo hình học phẳng)

$ ⇒ lr(( S H K )) ⊥ C D $


#figure("image380.svg")


$ cases(display(lr(( S H K )) ∩ lr(( S C D )) = S K), display(lr(( S H K )) ∩ lr(( A B C D )) = H K)) ⇒ ∠ lr(( lr(( S C D )) "," lr(( A B C D )) )) = ∠ lr(( S K ";" H K )) = ∠ S K H $

Tính $∠ S K H$ trong $Δ S H K$ vuông tại $H$ có:

+) $S H = frac(16 sqrt(15), 15) a$

+) Tính $H K$ ($H K$ là chiều cao của $Δ C D H$)

$ ⇒ H K = frac(2 S _(Δ C D H), C D) = 2 . frac(S _(A B C D) - S _(Δ B C H) - S _(Δ A D H), C D) $

Ta có:

$ cases(display(S _(A B C D) = frac(lr(( B C + A D )) . A B, 2) = frac(lr(( 2 a + 3 a )) . 2 a, 2) = 5 a ^(2)), display(S _(Δ B C H) = frac(1, 2) B C . B H = frac(1, 2) . 2 a . frac(4, 3) a = frac(4, 3) a ^(2)), display(S _(Δ A D H) = frac(1, 2) A D . A H = frac(1, 2) . 3 a . frac(2, 3) a = a ^(2)), display(C D = sqrt(C E ^(2) + E D ^(2)) = sqrt(lr(( 2 a )) ^(2) + a ^(2)) = a sqrt(5))) $

$ ⇒ H K=2 dot (5a^2-4/3 a^2-a^2)/(a sqrt(5))=(16 sqrt(5))/15 a. $

+) $S H = frac(16 sqrt(15), 15) a$



$ ⇒ tan ∠ S K H = frac(S H, H K) = frac(frac(16 sqrt(15), 15) a, frac(16 sqrt(5), 15) a) = sqrt(3) $

$ ⇒ ∠ S K H = 60 ° $



$ ⇒ ∠ lr(( lr(( S C D )) ";" lr(( A B C D )) )) = 60 ° $
],
"tu-luyen-7":[

#block(width:100%,breakable:false,above:2mm,below:3mm)[
  #grid(columns:(1fr,1fr),gutter:6mm,align:center+horizon,
    image("../figures/image411.svg",width:62mm),
    image("../figures/image412.svg",width:62mm),
  )
]


*Phương pháp:*

Tính chất của đáy là nửa lục giác đều, khi đó $A B C D$ cấu tạo bởi $3$ tam giác đều là $O A D ";" O D C ";" O C B$

$⇒ A C ⊥ B C$ (góc chắn nửa đường tròn)

- Bước 1: Kéo dài $A D ∩ B C = E$. Giao tuyến chung $lr(( S A D )) ∩ lr(( S B C )) = S E$

- Bước 2: Xác định 1 mặt phẳng $⊥$ giao tuyến $S E$

Xác định góc giữa hai mặt phẳng bằng góc giữa hai đường thẳng lần lượt nằm trong hai mặt phẳng và cùng vuông góc với giao tuyến.

*Cách giải:*

Tính $∠ lr(( lr(( S A D )) "," lr(( S B C )) ))$

Kéo dài $A D ∩ B C = E$ , khi đó $C D$ là đường trung bình của $Δ E A B$

+) Kẻ $A H ⊥ S C ⇒ A H ⊥ lr(( S B C )) ⇒ A H ⊥ lr(( S B E )) ⇒ A H ⊥ S E$

+) Kẻ $A K ⊥ S E$

$ ⇒ S E ⊥ lr(( A H K )) $

$ cases(display(lr(( A H K )) ∩ lr(( S A D )) = A K), display(lr(( A H K )) ∩ lr(( S B C )) = H K)) ⇒ ∠ lr(( lr(( S A D )) "," lr(( S B C )) )) = ∠ A K H $

$ Δ A H K ⊥ H lr(( "do" A H ⊥ lr(( S B C )) ⇒ A H ⊥ H K )) $

$ ⇒ sin ∠ A K H = frac(A H, A K) $

Có: $cases(display(A H = frac(S A . A C, sqrt(S A ^(2) + A C ^(2))) = frac(a sqrt(3) . a sqrt(3), sqrt(3 a ^(2) + 3 a ^(2))) = frac(sqrt(6), 2) a), display(A K = frac(S A . A E, sqrt(S A ^(2) + A E ^(2))) = frac(a sqrt(3) . 2 a, sqrt(3 a ^(2) + 4 a ^(2))) = frac(2 sqrt(21), 7) a))$



$ ⇒ sin ∠ A K H = frac(frac(sqrt(6) a, 2), frac(2 sqrt(21) a, 7)) = frac(sqrt(14), 4) $

$ ⇒ ∠ A K H ≈ 69 ° 18 ' $



$ ⇒ ∠ lr(( lr(( S A D )) "," lr(( S B C )) )) ≈ 69 ° 18 ' $
],
"tu-luyen-8":[

#figure("image435.svg")


Gọi $D$ là trung điểm cạnh $B C$ suy ra $S D ⊥ B C$ ( vì tam giác $S B C$ cân tại $S$).

Suy ra $cases(display(S A ⊥ S B), display(S A ⊥ S C)) ⇒ S A ⊥ lr(( S B C )) ⇒ S A ⊥ B C$ và $S D ⊥ B C ⇒ B C ⊥ lr(( S A D )) ⇒ B C ⊥ A D$.

Khi đó: $cases(display(lr(( S B C )) ∩ lr(( A B C )) = B C), display(S D ⊥ B C), display(A D ⊥ B C)) ⇒ "số đo góc" lr([ S "," B C "," A ]) = hat(S D A) = α$.

Xét $Δ S A D$ vuông tại $S$ ta có: $cos α = cos hat(S D A) = frac(S D, A D) = frac(1, sqrt(3))$.
],
"tu-luyen-9":[

#figure("image461.svg")


Nhận xét: $A B C E$ là hình vuông cạnh bằng $a$. Gọi $I = A C ∩ B E$.

Ta có: $cases(display(B E ⊥ A I), display(B E ⊥ S A)) ⇒ B E ⊥ lr(( S A I )) ⇒ B E ⊥ S I$.

Khi đó $cases(display(lr(( S B E )) ∩ lr(( A B E )) = B E), display(A I ⊥ B E), display(S I ⊥ B E)) ⇒ "số đo góc" lr([ S "," B E "," A ]) = hat(S I A)$

Xét $Δ S I A$ vuông tại $A$, ta có: $tan hat(S I A) = frac(S A, I A) = frac(a sqrt(6), 2) : frac(a sqrt(2), 2) = sqrt(3) ⇒ hat(S I A) = 60 °$.
],
"tu-luyen-10":[

#figure("image487.svg")


#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[a) Vì $M A ⊥ lr(( P ))$ nên $hat(M B A)$ và $hat(M C A)$ là góc giữa $M B$ và $M C$ với $lr(( P )) .$]

Theo giả thiết. $hat(M B A) = hat(M C A) = 30 °$.

Từ đó: $M B = M C = 2 a$ và $A B = A C = a sqrt(3)$.

Do $M B ⊥ M C$ nên $B C = M B sqrt(2)$ tức là $B C = 2 a sqrt(2) .$

#block(sticky:true,inset:(left:5mm),above:3mm,below:3mm)[b. Gọi $I$ là trung điểm của $B C$ thì $B C ⊥ lr(( M I A ))$]

Từ đó $hat(M I A)$ là góc phẳng nhị diện $lr([ M "," B C "," A ]) .$

Đặt $hat(M I A) = φ$. Ta có $M I = frac(1, 2) B C = a sqrt(2)$; $sin φ = frac(M A, M I) = frac(1, sqrt(2)) ⇒ φ = 45 °$

Vậy góc nhị diện $lr([ M "," B C "," A ])$ bằng $45 °$
],
"tu-luyen-11":[

#figure("image520.svg")


*Chọn C.*

Gọi $D$ là trung điểm của $B C$.

Ta có $lr(( M B C )) ∩ lr(( A B C )) = B C$.

Và $cases(display(B C ⊥ A D), display(B C ⊥ A M)) ⇒ B C ⊥ lr(( A M D ))$.

Do đó $α = lr([ M "," B C "," A ]) = hat(M D A)$, (vì tam giác $M A D$ vuông tại $A$).

Vậy $tan α = frac(A M, A D) = frac(3 a, 4) . frac(2, a sqrt(3)) = frac(sqrt(3), 2)$.
],
"tu-luyen-12":[

#figure("image538.svg")


Đáp án: $28 °$

Vì $S A ⊥ ( A B C )$ nên $A B ⊥ S A$; $A C ⊥ S A$.

Khi đó $hat(B A C)$ là một góc phẳng của góc nhị diện $[ C "," S A "," B ]$.

Xét $Δ A S C$ vuông tại A có: $A C = S A . tan 30 ° = frac(sqrt(3), 2) a . frac(1, sqrt(3)) = frac(a, 2)$.

Xét $Δ A B C$ có: $cos hat(B A C) = frac(A B ^(2) + A C ^(2) - B C ^(2), 2 A B . A C) = frac(5, 4 sqrt(2)) ⇒ hat(B A C) ≈ 28 °$.

Vậy số đo góc nhị diện $[ C "," S A "," B ] ≈ 28 °$.
],
"tu-luyen-13":[

#figure("image556.svg")


Đáp số: $125 °$

Ta có: $lr( vec(B D ⊥ A C, B D ⊥ A A _(1), delim: #none) \}) ⇒ B D ⊥ lr(( A A _(1) C _(1) C )) ⇒ B D ⊥ O C _(1)$.

Vì $lr( vec(B D ⊥ A O, B D ⊥ O C _(1), delim: #none) \})$ nên suy ra $lr([ A "," B D "," C _(1) ]) = hat(A O C _(1)) = 180 ° - hat(C _(1) O C)$

$Δ C _(1) O C$ vuông tại $C$, ta có $tan hat(C _(1) O C) = frac(C C _(1), O C) = frac(2 a, frac(2 a sqrt(2), 2)) = sqrt(2)$.

Suy ra $lr([ A "," B D "," C _(1) ]) ≈ 180 ° - "54,7" ° ≈ 125 °$.
],
)
