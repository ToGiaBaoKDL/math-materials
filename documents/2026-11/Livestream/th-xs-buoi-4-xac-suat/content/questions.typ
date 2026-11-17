#import "/templates/lesson.typ": exercise, lesson-section
#let questions(variant) = {
let item=exercise.with(variant:variant,question-gap:if variant=="de" {5mm}else{6mm},keep-together:false,flow-stem:true,writing-lines:5,writing-line-gap:9mm,writing-heading-gap:1mm,writing-keep-together:true,writing-fill-page-end:false)
[
#lesson-section([BÀI TẬP VẬN DỤNG],badge:"BT")
#item("1",[
Một lớp có $30$ học sinh trong đó gồm $8$ học sinh giỏi, $15$ học sinh khá và $7$ học sinh trung bình. Người ta muốn chọn ngẫu nhiên $3$ em để đi dự Đại Hội. Tính xác suất để chọn được:

#block(inset:(left:5mm),above:3mm,below:3mm)[a) Ba học sinh được chọn đều là học sinh giỏi?]

#block(inset:(left:5mm),above:3mm,below:3mm)[b) Có ít nhất $1$ học sinh giỏi?]
],source-id:"cau-1",answers:(),answer-columns:4,writing-lines:8)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("2",[
Một hộp đựng $7$ quả cầu màu trắng và $3$ quả cầu màu đỏ. Lấy ngẫu nhiên từ hộp ra $4$ quả cầu. Tính xác suất để trong $4$ quả cầu lấy được có đúng $2$ quả cầu màu đỏ.
],source-id:"cau-2",answers:(),answer-columns:4,writing-lines:5)
#item("3",[
Một hộp đựng $9$ thẻ được đánh số $1, 2, 3, 4, dots, 9$. Rút ngẫu nhiên đồng thời $2$ thẻ và nhân hai số ghi trên hai thẻ lại với nhau. Tính xác suất để tích nhận được là số chẵn.
],source-id:"cau-3",answers:([$frac(1, 6)$.],[$frac(5, 18)$.],[$frac(8, 9)$.],[$frac(13, 18)$.],),answer-columns:4,writing-lines:5)
#item("4",[
Chọn ngẫu nhiên hai số khác nhau từ $27$ số nguyên dương đầu tiên. Xác suất để chọn được hai số có tổng là một số chẵn bằng
],source-id:"cau-4",answers:([$frac(365, 729)$.],[$frac(14, 27)$.],[$frac(1, 2)$.],[$frac(13, 27)$.],),answer-columns:4,writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("5",[
Một hộp chứa 120 tấm thẻ được đánh số lần lượt từ 1 đến 120. Người ta rút ra ngẫu nhiên một tấm thẻ. Hỏi có bao nhiêu cách rút ra được thẻ đánh số chia hết cho 3 hoặc chia hết cho 8?
],source-id:"cau-5",answers:(),answer-columns:4,writing-lines:5)
#item("6",[
Một hộp đựng 20 tấm thẻ cùng loại được đánh số từ 1 đến 20. Bạn Ngọc rút ngẫu nhiên một tấm thẻ trong hộp. Gọi $A$ là biến cố ‘‘Rút được tấm thẻ ghi số chẵn lớn hơn 9’’ và $B$ là biến cố ‘‘Rút được tấm thẻ ghi số không nhỏ hơn 8 và không lớn hơn 15’’. Tính xác suất của biến cố $A B$.
],source-id:"cau-6",answers:(),answer-columns:4,writing-lines:5)
#item("7",[
Chọn ngẫu nhiên một số tự nhiên thuộc đoạn $lr([ 10 ";" 99 ])$. Tính xác suất để chọn được một số lẻ hoặc số chia hết cho $5$ (kết quả viết dưới dạng số thập phân).
],source-id:"cau-7",answers:(),answer-columns:4,writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("8",[
Gọi $A$ là tập hợp các số tự nhiên có $5$ chữ số đôi một khác nhau. Chọn ngẫu nhiên một số tự nhiên thuộc tập $A$. Tính xác suất để chọn được một số thuộc $A$ và số đó chia hết cho $5$.
],source-id:"cau-8",answers:([$P = frac(11, 27)$.],[$P = frac(53, 243)$.],[$P = frac(2, 9)$.],[$P = frac(17, 81)$.],),answer-columns:4,writing-lines:5)
#item("9",[
Cho tập hợp $A = lr(\{ 1 ";" 2 ";" 3 ";" 4 ";" 5 ";" 6 \})$. Gọi $B$ là tập hợp các số tự nhiên gồm $4$ chữ số khác nhau được lập từ $A$. Chọn thứ tự $2$ số thuộc tập $B$. Tính xác suất để $2$ số được chọn có đúng một số có mặt chữ số $3$.
],source-id:"cau-9",answers:([$frac(156, 360)$.],[$frac(160, 359)$.],[$frac(80, 359)$.],[$frac(161, 360)$.],),answer-columns:4,writing-lines:5)
#item("10",[
Có $36$ tấm thẻ được đánh số từ $1$ đến $36$. Rút ngẫu nhiên $3$ thẻ. Tính xác suất để tổng các số ghi trên thẻ chia hết cho $3$. (làm tròn kết quả đến hàng phần trăm).
],source-id:"cau-10",answers:(),answer-columns:4,writing-lines:5)
]
}
