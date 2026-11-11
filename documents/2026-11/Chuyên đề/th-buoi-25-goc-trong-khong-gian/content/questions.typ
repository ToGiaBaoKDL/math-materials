#import "/templates/lesson.typ": exercise, lesson-section, theory-box
#import "/templates/components.typ": choices
#import "solutions.typ": solutions
#import "theory.typ": theory
#import "figures.typ": figure
#let questions(variant) = {
 let item=exercise.with(variant:variant,question-gap:5mm,keep-together:true,flow-stem:false,keep-solution-start:false,
  solution-leading:1.08em,solution-title-above:2mm,solution-title-below:2mm,
  writing-lines:3,writing-line-gap:9mm,writing-heading-gap:0mm,
  writing-flow-prompt:false,writing-keep-together:true,writing-fill-page-end:false)

[
#lesson-section([XÁC ĐỊNH GÓC GIỮA HAI ĐƯỜNG THẲNG CHÉO NHAU],number:1,above:3mm,below:3mm)
#theory-box(theory.at("t1"))
#item("1",[
Cho hình lăng trụ tam giác đều $A B C . A ' B ' C '$ có $A B = a ";"   A A ' = a sqrt(3)$. Góc giữa hai đường thẳng $A B '$ và $C C '$ bằng
],source-id:"bai-hoc-1",solution:solutions.at("bai-hoc-1"),answers:([$30 °$.],[$60 °$.],[$45 °$.],[$90 °$.],),answer-columns:4)
#item("2",[
Cho hình lập phương $A B C D . A' B' C' D'$. Góc giữa hai đường thẳng $B A'$ và $C D$ bằng
],source-id:"bai-hoc-2",solution:solutions.at("bai-hoc-2"),answers:([$60 °$.],[$90 °$.],[$45 °$.],[$30 °$.],),answer-columns:4)
#item("3",[
Cho hình chóp $S . A B C$ có $S A = S B = S C = A B = a ";"   A C = a sqrt(2)$ và $B C = a sqrt(3)$. Tính cosin góc giữa hai đường thẳng $S C$ và $A B$.
],writing-lines:5,source-id:"bai-hoc-3",solution:solutions.at("bai-hoc-3"),answers:(),answer-columns:4)
#if variant=="de-cach" { pagebreak(weak:true) }
#item("4",[
Cho hình chóp $S . A B C$ có đáy là tam giác đều cạnh $a$, $S A ⊥ lr(( A B C ))$ và $S A = a sqrt(3)$. Gọi $M$, $N$ lần lượt là trung điểm $A B$ và $S C$. Tính cosin của góc giữa hai đường thẳng $A N$ và $C M$.
],writing-lines:5,source-id:"bai-hoc-4",solution:solutions.at("bai-hoc-4"),answers:(),answer-columns:4)
#item("5",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình vuông, cạnh bên $S A$ vuông góc với mặt phẳng đáy, $S A = A B = a .$ Gọi $M$ là trung điểm của $S B .$ Góc giữa $A M$ và $B D$ bằng
],writing-lines:5,source-id:"bai-hoc-5",solution:solutions.at("bai-hoc-5"),answers:([$45 °$.],[$30 °$.],[$90 °$.],[$60 °$.],),answer-columns:4)
#lesson-section([GÓC GIỮA ĐƯỜNG THẲNG VÀ MẶT PHẲNG],number:2,above:3mm,below:3mm)
#theory-box(theory.at("t2"))
#item("6",[
Cho hình chóp $S . A B C$ có đáy $A B C$ là tam giác vuông cân với $A B = A C = a$, mặt bên $lr(( S A C ))$ là tam giác đều và nằm trong mặt phẳng vuông góc với đáy. Tính tang của góc giữa $S B$ và mặt phẳng đáy
],writing-lines:5,source-id:"bai-hoc-6",solution:solutions.at("bai-hoc-6"),answers:(),answer-columns:4)
#if variant=="de-cach" { pagebreak(weak:true) }
#item("7",[
Cho khối lăng trụ đứng $A B C . A' B' C'$ có $B' B = a$, đáy $A B C$ là tam giác vuông cân tại $B$ và $A C = a sqrt(3)$. Góc giữa $C' A$ và mp $lr(( A B C ))$ bằng
],source-id:"bai-hoc-7",solution:solutions.at("bai-hoc-7"),answers:([$60 °$.],[$90 °$.],[$45 °$.],[$30 °$.],),answer-columns:4)
#item("8",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình vuông cạnh $2 a$, $S A$ vuông góc với mặt phẳng đáy và $S A = 2 a$. Tính góc giữa đường thẳng $S D$ và mặt phẳng $lr(( S A C ))$
],source-id:"bai-hoc-8",solution:solutions.at("bai-hoc-8"),answers:(),answer-columns:4)
#item("9",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình vuông cạnh $a$, hình chiếu vuông góc của $S$ lên mặt đáy là trung điểm $M$ của cạnh $A D "," S M = frac(a sqrt(3), 2)$. Gọi $N$ là trung điểm của cạnh $B C$. Tính $sin$ của góc giữa $S N$ và mặt phẳng $( S B M )$.
],writing-lines:5,source-id:"bai-hoc-9",solution:solutions.at("bai-hoc-9"),answers:([$frac(2, sqrt(35))$.],[$frac(3, sqrt(35))$.],[$frac(sqrt(3), 2)$.],[$frac(1, 2)$.],),answer-columns:4)
#if variant=="de-cach" { pagebreak(weak:true) }
#lesson-section([BÀI TẬP TỰ LUYỆN],badge:"BT",above:3mm,below:3mm)
#item("1",[
Cho hình chóp $S . A B C D$ có tất cả các cạnh đều bằng nhau. Gọi $I$ và $J$ lần lượt là trung điểm của $S C$ và $B C$. Số đo của góc $lr(( I J "," C D ))$ bằng:
],source-id:"tu-luyen-1",solution:solutions.at("tu-luyen-1"),answers:([$90 °$.],[$45 °$.],[$60 °$.],[$30 °$.],),answer-columns:4)
#item("2",[
Cho hình lập phương $A B C D . A' B' C' D' .$ Góc giữa hai đường thẳng $A' B$ và $C D$ bằng
],source-id:"tu-luyen-2",solution:solutions.at("tu-luyen-2"),answers:([$30 ° .$],[$90 ° .$],[$45 ° .$],[$60 ° .$],),answer-columns:4)
#item("3",[
Cho hình lập phương $A B C D . A _(1) B _(1) C _(1) D _(1)$. Góc giữa hai đường thẳng $A C$ và $D A _(1)$ bằng
],source-id:"tu-luyen-3",solution:solutions.at("tu-luyen-3"),answers:([$60 °$.],[$90 °$.],[$45 °$.],[$120 °$.],),answer-columns:4)
#if variant=="de-cach" { pagebreak(weak:true) }
#item("4",[
Cho hình lập phương $A B C D . A' B' C' D'$. Tính góc giữa hai đường thẳng

#block(above:2mm,below:0pt,inset:(left:6mm))[a) $A' B$ và $B' C$.]
#block(above:2mm,below:0pt,inset:(left:6mm))[b) $A C$ và $A' D$.]
],writing-lines:5,source-id:"tu-luyen-4",solution:solutions.at("tu-luyen-4"),answers:(),answer-columns:4)
#item("5",[
Cho hình chóp $S . A B C D$ có tất cả các cạnh đều bằng $a$. Gọi $I$ và $J$ lần lượt là trung điểm của $S C$ và $B C$. Số đo của góc $hat(lr(( I J "," C D )))$ bằng
],source-id:"tu-luyen-5",solution:solutions.at("tu-luyen-5"),answers:([$90 °$.],[$45 °$.],[$60 °$.],[$30 °$.],),answer-columns:4)
#[
#set par(justify:false)
#item("6",[
Cho hình chóp $S . A B C$ có độ dài các cạnh $S A = S B = S C = A B = A C = a$ và $B C = a sqrt(2)$. Góc giữa hai đường thẳng $A B$ và $S C$ bằng
],writing-lines:5,source-id:"tu-luyen-6",solution:solutions.at("tu-luyen-6"),answers:([$60 °$.],[$90 °$.],[$30 °$.],[$45 °$.],),answer-columns:4)
]

#if variant=="de-cach" { pagebreak(weak:true) }
#item("7",[
Cho hình chóp $S . A B C D$ có đáy hình vuông, tam giác $S A B$ vuông tại $S$ và $hat(S B A) = 30 °$. Mặt phẳng $lr(( S A B ))$ vuông góc với mặt phẳng đáy. Gọi $M$ là trung điểm của $A B$. Tính cosin góc tạo bởi hai đường thẳng $lr(( S M "," B D ))$.
],writing-lines:5,question-gap:if variant=="dap-an" {3mm} else {5mm},source-id:"tu-luyen-7",solution:solutions.at("tu-luyen-7"),answers:([$frac(1, sqrt(3))$.],[$frac(sqrt(2), sqrt(3))$.],[$frac(sqrt(26), 13)$.],[$frac(sqrt(2), 4)$.],),answer-columns:4)
#item("8",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình vuông cạnh $a$, cạnh bên $S A = 2 a$ và vuông góc với mặt phẳng đáy. Gọi $F$ là trung điểm cạnh $A B$ và $G$ là trung điểm của $S F$. Gọi $α$ là góc tạo bởi hai đường thẳng $C G$ và $B D$. Tính $cos α$?
],writing-lines:5,source-id:"tu-luyen-8",solution:solutions.at("tu-luyen-8"),answers:([$frac(sqrt(82), 41)$.],[$frac(sqrt(41), 41)$.],[$frac(2 sqrt(41), 41)$.],[$frac(sqrt(82), 82)$.],),answer-columns:4)
#item("9",[
Cho hình lăng trụ đứng $A B C . A' B' C'$ có đáy là tam giác vuông tại $A$, $B A = 2 A C = 2 a$, cạnh bên $A A' = 2 a$, $M$ là trung điểm $B C$ (minh họa như hình dưới). Cosin góc giữa hai đường thẳng $B' C$ và $A M$ bằng

#v(3mm)
#choices(([$-frac(sqrt(5),5)$.],[$frac(sqrt(5),5)$.],[$-frac(1,2)$.],[$frac(1,2)$.]),columns:2)
],figure-side:figure("lang-tru-vuong-am.svg",width:55mm),figure-columns:(1fr,55mm),writing-lines:5,source-id:"tu-luyen-9",solution:solutions.at("tu-luyen-9"),answers:())
#if variant=="de-cach" { pagebreak(weak:true) }
#item("10",[
Cho hình lăng trụ đứng $A B C . A' B' C'$ có đáy là tam giác vuông tại $A$, $A B = a$, $A C = a sqrt(3)$ và $A A' = 2 a$. Tính góc giữa đường thẳng $B C'$ và mặt phẳng $lr(( A' B' C' ))$
],source-id:"tu-luyen-10",solution:solutions.at("tu-luyen-10"),answers:(),answer-columns:4)
#item("11",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình chữ nhật với $A B = a ","  A D = 2 a$. Biết $S A$ vuông góc với mặt phẳng đáy và $S B = a sqrt(5)$. Tính góc giữa đường thẳng $S D$ và mặt phẳng $lr(( A B C D ))$
],source-id:"tu-luyen-11",solution:solutions.at("tu-luyen-11"),answers:(),answer-columns:4)
#item("12",[
Cho hình lập phương $A B C D . A ' B ' C ' D '$ có cạnh bằng $a$. Gọi $M$, $N$ là hai điểm thay đổi lần lượt trên các cạnh $A B$, $A ' D '$ sao cho $M N = frac(2 sqrt(3) a, 3)$. Tính góc giữa đường thẳng $M N$ và mặt phẳng $lr(( A B C D ))$
],source-id:"tu-luyen-12",solution:solutions.at("tu-luyen-12"),answers:(),answer-columns:4)
#if variant=="de-cach" { pagebreak(weak:true) }
#item("13",[
Cho hình chóp tứ giác đều $S . A B C D$ có tất cả các cạnh bằng $a$. Gọi $M$ là điểm nằm trên cạnh $S D$ sao cho $S M = 2 M D$. Tính giá trị $tan$ của góc giữa đường thẳng $B M$ và mặt phẳng $lr(( A B C D ))$
],writing-lines:4,source-id:"tu-luyen-13",solution:solutions.at("tu-luyen-13"),answers:(),answer-columns:4)
#item("14",[
Cho hình lập phương $A B C D . A' B' C' D'$. Gọi $M "," N$ lần lượt là trung điểm của cạnh $A C$ và $B' C'$. Gọi $α$ là góc hợp giữa đường thẳng $M N$ và mặt phẳng $lr(( A' B' C' D' ))$. Tính giá trị của $sin α$.
],source-id:"tu-luyen-14",solution:solutions.at("tu-luyen-14"),answers:(),answer-columns:4)
#item("15",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình vuông, $S A = S B = S C = S D$ cùng hợp với đáy một góc $30 °$. Tính góc hợp bởi đường thẳng $S C$ với mặt phẳng $lr(( S B D ))$
],writing-lines:5,source-id:"tu-luyen-15",solution:solutions.at("tu-luyen-15"),answers:(),answer-columns:4)
#if variant=="de-cach" { pagebreak(weak:true) }
#item("16",[
Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình thang vuông tại $A$ và $B$, $A B = B C = a$, $A D = 2 a ";"$ cạnh bên $S A$ vuông góc với mặt phẳng $( A B C D )$ và $S A = a sqrt(2)$. Góc giữa đường thẳng $S C$ và mặt phẳng $( S A D )$ bằng
],figure-side:figure("chop-hinh-thang.svg",width:55mm),figure-columns:(1fr,55mm),source-id:"tu-luyen-16",solution:solutions.at("tu-luyen-16"),answers:([$30 °$.],[$60 °$.],[$45 °$.],[$90 °$.],),answer-columns:4)
]
}
