#import "/templates/lesson.typ": formula, paragraph as lesson-paragraph
#import "/templates/components.typ": figure-panel as base-figure-panel
#import "../figures.typ": (
  apollonius-line, contact-circle, diameter, great-circle, inscribed-tetrahedron, max-distance, orthogonal-tangents,
  orthogonal-tetrahedron, sphere-chord, tangent-spheres,
)
#let paragraph(body, keep-next: false) = lesson-paragraph(gap: 5.5mm, keep-next: keep-next)[
  #set par(justify: false, leading: 1em)
  #body
]
#let figure-panel(body, above: 5mm, below: 6mm) = base-figure-panel(
  above: above,
  below: below,
  scale(x: 110.25%, y: 110.25%, reflow: true, body),
)

#let solutions = (
  "bai-hoc-1": [
    #paragraph[*Chọn B.*]
  ],
  "bai-hoc-2": [
    #paragraph(keep-next: true)[Ta có: $R^(2) = 3 ⇒ R = sqrt(3)$]
    #paragraph[*Chọn D.*]
  ],
  "bai-hoc-3": [
    #paragraph[Ta có:]
    #block(breakable: false)[
      #formula((
        $cases(display(a = - 1), display(b = 1), display(c = 0), display(d = - 7))$,
        $⇒ R$,
        $= sqrt(a^(2) + b^(2) + c^(2) - d)$,
        $= 3$,
      ))
      #paragraph[*Chọn B.*]
    ]

  ],
  "bai-hoc-4": [
    #paragraph[Yêu cầu bài toán tương đương $lr((2m))^2 + m^2 + m^2 - lr((9m^2 - 8)) > 0$]
    #paragraph[$⇔ 8 - 3m^2 > 0 ⇔ m^2 < frac(8, 3) ⇔ -sqrt(frac(8, 3)) < m < sqrt(frac(8, 3))$]
    #paragraph(keep-next: true)[Mà $m ∈ Z ⇒$ có 3 giá trị thoả mãn.]
    #paragraph[*Chọn A.*]
  ],
  "bai-hoc-5": [
    #figure-panel(above: 5mm, below: 6mm, great-circle())
    #paragraph[Bán kính đường tròn lớn bằng bán kính mặt cầu $lr(( = R ))$]
    #paragraph[$⇒$ Chu vi đường tròn lớn $= 2 π R = 8 π ⇒ R = 4$]
    #paragraph(
      keep-next: true,
    )[Yêu cầu bài toán $⇔ sqrt(4 + 1 + a^(2) - 10 a) = 4 ⇔ a^(2) - 10 a = 11 ⇔ lr(bracket.l vec(a = - 1, a = 11, delim: #none))$]
    #paragraph[*Chọn C.*]
  ],
  "bai-hoc-6": [
    #paragraph[Phương trình mặt cầu $lr(( S ))$ có tâm $I (0; 0; -3)$ và bán kính $R$ là: $x^(2) + y^(2) + lr(( z + 3 ))^(2) = R^(2)$.]
    #paragraph[Ta có: $M ∈ lr(( S )) ⇒ 4^(2) + 0^(2) + lr(( 0 + 3 ))^(2) = R^(2) ⇔ R^(2) = 25$.]
    #paragraph(keep-next: true)[Vậy phương trình cần tìm là: $x^(2) + y^(2) + lr(( z + 3 ))^(2) = 25$.]
    #paragraph[*Chọn A.*]
  ],
  "bai-hoc-7": [
    #figure-panel(above: 5mm, below: 6mm, diameter())
    #paragraph[Mặt cầu đường kính $A B$ có tâm $I$ là trung điểm $A B$ và bán kính $R = frac(A B, 2) = I A$]
    #paragraph[Tâm $I (0; 3; -1)$]
    #paragraph[$R = I A = sqrt(2^(2) + 1^(2) + 2^(2)) = 3$]
    #paragraph(keep-next: true)[Suy ra phương trình mặt cầu là: $x^(2) + lr(( y - 3 ))^(2) + lr(( z + 1 ))^(2) = 9$]
    #paragraph[*Chọn C.*]
  ],
  "bai-hoc-8": [
    #paragraph[Gọi $M$ là hình chiếu của $I$ trên $O y ⇒ M (0; 1; 0)$]
    #paragraph[Mặt cầu $lr(( S ))$ tâm $I (2; 1; -3)$ và tiếp xúc với trục $O y$ có bán kính $I M = sqrt(13)$.]
    #paragraph(
      keep-next: true,
    )[Vậy $lr(( S ))$ có phương trình $lr(( x - 2 ))^(2) + lr(( y - 1 ))^(2) + lr(( z + 3 ))^(2) = 13$.]
    #paragraph[*Chọn B.*]
  ],
  "bai-hoc-9": [
    #figure-panel(above: 5mm, below: 6mm, sphere-chord())
    #paragraph[Gọi $H$ là hình chiếu của $I$ trên $O x ⇒ H (1; 0; 0) ⇒ I H = sqrt(2^(2) + 3^(2)) = sqrt(13)$]
    #paragraph[Vì mặt cầu cắt trục $O x$ tại hai điểm $A "," B ⇒ H$ là trung điểm của $A B$]
    #paragraph[Xét $Δ I A H$ vuông ở $H$ ta có: $R^2 = I H^2 + A H^2 = I H^2 + lr((frac(A B, 2)))^2 = lr((sqrt(13)))^2 + lr((sqrt(3)))^2 = 16$]
    #paragraph(
      keep-next: true,
    )[Suy ra phương trình mặt cầu là: $lr(( x - 1 ))^(2) + lr(( y + 2 ))^(2) + lr(( z - 3 ))^(2) = 16$]
    #paragraph[*Chọn A.*]
  ],
  "bai-hoc-10": [
    #paragraph[Gọi phương trình mặt cầu $lr(( S ))$ là: $x^(2) + y^(2) + z^(2) + 2 a x + 2 b y + 2 c z + d = 0$]
    #paragraph[Mặt cầu $lr(( S ))$ đi qua 4 điểm $A "," B "," C "," D$ nên ta có hệ:]
    #formula((
      $cases(display(9 + 9 + 6 a + 6 b + d = 0), display(9 + 9 + 6 a + 6 c + d = 0), display(9 + 9 + 6 b + 6 c + d = 0), display(9 + 9 + 9 + 6 a + 6 b + 6 c + d = 0))$,
    ))
    #formula((
      $⇔ cases(display(6 a + 6 b + d = - 18), display(6 a + 6 c + d = - 18), display(6 b + 6 c + d = - 18), display(6 a + 6 b + 6 c + d = - 27))$,
      $⇔ cases(display(c = - frac(3, 2) = b = a), display(d = 0))$,
    ))
    #paragraph[Vậy phương trình mặt cầu]
    #formula((
      $x^(2) + y^(2) + z^(2) - 3 x - 3 y - 3 z$,
      $= 0$,
      $⇒ cases(display(I lr(( frac(3, 2) ";" frac(3, 2) ";" frac(3, 2) ))), display(R = sqrt(3 . lr(( frac(3, 2) ))^(2)) = frac(3 sqrt(3), 2)))$,
    ))
    #paragraph(
      keep-next: true,
    )[Mặt cầu $lr(( S )) : lr(( x - frac(3, 2) ))^(2) + lr(( y - frac(3, 2) ))^(2) + lr(( z - frac(3, 2) ))^(2) = frac(27, 4)$]
    #paragraph[*Chọn D.*]
  ],
  "bai-hoc-11": [
    #figure-panel(above: 5mm, below: 6mm, orthogonal-tetrahedron())
    #paragraph[Ta thấy $A ∈ O x, B ∈ O z, C ∈ O y ⇒$ Tứ diện $O A B C$ có ba góc vuông tại $O$.]
    #paragraph[Gọi $M$ là trung điểm của $A B$, qua $M$ kẻ đường thẳng $d ⊥ lr((O A B))$]
    #paragraph[Vẽ đường trung trực $Δ$ của $O C$ trong mặt phẳng $lr(( O C M ))$]
    #paragraph[Gọi $I = Δ ∩ d ⇒ I$ là tâm mặt cầu ngoại tiếp tứ diện $O A B C$]
    #block(breakable: false)[
      #formula((
        $⇒ R$,
        $= I O$,
        $= sqrt(I M^(2) + O M^(2))$,
        $= sqrt(lr(( frac(O C, 2) ))^(2) + lr(( frac(A B, 2) ))^(2))$,
        $= frac(sqrt(O A^(2) + O B^(2) + O C^(2)), 2)$,
        $= frac(sqrt(14), 2)$,
      ))
      #paragraph[*Chọn C.*]
    ]

  ],
  "bai-hoc-12": [
    #paragraph[Gọi tâm mặt cầu là: $I (x; y; 0)$.]
    #formula((
      $cases(I A^2 = I B^2, I A^2 = I C^2)$,
      $⇔ cases((x-1)^2 + (y-2)^2 + 16 = (x-1)^2 + (y+3)^2 + 1, (x-1)^2 + (y-2)^2 + 16 = (x-2)^2 + (y-2)^2 + 9)$,
    ))
    #formula((
      $⇔ cases(display(lr(( y - 2 ))^(2) + 4^(2) = lr(( y + 3 ))^(2) + 1^(2)), display(x^(2) - 2 x + 1 + 16 = x^(2) - 4 x + 4 + 9))$,
    ))
    #block(breakable: false)[
      #formula((
        $⇔ cases(display(10 y = 10), display(2 x = - 4))$,
        $⇔ cases(display(x = - 2), display(y = 1))$,
        $⇒ l$,
        $= 2 R$,
        $= 2 sqrt(lr((-3 ))^(2) + lr((-1 ))^(2) + 4^(2))$,
        $= 2 sqrt(26)$,
      ))
      #paragraph[*Chọn C.*]
    ]

  ],
  "bai-hoc-13": [
    #figure-panel(above: 5mm, below: 6mm, tangent-spheres())
    #paragraph[Mặt cầu $lr(( S ))$ có:]
    #formula(($cases(display(I (1; 1; 0)), display(R = 2))$,))
    #paragraph[Mặt cầu $lr(( S ' ))$ có:]
    #formula(($cases(display(I ' (9; 1; 6)), display(R '))$,))
    #paragraph[Để mặt cầu $lr(( S ' ))$ tiếp xúc ngoài với mặt cầu $lr(( S ))$ thì $I I ' = R + R ' ⇒ R ' = I I ' - R = sqrt(8^(2) + 6^(2)) - 2 = 8$]
    #paragraph(
      keep-next: true,
    )[Vậy phương trình mặt cầu $lr(( S ' ))$: $lr(( x - 9 ))^(2) + lr(( y - 1 ))^(2) + lr(( z - 6 ))^(2) = 64$.]
    #paragraph[*Chọn A.*]
  ],
  "bai-hoc-14": [
    #paragraph[Mặt cầu tiếp xúc với tất cả các mặt phẳng toạ độ nên $R = d_(I "," lr(( O x y ))) = d_(I "," lr(( O y z ))) = d_(I "," lr(( O z x ))) ⇒ R = abs(c) = abs(a) = abs(b)$]
    #paragraph[$A ∈ lr(( S )) ⇒ R = I A = sqrt(lr(( a - 1 ))^(2) + lr(( b + 1 ))^(2) + lr(( c - 4 ))^(2))$ (1)]
    #paragraph[Để mặt cầu tâm $I$ đi qua $A$ và tiếp xúc với tất cả 3 mặt phẳng $lr(( O x y )) "," lr(( O y z )) "," lr(( O x z ))$ thì $I$ và $A$ phải nằm cùng phía so với 3 mặt phẳng toạ độ $⇒ a = c = - b > 0$]
    #paragraph[Kết hợp với $lr(( 1 ))$ ta có:]
    #block(breakable: false)[
      #formula((
        $sqrt(lr(( a - 1 ))^(2) + lr(( b + 1 ))^(2) + lr(( c - 4 ))^(2))$,
        $= a$,
        $= c$,
        $= - b$,
        $⇒ lr(( a - 1 ))^(2) + lr(( - a + 1 ))^(2) + lr(( a - 4 ))^(2)$,
        $= a^(2)$,
        $⇒ a$,
        $= 3$,
        $⇒ cases(display(c = 3), display(b = - 3))$,
        $⇒ P$,
        $= 9$,
      ))
      #paragraph[*Chọn D.*]
    ]

  ],
  "bai-hoc-15": [
    #figure-panel(above: 5mm, below: 6mm, contact-circle())
    #paragraph[Ta gọi các điểm như trên hình vẽ.]
    #paragraph[$r_(lr(( C ))) = E H$]
    #formula(($cases(display(I E = R = 2), display(I M = sqrt(1 + 2^(2) + 1) = sqrt(6)))$,))
    #paragraph[Mà $Δ I M E$ vuông tại $E$ nên $E M = sqrt(6 - 2^(2)) = sqrt(2)$]
    #paragraph(
      keep-next: true,
    )[Xét $Δ I M E$ có $E H$ là đường cao $⇒ E H . I M = M E . E I$(hệ thức lượng) $⇒ E H = frac(2 sqrt(3), 3)$.]
    #paragraph[*Chọn A.*]
  ],
  "tu-luyen-1": [
    #paragraph[Mặt cầu $lr(( S )) : lr(( x - a ))^(2) + lr(( y - b ))^(2) + lr(( z - c ))^(2) = R^(2)$ có tâm là $I (a; b; c)$.]
    #paragraph(
      keep-next: true,
    )[Suy ra, mặt cầu $lr(( S )) : lr(( x - 1 ))^(2) + lr(( y + 2 ))^(2) + lr(( z - 3 ))^(2) = 16$ có tâm là $I (1; -2; 3)$.]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-2": [
    #paragraph(keep-next: true)[Bán kính của $lr(( S ))$ là $R = sqrt(9) = 3$ .]
    #paragraph[*Chọn C.*]
  ],
  "tu-luyen-3": [
    #paragraph(
      keep-next: true,
    )[Từ phương trình mặt cầu ta suy ra tâm $I lr((4; -1; 0)), R = sqrt(4^2 + (-1)^2 - 1) = 4$]
    #paragraph[*Chọn B.*]
  ],
  "tu-luyen-4": [
    #paragraph[Đáp án B vì không có số hạng $y^(2)$. Đáp án C loại vì có số hạng $2 x y$. Đáp án D loại vì $a^(2) + b^(2) + c^(2) - d = 1 + 1 + 4 - 8 = - 2 < 0$.]
    #paragraph(keep-next: true)[Đáp án A thỏa mãn vì $a^(2) + b^(2) + c^(2) - d = 1 + 0 + 4 + 1 = 6 > 0$.]
    #paragraph[*Chọn A.*]
  ],
  "tu-luyen-5": [
    #paragraph[Phương trình $x^(2) + y^(2) + z^(2) - 2 x - 2 y - 4 z + m = 0$ là một phương trình mặt cầu]
    #paragraph(keep-next: true)[$⇔ 1^(2) + 1^(2) + 2^(2) - m > 0 ⇔ m < 6$.]
    #paragraph[*Chọn A.*]
  ],
  "tu-luyen-6": [
    #paragraph[Để phương trình $x^(2) + y^(2) + z^(2) + 2 lr(( m + 2 )) x - 2 lr(( m - 1 )) z + 3 m^(2) - 5 = 0$ là phương trình của một mặt cầu thì:]
    #formula((
      $lr(( m + 2 ))^(2) + lr(( m - 1 ))^(2) - lr(( 3 m^(2) - 5 )) > 0$,
      $⇔ - m^(2) + 2 m + 10 > 0$,
      $⇔ 1 - sqrt(11) < m < 1 + sqrt(11)$,
    ))
    #paragraph(keep-next: true)[Mà $m ∈ Z ⇒$ có 7 giá trị thoả mãn.]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-7": [
    #paragraph[Mặt cầu có tâm $I$ và đi qua $A$ có $R = I A = sqrt(5)$]
    #paragraph(
      keep-next: true,
    )[$⇒$ Phương trình mặt cầu có tâm $I$ và đi qua $A$ là: $lr(( x - 1 ))^(2) + lr(( y - 1 ))^(2) + lr(( z - 1 ))^(2) = 5$]
    #paragraph[*Chọn C.*]
  ],
  "tu-luyen-8": [
    #paragraph[Ta có mặt cầu đường kính $A B$ có tâm $I (1; 1; -2)$ là trung điểm của đoạn thẳng $A B$ và bán kính $R = I A = sqrt(6)$]
    #paragraph(
      keep-next: true,
    )[$⇒$ phương trình mặt cầu: $lr(( x - 1 ))^(2) + lr(( y - 1 ))^(2) + lr(( z + 2 ))^(2) = 6$]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-9": [
    #paragraph[Với điểm $M (1; -2; 3)$ thì hình chiếu vuông góc của $M$ trên trục $O x$ là $I (1; 0; 0)$]
    #paragraph(
      keep-next: true,
    )[Có $I M = sqrt(13)$ vậy phương trình mặt cầu tâm $I (1; 0; 0)$ bán kính $I M$ là: $lr(( x - 1 ))^(2) + y^(2) + z^(2) = 13$]
    #paragraph[*Chọn B.*]
  ],
  "tu-luyen-10": [
    #paragraph[Ta có: $S_(c) = 4 π R^(2) = 4 π ⇒ R = 1$]
    #paragraph(
      keep-next: true,
    )[Vậy phương trình mặt cầu: $lr(( x - 1 ))^(2) + lr(( y - 1 ))^(2) + lr(( z - 1 ))^(2) = 1$]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-11": [
    #paragraph[Gọi $I (a; 0; 0) ∈ O x ⇒ arrow(I A) (1 - a; 1; 2) ";" arrow(I B) (3 - a; 2; -3)$.]
    #paragraph[Do $lr(( S ))$ đi qua hai điểm $A "," B$ nên $I A = I B ⇔ sqrt(lr(( 1 - a ))^(2) + 5) = sqrt(lr(( 3 - a ))^(2) + 13) ⇔ 4 a = 16 ⇔ a = 4$]
    #paragraph[$⇒ lr(( S ))$ có tâm $I (4; 0; 0)$, bán kính $R = I A = sqrt(14)$.]
    #paragraph(
      keep-next: true,
    )[$⇒ lr(( S )) : lr(( x - 4 ))^(2) + y^(2) + z^(2) = 14 ⇔ x^(2) + y^(2) + z^(2) - 8 x + 2 = 0 .$]
    #paragraph[*Chọn A.*]
  ],
  "tu-luyen-12": [
    #paragraph[Gọi tâm $I (a; b; c)$ và phương trình mặt cầu $lr(( S )) : x^(2) + y^(2) + z^(2) - 2 a x - 2 b y - 2 c z + d = 0$]
    #paragraph[Do $I ∈ lr(( O x y )) ⇔ c = 0 ⇔ lr(( S )) : x^(2) + y^(2) + z^(2) - 2 a x - 2 b y + d = 0$.]
    #paragraph[Ta có:]
    #formula((
      $cases(display(A ∈ lr(( S ))), display(B ∈ lr(( S ))), display(C ∈ lr(( S ))))$,
      $⇔ cases(display(2 a + 4 b - d = 21), display(2 a - 6 b - d = 11), display(4 a + 4 b - d = 17))$,
      $⇔ cases(display(a = - 2), display(b = 1), display(d = - 21))$,
    ))
    #paragraph(keep-next: true)[Vậy $I (-2; 1; 0)$.]
    #paragraph[*Chọn B.*]
  ],
  "tu-luyen-13": [
    #paragraph[Gọi phương trình mặt cầu $lr(( S ))$ có dạng $x^(2) + y^(2) + z^(2) - 2 a x - 2 b y - 2 c z + d = 0$, với tọa độ tâm $I (a; b; c)$.]
    #paragraph[Ta có:]
    #paragraph[$I (a; b; c) ∈ lr(( O x y )) ⇒ c = 0$;]
    #formula((
      $cases(display(A ∈ lr(( S ))), display(B ∈ lr(( S ))), display(C ∈ lr(( S ))))$,
      $⇒ cases(display(-2 a - 4 b + d = - 21), display(-2 a + 6 b + d = - 11), display(-4 a - 4 b + d = - 17))$,
      $⇔ cases(display(a = - 2), display(b = 1), display(d = - 21))$,
    ))
    #paragraph(keep-next: true)[$R = sqrt(a^(2) + b^(2) + c^(2) - d) = sqrt(4 + 1 + 0 + 21) = sqrt(26)$.]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-14": [
    #paragraph[Ta có:]
    #formula((
      $M A$,
      $= 3 M B$,
      $⇒ lr(( M A ))^(2)$,
      $= 9 lr(( M B ))^(2)$,
      $⇒ lr(( arrow(M A) ))^(2)$,
      $= 9 lr(( arrow(M B) ))^(2)$,
      $⇔ lr(( arrow(M I) + arrow(I A) ))^(2)$,
      $= 9 lr(( arrow(M I) + arrow(I B) ))^(2)$,
    ))
    #formula((
      $⇔ M I^(2) + 2 arrow(M I) . arrow(I A) + I A^(2)$,
      $= 9 lr(( M I^(2) + 2 arrow(M I) . arrow(I B) + I B^(2) ))$,
      $⇔ 8 M I^(2)$,
      $= lr(( I A^(2) - 9 I B^(2) )) + 2 arrow(M I) lr(( arrow(I A) - 9 arrow(I B) ))$,
    ))
    #figure-panel(above: 5mm, below: 6mm, apollonius-line())
    #paragraph[Gọi $I$ sao cho $arrow(I A) - 9 arrow(I B) = arrow(0) ⇒ arrow(I A) = 9 arrow(I B)$, do $A "," B$ cố định $⇒$ tồn tại duy nhất 1 điểm $I$ thoả mãn.]
    #block(breakable: false)[
      #formula((
        $⇒ cases(display(I A = frac(9, 2)), display(I B = frac(1, 2)))$,
        $⇒ 8 M I^(2)$,
        $= I A^(2) - 9 I B^(2)$,
        $⇒ M I^(2)$,
        $= lr([ lr(( frac(9, 2) ))^(2) - 9 . lr(( frac(1, 2) ))^(2) ]) . frac(1, 8)$,
        $= frac(9, 4)$,
        $⇒ M I$,
        $= frac(3, 2)$,
      ))
      #paragraph[*Chọn D.*]
    ]

  ],
  "tu-luyen-15": [
    #paragraph[Gọi toạ độ điểm]
    #formula((
      $M (x; y; z)$,
      $⇒ cases(display(M A^(2) = lr(( x + 2 ))^(2) + lr(( y - 2 ))^(2) + lr(( z + 2 ))^(2)), display(M B^(2) = lr(( x - 3 ))^(2) + lr(( y + 3 ))^(2) + lr(( z - 3 ))^(2)))$,
    ))
    #paragraph[Mà:]
    #formula((
      $frac(M A, M B)$,
      $= frac(2, 3)$,
      $⇔ 9 M A^(2)$,
      $= 4 M B^(2)$,
      $⇔ 5 lr(( x^(2) + y^(2) + z^(2) )) + 60 x - 60 y + 60 z$,
      $= 0$,
      $⇔ x^(2) + y^(2) + z^(2) + 12 x - 12 y + 12 z$,
      $= 0$,
    ))
    #paragraph[$⇒ M ∈ lr(( S )) : x^(2) + y^(2) + z^(2) + 12 x - 12 y + 12 z = 0$, trong đó $lr(( S ))$ có:]
    #formula(($cases(display(I (-6; 6; -6)), display(R = 6 sqrt(3)))$,))
    #figure-panel(above: 5mm, below: 6mm, max-distance())
    #paragraph(keep-next: true)[Ta thấy $O ∈ lr(( S )) ⇒ O M_(max) = 2 R = 12 sqrt(3)$]
    #paragraph[*Chọn B.*]
  ],
  "tu-luyen-16": [
    #figure-panel(above: 5mm, below: 6mm, orthogonal-tangents())
    #paragraph[Để tồn tại điểm $A$ thỏa mãn yêu cầu bài toán thì $R ≤ I A ≤ sqrt(2) R ⇒ 3 ≤ I A^(2) ≤ 6$]
    #paragraph[Tâm $I lr(( 0 ";" 0 ";" sqrt(2) ))$]
    #paragraph[Điểm $A ∈ lr(( O x y )) ⇒$ toạ độ của $A$ có dạng $(a; b; 0) ⇒ I A^(2) = a^(2) + b^(2) + lr(( sqrt(2) ))^(2)$]
    #paragraph[Suy ra: $3 ≤ a^(2) + b^(2) + 2 ≤ 6 ⇔ 1 ≤ a^(2) + b^(2) ≤ 4$]
    #paragraph[$a = 0 ⇒ b ∈ lr(\{ ± 1 ";" ± 2 \}) ⇒$ có 4 điểm thoả mãn]
    #paragraph[$a = ± 1 ⇒ b ∈ lr(\{ 0 ";" ± 1 \}) ⇒$ có 6 điểm thoả mãn]
    #paragraph[$a = ± 2 ⇒ b ∈ lr(\{ 0 \}) ⇒$ có 2 điểm thoả mãn]
    #paragraph(keep-next: true)[Vậy có tất cả 12 điểm thoả mãn.]
    #paragraph[*Chọn C.*]
  ],
  "tu-luyen-17": [
    #figure-panel(above: 5mm, below: 6mm, scale(x: 110%, y: 110%, reflow: true, inscribed-tetrahedron()))
    #paragraph[Theo bài toán ta có: Tứ diện $A B C D$ là tứ diện vuông tại $A$ và nội tiếp trong mặt cầu.]
    #paragraph[Đặt]
    #formula((
      $cases(display(A B = a), display(A C = b), display(A D = c))$,
      $⇒ R_(m c)$,
      $= frac(sqrt(a^(2) + b^(2) + c^(2)), 2)$,
    ))
    #paragraph[Mà $R_(m c) = I A = 3 sqrt(3) ⇒ frac(sqrt(a^(2) + b^(2) + c^(2)), 2) = 3 sqrt(3) ⇒ a^(2) + b^(2) + c^(2) = 108$]
    #paragraph[Theo BĐT Côsi: $a^(2) + b^(2) + c^(2) ≥ 3 root(3, a^(2) b^(2) c^(2)) ⇔ 108 ≥ 3 root(3, a^(2) b^(2) c^(2)) ⇔ a b c ≤ 216$]
    #paragraph(
      keep-next: true,
    )[Ta có: $V_(A B C D) = frac(1, 6) . A B . A C . A D = frac(1, 6) a b c$ đạt giá trị lớn nhất bằng $V_(A B C D) = frac(1, 6) . 216 = 36$]
    #paragraph[*Chọn D.*]
  ],
)
