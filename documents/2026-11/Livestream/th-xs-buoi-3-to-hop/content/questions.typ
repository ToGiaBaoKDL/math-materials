#import "/templates/lesson.typ": exercise, lesson-section
#let questions(variant) = {
let item=exercise.with(variant:variant,question-gap:if variant=="de" {5mm}else{6mm},keep-together:false,flow-stem:true,writing-lines:5,writing-line-gap:9mm,writing-heading-gap:1mm,writing-keep-together:true,writing-fill-page-end:false)
[
#lesson-section([BÀI TẬP VẬN DỤNG],badge:"BT")
#item("1",[
Cho tập hợp $M$ có $30$ phần tử. Số tập con gồm $5$ phần tử của $M$ là
],source-id:"cau-1",answers:([$A _(30)^(4)$.],[$30 ^(5)$.],[$30 ^(5)$.],[$C _(30)^(5)$.],),answer-columns:4,writing-lines:3)
#item("2",[
Số cách chọn $2$ học sinh từ $7$ học sinh là
],source-id:"cau-2",answers:([$2 ^(7)$.],[$A _(7)^(2)$.],[$C _(7)^(2)$.],[$7 ^(2)$.],),answer-columns:4,writing-lines:3)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("3",[
Có bao nhiêu số tự nhiên có ba chữ số dạng $overline(a b c)$ với $a$, $b$, $c ∈ lr(\{ 0 ";" 1 ";" 2 ";" 3 ";" 4 ";" 5 ";" 6 \})$ sao cho $a < b < c$.
],source-id:"cau-3",answers:([$120$.],[$30$.],[$40$.],[$20$.],),answer-columns:4,writing-lines:5)
#item("4",[
Một hộp đựng $50$ viên bi gồm 10 viên bi màu trắng, 25 viên bi màu đỏ và 15 viên bi màu xanh. Có bao nhiêu cách chọn 8 viên bi trong hộp đó mà không có viên bi nào màu xanh?
],source-id:"cau-4",answers:([$C _(50)^(8)$.],[$C _(10)^(8) + C _(25)^(8)$.],[$C _(35)^(8)$.],[$C _(50)^(8) - C _(15)^(8)$.],),answer-columns:4,writing-lines:5)
#item("5",[
Một hộp có 6 viên bi xanh, 5 viên bi đỏ và 4 viên bi vàng. Chọn ngẫu nhiên 5 viên bi sao cho có đủ cả ba màu. Số cách chọn là:
],source-id:"cau-5",answers:([$840$],[$3843$],[$2170$],[$3003$],),answer-columns:4,writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("6",[
Từ $20$ câu trắc nghiệm gồm $9$ câu dễ, 7 câu trung bình và $4$ câu khó. Người ta chọn ra $10$ câu để làm đề kiểm tra sao cho phải có đủ $3$ loại dễ, trung bình và khó. Hỏi có thể lập được bao nhiêu đề kiểm tra?
],source-id:"cau-6",answers:([$176451$.],[$176465$.],[$176415$.],[$6415$.],),answer-columns:4,writing-lines:5)
#item("7",[
Cho $8$ điểm, trong đó không có 3 điểm nào thẳng hàng. Hỏi có bao nhiêu tam giác mà ba đỉnh của nó được chọn từ $8$ điểm trên ?
],source-id:"cau-7",answers:([$336$.],[$56$.],[$168$.],[$84$.],),answer-columns:4,writing-lines:3)
#item("8",[
Cho hai đường thẳng $d _(1)$ và $d _(2)$ song song với nhau. Trên $d _(1)$ lấy $5$ điểm phân biệt, trên $d _(2)$ lấy $7$ điểm phân biệt. Hỏi có bao nhiêu tam giác mà các đỉnh của nó được lấy từ các điểm trên hai đường thẳng $d _(1)$ và $d _(2)$.
],source-id:"cau-8",answers:([$220$.],[$175$.],[$1320$.],[$7350$.],),answer-columns:4,writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("9",[
Cho hình vuông $A B C D$. Trên cạnh $A B$, $B C$, $C D$, $D A$ lần lượt lấy $1$, $2$, $3$ và $n$ điểm phân biệt $n ≥ 3 lr(( n ∈ ℕ ))$ khác $A$, $B$, $C$, $D$. Tìm $n$ biết số tam giác lấy từ $n + 6$ điểm trên là $439$.
],source-id:"cau-9",answers:([$n = 20 .$],[$n = 12 .$],[$n = 8 .$],[$n = 10 .$],),answer-columns:4,writing-lines:5)
#item("10",[
Số đường chéo của đa giác đều có $20$ cạnh là bao nhiêu?
],source-id:"cau-10",answers:([$170$.],[$190$.],[$360$.],[$380$.],),answer-columns:4,writing-lines:5)
#item("11",[
Cho đa giác đều $36$ đỉnh. Hỏi có bao nhiêu hình chữ nhật có đỉnh là $4$ trong $36$ đỉnh của đa giác đều?
],source-id:"cau-11",answers:([$306$.],[$153$.],[$9$.],[$58905$.],),answer-columns:4,writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("12",[
Cho một đa giác đều 40 đỉnh $A _(1) A _(2) . . . A _(40)$ nội tiếp đường tròn $lr(( O ))$. Số tam giác có các đỉnh là 3 trong 40 đỉnh trên gấp bao nhiêu lần số hình chữ nhật có các đỉnh là 4 trong 40 đỉnh trên?
],source-id:"cau-12",answers:([$20 .$],[$frac(4, 37)$.],[$52$.],[$40$.],),answer-columns:4,writing-lines:5)
#item("13",[
Cho đa giác đều có 15 đỉnh, gọi $M$ là tập tất cả các tam giác có ba đỉnh là ba đỉnh của đa giác đã cho. Trong số các tam giác đó có bao nhiêu tam giác là tam giác cân nhưng không phải là tam giác đều?
],source-id:"cau-13",answers:([$64$.],[$70$.],[$72$.],[$90$.],),answer-columns:4,writing-lines:5)
#if variant=="de-cach" {pagebreak(weak:true)}
#item("14",[
Tô màu các cạnh của hình vuông $A B C D$ bởi $6$ màu khác nhau sao cho mỗi cạnh được tô bởi một màu và hai cạnh kề nhau thì tô bởi hai màu khác nhau. Hỏi có bao nhiêu cách tô?
],source-id:"cau-14",answers:(),answer-columns:4,writing-lines:5)
#item("15",[
Từ các chữ số của tập $A = lr(\{ 0 ";" 1 ";" 2 ";" 3 ";" 4 ";" 5 ";" 6 ";" 7 \})$ lập được bao nhiêu số tự nhiên gồm 7 chữ số trong đó chữ số 2 xuất hiện đúng ba lần, các chữ số còn lại đôi một khác nhau?
],source-id:"cau-15",answers:([31203.],[12600.],[181440.],[27000],),answer-columns:4,writing-lines:5)
]
}
