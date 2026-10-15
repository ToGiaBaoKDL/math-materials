#import "/templates/exam.typ": exam-table
#let answer-key() = block(width:100%,breakable:false,above:5mm,below:5mm)[
 #align(center,strong[ĐÁP ÁN])
 #v(2mm)
 #exam-table(columns:13,header:([Câu],..range(1,13).map(n=>[#n])),[Đáp án],..("A","A","C","B","D","B","C","A","B","A","D","B").map(x=>[#x]))
 #v(3mm)
 #grid(columns:(1fr,1fr),column-gutter:6mm,
 exam-table(columns:5,header:([Câu],[a],[b],[c],[d]),
 [1],[Đ],[S],[Đ],[S], [2],[Đ],[Đ],[S],[Đ], [3],[Đ],[Đ],[Đ],[S], [4],[Đ],[S],[Đ],[Đ]),
 exam-table(columns:2,header:([Câu],[Đáp số]),[1],[0,68],[2],[513],[3],[2],[4],[9],[5],[7],[6],[7,3]))
]
#let solutions = (
[
Xét phương án A: $y = frac(x ^(2) - 3 x + 6, x - 1) = x - 2 + frac(4, x - 1) .$

Suy ra đồ thị có tiệm cận đứng $x = 1$ và tiệm cận xiên $y = x - 2$, đúng với hình vẽ.

Ta có $y ' = 1 - frac(4, lr(( x - 1 )) ^(2)) = frac(lr(( x - 3 )) lr(( x + 1 )), lr(( x - 1 )) ^(2)) .$

Do đó các điểm cực trị có hoành độ $x = - 1$ và $x = 3$. Khi đó $y lr(( - 1 )) = - 5 "," y lr(( 3 )) = 3 .$

Các điểm cực trị $lr(( - 1 ; - 5 ))$ và $lr(( 3 ; 3 ))$ cũng khớp với đồ thị đã cho.

Chọn A.
],
[
Cho $y = frac(x ^(2) - 3 x + 6, x - 2) = x - 1 + frac(4, x - 2) .$

Ta có $y ' = 1 - frac(4, lr(( x - 2 )) ^(2)) = 0 ⇔ lr(( x - 2 )) ^(2) = 4 .$

Suy ra $x = 0$ hoặc $x = 4$.

Hai điểm cực trị là $A lr(( 0 ; - 3 )) "," B lr(( 4 ; 5 )) .$

Đường thẳng qua $A "," B$ có hệ số góc $k = frac(5 - lr(( - 3 )), 4 - 0) = 2 .$

Vì đi qua $A lr(( 0 ; - 3 ))$ nên phương trình là $y = 2 x - 3 .$

Chọn A.
],
[
Từ bảng biến thiên, trên nửa khoảng $lr([ - 5 ; 7 ))$ hàm số giảm từ $6$ xuống $2$ tại $x = 1$, sau đó tăng và tiến tới $9$ khi $x → 7 ^(-)$. Vì $7$ không thuộc miền xét nên giá trị $9$ không đạt được.

Do đó $"min"_(x ∈ lr([ - 5 ; 7 ))) f lr(( x )) = 2 .$

Chọn C.
],
[
Từ đồ thị, hai điểm cực tiểu có tung độ khoảng $- 2$, còn điểm cực đại ở giữa có tung độ khoảng $- 1$.

Đường thẳng $y = - frac(1, 2)$ nằm phía trên điểm cực đại ở giữa, nên chỉ cắt hai nhánh ngoài của đồ thị. Vì vậy phương trình có đúng $2$ nghiệm.

Chọn B.
],
[
Xét $f lr(( x )) = - x ^(3) + 3 x "," x ∈ lr([ 0 ; 2 ]) .$

Ta có $f ' lr(( x )) = - 3 x ^(2) + 3 = 3 lr(( 1 - x ^(2) )) .$

Trong đoạn $lr([ 0 ; 2 ])$, điểm tới hạn là $x = 1$.

Tính $f lr(( 0 )) = 0 "," f lr(( 1 )) = 2 "," f lr(( 2 )) = - 2 .$

Vậy giá trị lớn nhất là $"max"_(lr([ 0 ; 2 ])) f lr(( x )) = 2 .$

Chọn D.
],
[
Từ bảng biến thiên, dấu của đạo hàm là âm trên các khoảng $lr(( - ∞ ; - 2 )) "," lr(( 0 ; 2 )) .$

Trong các phương án chỉ có $lr(( - ∞ ; - 2 ))$ phù hợp.

Chọn B.
],
[
Với $y = frac(2 x - 1, x + 1) ","$ ta có tiệm cận đứng $x = - 1$ và tiệm cận ngang $y = 2 .$

Vậy đồ thị có $2$ đường tiệm cận.

Chọn C.
],
[
Với $y = frac(3 x - 1, 2 x + 3) ","$ tiệm cận đứng là $x = - frac(3, 2) ","$ và tiệm cận ngang là $y = frac(3, 2) .$

Tâm đối xứng của đồ thị là giao điểm hai tiệm cận: $I lr(( - frac(3, 2) ; frac(3, 2) )) .$

Chọn A.
],
[
Cho $y = x + frac(4, x) "," x ≠ 0 .$

Ta có $y ' = 1 - frac(4, x ^(2)) = frac(x ^(2) - 4, x ^(2)) .$

Suy ra $y ' < 0 ⇔ 0 < x ^(2) < 4 .$

Suy ra $- 2 < x < 0$ hoặc $0 < x < 2$.

Trong các phương án, khoảng nghịch biến phù hợp là $lr(( - 2 ; 0 ))$.

Chọn B.
],
[
Từ bảng biến thiên, tại $x = 2$ đạo hàm đổi dấu từ âm sang dương, nên $x = 2$ là điểm cực tiểu và $f lr(( 2 )) = - 2 .$

Giá trị cực tiểu của hàm số bằng $- 2$.

Chọn A.
],
[
Với hàm bậc ba $y = a x ^(3) + b x ^(2) + c x + d ","$ quan sát đồ thị: Nhánh trái đi lên và nhánh phải đi xuống nên $a < 0$.

Giao điểm với trục tung nằm dưới trục hoành nên $d = f lr(( 0 )) < 0$.

Tại $x = 0$ đồ thị đang đi lên nên $f ' lr(( 0 )) = c > 0$.

Hai hoành độ cực trị gồm một số âm có độ lớn nhỏ hơn hoành độ cực trị dương, nên tổng hai nghiệm của $f ' lr(( x )) = 0$ dương. Mà $x _(1) + x _(2) = - frac(2 b, 3 a) > 0 ","$ với $a < 0$, suy ra $b > 0$.

Vậy $a < 0 ; b > 0 ; c > 0 ; d < 0$

Chọn D.
],
[
Ta biến đổi$y = frac(2 + 2 x, 2 + x) = 2 - frac(2, x + 2) .$

Suy ra: Tiệm cận đứng: $x = - 2$.

Tiệm cận ngang: $y = 2$. $y lr(( - 3 )) = 4$.

Đồ thị cắt trục hoành tại $x = - 1$.

Đồ thị cắt trục tung tại $y = 1$.

Hình B thỏa tất cả các đặc điểm trên.

Chọn B.
],
[
Số sản phẩm bán được là $n lr(( x )) = a + b "ln" lr(( 1 + x )) .$

Khi không quảng cáo, $x = 0$ và bán được $400$ sản phẩm: $a = 400 .$

Khi chi $x = e ^(3) - 1$ triệu đồng thì bán được $750$ sản phẩm: $400 + b "ln" lr(( e ^(3) )) = 750$ $400 + 3 b = 750 ⇒ b = frac(350, 3) .$

Lãi trên mỗi sản phẩm là $900 - 600 = 300$ nghìn đồng, tức là $"0,3"$ triệu đồng. Do đó lợi nhuận là $L lr(( x )) = "0,3" n lr(( x )) - x$ $L lr(( x )) = 120 + 35 "ln" lr(( 1 + x )) - x .$ a) Lợi nhuận lớn nhất là 210 triệu đồng

Nếu trước hết xét biến liên tục: $L ' lr(( x )) = frac(35, 1 + x) - 1 .$ $L ' lr(( x )) = 0 ⇔ x = 34 .$

Giá trị cực đại liên tục là $L lr(( 34 )) = 86 + 35 "ln" 35 ≈ "210,437" .$

Làm tròn đến hàng đơn vị được $210$ triệu đồng. Khi thêm điều kiện số sản phẩm phải nguyên, giá trị tối ưu rời rạc vẫn xấp xỉ $"210,437"$ triệu đồng và cũng làm tròn thành $210$ triệu đồng.

Kết luận: Đúng. b) Lợi nhuận là $120 + 50 "ln" lr(( 1 + x )) - x$

Công thức đúng là $L lr(( x )) = 120 + 35 "ln" lr(( 1 + x )) - x .$

Kết luận: Sai. c) $a + 6 b = 1100$

Ta có $a + 6 b = 400 + 6 ⋅ frac(350, 3) = 1100 .$

Kết luận: Đúng. d) Lợi nhuận lớn nhất khi chi 34 triệu đồng quảng cáo

Điều kiện đề bài yêu cầu số sản phẩm bán được là số nguyên. Tại $x = 34$, $n lr(( 34 )) = 400 + frac(350, 3) "ln" 35 ≈ "814,791" ","$ không phải số nguyên, nên $x = 34$ không phải một phương án hợp lệ theo điều kiện đã nêu.

Xét số sản phẩm nguyên gần điểm tối ưu, ta được giá trị tốt nhất tại $n = 815$. Khi đó $x = e ^(frac(3 lr(( 815 - 400 )), 350)) - 1 ≈ "34,063"$ triệu đồng.

Vì vậy theo đúng điều kiện nguyên của đề, khẳng định $x = 34$ là không chính xác.

Kết luận: Sai.
],
[
Khung gồm hình chữ nhật rộng $x$, cao $y$ và một nửa đường tròn có đường kính $x$. Dây thép gồm đáy dưới, đường kính phía trên, hai cạnh bên và cung bán nguyệt.

Ta có $2 x + 2 y + frac(π x, 2) = 8 .$

Suy ra $y = 4 - frac(x lr(( 4 + π )), 4) .$ a) Công thức trên đúng.

Kết luận: Đúng. b) Diện tích cửa sổ là $S = x y + frac(1, 2) π lr(( frac(x, 2) )) ^(2)$ $S = x y + frac(π x ^(2), 8) .$

Thay biểu thức của $y$: $S = 4 x - frac(8 + π, 8) x ^(2) .$

Đây là parabol quay xuống, đạt lớn nhất tại $x = frac(16, 8 + π) .$

Khi đó $y = 4 - frac(4 lr(( 4 + π )), 8 + π) = frac(16, 8 + π) .$

Kết luận: Đúng. c) Ta vừa có $S = 4 x - frac(8 + π, 8) x ^(2) ","$ không phải $S = 4 x - x ^(2)$.

Kết luận: Sai. d) Bán kính bán nguyệt là $x / 2$, nên độ dài cung bán nguyệt là $π ⋅ frac(x, 2) = frac(π x, 2) .$

Kết luận: Đúng.
],
[
Thể tích của bình là $V _(B) = 50 ^(2) ⋅ 80 = 200000$cm³.

Thể tích quả cầu bán kính $20$ là $V _(C) = frac(4, 3) π ⋅ 20 ^(3) = frac(32000 π, 3) ≈ "33510,322"$ cm³.

Do sau $120$ phút bình đầy, lưu lượng nước là $q = frac(200000 - frac(32000 π, 3), 120) ≈ "1387,414"$ cm³/phút. a) Thời gian để nước vừa ngập hết quả cầu

Quả cầu có đường kính $40$, nên khi vừa ngập hết cầu, mực nước cao $40$ cm.

Lượng nước khi đó là $V = 50 ^(2) ⋅ 40 - frac(32000 π, 3) .$

Suy ra $t = frac(V, q) ≈ "47,923"$phút, làm tròn được $48$ phút.

Kết luận: Đúng. b) Sau 24 phút, mực nước cao khoảng 20 cm

Sau $24$ phút, thể tích nước là $V _(24) = 24 q ≈ "33297,936"$ cm³.

Nếu mực nước cao $h$ với $0 < h < 40$, phần quả cầu chìm là một chỏm cầu cao $h$, có thể tích $V _(h) = π h ^(2) lr(( 20 - frac(h, 3) )) .$

Ta giải $2500 h - π h ^(2) lr(( 20 - frac(h, 3) )) = "33297,936" .$

Suy ra $h ≈ "20,043" .$

Làm tròn đến hàng đơn vị được $20$ cm.

Kết luận: Đúng. c) $x = 1387$ cm³/phút

Ta đã tính $q ≈ "1387,414" .$

Làm tròn đến hàng đơn vị được $1387$ cm³/phút.

Kết luận: Đúng. d) Thể tích quả cầu là 33150 cm³

Thực tế $V _(C) ≈ "33510,322"$ cm³.

Kết luận: Sai.
],
[
Cho $f lr(( x )) = frac(x ^(2) - x + 1, - x + 1) = - x - frac(1, x - 1) "," x ≠ 1 .$ a) Tâm đối xứng là $I lr(( 1 ; - 1 ))$

Hai tiệm cận là $x = 1 "," y = - x .$

Chúng cắt nhau tại $I lr(( 1 ; - 1 )) .$

Kết luận: Đúng. b) Hàm số đồng biến trên $lr(( 0 ; 2 ))$

Ta có $f ' lr(( x )) = - 1 + frac(1, lr(( x - 1 )) ^(2)) = frac(x lr(( 2 - x )), lr(( x - 1 )) ^(2)) .$

Hàm số đồng biến trên $lr(( 0 ; 1 ))$ và $lr(( 1 ; 2 ))$, nhưng không xác định tại $x = 1$. Vì vậy không thể nói hàm số đồng biến trên toàn khoảng $lr(( 0 ; 2 ))$.

Kết luận: Sai. c) Đồ thị có điểm cực tiểu $A lr(( 0 ; 1 ))$

Tại $x = 0$, đạo hàm đổi dấu từ âm sang dương và $f lr(( 0 )) = 1 .$

Vậy $A lr(( 0 ; 1 ))$ là điểm cực tiểu.

Kết luận: Đúng. d) Giá trị lớn nhất trên $lr(( 1 ; + ∞ ))$ bằng $- 3$

Trên $lr(( 1 ; + ∞ ))$, hàm số tăng trên $lr(( 1 ; 2 ))$ rồi giảm trên $lr(( 2 ; + ∞ ))$. Do đó giá trị lớn nhất đạt tại $x = 2$: $f lr(( 2 )) = - 3 .$

Kết luận: Đúng.
],
[
Gọi bán kính của tám hình cầu có tâm tại các đỉnh hình lập phương là $r$, bán kính hình cầu ở tâm khối lập phương là $R$.

Khoảng cách từ tâm khối lập phương cạnh $1$ đến một đỉnh là $frac(sqrt(3), 2) .$

Do hình cầu ở tâm tiếp xúc với mỗi hình cầu ở đỉnh: $R + r = frac(sqrt(3), 2) .$

Trong hình lập phương, mỗi hình cầu ở đỉnh chỉ chiếm một phần tám hình cầu. Tổng thể tích của tám phần này bằng thể tích một hình cầu bán kính $r$: $V _(1) = frac(4, 3) π r ^(3) .$

Thể tích hình cầu ở tâm là $V _(2) = frac(4, 3) π R ^(3) .$

Do đó $V = frac(4, 3) π lr(( r ^(3) + R ^(3) )) .$

Với $r + R$ không đổi, tổng $r ^(3) + R ^(3)$ nhỏ nhất khi $r = R$. Vì vậy $r = R = frac(sqrt(3), 4) .$

Suy ra $V _("min") = frac(4, 3) π ⋅ 2 lr(( frac(sqrt(3), 4) )) ^(3) = frac(π sqrt(3), 8) ≈ "0,68017" .$

Làm tròn đến hàng phần trăm: $"0,68" .$
],
[
Đặt $t = "cos" x .$

Vì $x ∈ lr([ - frac(π, 3) ; frac(π, 3) ]) ","$ nên $frac(1, 2) ≤ t ≤ 1 .$

Ta có $"cos" 2 x = 2 "cos" ^(2) x - 1 = 2 t ^(2) - 1 .$

Do đó $f lr(( x )) = 2 t ^(3) - 2 t ^(2) + 1 = g lr(( t )) .$

Ta có $g ' lr(( t )) = 6 t ^(2) - 4 t = 2 t lr(( 3 t - 2 )) .$

Trong đoạn $lr([ 1 / 2 ; 1 ])$, điểm tới hạn là $t = frac(2, 3) .$

Tính $g lr(( frac(2, 3) )) = 2 ⋅ frac(8, 27) - 2 ⋅ frac(4, 9) + 1 = frac(19, 27) .$

Vậy $frac(a, b) = frac(19, 27) ","$ suy ra $P = a b = 19 ⋅ 27 = 513 .$
],
[
Ta có $A lr(( 0 ; 0 )) "," C lr(( 6 ; 4 )) .$

Trung điểm của $A C$ là $H lr(( 3 ; 2 )) .$

Đường tròn có tâm $I lr(( 3 ; 1 ))$ đi qua $H$, nên bán kính $I H$ thẳng đứng. Vì thế tiếp tuyến của đường tròn tại $H$ là đường thẳng nằm ngang.

Dải LED có dạng $f lr(( x )) = a x ^(3) + b x ^(2) + c x + d .$

Vì dải LED bắt đầu tại $A$ và kết thúc tại $C$: $f lr(( 0 )) = 0 ⇒ d = 0 ","$ $f lr(( 6 )) = 4 .$

Vì đi qua $H$: $f lr(( 3 )) = 2 .$

Vì tiếp xúc với đường tròn tại $H$ và tiếp tuyến tại $H$ nằm ngang: $f ' lr(( 3 )) = 0 .$

Ta được hệ $cases(display(mat(27 a + 9 b + 3 c = 2 ","; 216 a + 36 b + 6 c = 4 ","; 27 a + 6 b + c = 0 ., delim: #none)))$

Giải hệ được $a = frac(2, 27) "," b = - frac(2, 3) "," c = 2 "," d = 0 .$

Vậy $27 a + 3 b + c + 9 d = 2 - 2 + 2 = 2 .$
],
[
Gọi $v$ là vận tốc của cá khi nước đứng yên. Khi bơi ngược dòng, vận tốc thực tế của cá là $v - 6 ","$ với $v > 6$.

Thời gian bơi hết quãng đường $300$ km là $t = frac(300, v - 6) .$

Năng lượng tiêu hao trong một giờ là $E lr(( v )) = c v ^(3) .$

Vậy tổng năng lượng tiêu hao là $W lr(( v )) = c v ^(3) ⋅ frac(300, v - 6) = 300 c frac(v ^(3), v - 6) .$

Vì $300 c > 0$, ta chỉ cần tìm cực tiểu của $g lr(( v )) = frac(v ^(3), v - 6) .$

Ta có $g ' lr(( v )) = frac(3 v ^(2) lr(( v - 6 )) - v ^(3), lr(( v - 6 )) ^(2)) = frac(2 v ^(2) lr(( v - 9 )), lr(( v - 6 )) ^(2)) .$

Với $v > 6$, hàm số giảm trên $lr(( 6 ; 9 ))$ và tăng trên $lr(( 9 ; + ∞ ))$. Do đó năng lượng nhỏ nhất khi $v = 9$ km/h.
],
[
Quỹ đạo là $y = frac(3 x ^(2) - x + 5, x - 1) "," x > 1 .$

Chia đa thức: $y = 3 x + 2 + frac(7, x - 1) .$

Hai đường tiệm cận là $x = 1$ và $y = 3 x + 2 .$

Lấy điểm $M lr(( x ; y ))$ trên quỹ đạo.

Khoảng cách từ $M$ đến đường thẳng $x = 1$ là $d _(1) = x - 1 .$

Khoảng cách từ $M$ đến đường thẳng $3 x - y + 2 = 0$ Là $d _(2) = frac(abs(3 x - y + 2), sqrt(10)) .$

Do$y = 3 x + 2 + frac(7, x - 1) ","$ nên$abs(3 x - y + 2) = frac(7, x - 1) .$

Vì $x > 1$: $C = d _(1) d _(2) = lr(( x - 1 )) ⋅ frac(7, lr(( x - 1 )) sqrt(10)) = frac(7, sqrt(10)) .$

Suy ra $C ^(2) = frac(49, 10) .$

Do đó $frac(10, 7) C ^(2) = frac(10, 7) ⋅ frac(49, 10) = 7 .$
],
[
Gọi $O$ là tâm tấm bìa hình vuông cạnh $6$. Gọi $x$ là khoảng cách từ $O$ đến mỗi đỉnh của hình vuông đáy ở giữa sau khi cắt. Khi đó $0 < x < 3 .$

Hình vuông đáy có hai đường chéo cùng bằng $2 x$, nên cạnh đáy là $a = x sqrt(2) ","$ và diện tích đáy là $S = a ^(2) = 2 x ^(2) .$

Xét một cạnh bên của khối chóp. Trên tấm bìa, độ dài cạnh này bằng khoảng cách từ một góc của hình vuông lớn đến một đỉnh kề của hình vuông đáy: $l ^(2) = 3 ^(2) + lr(( 3 - x )) ^(2) .$

Trong khối chóp tứ giác đều, khoảng cách từ tâm đáy đến một đỉnh đáy bằng $x$. Nếu $h$ là chiều cao khối chóp thì $l ^(2) = h ^(2) + x ^(2) .$

Suy ra $h ^(2) = 9 + lr(( 3 - x )) ^(2) - x ^(2) = 18 - 6 x ","$ nên $h = sqrt(18 - 6 x) .$

Thể tích khối chóp là $V lr(( x )) = frac(1, 3) ⋅ 2 x ^(2) sqrt(18 - 6 x) .$

Để tìm cực đại, xét bình phương thể tích: $V ^(2) lr(( x )) = frac(8, 3) x ^(4) lr(( 3 - x )) .$

Vì $V > 0$, cực đại của $V$ tương ứng với cực đại của $F lr(( x )) = x ^(4) lr(( 3 - x )) .$

Ta có $F ' lr(( x )) = x ^(3) lr(( 12 - 5 x )) .$

Trong $lr(( 0 ; 3 ))$, điểm cực đại là $x = frac(12, 5) .$

Khi đó $V _("max") = frac(288 sqrt(10), 125) ≈ "7,2859" .$

Làm tròn đến hàng phần mười: $"7,3"$ dm³.
],
)
