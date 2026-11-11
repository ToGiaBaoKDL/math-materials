#import "figures.typ": figure
#let solutions = (
"bai-hoc-1": [
#set par(spacing:2mm)

#figure("lang-tru-deu-goc-canh-ben.svg",width:60mm)

*Chọn A*

Vì $A A ' ∥ C C '$ nên góc giữa $C C '$ và $A B '$ bằng góc giữa $A A '$ và $A B '$ và bằng góc $hat(A ' A B ')$

Với $A B = a ";"   A A ' = a sqrt(3)$ thì $"tan" hat(A ' A B ') = frac(A ' B ', A A ') = frac(a, a sqrt(3)) = frac(1, sqrt(3)) ⇒ hat(A ' A B ') = 30 °$

],
"bai-hoc-2": [
#set par(spacing:2mm,justify:false)

#figure("lap-phuong-duong-cheo-mat.svg",width:50mm)

*Chọn C*

Ta có $A B ∥ C D$ nên $lr(( hat(B A' "," C D) )) = lr(( hat(B A' "," A B) ))$.

Vì $A B B' A'$ là hình vuông nên $lr(( hat(B A' "," A B) )) = hat(A B A') = 45 °$.

],
"bai-hoc-3": [
#set par(spacing:2mm)

#figure("chop-tam-giac-trung-diem.svg",width:60mm)

Gọi $M ","   N ","   P$ lần lượt là trung điểm $S A ","   S B$ và $A C$.

Khi đó $cases(display(M P ∥ S C), display(M N ∥ A B)) ⇒ hat(lr(( S C ";" A B ))) = hat(lr(( M P ";" M N )))$. Khi đó ta có: $M N = frac(A B, 2) = frac(a, 2) ";"   M P = frac(S C, 2) = frac(a, 2)$.

Mặt khác $Δ S A C$ vuông tại $S ⇒ S P = frac(A C, 2) = frac(a sqrt(2), 2)$.

$B P ^(2) = frac(B A ^(2) + B C ^(2), 2) - frac(A C ^(2), 4) = frac(3, 2) a ^(2) ⇒ B P = frac(a sqrt(6), 2)$.

Suy ra $P N ^(2) = frac(P S ^(2) + P B ^(2), 2) - frac(S B ^(2), 4) = frac(3, 4) a ^(2) ⇒ N P = frac(a sqrt(3), 2)$.

#block(sticky:true,above:0pt,below:0pt)[Khi đó ]
$ "cos" hat(N M P) = frac(M N ^(2) + M P ^(2) - N P ^(2), 2 . M N . M P) = - frac(1, 2) ⇒ hat(N M P) = 120 ° ⇒ φ = hat(lr(( S C ";" A B ))) = 60 °. $

Vậy $cos φ=frac(1,2)$.

],
"bai-hoc-4": [
#set par(spacing:2mm)

#figure("chop-tam-giac-hinh-chu-nhat.svg",width:60mm)

Dựng hình bình hành $A M C E$ suy ra $A M = C E = frac(a, 2)$.

Khi đó $A E ∥ C M ⇒ lr(( hat(A N ";" C M) )) = lr(( hat(A N ";" A E) )) = φ$.

Mặt khác $S C = sqrt(S A ^(2) + A C ^(2)) = 2 a ⇒ A N = frac(S C, 2) = a$ và $A E = C M = frac(a sqrt(3), 2)$.

Do $Δ A B C$ đều nên $C M ⊥ A M ⇒ A M C E$ là hình chữ nhật.

Khi đó $C E ⊥ A E$ mà $C E ⊥ S A ⇒ C E ⊥ lr(( S A E )) ⇒ C E ⊥ S E$.

Tam giác $Δ S E C$ vuông tại $E$ có đường trung tuyến $E N = frac(1, 2) S C = a$.

Ta có: $"cos" hat(N A E) = frac(A N ^(2) + A E ^(2) - N E ^(2), 2 . A N . A E) = frac(sqrt(3), 4) > 0 ⇒ cos φ = frac(sqrt(3), 4)$.

],
"bai-hoc-5": [
#set par(spacing:2mm)

#figure("chop-vuong-trung-diem-sb.svg",width:60mm)

*Chọn D*

Xét tam giác $S A B$ vuông tại $A$ có: $S B = sqrt(S A ^(2) + A B ^(2)) = a sqrt(2)$.

Gọi $E$ là trung điểm của $M C$, ta có: $O E ∥ A M ⇒ lr(( hat(A M "," B D) )) = lr(( hat(O E "," B D) ))$

Khi đó: $O E = frac(1, 2) A M = frac(1, 4) S B = frac(a sqrt(2), 4)$.

Ta có: $C B ⊥ A B "," S A ⊥ C B ⇒ C B ⊥ S B ⇒ Δ S B C$ vuông tại $B$.

Xét tam giác $M B C$ vuông tại $B$ có: $M C = sqrt(M B ^(2) + B C ^(2)) = sqrt(frac(1, 4) . 2 a ^(2) + a ^(2)) = frac(a sqrt(6), 2)$

Khi đó: $B E = frac(1, 2) M C = frac(a sqrt(6), 4)$.

Xét tam giác $B C D$ vuông tại $C$ có: $B D = sqrt(B C ^(2) + D C ^(2)) = a sqrt(2) ⇒ B O = frac(a sqrt(2), 2)$.

Xét tam giác $E B O$ có: 

$ cos hat(E O B) = frac(E O ^(2) + O B ^(2) - E B ^(2), 2 . E O . O B) = frac(frac(a ^(2), 8) + frac(a ^(2), 2) - frac(3 a ^(2), 8), 2 . frac(a sqrt(2), 4) . frac(a sqrt(2), 2)) = frac(1, 2) ⇒ hat(E O B) = 60 ° $

$⇒ lr(( hat(A M "," B D) )) = lr(( hat(O E "," B D) )) = hat(E O B) = 60 °$.

],
"bai-hoc-6": [
#set par(spacing:2mm)

#figure("chop-mat-ben-vuong-goc-day.svg",width:60mm)

Gọi $H$ là trung điểm $A C$. Ta có $cases(display(lr(( S A C )) ⊥ lr(( A B C ))), display(lr(( S A C )) ∩ lr(( A B C )) = A C), display(S H ⊥ A C)) ⇒ S H ⊥ lr(( A B C ))$ tại $H$, mà $S B ∩ lr(( A B C )) = B$ nên suy ra $H B$ là hình chiếu của $S B$ trên $lr(( A B C ))$.

Suy ra $hat(lr([ S B "," lr(( A B C )) ])) = lr(( S B "," H B )) = hat(S B H)$.

$ S H = frac(a sqrt(3), 2); quad H B = sqrt(A B^2 + A H^2) = sqrt(a^2 + frac(a^2,4)) = frac(a sqrt(5),2). $

$ tan hat(S B H) = tan hat(lr([ S B "," lr((A B C)) ])) = frac(S H,H B) = frac(sqrt(15),5). $

],
"bai-hoc-7": [
#set par(spacing:2mm)

#figure("lang-tru-goc-voi-day.svg",width:48mm)

*Chọn D*

Ta có $B' B = a ⇒ C C' = a$ và $A C = a sqrt(3)$

Góc giữa $C' A$ và mp $lr(( A B C ))$ bằng góc đường thẳng $C' A$ và $C A$ bằng góc $C' A C$

$tan hat(C' A C) = frac(C' C, A C) = frac(a, a sqrt(3)) = frac(sqrt(3), 3) ⇒ hat(C' A C) = 30 °$.

],
"bai-hoc-8": [
#set par(spacing:2mm)

#figure("chop-duong-cheo-mat-phang.svg",width:48mm)

Ta có: $cases(display(D O ⊥ A C), display(D O ⊥ S A)) ⇒ D O ⊥ lr(( S A C ))$.

Do đó: $S O$ là hình chiếu vuông góc của $S D$ trên $lr(( S A C ))$.

Khi đó: Góc giữa đường thẳng $S D$ và mặt phẳng $lr(( S A C ))$ bằng góc $hat(D S O)$.

Đáy $A B C D$ là hình vuông cạnh $2 a$ nên $B D = 2 sqrt(2) a ⇒ D O = frac(1, 2) D B = sqrt(2) a$.

Tam giác $S A D$ vuông cân tại $A$ nên $S D = 2 a sqrt(2)$.

Tam giác $S O D$ vuông tại $O$ nên $sin hat(D S O) = frac(D O, S D) = frac(sqrt(2) a, 2 sqrt(2) a) = frac(1, 2) ⇒ hat(D S O) = 30 °$.

],
"bai-hoc-9": [
#set par(spacing:2mm)

#figure("chop-hinh-chieu-sn.svg",width:60mm)

Chọn A

Kẻ $N P ⊥ M B$. Ta có: $cases(display(N P ⊥ M B), display(N P ⊥ S M)) ⇒ N P ⊥ ( S B M ) ⇒ lr(( hat(S N "," ( S B M )) )) = hat(N S P)$

Xét tam giác vuông $S N M$, ta có : $S N ^(2) = S M ^(2) + M N ^(2) ⇒ S N = frac(sqrt(7), 2) a$

Xét tam giác vuông $N B M$, ta có : $frac(1, N P ^(2)) = frac(1, M N ^(2)) + frac(1, N B ^(2)) ⇒ N P = frac(1, sqrt(5)) a$

Xét tam giác vuông $S N P$, ta có : $sin hat(N S P) = frac(N P, N "S") = frac(1, sqrt(5)) . frac(2, sqrt(7)) = frac(2, sqrt(35))$

],
"tu-luyen-1": [
#set par(spacing:2mm)

#figure("chop-deu-duong-trung-binh.svg",width:60mm)

*Chọn C*

Theo giả thiết ta có $I J$ là đường trung bình của $Δ S B C$ nên $I J   ∥   S B$.

Vì $I J   ∥   S B$ và $C D   ∥   A B$ nên $lr(( I J "," C D )) = lr(( S B "," A B )) = hat(S B A) = 60 °$ (Do $Δ S A B$ đều).

],
"tu-luyen-2": [
#set par(spacing:2mm)

#figure("lap-phuong-goc-ab.svg",width:50mm)

*Chọn C*

Ta có $A B ∥ C D ⇒ lr(( A' B ";" C D )) = lr(( A' B ";" A B )) = hat(A B A') = 45 ° .$

],
"tu-luyen-3": [
#set par(spacing:2mm)

#figure("lap-phuong-duong-cheo-ac.svg",width:60mm)

*Chọn A*

Ta có $A C ∥ A _(1) C _(1)$, do đó góc giữa $lr(( A C "," D A _(1) )) = lr(( A _(1) C _(1) "," D A _(1) ))$, bằng góc $D A _(1) C _(1)$.

Do $D A _(1) ";" A _(1) C _(1) "," D C _(1)$ là các đường chéo hình vuông nên bằng nhau. Vậy $Δ D A _(1) C _(1)$ đều,

Vậy góc $D A _(1) C _(1)$ bằng $60 °$.

],
"tu-luyen-4": [
#set par(spacing:2mm)

#block(sticky:true,above:2mm,below:2mm,inset:(left:6mm))[a) $A' B$ và $B' C$.]
#figure("lap-phuong-hai-duong-cheo.svg",width:60mm)

Theo tính chất hình lập phương ta có: $B' C ∥ A' D$.

Do đó góc giữa hai đường thẳng $A' B$ và $B' C$ là: góc giữa hai đường thẳng $A' B$ và $A' D$.

Mà tam giác $A' B D$ là tam giác đều nên: $lr(( A' B "," B' C )) = lr(( A' B "," A' D )) = 60 ° .$

#block(sticky:true,above:2mm,below:2mm,inset:(left:6mm))[b) $A C$ và $A' D$.]
#figure("lap-phuong-doi-duong-song-song.svg",width:60mm)

Do $A C ∥ A' C'$ nên góc giữa $A C$ và $A' D$ bằng góc giữa $A' C'$ và $A' D$.

Do $A B C D . A' B' C' D'$ là hình lập phương nên tam giác $A' C' D$ là tam giác đều.

Suy ra $hat(lr(( A C "," A' D ))) = hat(lr(( A' C' "," A' D ))) = hat(D A' C') = 60 °$.

],
"tu-luyen-5": [
#set par(spacing:2mm)

#figure("chop-deu-tam-giac-ioj.svg",width:60mm)

*Chọn C*

Gọi $O$ là tâm của hình thoi $A B C D$.

Suy ra $O J$ là đường trung bình trong tam giác $B C D ⇒ cases(display(mat(O J ∥ C D; O J = frac(1, 2) C D, delim: #none)))$.

Vì $C D ∥ O J ⇒ ( I J "," C D ) = ( I J "," O J )$.

Xét tam giác $I O J$ có:

$ I J = frac(1,2) S B = frac(a,2); quad O J = frac(1,2) C D = frac(a,2); quad I O = frac(1,2) S A = frac(a,2). $

Suy ra $Δ I O J$ đều.

Vậy $hat(( I J "," C D )) = hat(( I J "," O J )) = hat(I J O) = 60 °$.

],
"tu-luyen-6": [
#set par(spacing:1.5mm)
#show math.equation.where(block:true): set block(above:1mm,below:1mm)

#figure("chop-tam-giac-mnq.svg",width:47.25mm)

*Chọn A*

Gọi $M "," N "," Q$ lần lượt là trung điểm của $S A "," S B "," A C$.

Mặt khác, ta có $cases(display(M N ∥ A B), display(M Q ∥ S C)) ⇒ hat(lr(( A B "," S C ))) = hat(lr(( M N "," M Q )))$.

Ta có $A N = frac(a sqrt(3), 2)$; $N C = sqrt(frac(S C ^(2) + B C ^(2), 2) - frac(S B ^(2), 4)) = sqrt(frac(a ^(2) + 2 a ^(2), 2) - frac(a ^(2), 4)) = frac(a sqrt(5), 2)$.

Xét tam giác $N A C$ có 

$ N Q = sqrt(frac(N A ^(2) + N C ^(2), 2) - frac(A C ^(2), 4)) = sqrt(frac(frac(3 a ^(2), 4) + frac(5 a ^(2), 4), 2) - frac(a ^(2), 4)) = frac(a sqrt(3), 2). $

Xét tam giác $M N Q$ có 

$ cos hat(N M Q) = frac(M N ^(2) + M Q ^(2) - N Q ^(2), 2 M N . M Q) = frac(frac(a ^(2), 4) + frac(a ^(2), 4) - frac(3 a ^(2), 4), 2 . frac(a, 2) . frac(a, 2)) = - frac(1, 2). $

$⇒ hat(N M Q) = 120 ° ⇒ hat(lr(( M N "," M Q ))) = 180 ° - 120 ° = 60 °$.

],
"tu-luyen-7": [
#set par(spacing:2mm)

#figure("chop-mat-ben-vuong.svg",width:60mm)

*Chọn D*

Đặt $A B = a lr(( a > 0 ))$.

Ta có $S M = frac(1, 2) A B = frac(a, 2) ";" S A = A B . sin 30 ° = frac(a, 2)$ nên tam giác $S A M$ cân tại $S$.

Gọi $H$ là hình chiếu của $S$ lên $A B$, do $lr(( S A B )) ⊥ lr(( A B C D ))$ và $lr(( S A B )) ∩ lr(( A B C D )) = A B$ nên $S H ⊥ lr(( A B C D ))$ hay $H$ là trung điểm của $A M$.

Gọi $K$ là trung điểm của $A D$, khi đó $hat(lr(( S M "," B D ))) = hat(lr(( S M "," M K )))$ và $M K = frac(1, 2) B D = frac(a sqrt(2), 2)$.

Khi đó $S H = H B . tan 30 ° = frac(3 a, 4) . frac(1, sqrt(3)) = frac(a sqrt(3), 4)$

$S K ^(2) = S H ^(2) + H K ^(2) = S H ^(2) + A H ^(2) + A K ^(2) = frac(a ^(2), 2)$.

#block(sticky:true,above:0pt,below:0pt)[Ta có:]
$ cos hat(S M K) = frac(S M ^(2) + M K ^(2) - S K ^(2), 2 . S M . M K) = frac(frac(a ^(2), 4) + frac(a ^(2), 2) - frac(a ^(2), 2), 2 . frac(a, 2) . frac(a sqrt(2), 2)) = frac(sqrt(2), 4). $

],
"tu-luyen-8": [
#set par(spacing:2mm)

#figure("chop-hai-trung-diem.svg",width:60mm)

*Chọn D*

Gọi $I$ là trung điểm $A D$ và $H$ là trung điểm $S I$.

Dễ thấy $G H ∥ F I$ (vì $G H$ là đường trung bình của tam giác $S F I$)

$B D ∥   F I$ (vì $F I$ là đường trung bình của tam giác $A B D$)

Nên $G H   ∥   B D$ suy ra $lr(( C G ";" B D )) = lr(( C G ";" G H ))$.

Ta có $C I = sqrt(C D ^(2) + D I ^(2)) = sqrt(a ^(2) + lr(( frac(a, 2) )) ^(2)) = frac(a sqrt(5), 2) ⇒ C F = C I = frac(a sqrt(5), 2)$;

$S F = S I = sqrt(S A ^(2) + A F ^(2)) = sqrt(lr(( 2 a )) ^(2) + lr(( frac(a, 2) )) ^(2)) = frac(a sqrt(17), 2)$;

$S C = sqrt(S A ^(2) + A C ^(2)) = sqrt(lr(( 2 a )) ^(2) + lr(( a sqrt(2) )) ^(2)) = a sqrt(6)$.

#block(sticky:true,above:0pt,below:0pt)[Khi đó ]
$ C G ^(2) = frac(C F ^(2) + C S ^(2), 2) - frac(S F ^(2), 4) = frac(frac(5 a ^(2), 4) + 6 a ^(2), 2) - frac(frac(17 a ^(2), 4), 4) = frac(41 a ^(2), 16) ⇒ C H = C G = frac(a sqrt(41), 4) $

Mặt khác: $G H = frac(1, 2) F I = frac(1, 2) . frac(1, 2) B D = frac(a sqrt(2), 4)$.

#block(sticky:true,above:0pt,below:0pt)[Ta có: ]
$ cos hat(C G H) = frac(G C ^(2) + G H ^(2) - H C ^(2), 2 . G C . G H) = frac(lr(( frac(a sqrt(41), 4) )) ^(2) + lr(( frac(a sqrt(2), 4) )) ^(2) - lr(( frac(a sqrt(41), 4) )) ^(2), 2 . frac(a sqrt(41), 4) . frac(a sqrt(2), 4)) \
= frac(sqrt(82), 82). $

Vậy $cos α = frac(sqrt(82), 82)$.

],
"tu-luyen-9": [
#set par(spacing:2mm)

#figure("lang-tru-vuong-mn.svg",width:60mm)

*Chọn B*

Gọi $N$ là trung điểm $B B '$, ta có $M N ∥ B ' C$ nên $lr(( A M "," B ' C )) = ( A M "," M N )$.

Ta có: $B C = sqrt(A B ^(2) + A C ^(2)) = sqrt(4 a ^(2) + a ^(2)) = sqrt(5) a$ và $A M = frac(B C, 2) = frac(sqrt(5) a, 2) .$

$A N = sqrt(A B ^(2) + B N ^(2)) = sqrt(4 a ^(2) + a ^(2)) = sqrt(5) a$; $M N = frac(B ' C, 2) = frac(sqrt(B C ^(2) + B B ' ^(2)), 2) = frac(sqrt(5 a ^(2) + 4 a ^(2)), 2) = frac(3, 2) a .$

Áp dụng định lý cosin trong tam giác $M N A$ ta có:

$ cos hat(N M A) = frac(M N ^(2) + M A ^(2) - A N ^(2), 2 . M N . M A) = frac(frac(9, 4) a ^(2) + frac(5, 4) a ^(2) - 5 a ^(2), 2 . frac(3, 2) a . frac(sqrt(5), 2) a) = - frac(sqrt(5), 5) . $

 Vậy $cos lr(( A M "," B ' C )) = frac(sqrt(5), 5) .$

],
"tu-luyen-10": [
#set par(spacing:2mm)

#figure("lang-tru-goc-mat-tren.svg",width:60mm)

Ta có: $lr(( B C' ";" lr(( A' B' C' )) )) = lr(( B C' ";" B' C' )) = hat(B C' B')$.

$B' C' = sqrt(a ^(2) + 3 a ^(2)) = 2 a ⇒ B' C' = B B' = 2 a$. Suy ra $Δ B B' C'$ vuông cân tại $B'$.

Do đó $hat(B C' B') = 45 °$. Vậy $lr(( B C' ";" lr(( A' B' C' )) )) = 45 °$

],
"tu-luyen-11": [
#set par(spacing:2mm)

#figure("chop-chu-nhat.svg",width:60mm)

Do $S A ⊥ lr(( A B C D ))$ nên góc giữa $S D$ và mặt phẳng $lr(( A B C D ))$ là góc $hat(S D A)$.

$S A = sqrt(S B ^(2) - A B ^(2)) = 2 a$.

Tam giác $S A D$ vuông cân tại $A$ nên $hat(S D A) = 45 °$.

],
"tu-luyen-12": [
#set par(spacing:2mm)

#figure("lap-phuong-diem-di-dong.svg",width:60mm)

Gọi $H$ là hình chiếu vuông góc của $N$ lên cạnh $A D$.

Khi đó ta có $N H ⊥ lr(( A B C "D" )) ⇒ lr(( M N "," lr(( A B C "D" )) )) = hat(N M H)$.

$N H = D D ' = a$.

$Δ N M H$ vuông tại $H$:$"sin" hat(N M H) = frac(N H, N M) = frac(a, frac(2 sqrt(3) a, 3)) = frac(sqrt(3), 2)$.

Vậy $lr(( M N "," lr(( A B C "D" )) )) = hat(N M H) = 60 °$.

],
"tu-luyen-13": [
#set par(spacing:2mm)

#figure("chop-deu-chia-ba.svg",width:60mm)

Có $A B C D$ là hình vuông; $B D = a sqrt(2)$; $O D = frac(a, sqrt(2))$; $S O = sqrt(S D ^(2) - O D ^(2)) = sqrt(a ^(2) - frac(a ^(2), 2)) = frac(a sqrt(2), 2)$ Trong $Δ S O D$ dựng $M K ∥ S O$ suy ra $M K ⊥ lr(( A B C D ))$; $frac(M K, S O) = frac(M D, S D) = frac(1, 3) ⇒ M K = frac(S O, 3) = frac(a sqrt(2), 6)$

Ta có góc giữa $B M$ và $lr(( A B C D ))$ bằng $hat(M B K)$; $tan hat(M B K) = frac(M K, B K)$. Ta có $B K = B O + O K = O D + frac(2 O D, 3) = frac(5 a sqrt(2), 6)$

Suy ra: $tan hat(M B K) = frac(M K, B K) = frac(a sqrt(2), 6) . frac(6, 5 a sqrt(2)) = frac(1, 5)$

],
"tu-luyen-14": [
#set par(spacing:2mm)

#figure("lap-phuong-hinh-chieu-mn.svg",width:60mm)

Ta có $M$ là trung điểm của $A C ⇒ M$ là tâm của hình vuông $A B C D$.

Gọi $O = A' C' ∩ B' D' ⇒ M O ⊥ lr(( A' B' C' D' ))$.

Ta có $M N ∩ lr(( A' B' C' D' )) = N ⇒ lr(( M N "," lr(( A' B' C' D' )) )) = hat(M N O) = α$.

Gọi cạnh của hình lập phương bằng $a ⇒ O N = frac(a, 2)$ và $O M = a$.

Tam giác $M O N$ vuông tại $O ⇒ M N = sqrt(M O ^(2) + O N ^(2)) = frac(a sqrt(5), 2)$

$⇒ sin α = sin hat(M N O) = frac(O M, M N) = frac(2, sqrt(5))$. Vậy $sin α = frac(2, sqrt(5))$.

],
"tu-luyen-15": [
#set par(spacing:2mm)

#figure("chop-deu-goc-mat-cheo.svg",width:60mm)

Gọi $O$ là tâm của hình vuông $A B C D ⇒ S O ⊥ lr(( A B C D )) ⇒ O A$ là hình chiếu của $S A$ lên mặt phẳng $lr(( A B C D ))$.

Khi đó: $hat(lr(( S A "," lr(( A B C D )) ))) = hat(lr(( S A "," O A ))) = hat(S A O) = 30 °$. Vì $A B C D$ là hình vuông nên $C O ⊥ B D lr(( 1 ))$.

Ta có: $lr( vec(S O ⊥ lr(( A B C D )), C O ⊂ lr(( A B C D )), delim: #none) \}) ⇒ S O ⊥ C O lr(( 2 ))$.

Từ $lr(( 1 ))$ và $lr(( 2 ))$ suy ra: $C O ⊥ lr(( S B D )) ⇒ S O$ là hình chiếu của $S C$ lên $lr(( S B D ))$.

Do đó $hat(lr(( S C "," lr(( S B D )) ))) = hat(lr(( S C "," S O ))) = hat(C S O)$. Vì $S A = S C ⇒ Δ S A C$ cân tại $S ⇒ hat(S C O) = hat(S A O) = 30 °$.

Vậy góc hợp bởi đường thẳng $S C$ với mặt phẳng $lr(( S B D ))$ bằng $60 °$.

],
"tu-luyen-16": [
#set par(spacing:2mm)

#figure("chop-hinh-thang-hinh-chieu.svg",width:60mm)

*Chọn A*

Gọi $H$ là trung điểm của $A D$, khi đó $S H$ là hình chiếu của $S C$ lên mặt phẳng $( S A D )$

Suy ra góc giữa $S C$ và $( S A D )$ là góc $hat(C S H)$.

Tam giác $S H C$ vuông tại $H$ và có $C H = a$, $S H = sqrt(S A ^(2) + A H ^(2)) = a sqrt(3)$.

Ta có: $tan hat(C S H) = frac(C H, S H) = frac(1, sqrt(3)) ⇒ hat(C S H) = 30 °$.

],
)
