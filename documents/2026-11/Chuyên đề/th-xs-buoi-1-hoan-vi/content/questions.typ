#import "/templates/lesson.typ": exercise, lesson-section
#let questions(variant) = {
let item=exercise.with(variant:variant,question-gap:if variant=="de" {3mm}else{5mm},keep-together:false,flow-stem:true,writing-lines:3,writing-line-gap:9mm,writing-heading-gap:1mm,writing-keep-together:true,writing-fill-page-end:true)
[
#lesson-section([BÀI TẬP VẬN DỤNG],badge:"BT")
#item("1",[Cho tập hợp $X$ gồm $10$ phần tử. Số các hoán vị của $10$ phần tử của tập hợp $X$ là],source-id:"cau-1",answers:([$10 !$.],[$10 ^(2)$.],[$2 ^(10)$.],[$10 ^(10)$.],),answer-columns:4,writing-lines:3)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("2",[Từ các chữ số $2, 3, 4, 5, 6, 7$ có thể lập được bao nhiêu số tự nhiên gồm $6$ chữ số khác nhau?],source-id:"cau-2",answers:([$256$.],[$720$.],[$120$.],[$24$.],),answer-columns:4,writing-lines:3)
#item("3",[Ban chấp hành chi đoàn lớp 11D có bạn An, Bình, Công. Hỏi có bao nhiêu cách phân công các bạn này vào các chức vụ Bí thư, phó Bí thư và Ủy viên mà không bạn nào kiêm nhiệm?],source-id:"cau-3",answers:([$2$.],[$3$.],[$6$.],[$9$.],),answer-columns:4,writing-lines:3)
#item("4",[Có một con mèo vàng, $1$ con mèo đen, $1$ con mèo nâu, 1 con mèo trắng, 1 con mèo xanh, 1 con mèo tím. Xếp 6 con mèo thành hàng ngang vào $6$ cái ghế, mỗi ghế một con. Hỏi có bao nhiêu cách xếp chỗ sao cho mèo vàng và mèo đen ở cạnh nhau.],source-id:"cau-4",answers:([$720$.],[$120$.],[$144$.],[$240$.],),answer-columns:4,writing-lines:3)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("5",[Có 3 cuốn sách lý, 4 cuốn sách sinh, 5 cuốn sách địa lý. Hỏi có bao nhiêu cách sắp xếp các cuốn sách trên vào giá sách nếu:

#block(inset:(left:6mm),above:2mm,below:0pt)[a) Sắp xếp tùy ý?]

#block(inset:(left:6mm),above:2mm,below:0pt)[b) Các cuốn sách cùng môn học đứng cạnh nhau?]],source-id:"cau-5",answers:(),answer-columns:4,writing-lines:5)
#item("6",[Tính số cách sắp xếp $6$ nam sinh và $4$ nữ sinh vào một dãy ghế hàng ngang có $10$ chỗ ngồi sao cho các nữ sinh luôn ngồi cạnh nhau.],source-id:"cau-6",answers:([$10 !$.],[$7 ! × 4 ! .$],[$6 ! × 4 ! .$],[$6 ! × 5 ! .$],),answer-columns:4,writing-lines:3)
#item("7",[Sắp xếp năm bạn học sinh An, Bình, Chi, Dũng, Lệ vào một chiếc ghế dài có 5 chỗ ngồi. Hỏi có bao nhiêu cách sắp xếp sao cho bạn An và bạn Dũng không ngồi cạnh nhau?],source-id:"cau-7",answers:([$24$.],[$72$.],[$12$.],[$48$.],),answer-columns:4,writing-lines:3)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("8",[Từ các chữ số $0$, $2$, $3$, $5$, $6$, $8$ có thể lập được bao nhiêu số tự nhiên gồm $6$ chữ số đôi một khác nhau trong đó hai chữ số $0$ và $5$ không đứng cạnh nhau.],source-id:"cau-8",answers:([$384$.],[$120$.],[$216$.],[$600$.],),answer-columns:4,writing-lines:3)
#item("9",[Từ tập $A = lr(\{ 1 ";" 2 ";" 3 ";" 4 ";" 5 \})$ có thể lập được bao nhiêu số có $8$ chữ số sao cho chữ số $2$ xuất hiện $4$ lần, còn các chữ số khác xuất hiện một lần.],source-id:"cau-9",answers:([$120$.],[$840$.],[$576$.],[$1680$.],),answer-columns:4,writing-lines:3)
#item("10",[Từ các chữ số $0 ";" 1 ";" 2 ";" 3 ";" 4 ";" 5$ có thể lập được bao nhiêu số tự nhiên gồm $8$ chữ số trong đó chữ số $1$ xuất hiện 3 lần, các chữ số còn lại xuất hiện đúng $1$ lần.],source-id:"cau-10",answers:(),answer-columns:4,writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("11",[Từ các chữ số 1; 2; 3; 4; 5; 6 có thể lập được bao nhiêu số có 7 chữ số trong đó chữ số 4 có mặt đúng 2 lần, các chữ số còn lại có mặt đúng một lần và các số này không bắt đầu bằng số 12.],source-id:"cau-11",answers:(),answer-columns:4,writing-lines:5)
#item("12",[Từ 3 chữ số 2, 3, 4 có thể tao ra được bao nhiêu số tự nhiên gồm 5 chữ số, trong đó có đủ mặt 3 chữ số nói trên.],source-id:"cau-12",answers:(),answer-columns:4,writing-lines:5)
]
}
