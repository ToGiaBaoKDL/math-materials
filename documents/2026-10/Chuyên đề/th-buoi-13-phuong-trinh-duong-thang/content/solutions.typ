#import "/templates/lesson.typ": formula, paragraph as lesson-paragraph
#import "/templates/components.typ": figure-panel
#import "../figures.typ": angle-bisector, line-plane-midpoint, normal-plane, triangle-bisector

#let paragraph = lesson-paragraph.with(gap: 5mm)

#let solutions = (
  "bai-hoc-1": [
    #paragraph[*Chọn B.*]
  ],
  "bai-hoc-2": [

    #paragraph[$d : cases(display(x = 2 - t), display(y = 1 + 2 t), display(z = 3 + t))$ có một vectơ chỉ phương là $arrow(u_(4)) = lr(( - 1 ";" 2 ";" 1 ))$.]
    #paragraph[*Chọn C.*]
  ],
  "bai-hoc-3": [

    #paragraph[Ta có $arrow(A B) = lr(( - 1 ";" 0 ";" 2 ))$ suy ra đường thẳng $A B$ có VTCP là $arrow(b) = lr(( - 1 ";" 0 ";" 2 ))$.]
    #paragraph[*Chọn C.*]
  ],
  "bai-hoc-4": [

    #paragraph[Thay tọa độ các điểm vào phương trình đường thẳng ta thấy điểm $P lr(( - 1 ";" 2 ";" 1 ))$ thỏa $frac(- 1 + 1, - 1) = frac(2 - 2, 3) = frac(1 - 1, 3) = 0$. Vậy điểm $P lr(( - 1 ";" 2 ";" 1 ))$ thuộc đường thẳng yêu cầu.]
    #paragraph[*Chọn A.*]
  ],
  "bai-hoc-5": [

    #paragraph[Do đường thẳng $d : cases(display(x = 1 + 2 t), display(y = 3 t), display(z = - 2 + t))$ đi qua điểm $M ( 1 ";" 0 ";" - 2 )$ và có véc tơ chỉ phương $arrow(u) ( 2 ";" 3 ";" 1 )$ nên có phương trình chính tắc là $frac(x - 1, 2) = frac(y, 3) = frac(z + 2, 1) .$]
    #paragraph[*Chọn D.*]
  ],
  "bai-hoc-6": [

    #paragraph[Trục $O z$ đi qua gốc tọa độ $O lr(( 0 ";" 0 ";" 0 ))$ và nhận vectơ đơn vị $arrow(k) = lr(( 0 ";" 0 ";" 1 ))$ làm vectơ chỉ phương nên có phương trình tham số $cases(display(x = 0), display(y = 0), display(z = t))$.]
    #paragraph[*Chọn D.*]
  ],
  "bai-hoc-7": [

    #paragraph[Vecto chỉ phương của đường thẳng $P Q$ là: $arrow(u_(P Q)) = arrow(P Q) = lr(( 1 ";" 2 ";" 3 ))$]
    #paragraph[Và đường thẳng đi qua điểm $P lr(( 1 ";" 1 ";" - 1 ))$ nên phương trình đường thẳng $P Q$ là: $frac(x - 1, 1) = frac(y - 1, 2) = frac(z + 1, 3)$]
    #paragraph[*Chọn B.*]
  ],
  "bai-hoc-8": [

    #paragraph[Gọi $Δ$ là phương trình đường thẳng cần tìm, do $Δ ∥ d ⇒ arrow(u_(Δ)) = arrow(u_(d)) = lr(( 1 ";" - 1 ";" 2 ))$]
    #paragraph[Đường thẳng đi qua trung điểm của $A B$ là điểm $I lr(( 0 ";" 1 ";" - 1 ))$]
    #paragraph[Suy ra phương trình đường thẳng $Δ$ là $frac(x, 1) = frac(y - 1, - 1) = frac(z + 1, 2)$]
    #paragraph[*Chọn B.*]
  ],
  "bai-hoc-9a": [
    #figure-panel(normal-plane())
    #paragraph[Gọi $d$ là đường thẳng cần tìm, vì]
    #formula(($d ⊥ lr(( P ))$, $⇒ arrow(u_(d)) = arrow(n_(lr(( P )))) = lr(( 1 ";" 3 ";" - 1 ))$))
    #paragraph[Do đó, loại C, D]
    #paragraph[Vì $d$ đi qua $A$ nên ta thay toạ độ $A$ vào đáp án A, B]
    #paragraph[Đáp án A: $⇒ cases(display(t = 1), display(t = frac(2, 3)), display(t = 1)) ⇒$ loại]
    #paragraph[Đáp án B: $t = 1 ⇒$ thoả mãn]
    #paragraph[*Chọn B.*]
  ],
  "bai-hoc-9b": [

    #paragraph[Gọi $Δ$ là đường thẳng cần tìm $⇒ Δ ⊥ lr(( B C D )) ⇒ arrow(u_(Δ)) = arrow(n_(lr(( B C D )))) = lr([ arrow(B C) "," arrow(B D) ])$]
    #paragraph[Ta có: $arrow(B C) = lr(( 2 ";" 0 ";" - 1 )) ";" arrow(B D) = lr(( 0 ";" - 1 ";" 2 )) ⇒ lr([ arrow(B C) "," arrow(B D) ]) = lr(( - 1 ";" - 4 ";" - 2 ))$]
    #paragraph[Ta chọn $arrow(u_(Δ)) = lr(( 1 ";" 4 ";" 2 )) ⇒$ loại A, B]
    #paragraph[Vì $A ∈ Δ ⇒$ ta thay toạ độ của $A$ vào các đáp án C, D ta được]
    #paragraph[Đáp án C: $t = - 1 ⇒$ thoả mãn]
    #paragraph[Đáp án D: $cases(display(t = 0), display(t = frac(1, 2)), display(t = 0)) ⇒$ loại.]
    #paragraph[*Chọn C.*]
  ],
  "bai-hoc-10a": [

    #paragraph[Gọi $d$ là đường thẳng cần tìm]
    #formula((
      $⇒ cases(display(d ⊥ Δ), display(d ⊥ Δ '))$,
      $⇒ cases(display(arrow(u_(d)) ⊥ arrow(u_(Δ)) = lr(( 3 ";" 2 ";" 1 ))), display(arrow(u_(d)) ⊥ arrow(u_(Δ ')) = lr(( 1 ";" 3 ";" - 2 ))))$,
      $⇒ arrow(u_(d)) = lr([ arrow(u_(Δ)) "," arrow(u_(Δ ')) ]) = lr(( - 7 ";" 7 ";" 7 ))$,
    ))
    #paragraph[Ta chọn $arrow(u_(d)) = lr(( 1 ";" - 1 ";" - 1 )) ⇒$ loại A, C]
    #paragraph[Mà $M ∈ d ⇒$ phương trình đường thẳng $d$ là: $cases(display(x = - 1 - t), display(y = 1 + t), display(z = 3 + t))$]
    #paragraph[*Chọn D.*]
  ],
  "bai-hoc-10b": [

    #paragraph[Gọi $Δ$ là đường thẳng cần tìm]
    #formula((
      $⇒ cases(display(Δ ∥ lr(( P ))), display(Δ ∥ lr(( Q ))))$,
      $⇒ cases(display(arrow(u_(Δ)) ⊥ arrow(n_(lr(( P ))))), display(arrow(u_(Δ)) ⊥ arrow(n_(lr(( Q ))))))$,
      $⇒ arrow(u_(Δ)) = lr([ arrow(n_(lr(( P )))) ";" arrow(n_(lr(( Q )))) ]) = lr(( 2 ";" 0 ";" - 2 ))$,
    ))
    #paragraph[Ta chọn $arrow(u_(Δ)) = lr(( 1 ";" 0 ";" - 1 )) ⇒$ loại C, D]
    #paragraph[Mà $A ∈ Δ ⇒$ phương trình đường thẳng là $cases(display(x = 1 + t), display(y = - 2), display(z = 3 - t))$]
    #paragraph[*Chọn A.*]
  ],
  "bai-hoc-11c": [

    #paragraph[Ta có:]
    #formula((
      $d = lr(( α )) ∩ lr(( α ' ))$,
      $⇒ cases(display(d ⊂ lr(( α ))), display(d ⊂ lr(( α ' ))))$,
      $⇒ cases(display(arrow(u_(d)) ⊥ arrow(n_(lr(( α )))) = lr(( 1 ";" - 3 ";" 1 ))), display(arrow(u_(d)) ⊥ arrow(n_(lr(( α ' )))) = lr(( 1 ";" 1 ";" - 1 ))))$,
      $⇒ arrow(u_(d)) = lr([ arrow(n_(lr(( α )))) "," arrow(n_(lr(( α ' )))) ]) = lr(( 2 ";" 2 ";" 4 ))$,
    ))
    #paragraph[Ta chọn $arrow(u_(d)) = lr(( 1 ";" 1 ";" 2 ))$]
    #paragraph[Tìm 1 giao điểm mà $d$ đi qua]
    #paragraph[Xét hệ:]
    #formula((
      $cases(display(x - 3 y + z = 0), display(x + y - z + 4 = 0)) limits(stretch(arrow.r))^(y = 0) cases(display(x + z = 0), display(x - z = - 4))$,
      $⇔ cases(display(x = - 2), display(z = 2))$,
      $⇒ A lr(( - 2 ";" 0 ";" 2 )) ∈ d$,
    ))
    #paragraph[Suy ra phương trình đường thẳng $d$ là: $cases(display(x = - 2 + t), display(y = t), display(z = 2 + 2 t))$]
    #paragraph[Cách 2:]
    #paragraph[Gọi $M lr(( x ";" y ";" z )) ∈ d$ thoả mãn hệ: $cases(display(x - 3 y + z = 0), display(x + y - z + 4 = 0))$]
    #paragraph[Đặt $y = t ⇒$ hệ trở thành: $cases(display(x + z = 3 t), display(x - z = - t - 4)) ⇔ cases(display(x = t - 2), display(z = 2 + 2 t))$]
    #paragraph[*Chọn C.*]
  ],
  "bai-hoc-12a": [

    #paragraph[Gọi $Δ$ là đường thẳng cần tìm]
    #paragraph[$Δ$ cắt trục hoành tại điểm $M$ có toạ độ dạng $lr(( t ";" 0 ";" 0 ))$]
    #paragraph[$A ∈ Δ ⇒ arrow(u_(Δ)) = arrow(A M) = lr(( t - 1 ";" - 2 ";" - 3 ))$]
    #formula((
      $Δ ⊥ d$,
      $⇒ arrow(u_(d)) ⊥ arrow(u_(Δ))$,
      $⇔ arrow(u_(d)) ⋅ arrow(u_(Δ)) = 0$,
      $⇔ 2 lr(( t - 1 )) - 2 + 6 = 0$,
      $⇔ t = - 1$,
      $⇒ arrow(u_(Δ)) = lr(( - 2 ";" - 2 ";" - 3 ))$,
    ))
    #paragraph[Kết hợp với $M lr(( - 1 ";" 0 ";" 0 )) ∈ Δ ⇒$ phương trình đường thẳng $Δ : cases(display(x = - 1 + 2 t), display(y = 2 t), display(z = 3 t))$]
    #paragraph[*Chọn C.*]
  ],
  "bai-hoc-12b": [

    #paragraph[Phương trình tham số của $d : cases(display(x = 1 + t), display(y = t), display(z = - 1 + 2 t))$]
    #paragraph[Gọi $B = Δ ∩ d$. Vì $B ∈ d$, toạ độ của $B$ có dạng $lr(( 1 + t ";" t ";" - 1 + 2 t ))$]
    #paragraph[$A ∈ Δ ⇒ arrow(u_(Δ)) = arrow(A B) = lr(( t ";" t ";" 2 t - 3 ))$]
    #formula((
      $Δ ⊥ d$,
      $⇒ arrow(u_(Δ)) ⊥ arrow(u_(d))$,
      $⇔ arrow(u_(Δ)) ⋅ arrow(u_(d)) = 0$,
      $⇔ t + t + 2 lr(( 2 t - 3 )) = 0$,
      $⇔ t = 1$,
      $⇒ arrow(u_(Δ)) = lr(( 1 ";" 1 ";" - 1 ))$,
    ))
    #paragraph[Do đó, loại A, B, C]
    #paragraph[*Chọn D.*]
  ],
  "bai-hoc-13c": [

    #paragraph(keep-next: true)[Gọi $d$ là đường thẳng cần tìm. Đặt:]
    #formula((
      $cases(display(d ∩ d_(1) = M ⇒ M ∈ d_(1) ⇒ M lr(( 3 - t_(1) ";" 3 - 2 t_(1) ";" - 2 + t_(1) ))), display(d ∩ d_(2) = N ⇒ N ∈ d_(2) ⇒ N lr(( 5 - 3 t_(2) ";" - 1 + 2 t_(2) ";" 2 + t_(2) ))))$,
    ))
    #paragraph[$⇒ arrow(u_(d)) = arrow(M N) = lr(( t_(1) - 3 t_(2) + 2 ";" 2 t_(1) + 2 t_(2) - 4 ";" - t_(1) + t_(2) + 4 ))$]
    #formula((
      $d ⊥ lr(( P ))$,
      $⇒ arrow(u_(d)) = k arrow(n_(lr(( P )))) lr(( k ≠ 0 ))$,
      $⇒ cases(display(t_(1) - 3 t_(2) + 2 = k), display(2 t_(1) + 2 t_(2) - 4 = 2 k), display(- t_(1) + t_(2) + 4 = 3 k))$,
      $⇔ cases(display(t_(1) = 2), display(t_(2) = 1), display(k = 1))$,
      $⇒ arrow(u_(d)) = lr(( 1 ";" 2 ";" 3 ))$,
    ))
    #paragraph[Do đó, loại A.]
    #paragraph[Và $M lr(( 1 ";" - 1 ";" 0 )) ∈ d ⇒$ phương trình đường thẳng $d$ là: $frac(x - 1, 1) = frac(y + 1, 2) = frac(z, 3)$]
    #paragraph[*Chọn D.*]
  ],
  "bai-hoc-14": [

    #figure-panel(angle-bisector())
    #paragraph[Gọi $arrow(u_(1)) = lr(( 3 ";" 0 ";" 4 )) ";" arrow(u_(2)) = lr(( 1 ";" 2 ";" - 2 ))$ lần lượt là vecto chỉ phương của $d$ và $Δ$]
    #paragraph[Ta có: $arrow(u_(1)) ⋅ arrow(u_(2)) = - 5 < 0 ⇒ lr(( arrow(u_(1)) "," arrow(u_(2)) )) > 90 degree$]
    #paragraph[Ta chọn $cases(display(arrow(u_(1)) = lr(( 3 ";" 0 ";" 4 ))), display(arrow(u_(2)) = lr(( - 1 ";" - 2 ";" 2 )))) ⇒ lr(( arrow(u_(1)) "," arrow(u_(2)) ))$ là góc nhọn.]
    #paragraph[Gọi $γ$ là đường thẳng phân giác góc nhọn của $d$ và $Δ ⇒ arrow(u_(γ)) = arrow(u_(1) ') + arrow(u_(2) ')$]
    #paragraph[Trong đó:]
    #formula((
      $cases(display(arrow(u_(1) ') = frac(1, abs(arrow(u_(1)))) ⋅ arrow(u_(1)) = frac(1, 5) lr(( 3 ";" 0 ";" 4 )) = lr(( frac(3, 5) ";" 0 ";" frac(4, 5) ))), display(arrow(u_(2) ') = frac(1, abs(arrow(u_(2)))) ⋅ arrow(u_(2)) = frac(1, 3) lr(( - 1 ";" - 2 ";" 2 )) = lr(( frac(- 1, 3) ";" frac(- 2, 3) ";" frac(2, 3) ))))$,
    ))
    #paragraph[(chọn sao cho: $abs(arrow(u_(1) ')) = abs(arrow(u_(2) '))$)]
    #paragraph[$⇒ arrow(u_(γ)) = lr(( frac(4, 15) ";" frac(- 2, 3) ";" frac(22, 15) ))$. Chọn $arrow(u_(γ)) = lr(( 2 ";" - 5 ";" 11 )) ⇒$ loại C, D.]
    #paragraph[Mà $A ∈ Δ ⇒$ thay toạ độ của $A$ vào đáp án A, B ta được]
    #paragraph[Đáp án A: $cases(display(t = 1), display(t = 1), display(t = frac(- 1, 11))) ⇒$ loại A.]
    #paragraph[Đáp án B: $t = 1 ⇒$ thoả mãn.]
    #paragraph[*Chọn B.*]
  ],
  "tu-luyen-1": [

    #paragraph[$d : cases(display(x = 2 - t), display(y = 1 + 2 t), display(z = 3 + t))$ có một vectơ chỉ phương là $arrow(u_(4)) = lr(( - 1 ";" 2 ";" 1 ))$.]
    #paragraph[*Chọn C.*]
  ],
  "tu-luyen-2": [

    #paragraph[Ta có một vectơ chỉ phương của $d$ là $arrow(u_(1)) = lr(( - 1 ";" 2 ";" 3 ))$.]
    #paragraph[$arrow(u_(2)) = - 3 arrow(u_(1))$, $arrow(u_(3)) = - arrow(u_(1))$ $⇒$ các vectơ $arrow(u_(2)) "," arrow(u_(3))$ cũng là vectơ chỉ phương của $d$.]
    #paragraph[Không tồn tại số $k$ để $arrow(u_(4)) = k ⋅ arrow(u_(1))$ nên $arrow(u_(4)) = lr(( - 2 ";" 4 ";" 3 ))$ không phải là vectơ chỉ phương của $d$.]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-3": [

    #paragraph[Đường thẳng $d$ có một véc tơ chỉ phương là $arrow(v) lr(( 2 ";" 1 ";" 2 ))$.]
    #paragraph[$arrow(u) lr(( a ";" 2 ";" b ))$ làm véc tơ chỉ phương của $d$ suy ra $arrow(u)$ và $arrow(v)$ cùng phương nên $frac(a, 2) = frac(2, 1) = frac(b, 2) ⇔ cases(display(a = 4), display(b = 4))$]
    #paragraph[*Chọn B.*]
  ],
  "tu-luyen-4": [

    #paragraph[Thay tọa độ các điểm vào phương trình đường thẳng ta thấy điểm $P lr(( - 1 ";" 2 ";" 1 ))$ thỏa $frac(- 1 + 1, - 1) = frac(2 - 2, 3) = frac(1 - 1, 3) = 0$. Vậy điểm $P lr(( - 1 ";" 2 ";" 1 ))$ thuộc đường thẳng yêu cầu.]
    #paragraph[*Chọn A.*]
  ],
  "tu-luyen-5": [

    #paragraph[Với $t = - 2$, ta có $cases(display(x = 1 + 2 lr(( - 2 )) = - 3), display(y = 3 - lr(( - 2 )) = 5), display(z = 1 - lr(( - 2 )) = 3))$.]
    #paragraph[Vậy $M lr(( - 3 ";" 5 ";" 3 )) ∈ d$.]
    #paragraph[*Chọn B.*]
  ],
  "tu-luyen-6": [

    #paragraph[Do đường thẳng $d : cases(display(x = 1 + 2 t), display(y = 3 t), display(z = - 2 + t))$ đi qua điểm $M ( 1 ";" 0 ";" - 2 )$ và có véc tơ chỉ phương $arrow(u) ( 2 ";" 3 ";" 1 )$ nên có phương trình chính tắc là $frac(x - 1, 2) = frac(y, 3) = frac(z + 2, 1) .$]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-7": [

    #paragraph[Trục $O z$ đi qua gốc tọa độ $O lr(( 0 ";" 0 ";" 0 ))$ và nhận vectơ đơn vị $arrow(k) = lr(( 0 ";" 0 ";" 1 ))$ làm vectơ chỉ phương nên có phương trình tham số $cases(display(x = 0), display(y = 0), display(z = t))$.]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-8": [

    #paragraph[Đường thẳng $d$ đi qua điểm $M lr(( 3 ";" - 1 ";" 4 ))$ và có một vectơ chỉ phương $arrow(u) = lr(( - 2 ";" 4 ";" 5 ))$. Phương trình của $d$ là $cases(display(x = 3 - 2 t), display(y = - 1 + 4 t), display(z = 4 + 5 t))$.]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-9": [

    #paragraph[Ta có $arrow(M N) = lr(( 2 ";" - 1 ";" - 3 ))$.]
    #paragraph[Đường thẳng $M N$ đi qua điểm $M lr(( 1 ";" 2 ";" 1 ))$ và nhận véc-tơ $arrow(M N) = lr(( 2 ";" - 1 ";" - 3 ))$ làm véc-tơ chỉ phương có phương trình là $frac(x - 1, 2) = frac(y - 2, - 1) = frac(z - 1, - 3)$.]
    #paragraph[*Chọn B.*]
  ],
  "tu-luyen-10": [

    #paragraph[$lr(( P )) : x - 2 y + 4 "z" + 1 = 0$ có vectơ pháp tuyến $arrow(n) = lr(( 1 ";" - 2 ";" 4 ))$.]
    #paragraph[Đường thẳng đi qua $M$ và vuông góc với $lr(( P ))$ nhận $arrow(n) = lr(( 1 ";" - 2 ";" 4 ))$ làm vectơ chỉ phương nên có phương trình $frac(x + 1, 1) = frac(y - 3, - 2) = frac(z - 2, 4)$.]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-11": [

    #paragraph[Đường thẳng $d$ vuông góc với mặt phẳng tọa độ $lr(( O x y ))$ nên nhận $arrow(k) = lr(( 0 ";" 0 ";" 1 ))$ làm vectơ chỉ phương. Mặt khác $d$ đi qua $A lr(( 1 ";" 1 ";" 1 ))$ nên:]
    #paragraph[$⇒$ Đường thẳng $d$ có phương trình là: $cases(display(x = 1), display(y = 1), display(z = 1 + t))$.]
    #paragraph[*Chọn B.*]
  ],
  "tu-luyen-12": [

    #paragraph[Gọi $lr(( P ))$ là mặt phẳng đi qua $M$ và vuông góc với đường thẳng $d$.]
    #paragraph[Ta có: $arrow(n)_(P) = arrow(u)_(d) = lr(( 3 ";" 2 ";" - 1 ))$ là một véc tơ pháp tuyến của mặt phẳng $lr(( P ))$.]
    #paragraph[Phương trình mặt phẳng $lr(( P ))$ là: $3 lr(( x - 2 )) + 2 lr(( y + 2 )) - 1 lr(( z - 3 )) = 0 ⇔ 3 x + 2 y - z + 1 = 0$.]
    #paragraph[*Chọn A.*]
  ],
  "tu-luyen-13": [

    #paragraph[Đường thẳng $d$ đi qua $A$ và song song với $B C$ nhận $arrow(B C) = lr(( 2 ";" 3 ";" - 1 ))$ làm một véc tơ chỉ phương.]
    #paragraph[Phương trình của đường thẳng $d$: $frac(x - 1, 2) = frac(y, 3) = frac(z - 1, - 1)$.]
    #paragraph[*Chọn C.*]
  ],
  "tu-luyen-14": [

    #paragraph[Ta có $cases(display(arrow(n)_(lr(( P ))) = lr(( 1 ";" 1 ";" 1 ))), display(arrow(n)_(lr(( Q ))) = lr(( 1 ";" - 1 ";" 1 ))))$ và $lr([ arrow(n)_(lr(( P ))) "," arrow(n)_(lr(( Q ))) ]) = lr(( 2 ";" 0 ";" - 2 )) = 2 lr(( 1 ";" 0 ";" - 1 ))$. Vì đường thẳng $d$ song song với hai mặt phẳng, nên nhận véc tơ $lr(( 1 ";" 0 ";" - 1 ))$ làm véc tơ chỉ phương.]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-15": [

    #paragraph[Ta có: $arrow(n)_(lr(( P ))) = lr(( 1 ";" 1 ";" 0 ))$, $arrow(n)_(lr(( O x y ))) = lr(( 0 ";" 0 ";" 1 ))$.]
    #paragraph[Gọi $d$ là đường thẳng đi qua $A$ đồng thời song song với $lr(( P ))$ và mặt phẳng $lr(( O x y ))$. Khi đó:]
    #formula((
      $cases(display(mat(arrow(u)_(d) ⊥ arrow(n)_(lr(( P ))); arrow(u)_(d) ⊥ arrow(n)_(( O x y )), delim: #none)))$,
      $⇒ arrow(u)_(d) = lr([ arrow(n)_(lr(( P ))) "," arrow(n)_(lr(( O x y ))) ]) = lr(( 1 ";" - 1 ";" 0 ))$,
    ))
    #paragraph[Vậy $d : cases(display(x = 2 + t), display(y = - t), display(z = - 1))$.]
    #paragraph[*Chọn B.*]
  ],
  "tu-luyen-16": [

    #paragraph[Đường thẳng $d$ có một vectơ chỉ phương $arrow(u) = lr(( 1 ";" - 4 ";" 6 ))$.]
    #paragraph[Đường thẳng $d'$ có một vectơ chỉ phương $arrow(u') = lr(( 2 ";" 1 ";" - 5 ))$.]
    #paragraph[Gọi $Δ$ là đường thẳng qua $M ","$ vuông góc với $d$ và $d'$ nên có một vectơ chỉ phương là:]
    #paragraph[$arrow(u)_(Δ) = lr([ arrow(u) "," arrow(u') ]) = lr(( 14 ";" 17 ";" 9 ))$.]
    #paragraph[Vậy phương trình đường thẳng $Δ$: $frac(x - 1, 14) = frac(y + 1, 17) = frac(z - 2, 9) .$]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-17": [

    #paragraph[Gọi $Δ$ là đường thẳng thỏa mãn đề bài.]
    #paragraph[Khi đó $B lr(( 0 ";" b ";" 0 )) = Δ ∩ O y$, ta có $arrow(A B) = lr(( - 1 ";" b - 1 ";" - 3 ))$.]
    #paragraph[Đường thẳng $d$ có vectơ chỉ phương là $arrow(u_(d)) = lr(( 1 ";" 2 ";" 1 ))$.]
    #paragraph[Theo đề bài ta có $arrow(A B) ⊥ arrow(u_(d))$, suy ra $arrow(A B) ⋅ arrow(u_(d)) = 0 ⇔ - 1 + 2 lr(( b - 1 )) - 3 = 0$ $⇔ b = 3$]
    #paragraph[$⇒ arrow(A B) = lr(( - 1 ";" 2 ";" - 3 ))$ $⇒ arrow(u) = lr(( 1 ";" - 2 ";" 3 ))$ là một vectơ chỉ phương của $Δ$.]
    #paragraph[Do đó đường thẳng $Δ$ có phương trình:$cases(display(x = 1 + t), display(y = 1 - 2 t), display(z = 3 + 3 t)) ";" lr(( t ∈ ℝ ))$]
    #paragraph[Cho $t = - 2$ ta thấy $M ( - 1 ";" 5 ";" - 3 ) ∈ Δ$ nên $Δ$ cũng có phương trình $cases(display(x = - 1 + t), display(y = 5 - 2 t), display(z = - 3 + 3 t))$.]
    #paragraph[*Chọn D.*]
  ],
  "tu-luyen-18": [

    #paragraph[Gọi $Δ$ là đường thẳng cần tìm.]
    #paragraph[Mặt phẳng $lr(( P ))$ có vectơ pháp tuyến là $arrow(n)_(lr(( P ))) = lr(( 2 ";" 2 ";" - 1 ))$.]
    #paragraph[Gọi $M = Δ ∩ d_(1)$ $⇒ M lr(( 1 + 2 m ";" m ";" - 1 - 2 m ))$, $lr(( m ∈ ℝ ))$,]
    #paragraph[$N = Δ ∩ d_(2)$ $⇒ N lr(( 2 + n ";" 2 n ";" - 1 - n ))$, $lr(( n ∈ ℝ ))$.]
    #paragraph[Ta có $arrow(M N) = lr(( n - 2 m + 1 ";" 2 n - m ";" - n + 2 m ))$]
    #paragraph[Vì $Δ$ vuông góc với $lr(( P ))$ nên $arrow(M N)$, $arrow(n)_(lr(( P )))$ cùng phương nên ta có]
    #paragraph[$frac(n - 2 m + 1, 2) = frac(2 n - m, 2) = frac(- n + 2 m, - 1)$ $⇔ cases(display(n = 1), display(m = 0))$.]
    #paragraph[Do đó $N lr(( 3 ";" 2 ";" - 2 ))$, $arrow(M N) = lr(( 2 ";" 2 ";" - 1 ))$.]
    #paragraph[Vậy đường thẳng $Δ$ đi qua $N lr(( 3 ";" 2 ";" - 2 ))$ có vectơ chỉ phương là $arrow(M N) = lr(( 2 ";" 2 ";" - 1 ))$ nên có phương trình chính tắc là $frac(x - 3, 2) = frac(y - 2, 2) = frac(z + 2, - 1)$.]
    #paragraph[*Chọn A.*]
  ],
  "tu-luyen-19": [

    #figure-panel(triangle-bisector())
    #paragraph[Ta có $arrow(A B) = lr(( 1 ";" - 1 ";" 2 ))$ và $arrow(A C) = lr(( 2 ";" 2 ";" - 4 ))$.]
    #paragraph[Gọi $M$ là trung điểm $A C$, ta có $M lr(( 3 ";" 2 ";" - 2 ))$, $arrow(A M) = lr(( 1 ";" 1 ";" - 2 ))$.]
    #paragraph[Do đó $Δ A B M$ cân tại $A$. Gọi $K$ là điểm thỏa mãn $arrow(A K) = arrow(A M) + arrow(A B) = lr(( 2 ";" 0 ";" 0 ))$. Khi đó $A K$ là tia phân giác trong góc $hat(B A C)$.]
    #paragraph[Vậy phương trình đường phân giác trong góc $hat(B A C)$ là $cases(display(x = 2 + t), display(y = 1), display(z = 0)) "," t ∈ ℝ$.]
    #paragraph[*Chọn C.*]
  ],
  "tu-luyen-20": [

    #figure-panel(line-plane-midpoint())
    #paragraph[Ta có $d : frac(x + 1, 2) = frac(y, 1) = frac(z - 2, 1) ⇒ cases(display(x = - 1 + 2 t), display(y = t), display(z = 2 + t))$. Do đó $M ∈ d$ $⇒ M lr(( - 1 + 2 t ";" t ";" 2 + t ))$.]
    #paragraph[Vì $A lr(( 1 ";" - 1 ";" 2 ))$ là trung điểm $M N$ $⇒ N lr(( 3 - 2 t ";" - 2 - t ";" 2 - t ))$.]
    #paragraph[Mặt khác $N ∈ lr(( P ))$ $⇒ 3 - 2 t - 2 - t - 2 lr(( 2 - t )) + 5 = 0$ $⇔ t = 2 ⇒ M lr(( 3 ";" 2 ";" 4 ))$ $⇒ arrow(A M) = lr(( 2 ";" 3 ";" 2 ))$ là một vectơ chỉ phương của $Δ$.]
    #paragraph[*Chọn B.*]
  ],
)
