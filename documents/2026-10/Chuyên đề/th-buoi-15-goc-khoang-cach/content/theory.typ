#import "/templates/lesson.typ": formula, paragraph, theory-box
#import "../figures.typ": diagram
#let theory-one() = theory-box(title: [LÝ THUYẾT CẦN NHỚ])[
  #paragraph(keep-next: true)[*a) Góc giữa hai đường thẳng*]
  #diagram("line-angle", width: 77mm)
  #paragraph[Cho hai đường thẳng $Delta,d$ có vectơ chỉ phương lần lượt là $arrow(u)_Delta,arrow(u)_d$.]
  #formula((
    $cos(Delta, d)=abs(cos(arrow(u)_Delta, arrow(u)_d))=(abs(arrow(u)_Delta dot arrow(u)_d))/(abs(arrow(u)_Delta) dot abs(arrow(u)_d)).$,
  ))
  #paragraph(keep-next: true)[*b) Góc giữa mặt phẳng và đường thẳng*]
  #diagram("line-plane", width: 90mm)
  #paragraph[Cho đường thẳng $d$ có vectơ chỉ phương $arrow(u)_d=(x_1;y_1;z_1)$ và mặt phẳng $(P)$ có vectơ pháp tuyến $arrow(n)_P=(x_2;y_2;z_2)$.]
  #formula((
    $sin(d, (P))=abs(cos(arrow(u)_d, arrow(n)_P))=(abs(arrow(u)_d dot arrow(n)_P))/(abs(arrow(u)_d) dot abs(arrow(n)_P))$,
    $=(abs(x_1 x_2+y_1 y_2+z_1 z_2))/(sqrt(x_1^2+y_1^2+z_1^2) dot sqrt(x_2^2+y_2^2+z_2^2)).$,
  ))
  #paragraph[– Nếu $sin(d, (P))=1$ thì góc bằng $90 degree$, suy ra $d perp (P)$.]
  #paragraph[– Nếu $sin(d, (P))=0$ thì góc bằng $0 degree$, suy ra $d parallel (P)$ hoặc $d subset (P)$.]
  #paragraph(keep-next: true)[*c) Góc giữa hai mặt phẳng*]
  #diagram("plane-angle", width: 90mm)
  #paragraph[Cho hai mặt phẳng $(P),(Q)$ có vectơ pháp tuyến lần lượt là $arrow(n)_P,arrow(n)_Q$.]
  #formula((
    $cos((P), (Q))=abs(cos(arrow(n)_P, arrow(n)_Q))=(abs(arrow(n)_P dot arrow(n)_Q))/(abs(arrow(n)_P) dot abs(arrow(n)_Q)).$,
  ))
]
#let theory-two() = theory-box(title: [LÝ THUYẾT CẦN NHỚ])[
  #paragraph(keep-next: true)[*a) Khoảng cách từ một điểm đến một đường thẳng*]
  #diagram("point-line", width: 78mm)
  #paragraph[Cho điểm $M$ và đường thẳng $Delta$. Lấy điểm $A in Delta$; gọi $arrow(u)_Delta$ là vectơ chỉ phương của $Delta$.]
  #formula(($d(M,Delta)=(abs([arrow(A M),arrow(u)_Delta]))/(abs(arrow(u)_Delta)).$,))
  #paragraph(keep-next: true)[*b) Khoảng cách giữa hai đường thẳng chéo nhau*]
  #diagram("skew-lines", width: 90mm)
  #paragraph[Cho $d$ đi qua $M$ và có vectơ chỉ phương $arrow(u)$; $d'$ đi qua $M'$ và có vectơ chỉ phương $arrow(u)'$.]
  #formula(($d(d,d')=(abs([arrow(u),arrow(u)'] dot arrow(M M')))/(abs([arrow(u),arrow(u)'])).$,))
  #paragraph(keep-next: true)[*c) Khoảng cách từ một điểm đến một mặt phẳng*]
  #paragraph[Cho điểm $M(x_0;y_0;z_0)$ và mặt phẳng $(P):A x+B y+C z+D=0$.]
  #formula(($d(M,(P))=(abs(A x_0+B y_0+C z_0+D))/(sqrt(A^2+B^2+C^2)).$,))
  #paragraph(keep-next: true)[*d) Khoảng cách hai điểm*]
  #formula(($A B=sqrt((x_B-x_A)^2+(y_B-y_A)^2+(z_B-z_A)^2).$,))
]
