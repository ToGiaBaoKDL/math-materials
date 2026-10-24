#import "/templates/lesson.typ": exercise, lesson-section, paragraph, theory-box
#import "solutions.typ": solutions
#import "../figures.typ": diagram
#let questions(variant) = {
  set par(justify: false)
  let item = exercise.with(
    variant: variant,
    question-gap: 7mm,
    keep-together: false,
    flow-stem: variant == "dap-an",
    keep-solution-start: false,
    writing-line-gap: 9mm,
    writing-single-page: true,
    fill-writing-page: true,
  )
  [
    #lesson-section([PHƯƠNG PHÁP GIẢI], badge: [1])
    #theory-box(title: [DÙNG KỸ THUẬT THAM SỐ HÓA TỌA ĐỘ])[
      #paragraph[*Bước 1.* Viết phương trình đường thẳng ở dạng tham số $t$, từ đó gọi tọa độ điểm $M$ cần tìm theo $t$.]
      #paragraph[*Bước 2.* Từ các giả thiết bài toán, thiết lập phương trình ẩn $t$; giải phương trình và tìm tọa độ $M$.]
    ]
    #lesson-section([BÀI TẬP MẪU], badge: [2])
    #item(
      "1",
      [*Tìm giao điểm của đường thẳng và mặt phẳng*\
        Trong không gian $O x y z$, cho $A lr(( 1 ; - 2 ; 1 )) ; B lr(( 2 ; 1 ; 3 ))$ và mặt phẳng $lr(( P )) : x - y + 2 z - 3 = 0 .$ Viết phương trình đường thẳng $A B$ và tìm toạ độ giao điểm của đường thẳng $A B$ và mặt phẳng $lr(( P ))$.],
      answers: (),
      source-id: "bai-hoc-1",
      writing-lines: 8,
      solution: solutions.at("bai-hoc-1"),
    )
    #item(
      "2a",
      [*Tìm toạ độ hình chiếu của một điểm trên một đường thẳng*\
        Trong không gian $O x y z$, cho $A lr(( 3 ; 2 ; - 2 )) ; B lr(( 1 ; 0 ; 1 ))$ và $C lr(( 2 ; - 1 ; 3 ))$. Viết phương trình mặt phẳng đi qua $A$ và vuông góc với đường thẳng $B C$. Tìm toạ độ hình chiếu vuông góc của $A$ trên đường thẳng $B C$.],
      answers: (),
      source-id: "bai-hoc-2a",
      writing-lines: 8,
      solution: solutions.at("bai-hoc-2a"),
    )
    #item(
      "2b",
      [Trong không gian $O x y z$, cho $A lr(( 1 ; 0 ; - 1 ))$ và đường thẳng $d : frac(x - 1, 2) = frac(y + 1, 2) = frac(z, - 1)$. Tìm toạ độ hình chiếu của $A$ trên $d$.],
      answers: (),
      source-id: "bai-hoc-2b",
      writing-lines: 8,
      solution: solutions.at("bai-hoc-2b"),
    )
    #item(
      "3",
      [*Tìm hình chiếu của điểm trên mặt phẳng*\
        Trong không gian với hệ toạ độ $O x y z$, cho các điểm $A lr(( - 1 ; - 1 ; - 2 )) ; B lr(( 0 ; 1 ; 1 ))$ và mặt phẳng $lr(( P )) : x + y + z - 1 = 0$. Tìm toạ độ hình chiếu vuông góc của $A$ trên $lr(( P ))$. Viết phương trình mặt phẳng đi qua $A , B$ và vuông góc với $lr(( P ))$.],
      answers: (),
      source-id: "bai-hoc-3",
      writing-lines: 8,
      solution: solutions.at("bai-hoc-3"),
    )
    #item(
      "4",
      [*Tìm toạ độ điểm đối xứng qua mặt phẳng*\
        Trong không gian $O x y z$, cho $A lr(( 3 ; 5 ; 0 ))$ và mặt phẳng $lr(( P )) : 2 x + 3 y - z - 7 = 0$. Viết phương trình đường thẳng đi qua $A$ và vuông góc với $lr(( P ))$. Tìm toạ độ điểm đối xứng của $A$ qua $lr(( P ))$
        #theory-box(title: [Phương pháp])[
          #paragraph[*Bước 1.* Tìm $H$ là hình chiếu vuông góc của $A$ trên $(P)$.]
          #paragraph[*Bước 2.* Dùng công thức trung điểm để tìm điểm $A'$ đối xứng với $A$ qua $(P)$.]
          #diagram("plane-reflection", width: 73mm)
        ]],
      answers: (),
      source-id: "bai-hoc-4",
      writing-lines: 8,
      solution: solutions.at("bai-hoc-4"),
    )
    #item(
      "5",
      [*Tìm hình chiếu vuông góc của đường thẳng trên mặt phẳng*\
        Trong không gian $O x y z$, cho đường thẳng $d : frac(x, 1) = frac(y - 1, 1) = frac(z - 2, - 1)$ và mặt phẳng $lr(( P )) : x + 2 y + z - 4 = 0$. Viết phương trình đường thẳng là hình chiếu vuông góc của $d$ lên $lr(( P ))$.],
      answers: (),
      source-id: "bai-hoc-5",
      writing-lines: 8,
      solution: solutions.at("bai-hoc-5"),
    )
    #item(
      "6",
      [Trong không gian $O x y z$, cho đường thẳng $Δ : frac(x - 6, - 3) = frac(y + 1, - 2) = frac(z + 2, 1)$ và điểm $A lr(( 1 ; 7 ; 3 ))$. Viết phương trình mặt phẳng $lr(( P ))$ đi qua $A$ và vuông góc với $Δ .$ Tìm toạ độ điểm $M ∈ Δ$ sao cho $A M = 2 sqrt(30)$],
      answers: (),
      source-id: "bai-hoc-6",
      writing-lines: 8,
      solution: solutions.at("bai-hoc-6"),
    )
    #item(
      "7",
      [Trong không gian $O x y z$, cho $A lr(( 0 ; 1 ; 2 ))$ và hai đường thẳng $d_(1) : frac(x, 2) = frac(y - 1, 1) = frac(z + 1, - 1) ; d_(2) : cases(display(x = 1 + t), display(y = - 1 - 2 t), display(z = 2 + t))$

        a) Viết phương trình mặt phẳng $lr(( P ))$ qua $A$, đồng thời song song với $d_(1)$ và $d_(2)$.

        b) Tìm toạ độ $M ∈ d_(1) , N ∈ d_(2)$ sao cho ba điểm $A , M , N$ thẳng hàng.],
      answers: (),
      source-id: "bai-hoc-7",
      writing-lines: 8,
      solution: solutions.at("bai-hoc-7"),
    )
    #lesson-section([BÀI TẬP TỰ LUYỆN], badge: [3])
    #item(
      "1",
      [Trong không gian $O x y z ,$ cho đường thẳng $d : cases(display(x = 1 + 2 t), display(y = 3 - t), display(z = 1 - t)) ,t ∈ ℝ$ và mặt phẳng $lr(( P )) : x + 2 y - 3 z + 2 = 0 .$ Tìm tọa độ của điểm $A$ là giao điểm của đường thẳng $d$ và mặt phẳng $lr(( P )) .$],
      answers: (
        [$A lr(( 3 ; 5 ; 3 ))$.],
        [$A lr(( 1 ; 3 ; 1 ))$.],
        [$A lr(( - 3 ; 5 ; 3 ))$.],
        [$A lr(( 1 ; 2 ; - 3 ))$.],
      ),
      source-id: "tu-luyen-1",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-1"),
    )
    #item(
      "2",
      [Trong không gian với hệ trục tọa độ $O x y z$, cho đường thẳng $d : frac(x - 12, 4) = frac(y - 9, 3) = frac(z - 1, 1)$ và mặt phẳng $lr(( P )) : 3 x + 5 y - z - 2 = 0$. Tìm tọa độ giao điểm của $d$ và $lr(( P ))$.],
      answers: ([$lr(( 1 ; 0 ; 1 ))$.], [$lr(( 0 ; 0 ; - 2 ))$.], [$lr(( 1 ; 1 ; 6 ))$.], [$lr(( 12 ; 9 ; 1 ))$.]),
      source-id: "tu-luyen-2",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-2"),
    )
    #item(
      "3",
      [Trong không gian với hệ tọa độ $O x y z$, cho điểm $M ( - 4 ; 0 ; 0 )$ và đường thẳng $Δ : cases(display(x = 1 - t), display(y = - 2 + 3 t), display(z = - 2 t))$. Gọi $H ( a ; b ; c )$ là hình chiếu của $M$ lên $Δ$. Tính $a+b+c$.],
      answers: ([$5$.], [$- 1$.], [$- 3$.], [$7$.]),
      source-id: "tu-luyen-3",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-3"),
    )
    #item(
      "4",
      [Trong không gian $O x y z$, cho đường thẳng $d : frac(x + 1, 1) = frac(y + 3, 2) = frac(z + 2, 2)$ và điểm $A lr(( 3 ; 2 ; 0 ))$. Điểm đối xứng của điểm $A$ qua đường thẳng $d$ có tọa độ là],
      answers: ([$lr(( - 1 ; 0 ; 4 ))$.], [$lr(( 7 ; 1 ; - 1 ))$.], [$lr(( 2 ; 1 ; - 2 ))$.], [$lr(( 0 ; 2 ; - 5 ))$.]),
      source-id: "tu-luyen-4",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-4"),
    )
    #item(
      "5",
      [Trong không gian $O x y z$, tọa độ hình chiếu vuông góc của điểm $A lr(( 3 ; 2 ; - 1 ))$ lên mặt phẳng $lr(( α )) : x + y + z = 0$ là:],
      answers: (
        [$lr(( - 2 ; 1 ; 1 ))$.],
        [$lr(( frac(5, 3) ; frac(2, 3) ; - frac(7, 3) ))$.],
        [$lr(( 1 ; 1 ; - 2 ))$.],
        [$lr(( frac(1, 2) ; frac(1, 4) ; frac(1, 4) ))$.],
      ),
      source-id: "tu-luyen-5",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-5"),
    )
    #item(
      "6",
      [Trong không gian $O x y z$, điểm $M'$ đối xứng với điểm $M lr(( 1 ; 2 ; 4 ))$ qua mặt phẳng $lr(( α )) : 2 x + y + 2 z - 3 = 0$ có tọa độ là],
      answers: (
        [$lr(( - 3 ; 0 ; 0 ))$.],
        [$lr(( - 1 ; 1 ; 2 ))$.],
        [$lr(( - 1 ; - 2 ; - 4 ))$.],
        [$lr(( 2 ; 1 ; 2 ))$.],
      ),
      source-id: "tu-luyen-6",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-6"),
    )
    #item(
      "7",
      [Trong không gian với hệ tọa độ $O x y z$, cho mặt phẳng $lr(( P )) : x + y - z - 1 = 0$ và đường thẳng $d : frac(x + 2, 2) = frac(y - 4, - 2) = frac(z + 1, 1)$. Viết phương trình đường thẳng $d'$ là hình chiếu vuông góc của $d$ trên $lr(( P ))$.],
      answers: (
        [$d' : frac(x + 2, 7) = frac(y, - 5) = frac(z + 1, 2)$.],
        [$d' : frac(x - 2, 7) = frac(y, - 5) = frac(z - 1, 2)$.],
        [$d' : frac(x + 2, 7) = frac(y, 5) = frac(z + 1, 2)$. ],
        [$d' : frac(x - 2, 7) = frac(y, 5) = frac(z - 1, 2)$.],
      ),
      source-id: "tu-luyen-7",
      writing-lines: 5,
      solution: solutions.at("tu-luyen-7"),
    )
    #item(
      "8",
      [Trong không gian $O x y z$, cho $A lr(( 1 ; 4 ; 2 )) , B lr(( - 1 ; 2 ; 4 ))$

        a) Viết phương trình đường thẳng $d$ đi qua trọng tâm $G$ của $triangle O A B$ và vuông góc với $lr(( O A B ))$

        b) Tìm toạ độ của điểm $M ∈ Δ$, sao cho $M A^(2) + M B^(2)$ nhỏ nhất biết $Δ : frac(x - 1, - 1) = frac(y + 2, 1) = frac(z, 2)$],
      answers: (),
      source-id: "tu-luyen-8",
      writing-lines: 8,
      solution: solutions.at("tu-luyen-8"),
    )
    #item(
      "9",
      [Trong không gian $O x y z$, cho $A lr(( 2 ; 1 ; 0 )) , B lr(( 1 ; 2 ; 2 )) , C lr(( 1 ; 1 ; 0 ))$ và mặt phẳng $lr(( P )) : x + y + z - 20 = 0$. Xác định toạ độ điểm $D$ thuộc đường thẳng $A B$, sao cho $C D ∥ lr(( P ))$.],
      answers: (),
      source-id: "tu-luyen-9",
      writing-lines: 8,
      solution: solutions.at("tu-luyen-9"),
    )
    #item(
      "10",
      [Trong không gian $O x y z$, cho $A lr(( 1 ; - 2 ; 3 )) , B lr(( - 1 ; 0 ; 1 ))$ và mặt phẳng $lr(( P )) : x + y + z + 4 = 0$. Viết phương trình mặt cầu $lr(( S ))$ có bán kính bằng $frac(A B, 6)$ có tâm thuộc đường thẳng $A B$ và mặt cầu $lr(( S ))$ tiếp xúc với mặt phẳng $lr(( P ))$.],
      answers: (),
      source-id: "tu-luyen-10",
      writing-lines: 8,
      solution: solutions.at("tu-luyen-10"),
    )
    #item(
      "11",
      [Trong không gian $O x y z$, cho $Δ : frac(x + 2, 1) = frac(y - 1, 3) = frac(z + 5, - 2)$ và hai điểm $A lr(( - 2 ; 1 ; 1 )) , B lr(( - 3 ; - 1 ; 2 ))$. Tìm toạ độ điểm $M ∈ Δ$ sao cho $triangle M A B$ có diện tích bằng $3 sqrt(5)$?],
      answers: (),
      source-id: "tu-luyen-11",
      writing-lines: 8,
      solution: solutions.at("tu-luyen-11"),
    )
    #item(
      "12",
      [Trong không gian $O x y z$, cho $A lr(( - 1 ; 2 ; 3 )) , B lr(( 1 ; 0 ; - 5 ))$ và mặt phẳng $lr(( P )) : 2 x + y - 3 z - 4 = 0$. Tìm toạ độ điểm $M ∈ lr(( P ))$ sao cho 3 điểm $A , B , M$ thẳng hàng?],
      answers: (),
      source-id: "tu-luyen-12",
      writing-lines: 8,
      solution: solutions.at("tu-luyen-12"),
    )
    #item(
      "13",
      [Trong không gian $O x y z$, cho $A lr(( 2 ; 5 ; 3 ))$ và đường thẳng $d : frac(x - 1, 2) = frac(y, 1) = frac(z - 2, 2)$

        a) Tìm toạ độ điểm đối xứng của $A$ qua $d$.

        b) Viết phương trình mặt phẳng $lr(( α ))$ chứa $d$ sao cho khoảng cách từ $A$ đến $α$ lớn nhất.],
      answers: (),
      source-id: "tu-luyen-13",
      writing-lines: 8,
      solution: solutions.at("tu-luyen-13"),
    )
  ]
}
