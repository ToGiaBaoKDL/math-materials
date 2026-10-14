#import "/templates/lesson.typ": exercise, paragraph, subheading, formula, lesson-section
#import "/templates/components.typ": figure-panel
#import "/templates/theme.typ": lesson-style
#import "../figures/reflection.typ": reflection-theory, reflection-example, reflection-practice
#import "../figures/balloons.typ": balloons

#let tu-luyen(variant) = [

#lesson-section([BÀI TẬP TỰ LUYỆN], badge: "A")

#exercise(
  1, [Trong không gian với hệ tọa độ $O x y z$, cho ba điểm $A lr(( - 1 ; 2 ; 5 ))$, $B lr(( 3 ; - 1 ; 0 ))$, $C lr(( - 4 ; 0 ; - 2 ))$. Gọi $I$ là điểm trên mặt phẳng $lr(( O x y ))$ sao cho biểu thức $abs(arrow(I A) - 2 arrow(I B) + 3 arrow(I C))$ đạt giá trị nhỏ nhất. Tìm tọa độ điểm I.],
  variant: variant,
  writing-lines: 8,
  source-id: "tu-luyen-1",
  solution: [
#paragraph[Gọi $M lr(( a ; b ; c ))$ là điểm thỏa mãn $arrow(M A) - 2 arrow(M B) + 3 arrow(M C) = arrow(0)$.]
#paragraph(keep-next: true)[Khi đó:]
#formula(($cases(display(- 1 - a - 2 lr(( 3 - a )) + 3 lr(( - 4 - a )) = 0), display(2 - b - 2 lr(( - 1 - b )) + 3 lr(( 0 - b )) = 0), display(5 - c - 2 lr(( 0 - c )) + 3 lr(( - 2 - c )) = 0))$, $⇔ cases(display(a = - frac(19, 2)), display(b = 2), display(c = - frac(1, 2)))$, $⇔ M lr(( - frac(19, 2) ; 2 ; - frac(1, 2) )) .$,))
#paragraph(keep-next: true)[Ta có:]
#formula(($abs(arrow(I A) - 2 arrow(I B) + 3 arrow(I C))$, $= abs(arrow(I M) + arrow(M A) - 2 arrow(I M) - 2 arrow(M B) + 3 arrow(I M) + 3 arrow(M C))$,))
#formula(($= abs(2 arrow(I M) + lr(( arrow(M A) - 2 arrow(M B) + 3 arrow(M C) )))$, $= 2 abs(arrow(I M))$, $= 2 I M .$,))
#paragraph[Biểu thức $abs(arrow(I A) - 2 arrow(I B) + 3 arrow(I C))$ đạt giá trị nhỏ nhất $⇔ I M$ nhỏ nhất $⇔ I$ là hình chiếu vuông góc của $M$ lên $lr(( O x y )) ⇔ I lr(( - frac(19, 2) ; 2 ; 0 ))$.]
]
)

#exercise(
  2, [Trong không gian $O x y z$, cho các điểm $A lr(( 1 ; 1 ; 2 ))$; $B lr(( 0 ; - 1 ; - 3 ))$. Xét điểm $M$ thay đổi trên mặt phẳng $lr(( O x z ))$, giá trị nhỏ nhất của $abs(arrow(O M) + 2 arrow(M A) + 3 arrow(M B))$ bằng?],
  variant: variant,
  writing-lines: 6,
  source-id: "tu-luyen-2",
  answers: ([$1$.], [$frac(3, 2)$.], [$frac(1, 2)$.], [$frac(1, 4)$.],),
  solution: [
#paragraph[Chọn A]
#paragraph[Chọn $I lr(( a ; b ; c ))$ thỏa $arrow(O I) + 2 arrow(I A) + 3 arrow(I B) = arrow(0)$ $⇒ I lr(( frac(1, 2) ; frac(- 1, 4) ; frac(- 5, 4) ))$.]
#paragraph[Ta có: $abs(arrow(O M) + 2 arrow(M A) + 3 arrow(M B))$ $= abs(arrow(O I) + 2 arrow(I A) + 3 arrow(I B) + 4 arrow(M I))$ $= 4 abs(arrow(M I))$.]
#paragraph[$⇒ abs(arrow(O M) + 2 arrow(M A) + 3 arrow(M B))$ nhỏ nhất $⇔ 4 abs(arrow(M I))$ nhỏ nhất $⇔ M I ⊥ lr(( O x z ))$. Lúc đó $4 abs(arrow(M I)) = 4 d lr(( I ; lr(( O x z )) )) = 4 . abs(y _(I)) = 1$.]
]
)

#exercise(
  3, [Trong không gian với hệ tọa độ $O x y z$, cho tam giác $A B C$ với $A ( 1 ; 0 ; 0 )$, $B ( 3 ; 2 ; 4 )$, $C ( 0 ; 5 ; 4 )$. Tìm tọa độ điểm $M$ thuộc mặt phẳng $( O x y )$ sao cho $abs(arrow(M A) + arrow(M B) + 2 arrow(M C))$ nhỏ nhất.],
  variant: variant,
  writing-lines: 6,
  source-id: "tu-luyen-3",
  answers: ([$M ( 1 ; 3 ; 0 )$.], [$M ( 1 ; - 3 ; 0 )$.], [$M ( 3 ; 1 ; 0 )$.], [$M ( 2 ; 6 ; 0 )$.],),
  solution: [
#paragraph[Chọn A.]
#paragraph[Gọi $I$ là điểm thỏa mãn $arrow(I A) + arrow(I B) + 2 arrow(I C) = arrow(0)$, từ đó ta tìm được $I lr(( 1 ; 3 ; 3 ))$.]
#paragraph[Khi đó $abs(arrow(M A) + arrow(M B) + 2 arrow(M C)) = abs(4 arrow(M I)) = 4 M I$.]
#paragraph[Do $M$ thuộc mặt phẳng $( O x y )$ nên để $abs(arrow(M A) + arrow(M B) + 2 arrow(M C))$ nhỏ nhất hay $M I$ nhỏ nhất thì $M$ là hình chiếu của $I lr(( 1 ; 3 ; 3 ))$ trên $lr(( O x y )) ⇔ M lr(( 1 ; 3 ; 0 ))$.]
]
)

#exercise(
  4, [Trong không gian $O x y z$, cho bốn điểm $A lr(( 2 ; - 3 ; 7 ))$, $B lr(( 0 ; 4 ; 1 ))$, $C lr(( 3 ; 0 ; 5 ))$ và $D lr(( 3 ; 3 ; 3 ))$. Gọi $M$ là điểm nằm trên mặt phẳng $lr(( O y z ))$ sao cho biểu thức $abs(arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D))$ đạt giá trị nhỏ nhất. Khi đó xác định tọa độ điểm $M$.],
  variant: variant,
  writing-lines: 8,
  source-id: "tu-luyen-4",
  solution: [
#paragraph(keep-next: true)[Ta có]
#formula(($arrow(A B)$, $= lr(( - 2 ; 7 ; - 6 )) "," arrow(A C)$, $= lr(( 1 ; 3 ; - 2 )) "," arrow(A D)$, $= lr(( 1 ; 6 ; - 4 ))$,))
#paragraph[nên $lr([ arrow(A B) "," arrow(A C) ]) . arrow(A D) = - 4 ≠ 0$.]
#paragraph[Suy ra $arrow(A B) "," arrow(A C) "," arrow(A D)$ không đồng phẳng.]
#paragraph[Gọi $G$ là trọng tâm tứ diện $A B C "D"$. Khi đó $G lr(( 2 ; 1 ; 4 ))$]
#paragraph[Ta có $abs(arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D)) = abs(4 arrow(M G)) = 4 M G$.]
#paragraph[Do đó $abs(arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D))$ nhỏ nhất khi và chỉ khi $M G$ ngắn nhất.]
#paragraph[Vậy $M$ là hình chiếu vuông góc của $G$ lên mặt phẳng $lr(( O y z ))$ nên $M lr(( 0 ; 1 ; 4 ))$.]
]
)

#exercise(
  5, [Trong hệ tọa độ $O x y z$, cho bốn điểm $A ( 0 ; 1 ; 0 )$, $B ( 1 ; 0 ; 0 )$, $C ( 0 ; 0 ; 1 )$, $D ( 1 ; 1 ; 1 )$. Tìm tọa độ điểm $M$ trên mặt phẳng $lr(( O x y ))$ sao cho $abs(arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D))$ nhỏ nhất.],
  variant: variant,
  writing-lines: 8,
  source-id: "tu-luyen-5",
  answers: ([$lr(( 0 ; 0 ; frac(1, 2) ))$.], [$lr(( frac(1, 2) ; frac(1, 2) ; 0 ))$.], [$lr(( frac(2, 3) ; frac(2, 3) ; 0 ))$.], [$lr(( 0 ; frac(1, 2) ; frac(1, 2) ))$.],),
  solution: [
#paragraph[Chọn B.]
#paragraph[Ta  tính tích hỗn tạp nhận thấy $lr([ arrow(A B) "," arrow(A C) ]) . arrow(A D) ≠ 0$. Suy ra $arrow(A B) "," arrow(A C) "," arrow(A D)$ không đồng phẳng.]
#paragraph[Gọi $G$ là trọng tâm của tứ diện $A B C D$ nên $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$ và $G lr(( frac(1, 2) ; frac(1, 2) ; frac(1, 2) ))$.]
#paragraph(keep-next: true)[Ta thấy]
#formula(($abs(arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D))$, $= 4 abs(arrow(M G) + lr(( arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) )))$, $= 4 M G$,))
#paragraph[Do đó:]
#paragraph[$abs(arrow(M A) + arrow(M B) + arrow(M C) + arrow(M D))$ nhỏ nhất khi và chỉ khi $M$ là hình chiếu vuông góc của $G$ trên mặt phẳng $lr(( O x y ))$. Vậy $M lr(( frac(1, 2) ; frac(1, 2) ; 0 ))$.]
]
)

#exercise(
  6, [Trong không gian với hệ trục tọa độ $O x y z$, cho hai điểm $A lr(( 1 ; 2 ; 1 ))$; $B lr(( 2 ; - 1 ; 3 ))$. Tìm điểm $M$ trên mặt phẳng $lr(( O x y ))$ sao cho $P = M A ^(2) - 2 M B ^(2)$ đạt giá trị lớn nhất?],
  variant: variant,
  writing-lines: 8,
  source-id: "tu-luyen-6",
  answers: ([$M lr(( frac(3, 2) ; frac(1, 2) ; 0 ))$], [$M lr(( frac(1, 2) ; - frac(3, 2) ; 0 ))$], [$M lr(( 3 ; - 4 ; 0 ))$], [$M lr(( 2 ; 3 ; 0 ))$],),
  solution: [
#paragraph(keep-next: true)[Ta có:]
#formula(($P$, $= M A ^(2) - 2 M B ^(2)$, $= lr(( arrow(M A) )) ^(2) - 2 lr(( arrow(M B) )) ^(2)$, $= lr(( arrow(M I) + arrow(I A) )) ^(2) - 2 lr(( arrow(M I) + arrow(I B) )) ^(2)$,))
#formula(($= - M I ^(2)$, $+ lr(( I A ^(2) - 2 I B ^(2) ))$, $+ 2 arrow(M I) lr(( arrow(I A) - 2 arrow(I B) ))$,))
#paragraph[Tìm điểm $I$ sao cho $arrow(I A) - 2 arrow(I B) = arrow(0)$ $⇒ I lr(( 3 ; - 4 ; 5 ))$]
#formula(($⇒ P$, $= - M I ^(2)$, $+ underbrace(lr(( I A ^(2) - 2 I B ^(2) )), "const")$,))
#paragraph[$⇒ P _(max) ⇔ M I _(min) ⇔ M$ là hình chiếu vuông góc của $I$ trên $lr(( O x y )) ⇒ M lr(( 3 ; - 4 ; 0 ))$.]
#paragraph[Chọn C.]
]
)

#exercise(
  7, [Trong không gian $O x y z$, cho $arrow(O A) = arrow(i) + arrow(j) - 3 arrow(k)$, $B lr(( 2 ; 2 ; 1 ))$. Tìm tọa độ điểm $M$ thuộc trục tung sao cho $M A ^(2) + M B ^(2)$ nhỏ nhất.],
  variant: variant,
  writing-lines: 11,
  source-id: "tu-luyen-7",
  solution: [
#paragraph[Cách 1.]
#paragraph[Do $M ∈ O y$, nên $M lr(( 0 ; y ; 0 ))$.]
#paragraph[Tính $M A ^(2) + M B ^(2) = 2 y ^(2) - 6 y + 20 = f lr(( y ))$.]
#paragraph[Do đó $f lr(( y ))$ nhỏ nhất khi và chỉ khi $y = frac(3, 2)$. Vậy $M lr(( 0 ; frac(3, 2) ; 0 ))$.]
#paragraph[Cách 2.]
#paragraph[Ta có $A lr(( 1 ; 1 ; - 3 ))$. Gọi $I$ là trung điểm của $A B$. Suy ra $I lr(( frac(3, 2) ; frac(3, 2) ; - 1 ))$.]
#paragraph(keep-next: true)[Khi đó]
#formula(($M A ^(2)$, $+ M B ^(2)$, $= arrow(M A) ^(2)$, $+ arrow(M B) ^(2)$, $= lr(( arrow(M I) + arrow(I A) )) ^(2)$, $+ lr(( arrow(M I) + arrow(I B) )) ^(2)$,))
#formula(($= 2 arrow(M I) ^(2)$, $+ arrow(I A) ^(2)$, $+ arrow(I B) ^(2)$, $+ 2 arrow(M I) . lr(( arrow(I A) + arrow(I B) ))$, $= 2 M I ^(2)$, $+ I A ^(2)$, $+ I B ^(2)$, $= 2 M I ^(2)$, $+ 9 .$,))
#paragraph[Do đó $M A ^(2) + M B ^(2)$ đạt giá trị nhỏ nhất]
#paragraph[$⇔$ khi $M I$ có độ dài ngắn nhất]
#paragraph[$⇔ M$ là hình chiếu vuông góc của $I$ trên trục tung.]
#paragraph[Vậy $M lr(( 0 ; frac(3, 2) ; 0 ))$.]
]
)

#exercise(
  8, [Trong không gian $O x y z$, cho hai điểm $A lr(( - 2 ; 0 ; - 3 ))$, $B lr(( - 4 ; 1 ; - 1 ))$. Biết  $M lr(( a ; b ; c ))$ thuộc mặt phẳng $lr(( O y z ))$ sao cho $M A + M B$ đạt giá trị nhỏ nhất. Khi đó $a + b + c$ bằng bao nhiêu?],
  variant: variant,
  writing-lines: 10,
  source-id: "tu-luyen-8",
  solution: [
#paragraph[Đáp số: $- 2$.]
#figure-panel(scale(x: lesson-style.figure-scale, y: lesson-style.figure-scale, reflow: true, reflection-practice()))
#paragraph[Vì $M ∈ lr(( O y z )) ⇒ a = 0 ⇒ M lr(( 0 ; b ; c ))$]
#paragraph[Ta có: $A$, $B$ nằm cùng phía đối với $lr(( O y z ))$.]
#paragraph[Gọi $A'$ là điểm đối xứng với $A$ qua $lr(( O y z )) ⇒ A' lr(( 2 ; 0 ; - 3 ))$]
#paragraph[Khi đó: $M A + M B = M A' + M B ≥ A' B$]
#paragraph[Do đó: $M A + M B$ đạt GTNN khi $A'$, $M$, $B$ thẳng hàng.]
#formula(($arrow(A' B)$, $= lr(( - 6 ; 1 ; 2 )) "," arrow(A' M)$, $= lr(( - 2 ; b ; c + 3 ))$,))
#paragraph(keep-next: true)[$A'$, $B$, $M$ thẳng hàng $⇔ arrow(A' B) "," arrow(A' M)$ cùng phương]
#formula(($⇔ frac(- 2, - 6)$, $= frac(b, 1)$, $= frac(c + 3, 2)$, $⇒ cases(display(b = frac(1, 3)), display(c = - frac(7, 3)))$,))
#paragraph[Vậy $M lr(( 0 ; frac(1, 3) ; - frac(7, 3) )) ⇒ a + b + c = - 2$.]
]
)

#exercise(
  9, [không gian $O x y z$, cho hai điểm $A lr(( 3 ; - 2 ; 3 ))$; $B lr(( 1 ; 0 ; 5 ))$. Tìm tọa độ điểm $M ∈ lr(( O x y ))$ sao cho $M A + M B$ đạt giá trị nhỏ nhất:],
  variant: variant,
  writing-lines: 10,
  source-id: "tu-luyen-9",
  answers: ([$lr(( frac(9, 4) ; - frac(5, 4) ; 0 ))$.], [$lr(( frac(9, 4) ; frac(5, 4) ; 0 ))$.], [$lr(( - frac(9, 4) ; - frac(5, 4) ; 0 ))$.], [$lr(( - frac(9, 4) ; frac(5, 4) ; 0 ))$.],),
  solution: [
#paragraph[Chọn A]
#paragraph[Dễ thấy $A lr(( 3 ; - 2 ; 3 ))$ và $B lr(( 1 ; 0 ; 5 ))$ nằm cùng phía so với mặt phẳng $lr(( O x y ))$]
#paragraph[Gọi $A'$ đối xứng với $A$ qua mặt phẳng $lr(( O x y )) ⇒ A' lr(( 3 ; - 2 ; - 3 ))$]
#paragraph[$⇒ arrow(A' B) = lr(( - 2 ; 2 ; 8 )) ⇒ arrow(u) = lr(( 1 ; - 1 ; - 4 ))$ là một vectơ chỉ phương của đường thẳng $A' B$]
#paragraph(keep-next: true)[$⇒$ Phương trình đường thẳng $A' B$ là]
#formula(($cases(display(x = 1 + t), display(y = - t), display(z = 5 - 4 t))$,))
#paragraph[Ta có: $M A + M B = M A' + M B ≥ A' B = 6 sqrt(2)$]
#paragraph[Dấu $" = "$ xảy ra $⇔ M = A' B ∩ lr(( O x y )) ⇔$ Tọa độ điểm $M$ thỏa mãn hệ]
#formula(($cases(display(x = 1 + t), display(y = - t), display(z = 5 - 4 t), display(z = 0))$, $⇔$, $cases(display(t = frac(5, 4)), display(x = frac(9, 4)), display(y = - frac(5, 4)), display(z = 0))$,))
#paragraph[Vậy $M lr(( frac(9, 4) ; - frac(5, 4) ; 0 ))$ thỏa mãn yêu cầu bài toán]
]
)

#exercise(
  10, [Hai chiếc khinh khí cầu bay lên từ cùng một địa điểm trong không gian. Sau một khoảng thời gian, chiếc thứ nhất nằm cách điểm xuất phát 3 km về phía Đông và 2 km về phía Nam, đồng thời cách mặt đất $"0,5" "km"$; chiếc thứ hai nằm cách điểm xuất phát 1 km về phía Bắc và 1 km về phía Tây, đồng thời cách mặt đất $"0,3" "km"$. Cùng thời điểm đó, một người đứng trên mặt đất và nhìn thấy hai khinh khí cầu nói trên. Biết rằng, so với các vị trí quan sát khác trên mặt đất, vị trí người đó đứng có tổng khoảng cách đến hai khinh khí cầu là nhỏ nhất. Hỏi tổng khoảng cách nhỏ nhất ấy bằng bao nhiêu kilômét (làm tròn kết quả đến hàng phần mười)?],
  variant: variant,
  writing-lines: 11,
  source-id: "tu-luyen-10",
  solution: [
#paragraph[Đáp số: 5,1.]
#figure-panel(scale(x: lesson-style.figure-scale, y: lesson-style.figure-scale, reflow: true, balloons()))
#paragraph[Chọn hệ trục toạ độ $O x y z$ với gốc $O$ đặt tại điểm xuất phát của hai khinh khí cầu, mặt phẳng $lr(( O x y ))$ trùng với mặt đất với trục $O x$ hướng về phía Nam, trục $O y$ hướng về phía Đông và trục $O z$ hướng thẳng lên trời (đơn vị đo lấy theo kilômét).]
#paragraph[Khi đó $O lr(( 0 ; 0 ; 0 )) "," A lr(( 2 ; 3 ; "0,5" )) "," B lr(( - 1 ; - 1 ; "0,3" ))$ lần lượt là vị trí xuất phát và vị trí của hai khinh khí cầu đối với hệ toạ độ đã chọn tại thời điểm được quan sát.]
#paragraph[Gọi $M$ là vị trí đứng của người quan sát.]
#paragraph[Gọi $B' lr(( - 1 ; - 1 ; - "0,3" ))$ là điểm đối xứng với $B$ qua mặt phẳng $lr(( O x y ))$.]
#paragraph[Ta có $M A + M B = M A + M B'$.]
#paragraph[Suy ra $M A + M B$ nhỏ nhất khi $M A + M B'$ nhỏ nhất, nghĩa là khi và chỉ khi $A$, $B'$, $M$ thẳng hàng.]
#paragraph(keep-next: true)[Gọi $M lr(( x _(M) ; y _(M) ; 0 ))$, suy ra]
#formula(($arrow(M A)$, $= lr(( 2 - x _(M) ; 3 - y _(M) ; "0,5" )) "," arrow(M B')$, $= lr(( - 1 - x _(M) ; - 1 - y _(M) ; - "0,3" )) .$,))
#paragraph[$A$, $B'$, $M$ thẳng hàng nên $arrow(M A)$ và $arrow(M B')$ cùng phương]
#formula(($⇒ frac(- 1 - x _(M), 2 - x _(M))$, $= frac(- 1 - y _(M), 3 - y _(M))$, $= frac(- "0,3", "0,5")$, $⇒ cases(display(x _(M) = frac(1, 8)), display(y _(M) = frac(1, 2))) ⇒ M lr(( frac(1, 8) ; frac(1, 2) ; 0 )) .$,))
#paragraph(keep-next: true)[Khi đó]
#formula(($"min" lr(( M A + M B ))$, $= "min" lr(( M A + M B' ))$, $= A B' ≈ "5,1" "km" .$,))
]
)

#lesson-section([CÂU HỎI ĐÚNG – SAI], badge: "B")

#exercise(
  11, [Trong không gian với hệ tọa độ $O x y z$, cho $Δ A B C$ với $A lr(( 1 ; - 3 ; 3 ))$, $B lr(( 2 ; - 4 ; 5 ))$, $C lr(( 3 ; - 2 ; 1 ))$],
  variant: variant,
  writing-lines: 14,
  source-id: "tu-luyen-11",
  statements: ([a) $arrow(A B) = lr(( - 1 ; 1 ; - 2 ))$.], [b) Điểm $G lr(( a ; b ; c ))$ là trọng tâm của tam giác $Δ A B C$ thì $a + b + c = 2$.], [c) Điểm $I lr(( x ; y ; z ))$ thỏa mãn $2 arrow(I A) + arrow(I B) + 3 arrow(I C) = 0$, khi đó $2 x + y + z = 4$.], [d) Gọi điểm $M lr(( x ; y ; z ))$ trên mặt phẳng tọa độ $(O y z)$ sao cho biểu thức $P = - 2 M A ^(2) - M B ^(2) - 3 M C ^(2)$ đạt giá trị lớn nhất. Khi đó $x + y - z < - 5$.],),
  solution: [
#paragraph[a) $arrow(A B) = lr(( 1 ; - 1 ; 2 ))$. Vậy a) Sai.]
#paragraph[b) Điểm $G lr(( 2 ; - 3 ; 3 )) ⇒ a + b + c = 2$. Vậy b) Đúng.]
#paragraph[c) Điểm $I lr(( x ; y ; z ))$ thỏa mãn $2 arrow(I A) + arrow(I B) + 3 arrow(I C) = 0$]
#formula(($arrow(I A) lr(( 1 - x ; - 3 - y ; 3 - z )) ; arrow(I B) lr(( 2 - x ; - 4 - y ; 5 - z )) ; arrow(I C) lr(( 3 - x ; - 2 - y ; 1 - z ))$,))
#formula(($2 arrow(I A)$, $+ arrow(I B)$, $+ 3 arrow(I C)$, $= 0$, $⇔ cases(display(13 - 6 x = 0), display(- 16 - 6 y = 0), display(14 - 6 z = 0))$, $⇔ cases(display(x = frac(13, 6)), display(y = frac(- 8, 3)), display(z = frac(7, 3)))$, $⇒ 2 x$, $+ y$, $+ z$, $= 4 .$,))
#paragraph[Vậy c) Đúng.]
#paragraph[d) Gọi Điểm $I$ thỏa mãn $2 arrow(I A) + arrow(I B) + 3 arrow(I C) = 0$, theo $lr(( c ))$ ta có $I lr(( frac(13, 6) ; frac(- 8, 3) ; frac(7, 3) ))$]
#formula(($2 M A ^(2) + M B ^(2) + 3 M C ^(2) = 2 arrow(M A) ^(2) + arrow(M B) ^(2) + 3 arrow(M C) ^(2)$, $= 2 lr(( arrow(M I) + arrow(I A) )) ^(2) + lr(( arrow(M I) + arrow(I B) )) ^(2) + 3 lr(( arrow(M I) + arrow(I C) )) ^(2)$, $= 6 M I ^(2) + 2 I A ^(2) + I B ^(2) + 3 I C ^(2) ⇒ P = - 6 M I ^(2) - 2 I A ^(2) - I B ^(2) - 3 I C ^(2)$,))
#paragraph[Do tổng $2 I A ^(2) + I B ^(2) + 3 I C ^(2)$ không đổi nên $P$ đạt giá trị lớn nhất khi và chỉ khi $M I ^(2)$ nhỏ nhất hay $I M$ nhỏ nhất.]
#paragraph[Mà $M$ nằm trên mặt phẳng $lr(( O y z ))$ nên $I M$ nhỏ nhất khi và chỉ khi $M$ là hình chiếu vuông góc của $I$ lên mặt phẳng $lr(( O y z ))$. Suy ra: $M lr(( 0 ; frac(- 8, 3) ; frac(7, 3) )) ⇒ x + y - z = - 5$. Vậy d) Sai.]
]
)

#exercise(
  12, [Trong không với hệ toạ độ $O x y z$ cho tam giác $A B C$ có các đỉnh $A lr(( 1 ; - 2 ; 0 ))$, $B lr(( 2 ; 1 ; - 2 ))$, $C lr(( 0 ; 3 ; 4 ))$.],
  variant: variant,
  writing-lines: 14,
  source-id: "tu-luyen-12",
  statements: ([a) Toạ độ của véc-tơ $arrow(A B)$ là $lr(( 1 ; 3 ; - 2 ))$.], [b) Toạ độ hình chiếu của điểm $B$ trên mặt phẳng $O x y$ là $H lr(( 0 ; 0 ; - 2 ))$], [c) Gọi điểm $E lr(( a ; b ; c ))$ là hình chiếu của $C$ lên $A B$, khi đó $7 a + 3 b + c = 8$.], [d) Toạ độ điểm $M$ thuộc mặt phẳng $x O z$ sao cho $T = M C + M B$ nhỏ nhất là $M lr(( frac(3, 2) ; 0 ; - frac(1, 2) ))$],),
  solution: [
#paragraph[a) Toạ độ của véc-tơ $arrow(A B)$ là $lr(( 1 ; 3 ; - 2 ))$.]
#paragraph[Chọn a) ĐÚNG]
#paragraph[b) Toạ độ hình chiếu của điểm $B$ trên mặt phẳng $O x y$ là $H lr(( 2 ; 1 ; 0 ))$.]
#paragraph[Chọn b) SAI]
#paragraph[c) Gọi điểm $E lr(( a ; b ; c ))$ là hình chiếu của $C$ lên $A B$,]
#paragraph(keep-next: true)[Ta có]
#formula(($arrow(C E)$, $= lr(( a ; b - 3 ; c - 4 )) "," arrow(A E)$, $= lr(( a - 1 ; b + 2 ; c )) "," arrow(A B)$, $= lr(( 1 ; 3 ; - 2 )) .$,))
#paragraph(keep-next: true)[Vì $C E ⊥ A B$ và vectơ $arrow(A E) "," arrow(A B)$ cùng phương nên]
#formula(($cases(display(a + 3 lr(( b - 3 )) - 2 lr(( c - 4 )) = 0), display(frac(a - 1, 1) = frac(b + 2, 3) = frac(c, - 2)))$,))
#formula(($⇒ cases(display(a + 3 b - 2 c = 1), display(3 a - b = 5), display(- 2 a - c = - 2))$, $⇒ cases(display(a = frac(10, 7)), display(b = frac(- 5, 7)), display(c = - frac(6, 7)))$, $⇒ 7 a$, $+ 3 b$, $+ c$, $= 7 .$,))
#paragraph[Chọn c) SAI]
#paragraph[d) Điểm $M$ thuộc mặt phẳng $x O z$ suy ra $M lr(( a ; 0 ; c ))$.]
#paragraph[Hai điểm $B$, $C$ cùng phía với mặt phẳng $x O z$, ta gọi $B '$ là điểm đối xứng của $B$ qua mặt phẳng $x O z$, khi đó $B' lr(( 2 ; - 1 ; - 2 ))$, suy ra $M B = M B'$]
#paragraph[Ta có $M B + M C = M B' + M C ≥ B' C$.]
#paragraph[Dấu bằng xảy ra khi $B'$, $M$, $C$ thẳng hàng.]
#paragraph[$arrow(C M) = lr(( a ; - 3 ; c - 4 ))$; $arrow(C B') = lr(( 2 ; - 4 ; - 6 ))$.]
#paragraph(keep-next: true)[$A$, $M$, $B'$ thẳng hàng]
#formula(($⇔ frac(a, 2)$, $= frac(- 3, - 4)$, $= frac(c - 4, - 6)$, $⇔ cases(display(a = frac(3, 2)), display(c = - 4))$, $⇒ M lr(( 3 ; 0 ; - frac(1, 2) )) .$,))
#paragraph[Chọn d) Đúng.]
]
)

#exercise(
  13, [Trong không gian $O x y z$, cho hai điểm $M lr(( 3 ; - 2 ; - 1 ))$, $N lr(( 4 ; 3 ; 1 ))$.],
  variant: variant,
  writing-lines: 14,
  source-id: "tu-luyen-13",
  statements: ([a) Hình chiếu của điểm $M$ trên trục $O y$ có tọa độ là $lr(( 0 ; - 2 ; 0 ))$.], [b) Gọi $E$ là điểm đối xứng của điểm $M$ qua $N$. Tọa độ của điểm $E$ là $lr(( 5 ; 8 ; 3 ))$.], [c) Cho $P lr(( 1 ; m ; n ))$. Tam giác $M N P$ vuông tại $N$ khi và chỉ khi $2 m + 5 n = 20$.], [d) Điểm $I lr(( a ; b ; c ))$ nằm trên mặt phẳng $lr(( O x y ))$ thỏa mãn $T = abs(2 arrow(I M) - arrow(I N))$ đạt giá trị nhỏ nhất. Khi đó $3 a - 2 b + c = 20$.],),
  solution: [
#paragraph[a) Đúng. Vì hình chiếu của điểm $M$ trên trục $O y$ có tọa độ là $lr(( 0 ; - 2 ; 0 ))$.]
#paragraph[b) Đúng. Gọi $E lr(( a ; b ; c ))$ là điểm đối xứng của điểm $M$ qua $N$.]
#paragraph[Khi đó $N$ là trung điểm của $M E$.]
#paragraph(keep-next: true)[Ta có]
#formula(($cases(display(frac(a + 3, 2) = 4), display(frac(b - 2, 2) = 3), display(frac(c - 1, 2) = 1))$, $⇒ cases(display(a = 5), display(b = 8), display(c = 3)) .$,))
#paragraph[Suy ra tọa độ của điểm $E$ là $lr(( 5 ; 8 ; 3 ))$.]
#paragraph[c) Sai. Cho $P lr(( 1 ; m ; n ))$. Ta có $arrow(N P) = lr(( - 3 ; m - 3 ; n - 1 ))$; $arrow(M N) = lr(( 1 ; 5 ; 2 ))$.]
#paragraph(keep-next: true)[Do $Δ M N P$ vuông tại $N$ nên]
#formula(($arrow(M N) . arrow(N P)$, $= 0$, $⇒ - 3$, $+ 5 lr(( m - 3 ))$, $+ 2 lr(( n - 1 ))$, $= 0$, $⇒ 5 m$, $+ 2 n$, $= 20 .$,))
#paragraph[d) Đúng. Điểm $I lr(( a ; b ; c ))$ nằm trên mặt phẳng $lr(( O x y ))$ nên $c = 0$.]
#paragraph(keep-next: true)[Ta có]
#formula(($arrow(I M)$, $= lr(( 3 - a ; - 2 - b ; - 1 ))$, $⇒ 2 arrow(I M)$, $= lr(( 6 - 2 a ; - 4 - 2 b ; - 2 )) ;$,))
#paragraph[$arrow(I N) = lr(( 4 - a ; 3 - b ; 1 ))$.]
#paragraph[Suy ra $2 arrow(I M) - arrow(I N) = lr(( 2 - a ; - 7 - b ; - 3 ))$.]
#paragraph[Khi đó $T = abs(2 arrow(I M) - arrow(I N)) = sqrt(lr(( 2 - a )) ^(2) + lr(( 7 + b )) ^(2) + 9) ≥ 3$.]
#paragraph(keep-next: true)[Dấu “=” xảy ra khi và chỉ khi]
#formula(($cases(display(a = 2), display(b = - 7)) .$,))
#paragraph[Khi đó $3 a - 2 b + c = 3 . 2 - 2 . lr(( - 7 )) = 20$.]
]
)

#exercise(
  14, [Trong không gian $O x y z$ cho ba điểm $A lr(( 2 ; - 1 ; 1 ))$, $B lr(( - 1 ; 3 ; - 1 ))$, $C lr(( 5 ; - 3 ; 4 ))$],
  variant: variant,
  writing-lines: 14,
  source-id: "tu-luyen-14",
  statements: ([a) Tích vô hướng của hai vectơ $arrow(A B) . arrow(A C) = - 23$], [b) Góc $hat(B A C)$ là góc nhọn], [c) Côsin của góc giữa hai vectơ $arrow(A B)$ và $arrow(A C)$ bằng $frac(- 23, sqrt(638))$], [d) Lấy điểm $M ∈ lr(( O x y ))$ sao cho $M A ^(2) + M B ^(2) + M C ^(2)$ đạt giá trị nhỏ nhất, khi đó tọa độ điểm $M ∈ ( 2 ; - frac(1, 3) ; 0 )$],),
  solution: [
#paragraph[a) Tích vô hướng của hai vectơ $arrow(A B) . arrow(A C) = - 23$]
#formula(($arrow(A B) lr(( - 3 ; 4 ; - 2 ))$,))
#formula(($arrow(A C) lr(( 3 ; - 2 ; 3 ))$,))
#formula(($arrow(A B) . arrow(A C)$, $= - 3 . 3$, $+ 4 . ( - 2 )$, $+ 3 . ( - 2 )$, $= - 23$,))
#paragraph[Mệnh đề a) đúng]
#paragraph[b) Góc $hat(B A C)$ là góc nhọn]
#paragraph[Ta có $arrow(A B) . arrow(A C) = - 23 < 0$. Suy ra góc $hat(B A C)$ là góc tù]
#paragraph[Mệnh đề b) sai]
#paragraph[c) Côsin của góc giữa hai vectơ $arrow(A B)$ và $arrow(A C)$ bằng $frac(- 23, sqrt(638))$]
#formula(($"Cos" lr(( arrow(A B) ; arrow(A C) )) = frac(arrow(A B) . arrow(A C), abs(arrow(A B)) . abs(arrow(A C)))$, $"Cos" lr(( arrow(A B) ; arrow(A C) )) = frac(- 23, sqrt(lr(( - 3 )) ^(2) + lr(( 4 )) ^(2) + lr(( - 2 )) ^(2)) . sqrt(lr(( 3 )) ^(2) + lr(( - 2 )) ^(2) + lr(( 3 )) ^(2))) = frac(- 23, sqrt(638))$,))
#paragraph[Mệnh đề c) đúng]
#paragraph[d) Lấy điểm $M ∈ lr(( O x y ))$ sao cho $M A ^(2) + M B ^(2) + M C ^(2)$ đạt giá trị nhỏ nhất, khi đó tọa độ điểm $M ∈ ( 2 ; - frac(1, 3) ; 0 )$]
#paragraph[Gọi $G$ là trọng tâm của $Δ A B C$, Tọa độ $G lr(( 2 ; - frac(1, 3) ; frac(4, 3) ))$]
#paragraph[Suy ra $arrow(G A) + arrow(G B) + arrow(G C) = arrow(0)$]
#paragraph(keep-next: true)[Ta có]
#formula(($arrow(M A) ^(2)$, $+ arrow(M B) ^(2)$, $+ arrow(M C) ^(2)$, $= 3 . arrow(G M) ^(2)$, $+ arrow(G A) ^(2)$, $+ arrow(G B) ^(2)$, $+ arrow(G C) ^(2)$,))
#paragraph[Vì $arrow(G A) ^(2) + arrow(G B) ^(2) + arrow(G C) ^(2)$ không đổi]
#paragraph[Nên $M A ^(2) + M B ^(2) + M C ^(2)$ đạt GTNN khi $M G$ đạt GTNN]
#paragraph[Với điểm $G lr(( 2 ; - frac(1, 3) ; frac(4, 3) ))$ cố định và điểm $M$ bất kì $M ∈ lr(( O x y ))$.]
#paragraph[Để $M G$ đạt GTNN thì $M$ là hình chiếu của $G lr(( 2 ; - frac(1, 3) ; frac(4, 3) ))$ trên $lr(( O x y ))$]
#paragraph[Suy ra tọa độ $M ∈ ( 2 ; - frac(1, 3) ; 0 )$]
#paragraph[Mệnh đề d) đúng]
]
)

#exercise(
  15, [Trong không gian với hệ tọa độ $O x y z$, cho $Δ A B C$ với $A lr(( 1 ; - 3 ; 3 ))$, $B lr(( 2 ; - 4 ; 5 ))$, $C lr(( 3 ; - 2 ; 1 ))$.],
  variant: variant,
  writing-lines: 14,
  source-id: "tu-luyen-15",
  statements: ([a) Gọi $M lr(( x ; y ; z ))$ là điểm trên mặt phẳng tọa độ $lr(( O y z ))$ sao cho biểu thức $P = - 2 M A ^(2) - M B ^(2) - 3 M C ^(2)$ đạt giá trị lớn nhất. Khi đó $x + y - z < - 5$.], [b) Điểm $I lr(( x ; y ; z ))$ thỏa mãn $2 arrow(I A) + arrow(I B) + 3 arrow(I C) = 0$, khi đó $2 x + y + z = 4$.], [c) Điểm $G lr(( a ; b ; c ))$ là trọng tâm của tam giác $Δ A B C$ thì $a + b + c = 2$.], [d) $arrow(A B) = lr(( - 1 ; 1 ; - 2 ))$.],),
  solution: [
#paragraph[a) Sai.]
#paragraph[Gọi điểm $I$ thỏa mãn $2 arrow(I A) + arrow(I B) + 3 arrow(I C) = 0$.]
#paragraph[$2 arrow(I A) + arrow(I B) + 3 arrow(I C) = lr(( 13 - 6 x _(I) ; - 16 - 6 y _(I) ; 14 - 6 z _(I) ))$.]
#paragraph[$arrow(0) = lr(( 0 ; 0 ; 0 ))$.]
#paragraph(keep-next: true)[Ta có $2 arrow(I A) + arrow(I B) + 3 arrow(I C) = 0$]
#formula(($⇒ cases(display(13 - 6 x _(I) = 0), display(- 16 - 6 y _(I) = 0), display(14 - 6 z _(I) = 0))$, $⇒ cases(display(x _(I) = frac(13, 6)), display(y _(I) = - frac(8, 3)), display(z _(I) = frac(7, 3))) .$,))
#paragraph[Suy ra $I lr(( frac(13, 6) ; - frac(8, 3) ; frac(7, 3) ))$.]
#formula(($P$, $= - 2 M A ^(2) - M B ^(2) - 3 M C ^(2)$, $= - lr(( 2 M A ^(2) + M B ^(2) + 3 M C ^(2) ))$,))
#formula(($= - lr([ 2 lr(( arrow(M I) + arrow(I A) )) ^(2) + lr(( arrow(M I) + arrow(I B) )) ^(2) + 3 lr(( arrow(M I) + arrow(I C) )) ^(2) ])$,))
#formula(($= - lr([ 6 M I ^(2) + 2 arrow(M I) lr(( 2 arrow(I A) + arrow(I B) + 3 arrow(I C) )) + 2 I A ^(2) + I B ^(2) + 3 I C ^(2) ])$,))
#formula(($= - lr([ 6 M I ^(2) + 2 I A ^(2) + I B ^(2) + 3 I C ^(2) ])$,))
#paragraph[Để $P$ đạt giá trị lớn nhất thì $- 6 M I ^(2)$ đạt giá trị lớn nhất.]
#paragraph[Suy ra $M I$ đạt giá trị nhỏ nhất.]
#paragraph[Do đó $M$ là hình chiếu của $I$ lên mặt phẳng $lr(( O y z )) ⇒ M lr(( 0 ; - frac(8, 3) ; frac(7, 3) ))$]
#paragraph[Vậy $x + y - z = 0 - frac(8, 3) - frac(7, 3) = - 5 = - 5$.]
#paragraph[b) Đúng.]
#paragraph[Dựa vào câu a ta có $I lr(( frac(13, 6) ; - frac(8, 3) ; frac(7, 3) ))$.]
#paragraph[$2 x + y + z = 4 = 2 ⋅ frac(13, 6) - frac(8, 3) + frac(7, 3) = 4$.]
#paragraph[c) Đúng.]
#paragraph[Điểm $G lr(( a ; b ; c ))$ là trọng tâm của tam giác $Δ A B C$]
#paragraph(keep-next: true)[Suy ra]
#formula(($cases(display(x _(G) = frac(x _(A) + x _(B) + x _(C), 3)), display(y _(G) = frac(y _(A) + y _(B) + y _(C), 3)), display(z _(G) = frac(z _(A) + z _(B) + z _(C), 3)))$, $⇔ cases(display(x _(G) = 2), display(y _(G) = - 3), display(z _(G) = 3))$, $⇒ G lr(( 2 ; - 3 ; 3 )) .$,))
#paragraph[Vậy $a + b + c = 2 - 3 + 3 = 2$.]
#paragraph[d) Sai.]
#formula(($arrow(A B)$, $= lr(( 2 - 1 ; - 4 + 3 ; 5 - 3 ))$, $= lr(( 1 ; - 1 ; 2 ))$,))
]
)
]
