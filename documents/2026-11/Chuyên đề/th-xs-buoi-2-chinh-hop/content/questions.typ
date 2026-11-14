#import "/templates/lesson.typ": exercise, lesson-section
#let questions(variant) = {
let item=exercise.with(variant:variant,question-gap:if variant=="de" {3mm}else{5mm},keep-together:false,flow-stem:true,writing-lines:3,writing-line-gap:9mm,writing-heading-gap:1mm,writing-keep-together:true,writing-fill-page-end:false)
[
#lesson-section([BÀI TẬP VẬN DỤNG],badge:"BT")
#item("1",[Từ các chữ số $1$, $2$, $3$, $4$, $5$, $6$, $7$, $8$ lập được bao nhiêu số tự nhiên gồm hai chữ số khác nhau?],source-id:"cau-1",answers:([$2 ^(8)$.],[$C _(8)^(2)$.],[$A _(8)^(2)$.],[$8 ^(2)$.],),answer-columns:4,writing-lines:3)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("2",[Một lớp học gồm có 40 học sinh, cần chọn một ban cán sự lớp gồm 3 người với các chức vụ: Lớp trưởng, lớp phó học tập và lớp phó lao động. Hỏi có bao nhiêu cách chọn?],source-id:"cau-2",answers:([$3 !$.],[$A _(40)^(3)$.],[$C _(40)^(3)$.],[$40 !$.],),answer-columns:4,writing-lines:3)
#item("3",[Có thể lập được bao nhiêu vecto từ các đỉnh của hình ngũ giác đều?],source-id:"cau-3",answers:(),answer-columns:4,writing-lines:5)
#item("4",[Trong trận chung kết bóng đá phải phân định thắng thua bằng đá luân lưu $11$ mét. Huấn luyện viên của mỗi đội cần trình với trọng tài một danh sách sắp thứ tự $5$ cầu thủ trong $11$ cầu thủ để đá luân lưu $5$ quả $11$ mét. Hỏi huấn luyện viên của mỗi đội sẽ có bao nhiêu cách chọn?],source-id:"cau-4",answers:([$55440$.],[$120$.],[$462$.],[$39916800$.],),answer-columns:4,writing-lines:3)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("5",[Có bao nhiêu số tự nhiên chẵn gồm 3 chữ số khác nhau.],source-id:"cau-5",answers:([$500 .$],[$405 .$],[$360 .$],[$328 .$],),answer-columns:4,writing-lines:5)
#item("6",[Cho tập hợp $A = lr(\{ 0 ";" 1 ";" 2 ";" 3 ";" 4 ";" 5 \})$. Có thể lập được bao nhiêu số tự nhiên có 3 chữ số khác nhau và lớn hơn 350?],source-id:"cau-6",answers:([$32$.],[$40$.],[$43$.],[$56$.],),answer-columns:4,writing-lines:5)
#item("7",[Từ các chữ số $1, 2, 3, 4, 5$ có thể lập được bao nhiêu số có ba chữ số khác nhau nằm trong khoảng $lr(( 300 ";" 500 ))$],source-id:"cau-7",answers:([$24$.],[$25$.],[$23$.],[$22$.],),answer-columns:4,writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("8",[Từ các chữ số của tập hợp $lr(\{ 0 ";" 1 ";" 2 ";" 3 ";" 4 ";" 5 \})$, có thể lập được bao nhiêu số tự nhiên có $5$ chữ số đôi một khác nhau mà trong đó nhất thiết phải có mặt chữ số $0$?],source-id:"cau-8",answers:([$504$.],[$480$.],[$720$.],[$120$.],),answer-columns:4,writing-lines:5)
#item("9",[Có bao nhiêu số tự nhiên có bảy chữ số khác nhau từng đôi một, trong đó chữ số $2$ đứng liền giữa hai chữ số $1$ và $3$.],source-id:"cau-9",answers:([$3204$ số.],[$249$ số.],[$2942$ số.],[$7440$ số.],),answer-columns:4,writing-lines:5)
#item("10",[Từ các chữ số $0, 1, 2, 3, 4, 5, 6$ có thể lập được bao nhiêu số có $5$ chữ số đôi một khác nhau sao cho có $3$ chữ số chẵn và $2$ chữ số lẻ đứng cạnh nhau.],source-id:"cau-10",answers:([$360$.],[$144$.],[$252$.],[$108$.],),answer-columns:4,writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("11",[Cho các chữ số $0 ";" 2 ";" 3 ";" 4 ";" 5 ";" 7 ";" 8$. Từ các chữ số đó có thể lập được bao nhiêu số có 4 chữ số khác nhau chia hết cho $20$ và luôn xuất hiện chữ số $4$.],source-id:"cau-11",answers:(),answer-columns:4,writing-lines:5)
#item("12",[Xếp 6 học sinh nam và 4 học sinh nữ vào một bàn tròn 10 ghế. Tính số cách xếp để không có hai học sinh nữ ngồi cạnh nhau.],source-id:"cau-12",answers:(),answer-columns:4,writing-lines:5)
]
}
