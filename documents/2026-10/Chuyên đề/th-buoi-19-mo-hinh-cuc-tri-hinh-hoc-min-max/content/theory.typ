#import "/templates/lesson.typ": lesson-section, theory-box
#import "../figures.typ": diagram
#import "../layout.typ": math-flow
#let theory() = [
#lesson-section([PHƯƠNG PHÁP GIẢI],badge:"1")

Từ giả thiết phải nhìn thấy và chỉ ra được tập hợp điểm (quỹ tích) của điểm thay đổi. Từ đó dựa vào các mô hình cực trị hình học để kết luận Min – Max.

#block(sticky:true,above:3mm,below:1mm)[*Mô hình 1.* Cho mặt cầu (S) tâm I, bán kính R và điểm A cố định, điểm M thay đổi trên mặt cầu (S)]

#block(width:100%,breakable:false,above:2mm,below:2mm,align(center,scale(x:75%,y:75%,reflow:true,diagram("sphere"))))

#theory-box(title:[Kết luận],breakable:true)[
Khi đó: $cases(display(A M _(max) = A I + R), display(A M _(min) = abs(A I - R)))$
]

#block(sticky:true,above:3mm,below:1mm)[*Mô hình 2.* Cho đường tròn (C) tâm I, bán kính r và điểm A cố định cùng thuộc mặt phẳng (P), điểm M thay đổi trên đường tròn (C)]

#block(width:100%,breakable:false,above:2mm,below:2mm,align(center,scale(x:75%,y:75%,reflow:true,diagram("circle"))))

#theory-box(title:[Kết luận],breakable:true)[
Khi đó: $cases(display(A M _(max) = A I + r), display(A M _(min) = abs(A I - r)))$
]

#block(sticky:true,above:3mm,below:1mm)[*Mô hình 3.* Cho đường tròn (C) tâm I, bán kính r nằm trong mặt phẳng (P), điểm M thay đổi trên đường tròn (C) và diểm A cố định. Tìm $cases(display(A M _(min)), display(A M _(max)))$]

#block(width:100%,breakable:false,above:2mm,below:2mm,align(center,scale(x:75%,y:75%,reflow:true,diagram("off-plane"))))

#theory-box(title:[Kết luận],breakable:true)[
Gọi $A'$ là hình chiếu của $A$ trên $(P)$. Ta có:
$ A M^2=A A'^2+A'M^2, quad A A'^2=d^2(A;(P))=text("hằng số"). $
Vì vậy, $A M$ lớn nhất (nhỏ nhất) khi $A'M$ lớn nhất (nhỏ nhất).
]

#block(sticky:true,above:3mm,below:1mm)[*Mô hình 4.* Cho đường tròn $lr(( C _(1) ))$ tâm $I _(1)$, bán kính $R _(1)$ và đường tròn $lr(( C _(2) ))$ tâm $I _(2)$ , bán kính $R _(2)$ cùng nằm trong mặt phẳng (P). Biết điểm M thay đổi trên $lr(( C _(1) ))$, N thay đổi trên $lr(( C _(2) ))$.]

Nếu 2 đường tròn ngoài nhau, không có điểm chung ($I _(1) I _(2) > R _(1) + R _(2)$)

#block(width:100%,breakable:false,above:2mm,below:2mm,align(center,scale(x:75%,y:75%,reflow:true,diagram("circles-apart"))))

#theory-box(title:[Kết luận],breakable:true)[
Khi đó: $cases(display(M N _(max) = I _(1) I _(2) + R _(1) + R _(2)), display(M N _(min) = I _(1) I _(2) - R _(1) - R _(2)))$
]

Nếu 2 đường tròn có điểm chung ($abs(R _(1) - R _(2)) ≤ I _(1) I _(2) ≤ R _(1) + R _(2)$)

#block(width:100%,breakable:false,above:2mm,below:2mm,align(center,scale(x:75%,y:75%,reflow:true,diagram("circles-meet"))))

#theory-box(title:[Kết luận],breakable:true)[
Khi đó: $cases(display(M N _(max) = I _(1) I _(2) + R _(1) + R _(2)), display(M N _(min) = 0))$
]

#block(sticky:true,above:3mm,below:1mm)[*Mô hình 5.* Cho điểm A cố định và mặt phẳng (P), điểm M thay đổi trên (P).]

#block(width:100%,breakable:false,above:2mm,below:2mm,align(center,scale(x:65%,y:65%,reflow:true,diagram("point-plane"))))

#theory-box(title:[Kết luận],breakable:true)[
$⇒ A M _(min) = d lr(( A ";" lr(( P )) ))$ khi $M$ là hình chiếu vuông góc của $A$ trên $lr(( P ))$
]

#block(sticky:true,above:3mm,below:1mm)[*Mô hình 6.* $lr(( P ))$ thay đổi chứa $M$ sao cho $d lr(( A ";" lr(( P )) ))$ là lớn nhất]

#block(width:100%,breakable:false,above:2mm,below:2mm,align(center,scale(x:65%,y:65%,reflow:true,diagram("plane-max"))))

#theory-box(title:[Kết luận],breakable:true)[
$ d(A;(P))=A H<=A M. $
Khoảng cách lớn nhất bằng $A M$ khi $A M perp (P)$.
]

Khi đó $arrow(A M)$ là vecto pháp tuyến của $lr(( P ))$

#block(sticky:true,above:3mm,below:1mm)[*Mô hình 7.* Cho $A$ cố định ; $d$ cố định.]

#block(width:100%,breakable:false,above:2mm,below:2mm,align(center,scale(x:65%,y:65%,reflow:true,diagram("plane-line"))))

#theory-box(title:[Kết luận],breakable:true)[
Mặt phẳng $lr(( P ))$ thay đổi chứa $d$ sao cho $d lr(( A ";" lr(( P )) ))$ đạt max khi $A H ⊥ lr(( P ))$ và $H$ là hình chiếu của $A$ trên $d$
]

]