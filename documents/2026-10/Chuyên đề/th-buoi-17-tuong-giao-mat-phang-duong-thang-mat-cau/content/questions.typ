#import "/templates/lesson.typ": exercise, lesson-section, paragraph, theory-box
#import "solutions.typ": solutions
#import "theory.typ": theory
#let questions(variant) = {
  set par(justify: false)
  let item = exercise.with(variant: variant, question-gap: 7mm,
    keep-together: false, flow-stem: true, keep-solution-start: true,
    writing-line-gap: 9mm, writing-single-page: true, fill-writing-page: true)
  [
#theory(1,variant:variant)
#item("1", [Trong không gian với hệ trục tọa độ $O x y z$, cho hai đường thẳng $d _(1) : frac(x - 1, 2) = frac(y, 1) = frac(z + 2, - 2)$ và $d _(2) : frac(x + 2, - 2) = frac(y - 1, - 1) = frac(z, 2)$. Xét sự tương đối của hai đường thẳng đã cho?],
  answers: ([Chéo nhau],[Trùng nhau],[Song song],[Cắt nhau],),
  source-id: "bai-hoc-1", writing-lines: 4, solution: solutions.at("bai-hoc-1"))
#item("2", [Trong không gian với hệ tọa độ $O x y z$, cho hai đường thẳng $d _(1) : cases(display(x = 2 - 2 t _(1)), display(y = 4), display(z = - 3 + 6 t _(1)))$ và $d _(2) : cases(display(x = 1 - t _(2)), display(y = 2 + 2 t _(2)), display(z = 3 t _(2)))$. Khẳng định nào sau đây là đúng?],
  answers: ([$d _(1) ";" d _(2)$ chéo nhau],[$d _(1) ≡ d _(2)$],[$d _(1) ⊥ d _(2)$],[$d _(1)$ cắt $d _(2)$],),
  source-id: "bai-hoc-2", writing-lines: 5, solution: solutions.at("bai-hoc-2"))
#theory(2,variant:variant)
#item("3", [Trong không gian với hệ tọa độ $O x y z$, phương trình nào dưới đây là phương trình mặt cầu có tâm $I lr(( 1 ";" 2 ";" - 1 ))$ và tiếp xúc với mặt phẳng $lr(( P )) : x - 2 y - 2 z - 8 = 0$?],
  answers: ([$lr(( x - 1 )) ^(2) + lr(( y - 2 )) ^(2) + lr(( z + 1 )) ^(2) = 3$],[$lr(( x - 1 )) ^(2) + lr(( y - 2 )) ^(2) + lr(( z + 1 )) ^(2) = 9$],[$lr(( x + 1 )) ^(2) + lr(( y + 2 )) ^(2) + lr(( z - 1 )) ^(2) = 9$],[$lr(( x + 1 )) ^(2) + lr(( y + 2 )) ^(2) + lr(( z - 1 )) ^(2) = 3$],),
  source-id: "bai-hoc-3", writing-lines: 3, solution: solutions.at("bai-hoc-3"))
#item("4", [Trong không gian với hệ tọa độ $O x y z$, cho mặt phẳng $lr(( P )) : x - 2 y + 2 z - 2 = 0$ và điểm $I lr(( - 1 ";" 2 ";" - 1 ))$. Viết phương trình mặt cầu $lr(( S ))$ có tâm $I$ và cắt mặt phẳng $lr(( P ))$ theo giao tuyến là đường tròn có bán kính bằng $5$?],
  answers: ([$lr(( x + 1 )) ^(2) + lr(( y - 2 )) ^(2) + lr(( z + 1 )) ^(2) = 25$],[$lr(( x + 1 )) ^(2) + lr(( y - 2 )) ^(2) + lr(( z + 1 )) ^(2) = 16$],[$lr(( x - 1 )) ^(2) + lr(( y + 2 )) ^(2) + lr(( z - 1 )) ^(2) = 34$],[$lr(( x + 1 )) ^(2) + lr(( y - 2 )) ^(2) + lr(( z + 1 )) ^(2) = 34$],),
  source-id: "bai-hoc-4", writing-lines: 4, solution: solutions.at("bai-hoc-4"))
#item("5", [Trong không gian $O x y z$, cho $lr(( P )) : 6 x + 3 y - 2 z - 1 = 0$ và mặt cầu $lr(( S )) : x ^(2) + y ^(2) + z ^(2) - 6 x - 4 y - 2 z - 11 = 0$. Chứng minh mặt phẳng $lr(( P ))$ cắt mặt cầu $lr(( S ))$ theo giao tuyến là một đường tròn. Tìm toạ độ tâm và bán kính của $lr(( C ))$.],
  answers: (),
  source-id: "bai-hoc-5", writing-lines: 9, solution: solutions.at("bai-hoc-5"))
#item("6", [Trong không gian $O x y z$, cho $A lr(( 1 ";" - 2 ";" 3 )) "," B lr(( - 1 ";" 0 ";" 1 ))$ và mặt phẳng $lr(( P )) : x + y + z + 4 = 0$. Viết phương trình mặt cầu $lr(( S ))$ có bán kính bằng $frac(A B, 6)$ có tâm thuộc đường thẳng $A B$ và mặt cầu $lr(( S ))$ tiếp xúc với mặt phẳng $lr(( P ))$.],
  answers: (),
  source-id: "bai-hoc-6", writing-lines: 8, solution: solutions.at("bai-hoc-6"))
#theory(3,variant:variant)
#item("7", [Trong không gian với hệ tọa độ $O x y z$, cho mặt phẳng $lr(( P )) : 2 x - 2 y + z + 3 = 0$ và mặt cầu $lr(( S )) : lr(( x - 1 )) ^(2) + lr(( y + 3 )) ^(2) + z ^(2) = 9$ và đường thẳng $d : frac(x, - 2) = frac(y + 2, 1) = frac(z + 1, 2)$. Cho các phát biểu sau đây:

I. Đường thẳng $d$ cắt mặt cầu $lr(( S ))$ tại 2 điểm phân biệt.

II. Mặt phẳng $lr(( P ))$ tiếp xúc với mặt cầu $lr(( S ))$.

III. Mặt phẳng $lr(( P ))$ và mặt cầu $lr(( S ))$ không có điểm chung.

IV. Đường thẳng $d$ cắt mặt phẳng $lr(( P ))$ tại một điểm.

Số phát biểu đúng là:],
  answers: ([$4$.],[$1$.],[$2$.],[$3$.],),
  source-id: "bai-hoc-7", writing-lines: 8, solution: solutions.at("bai-hoc-7"))
#item("8", [Trong không gian $O x y z$, cho mặt cầu $lr(( S )) : x ^(2) + y ^(2) + z ^(2) + 4 x - 6 y + m = 0$ ( $m$ là tham số) và đường thẳng $Δ : cases(display(x = 4 + 2 t), display(y = 3 + t), display(z = 3 + 2 t))$. Biết đường thẳng $Δ$ cắt mặt cầu $lr(( S ))$ tại hai điểm phân biệt $A "," B$ sao cho $A B = 8$. Giá trị của $m$ là],
  answers: ([$m = 5$.],[$m = 12$.],[$m = - 12$.],[$m = - 10$.],),
  source-id: "bai-hoc-8", writing-lines: 6, solution: solutions.at("bai-hoc-8"))
#lesson-section([BÀI TẬP TỰ LUYỆN], badge: [4])
#item("1", [Trong không gian với hệ tọa độ $O x y z$ cho hai đường thẳng $d _(1) : frac(x - 1, 2) = frac(y, 1) = frac(z + 2, - 2)$, $d _(2) : frac(x + 2, - 2) = frac(y - 1, - 1) = frac(z, 2)$. Xét vị trí tương đối của hai đường thẳng đã cho.],
  answers: ([Chéo nhau],[Trùng nhau],[Song song],[Cắt nhau],),
  source-id: "tu-luyen-1", writing-lines: 3, solution: solutions.at("tu-luyen-1"))
#item("2", [Trong không gian tọa độ $O x y z$, xét vị trí tương đối của hai đường thẳng

$Δ _(1) : frac(x - 1, 2) = frac(y + 1, 2) = frac(z, 3) "," Δ _(2) : frac(x - 3, - 1) = frac(y - 3, - 2) = frac(z + 2, 1)$],
  answers: ([$Δ _(1)$ song song với $Δ _(2)$.],[$Δ _(1)$ chéo với $Δ _(2)$.],[$Δ _(1)$ cắt $Δ _(2)$.],[$Δ _(1)$ trùng với $Δ _(2)$.],),
  question-gap: if variant == "de-cach" { 4mm } else { 7mm }, writing-line-gap: 8mm,
  source-id: "tu-luyen-2", writing-lines: 3, solution: solutions.at("tu-luyen-2"))
#item("3", [Trong không gian với hệ tọa độ Oxyz, cho đường thẳng $d : frac(x + 1, 1) = frac(y, - 3) = frac(z - 5, - 1)$ và mặt phẳng $lr(( P )) : 3 x - 3 y + 2 z + 6 = 0$. Mệnh đề nào dưới đây đúng?],
  answers: ([$d$ cắt và không vuông góc với $lr(( P )).$],[$d$ vuông góc với $lr(( P )).$],[$d$ song song với $lr(( P )).$],[$d$ nằm trong $lr(( P )).$],),
  question-gap: if variant == "de-cach" { 4mm } else { 7mm }, writing-line-gap: 8mm,
  source-id: "tu-luyen-3", writing-lines: 3, solution: solutions.at("tu-luyen-3"))
#item("4", [Trong không gian với hệ tọa độ $O x y z$, cho đường thẳng $Δ : frac(x, - 2) = frac(y - 2, 1) = frac(z + 1, 3)$ và mặt phẳng $lr(( P )) : 11 x + m y + n z - 16 = 0$. Biết $Δ ⊂ lr(( P ))$, tính giá trị của $T = m + n$.],
  answers: ([$T = 2$.],[$T = - 2$.],[$T = 14$.],[$T = - 14$.],),
  question-gap: if variant == "de-cach" { 4mm } else { 7mm }, writing-line-gap: 8mm,
  source-id: "tu-luyen-4", writing-lines: 3, solution: solutions.at("tu-luyen-4"))
#item("5", [Trong không gian tọa độ $O x y z$, cho đường thẳng $d : frac(x - 1, 1) = frac(y - 2, 3) = frac(z - 9, - 1)$ và mặt phẳng $lr(( α ))$ có phương trình $m ^(2) x - m y - 2 z + 19 = 0$ với $m$ là tham số. Tập hợp các giá trị $m$ thỏa mãn $d ∥ lr(( α ))$ là],
  answers: ([$lr(\{ 1 \})$.],[$∅$.],[$lr(\{ 1 ";" 2 \})$.],[$lr(\{ 2 \})$.],),
  source-id: "tu-luyen-5", writing-lines: 5, solution: solutions.at("tu-luyen-5"))
#item("6", [Trong không gian với hệ trục toạ độ $O x y z$, tìm tất cả các giá trị của tham số $m$ để đường thẳng $d$ : $frac(x - 1, 1) = frac(y + 1, - 1) = frac(z - 2, 1)$ song song với mặt phẳng $lr(( P )) : 2 x + y - m ^(2) z + m = 0$],
  answers: ([$m = 1$.],[$m ∈ ∅$],[$m ∈ lr(\{ - 1 ";" 1 \})$.],[$m = - 1$],),
  source-id: "tu-luyen-6", writing-lines: 5, solution: solutions.at("tu-luyen-6"))
#item("7", [Gọi $m "," n$ là hai giá trị thực thỏa mãn: giao tuyến của hai mặt phẳng $lr(( P _(m) )) : m x + 2 y + n z + 1 = 0$ và $lr(( Q _(m) )) : x - m y + n z + 2 = 0$ vuông góc với mặt phẳng $lr(( α )) : 4 x - y - 6 z + 3 = 0$.],
  answers: ([$m + n = 0$.],[$m + n = 2$.],[$m + n = 1$.],[$m + n = 3$.],),
  source-id: "tu-luyen-7", writing-lines: 6, solution: solutions.at("tu-luyen-7"))
#item("8", [Trong không gian với hệ tọa độ $O x y z$, cho điểm $I lr(( 1 ";" 2 ";" 3 ))$ và mặt phẳng $lr(( P )) : 2 x - 2 y - z - 4 = 0$. Mặt cầu tâm $I$ tiếp xúc với $lr(( P ))$ tại điểm $H$. Tìm tọa độ điểm $H$.],
  answers: ([$H lr(( 1 ";" - 1 ";" 0 ))$],[$H lr(( - 3 ";" 0 ";" - 2 ))$],[$H lr(( - 1 ";" 4 ";" 4 ))$],[$H lr(( 3 ";" 0 ";" 2 ))$],),
  source-id: "tu-luyen-8", writing-lines: 5, solution: solutions.at("tu-luyen-8"))
#item("9", [Trong không gian $O x y z$, biết mặt cầu $lr(( S ))$ có tâm $O$ và tiếp xúc với mặt phẳng $lr(( P )) : x - 2 y + 2 z + 9 = 0$ tại điểm $H lr(( a ";" b ";" c ))$. Giá trị của tổng $a + b + c$ bằng],
  answers: ([$2$.],[$- 1$.],[$1.$],[$- 2$.],),
  source-id: "tu-luyen-9", writing-lines: 4, solution: solutions.at("tu-luyen-9"))
#item("10", [Trong không gian $O x y z$, cho điểm $I lr(( 1 ";" 0 ";" 2 ))$ và đường thẳng $d : frac(x - 1, 2) = frac(y, - 1) = frac(z, 1)$. Gọi $lr(( S ))$ là mặt cầu có tâm $I$, tiếp xúc với đường thẳng $d$. Bán kính của $lr(( S ))$ bằng],
  answers: ([$frac(5, 3)$.],[$frac(2 sqrt(5), 3)$.],[$frac(sqrt(30), 3)$.],[$frac(4 sqrt(2), 3)$.],),
  source-id: "tu-luyen-10", writing-lines: 5, solution: solutions.at("tu-luyen-10"))
#item("11", [Trong không gian $O x y z$, bán kính mặt cầu tâm $I lr(( 1 ";" 3 ";" 5 ))$ và tiếp xúc với đường thẳng $d : frac(x, 1) = frac(y + 1, - 1) = frac(z - 2, - 1)$ bằng?],
  answers: ([$sqrt(7)$],[$sqrt(14)$],[$7$],[$14$],),
  source-id: "tu-luyen-11", writing-lines: 5, solution: solutions.at("tu-luyen-11"))
#item("12", [Trong không gian với hệ tọa độ Oxyz, cho điểm $I lr(( 2 ";" 3 ";" - 1 ))$ và đường thẳng $d : frac(x + 7, 2) = frac(y + 9, 1) = frac(z + 7, - 2)$. Viết phương trình mặt cầu tâm I và cắt đường thẳng d tại hai điểm A, B thỏa mãn $A B = 40$.],
  answers: ([$lr(( x - 2 )) ^(2) + lr(( y - 3 )) ^(2) + lr(( z + 1 )) ^(2) = 25 ^(2)$],[$lr(( x + 2 )) ^(2) + lr(( y + 3 )) ^(2) + lr(( z + 4 )) ^(2) = 25 ^(2)$],[$lr(( x - 2 )) ^(2) + y ^(2) + lr(( z + 1 )) ^(2) = 25$],[$lr(( x - 2 )) ^(2) + lr(( y - 3 )) ^(2) + lr(( z - 1 )) ^(2) = 25$],),
  source-id: "tu-luyen-12", writing-lines: 5, solution: solutions.at("tu-luyen-12"))
#item("13", [Trong không gian với hệ tọa độ Oxyz, cho mặt phẳng $lr(( P )) : 3 x + y - 3 z + 6 = 0$ và mặt cầu $lr(( S )) : lr(( x - 4 )) ^(2) + lr(( y + 5 )) ^(2) + lr(( z + 2 )) ^(2) = 25$. Mặt phẳng $lr(( P ))$ cắt mặt cầu $lr(( S ))$ theo giao tuyến là một đường tròn bán kính r bằng bao nhiêu?],
  answers: ([$r = sqrt(5)$],[$r = 5$],[$r = 6$],[$r = sqrt(6)$],),
  source-id: "tu-luyen-13", writing-lines: 3, solution: solutions.at("tu-luyen-13"))
#item("14", [Trong không gian với hệ tọa độ Oxyz, cho mặt cầu $lr(( S )) : x ^(2) + lr(( y - 1 )) ^(2) + lr(( z - 1 )) ^(2) = 25$ và mặt phẳng $lr(( P )) : x + 2 y + 2 z + 5 = 0$. Diện tích hình tròn thiết diện của $lr(( P ))$ và $lr(( S ))$ là.],
  answers: ([$25 π$],[$9 π$],[$16$],[$16 π$],),
  source-id: "tu-luyen-14", writing-lines: 3, solution: solutions.at("tu-luyen-14"))
#item("15", [Trong không gian với hệ trục tọa độ $O x y z$ cho mặt phẳng $lr(( α ))$ có phương trình $2 x + y - z - 1 = 0$ và mặt cầu $lr(( S ))$ có phương trình $lr(( x - 1 )) ^(2) + lr(( y - 1 )) ^(2) + lr(( z + 2 )) ^(2) = 4$. Xác định bán kính $r$ của đường tròn là giao tuyến của mặt phẳng $lr(( α ))$ và mặt cầu $lr(( S ))$.],
  answers: ([$r = frac(2 sqrt(42), 3)$.],[$r = frac(2 sqrt(3), 3)$],[$r = frac(2 sqrt(15), 3)$.],[$r = frac(2 sqrt(7), 3)$],),
  source-id: "tu-luyen-15", writing-lines: 3, solution: solutions.at("tu-luyen-15"))
#item("16", [Trong không gian với hệ tọa độ Oxyz, cho các đường thẳng $d : cases(display(x = t), display(y = - 6 + t), display(z = 2 - t))$ và $Δ : cases(display(x = 5 + 2 t), display(y = 1 + t), display(z = - 1 - t))$ và mặt phẳng $lr(( P )) : x + 3 y - z - 1 = 0$. Mặt cầu $lr(( S ))$ có tâm I thuộc d, tiếp xúc với cả $Δ$ và $lr(( P ))$. Biết hoành độ điểm I là số nguyên. Tung độ của điểm I là.],
  answers: ([2],[0],[-4],[-2],),
  source-id: "tu-luyen-16", writing-lines: 8, solution: solutions.at("tu-luyen-16"))
#item("17", [Trong không gian với hệ tọa độ $O x y z$, cho điểm $E lr(( 1 ";" 1 ";" 1 ))$, mặt cầu $lr(( S )) : x ^(2) + y ^(2) + z ^(2) = 4$ và mặt phẳng $lr(( P )) : x - 3 y + 5 z - 3 = 0$. Gọi $Δ$ là đường thẳng đi qua $E$, nằm trong $lr(( P ))$ và cắt mặt cầu $lr(( S ))$ tại hai điểm $A "," B$ sao cho tam giác $O A B$ là tam giác đều. Phương trình của đường thẳng $Δ$ là],
  answers: ([$frac(x - 1, - 2) = frac(y - 1, 1) = frac(z - 1, - 1)$.],[$frac(x - 1, 2) = frac(y - 1, 1) = frac(z - 1, - 1)$.],[$frac(x - 1, 2) = frac(y - 1, 1) = frac(z - 1, 1)$.],[$frac(x - 1, 2) = frac(y - 1, - 1) = frac(z - 1, - 1)$.],),
  source-id: "tu-luyen-17", writing-lines: 8, solution: solutions.at("tu-luyen-17"))
  ]
}
