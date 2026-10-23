#import "/templates/lesson.typ": exercise, lesson-section
#import "theory.typ": theory-one, theory-two
#import "solutions.typ": solutions
#let questions(variant) = {
  set par(justify: false)
  let item = exercise.with(
    variant: variant,
    question-gap: 7mm,
    keep-together: false,
    flow-stem: true,
    keep-solution-start: false,
    writing-line-gap: 9mm,
    writing-single-page: true,
    fill-writing-page: true,
  )
  [
    #lesson-section([BÀI TOÁN XÁC ĐỊNH GÓC], number: 1)
    #theory-one()
    #item(
      "1",
      [Cho $d : cases(display(x = 1 + t), display(y = - 3 - t), display(z = 2 + 2 t)) "," d ' : frac(x, 3) = frac(y - 3, - 1) = frac(z - 1, 1)$. Khi đó côsin giữa $d$ và $d '$ là],
      answers: ([$frac(sqrt(30), 30)$.], [$frac(sqrt(30), 3)$.], [$frac(sqrt(66), 11)$.], [$frac(sqrt(57), 14)$.]),
      source-id: "bai-hoc-1",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-1"),
    )
    #item(
      "2",
      [Cho hai mặt phẳng $lr(( P )) : x + z - 1 = 0$ và $lr(( Q )) : x - 4 y - z = 2$. Góc giữa 2 mặt phẳng $lr(( P ))$ và  $lr(( Q ))$ bằng?],
      answers: (),
      source-id: "bai-hoc-2",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-2"),
    )
    #item(
      "3",
      [Cho đường thẳng $Δ : frac(x, 1) = frac(y, 2) = frac(z - 1, - 1)$ và mặt phẳng $lr(( P )) : x - y + z = 1$. Góc giữa đường thẳng $Δ$ và mặt phẳng $lr(( P ))$ bằng?],
      answers: (),
      source-id: "bai-hoc-3",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-3"),
    )
    #item(
      "4",
      [Cho mặt phẳng $lr(( P )) : 3 x + 4 y + 5 z + 2 = 0$ và đường thẳng $d$ là giao tuyến của hai mặt phẳng $lr(( α )) : x - 2 y + 1 = 0$ và mặt phẳng $lr(( β )) : x - 2 z - 3 = 0$. Hãy tính số đo góc $α$ giữa đường thẳng $d$ và mặt phẳng $lr(( P ))$?],
      answers: (),
      source-id: "bai-hoc-4",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-4"),
    )
    #lesson-section([BÀI TOÁN TÍNH KHOẢNG CÁCH], number: 2)
    #theory-two()
    #item(
      "5",
      [Trong không gian  với hệ tọa độ $O x y z$, khoảng cách từ điểm $M lr(( 1 ";" 3 ";" 2 ))$ đến đường thẳng $Δ : cases(display(x = 1 + t), display(y = 1 + t), display(z = - t))$ bằng:],
      answers: ([$sqrt(2)$], [$2$], [$2 sqrt(2)$ ], [$3$]),
      source-id: "bai-hoc-5",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-5"),
    )
    #item(
      "6",
      [Tính khoảng cách giữa hai đường thẳng $d_(1)$:$frac(x, 1) = frac(y - 3, 2) = frac(z - 2, 1)$ và $d_(2)$:$frac(x - 3, 1) = frac(y + 1, - 2) = frac(z - 2, 1)$],
      answers: ([$frac(sqrt(2), 3)$.], [$frac(12, 5)$.], [$frac(3 sqrt(2), 2)$.], [$3$.]),
      source-id: "bai-hoc-6",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-6"),
    )
    #item(
      "7",
      [Viết phương trình mặt cầu $lr(( S ))$ tâm $I lr(( 2 ";" 3 ";" - 1 ))$ sao cho $lr(( S ))$ cắt đường thẳng $d : frac(x - 11, 2) = frac(y, 1) = frac(z + 25, - 2)$ tại $A$ và $B$ để $A B = 16$.],
      answers: (),
      source-id: "bai-hoc-7",
      writing-lines: 8,
      solution: solutions.at("bai-hoc-7"),
    )
    #item(
      "8",
      [Trong không gian $O x y z$, bán kính mặt cầu tâm $I lr(( 1 ";" 3 ";" 5 ))$ và tiếp xúc với đường thẳng $d : frac(x, 1) = frac(y + 1, - 1) = frac(z - 2, - 1)$ bằng?],
      answers: ([$sqrt(7)$], [$sqrt(14)$], [$7$ ], [$14$]),
      source-id: "bai-hoc-8",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-8"),
    )
    #item(
      "9",
      [Trong không gian $O x y z$, cho mặt phẳng $lr(( P )) : x + 2 y + 2 z - 7 = 0$ và đường thẳng $d : frac(x - 1, 2) = frac(y + 1, 2) = frac(z + 2, 1)$. Gọi $I$ là giao điểm của đường thẳng $d$ và $lr(( P ))$, $M$ là một điểm thuộc $d$ sao cho $I M = 9$. Tính khoảng cách từ điểm $M$ đến mặt phẳng $lr(( P ))$?],
      answers: ([$3 sqrt(2)$], [$2 sqrt(5)$], [$sqrt(15)$ ], [$8$]),
      source-id: "bai-hoc-9",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-9"),
    )
    #lesson-section([BÀI TẬP TỰ LUYỆN], badge: [3])
    #item(
      "1",
      [Cho $d : cases(display(x = 1 + t), display(y = - 3), display(z = 2 + 2 t)) "," d ' : frac(x, 2) = frac(y - 3, - 2) = frac(z - 1, 1)$. Khi đó côsin giữa $d$ và $d '$ là],
      answers: ([$frac(sqrt(5), 15)$.], [$frac(4 sqrt(5), 15)$.], [$frac(2 sqrt(15), 11)$.], [$frac(sqrt(57), 15)$.]),
      source-id: "tu-luyen-1",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-1"),
    )
    #item(
      "2",
      [Cho hai mặt phẳng $lr(( P )) : 2 x + z - 1 = 0$ và $lr(( Q )) : x - 2 y + 2 z = 5$. Côsin góc giữa 2 mặt phẳng $lr(( P ))$ và  $lr(( Q ))$ bằng?],
      answers: (),
      source-id: "tu-luyen-2",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-2"),
    )
    #item(
      "3",
      [Trong không gian với hệ tọa độ Oxyz cho đường thẳng $d : cases(x = 1 - t, y = 2 + 2 t, z = 3 + t)$ và mặt phẳng (P):$x - y + 3 = 0$. Tính số đo góc giữa đường thẳng d và mặt phẳng (P).],
      answers: ([$60 degree$], [$30 degree$], [$120 degree$], [$45 degree$]),
      source-id: "tu-luyen-3",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-3"),
    )
    #item(
      "4",
      [Trong không gian $O x y z$, cho mặt phẳng (P): $- sqrt(3) x + y + 1 = 0$. Tính góc tạo bởi $( P )$ với trục $O x$?],
      answers: ([$60 degree$.], [$30 degree$.], [$120 degree$.], [$150 degree$.]),
      source-id: "tu-luyen-4",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-4"),
    )
    #item(
      "5",
      [Trong không gian với hệ tọa độ $O x y z$, cho mặt phẳng $lr(( P )) : 2 x - 2 y - z + 1 = 0$ và đường thẳng $Δ : frac(x - 1, 2) = frac(y + 2, 1) = frac(z - 1, 2)$. Tính khoảng cách $d$ giữa $Δ$ và $lr(( P ))$.],
      answers: ([$d = 2$], [$d = frac(5, 3)$], [$d = frac(2, 3)$], [$d = frac(1, 3)$]),
      source-id: "tu-luyen-5",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-5"),
    )
    #item(
      "6",
      [Trong không gian với hệ tọa độ $O x y z$, cho đường thẳng $lr(( d )) : frac(x - 3, - 2) = frac(y, - 1) = frac(z - 1, 1)$ và điểm $A ( 2 ";" - 1 ";" 0 )$. Khoảng cách từ điểm $A$ đến đường thẳng $lr(( d ))$ bằng],
      answers: ([$sqrt(7)$.], [$frac(sqrt(7), 2)$.], [$frac(sqrt(21), 3)$.], [$frac(sqrt(7), 3)$.]),
      source-id: "tu-luyen-6",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-6"),
    )
    #item(
      "7",
      [Cho $d : cases(display(x = 1 + t), display(y = - 3 - t), display(z = 2 + 2 t)) "," d ' : frac(x, 3) = frac(y - 3, - 1) = frac(z - 1, 1)$. Khi đó khoảng cách giữa $d$ và $d '$ là],
      answers: ([$frac(13 sqrt(30), 30)$.], [$frac(sqrt(30), 3)$.], [$frac(9 sqrt(30), 10)$.], [$0$.]),
      source-id: "tu-luyen-7",
      writing-lines: 8,
      solution: solutions.at("tu-luyen-7"),
    )
    #item(
      "8",
      [Trong không gian $O x y z$, cho mặt cầu $lr(( S )) : x^(2) + y^(2) + z^(2) + 4 x - 6 y + m = 0$ ($m$ là tham số) và đường thẳng $Δ : cases(display(x = 4 + 2 t), display(y = 3 + t), display(z = 3 + 2 t))$. Biết đường thẳng $Δ$ cắt $lr(( S ))$ tại hai điểm phân biệt $A "," B$ sao cho $A B = 8$. Tìm $m$?],
      answers: ([$m = 5$], [$m = 12$], [$m = - 12$ ], [$m = - 10$]),
      source-id: "tu-luyen-8",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-8"),
    )
    #item(
      "9",
      [Trong không gian với hệ tọa độ $O x y z$ cho đường thẳng $d : frac(x - 5, 2) = frac(y + 7, 2) = frac(z - 12, - 1)$ và mặt phẳng $lr(( α )) : x + 2 y - 3 z - 3 = 0$. Gọi $M$ là giao điểm của $d$ và $lr(( α ))$, $A$ thuộc $d$ sao cho $A M = sqrt(14)$. Tính khoảng cách từ $A$ đến mặt phẳng $lr(( α ))$.],
      answers: ([$2$.], [$3$.], [$6$.], [$sqrt(14)$.]),
      source-id: "tu-luyen-9",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-9"),
    )
    #item(
      "10",
      [Trong không gian $O x y z$, cho đường thẳng $Δ : frac(x, 2) = frac(y, 2) = frac(z, 1)$ và mặt phẳng $lr(( P )) : x + 2 y - 2 z = 0$. Gọi $lr(( Q ))$ là mặt phẳng chứa $Δ$ sao cho góc giữa mặt phẳng $lr(( P ))$ và $lr(( Q ))$ là nhỏ nhất. Phương trình mặt phẳng $lr(( Q ))$ là:],
      answers: ([$x - 2 y + z = 0$ ], [$x + 22 y + 10 z = 0$], [$x - 2 y - z = 0$  ], [$x + 10 y - 22 z = 0$]),
      source-id: "tu-luyen-10",
      writing-lines: 8,
      solution: solutions.at("tu-luyen-10"),
    )
  ]
}
