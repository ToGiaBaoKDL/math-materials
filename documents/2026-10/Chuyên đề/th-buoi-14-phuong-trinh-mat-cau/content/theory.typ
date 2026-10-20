#import "/templates/lesson.typ": formula, paragraph, theory-box
#let theory-one() = theory-box(title: [LÝ THUYẾT CẦN NHỚ])[
  #paragraph[Phương trình mặt cầu:]
  #paragraph[a) Phương trình chính tắc: $lr(( S )) : lr(( x - a ))^(2) + lr(( y - b ))^(2) + lr(( z - c ))^(2) = R^(2)$]
  #paragraph[Trong đó: tâm $I (a; b; c)$, bán kính $R$]
  #paragraph[b) Phương trình tổng quát: $x^(2) + y^(2) + z^(2) + 2 a x + 2 b y + 2 c z + d = 0$ (∗)]
  #paragraph[Phương trình $lr(( * )) ⇔ lr(( x + a ))^(2) + lr(( y + b ))^(2) + lr(( z + c ))^(2) = a^(2) + b^(2) + c^(2) - d$]
  #paragraph[- Để phương trình (∗) là phương trình mặt cầu thì $a^(2) + b^(2) + c^(2) - d > 0$]
  #paragraph[- Khi đó phương trình (∗) là phương trình của mặt cầu]
  #formula(($lr(( S )) : cases(display(I lr(( - a "," - b "," - c ))), display(R = sqrt(a^(2) + b^(2) + c^(2) - d)))$,))
]
#let theory-two() = theory-box()[
  #paragraph[- Cách 1: Đi tìm hai yếu tố: tâm $I (a; b; c)$, bán kính $R$]
  #paragraph[
    - Cách 2: Gọi phương trình tổng quát: $x^(2) + y^(2) + z^(2) + 2 a x + 2 b y + 2 c z + d = 0$, theo giả thiết lập 4 phương trình, 4 ẩn $a "," b "," c "," d ⇒$ phương trình mặt cầu.
  ]
]
