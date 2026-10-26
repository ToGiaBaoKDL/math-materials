#import "/templates/lesson.typ": paragraph, formula
#import "../figures.typ": diagram
#let solutions = (
  "bai-hoc-1": [
#paragraph[
Ta có: 
#formula(($cases(display(arrow(u _(d _(1))) = lr(( 2 ";" 1 ";" - 2 ))), display(arrow(u _(d _(2))) = lr(( - 2 ";" - 1 ";" 2 ))))$,$⇒ arrow(u _(d _(1))) = - arrow(u _(d _(2)))$,$⇒ arrow(u _(d _(1))) ∥ arrow(u _(d _(2)))$,))

]
#paragraph[
$⇒ arrow(u _(d _(1)))$ cùng phương với $arrow(u _(d _(2)))$
]
#paragraph[
Do đó: $lr(bracket.l vec(d _(1) ∥ d _(2), d _(1) ≡ d _(2), delim: #none) )$
]
#paragraph[
Lấy $A lr(( 1 ";" 0 ";" - 2 )) ∈ d _(1)$, thay vào $d _(2) : frac(3, - 2) = frac(- 1, - 1) = frac(- 2, 2)$ (vô lý)
]
#paragraph[
Từ đó ta có $A ∉ d _(2)$
]
#paragraph[
Vậy $d _(1) ∥ d _(2)$.
]
#paragraph[
*Chọn C.*
]
  ],
  "bai-hoc-2": [
#paragraph[Ta có $arrow(u_(d_1))=(-2;0;6)$ và $arrow(u_(d_2))=(-1;2;3)$, suy ra $arrow(u_(d_1))$ và $arrow(u_(d_2))$ không cùng phương.]
#paragraph[
$⇒ d _(1)$ cắt $d _(2)$ hoặc $d _(1) ";" d _(2)$ chéo nhau
]
#paragraph[
Lại có: $arrow(u _(d _(1))) dot  arrow(u _(d _(2))) = - 2 dot  lr(( - 1 )) + 0 dot  2 + 6 dot  3 = 20 ≠ 0$
]
#paragraph[
$⇒ arrow(u _(d _(1)))$ không vuông góc với $arrow(u _(d _(2))) ⇒ d _(1)$ không vuông góc với $d _(2)$
]
#paragraph[
Giải hệ phương trình: 
#formula(($cases(display(2 - 2 t _(1) = 1 - t _(2)), display(4 = 2 + 2 t _(2)), display(- 3 + 6 t _(1) = 3 t _(2)))$,$⇔ t _(1) = t _(2) = 1$,))

]
#paragraph[
$⇒ d _(1)$ cắt $d _(2)$.
]
#paragraph[
*Chọn D.*
]
  ],
  "bai-hoc-3": [
#paragraph[
Do mặt cầu tiếp xúc với mặt phẳng $lr(( P ))$
]
#paragraph[
$⇒ R = d lr(( I ";" lr(( P )) )) = frac(abs(1 - 4 + 2 - 8), 3) = 3$
]
#paragraph[
$⇒$ Phương trình mặt cầu 
#formula(($cases(display("tâm" I lr(( 1 ";" 2 ";" - 1 ))), display(R = 3)) : lr(( x - 1 )) ^(2) + lr(( y - 2 )) ^(2) + lr(( z + 1 )) ^(2) = 9$,))

]
#paragraph[
*Chọn B.*
]
  ],
  "bai-hoc-4": [
#paragraph[
Ta có: $d lr(( I ";" lr(( P )) )) = frac(abs(- 1 - 4 - 2 - 2), 3) = 3$
]
#paragraph[
$⇒ R ^(2) _("cầu") = d ^(2) lr(( I ";" lr(( P )) )) + 5 ^(2) = 3 ^(2) + 5 ^(2) = 34$
]
#paragraph[
$⇒$ Phương trình mặt cầu 
#formula(($lr(( S )) : cases(display("tâm" I lr(( - 1 ";" 2 ";" - 1 ))), display(R ^(2) = 34)) : lr(( x + 1 )) ^(2) + lr(( y - 2 )) ^(2) + lr(( z + 1 )) ^(2) = 34$,))

]
#paragraph[
*Chọn D.*
]
  ],
  "bai-hoc-5": [
#paragraph[
+ Chứng minh mặt phẳng $lr(( P ))$ cắt mặt cầu $lr(( S ))$ theo giao tuyến là một đường tròn
]
#paragraph[
Mặt cầu $lr(( S ))$ có: $cases(display(I lr(( 3 ";" 2 ";" 1 ))), display(R = sqrt(3 ^(2) + 2 ^(2) + 1 ^(2) + 11) = 5))$
]
#block(breakable: false, above: 3mm, below: 3mm, grid(columns: (1fr, 60mm), gutter: 5mm, align: left + horizon, [
Mà $d _(lr(( I ";" lr(( P )) ))) = frac(abs(18 + 6 - 2 - 1), sqrt(6 ^(2) + 3 ^(2) + 2 ^(2))) = 3 < R ⇒$ mặt phẳng $lr(( P ))$ cắt mặt cầu $lr(( S ))$ theo giao tuyến là một đường tròn $lr(( C ))$
], diagram("plane-cut", width: 60mm)))
#paragraph[
+ Ta có: $r _(lr(( C ))) = sqrt(R ^(2) - d ^(2) lr(( I ";" lr(( P )) ))) = 4$
]
#paragraph[
Gọi $H$ là tâm của đường tròn $lr(( C )) ⇒ H$ là hình chiếu vuông góc của $I$ trên $lr(( P ))$
]
#paragraph[
Phương trình đường thẳng $d$ qua $I$ và vuông góc với $lr(( P )) : cases(display(x = 3 + 6 t), display(y = 2 + 3 t), display(z = 1 - 2 t)) ⇒ H = d ∩ lr(( P ))$
]
#paragraph[
Vì $H ∈ d ⇒$ toạ độ điểm $H$ có dạng $lr(( 3 + 6 t ";" 2 + 3 t ";" 1 - 2 t ))$
]
#paragraph[
Mà 
#formula(($H ∈ lr(( P ))$,$⇒ 6 lr(( 3 + 6 t )) + 3 lr(( 2 + 3 t )) - 2 lr(( 1 - 2 t )) - 1 = 0$,$⇔ 49 t + 21 = 0$,$⇔ t = - frac(3, 7)$,$⇒ H lr(( frac(3, 7) ";" frac(5, 7) ";" frac(13, 7) ))$,))

]
  ],
  "bai-hoc-6": [
#paragraph[
+ Ta có: $A B = sqrt(2 ^(2) + 2 ^(2) + 2 ^(2)) = 2 sqrt(3) ⇒ R = frac(A B, 6) = frac(sqrt(3), 3)$
]
#paragraph[
+ Ta có: $arrow(A B) = lr(( - 2 ";" 2 ";" - 2 )) ⇒$ Chọn $arrow(u _(A B)) = lr(( 1 ";" - 1 ";" 1 )) ⇒$ Phương trình đường thẳng $A B : cases(display(x = 1 + t), display(y = - 2 - t), display(z = 3 + t))$
]
#paragraph[
+ Gọi $I$ là tâm của $lr(( S ))$
]
#paragraph[
Vì 
#formula(($I ∈ A B$,$⇒ I lr(( 1 + t ";" - 2 - t ";" 3 + t ))$,$⇒ d _(lr(( I "," lr(( P )) ))) = frac(abs(lr(( 1 + t )) + lr(( - 2 - t )) + lr(( 3 + t )) + 4), sqrt(3)) = frac(abs(t + 6), sqrt(3))$,))

]
#paragraph[
Để $lr(( S ))$ tiếp xúc với 
#formula(($lr(( P ))$,$⇔ d _(lr(( I ";" lr(( P )) ))) = R$,$⇔ frac(abs(t + 6), sqrt(3)) = frac(sqrt(3), 3)$,$⇔ abs(t + 6) = 1$,$⇔ lr(bracket.l vec(t = - 5 ⇒ I _(1) lr(( - 4 ";" 3 ";" - 2 )), t = - 7 ⇒ I _(2) lr(( - 6 ";" 5 ";" - 4 )), delim: #none) )$,))

]
  ],
  "bai-hoc-7": [
#paragraph[
*Chọn D*
]
#paragraph[
Mặt cầu $lr(( S ))$ có tâm $I lr(( 1 ";" - 3 ";" 0 ))$, bán kính $R = 3$.
]
#paragraph[
Phương trình tham số của đường thẳng $d : cases(display(x = - 2 t), display(y = - 2 + t), display(z = - 1 + 2 t))$.
]
#paragraph[
Xét hệ phương trình 
#formula(($cases(display(x = - 2 t), display(y = - 2 + t), display(z = - 1 + 2 t), display(lr(( x - 1 )) ^(2) + lr(( y + 3 )) ^(2) + z ^(2) = 9))$,$⇒ 9 t ^(2) + 2 t - 6 = 0 lr(( 1 ))$,))
.
]
#paragraph[
Phương trình (1) có 2 nghiệm phân biệt nên $d$ cắt $lr(( S ))$ tại 2 điểm phân biệt.
]
#paragraph[
$d lr(( I "," lr(( P )) )) = frac(abs(2 dot  1 - 2 dot  lr(( - 3 )) + 0 + 3), 3) = frac(11, 3) > R ⇒$ $lr(( P ))$ và $lr(( S ))$ không có điểm chung.
]
#paragraph[
Xét hệ phương trình $cases(display(x = - 2 t), display(y = - 2 + t), display(z = - 1 + 2 t), display(2 x - 2 y + z + 3 = 0)) ⇒ t = frac(7, 4)$. $d$ cắt $lr(( P ))$ tại một điểm.
]
#paragraph[
Vậy có 3 phát biểu đúng.
]
  ],
  "bai-hoc-8": [
#paragraph[
*Chọn C*
]
#block(width: 100%, breakable: false, above: 3mm, below: 3mm, align(center, box(width: 60mm, diagram("chord", width: 60mm))))
#paragraph[
Gọi $H$ là trung điểm đoạn thẳng $A B ⇒ I H ⊥ A B "," H A = 4$.
]
#paragraph[
Mặt cầu $lr(( S ))$ có tâm $I lr(( - 2 ";" 3 ";" 0 ))$, bán kính $R = sqrt(13 - m) "," lr(( m < 13 ))$.
]
#paragraph[
Đường thẳng $Δ$ đi qua $M lr(( 4 ";" 3 ";" 3 ))$ và có 1 véc tơ chỉ phương $arrow(u) = lr(( 2 ";" 1 ";" 2 ))$.
]
#paragraph[
Ta có: 
#formula(($arrow(I M) = lr(( 6 ";" 0 ";" 3 ))$,$⇒ lr([ arrow(I M) "," arrow(u) ]) = lr(( - 3 ";" - 6 ";" 6 ))$,$⇒ I H = d lr(( I "," Δ )) = frac(abs(lr([ arrow(I M) "," arrow(u) ])), abs(arrow(u))) = 3$,))
.
]
#paragraph[
Ta có: $R ^(2) = I H ^(2) + H A ^(2) ⇔ 13 - m = 3 ^(2) + 4 ^(2) ⇔ m = - 12$.
]
  ],
  "tu-luyen-1": [
#paragraph[
*Chọn C*
]
#paragraph[
$d _(1) : frac(x - 1, 2) = frac(y, 1) = frac(z + 2, - 2)$ $⇒ arrow(u _(1)) = lr(( 2 ";" 1 ";" - 2 ))$ ; $d _(2) : frac(x + 2, - 2) = frac(y - 1, - 1) = frac(z, 2)$ $⇒ arrow(u _(2)) = lr(( - 2 ";" - 1 ";" 2 ))$
]
#paragraph[
$arrow(u _(1)) = - arrow(u _(2)) ⇒ d _(1) ∥ d _(2)$ hoặc $d _(1) ≡ d _(2)$
]
#paragraph[
Điểm $M lr(( 1 ";" 0 ";" - 2 )) ∈ "d" _(1)$ ; $M ∉ d _(2)$ nên $d _(1) ∥ d _(2)$
]
  ],
  "tu-luyen-2": [
#paragraph[
*Chọn C*
]
#paragraph[
Vì $frac(2, - 1) ≠ frac(2, - 2)$ nên vectơ chỉ phương $arrow(u _(1)) = lr(( 2 ";" 2 ";" 3 ))$ của đường thẳng $Δ _(1)$ không cùng phương với vectơ chỉ phương $arrow(u _(2)) = lr(( - 1 ";" - 2 ";" 1 ))$ của $Δ _(2)$. Tức là $Δ _(1)$ chéo với $Δ _(2)$ hoặc $Δ _(1)$ cắt $Δ _(2)$.
]
#paragraph[
Lấy $M lr(( 1 ";" - 1 ";" 0 )) ∈ Δ _(1)$, $N lr(( 3 ";" 3 ";" - 2 )) ∈ Δ _(2)$. Ta có: $arrow(M N) = lr(( 2 ";" 4 ";" - 2 ))$.
]
#paragraph[
Khi đó: $lr([ arrow(u _(1)) ";" arrow(u _(2)) ]) dot  arrow(M N) = 0$. Suy ra $arrow(u _(1)) "," arrow(u _(2)) "," arrow(M N)$ đồng phẳng.
]
#paragraph[
Vậy $Δ _(1)$ cắt $Δ _(2)$.
]
  ],
  "tu-luyen-3": [
#paragraph[
*Chọn A*
]
#paragraph[
Đường thẳng $d$ có vtcp $arrow(u) lr(( 1 ";" - 3 ";" - 1 ))$
]
#paragraph[
Mặt phẳng $lr(( P ))$ có vtpt $arrow(n) lr(( 3 ";" - 3 ";" 2 ))$
]
#paragraph[
Ta có $arrow(u) dot  arrow(n) = 3 + 9 - 2 = 10 ≠ 0$ nên loại trường hợp $d ∥ lr(( P ))$ và $d ⊂ lr(( P ))$.
]
#paragraph[
Lại có $arrow(u)$ và $arrow(n)$ không cùng phương nên loại trường hợp $d ⊥ lr(( P ))$.
]
#paragraph[
Vậy $d$ cắt và không vuông góc với $lr(( P )).$
]
  ],
  "tu-luyen-4": [
#paragraph[
*Chọn C*
]
#paragraph[
Cách 1: Lấy $cases(display(A lr(( 0 ";" 2 ";" - 1 )) ∈ Δ), display(B lr(( - 2 ";" 3 ";" 2 )) ∈ Δ))$
]
#paragraph[
Mà $Δ ⊂ lr(( P ))$ $⇒ cases(display(A ∈ lr(( P ))), display(B ∈ lr(( P ))))$ $⇔ cases(display(2 m - n - 16 = 0), display(11 dot  lr(( - 2 )) + 3 m + 2 n - 16 = 0)) ⇔ cases(display(m = 10), display(n = 4))$
]
#paragraph[
$⇒ T = m + n = 14$.
]
#paragraph[
Cách 2: Đường thẳng $Δ$ đi qua $A lr(( 0 ";" 2 ";" - 1 ))$ có VTCP $arrow(u) = lr(( - 2 ";" 1 ";" 3 ))$.
]
#paragraph[
Mặt phẳng $lr(( P ))$ có VTPT $arrow(n) = lr(( 11 ";" m ";" n ))$.
]
#paragraph[
$Δ ⊂ lr(( P )) ⇒ cases(display(A ∈ lr(( P ))), display(arrow(n) dot  arrow(u) = 0))$ $⇔ cases(display(2 m - n - 16 = 0), display(- 22 + m + 3 n = 0)) ⇔ cases(display(m = 10), display(n = 4))$.
]
#paragraph[
$⇒ T = m + n = 14$.
]
  ],
  "tu-luyen-5": [
#paragraph[
*Chọn D*
]
#paragraph[
Đường thẳng $d$ có vectơ chỉ phương là $arrow(u) = lr(( 1 ";" 3 ";" - 1 ))$.
]
#paragraph[
Mặt phẳng $lr(( α ))$ có vectơ pháp tuyến là $arrow(n) = lr(( m ^(2) ";" - m ";" - 2 ))$.
]
#paragraph[
Để $d ∥ lr(( α ))$ thì $cases(display(arrow(u) dot  arrow(n) = 0), display(M lr(( 1 ";" 2 ";" 9 )) ∉ lr(( α ))))$ 
#formula(($⇔ cases(display(m ^(2) - 3 m + 2 = 0), display(m ^(2) - 2 m - 18 + 19 ≠ 0))$,$⇔ cases(display(lr(bracket.l vec(m = 1, m = 2, delim: #none) )), display(m ≠ 1))$,$⇔ m = 2$,))
.
]
  ],
  "tu-luyen-6": [
#paragraph[
*Chọn D*
]
#paragraph[
Một véctơ chỉ phương của $d :$ $arrow(u) = lr(( 1 ";" - 1 ";" 1 ))$ ; $A lr(( 1 ";" - 1 ";" 2 )) ∈ d$.
]
#paragraph[
Một véctơ pháp tuyến của $lr(( P )) :$ $arrow(n) = lr(( 2 ";" 1 ";" - m ^(2) ))$.
]
#paragraph[

#formula(($d ∥ lr(( P ))$,$⇔ cases(display(arrow(u) ⊥ arrow(n)), display(A ∉ lr(( P ))))$,$⇔ cases(display(1 ⋅ 2 - 1 ⋅ 1 - 1 ⋅ m ^(2) = 0), display(2 ⋅ 1 - 1 - 2 m ^(2) + m ≠ 0))$,))

]
#paragraph[

#formula(($⇔ cases(display(1 - m ^(2) = 0), display(1 - 2 m ^(2) + m ≠ 0))$,$⇔ cases(display(m = ± 1), display(1 - 2 m ^(2) + m ≠ 0))$,$⇔ m = - 1$,))
.
]
  ],
  "tu-luyen-7": [
#paragraph[
*Chọn D*
]
#paragraph[
$lr(( P _(m) )) : m x + 2 y + n z + 1 = 0$ có VTPT $arrow(n _(P)) = lr(( m ";" 2 ";" n ))$.
]
#paragraph[
$lr(( Q _(m) )) : x - m y + n z + 2 = 0$ có VTPT $arrow(n _(Q)) = lr(( 1 ";" - m ";" n ))$.
]
#paragraph[
$lr(( α )) : 4 x - y - 6 z + 3 = 0$ có VTPT $arrow(n _(α)) = lr(( 4 ";" - 1 ";" - 6 ))$.
]
#paragraph[
Do giao tuyến của $lr(( P _(m) ))$ và $lr(( Q _(n) ))$ vuông góc với $lr(( α ))$
]
#paragraph[

#formula(($⇒ cases(display(lr(( P _(m) )) ⊥ lr(( α ))), display(lr(( Q _(n) )) ⊥ lr(( α ))))$,$⇒ cases(display(arrow(n _(P)) ⊥ arrow(n _(α))), display(arrow(n _(Q)) ⊥ arrow(n _(α))))$,$⇒ cases(display(4 m - 2 - 6 n = 0), display(4 + m - 6 n = 0))$,$⇒ cases(display(4 m - 6 n = 2), display(m - 6 n = - 4))$,$⇒ cases(display(m = 2), display(n = 1))$,))

]
#paragraph[
Vậy $m + n = 3$.
]
  ],
  "tu-luyen-8": [
#paragraph[
*Chọn D*
]
#paragraph[
Tọa độ điểm $H$ là hình chiếu của điểm $I$ trên mặt phẳng $lr(( P ))$.
]
#paragraph[
Phương trình đường thẳng $d$ qua $I$ và vuông góc với mặt phẳng $lr(( P ))$ là: $cases(display(x = 1 + 2 t), display(y = 2 - 2 t), display(z = 3 - t))$.
]
#paragraph[
Tọa độ điểm $H$ là giao điểm của $d$ và $lr(( P ))$, ta có:
]
#paragraph[
$2 lr(( 1 + 2 t )) - 2 lr(( 2 - 2 t )) - lr(( 3 - t )) - 4 = 0 ⇔ t = 1$
]
#paragraph[
Vậy $H lr(( 3 ";" 0 ";" 2 ))$.
]
  ],
  "tu-luyen-9": [
#paragraph[
*Chọn B*
]
#paragraph[
$arrow(n _(P)) = lr(( 1 ";" - 2 ";" 2 ))$ là véc tơ chỉ phương của đường thẳng $O H$ $⇒ O H : cases(display(x = t), display(y = - 2 t), display(z = 2 t))$
]
#paragraph[
$⇒ H lr(( t ";" - 2 t ";" 2 t ))$
]
#paragraph[
$H ∈ lr(( P ))$ $⇒ t - 2 dot  lr(( - 2 t )) + 2 dot  2 t + 9 = 0$ $⇔ t = - 1$ $⇒ H lr(( - 1 ";" 2 ";" - 2 ))$ $⇒ a + b + c = - 1$
]
  ],
  "tu-luyen-10": [
#paragraph[
*Chọn C*
]
#paragraph[
Gọi $H lr(( 1 + 2 t ";" - t ";" t ))$ là hình chiếu của $I$ trên đường thẳng $d$.
]
#paragraph[
Có $arrow(I H) = lr(( 2 t ";" - t ";" t - 2 ))$ ; vectơ chỉ phương của $d$ là $arrow(u) = lr(( 2 ";" - 1 ";" 1 ))$.
]
#paragraph[
Vì $H$ là hình chiếu vuông góc của $I$ trên $d$ nên $arrow(I H) ⊥ arrow(u) ⇔ arrow(I H) dot  arrow(u) = 0$
]
#paragraph[
$⇔ 2 t dot  2 + lr(( - t )) dot  lr(( - 1 )) + lr(( t - 2 )) dot  1 = 0$ $⇔ t = frac(1, 3)$ $⇒ arrow(I H) = lr(( frac(2, 3) ";" - frac(1, 3) ";" - frac(5, 3) ))$ $⇒ I H = frac(sqrt(30), 3)$.
]
#paragraph[
Bán kính của mặt cầu $lr(( S ))$ là $R = I H = frac(sqrt(30), 3)$.
]
  ],
  "tu-luyen-11": [
#paragraph[
Lấy $A lr(( 0 ";" - 1 ";" 2 )) ∈ d$ và chọn $arrow(u _(d)) = lr(( 1 ";" - 1 ";" - 1 ))$
]
#paragraph[
$⇒ arrow(A I) = lr(( 1 ";" 4 ";" 3 )) ⇒ lr([ arrow(A I) ";" arrow(u _(d)) ]) = lr(( - 1 ";" 4 ";" - 5 ))$
]
#paragraph[
$⇒ abs(lr([ arrow(A I) ";" arrow(u _(d)) ])) = sqrt(lr(( - 1 )) ^(2) + 4 ^(2) + lr(( - 5 )) ^(2)) = sqrt(42)$
]
#paragraph[

#formula(($⇒ R = d lr(( I ";" d )) = frac(abs(lr([ arrow(A I) ";" arrow(u _(d)) ])), abs(arrow(u _(d)))) = frac(sqrt(42), sqrt(1 ^(2) + lr(( - 1 )) ^(2) + lr(( - 1 )) ^(2))) = frac(sqrt(42), sqrt(3)) = sqrt(14)$,))
.
]
#paragraph[
*Chọn B.*
]
  ],
  "tu-luyen-12": [
#paragraph[
Gọi H là trung điểm của $A B ⇒ I H ⊥ A B ⇒ I H = d lr(( I ";" d ))$
]
#paragraph[
Ta có $arrow(u _(d)) = lr(( 2 ";" 1 ";" - 2 )) "," M lr(( - 7 ";" - 9 ";" - 7 )) ∈ d$. Ta có 
#formula(($lr([ arrow(u _(d)) "," arrow(I M) ]) = lr(( 30 ";" - 30 ";" 15 ))$,$⇒ d lr(( I ";" d )) = frac(abs(lr([ arrow(u _(d)) "," arrow(I M) ])), abs(arrow(u _(d)))) = 15$,))

]
#paragraph[
Bán kính mặt cầu $R = sqrt(A H ^(2) + d ^(2) lr(( I ";" d ))) = sqrt(20 ^(2) + 15 ^(2)) = 25$
]
#paragraph[
$⇒ lr(( S )) : lr(( x - 2 )) ^(2) + lr(( y - 3 )) ^(2) + lr(( z + 1 )) ^(2) = 25 ^(2)$. *Chọn A.*
]
  ],
  "tu-luyen-13": [
#paragraph[
Mặt cầu $lr(( S ))$ có tâm $I lr(( 4 ";" - 5 ";" - 2 ))$, bán kính $R = 5$. Ta có $d lr(( I ";" lr(( P )) )) = sqrt(19)$
]
#paragraph[
Bán kính của giao tuyến là $r = sqrt(R ^(2) - d ^(2) lr(( I "," lr(( P )) ))) = sqrt(5 ^(2) - 19) = sqrt(6)$. *Chọn D.*
]
  ],
  "tu-luyen-14": [
#paragraph[
Mặt cầu $lr(( S ))$ có tâm $I lr(( 0 ";" 1 ";" 1 ))$, bán kính $R = 5$. Ta có $d lr(( I ";" lr(( P )) )) = 3$
]
#paragraph[
Bán kính thiết diện là $r = sqrt(R ^(2) - d ^(2) lr(( I ";" lr(( P )) ))) = 4 ⇒$ diện tích là $π r ^(2) = 16 π$. *Chọn D.*
]
  ],
  "tu-luyen-15": [
#paragraph[
*Chọn B*
]
#paragraph[
Mặt cầu $lr(( S ))$ có tâm $I lr(( 1 ";" 1 ";" - 2 ))$ và bán kính $R = 2$. Gọi $d$ là khoảng cách từ tâm $I$ đến mặt phẳng $lr(( α ))$. Ta có $d = d lr(( I "," lr(( α )) )) = frac(2 sqrt(6), 3)$. Khi đó ta có: $r = sqrt(R ^(2) - d ^(2)) = frac(2 sqrt(3), 3)$.
]
  ],
  "tu-luyen-16": [
#paragraph[
Do $I ∈ d ⇒ I lr(( t ";" - 6 + t ";" 2 - t ))$. Ta có $d lr(( I ";" lr(( P )) )) = frac(abs(5 t - 21), sqrt(11))$. Ta có $arrow(u _("Δ")) = lr(( 2 ";" 1 ";" - 1 )) "," M lr(( 5 ";" 1 ";" - 1 )) ∈ "Δ"$.
]
#paragraph[
Ta có 
#formula(($lr([ arrow(u _("Δ")) "," arrow(I M) ]) = lr(( - 4 ";" t - 1 ";" t - 9 ))$,$⇒ d lr(( I ";" "Δ" )) = frac(sqrt(lr(( - 4 )) ^(2) + lr(( t - 1 )) ^(2) + lr(( t - 9 )) ^(2)), sqrt(6)) = frac(sqrt(2 t ^(2) - 20 t + 98), sqrt(6))$,))

]
#paragraph[
Mà $lr(( S ))$ tiếp xúc với $"Δ"$ và $lr(( P ))$ nên $d lr(( I ";" lr(( P )) )) = d lr(( I ";" "Δ" )) ⇔ frac(abs(5 t - 21), sqrt(11)) = frac(sqrt(2 t ^(2) - 20 t + 98), sqrt(6))$
]
#paragraph[

#formula(($⇔ frac(lr(( 5 t - 21 )) ^(2), 11) = frac(2 t ^(2) - 20 t + 98, 6)$,$⇔ lr(bracket.l vec(t = 2, t = frac(49, 8) lr(( l )), delim: #none) )$,$⇒ I lr(( 2 ";" - 4 ";" 0 ))$,))
. *Chọn C.*
]
  ],
  "tu-luyen-17": [
#paragraph[
*Chọn D*
]
#block(width: 100%, breakable: false, above: 3mm, below: 3mm, align(center, box(width: 100mm, diagram("equilateral", width: 100mm))))
#paragraph[
Mặt cầu $lr(( S ))$ có tâm $O lr(( 0 ";" 0 ";" 0 ))$ bán kính $R = 2$. Tam giác $O A B$ là tam giác đều có cạnh bằng 2. Gọi $M$ là trung điểm $A B$ ta có $O M = frac(2 sqrt(3), 2) = sqrt(3)$, mặt khác $arrow(O E) lr(( 1 ";" 1 ";" 1 )) ⇒ O E = sqrt(3)$. Vậy điểm $M$ trùng điểm $E$. Gọi $arrow(u)$ là vectơ chỉ phương của $Δ$ ta có: $arrow(u) ⊥ arrow(O E)$ và $arrow(u) ⊥ arrow(n)$ ( với $arrow(n) lr(( 1 ";" - 3 ";" 5 ))$ là vectơ pháp tuyến của $lr(( P ))$ vì $Δ ⊂ lr(( P ))$ ).
]
#paragraph[
$lr([ arrow(n) "," arrow(O E) ]) = lr(( - 8 ";" 4 ";" 4 ))$, chọn $arrow(u) = - frac(1, 4) lr([ arrow(n) "," arrow(O E) ]) = lr(( 2 ";" - 1 ";" - 1 ))$.
]
#paragraph[
Vậy đường thẳng $Δ$ đi qua $E$, có vectơ chỉ phương $arrow(u) lr(( 2 ";" - 1 ";" - 1 ))$ có phương trình là: $frac(x - 1, 2) = frac(y - 1, - 1) = frac(z - 1, - 1)$.
]
  ],
)
