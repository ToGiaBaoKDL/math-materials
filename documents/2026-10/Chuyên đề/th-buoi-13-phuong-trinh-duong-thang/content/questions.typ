#import "/templates/lesson.typ": exercise, formula, lesson-section, paragraph
#import "solutions.typ": solutions

#let questions(variant) = {
  let item = exercise.with(
    variant: variant,
    question-gap: 6.5mm,
    keep-together: false,
    flow-stem: true,
    keep-solution-start: false,
    writing-line-gap: 9mm,
    writing-single-page: true,
    fill-writing-page: true,
  )
  [
    #lesson-section([NHẬN DIỆN PHƯƠNG TRÌNH ĐƯỜNG THẲNG], number: 1)

    #item(
      "1",
      [
        Trong không gian $O x y z$, cho đường thẳng $d : frac(x - 3, 2) = frac(y - 4, - 5) = frac(z + 1, 3)$. Vecto nào dưới đây là một vecto chỉ phương của $d$?
      ],
      answers: (
        [$arrow(u_(2)) lr(( 2 ";" 4 ";" - 1 ))$.],
        [$arrow(u_(1)) lr(( 2 ";" - 5 ";" 3 ))$.],
        [$arrow(u_(3)) lr(( 2 ";" 5 ";" 3 ))$.],
        [$arrow(u_(4)) lr(( 3 ";" 4 ";" 1 ))$.],
      ),
      source-id: "bai-hoc-1",
      writing-lines: 3,
      solution: solutions.at("bai-hoc-1"),
    )

    #item(
      "2",
      [
        Trong không gian $O x y z$, đường thẳng $d : cases(display(x = 2 - t), display(y = 1 + 2 t), display(z = 3 + t))$ có một vectơ chỉ phương là:
      ],
      answers: (
        [$arrow(u_(1)) = lr(( - 1 ";" 2 ";" 3 ))$],
        [$arrow(u_(3)) = lr(( 2 ";" 1 ";" 3 ))$],
        [$arrow(u_(4)) = lr(( - 1 ";" 2 ";" 1 ))$],
        [$arrow(u_(2)) = lr(( 2 ";" 1 ";" 1 ))$],
      ),
      source-id: "bai-hoc-2",
      writing-lines: 3,
      solution: solutions.at("bai-hoc-2"),
    )

    #item(
      "3",
      [
        Trong không gian với hệ toạ độ $O x y z$, cho hai điểm $A lr(( 1 ";" 1 ";" 0 ))$ và $B lr(( 0 ";" 1 ";" 2 ))$. Vectơ nào dưới đây là một vectơ chỉ phương của đường thẳng $A B$.
      ],
      answers: (
        [$arrow(d) = lr(( - 1 ";" 1 ";" 2 ))$],
        [$arrow(a) = lr(( - 1 ";" 0 ";" - 2 ))$],
        [$arrow(b) = lr(( - 1 ";" 0 ";" 2 ))$],
        [$arrow(c) = lr(( 1 ";" 2 ";" 2 ))$],
      ),
      source-id: "bai-hoc-3",
      writing-lines: 3,
      solution: solutions.at("bai-hoc-3"),
    )

    #item(
      "4",
      [
        Trong không gian $O x y z$, điểm nào dưới đây thuộc đường thẳng $d : frac(x + 1, - 1) = frac(y - 2, 3) = frac(z - 1, 3)$?
      ],
      answers: (
        [$P lr(( - 1 ";" 2 ";" 1 ))$.],
        [$Q lr(( 1 ";" - 2 ";" - 1 ))$.],
        [$N lr(( - 1 ";" 3 ";" 2 ))$.],
        [$P lr(( 1 ";" 2 ";" 1 ))$.],
      ),
      source-id: "bai-hoc-4",
      writing-lines: 3,
      solution: solutions.at("bai-hoc-4"),
    )

    #item(
      "5",
      [
        Trong không gian tọa độ $O x y z$,  phương trình nào dưới đây là phương trình chính tắc của đường thẳng $d : cases(display(x = 1 + 2 t), display(y = 3 t), display(z = - 2 + t)) ?$
      ],
      answers: (
        [$frac(x + 1, 2) = frac(y, 3) = frac(z - 2, 1)$],
        [$frac(x - 1, 1) = frac(y, 3) = frac(z + 2, - 2)$],
        [$frac(x + 1, 2) = frac(y, 3) = frac(z - 2, - 2)$],
        [$frac(x - 1, 2) = frac(y, 3) = frac(z + 2, 1)$],
      ),
      source-id: "bai-hoc-5",
      writing-lines: 3,
      solution: solutions.at("bai-hoc-5"),
    )

    #item(
      "6",
      [
        Trong không gian với hệ trục tọa độ $O x y z$, phương trình tham số trục $O z$ là
      ],
      answers: (
        [$z = 0$.],
        [$cases(display(x = 0), display(y = t), display(z = 0))$.],
        [$cases(display(x = t), display(y = 0), display(z = 0))$.],
        [$cases(display(x = 0), display(y = 0), display(z = t))$.],
      ),
      source-id: "bai-hoc-6",
      writing-lines: 3,
      solution: solutions.at("bai-hoc-6"),
    )

    #lesson-section([VIẾT PHƯƠNG TRÌNH ĐƯỜNG THẲNG], number: 2)

    #item(
      "7",
      [
        (Viết phương trình đường thẳng đi qua 2 điểm cho trước)#linebreak()
        Trong không gian $O x y z$, viết phương trình đường thẳng đi qua hai điểm $P lr(( 1 ";" 1 ";" - 1 ))$ và $Q lr(( 2 ";" 3 ";" 2 ))$
      ],
      answers: (
        [$frac(x - 1, 2) = frac(y - 1, 3) = frac(z + 1, 2)$],
        [$frac(x - 1, 1) = frac(y - 1, 2) = frac(z + 1, 3)$],
        [$frac(x - 1, 1) = frac(y - 2, 1) = frac(z - 3, - 1)$],
        [$frac(x + 2, 1) = frac(y + 3, 2) = frac(z + 2, 3)$],
      ),
      source-id: "bai-hoc-7",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-7"),
    )

    #item(
      "8",
      [
        (Viết phương trình đường thẳng đi qua 1 điểm và song song với đường thẳng cho trước)#linebreak()
        Trong không gian $O x y z$, cho $A lr(( 1 ";" - 2 ";" - 3 ))$, $B lr(( - 1 ";" 4 ";" 1 ))$ và đường thẳng $d : frac(x + 2, 1) = frac(y - 2, - 1) = frac(z + 3, 2)$. Phương trình nào dưới đây là phương trình của đường thẳng đi qua trung điểm của $A B$ và song song với $d$?
      ],
      answers: (
        [$frac(x, 1) = frac(y - 1, 1) = frac(z + 1, 2)$],
        [$frac(x, 1) = frac(y - 1, - 1) = frac(z + 1, 2)$],
        [$frac(x - 1, 1) = frac(y - 1, 1) = frac(z + 1, 2)$],
        [$frac(x, 1) = frac(y - 1, - 1) = frac(z + 2, 2)$],
      ),
      source-id: "bai-hoc-8",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-8"),
    )

    #item(
      "9a",
      [
        (Viết phương trình đường thẳng đi qua 1 điểm và vuông góc với mặt phẳng cho trước)#linebreak()
        Trong không gian với hệ toạ độ $O x y z$, phương trình nào dưới đây là phương trình đường thẳng qua $A lr(( 2 ";" 3 ";" 0 ))$ và vuông góc với $lr(( P )) : x + 3 y - z + 5 = 0$
      ],
      answers: (
        [$cases(display(x = 1 + t), display(y = 1 + 3 t), display(z = 1 - t))$],
        [$cases(display(x = 1 + t), display(y = 3 t), display(z = 1 - t))$],
        [$cases(display(x = 1 + 3 t), display(y = 1 + 3 t), display(z = 1 - t))$],
        [$cases(display(x = 1 + 3 t), display(y = 1 + 3 t), display(z = 1 + t))$],
      ),
      source-id: "bai-hoc-9a",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-9a"),
    )

    #item(
      "9b",
      [
        Trong không gian $O x y z$, cho các điểm $A lr(( 1 ";" 0 ";" 2 ))$, $B lr(( 1 ";" 2 ";" 1 ))$, $C lr(( 3 ";" 2 ";" 0 ))$ và $D lr(( 1 ";" 1 ";" 3 ))$. Đường thẳng đi qua $A$ và vuông góc với $lr(( B C D ))$ là:
      ],
      answers: (
        [$cases(display(x = 1 - t), display(y = 4 t), display(z = 2 + 2 t))$],
        [$cases(display(x = 1 + t), display(y = 4), display(z = 2 + 2 t))$],
        [$cases(display(x = 2 + t), display(y = 4 + 4 t), display(z = 4 + 2 t))$],
        [$cases(display(x = 1 - t), display(y = 2 - 4 t), display(z = 2 - 2 t))$],
      ),
      source-id: "bai-hoc-9b",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-9b"),
    )

    #item(
      "10a",
      [
        (Viết phương trình đường thẳng khi biết 1 cặp vecto pháp tuyến)#linebreak()
        Trong không gian $O x y z$, cho $M lr(( - 1 ";" 1 ";" 3 ))$ và hai đường thẳng $Δ : frac(x - 1, 3) = frac(y + 3, 2) = frac(z - 1, 1)$, $Δ ' : frac(x + 1, 1) = frac(y, 3) = frac(z, - 2)$. Phương trình nào dưới đây là phương trình đi qua $M$ và đồng thời vuông góc với $Δ$ và $Δ '$?
      ],
      answers: (
        [$cases(display(x = - 1 - t), display(y = 1 + t), display(z = 1 + 3 t))$],
        [$cases(display(x = - t), display(y = 1 + t), display(z = 3 + t))$],
        [$cases(display(x = - 1 - t), display(y = 1 - t), display(z = 3 + t))$],
        [$cases(display(x = - 1 - t), display(y = 1 + t), display(z = 3 + t))$],
      ),
      source-id: "bai-hoc-10a",
      writing-lines: 5,
      solution: solutions.at("bai-hoc-10a"),
    )

    #item(
      "10b",
      [
        Trong không gian $O x y z$, cho $A lr(( 1 ";" - 2 ";" 3 ))$ và hai mặt phẳng $lr(( P )) : x + y + z + 1 = 0$, $lr(( Q )) : x - y + z - 2 = 0$. Phương trình nào dưới đây là phương trình đường thẳng đi qua $A$ và song song với $lr(( P ))$ và $lr(( Q ))$.
      ],
      answers: (
        [$cases(display(x = 1 + t), display(y = - 2), display(z = 3 - t))$],
        [$cases(display(x = - 1 + t), display(y = 2), display(z = - 3 - t))$],
        [$cases(display(x = 1 + 2 t), display(y = - 2), display(z = 3 + 2 t))$],
        [$cases(display(x = 1), display(y = - 2), display(z = 3 - 2 t))$],
      ),
      source-id: "bai-hoc-10b",
      writing-lines: 7,
      solution: solutions.at("bai-hoc-10b"),
    )

    #item(
      "11c",
      [
        Trong không gian với hệ toạ độ $O x y z$, gọi $d$ là giao tuyến của hai mặt phẳng $lr(( α )) : x - 3 y + z = 0$ và $lr(( α ' )) : x + y - z + 4 = 0$. Viết phương trình tham số của đường thẳng $d ?$
      ],
      answers: (
        [$cases(display(x = - 2 + t), display(y = t), display(z = - 2 t))$],
        [$cases(display(x = - 2 + t), display(y = - t), display(z = 2 t))$],
        [$cases(display(x = - 2 + t), display(y = t), display(z = 2 + 2 t))$],
        [$cases(display(x = - t), display(y = t), display(z = 2 + 2 t))$],
      ),
      source-id: "bai-hoc-11c",
      writing-lines: 7,
      solution: solutions.at("bai-hoc-11c"),
    )

    #item(
      "12a",
      [
        (Giả thiết cho đường thẳng cần viết phương trình sẽ cắt một đường thẳng cho trước)#linebreak()
        Trong không gian với hệ toạ độ $O x y z$, cho $A lr(( 1 ";" 2 ";" 3 ))$ và đường thẳng $d : frac(x - 3, 2) = frac(y - 1, 1) = frac(z + 7, - 2)$. Đường thẳng đi qua $A$,  vuông góc với $d$ và cắt trục $O x$ có phương trình là:
      ],
      answers: (
        [$cases(display(x = - 1 + 2 t), display(y = - 2 t), display(z = t))$],
        [$cases(display(x = 1 + t), display(y = 2 + 2 t), display(z = 3 + 2 t))$],
        [$cases(display(x = - 1 + 2 t), display(y = 2 t), display(z = 3 t))$],
        [$cases(display(x = 1 + t), display(y = 2 + 2 t), display(z = 3 + 2 t))$],
      ),
      source-id: "bai-hoc-12a",
      writing-lines: 7,
      solution: solutions.at("bai-hoc-12a"),
    )

    #item(
      "12b",
      [
        Trong không gian với hệ toạ độ $O x y z$, cho $A lr(( 1 ";" 0 ";" 2 ))$ và đường thẳng $d : frac(x - 1, 1) = frac(y, 1) = frac(z + 1, 2)$. Viết phương trình đường thẳng $Δ$ đi qua $A$,  vuông góc và cắt $d$ .
      ],
      answers: (
        [$frac(x - 1, 2) = frac(y, 2) = frac(z - 2, 1)$],
        [$frac(x - 1, 1) = frac(y, - 3) = frac(z - 2, 1)$],
        [$frac(x - 1, 1) = frac(y, 1) = frac(z - 2, 1)$],
        [$frac(x - 1, 1) = frac(y, 1) = frac(z - 2, - 1)$],
      ),
      source-id: "bai-hoc-12b",
      writing-lines: 7,
      solution: solutions.at("bai-hoc-12b"),
    )

    #item(
      "13c",
      [
        Trong không gian với hệ toạ độ $O x y z$, cho hai đường thẳng $d_(1) : frac(x - 3, - 1) = frac(y - 3, - 2) = frac(z + 2, 1)$;  $d_(2) : frac(x - 5, - 3) = frac(y + 1, 2) = frac(z - 2, 1)$ và mặt phẳng $lr(( P )) : x + 2 y + 3 z - 5 = 0$. Đường thẳng vuông góc với $lr(( P ))$,  cắt $d_(1)$ và $d_(2)$ có phương trình là:
      ],
      answers: (
        [$frac(x - 1, 3) = frac(y + 1, 2) = frac(z, 1)$],
        [$frac(x - 2, 1) = frac(y - 3, 2) = frac(z - 1, 3)$],
        [$frac(x - 3, 1) = frac(y - 3, 2) = frac(z + 2, 3)$],
        [$frac(x - 1, 1) = frac(y + 1, 2) = frac(z, 3)$],
      ),
      source-id: "bai-hoc-13c",
      writing-lines: 7,
      solution: solutions.at("bai-hoc-13c"),
    )

    #item(
      "14",
      [
        (Viết phương trình đường phân giác của một góc)#linebreak()
        Trong không gian với hệ toạ độ $O x y z$, cho đường thẳng $d : cases(display(x = 1 + 3 t), display(y = - 3), display(z = 5 + 4 t))$. Gọi $Δ$ là đường thẳng đi qua $A lr(( 1 ";" - 3 ";" 5 ))$ và có vecto chỉ phương $arrow(u) = lr(( 1 ";" 2 ";" - 2 ))$. Đường phân giác của góc nhọn tạo bởi $d$ và $Δ$ có phương trình là:
      ],
      answers: (
        [$cases(display(x = - 1 + 2 t), display(y = 2 - 5 t), display(z = 6 + 11 t))$],
        [$cases(display(x = - 1 + 2 t), display(y = 2 - 5 t), display(z = - 6 + 11 t))$],
        [$cases(display(x = 1 + 7 t), display(y = - 3 + 5 t), display(z = 5 + t))$],
        [$cases(display(x = 1 - t), display(y = - 3), display(z = 5 + 7 t))$],
      ),
      source-id: "bai-hoc-14",
      writing-lines: 7,
      solution: solutions.at("bai-hoc-14"),
    )

    #lesson-section([BÀI TẬP TỰ LUYỆN], badge: [B])

    #item(
      "1",
      [
        Trong không gian $O x y z$, đường thẳng $d : cases(display(x = 2 - t), display(y = 1 + 2 t), display(z = 3 + t))$ có một vectơ chỉ phương là:
      ],
      answers: (
        [$arrow(u_(1)) = lr(( - 1 ";" 2 ";" 3 ))$],
        [$arrow(u_(3)) = lr(( 2 ";" 1 ";" 3 ))$],
        [$arrow(u_(4)) = lr(( - 1 ";" 2 ";" 1 ))$],
        [$arrow(u_(2)) = lr(( 2 ";" 1 ";" 1 ))$],
      ),
      source-id: "tu-luyen-1",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-1"),
    )

    #item(
      "2",
      [
        Trong không gian với hệ tọa độ $O x y z$, cho đường thẳng $d : frac(x, - 1) = frac(y - 4, 2) = frac(z - 3, 3)$. Hỏi trong các vectơ sau, đâu không phải là vectơ chỉ phương của $d$?
      ],
      answers: (
        [$arrow(u_(1)) = lr(( - 1 ";" 2 ";" 3 ))$.],
        [$arrow(u_(2)) = lr(( 3 ";" - 6 ";" - 9 ))$.],
        [$arrow(u_(3)) = lr(( 1 ";" - 2 ";" - 3 ))$.],
        [$arrow(u_(4)) = lr(( - 2 ";" 4 ";" 3 ))$.],
      ),
      source-id: "tu-luyen-2",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-2"),
    )

    #item(
      "3",
      [
        Trong không gian với hệ trục tọa độ $O x y z$, cho đường thẳng $d : frac(x - 1, 2) = frac(y - 2, 1) = frac(z + 1, 2)$ nhận véc tơ $arrow(u) lr(( a ";" 2 ";" b ))$ làm véc tơ chỉ phương. Tính $a + b$.
      ],
      answers: (
        [$- 8$.],
        [$8$.],
        [$4$.],
        [$- 4$.],
      ),
      source-id: "tu-luyen-3",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-3"),
    )

    #item(
      "4",
      [
        Trong không gian $O x y z$, điểm nào dưới đây thuộc đường thẳng $d : frac(x + 1, - 1) = frac(y - 2, 3) = frac(z - 1, 3)$?
      ],
      answers: (
        [$P lr(( - 1 ";" 2 ";" 1 ))$.],
        [$Q lr(( 1 ";" - 2 ";" - 1 ))$.],
        [$N lr(( - 1 ";" 3 ";" 2 ))$.],
        [$P lr(( 1 ";" 2 ";" 1 ))$.],
      ),
      source-id: "tu-luyen-4",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-4"),
    )

    #item(
      "5",
      [
        Trong không gian $O x y z$, đường thẳng $d : cases(display(x = 1 + 2 t), display(y = 3 - t), display(z = 1 - t))$ đi qua điểm nào dưới đây?
      ],
      answers: (
        [$M lr(( 1 ";" 3 ";" - 1 ))$.],
        [$M lr(( - 3 ";" 5 ";" 3 ))$.],
        [$M lr(( 3 ";" 5 ";" 3 ))$.],
        [$M lr(( 1 ";" 2 ";" - 3 ))$.],
      ),
      source-id: "tu-luyen-5",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-5"),
    )

    #item(
      "6",
      [
        Trong không gian tọa độ $O x y z$,  phương trình nào dưới đây là phương trình chính tắc của đường thẳng $d : cases(display(x = 1 + 2 t), display(y = 3 t), display(z = - 2 + t)) ?$
      ],
      answers: (
        [$frac(x + 1, 2) = frac(y, 3) = frac(z - 2, 1)$],
        [$frac(x - 1, 1) = frac(y, 3) = frac(z + 2, - 2)$],
        [$frac(x + 1, 2) = frac(y, 3) = frac(z - 2, - 2)$],
        [$frac(x - 1, 2) = frac(y, 3) = frac(z + 2, 1)$],
      ),
      source-id: "tu-luyen-6",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-6"),
    )

    #item(
      "7",
      [
        Trong không gian với hệ trục tọa độ $O x y z$, phương trình tham số trục $O z$ là
      ],
      answers: (
        [$z = 0$.],
        [$cases(display(x = 0), display(y = t), display(z = 0))$.],
        [$cases(display(x = t), display(y = 0), display(z = 0))$.],
        [$cases(display(x = 0), display(y = 0), display(z = t))$.],
      ),
      source-id: "tu-luyen-7",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-7"),
    )

    #item(
      "8",
      [
        Trong không gian $O x y z$, cho đường thẳng $d$ đi qua điểm $M lr(( 3 ";" - 1 ";" 4 ))$ và có một vectơ chỉ phương $arrow(u) = lr(( - 2 ";" 4 ";" 5 ))$. Phương trình của $d$ là
      ],
      answers: (
        [$cases(display(x = - 2 + 3 t), display(y = 4 - t), display(z = 5 + 4 t))$.],
        [$cases(display(x = 3 + 2 t), display(y = - 1 + 4 t), display(z = 4 + 5 t))$.],
        [$cases(display(x = 3 - 2 t), display(y = 1 + 4 t), display(z = 4 + 5 t))$.],
        [$cases(display(x = 3 - 2 t), display(y = - 1 + 4 t), display(z = 4 + 5 t))$.],
      ),
      source-id: "tu-luyen-8",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-8"),
    )

    #item(
      "9",
      [
        Trong không gian $O x y z$, cho hai điểm $M lr(( 1 ";" 2 ";" 1 ))$ và $N lr(( 3 ";" 1 ";" - 2 ))$. Đường thẳng $M N$ có phương trình là
      ],
      answers: (
        [$frac(x + 1, 4) = frac(y + 2, 3) = frac(z + 1, - 1)$.],
        [$frac(x - 1, 2) = frac(y - 2, - 1) = frac(z - 1, - 3)$.],
        [$frac(x - 1, 4) = frac(y - 2, 3) = frac(z - 1, - 1)$.],
        [$frac(x + 1, 2) = frac(y + 2, - 1) = frac(z + 1, - 3)$.],
      ),
      source-id: "tu-luyen-9",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-9"),
    )

    #item(
      "10",
      [
        Trong không gian $O x y z$,  cho điểm $M lr(( - 1 ";" 3 ";" 2 ))$ và mặt phẳng $lr(( P )) : x - 2 y + 4 "z" + 1 = 0 .$ Đường thẳng đi qua $M$ và vuông góc với $lr(( P ))$ có phương trình là
      ],
      answers: (
        [$frac(x + 1, 1) = frac(y - 3, - 2) = frac(z - 2, 1)$.],
        [$frac(x - 1, 1) = frac(y + 3, - 2) = frac(z + 2, 1)$.],
        [$frac(x - 1, 1) = frac(y + 3, - 2) = frac(z + 2, 4)$.],
        [$frac(x + 1, 1) = frac(y - 3, - 2) = frac(z - 2, 4)$.],
      ),
      source-id: "tu-luyen-10",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-10"),
    )

    #item(
      "11",
      [
        Trong không gian $O x y z$, đường thẳng đi qua điểm $A lr(( 1 ";" 1 ";" 1 ))$ và vuông góc với mặt phẳng tọa độ $lr(( O x y ))$ có phương trình tham số là:
      ],
      answers: (
        [$cases(display(x = 1 + t), display(y = 1), display(z = 1))$.],
        [$cases(display(x = 1), display(y = 1), display(z = 1 + t))$.],
        [$cases(display(x = 1 + t), display(y = 1), display(z = 1))$.],
        [$cases(display(x = 1 + t), display(y = 1 + t), display(z = 1))$.],
      ),
      source-id: "tu-luyen-11",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-11"),
    )

    #item(
      "12",
      [
        Trong không gian $O x y z$, cho điểm $M lr(( 2 ";" - 2 ";" 3 ))$ và đường thẳng $d$: $frac(x - 1, 3) = frac(y + 2, 2) = frac(z - 3, - 1)$. Mặt phẳng đi qua điểm $M$ và vuông góc với đường thẳng $d$ có phương trình là
      ],
      answers: (
        [$3 x + 2 y - z + 1 = 0$.],
        [$2 x - 2 y + 3 z - 17 = 0$.],
        [$3 x + 2 y - z - 1 = 0$.],
        [$2 x - 2 y + 3 z + 17 = 0$.],
      ),
      source-id: "tu-luyen-12",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-12"),
    )

    #item(
      "13",
      [
        Trong không gian $O x y z$, cho ba điểm $A lr(( 1 ";" 0 ";" 1 ))$, $B lr(( 1 ";" 1 ";" 0 ))$ và $C lr(( 3 ";" 4 ";" - 1 ))$. Đường thẳng đi qua $A$ và song song với $B C$ có phương trình là
      ],
      answers: (
        [$frac(x - 1, 4) = frac(y, 5) = frac(z - 1, - 1)$.],
        [$frac(x + 1, 2) = frac(y, 3) = frac(z + 1, - 1)$.],
        [$frac(x - 1, 2) = frac(y, 3) = frac(z - 1, - 1)$.],
        [$frac(x + 1, 4) = frac(y, 5) = frac(z + 1, - 1)$.],
      ),
      source-id: "tu-luyen-13",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-13"),
    )

    #item(
      "14",
      [
        Trong không gian với hệ toạ độ $O x y z$, cho điểm $A lr(( 1 ";" - 2 ";" 3 ))$ và hai mặt phẳng $lr(( P )) : x + y + z + 1 = 0$, $lr(( Q )) : x - y + z - 2 = 0$. Phương trình nào dưới đây là phương trình đường thẳng đi qua $A$, song song với $lr(( P ))$ và $lr(( Q ))$?
      ],
      answers: (
        [$cases(display(x = 1), display(y = - 2), display(z = 3 - 2 t))$],
        [$cases(display(x = - 1 + t), display(y = 2), display(z = - 3 - t))$],
        [$cases(display(x = 1 + 2 t), display(y = - 2), display(z = 3 + 2 t))$],
        [$cases(display(x = 1 + t), display(y = - 2), display(z = 3 - t))$],
      ),
      source-id: "tu-luyen-14",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-14"),
    )

    #item(
      "15",
      [
        Trong không gian $O x y z$, cho điểm $A lr(( 2 ";" 0 ";" - 1 ))$ và mặt phẳng $lr(( P )) : x + y - 1 = 0$. Đường thẳng đi qua $A$ đồng thời song song với $lr(( P ))$ và mặt phẳng $lr(( O x y ))$ có phương trình là
      ],
      answers: (
        [$cases(display(x = 3 + t), display(y = 2 t), display(z = 1 - t))$.],
        [$cases(display(x = 2 + t), display(y = - t), display(z = - 1))$.],
        [$cases(display(x = 1 + 2 t), display(y = - 1), display(z = - t))$.],
        [$cases(display(x = 3 + t), display(y = 1 + 2 t), display(z = - t))$.],
      ),
      source-id: "tu-luyen-15",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-15"),
    )

    #item(
      "16",
      [
        Trong không gian $O x y z$,  cho điểm $M lr(( 1 ";" - 1 ";" 2 ))$ và hai đường thẳng $d : cases(display(x = t), display(y = - 1 - 4 t), display(z = 6 + 6 t))$,  $d' : frac(x, 2) = frac(y - 1, 1) = frac(z + 2, - 5) .$ Phương trình nào dưới đây là phương trình đường thẳng đi qua $M$,  vuông góc với $d$ và $d'$?
      ],
      answers: (
        [$frac(x - 1, 17) = frac(y + 1, 14) = frac(z - 2, 9) .$],
        [$frac(x - 1, 14) = frac(y + 1, 17) = frac(z + 2, 9) .$],
        [$frac(x - 1, 17) = frac(y + 1, 9) = frac(z - 2, 14) .$],
        [$frac(x - 1, 14) = frac(y + 1, 17) = frac(z - 2, 9) .$],
      ),
      source-id: "tu-luyen-16",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-16"),
    )

    #item(
      "17",
      [
        Trong không gian $O x y z$, cho điểm $A ( 1 ";" 1 ";" 3 )$ và đường thẳng $d : frac(x - 1, 1) = frac(y, 2) = frac(z + 1, 1)$. Đường thẳng đi qua $A$, cắt trục $O y$ và vuông góc với $d$ có phương trình là:
      ],
      answers: (
        [$cases(display(x = 1 + t), display(y = 1 + 2 t), display(z = 3 + 3 t))$.],
        [$cases(display(x = - 3 + 3 t), display(y = 4 - 2 t), display(z = - 1 + t))$.],
        [$cases(display(x = 1 + t), display(y = 1 - t), display(z = 3 + t))$.],
        [$cases(display(x = - 1 + t), display(y = 5 - 2 t), display(z = - 3 + 3 t))$.],
      ),
      source-id: "tu-luyen-17",
      writing-lines: 7,
      solution: solutions.at("tu-luyen-17"),
    )

    #item(
      "18",
      [
        Trong không gian $O x y z$, cho mặt phẳng $lr(( P )) : 2 x + 2 y - z - 3 = 0$ và hai đường thẳng $d_(1) : frac(x - 1, 2) = frac(y, 1) = frac(z + 1, - 2)$, $d_(2) : frac(x - 2, 1) = frac(y, 2) = frac(z + 1, - 1)$. Đường thẳng vuông góc với $lr(( P ))$, đồng thời cắt cả $d_(1)$ và $d_(2)$ có phương trình là
      ],
      answers: (
        [$frac(x - 3, 2) = frac(y - 2, 2) = frac(z + 2, - 1)$.],
        [$frac(x - 2, 3) = frac(y - 2, 2) = frac(z + 1, - 2)$.],
        [$frac(x - 1, 2) = frac(y, - 2) = frac(z + 1, - 1)$.],
        [$frac(x - 2, 2) = frac(y + 1, 2) = frac(z - 2, - 1)$.],
      ),
      source-id: "tu-luyen-18",
      writing-lines: 7,
      solution: solutions.at("tu-luyen-18"),
    )

    #item(
      "19",
      [
        Trong không gian với hệ tọa độ Oxyz cho tam giác ABC biết $A ( 2 ";" 1 ";" 0 )$, $B ( 3 ";" 0 ";" 2 )$, $C ( 4 ";" 3 ";" - 4 )$. Viết phương trình đường phân giác trong góc A.
      ],
      answers: (
        [$cases(display(x = 2), display(y = 1 + t), display(z = 0))$],
        [$cases(display(x = 2), display(y = 1), display(z = t))$],
        [$cases(display(x = 2 + t), display(y = 1), display(z = 0))$],
        [$cases(display(x = 2 + t), display(y = 1), display(z = t))$],
      ),
      source-id: "tu-luyen-19",
      writing-lines: 7,
      solution: solutions.at("tu-luyen-19"),
    )

    #item(
      "20",
      [
        Trong không gian với hệ tọa độ $O x y z$, cho đường thẳng $d : frac(x + 1, 2) = frac(y, 1) = frac(z - 2, 1)$, mặt phẳng $lr(( P )) : x + y - 2 z + 5 = 0$ và $A lr(( 1 ";" - 1 ";" 2 ))$. Đường thẳng $Δ$ cắt $d$ và $lr(( P ))$ lần lượt tại $M$ và $N$ sao cho $A$ là trung điểm của đoạn thẳng $M N$. Một vectơ chỉ phương của $Δ$ là
      ],
      answers: (
        [$arrow(u) = lr(( 4 ";" 5 ";" - 13 ))$.],
        [$arrow(u) = lr(( 2 ";" 3 ";" 2 ))$.],
        [$arrow(u) = lr(( 1 ";" - 1 ";" 2 ))$.],
        [$arrow(u) = lr(( - 3 ";" 5 ";" 1 ))$.],
      ),
      source-id: "tu-luyen-20",
      keep-together: true,
      writing-lines: 7,
      solution: solutions.at("tu-luyen-20"),
    )
  ]
}
