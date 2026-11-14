#import "/templates/lesson.typ": exercise, lesson-section, theory-box
#import "theory.typ": theory
#import "solutions.typ": solutions
#let questions(variant)={
let item=exercise.with(variant:variant,keep-together:false,flow-stem:true,keep-solution-start:false,question-gap:4mm,solution-leading:0.95em,solution-title-above:2mm,solution-title-below:2mm,writing-lines:5,writing-line-gap:9mm,writing-heading-gap:1mm,writing-keep-together:true,writing-fill-page-end:false)
[
#theory()
#lesson-section([BÀI TẬP MẪU],badge:"VD")
#item("1",[
Cho hình chóp $S . A B C$ có đáy là tam giác vuông đỉnh $B "," A B = a "," S A$ vuông góc với mặt phẳng đáy và $S A = 2 a$. Khoảng cách từ $A$ đến mặt phẳng $lr(( S B C ))$ bằng:
],source-id:"bai-mau-1",answers:([$frac(2 sqrt(5) a, 5)$],[$frac(sqrt(5) a, 3)$],[$frac(2 sqrt(2) a, 3)$],[$frac(sqrt(5) a, 5)$],),answer-columns:4,solution:solutions.at("bai-mau-1"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("2",[
Cho hình chóp $S . A B C D$ có $S A$ vuông góc với mặt phẳng đáy, đáy $A B C D$ là hình chữ nhật, $S A = A B = a ";" A D = 2 a$.

#block(inset:(left:5mm),above:3mm,below:3mm)[a) Tính khoảng cách từ điểm $A$ đến mặt phẳng $lr(( S C D ))$]

#block(inset:(left:5mm),above:3mm,below:3mm)[b) Tính khoảng cách từ điểm $A$ đến mặt phẳng $lr(( S B D ))$]
],source-id:"bai-mau-2",answers:(),answer-columns:4,solution:solutions.at("bai-mau-2"),writing-lines:7)
#item("3",[
Cho hình chóp $S . A B C D$ có đáy là hình thoi cạnh $2 a$, góc $B A D$ bằng $120 ° "," S A = a$ và $S A$ vuông góc với mặt phẳng đáy. Khoảng cách từ $A$ đến mặt phẳng $lr(( S C D ))$ bằng
],source-id:"bai-mau-3",answers:([$frac(sqrt(21) a, 7)$],[$frac(sqrt(3) a, 2)$],[$frac(sqrt(21) a, 3)$],[$frac(sqrt(15) a, 6)$],),answer-columns:4,solution:solutions.at("bai-mau-3"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("4",[
Cho hình chóp $S . A B C D$ có đáy là hình thoi cạnh $a$, góc $B A D$ bằng $60 °$, $S A = a$ và $S A$ vuông góc với mặt phẳng đáy. Khoảng cách từ $A$ đến mặt phẳng $lr(( S C D ))$ bằng
],source-id:"bai-mau-4",answers:([$frac(sqrt(21) a, 7)$],[$frac(sqrt(15) a, 7)$],[$frac(sqrt(21) a, 3)$],[$frac(sqrt(15) a, 3)$],),answer-columns:4,solution:solutions.at("bai-mau-4"),writing-lines:5)
#item("5",[
Cho chóp tứ giác đều $S . A B C D$ có cạnh đáy bằng $a$, góc giữa cạnh bên và đáy bằng $45 °$. Tính khoảng cách từ điểm $O$ là tâm đáy $A B C D$ đến một mặt bên của hình chóp?
],source-id:"bai-mau-5",answers:(),answer-columns:4,solution:solutions.at("bai-mau-5"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("6",[
Cho lăng trụ tam giác đều $A B C . A ' B ' C '$ có cạnh đáy bằng $a$. Biết góc giữa $A ' B$ và đáy bằng $60 °$. Tính khoảng cách từ điểm $A$ đến mặt phẳng $lr(( A ' B C ))$?
],source-id:"bai-mau-6",answers:(),answer-columns:4,solution:solutions.at("bai-mau-6"),writing-lines:5)
#item("7",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình thang vuông tại $A$ và $B$. Độ dài các cạnh $A B = B C = a "," A D = 2 a "," S D = a sqrt(5)$, cạnh bên $S A$ vuông góc với mặt phẳng đáy. Tính khoảng cách từ điểm $A$ đến mặt phẳng $lr(( S C D ))$.
],source-id:"bai-mau-7",answers:([$d = frac(a sqrt(6), 12)$],[$d = frac(a sqrt(6), 6)$],[$d = frac(a sqrt(6), 3)$],[$d = frac(a sqrt(6), 24)$],),answer-columns:4,solution:solutions.at("bai-mau-7"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("8",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình thang vuông tại $A$ và $B$. Độ dài các cạnh $A B = A D = 2 a "," B C = a "," S D = a sqrt(5)$, cạnh bên $S A$ vuông góc với mặt phẳng đáy. Tính khoảng cách từ điểm $A$ đến mặt phẳng $lr(( S C D ))$.
],source-id:"bai-mau-8",answers:([$d = frac(4 a sqrt(21), 21)$],[$d = frac(2 a sqrt(21), 21)$],[$d = frac(a sqrt(21), 21)$],[$d = frac(a sqrt(21), 7)$],),answer-columns:4,solution:solutions.at("bai-mau-8"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#lesson-section([BÀI TẬP TỰ LUYỆN],badge:"BT")
#item("1",[
Cho hình chóp $S . A B C$ có đáy là tam giác vuông đỉnh $B$, $A B = a$, $S A$ vuông góc với mặt phẳng đáy và $S A = a$. Khoảng cách từ $A$ đến mặt phẳng $( S B C )$ bằng
],source-id:"tu-luyen-1",answers:([$frac(a, 2)$],[$a$],[$frac(sqrt(6) a, 3)$],[$frac(sqrt(2) a, 2)$],),answer-columns:4,solution:solutions.at("tu-luyen-1"),writing-lines:5)
#item("2",[
Cho hình chóp $S . A B C$ có đáy là tam giác vuông đỉnh $A$, $A B = a$, $A C = a sqrt(3)$, $S A$ vuông góc với mặt phẳng đáy và $S A = 2 a$. Khoảng cách từ $A$ đến mặt phẳng $( S B C )$ bằng
],source-id:"tu-luyen-2",answers:([$frac(2 sqrt(3) a, sqrt(7))$],[$frac(sqrt(3) a, sqrt(7))$],[$frac(sqrt(3) a, sqrt(19))$],[$frac(2 sqrt(3) a, sqrt(19))$],),answer-columns:4,solution:solutions.at("tu-luyen-2"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("3",[
Cho hình chóp $S . A B C$ có đáy là tam giác đều cạnh bằng a, $S A = a$, $S A$ vuông góc với mặt phẳng đáy. Khoảng cách từ $A$ đến mặt phẳng $( S B C )$ bằng
],source-id:"tu-luyen-3",answers:([$frac(sqrt(2) a, 2)$],[$frac(sqrt(3) a, 7)$],[$frac(sqrt(21) a, 7)$],[$frac(sqrt(15) a, 5)$],),answer-columns:4,solution:solutions.at("tu-luyen-3"),writing-lines:5)
#item("4",[
Cho hình chóp $S . A B C D$ có đáy là hình vuông cạnh $sqrt(3) a$, $S A$ vuông góc với đáy và $S A = a$. Khoảng cách từ $A$ đến mặt phẳng $( S B C )$ bằng
],source-id:"tu-luyen-4",answers:([$frac(sqrt(3) a, 3)$],[$frac(sqrt(5) a, 3)$],[$frac(sqrt(6) a, 6)$],[$frac(sqrt(3) a, 2)$],),answer-columns:4,solution:solutions.at("tu-luyen-4"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("5",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình vuông cạnh $a$, $S A ⊥ lr(( A B C D ))$ và $S A = 2 a$. Tính $d lr(( A "," lr(( S B D )) ))$.
],source-id:"tu-luyen-5",answers:([$frac(2 a, 3)$],[$frac(a, 3)$],[$frac(a, 6)$],[$frac(a, 2)$],),answer-columns:4,solution:solutions.at("tu-luyen-5"),writing-lines:5)
#item("6",[
Cho chóp tứ giác đều $S . A B C D$ có cạnh đáy bằng a, chiều cao bằng $a sqrt(2)$ . Tính khoảng cách d từ tâm O của đáy ABCD đến 1 mặt bên của hình chóp theo $a$.
],source-id:"tu-luyen-6",answers:([$d = frac(2 sqrt(5) a, 3)$],[$d = frac(a sqrt(3), 2)$],[$d = frac(a sqrt(5), 2)$],[$d = frac(a sqrt(2), 3)$],),answer-columns:4,solution:solutions.at("tu-luyen-6"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("7",[
Cho hình lăng trụ đứng $A B C . A' B' C'$ có tất cả các cạnh bằng $a$. Khoảng cách từ $A$ đến mặt phẳng $lr(( A' B C ))$ bằng
],source-id:"tu-luyen-7",answers:([$frac(sqrt(21) a, 14).$],[$frac(sqrt(2) a, 2).$],[$frac(sqrt(21) a, 7).$],[$frac(sqrt(2) a, 4).$],),answer-columns:4,solution:solutions.at("tu-luyen-7"),writing-lines:5)
#item("8",[
Cho tứ diện $A B C D$ có cạnh $A D ⊥ lr(( A B C ))$, $A C = A D = 4 "cm"$, $A B = 3 "cm"$, $B C = 5 "cm"$. Tính $d lr(( A "," lr(( B C D )) ))$.
],source-id:"tu-luyen-8",answers:([$frac(3 sqrt(34), 17).$],[$frac(2 sqrt(34), 17).$],[$frac(6 sqrt(34), 17).$],[$frac(3 sqrt(34), 34).$],),answer-columns:4,solution:solutions.at("tu-luyen-8"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("9",[
Cho hình chóp $S . A B C$ có $S A ⊥ lr(( A B C ))$, $S A = 3 a$, $A B = a$, góc $∠ A B C = 60 °$. Tính $d lr(( A ";" lr(( S B C )) )) .$
],source-id:"tu-luyen-9",answers:([$frac(a sqrt(13), 13).$],[$frac(2 a sqrt(13), 13).$],[$frac(3 a sqrt(13), 26).$],[$frac(3 a sqrt(13), 13)$],),answer-columns:4,solution:solutions.at("tu-luyen-9"),writing-lines:5)
#item("10",[
Cho hình lăng trụ đứng $A B C . A ' B ' C '$ có $A B = a "," A C = 2 a "," A A ' = 2 a$ và góc $B A C$ bằng $120 °$. Gọi $K$ là trung điểm của cạnh $C C '$. Khoảng cách từ điểm $A$ đến mặt phẳng $lr(( A ' B K ))$ bằng:
],source-id:"tu-luyen-10",answers:([$frac(a sqrt(30), 5)$],[$frac(a sqrt(30), 6)$],[$frac(a sqrt(15), 3)$],[$frac(a sqrt(2), 2)$],),answer-columns:4,solution:solutions.at("tu-luyen-10"),writing-lines:5)
]
}
