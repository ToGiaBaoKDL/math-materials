#import "/templates/lesson.typ": exercise, paragraph, subheading, formula, lesson-section, theory-box
#import "/templates/components.typ": figure-panel
#import "/templates/theme.typ": lesson-style
#import "../figures/reflection.typ": reflection-theory, reflection-example, reflection-practice
#import "../figures/balloons.typ": balloons

#let bai-hoc(variant) = [

#lesson-section([PHƯƠNG PHÁP TÂM TỶ CỰ], number: 1, above: 0pt)

#subheading[Bài toán 1 · Cực trị độ dài tổng – hiệu các vectơ]

#paragraph[Cho $n$ điểm $A _(1) ; A _(2) ; dots.h ; A _(n)$ và các hệ số $k _(1) ; k _(2) ; dots.h ; k _(n)$ sao cho $k = k _(1) + k _(2) + dots.h + k _(n) ≠ 0$ và đường thẳng $d$ hoặc mặt phẳng $lr(( P ))$. Tìm điểm $M$ trên đường thẳng $d$ hoặc mặt phẳng $lr(( P ))$, sao cho $abs(k _(1) . arrow(M A _(1)) + k _(2) . arrow(M A _(2)) + dots.h + k _(n) . arrow(M A _(n)))$ nhỏ nhất.]

#theory-box(title: [Hướng giải quyết])[

#paragraph[*Bước 1:*  Gọi $I$ là điểm thỏa mãn $k _(1) . arrow(I A _(1)) + k _(2) . arrow(I A _(2)) + dots.h + k _(n) . arrow(I A _(n)) = 0$.]

#paragraph(keep-next: true)[*Bước 2:*  Áp dụng quy tắc ba điểm biến đổi:]
#formula(($abs(k _(1) . arrow(M A _(1)) + k _(2) . arrow(M A _(2)) + dots.h + k _(n) . arrow(M A _(n)))$, $= abs(lr(( k _(1) + k _(2) + dots.h + k _(n) )) arrow(M I))$, $= abs(k) abs(arrow(M I))$,))

#paragraph[*Bước 3:*  Biểu thức đã cho đạt nhỏ nhất khi MI nhỏ nhất, từ đây ta xử lý tiếp bài toán cho MI nhỏ nhất đơn giản hơn.]

]

#subheading[Bài toán 2 · Cực trị tổng – hiệu bình phương các đoạn thẳng]

#paragraph[Cho $n$ điểm $A _(1) ; A _(2) ; dots.h ; A _(n)$ và các hệ số $k _(1) ; k _(2) ; dots.h ; k _(n)$ sao cho $k = k _(1) + k _(2) + dots.h + k _(n) > 0$. Tìm điểm $M$ trên đường thẳng $d$ hoặc mặt phẳng $lr(( P ))$, sao cho tổng $S = k _(1) ⋅ M A _(1)^(2) + k _(2) ⋅ M A _(2)^(2) + . . . + k _(n) ⋅ M A _(n)^(2)$ đạt giá trị nhỏ nhất.]

#theory-box(title: [Hướng giải quyết])[

#paragraph[*Bước 1:*  Gọi $I$ là điểm thỏa mãn $k _(1) . arrow(I A _(1)) + k _(2) . arrow(I A _(2)) + dots.h + k _(n) . arrow(I A _(n)) = 0$.]

#paragraph(keep-next: true)[*Bước 2:*  Thấy rằng]
#formula(($M A _(1)^(2)$, $= abs(arrow(M A _(1))) ^(2)$, $= lr(( arrow(M A _(1)) )) ^(2)$, $= lr(( arrow(M I) + arrow(I A _(1)) )) ^(2)$, $= lr(( arrow(M I) )) ^(2)$, $+ 2 lr(( arrow(M I) . arrow(I A _(1)) ))$, $+ lr(( arrow(I A _(1)) )) ^(2)$,))

#paragraph(keep-next: true)[Áp dụng quy tắc ba điểm biến đổi:]

#block(width: 100%, breakable: false,
  above: lesson-style.formula-gap, below: lesson-style.formula-gap)[
  #show math.equation.where(block: true): set block(above: 0pt, below: 0pt)
  $
    S &= k _(1) ⋅ M A _(1)^(2) + k _(2) ⋅ M A _(2)^(2) + . . . + k _(n) ⋅ M A _(n)^(2) \
      &= k _(1) lr([ lr(( arrow(M I) )) ^(2) + 2 lr(( arrow(M I) . arrow(I A _(1)) )) + lr(( arrow(I A _(1)) )) ^(2) ]) \
      &quad + . . . + k _(n) lr([ lr(( arrow(M I) )) ^(2) + 2 lr(( arrow(M I) . arrow(I A _(n)) )) + lr(( arrow(I A _(n)) )) ^(2) ]) \
      &= lr(( k _(1) + k _(2) + . . . + k _(n) )) M I ^(2) + lr(( k _(1) ⋅ I A _(1)^(2) + . . . + k _(n) ⋅ I A _(n)^(2) )) \
      &quad + 2 arrow(M I) lr(( underbrace(k _(1) . arrow(I A _(1)) + dots.h + k _(n) . arrow(I A _(n)), = 0) )) \
      &= lr(( k _(1) + k _(2) + . . . + k _(n) )) M I ^(2) + lr(( k _(1) ⋅ I A _(1)^(2) + . . . + k _(n) ⋅ I A _(n)^(2) ))
  $
]

#paragraph[*Bước 3:*  Do $k > 0$, để $S = k _(1) ⋅ M A _(1)^(2) + k _(2) ⋅ M A _(2)^(2) + . . . + k _(n) ⋅ M A _(n)^(2)$ đạt giá trị nhỏ nhất thì ta xác định vị trí điểm $M$ cần tìm.]

#paragraph[▶ Chú ý: Cho đa giác $A _(1) A _(2) dots.h A _(n)$ và các hệ số $k _(1) ; k _(2) ; dots.h ; k _(n)$ sao cho $k = k _(1) + k _(2) + dots.h + k _(n) < 0$. Tìm điểm $M$ trên $d$ hoặc $lr(( P ))$, sao cho tổng $S = k _(1) ⋅ M A _(1)^(2) + k _(2) ⋅ M A _(2)^(2) + . . . + k _(n) ⋅ M A _(n)^(2)$ đạt giá trị lớn nhất. Ta cũng thực hiện tương tự.]

]

#theory-box(title: [Công thức tính nhanh tọa độ tâm tỷ cự])[

#paragraph[Cho $I$ thỏa mãn: $a _(1) arrow(I A _(1)) + a _(2) arrow(I A _(2)) + a _(3) arrow(I A _(3)) + . . . + a _(n) arrow(I A _(n)) = arrow(0)$]

#paragraph(keep-next: true)[$⇒$ Tọa độ $I$ được tính theo công thức sau:]

#formula(($cases(display(x _(I) = frac(a _(1) x _(A _(1)) + a _(2) x _(A _(2)) + a _(3) x _(A _(3)) + . . . + a _(n) x _(A _(n)), a _(1) + a _(2) + a _(3) + . . . + a _(n))), display(y _(I) = frac(a _(1) y _(A _(1)) + a _(2) y _(A _(2)) + a _(3) y _(A _(3)) + . . . + a _(n) y _(A _(n)), a _(1) + a _(2) + a _(3) + . . . + a _(n))), display(z _(I) = frac(a _(1) z _(A _(1)) + a _(2) z _(A _(2)) + a _(3) z _(A _(3)) + . . . + a _(n) z _(A _(n)), a _(1) + a _(2) + a _(3) + . . . + a _(n))))$,))

#subheading[Hệ hai điểm]

#formula(($a _(1) arrow(I A _(1))$, $+ a _(2) arrow(I A _(2))$, $= 0$, $⇒ cases(display(x _(I) = frac(a _(1) x _(A _(1)) + a _(2) x _(A _(2)), a _(1) + a _(2))), display(y _(I) = frac(a _(1) y _(A _(1)) + a _(2) y _(A _(2)), a _(1) + a _(2))), display(z _(I) = frac(a _(1) z _(A _(1)) + a _(2) z _(A _(2)), a _(1) + a _(2))))$,))

#subheading[Hệ ba điểm]

#formula(($a _(1) arrow(I A _(1))$, $+ a _(2) arrow(I A _(2))$, $+ a _(3) arrow(I A _(3))$, $= 0$, $⇒ cases(display(x _(I) = frac(a _(1) x _(A _(1)) + a _(2) x _(A _(2)) + a _(3) x _(A _(3)), a _(1) + a _(2) + a _(3))), display(y _(I) = frac(a _(1) y _(A _(1)) + a _(2) y _(A _(2)) + a _(3) y _(A _(3)), a _(1) + a _(2) + a _(3))), display(z _(I) = frac(a _(1) z _(A _(1)) + a _(2) z _(A _(2)) + a _(3) z _(A _(3)), a _(1) + a _(2) + a _(3))))$,))

]

#exercise(
  1, [Trong không gian với hệ tọa độ $O x y z$ cho $A lr(( 3 ; 2 ; 1 ))$, $B lr(( - 2 ; 3 ; 6 ))$. Điểm $M lr(( x _(M) ; y _(M) ; z _(M) ))$ thay đổi thuộc mặt phẳng $lr(( O x y ))$. Tìm giá trị của biểu thức $T = x _(M) + y _(M) + z _(M)$ khi $abs(arrow(M A) + 3 arrow(M B))$ nhỏ nhất.],
  variant: variant,
  writing-lines: 8,
  source-id: "bai-hoc-1",
  answers: ([$- frac(7, 2)$], [$frac(7, 2)$], [$2$], [$- 2$],),
  solution: [
#paragraph[Chọn C]
#paragraph(keep-next: true)[Gọi điểm $H$ thỏa mãn $arrow(H A) + 3 arrow(H B) = arrow(0)$ khi đó:]
#formula(($cases(display(x _(H) = frac(x _(A) + 3 x _(B), 1 + 3)), display(y _(H) = frac(y _(A) + 3 y _(B), 1 + 3)), display(z _(H) = frac(z _(A) + 3 z _(B), 1 + 3)))$, $⇒ H lr(( - frac(3, 4) ; frac(11, 4) ; frac(19, 4) )) .$,))
#paragraph[Phương trình mặt phẳng $lr(( O x y ))$ là $z = 0$.]
#paragraph(keep-next: true)[Xét $T = frac(z _(H), 1) = frac(19, 4)$ do đó tọa độ điểm $M$ cần tìm là:]
#formula(($cases(display(x _(M) = x _(H) - a T), display(y _(M) = y _(H) - b T), display(z _(M) = z _(H) - c T))$, $⇒ M lr(( - frac(3, 4) ; frac(11, 4) ; 0 )) .$,))
#paragraph[Vậy $T = x _(M) + y _(M) + z _(M) = - frac(3, 4) + frac(11, 4) + 0 = 2$.]
]
)

#exercise(
  2, [Trong không gian với hệ tọa độ $O x y z$, cho $A lr(( - 1 ; 2 ; 1 ))$, $B lr(( 2 ; - 1 ; 3 ))$, $C lr(( 3 ; 5 ; - 1 ))$. Điểm $M lr(( a ; b ; c ))$ trên mặt phẳng $lr(( O y z ))$ sao cho $abs(arrow(M A) + 2 arrow(M B) - arrow(C M))$ đạt giá trị nhỏ nhất. Khi đó ta có $2 b + c$ bằng],
  variant: variant,
  writing-lines: 8,
  source-id: "bai-hoc-2",
  answers: ([$- 1$.], [$4$.], [$1$.], [$- 4$.],),
  solution: [
#paragraph[Chọn B.]
#formula(($abs(arrow(M A) + 2 arrow(M B) - arrow(C M))$, $= abs(arrow(M A) + 2 arrow(M B) + arrow(M C))$, $= abs(4 . arrow(M I) + arrow(I A) + 2 arrow(I B) + arrow(I C))$,))
#paragraph[Tìm điểm I sao cho $arrow(I A) + 2 arrow(I B) + arrow(I C) = arrow(0)$ ta được $I lr(( frac(3, 2) ; frac(5, 4) ; frac(3, 2) ))$]
#paragraph[Khi đó: $abs(arrow(M A) + 2 arrow(M B) - arrow(C M)) = abs(4 arrow(M I)) = 4 M I$]
#paragraph[Để $abs(arrow(M A) + 2 arrow(M B) - arrow(C M))$ đạt giá trị nhỏ nhất thì $M I$ đạt giá trị nhỏ nhất hay $M$ là hình chiếu của $I$ lên mặt phẳng $lr(( O y z ))$.]
#paragraph[Vậy tọa độ điểm $M lr(( 0 ; frac(5, 4) ; frac(3, 2) ))$ hay $2 b + c = 4$.]
]
)

#exercise(
  3, [Trong không gian với hệ trục tọa độ $O x y z$, cho điểm  $A lr(( 0 ; - 2 ; - 3 ))$, $B lr(( - 4 ; - 4 ; 1 ))$; $C lr(( 2 ; - 3 ; 3 ))$. Tìm tọa độ điểm M trong mặt phẳng $O x z$ sao cho $M A ^(2) + M B ^(2) + 2 M C ^(2)$ đạt giá trị nhỏ nhất.],
  variant: variant,
  writing-lines: 6,
  source-id: "bai-hoc-3",
  answers: ([$lr(( 0 ; 0 ; 3 ))$.], [$lr(( 0 ; 0 ; 2 ))$.], [$lr(( 0 ; 0 ; 1 ))$.], [$lr(( 0 ; 0 ; - 1 ))$.],),
  solution: [
#paragraph[Gọi I là điểm thỏa mãn $arrow(I A) + arrow(I B) + 2 arrow(I C) = arrow(0) ⇒ I lr(( 0 ; - 3 ; 1 ))$]
#paragraph(keep-next: true)[Biến đổi]
#formula(($M A ^(2)$, $+ M B ^(2)$, $+ 2 M C ^(2)$, $= 4 M I ^(2)$, $+ I A ^(2)$, $+ I B ^(2)$, $+ 2 I C ^(2)$,))
#paragraph[nhỏ nhất $⇔ M I _(min) ⇔ M$ là hình chiếu vuông góc của I trên $lr(( O x z )) ⇒ M lr(( 0 ; 0 ; 1 ))$. Chọn C.]
]
)

#exercise(
  4, [Trong không gian với hệ trục $O x y z$, cho các điểm $A lr(( 2 ; 0 ; - 1 ))$, $B lr(( 1 ; 0 ; - 1 ))$, $C lr(( 0 ; 1 ; 0 ))$. Gọi $M$ là điểm thuộc mặt phẳng $O x y$ sao cho $A M ^(2) - 5 B M ^(2) + 2 C M ^(2)$ đạt giá trị lớn nhất. Tính độ dài đoạn thẳng OM.],
  variant: variant,
  writing-lines: 6,
  source-id: "bai-hoc-4",
  answers: ([$frac(sqrt(13), 2)$.], [$frac(sqrt(29), 2)$.], [$frac(sqrt(26), 2)$.], [$frac(sqrt(6), 2)$.],),
  solution: [
#paragraph[Đặt $T = M A ^(2) - 5 M B ^(2) + 2 M C ^(2)$]
#paragraph[Gọi I là điểm thỏa mãn $arrow(I A) - 5 arrow(I B) + 2 arrow(I C) = arrow(0) ⇒ I lr(( frac(3, 2) ; - 1 ; - 2 ))$]
#paragraph[Biến đổi $T = - 2 M I ^(2) + I A ^(2) - 5 I B ^(2) + 2 I C ^(2)$ lớn nhất $⇔ M I _(min) ⇔ M$ là hình chiếu vuông góc của I trên $O x y ⇒ M lr(( frac(3, 2) ; - 1 ; 0 )) ⇒ O M = frac(sqrt(13), 2)$. Chọn A.]
]
)

#exercise(
  5, [Trong không gian với hệ tọa độ $O x y z$, cho hai điểm  $A lr(( 2 ; - 3 ; 2 ))$, $B lr(( 3 ; 5 ; 4 ))$. Tìm tọa độ điểm M trên trục $O z$ sao cho $M A ^(2) + M B ^(2)$ đạt giá trị nhỏ nhất.],
  variant: variant,
  writing-lines: 6,
  source-id: "bai-hoc-5",
  answers: ([$M lr(( 0 ; 0 ; 49 ))$.], [$M lr(( 0 ; 0 ; 0 ))$.], [$M lr(( 0 ; 0 ; 67 ))$.], [$M lr(( 0 ; 0 ; 3 ))$.],),
  solution: [
#paragraph(keep-next: true)[Gọi]
#formula(($M lr(( 0 ; 0 ; t ))$, $⇒ M A ^(2)$, $+ M B ^(2)$, $= 4$, $+ 9$, $+ lr(( t - 2 )) ^(2)$, $+ 9$, $+ 25$, $+ lr(( t - 4 )) ^(2)$, $= 2 t ^(2) - 12 t$, $+ 67$,))
#paragraph[nhỏ nhất $⇔ t = frac(- b, 2 a) = frac(12, 2 . 2) = 3 ⇒ M lr(( 0 ; 0 ; 3 ))$. Chọn D.]
]
)

#block(width: 100%, breakable: false)[
#lesson-section([PHƯƠNG PHÁP QUY ĐỔI ĐỐI XỨNG], number: 2, above: 0pt)

#subheading[Bài toán]

#paragraph[Cho mặt phẳng $( P )$ và hai điểm phân biệt $A$, $B$. Tìm điểm $M$ thuộc $( P )$ sao cho]

#paragraph[1. $M A + M B$ nhỏ nhất.]

#paragraph[2. $| M A - M B |$ lớn nhất.]

#theory-box(title: [Phương pháp])[

#paragraph[1. Ta xét các trường hợp sau]

#paragraph[- TH 1: Nếu $A$ và $B$ nằm về hai phía so với $( P )$. Khi đó]

#formula(($A M$, $+ B M$, $≥ A B$,))

#paragraph[Đẳng thức xảy ra khi $M$ là giao điểm của $A B$ với $( P )$.]

#paragraph[- TH 2: Nếu $A$ và $B$ nằm cùng một phía so với $( P )$. Gọi $A ^(′)$ đối xứng với $A$ qua $( P )$. Khi đó]

#formula(($A M$, $+ B M$, $= A ^(′) M$, $+ B M$, $≥ A ^(′) B$,))

#paragraph[Đẳng thức xảy ra khi $M$ là giao điểm của $A ^(′) B$ với $( P )$.]

#figure-panel(scale(x: lesson-style.figure-scale, y: lesson-style.figure-scale, reflow: true, reflection-theory()))

#paragraph[2. Ta xét các trường hợp sau]

#paragraph[- TH 1: Nếu $A$ và $B$ nằm cùng một phía so với $( P )$. Khi đó]

#formula(($| A M - B M |$, $≤ A B$,))

#paragraph[Đẳng thức xảy ra khi $M$ là giao điểm của $A B$ với $( P )$.]

#paragraph[- TH 2: Nếu $A$ và $B$ nằm khác phía so với $( P )$. Gọi $A '$ đối xứng với $A$ qua $lr(( P ))$, Khi đó]

#formula(($| A M - B M |$, $= abs(A ^(′) M - B M)$, $≤ A ^(′) B$,))

#paragraph[Đẳng thức xảy ra khi $M$ là giao điểm của $A ^(′) B$ với $( P )$.]

]

]

#exercise(
  6, [Trong không gian $O x y z$, cho hai điểm $A lr(( 2 ; 0 ; 1 ))$, $B lr(( - 2 ; 8 ; 3 ))$ và điểm $M lr(( a ; b ; c ))$ di động trên mặt phẳng $lr(( O x y ))$. Khi $M A + M B$ đạt giá trị nhỏ nhất thì giá trị $a + b + 3 c$ bằng],
  variant: variant,
  writing-lines: 10,
  source-id: "bai-hoc-6",
  answers: ([$2$.], [$3$.], [$5$.], [$4$.],),
  solution: [
#paragraph[Chọn B]
#figure-panel(scale(x: lesson-style.figure-scale, y: lesson-style.figure-scale, reflow: true, reflection-example()))
#paragraph[Dễ thấy hai điểm $A$, $B$ nằm về cùng một phía so với mặt phẳng $lr(( O x y ))$.]
#paragraph[Gọi $C$ là điểm đối xứng với $A$ qua $lr(( O x y ))$ suy ra $C lr(( 2 ; 0 ; - 1 ))$.]
#paragraph(keep-next: true)[Đường thẳng $B C$ đi qua $C lr(( 2 ; 0 ; - 1 ))$ và $arrow(u) = frac(1, 4) arrow(C B) = lr(( - 1 ; 2 ; 1 ))$ làm vectơ chỉ phương có phương trình là:]
#formula(($cases(display(x = 2 - t), display(y = 2 t), display(z = - 1 + t))$,))
#paragraph[Khi đó $M A + M B = M C + M B ≥ B C = 4 sqrt(6)$.]
#paragraph[Đẳng thức xảy ra khi và chỉ khi $M$, $B$, $C$ thẳng hàng.]
#paragraph(keep-next: true)[Suy ra $min lr(( M A + M B )) = 4 sqrt(6) ⇔ M = lr(( O x y )) ∩ B C$ nên tọa độ điểm $M lr(( x ; y ; z ))$ thỏa mãn hệ:]
#formula(($cases(display(x = 2 - t), display(y = 2 t), display(z = - 1 + t), display(z = 0))$, $⇔ cases(display(x = 1), display(y = 2), display(z = 0)) .$,))
#paragraph(keep-next: true)[Vậy]
#formula(($M lr(( 1 ; 2 ; 0 ))$, $⇒ a$, $= 1 "," b$, $= 2 "," c$, $= 0$, $⇒ a$, $+ b$, $+ 3 c$, $= 3 .$,))
]
)
]
