#import "/templates/lesson.typ": exercise
#import "/templates/components.typ": end-mark, figure-panel
#import "../figures.typ": cube
#let questions(variant) = {
  let base-item = exercise.with(
    variant: variant,
    keep-together: false,
    flow-stem: true,
    question-gap: 4mm,
    statement-gap: 3mm,
    writing-line-gap: 8mm,
    writing-single-page: true,
    writing-lines: 3,
  )
  let item(number, body, source-id: none, statements: ()) = {
    if variant == "de-cach" and number > 1 { pagebreak() }
    let rows = grid(columns: (1fr,), row-gutter: 2mm, ..statements)
    let figure = if number == 3 { cube() }
      else { none }
    let prompt = if number == 1 { body } else [
      #body
      #v(3mm)
      #if number == 3 {
        grid(columns: (1fr, if number == 3 { 49mm } else { 49mm }), gutter: 6mm, align: top, rows,
          align(right, scale(x: if number == 3 { 57% } else { 57% }, y: if number == 3 { 57% } else { 57% }, reflow: true, figure)))
      } else {
        rows
      }
    ]
    base-item(number, prompt, source-id: source-id, keep-together: number < 3,
      writing-single-page: number < 3, writing-keep-prompt: number < 3, writing-flow-prompt: number >= 3,
      statements: if number == 1 { statements } else { () })
  }
  item(
    1,
    [*(THPT THĂNG LONG – HÀ NỘI 2026–2027)* Trong không gian $O x y z$, cho tam giác $A B C$ biết $A(7;3;3)$, $B(1;2;4)$, $C(2;3;5)$.
    ],
    source-id: "question-1",
    statements: (
      [a) $sin hat(B A C) = sqrt(37/551)$.],
      [b) $arrow(A B) dot arrow(A C) = 32$.],
      [c) Để tứ giác $A B D C$ là hình bình hành thì tọa độ điểm $D$ là $(8;4;4)$.],
      [d) Gọi $H(a;b;c)$ là chân đường cao kẻ từ $A$ của tam giác $A B C$. Khi đó $2a - 5b + c = -8$.],
    ),
  )
  item(
    2,
    [*(THPT LẠNG GIANG SỐ 1 – BẮC NINH 2025–2026)* Cho hình lăng trụ tam giác đều $A B C.A' B' C'$ có $A B = a$ và $A A' = a sqrt(2)$. Các mệnh đề dưới đây đúng hay sai?
    ],
    source-id: "question-2",
    statements: (
      [a) $arrow(A C) = arrow(A B) + arrow(B C)$.],
      [b) Gọi $M$ là trung điểm $B C$ khi đó $arrow(A' M) = arrow(A' A) + arrow(A' B') - arrow(C M)$.],
      [c) $arrow(A' M) dot arrow(A C) = (a^2 sqrt(3))/4$.],
      [d) Góc giữa vectơ $arrow(A B')$ và $arrow(B C')$ bằng $60 degree$.],
    ),
  )
  item(
    3,
    [*(THPT CHUYÊN BIÊN HÒA – NINH BÌNH 2025–2026)* Trong không gian, cho hình lập phương $A B C D.A' B' C' D'$ có cạnh bằng $a$. Gọi $I$ là tâm hình vuông $A B C D$, gọi $G$ là trọng tâm của tam giác $A B' C$ (tham khảo hình vẽ).
    ],
    source-id: "question-3",
    statements: (
      [a) $arrow(A B) - arrow(A C) = arrow(B' C')$.],
      [b) $arrow(B' D) + arrow(B' B) = 4 arrow(B' G)$.],
      [c) $arrow(B' G) = -1/3 arrow(A B) + 1/3 arrow(A D) - 2/3 arrow(A A')$.],
      [d) $arrow(B' G) dot arrow(A C') = 2/3 a^2$.],
    ),
  )
  item(
    4,
    [*(THPT Đào Duy Từ – Thanh Hóa 2025)* Trong không gian với hệ tọa độ $O x y z$, cho tam giác $A B C$ với $A(4;0;2)$, $B(1;-4;-2)$, $C(2;1;1)$.
    ],
    source-id: "question-4",
    statements: (
      [a) Tọa độ trọng tâm tam giác $A B C$ là $G(7/3;-1;1/3)$.],
      [b) Điểm $D$ thỏa mãn $A B D C$ là hình bình hành, khi đó tọa độ điểm $D$ là $D(5;5;5)$.],
      [c) Tam giác $A B C$ là tam giác tù.],
      [d) Gọi điểm $E(a;b;c)$ là giao điểm của đường thẳng $B C$ với mặt phẳng tọa độ $(O x z)$, khi đó $(2a)/c + b = 9/2$.],
    ),
  )
  item(
    5,
    [*(THPT Triệu Sơn 3 – Thanh Hóa 2025)* Trong không gian với hệ tọa độ $O x y z$, cho $triangle A B C$ với $A(1;-3;3)$, $B(2;-4;5)$, $C(3;-2;1)$.
    ],
    source-id: "question-5",
    statements: (
      [a) $arrow(A B) = (-1;1;-2)$.],
      [b) Điểm $G(a;b;c)$ là trọng tâm tam giác $A B C$ thì $a+b+c=2$.],
      [c) Điểm $I(x;y;z)$ thỏa mãn $2 arrow(I A) + arrow(I B) + 3 arrow(I C) = 0$, khi đó $2x+y+z=4$.],
      [d) Gọi $M(x;y;z)$ là điểm trên mặt phẳng tọa độ $(O y z)$ sao cho $P=-2M A^2 - M B^2 - 3M C^2$ đạt giá trị lớn nhất. Khi đó $x+y-z < -5$.],
    ),
  )
  if variant == "de" {
    v(1fr)
    end-mark([])
  }
}
