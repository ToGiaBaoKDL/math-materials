#import "/templates/lesson.typ": formula, lesson-section, paragraph, theory-box
#import "/templates/components.typ": figure-panel
#import "../figures.typ": direction-vectors

#let theory() = [
  #lesson-section([LÝ THUYẾT CẦN NHỚ], badge: [A])
  #theory-box(title: [Khái niệm về vecto chỉ phương của đường thẳng])[
    #figure-panel(direction-vectors())
    #paragraph[Véctơ chỉ phương $arrow(u)$ của đường thẳng $d$ là véctơ có giá song song hoặc trùng với đường thẳng $d .$]
    #paragraph[Nếu $d$ có một véctơ chỉ phương là $arrow(u)$ thì $k ⋅ arrow(u) ( k ≠ 0 )$ cũng là một véctơ chỉ phương của $d .$]
  ]
  #theory-box(title: [Phương trình đường thẳng])[
    #paragraph[Cho đường thẳng $Δ$ qua $M lr(( x_(0) ";" y_(0) ";" z_(0) ))$ và có vecto chỉ phương là $arrow(u) = lr(( a ";" b ";" c )) ≠ arrow(0)$]
    #paragraph(keep-next: true)[\+ Phương trình tham số của đường thẳng $Δ$ là:]
    #formula(($cases(x = x_0 + a t, y = y_0 + b t, z = z_0 + c t) (t in RR)$,))
    #paragraph(keep-next: true)[\+ Phương trình chính tắc của đường thẳng $Δ$ là:]
    #formula(($frac(x-x_0, a) = frac(y-y_0, b) = frac(z-z_0, c) (a b c != 0)$,))
  ]
]
