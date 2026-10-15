#import "/templates/lesson.typ": lesson,lesson-heading,lesson-section,theory-box,paragraph,formula
#import "/templates/components.typ": end-mark
#import "figures.typ": normal-plane
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#show: lesson.with([BUỔI 12: CÁC CÁCH VIẾT PHƯƠNG TRÌNH MẶT PHẲNG],variant:variant,
 heading-content:lesson-heading([KHOÁ TINH HOA TOÀN DIỆN 9+ 2027],
 [BUỔI 12: CÁC CÁCH VIẾT\ PHƯƠNG TRÌNH MẶT PHẲNG],subtitle:[CHUYÊN ĐỀ: HÌNH TỌA ĐỘ OXYZ]))
#lesson-section([LÝ THUYẾT CẦN NHỚ],badge:[A])
#theory-box(title:[1. Mặt phẳng qua một điểm, biết vectơ pháp tuyến])[
 #align(center,normal-plane())
 #paragraph[Với $arrow(n)=(A;B;C) != arrow(0)$, giá của $arrow(n)$ vuông góc với $(P)$ thì $arrow(n)$ là vectơ pháp tuyến của $(P)$.]
 #paragraph[Mặt phẳng $(P)$ đi qua $M(x_0;y_0;z_0)$, nhận $arrow(n)$ làm vectơ pháp tuyến. Với $N(x;y;z) in (P)$, ta có $arrow(M N) perp arrow(n)$.]
 #formula(($arrow(M N) dot arrow(n)=0$,$⇔ A(x-x_0)+B(y-y_0)+C(z-z_0)=0.$))
]
#theory-box(title:[2. Phương trình tổng quát của mặt phẳng])[
 #paragraph[$A x+B y+C z+D=0$, trong đó $A^2+B^2+C^2>0$.]
 Một vectơ pháp tuyến của mặt phẳng là $arrow(n)=(A;B;C)$.
]
#theory-box(title:[3. Phương trình mặt phẳng theo đoạn chắn])[
 #paragraph[Mặt phẳng qua $A(a;0;0)$, $B(0;b;0)$, $C(0;0;c)$, với $a b c != 0$, có phương trình:]
 $ x/a+y/b+z/c=1. $
]
#questions(variant)
#if variant != "de-cach" {v(1fr);end-mark([])}
