#import "/templates/lesson.typ": exercise, lesson-section
#import "theory.typ": theory
#import "solutions.typ": solutions
#let questions(variant)={
let item=exercise.with(variant:variant,keep-together:false,flow-stem:true,keep-solution-start:false,question-gap:4mm,solution-leading:0.95em,solution-title-above:2mm,solution-title-below:2mm,writing-lines:5,writing-line-gap:9mm,writing-heading-gap:1mm,writing-keep-together:true,writing-fill-page-end:false)
[
#theory()
#lesson-section([BÀI TẬP MẪU],badge:"VD")
#item("1",[
Cho hình chóp $S . A B C D$ có $S A$ vuông góc với mặt phẳng đáy, đáy $A B C D$ là hình chữ nhật, $S A = A B = a ";" A D = 2 a$

#block(inset:(left:5mm),above:3mm,below:3mm)[a) Tính khoảng cách từ điểm $B$ đến mặt phẳng $lr(( S C D ))$]

#block(inset:(left:5mm),above:3mm,below:3mm)[b) Tính khoảng cách từ điểm $C$ đến mặt phẳng $lr(( S B D ))$]
],source-id:"bai-mau-1",answers:(),answer-columns:4,solution:solutions.at("bai-mau-1"),writing-lines:8)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("2",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình vuông cạnh $a$, $S A$ vuông góc với mặt phẳng đáy và $S A = a sqrt(2)$. Gọi $M$ là trung điểm cạnh $S C$. Khoảng cách từ điểm $M$ đến mặt phẳng $lr(( S B D ))$ bằng
],source-id:"bai-mau-2",answers:([$frac(sqrt(2) a, 4)$],[$frac(sqrt(10) a, 10)$],[$frac(sqrt(2) a, 2)$],[$frac(sqrt(10) a, 5)$],),answer-columns:4,solution:solutions.at("bai-mau-2"),writing-lines:5)
#item("3",[
Cho hình chóp đều $S . A B C D$ có cạnh đáy bằng $a$, cạnh bên bằng $frac(sqrt(5) a, 2)$. Tính khoảng cách từ điểm $B$ đến mặt phẳng $lr(( S C D ))$.
],source-id:"bai-mau-3",answers:([$frac(a, 4)$],[$frac(sqrt(3) a, 4)$],[$frac(sqrt(3) a, 2)$],[$frac(a, 2)$],),answer-columns:4,solution:solutions.at("bai-mau-3"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("4",[
Cho hình chóp $S . A B C D$ có đáy là hình thoi cạnh $a$, góc $B A D$ bằng $60 ° "," S A = a$ và $S A$ vuông góc với mặt phẳng đáy. Khoảng cách từ điểm $B$ đến mặt phẳng $lr(( S C D ))$ bằng
],source-id:"bai-mau-4",answers:([$frac(sqrt(21) a, 7)$],[$frac(sqrt(15) a, 7)$],[$frac(sqrt(21) a, 3)$],[$frac(sqrt(15) a, 3)$],),answer-columns:4,solution:solutions.at("bai-mau-4"),writing-lines:5)
#item("5",[
Cho hình chóp tứ giác $S . A B C D$ có đáy là hình vuông cạnh bằng $a sqrt(2)$, tam giác $S A B$ vuông cân tại $S$ và mặt phẳng $lr(( S A B ))$ vuông góc với mặt phẳng đáy. Khoảng cách từ điểm $A$ đến mặt phẳng $lr(( S C D ))$ là
],source-id:"bai-mau-5",answers:([$frac(a sqrt(6), 3)$],[$frac(a sqrt(10), 5)$],[$a sqrt(2)$],[$frac(a sqrt(2), 2)$],),answer-columns:4,solution:solutions.at("bai-mau-5"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("6",[
Cho hình chóp $S . A B C D$ có đáy là hình vuông cạnh $a$, mặt bên $S A B$ là tam giác đều và nằm trong mặt phẳng vuông góc với đáy. Khoảng cách từ $A$ đến mặt phẳng $lr(( S B D ))$ bằng
],source-id:"bai-mau-6",answers:([$frac(a sqrt(21), 14)$],[$frac(a sqrt(21), 7)$],[$frac(a sqrt(2), 2)$],[$frac(a sqrt(21), 28)$],),answer-columns:4,solution:solutions.at("bai-mau-6"),writing-lines:5)
#item("7",[
Cho lăng trụ đứng $A B C . A ' B ' C '$ có đáy $A B C$ là tam giác đều cạnh $a$ và $A A ' = 2 a$. Gọi $M$ là trung điểm của $C C '$. Khoảng cách từ điểm $M$ đến mặt phẳng $lr(( A ' B C ))$ bằng
],source-id:"bai-mau-7",answers:([$frac(sqrt(5) a, 5)$],[$frac(2 sqrt(5) a, 5)$],[$frac(2 sqrt(57) a, 19)$],[$frac(sqrt(57) a, 19)$],),answer-columns:4,solution:solutions.at("bai-mau-7"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("8",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình thang vuông tại $A$ và $B$. Độ dài các cạnh $A B = B C = a "," A D = 2 a "," S D = a sqrt(5)$, cạnh bên $S A$ vuông góc với mặt phẳng đáy. Gọi $H$ là hình chiếu của $A$ lên cạnh $S B$. Tính khoảng cách từ điểm $H$ đến mặt phẳng $lr(( S C D ))$.
],source-id:"bai-mau-8",answers:([$d = frac(a sqrt(6), 12)$],[$d = frac(a sqrt(6), 6)$],[$d = frac(a sqrt(6), 3)$],[$d = frac(a sqrt(6), 24)$],),answer-columns:4,solution:solutions.at("bai-mau-8"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#lesson-section([BÀI TẬP TỰ LUYỆN],badge:"BT")
#item("1",[
Cho hình chóp tứ giác đều $S . A B C D$ có cạnh đáy bằng $a$, chiều cao bằng $a sqrt(2)$ . Tính khoảng cách từ điểm $B$ đến mặt phẳng $lr(( S C D ))$.
],source-id:"tu-luyen-1",answers:([$frac(2 sqrt(2) a, 3)$],[$frac(sqrt(3) a, 4)$],[$frac(sqrt(3) a, 2)$],[$frac(sqrt(2) a, 3)$],),answer-columns:4,solution:solutions.at("tu-luyen-1"),writing-lines:5)
#item("2",[
Cho hình chóp $S . A B C D$ có đáy là hình thoi cạnh $a$, góc $∠ A B C$ bằng $60 °$, $S C = 2 a$ và $S A$ vuông góc với mặt phẳng đáy. Khoảng cách từ $B$ đến mặt phẳng $( S C D )$ bằng
],source-id:"tu-luyen-2",answers:([$frac(sqrt(15) a, 5)$],[$frac(sqrt(2) a, 2)$],[$frac(2 sqrt(5) a, 5)$],[$frac(5 sqrt(30) a, 3)$],),answer-columns:4,solution:solutions.at("tu-luyen-2"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("3",[
Cho hình chóp $S . A B C$ có đáy $A B C$ là tam giác vuông tại $A$, $A B = a "," A C = a sqrt(3)$. Tam giác $S B C$ đều và nằm trong mặt phẳng vuông góc với đáy. Tính khoảng cách từ $B$ đến mặt phẳng $(S A C)$.
],source-id:"tu-luyen-3",answers:([$frac(sqrt(39) a, 13)$],[$a$],[$frac(2 sqrt(39) a, 13)$],[$frac(sqrt(3) a, 2)$],),answer-columns:4,solution:solutions.at("tu-luyen-3"),writing-lines:5)
#item("4",[
Cho hình chóp $S . A B C D$ có đáy là hình thoi cạnh $2 a$, góc $B A D$ bằng $60 °$, mặt bên $S A B$ là tam giác đều và nằm trong mặt phẳng vuông góc với đáy. Khoảng cách từ $B$ đến mặt phẳng $( S A C )$ bằng
],source-id:"tu-luyen-4",answers:([$frac(sqrt(39) a, 13)$],[$frac(2 sqrt(41) a, 13)$],[$frac(sqrt(41) a, 13)$],[$frac(2 sqrt(39) a, 13)$],),answer-columns:4,solution:solutions.at("tu-luyen-4"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("5",[
Cho hình chóp $S . A B C D$ có đáy là hình thoi cạnh $2 a$, góc $B A D$ bằng $60 °$, mặt bên $S A B$ là tam giác đều và nằm trong mặt phẳng vuông góc với đáy. Khoảng cách từ $B$ đến mặt phẳng $( S C D )$ bằng
],source-id:"tu-luyen-5",answers:([$frac(sqrt(3) a, 2)$],[$frac(3 a, 2)$],[$frac(sqrt(6) a, 2)$],[$a sqrt(6)$],),answer-columns:4,solution:solutions.at("tu-luyen-5"),writing-lines:5)
#item("6",[
Cho hình chóp $S . A B C$ có $S A = a$, tam giác $A B C$ đều, tam giác $S A B$ vuông cân tại $S$ và nằm trong mặt phẳng vuông góc với mặt phẳng đáy. Khoảng cách từ $B$ đến mặt phẳng $lr(( S A C ))$ bằng
],source-id:"tu-luyen-6",answers:([$frac(a sqrt(42), 7)$.],[$frac(a sqrt(42), 14)$.],[$frac(a sqrt(42), 12)$.],[$frac(a sqrt(42), 6)$.],),answer-columns:4,solution:solutions.at("tu-luyen-6"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("7",[
Cho hình chóp $S . A B C D$ có đáy là hình vuông cạnh $a$, mặt bên $S A B$ là tam giác đều và nằm trong mặt phẳng vuông góc với đáy. Khoảng cách từ $C$ đến mặt phẳng $( S B D )$ bằng
],source-id:"tu-luyen-7",answers:([$frac(sqrt(21) a, 14)$],[$frac(sqrt(21) a, 7)$],[$frac(sqrt(2) a, 2)$],[$frac(sqrt(21) a, 28)$],),answer-columns:4,solution:solutions.at("tu-luyen-7"),writing-lines:5)
#item("8",[
Cho hình lăng trụ đứng $A B C . A' B' C'$ có tất cả các cạnh bằng $a$. Gọi $M$ là trung điểm của $C C'$ . Khoảng cách từ $M$ đến mặt phẳng $lr(( A' B C ))$ bằng
],source-id:"tu-luyen-8",answers:([$frac(sqrt(21) a, 14)$],[$frac(sqrt(2) a, 2)$],[$frac(sqrt(21) a, 7)$],[$frac(sqrt(2) a, 4)$],),answer-columns:4,solution:solutions.at("tu-luyen-8"),writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("9",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình thang vuông tại $A$ và $B$. Độ dài các cạnh $A B = B C = a "," A D = 2 a$. Hình chiếu vuông góc của điểm S trên mặt phẳng đáy trùng với trung điểm H của AD và $S H = frac(a sqrt(6), 2)$ . Tính khoảng cách $d$ từ $B$ đến mặt phẳng $( S C D )$.
],source-id:"tu-luyen-9",answers:([$d = frac(a sqrt(6), 8)$],[$d = a$],[$d = frac(a sqrt(6), 4)$],[$d = frac(a sqrt(15), 5)$],),answer-columns:4,solution:solutions.at("tu-luyen-9"),writing-lines:5)
]
}
