#import "/templates/lesson.typ": exercise, formula, lesson-section
#import "theory.typ": theory-one, theory-two
#import "solutions.typ": solutions

#let questions(variant) = {
  set par(justify: false)
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
    #lesson-section([XÁC ĐỊNH TÂM VÀ BÁN KÍNH], number: 1)
    #theory-one()
    #item(
      "1",
      [Trong không gian $O x y z$, cho mặt cầu $lr(( S )) : lr(( x + 1 ))^(2) + lr(( y - 3 ))^(2) + z^(2) = 9$. Tâm mặt cầu $lr(( S ))$ có tọa độ là:],
      answers: ([$(1; -3; 0)$], [$(-1; 3; 0)$], [$(1; 3; 0)$], [$(-1; -3; 0)$]),
      source-id: "bai-hoc-1",
      writing-lines: 3,
      solution: solutions.at("bai-hoc-1"),
    )
    #item(
      "2",
      [Trong không gian $O x y z$, mặt cầu $lr(( S )) : lr(( x - 5 ))^(2) + lr(( y - 1 ))^(2) + lr(( z + 2 ))^(2) = 3$ có bán kính bằng:],
      answers: ([$9$], [$2 sqrt(3)$], [$3$], [$sqrt(3)$]),
      source-id: "bai-hoc-2",
      writing-lines: 3,
      solution: solutions.at("bai-hoc-2"),
    )
    #item(
      "3",
      [Trong không gian $O x y z$, mặt cầu $lr(( S )) : x^(2) + y^(2) + z^(2) - 2 x + 2 y - 7 = 0$. Bán kính của mặt cầu đã cho bằng:],
      answers: ([$sqrt(7)$], [$3$], [$9$], [$sqrt(15)$]),
      source-id: "bai-hoc-3",
      writing-lines: 3,
      solution: solutions.at("bai-hoc-3"),
    )
    #item(
      "4",
      [Trong không gian $O x y z$ có tất cả bao nhiêu giá trị nguyên $m$ để phương trình $x^(2) + y^(2) + z^(2) + 4 m x + 2 m y - 2 m z + 9 m^(2) - 8 = 0$ là phương trình mặt cầu?],
      answers: ([$3$], [$8$], [$9$], [$6$]),
      source-id: "bai-hoc-4",
      writing-lines: 3,
      solution: solutions.at("bai-hoc-4"),
    )
    #item(
      "5",
      [Trong không gian $O x y z$, xét mặt cầu $lr(( S ))$ có phương trình dạng $x^(2) + y^(2) + z^(2) - 4 x + 2 y - 2 a z + 10 a = 0$. Tập hợp các giá trị thực của $a$ để $lr(( S ))$ có chu vi đường tròn lớn bằng $8 π$ là:],
      answers: ([$lr(\{ 1 ";" 10 \})$], [$lr(\{ 2 ";" -10 \})$], [$lr(\{ - 1 ";" 11 \})$], [$lr(\{ 1 ";" -11 \})$]),
      source-id: "bai-hoc-5",
      writing-lines: 3,
      solution: solutions.at("bai-hoc-5"),
    )
    #lesson-section([VIẾT PHƯƠNG TRÌNH MẶT CẦU], number: 2)
    #theory-two()
    #item(
      "6",
      [Trong không gian $O x y z$, cho mặt cầu $lr(( S ))$ có tâm $I (0; 0; -3)$ và đi qua điểm $M (4; 0; 0)$. Phương trình của $lr(( S ))$ là],
      answers: (
        [$x^(2) + y^(2) + lr(( z + 3 ))^(2) = 25$.],
        [$x^(2) + y^(2) + lr(( z + 3 ))^(2) = 5$.],
        [$x^(2) + y^(2) + lr(( z - 3 ))^(2) = 25$.],
        [$x^(2) + y^(2) + lr(( z - 3 ))^(2) = 5$.],
      ),
      source-id: "bai-hoc-6",
      writing-lines: 6,
      solution: solutions.at("bai-hoc-6"),
    )
    #item(
      "7",
      [Trong không gian $O x y z$ cho hai điểm $A (2; 4; 1)$ và $B (-2; 2; -3)$. Phương trình mặt cầu đường kính $A B$ là:],
      answers: (
        [$x^(2) + lr(( y - 3 ))^(2) + lr(( z - 1 ))^(2) = 36$],
        [$x^(2) + lr(( y + 3 ))^(2) + lr(( z - 1 ))^(2) = 9$],
        [$x^(2) + lr(( y - 3 ))^(2) + lr(( z + 1 ))^(2) = 9$],
        [$x^(2) + lr(( y - 3 ))^(2) + lr(( z + 1 ))^(2) = 36$],
      ),
      source-id: "bai-hoc-7",
      writing-lines: 6,
      solution: solutions.at("bai-hoc-7"),
    )
    #item(
      "8",
      [Trong không gian với hệ tọa độ $O x y z$, mặt cầu tâm $I (2; 1; -3)$ và tiếp xúc với trục $O y$ có phương trình là],
      answers: (
        [$lr(( x - 2 ))^(2) + lr(( y - 1 ))^(2) + lr(( z + 3 ))^(2) = 4$.],
        [$lr(( x - 2 ))^(2) + lr(( y - 1 ))^(2) + lr(( z + 3 ))^(2) = 13$.],
        [$lr(( x - 2 ))^(2) + lr(( y - 1 ))^(2) + lr(( z + 3 ))^(2) = 9$.],
        [$lr(( x - 2 ))^(2) + lr(( y - 1 ))^(2) + lr(( z + 3 ))^(2) = 10$.],
      ),
      source-id: "bai-hoc-8",
      writing-lines: 6,
      solution: solutions.at("bai-hoc-8"),
    )
    #item(
      "9",
      [Trong không gian $O x y z$ cho điểm $I (1; -2; 3)$. Viết phương trình mặt cầu tâm $I$, cắt trục $O x$ tại hai điểm $A "," B$ sao cho $A B = 2 sqrt(3)$],
      answers: (
        [$lr(( x - 1 ))^(2) + lr(( y + 2 ))^(2) + lr(( z - 3 ))^(2) = 16$],
        [$lr(( x - 1 ))^(2) + lr(( y + 2 ))^(2) + lr(( z - 3 ))^(2) = 20$],
        [$lr(( x - 1 ))^(2) + lr(( y + 2 ))^(2) + lr(( z - 3 ))^(2) = 25$],
        [$lr(( x - 1 ))^(2) + lr(( y + 2 ))^(2) + lr(( z - 3 ))^(2) = 9$],
      ),
      source-id: "bai-hoc-9",
      writing-lines: 6,
      solution: solutions.at("bai-hoc-9"),
    )
    #item(
      "10",
      [Trong không gian với hệ toạ độ $O x y z$, mặt cầu $lr(( S ))$ qua bốn điểm $A (3; 3; 0)$, $B (3; 0; 3)$, $C (0; 3; 3)$, $D (3; 3; 3)$. Phương trình mặt cầu $lr(( S ))$ là:],
      answers: (
        [$lr(( x - frac(3, 2) ))^(2) + lr(( y - frac(3, 2) ))^(2) + lr(( z - frac(3, 2) ))^(2) = frac(3 sqrt(3), 2)$],
        [$lr(( x - frac(3, 2) ))^(2) + lr(( y + frac(3, 2) ))^(2) + lr(( z - frac(3, 2) ))^(2) = frac(27, 4)$],
        [$lr(( x - frac(3, 2) ))^(2) + lr(( y - frac(3, 2) ))^(2) + lr(( z + frac(3, 2) ))^(2) = frac(27, 3)$],
        [$lr(( x - frac(3, 2) ))^(2) + lr(( y - frac(3, 2) ))^(2) + lr(( z - frac(3, 2) ))^(2) = frac(27, 4)$],
      ),
      source-id: "bai-hoc-10",
      writing-lines: 6,
      solution: solutions.at("bai-hoc-10"),
    )
    #item(
      "11",
      [Trong không gian với hệ toạ độ $O x y z$, cho $A (-1; 0; 0)$, $B (0; 0; 2)$, $C (0; -3; 0)$. Tính bán kính mặt cầu ngoại tiếp tứ diện $O A B C$.],
      answers: ([$frac(sqrt(14), 3)$], [$frac(sqrt(14), 4)$], [$frac(sqrt(14), 2)$], [$sqrt(14)$]),
      source-id: "bai-hoc-11",
      writing-lines: 6,
      solution: solutions.at("bai-hoc-11"),
    )
    #item(
      "12",
      [Trong không gian với hệ trục tọa độ $O x y z$, cho ba điểm $A (1; 2; -4)$, $B (1; -3; 1)$, $C (2; 2; 3)$. Tính đường kính $l$ của mặt cầu $lr(( S ))$ đi qua ba điểm trên và có tâm nằm trên mặt phẳng $lr(( O x y ))$.],
      answers: ([$l = 2 sqrt(13)$.], [$l = 2 sqrt(41)$.], [$l = 2 sqrt(26)$.], [$l = 2 sqrt(11)$.]),
      source-id: "bai-hoc-12",
      writing-lines: 6,
      solution: solutions.at("bai-hoc-12"),
    )
    #item(
      "13",
      [Trong không gian với hệ toạ độ $O x y z$, cho $lr(( S )) : lr(( x - 1 ))^(2) + lr(( y - 1 ))^(2) + z^(2) = 4$. Một mặt cầu $lr(( S ' ))$ có tâm $I ' (9; 1; 6)$ và tiếp xúc ngoài với mặt cầu $lr(( S ))$. Phương trình mặt cầu $lr(( S ' ))$ là:],
      answers: (
        [$lr(( x - 9 ))^(2) + lr(( y - 1 ))^(2) + lr(( z - 6 ))^(2) = 64$],
        [$lr(( x - 9 ))^(2) + lr(( y - 1 ))^(2) + lr(( z - 6 ))^(2) = 144$],
        [$lr(( x - 9 ))^(2) + lr(( y - 1 ))^(2) + lr(( z - 6 ))^(2) = 36$],
        [$lr(( x + 9 ))^(2) + lr(( y + 1 ))^(2) + lr(( z + 6 ))^(2) = 25$],
      ),
      source-id: "bai-hoc-13",
      writing-lines: 6,
      solution: solutions.at("bai-hoc-13"),
    )
    #item(
      "14",
      [Trong không gian với hệ toạ độ $O x y z$, gọi $I (a; b; c)$ là tâm mặt cầu đi qua $A (1; -1; 4)$ và tiếp xúc với tất cả các mặt phẳng toạ độ. Tính $P = a - b + c$],
      answers: ([$P = 6$], [$P = 0$], [$P = 3$], [$P = 9$]),
      source-id: "bai-hoc-14",
      writing-lines: 6,
      solution: solutions.at("bai-hoc-14"),
    )
    #item(
      "15",
      [Trong không gian với hệ toạ độ $O x y z$, cho $lr(( S )) : lr(( x - 1 ))^(2) + lr(( y - 1 ))^(2) + z^(2) = 4$ và $M (2; 3; 1)$. Từ $M$ ta kẻ được vô số các tiếp tuyến tới $lr(( S ))$, biết tập hợp các tiếp điểm là đường tròn $lr(( C ))$. Tính bán kính $r$ của đường tròn $lr(( C ))$.],
      answers: (
        [$r = frac(2 sqrt(3), 3)$],
        [$r = frac(sqrt(3), 3)$],
        [$r = frac(sqrt(2), 3)$],
        [$r = frac(sqrt(3), 2)$],
      ),
      source-id: "bai-hoc-15",
      writing-lines: 6,
      solution: solutions.at("bai-hoc-15"),
    )
    #lesson-section([BÀI TẬP TỰ LUYỆN], badge: [3])
    #item(
      "1",
      [Trong không gian $O x y z$, cho mặt cầu $lr(( S )) : lr(( x - 1 ))^(2) + lr(( y + 2 ))^(2) + lr(( z - 3 ))^(2) = 16$. Tâm của $lr(( S ))$ có tọa độ là],
      answers: ([$(-1; -2; -3)$.], [$(1; 2; 3)$.], [$(-1; 2; -3)$.], [$(1; -2; 3)$.]),
      source-id: "tu-luyen-1",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-1"),
    )
    #item(
      "2",
      [Trong không gian $O x y z$ , cho mặt cầu $lr(( S )) : x^(2) + lr(( y - 2 ))^(2) + z^(2) = 9$ . Bán kính của $lr(( S ))$ bằng],
      answers: ([$6$ .], [$18$ .], [$3$ .], [$9$ .]),
      source-id: "tu-luyen-2",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-2"),
    )
    #item(
      "3",
      [Trong không gian với hệ toạ độ $O x y z$, cho mặt cầu $lr(( S )) : x^(2) + y^(2) + z^(2) - 8 x + 2 y + 1 = 0$. Tìm toạ độ tâm và bán kính mặt cầu $lr(( S ))$],
      answers: (
        [$I (-4; 1; 0)$, $R = 2$],
        [$I (4; -1; 0)$, $R = 4$],
        [$I (4; -1; -1)$, $R = 2$],
        [$I (8; -2; 0 = - 1)$, $R = 4$],
      ),
      source-id: "tu-luyen-3",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-3"),
    )
    #item(
      "4",
      [Trong không gian với hệ tọa độ Oxyz, hỏi trong các phương trình sau phương trình nào là phương trình của mặt cầu?],
      answers: (
        [$x^(2) + y^(2) + z^(2) - 2 x + 4 z - 1 = 0$],
        [$x^(2) + z^(2) + 3 x - 2 y + 4 z - 1 = 0$],
        [$x^(2) + y^(2) + z^(2) + 2 x y - 4 y + 4 z - 1 = 0$],
        [$x^(2) + y^(2) + z^(2) - 2 x + 2 y - 4 z + 8 = 0$],
      ),
      source-id: "tu-luyen-4",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-4"),
    )
    #item(
      "5",
      [Trong không gian hệ tọa độ $O x y z$, tìm tất cả các giá trị của $m$ để phương trình $x^(2) + y^(2) + z^(2) - 2 x - 2 y - 4 z + m = 0$ là phương trình của một mặt cầu.],
      answers: ([$m < 6$], [$m ≥ 6$], [$m ≤ 6$], [$m > 6$]),
      source-id: "tu-luyen-5",
      writing-lines: 3,
      solution: solutions.at("tu-luyen-5"),
    )
    #item(
      "6",
      [Trong không gian với hệ toạ độ $O x y z$, có tất cả bao nhiêu giá trị nguyên của $m$ để $x^(2) + y^(2) + z^(2) + 2 lr(( m + 2 )) x - 2 lr(( m - 1 )) z + 3 m^(2) - 5 = 0$ là phương trình của một mặt cầu.],
      answers: ([$4$], [$6$], [$5$], [$7$]),
      source-id: "tu-luyen-6",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-6"),
    )
    #item(
      "7",
      [Trong không gian $O x y z$ cho hai điểm $I (1; 1; 1)$ và $A (1; 2; 3)$. Phương trình mặt cầu có tâm $I$ và đi qua $A$ là:],
      answers: (
        [$lr(( x + 1 ))^(2) + lr(( y + 1 ))^(2) + lr(( z + 1 ))^(2) = 5$],
        [$lr(( x + 1 ))^(2) + lr(( y + 1 ))^(2) + lr(( z + 1 ))^(2) = 29$],
        [$lr(( x - 1 ))^(2) + lr(( y - 1 ))^(2) + lr(( z - 1 ))^(2) = 5$],
        [$lr(( x - 1 ))^(2) + lr(( y - 1 ))^(2) + lr(( z - 1 ))^(2) = 25$],
      ),
      source-id: "tu-luyen-7",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-7"),
    )
    #item(
      "8",
      [Trong không gian với hệ toạ độ $O x y z$, cho $A (2; -1; -3)$, $B (0; 3; -1)$, Phương trình mặt cầu đường kính $A B$ là:],
      answers: (
        [$lr(( x + 1 ))^(2) + lr(( y + 1 ))^(2) + lr(( z - 2 ))^(2) = 6$],
        [$lr(( x - 1 ))^(2) + lr(( y - 1 ))^(2) + lr(( z + 2 ))^(2) = 24$],
        [$lr(( x + 1 ))^(2) + lr(( y + 1 ))^(2) + lr(( z - 2 ))^(2) = 24$],
        [$lr(( x - 1 ))^(2) + lr(( y - 1 ))^(2) + lr(( z + 2 ))^(2) = 6$],
      ),
      source-id: "tu-luyen-8",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-8"),
    )
    #item(
      "9",
      [Trong không gian $O x y z$, cho điểm $M (1; -2; 3)$. Gọi $I$ là hình chiếu vuông góc của $M$ trên trục $O x$. Phương trình nào sau đây là phương trình mặt cầu tâm $I$ bán kính $I M$?],
      answers: (
        [$lr(( x - 1 ))^(2) + y^(2) + z^(2) = sqrt(13)$.],
        [$lr(( x - 1 ))^(2) + y^(2) + z^(2) = 13$.],
        [$lr(( x + 1 ))^(2) + y^(2) + z^(2) = 13$.],
        [$lr(( x + 1 ))^(2) + y^(2) + z^(2) = 17$.],
      ),
      source-id: "tu-luyen-9",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-9"),
    )
    #item(
      "10",
      [Trong không gian với hệ toạ độ $O x y z$, mặt cầu tâm $I (1; 1; 1)$ và diện tích bằng $4 π$ có phương trình là:],
      answers: (
        [$lr(( x - 1 ))^(2) + lr(( y - 1 ))^(2) + lr(( z - 1 ))^(2) = 4$],
        [$lr(( x + 1 ))^(2) + lr(( y + 1 ))^(2) + lr(( z + 1 ))^(2) = 1$],
        [$lr(( x + 1 ))^(2) + lr(( y + 1 ))^(2) + lr(( z + 1 ))^(2) = 4$],
        [$lr(( x - 1 ))^(2) + lr(( y - 1 ))^(2) + lr(( z - 1 ))^(2) = 1$],
      ),
      source-id: "tu-luyen-10",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-10"),
    )
    #item(
      "11",
      [Trong không gian với hệ trục tọa độ $O x y z$, cho điểm $A (1; 1; 2)$, $B (3; 2; -3)$. Mặt cầu $lr(( S ))$ có tâm $I$ thuộc $O x$ và đi qua hai điểm $A "," B$ có phương trình.],
      answers: (
        [$x^(2) + y^(2) + z^(2) - 8 x + 2 = 0$.],
        [$x^(2) + y^(2) + z^(2) + 8 x + 2 = 0$.],
        [$x^(2) + y^(2) + z^(2) - 4 x + 2 = 0$.],
        [$x^(2) + y^(2) + z^(2) - 8 x - 2 = 0$.],
      ),
      source-id: "tu-luyen-11",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-11"),
    )
    #item(
      "12",
      [Trong không gian với hệ trục tọa độ $O x y z$, cho mặt cầu $lr(( S ))$ có tâm nằm trên mặt phẳng $O x y$ và đi qua ba điểm $A (1; 2; -4)$, $B (1; -3; 1)$, $C (2; 2; 3)$. Tọa độ tâm $lr(( I ))$ của mặt cầu là],
      answers: ([$(2; -1; 0)$.], [$(-2; 1; 0)$.], [$(0; 0; -2)$.], [$(0; 0; 0)$.]),
      source-id: "tu-luyen-12",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-12"),
    )
    #item(
      "13",
      [Trong không gian với hệ tọa độ $O x y z$, cho ba điểm $A (1; 2; -4)$, $B (1; -3; 1)$, $C (2; 2; 3)$. Tính bán kính $R$ của mặt cầu $lr(( S ))$ đi qua ba điểm trên và có tâm nằm trên mặt phẳng $lr(( O x y ))$.],
      answers: ([$R = sqrt(41)$.], [$R = sqrt(15)$.], [$R = sqrt(13)$.], [$R = sqrt(26)$.]),
      source-id: "tu-luyen-13",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-13"),
    )
    #item(
      "14",
      [Cho hai điểm $A "," B$ cố định trong không gian có độ dài $A B$ là 4. Biết rằng tập hợp các điểm $M$ trong không gian sao cho $M A = 3 M B$ là một mặt cầu. Bán kính mặt cầu đó bằng:],
      answers: ([$3$], [$frac(9, 2)$], [$1$], [$frac(3, 2)$]),
      source-id: "tu-luyen-14",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-14"),
    )
    #lesson-section([MỨC VẬN DỤNG CAO 9+], badge: [4])
    #item(
      "15",
      [Trong không gian với hệ toạ độ $O x y z$, cho $A (-2; 2; -2)$ và $B (3; -3; 3)$. Điểm $M$ trong không gian thoả mãn $frac(M A, M B) = frac(2, 3)$. Khi đó $O M$ lớn nhất bằng?],
      answers: ([$6 sqrt(3)$], [$12 sqrt(3)$], [$frac(5 sqrt(3), 2)$], [$5 sqrt(3)$]),
      source-id: "tu-luyen-15",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-15"),
    )
    #item(
      "16",
      [Trong không gian với hệ toạ độ $O x y z$, mặt cầu $lr(( S )) : x^(2) + y^(2) + lr(( z - sqrt(2) ))^(2) = 3$. Có tất cả bao nhiêu điểm $A (a; b; c)$($a "," b "," c$ là các số nguyên) thuộc mặt phẳng $lr(( O x y ))$ sao cho ít nhất hai tiếp tuyến của $lr(( S ))$ đi qua $A$ và hai tiếp tuyến đó vuông góc với nhau?],
      answers: ([$8$], [$16$], [$12$], [$4$]),
      source-id: "tu-luyen-16",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-16"),
    )
    #item(
      "17",
      [Trong không gian với hệ toạ độ $O x y z$, cho mặt cầu $lr(( S ))$ có tâm $I (-2; 1; 2)$ và đi qua điểm $A (1; -2; -1)$. Xét các điểm $B "," C "," D$ thuộc $lr(( S ))$ sao cho $A B "," A C "," A D$ đôi một vuông góc với nhau. Thể tích khối tứ diện có thể tích lớn nhất bằng:],
      answers: ([$72$], [$216$], [$108$], [$36$]),
      source-id: "tu-luyen-17",
      writing-lines: 6,
      solution: solutions.at("tu-luyen-17"),
    )
  ]
}
