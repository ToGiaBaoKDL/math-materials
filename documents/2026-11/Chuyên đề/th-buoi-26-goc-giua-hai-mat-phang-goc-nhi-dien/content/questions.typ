#import "/templates/lesson.typ": exercise, lesson-section, theory-box
#import "/templates/writing.typ": ruled-page-remainder
#import "solutions.typ": solutions
#import "theory.typ": theory
#import "figures.typ": figure
#let questions(variant)={
 let item=exercise.with(variant:variant,question-gap:if variant=="de" {4mm}else{5mm},keep-together:false,flow-stem:true,keep-solution-start:false,
 solution-leading:1.08em,solution-title-above:2mm,solution-title-below:2mm,
 writing-lines:7,writing-line-gap:9mm,writing-heading-gap:1mm,writing-keep-together:true,writing-fill-page-end:true)
 [
 #lesson-section([GÓC GIỮA HAI MẶT PHẲNG – GÓC NHỊ DIỆN],badge:"LT")
 #theory-box(theory)
 #lesson-section([BÀI TẬP MẪU],badge:"VD")
#item("1",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình vuông cạnh $a$, $S A = a sqrt(3)$, $S A$ vuông góc với mp $lr(( A B C D ))$. Tính góc giữa các mặt phẳng sau:

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[a) $lr(( S C D ))$ và $lr(( A B C D ))$.]

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[b) $lr(( S B D ))$ và $lr(( A B C D ))$.]

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[c) Gọi $I$ là trung điểm của $B C$. Tính góc giữa $lr(( S D I ))$ và $lr(( A B C D ))$.]

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[d) Gọi $E$ là điểm đối xứng của $A$ qua $D$. Tính góc giữa $lr(( S C E ))$ và $lr(( A B C D ))$.]
],source-id:"bai-hoc-1",solution:solutions.at("bai-hoc-1"),answers:(),answer-columns:4,writing-lines:8)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("2",[
Cho lăng trụ tam giác đều $A B C . A ' B ' C '$, biết cạnh đáy bằng $a$, cạnh bên bằng $frac(3 a, 2)$.

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[a) Tính góc giữa mp $lr(( A ' B C ))$ và $lr(( A B C ))$.]

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[b) Tính góc giữa $A ' C$ và $lr(( A B B ' A ' ))$.]
],source-id:"bai-hoc-2",solution:solutions.at("bai-hoc-2"),answers:(),answer-columns:4,writing-lines:7)
#item("3",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình thang vuông tại $A$ và $D$, cạnh bên $S A$ vuông góc với mặt đáy và $S A = a sqrt(2)$. Biết $A B = 2 A D = 2 D C = 2 a$. Tính số đo của góc phẳng nhị diện $lr([ C "," S B "," A ])$.
],source-id:"bai-hoc-3",solution:solutions.at("bai-hoc-3"),answers:(),answer-columns:4,writing-lines:7)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("4",[
Cho hình hộp chữ nhật $A B C D . A' B' C' D'$ có đáy là hình chữ nhật $A B = 2 A D = 2 a$ và $A A' = a$. Số đo của góc nhị diện $lr([ A' "," B D "," C ])$ bằng $α$. Tính $tan α$.
],source-id:"bai-hoc-4",solution:solutions.at("bai-hoc-4"),answers:([$frac(sqrt(5), 5)$.],[$- sqrt(5)$.],[$frac(2, sqrt(5))$.],[$- frac(sqrt(5), 2)$.],),answer-columns:4,writing-lines:4)
#item("5",[
Kim tự tháp Giza, một trong bảy kì quan thế giới cổ đại còn tồn tại cho tới ngày nay. Kim tự tháp Giza có hình dạng của một khối chóp tứ giác đều với chiều cao bằng $"146,6" "m"$ và chiều dài cạnh đáy bằng $"230,4" "m"$. Hãy xác định góc nhị diện tạo bởi hai mặt bên kề nhau của kim tự tháp (Tính theo đơn vị độ, làm tròn đến hàng đơn vị).


#figure("giza.jpeg")

],source-id:"bai-hoc-5",solution:solutions.at("bai-hoc-5"),answers:(),answer-columns:4,writing-lines:7)
#if variant=="de-cach" {pagebreak(weak:true)}
#lesson-section([BÀI TẬP TỰ LUYỆN],badge:"BT")
#item("1",[
Cho hình chóp $S . A B C$, hai mp $lr(( S A B ))$ và $lr(( S A C ))$ cùng vuông góc với mp $lr(( A B C ))$, $A B C$ là một tam giác vuông cân tại $A$ có $A B = a$. Biết diện tích tam giác $S B C$ bằng $a ^(2)$.

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[a) Tính góc giữa $lr(( S B C ))$ và $lr(( A B C ))$.]

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[b) Tính góc giữa $S B$ và mp $lr(( S A C ))$.]
],source-id:"tu-luyen-1",solution:solutions.at("tu-luyen-1"),answers:(),answer-columns:4,writing-lines:7)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("2",[
Cho lăng trụ tam giác đều $A B C . A ' B ' C '$, biết cạnh đáy bằng $a$, cạnh bên bằng $a sqrt(3)$ . Tính:

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[a) Góc giữa mp $lr(( A ' B C ))$ và $lr(( A B C ))$.]

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[b) Gọi $I$ là trung điểm của $A B$ . Tính góc giữa $lr(( A ' I C ))$ và $lr(( A B B ' A ' ))$.]
],source-id:"tu-luyen-2",solution:solutions.at("tu-luyen-2"),answers:(),answer-columns:4,writing-lines:7)
#item("3",[
Cho hình chóp tứ giác đều $S . A B C D$ có cạnh bên gấp đôi cạnh đáy. Tính cosin góc giữa mặt bên và mặt đáy của hình chóp.
],source-id:"tu-luyen-3",solution:solutions.at("tu-luyen-3"),answers:(),answer-columns:4,writing-lines:7)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("4",[
Cho hình chóp $S . A B C D$ có $S A ⊥ lr(( A B C D ))$, đáy $A B C D$ là hình thang vuông tại $A$ và $B$, $A B = B C = frac(1, 2) A D = a$. #if variant=="dap-an" {parbreak()} Biết góc giữa mp $lr(( S C D ))$ và $lr(( A B C D ))$ bằng $45 °$ . Tính

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[a) Diện tích tam giác $S A D$.]

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[b) Góc giữa $S D$ và mp $lr(( S A C ))$.]

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[c) Góc giữa $lr(( S B D ))$ và $lr(( A B C D ))$.]
],source-id:"tu-luyen-4",solution:solutions.at("tu-luyen-4"),answers:(),answer-columns:4,writing-lines:8)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("5",[
Cho hình chóp $S . A B C$ có $A B C$ là tam giác vuông cân tại $B$, $A B = a$, $S A$ vuông góc với mp $lr(( A B C ))$, $S A = a$. Tính góc giữa 2 mp $lr(( S A C ))$ và $lr(( S B C ))$.
],source-id:"tu-luyen-5",solution:solutions.at("tu-luyen-5"),answers:(),answer-columns:4,writing-lines:7)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("6",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình thang vuông tại $A ";" B ","$ biết $A B = B C = 2 a$, $A D = 3 a$. Hình chiếu vuông góc của điểm $S$ trên mp $lr(( A B C D ))$ là điểm $H$ thuộc $A B$ với $A H = frac(1, 2) H B$. Biết $S H = frac(16 sqrt(15), 15) a$ . Tính góc giữa 2 mặt phẳng $lr(( S C D ))$ và $lr(( A B C D ))$.
],source-id:"tu-luyen-6",solution:solutions.at("tu-luyen-6"),answers:(),answer-columns:4,writing-lines:7)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("7",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là nửa lục giác đều nội tiếp đường tròn đường kính $A B = 2 a$, $S A ⊥ lr(( A B C D ))$ và $S A = a sqrt(3)$. Tính góc giữa $lr(( S A D ))$ và $lr(( S B C ))$.
],source-id:"tu-luyen-7",solution:solutions.at("tu-luyen-7"),answers:(),answer-columns:4,writing-lines:7)
#item("8",[
Cho tứ diện $S . A B C$ có các cạnh $S A$, $S B$, $S C$ đôi một vuông góc và $S A = S B = S C = 1$. Gọi $α$ là góc phẳng nhị diện $lr([ S "," B C "," A ])$. Tính $cos α$?
],source-id:"tu-luyen-8",solution:solutions.at("tu-luyen-8"),answers:(),answer-columns:4,writing-lines:7)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("9",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình thang vuông tại $A$ và $B$, biết $A D = 2 a$, $A B = B C = a$, cạnh bên $S A$ vuông góc với mặt đáy và $S A = frac(a sqrt(6), 2)$. Gọi $E$ là trung điểm của $A D$. Tính số đo của góc phẳng nhị diện $lr([ S "," B E "," A ])$.
],source-id:"tu-luyen-9",solution:solutions.at("tu-luyen-9"),answers:(),answer-columns:4,writing-lines:7)
#item("10",[
Cho mặt phẳng $lr(( P ))$ và điểm $M$ nằm ngoài $lr(( P ))$. Kẻ $M A$ vuông góc với mặt phẳng $lr(( P ))$ và $M B "," M C$ là hai đường xiên đối với mặt phẳng $lr(( P ))$. Cho biết $M A = a$; $M B "," M C$ tạo với mặt phẳng $lr(( P ))$ các góc $30 °$ và $M B ⊥ M C .$

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[a) Tính độ dài $B C$]

#block(sticky:variant!="dap-an",inset:(left:5mm),above:3mm,below:1mm)[b) Tính số đo nhị diện $lr([ M "," B C "," A ]) .$]
],source-id:"tu-luyen-10",solution:solutions.at("tu-luyen-10"),answers:(),answer-columns:4,writing-lines:7)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("11",[
\[TH\] Lăng trụ tam giác đều $A B C . A' B' C'$ có cạnh đáy bằng $a$. Gọi $M$ là điểm trên cạnh $A A'$ sao cho $A M = frac(3 a, 4)$. Tính tan của góc nhị diện $lr([ M "," B C "," A ])$.
],source-id:"tu-luyen-11",answer-gap:0mm,solution:solutions.at("tu-luyen-11"),answers:([$2$.],[$frac(1, 2)$.],[$frac(sqrt(3), 2)$.],[$frac(sqrt(2), 2)$.],),answer-columns:4,writing-lines:4)
#item("12",[
Cho hình chóp $S . A B C$ có $S A ⊥ ( A B C )$,$S A = frac(sqrt(3), 2) a$, $hat(A S C) = 30 °$. Đáy là tam giác $A B C$ có $B C = a$, $A B = a sqrt(2)$. Khi đó số đo góc nhị diện $[ C "," S A "," B ]$ (làm tròn đến độ) là:
],source-id:"tu-luyen-12",solution:solutions.at("tu-luyen-12"),answers:(),answer-columns:4,writing-lines:7)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("13",[
Cho hình lập phương $A B C D . A _(1) B _(1) C _(1) D _(1)$ có cạnh bằng $2 a$, $O$ là tâm của hình vuông $A B C D$. Khi đó số đo của góc nhị diện $lr([ A "," B D "," C _(1) ])$ là $α °$. Giá trị của $α$ bằng (làm tròn kết quả đến hàng đơn vị).
],source-id:"tu-luyen-13",solution:solutions.at("tu-luyen-13"),answers:(),answer-columns:4,writing-lines:7)
]
}
