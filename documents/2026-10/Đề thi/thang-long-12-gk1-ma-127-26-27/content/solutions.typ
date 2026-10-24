#import "/templates/exam.typ": exam-section, exam-table
#import "/templates/theme.typ": exam-palette as palette
#let p(body) = block(above: 3.5mm, below: 3.5mm, body)
#let answer-key() = {
  align(center, text(size: 16pt, weight: "bold", fill: palette.primary)[ĐÁP ÁN VÀ LỜI GIẢI THAM KHẢO])
  align(center, text(size: 10.5pt, style: "italic")[Lời giải tham khảo trong nguồn: AI & TOANMATH.com])
  exam-section("I", [TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN.])
  exam-table(columns: (1fr,) * 12, header: range(1, 13).map(n => [#n]), ..(
    "D",
    "C",
    "A",
    "B",
    "A",
    "D",
    "D",
    "B",
    "A",
    "C",
    "C",
    "B",
  ).map(a => [*#a*]))
  exam-section("II", [TRẮC NGHIỆM ĐÚNG – SAI.])
  exam-table(
    columns: (1fr,) * 5,
    header: ([Câu], [a)], [b)], [c)], [d)]),
    [1],
    [*S*],
    [*Đ*],
    [*Đ*],
    [*S*],
    [2],
    [*Đ*],
    [*S*],
    [*S*],
    [*S*],
    [3],
    [*S*],
    [*Đ*],
    [*Đ*],
    [*Đ*],
    [4],
    [*S*],
    [*Đ*],
    [*S*],
    [*Đ*],
  )
  exam-section("III", [TRẮC NGHIỆM TRẢ LỜI NGẮN.])
  exam-table(columns: (1fr,) * 6, header: range(1, 7).map(n => [Câu #n]), [*6*], [*506*], [*173*], [*20*], [*1*], [*285*])
}
#let solutions() = {
  exam-section("I", [TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN.])
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 1.])
  p[Ta có $arrow(A B) = ( 6 ; 9 ; 12 )$. Drone bay thẳng đều nên sau $20$ giây, tức $frac(20, 60) = frac(1, 3)$ thời gian, thì $arrow(A C) = frac(1, 3) arrow(A B) = ( 2 ; 3 ; 4 )$.]
  p[Suy ra $C ( 3 ; 4 ; 5 )$, do đó $a + b + c = 12$. *Chọn D.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 2.])
  p[Vận tốc $v ( t ) = s' ( t ) = 3 t^(2) - 6 t + 5 = 3 ( t - 1 )^(2) + 2 ≥ 2$, dấu bằng xảy ra khi $t = 1 ∈ ( 0 ; 5 ]$.]
  p[Vậy vận tốc nhỏ nhất là $2$ m/s. *Chọn C.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 3.])
  p[Từ đồ thị, hàm số đạt cực đại tại $x = 1$ và giá trị cực đại bằng $3$. *Chọn A.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 4.])
  p[Vì $lim_(x → 0^(+)) lr(( 2 + frac(1, x) )) = + ∞$ nên đường tiệm cận đứng là $x = 0$. *Chọn B.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 5.])
  p[Theo quy tắc hình hộp, $arrow(B A) + arrow(B C) + arrow(B B_(1)) = arrow(B D_(1))$, nên B đúng.]
  p[$arrow(B A) + arrow(B C) = arrow(B D) = arrow(B_(1) D_(1)) = arrow(B_(1) C_(1)) + arrow(B_(1) A_(1))$, nên C đúng.]
  p[$arrow(A D) + arrow(D_(1) C_(1)) + arrow(D_(1) A_(1)) = arrow(A D) + arrow(D_(1) B_(1)) = arrow(A D) + arrow(D B) = arrow(A B) = arrow(D C)$, nên D đúng.]
  p[$arrow(B A) + arrow(D D_(1)) + arrow(B D_(1)) = arrow(B A) + arrow(B B_(1)) + lr(( arrow(B A) + arrow(B C) + arrow(B B_(1)) )) = arrow(B C) + 2 arrow(B A) + 2 arrow(B B_(1)) ≠ arrow(B C)$, nên A sai. *Chọn A.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 6.])
  p[Ta có $arrow(u) = - 4 arrow(i) + 3 arrow(j) + 2 arrow(k)$ nên $arrow(u) = ( - 4 ; 3 ; 2 )$. *Chọn D.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 7.])
  p[Hàm số $y = 2^(x)$ có cơ số $2 > 1$ nên đồng biến trên $RR$. *Chọn D.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 8.])
  p[Gọi $O = A C ∩ B D$, khi đó $O$ là trung điểm của $A C$. Tam giác $S A C$ cân tại $S$ nên $S O ⊥ A C$. $A B C D$ là hình thoi nên $O B ⊥ A C$.]
  p[Do đó $arrow(A C) ⋅ arrow(S B) = arrow(A C) ⋅ lr(( arrow(S O) + arrow(O B) )) = arrow(A C) ⋅ arrow(S O) + arrow(A C) ⋅ arrow(O B) = 0$. *Chọn B.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 9.])
  p[Từ đồ thị, $f' ( x ) ≤ 0$ với mọi $x < 2$ (chỉ bằng $0$ tại $x = - 1$) và $f' ( x ) > 0$ với mọi $x > 2$.]
  p[Do đó hàm số nghịch biến trên $( - ∞ ; 2 )$, đồng biến trên $( 2 ; + ∞ )$, nên đạt giá trị nhỏ nhất tại $x = 2$. *Chọn A.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 10.])
  p[$h' ( t ) = 18 t^(2) - 162 t + 324 = 18 ( t - 3 ) ( t - 6 )$.]
  p[Với $t ∈ ( 0 ; 3 )$ thì $t - 3 < 0$ và $t - 6 < 0$ nên $h' ( t ) > 0$. Vậy trong $3$ phút đầu tiên, độ cao của khinh khí cầu tăng. *Chọn C.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 11.])
  p[Hình chiếu của $M$ lên trục $O y$ là $H ( 0 ; - 2 ; 0 )$. Suy ra $d ( M "," O y ) = M H = sqrt(1^(2) + 3^(2)) = sqrt(10)$. *Chọn C.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 12.])
  p[Giả sử $lim_(x → + ∞) f ( x ) = 2$ (trường hợp $x → - ∞$ tương tự). Khi đó $lim_(x → + ∞) [ 3 f ( x ) - 2 ] = 3 ⋅ 2 - 2 = 4$.]
  p[Vậy đồ thị hàm số $y = 3 f ( x ) - 2$ có tiệm cận ngang $y = 4$. *Chọn B.*]
  exam-section("II", [TRẮC NGHIỆM ĐÚNG – SAI.])
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 1.])
  p[Tập xác định $D = RR ∖ \{ - 1 \}$. Ta có $y = x + frac(1, x + 1)$ và $y' = 1 - frac(1, ( x + 1 )^(2)) = frac(x^(2) + 2 x, ( x + 1 )^(2))$; $y' = 0 ⇔ x = 0$ hoặc $x = - 2$.]
  p[a) $y' < 0$ trên các khoảng $( - 2 ; - 1 )$ và $( - 1 ; 0 )$, nên hàm số nghịch biến trên từng khoảng đó. Vì hàm số không xác định tại $x = - 1 ∈ ( - 2 ; 0 )$ nên không nói hàm số nghịch biến trên $( - 2 ; 0 )$. *Sai.*]
  p[b) $lim_(x → ± ∞) ( y - x ) = lim_(x → ± ∞) frac(1, x + 1) = 0$ nên tiệm cận xiên là $y = x$. *Đúng.*]
  p[c) $y ( 1 ) = frac(3, 2)$, $y' ( 1 ) = frac(3, 4)$, nên $d : y = frac(3, 4) ( x - 1 ) + frac(3, 2) = frac(3, 4) x + frac(3, 4)$.]
  p[Giải $frac(3, 4) x + frac(3, 4) = x ⇔ x = 3$, suy ra giao điểm là $M ( 3 ; 3 )$. *Đúng.*]
  p[d) Hai điểm cực trị là $( 0 ; 1 )$ và $( - 2 ; - 3 )$. Đường thẳng đi qua hai điểm này có hệ số góc $frac(1 - ( - 3 ), 0 - ( - 2 )) = 2$, nên có phương trình $y = 2 x + 1$. *Sai.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 2.])
  p[a) $arrow(A B) = ( - 80 ; - 60 ; - 20 )$ nên $A B = sqrt(10400) = 20 sqrt(26) ≈ 102$ m. *Đúng.*]
  p[b) $A$ và $B$ cùng nằm phía trên mặt phẳng $( O x y )$. Gọi $B' ( 40 ; 30 ; - 10 )$ là điểm đối xứng của $B$ qua $( O x y )$.]
  p[Với $M ( x ; y ; 0 )$ ta có $M A + M B = M A + M B' ≥ A B'$, dấu bằng xảy ra khi $M$ thuộc đoạn $A B'$, tức là $arrow(A M) = t arrow(A B')$.]
  p[Ta có $arrow(A M) = ( x - 120 ; y - 90 ; - 30 )$ và $arrow(A B') = ( - 80 ; - 60 ; - 40 )$. So sánh thành phần thứ ba: $- 30 = - 40 t$, suy ra $t = frac(3, 4)$. Khi đó $x = 60$, $y = 45$, tức $M ( 60 ; 45 ; 0 )$. *Sai.*]
  p[c) Gọi $P$ là vị trí drone hết pin. Ta có $arrow(A P) = "0,4" arrow(A B) = ( - 32 ; - 24 ; - 8 )$ nên $P ( 88 ; 66 ; 22 )$.]
  p[Vậy vị trí drone hết pin cách mặt đất $22$ m. *Sai.*]
  p[d) $O A = sqrt(120^(2) + 90^(2) + 30^(2)) = 30 sqrt(26)$ và $A P = "0,4" A B = 8 sqrt(26)$.]
  p[Tổng quãng đường drone bay được là $38 sqrt(26) ≈ "193,76"$ m, ứng với thời gian $frac(38 sqrt(26), 10) ≈ "19,38"$ giây.]
  p[Drone báo sắp hết pin sau khoảng $"19,38" - 3 ≈ 16$ giây kể từ lúc xuất phát. *Sai.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 3.])
  p[$C' ( t ) = frac(15 ( t^(2) + 9 ) - 15 t ⋅ 2 t, ( t^(2) + 9 )^(2)) = frac(15 ( 9 - t^(2) ), ( t^(2) + 9 )^(2))$. Với $t ≥ 0$, $C' ( t ) = 0 ⇔ t = 3$.]
  p[$C' ( t ) > 0$ trên $( 0 ; 3 )$ và $C' ( t ) < 0$ trên $( 3 ; + ∞ )$, nên $C ( t )$ đạt giá trị lớn nhất tại $t = 3$, với $C ( 3 ) = frac(45, 18) = "2,5"$.]
  p[a) Nồng độ đạt lớn nhất tại $t = 3$ giờ, không phải $t = 9$ giờ. *Sai.*]
  p[b) Giá trị nồng độ cao nhất là $"2,5"$ mg/l. *Đúng.*]
  p[c) $C' ( t ) > 0$ trên $( 0 ; 3 )$ nên nồng độ thuốc tăng trong $3$ giờ đầu. *Đúng.*]
  p[d) $C' ( 1 ) = frac(15 ⋅ 8, 10^(2)) = "1,2"$ mg/l/giờ. *Đúng.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 4.])
  p[$arrow(A B) = ( - 6 ; - 1 ; 1 )$, $arrow(A C) = ( - 5 ; 0 ; 2 )$, $arrow(B C) = ( 1 ; 1 ; 1 )$.]
  p[a) $A B = sqrt(38)$, $A C = sqrt(29)$, $arrow(A B) ⋅ arrow(A C) = 30 + 0 + 2 = 32$.]
  p[$cos hat(B A C) = frac(32, sqrt(38) ⋅ sqrt(29)) = frac(32, sqrt(1102))$, suy ra $sin^(2) hat(B A C) = 1 - frac(1024, 1102) = frac(39, 551)$, nên $sin hat(B A C) = sqrt(frac(39, 551))$. *Sai.*]
  p[b) $arrow(A B) ⋅ arrow(A C) = 32$. *Đúng.*]
  p[c) $A B D C$ là hình bình hành khi $arrow(A B) = arrow(C D)$, suy ra $D ( 2 - 6 ; 3 - 1 ; 5 + 1 )$, tức $D ( - 4 ; 2 ; 6 )$. *Sai.*]
  p[d) $H$ thuộc đường thẳng $B C$ nên $arrow(B H) = t arrow(B C)$, suy ra $H ( 1 + t ; 2 + t ; 4 + t )$ và $arrow(A H) = ( t - 6 ; t - 1 ; t + 1 )$.]
  p[$arrow(A H) ⋅ arrow(B C) = 0 ⇔ 3 t - 6 = 0 ⇔ t = 2$, suy ra $H ( 3 ; 4 ; 6 )$.]
  p[Khi đó $2 a - 5 b + c = 6 - 20 + 6 = - 8$. *Đúng.*]
  exam-section("III", [TRẮC NGHIỆM TRẢ LỜI NGẮN.])
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 1.])
  p[Ta có $arrow(A B) = ( 12 ; 0 ; 0 )$. $M$ thuộc đoạn $A B$ nên $M ( m ; 6 ; 8 )$ với $0 ≤ m ≤ 12$, và $A M = m$.]
  p[$C M^(2) = ( m - 6 )^(2) + 6^(2) + 8^(2) = ( m - 6 )^(2) + 100 ≥ 100$, dấu bằng xảy ra khi $m = 6$.]
  p[Vậy khoảng cách $C M$ nhỏ nhất khi $A M = 6$. *Đáp án: $6$.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 2.])
  p[$f' ( x )$ chỉ đổi dấu khi $x$ đi qua các nghiệm $x = k$ có số mũ $k$ lẻ, tức $k ∈ \{ 1 ; 3 ; 5 ; dots.h ; 2025 \}$.]
  p[Với $x < 1$, cả $1013$ thừa số có số mũ lẻ đều âm, nên $f' ( x ) < 0$.]
  p[Do đó, khi $x$ tăng dần, $f' ( x )$ đổi dấu xen kẽ: $x = 1$ là điểm cực tiểu, $x = 3$ là điểm cực đại, $x = 5$ là điểm cực tiểu, và cứ thế tiếp tục.]
  p[Các điểm cực đại là $x = 3 ; 7 ; 11 ; dots.h ; 2023$, gồm $frac(2023 - 3, 4) + 1 = 506$ điểm. *Đáp án: $506$.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 3.])
  p[Trọng lượng của kiện hàng và tấm ván là $P = ( 50 + 10 ) ⋅ 10 = 600$ N.]
  p[Gọi $T$ là lực căng của mỗi sợi dây. Mỗi dây hợp với mặt phẳng nằm ngang của tấm ván góc $60 degree$, nên thành phần thẳng đứng của mỗi lực căng là $T sin 60 degree$.]
  p[Các thành phần nằm ngang triệt tiêu nhau do tính đối xứng. Do đó $4 T sin 60 degree = 600 ⇔ 2 sqrt(3) T = 600 ⇔ T = 100 sqrt(3) ≈ 173$ N. *Đáp án: $173$.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 4.])
  p[Gọi $B'$ là vị trí của đỉnh $B$ sau khi gấp, $B' ∈ C D$. Đặt $C B' = t$, $B N = N B' = y$, $B M = M B' = x$.]
  p[Tam giác $N C B'$ vuông tại $C$: $y^(2) = ( 10 - y )^(2) + t^(2)$, suy ra $y = frac(t^(2) + 100, 20)$.]
  p[Gọi $K$ là hình chiếu của $M$ lên $C D$. Ta có $M K = 10$ và $K B' = | x - t |$, nên $x^(2) = 100 + ( x - t )^(2)$, suy ra $x = frac(t^(2) + 100, 2 t)$.]
  p[Điều kiện: $y ≤ 10 ⇔ t ≤ 10$; $x ≤ 15 ⇔ t^(2) - 30 t + 100 ≤ 0 ⇔ 15 - 5 sqrt(5) ≤ t ≤ 15 + 5 sqrt(5)$. Kết hợp lại được $t ∈ lr([ 15 - 5 sqrt(5) ; 10 ])$.]
  p[Khi đó $M N^(2) = x^(2) + y^(2) = ( t^(2) + 100 )^(2) lr(( frac(1, 4 t^(2)) + frac(1, 400) )) = frac(( t^(2) + 100 )^(3), 400 t^(2))$.]
  p[Đặt $s = t^(2)$, $s ∈ lr([ ( 15 - 5 sqrt(5) )^(2) ; 100 ])$, và xét $g ( s ) = frac(( s + 100 )^(3), s)$. Ta có $g' ( s ) = frac(( s + 100 )^(2) ( 2 s - 100 ), s^(2))$, và $g' ( s ) = 0 ⇔ s = 50$, thuộc đoạn đang xét.]
  p[$g$ nghịch biến trước $s = 50$ và đồng biến sau $s = 50$, nên $g$ nhỏ nhất tại $s = 50$.]
  p[Suy ra $M N_(min)^(2) = frac(150^(3), 400 ⋅ 50) = frac(675, 4)$, tức $M N_(min) = frac(15 sqrt(3), 2)$.]
  p[Vậy $a = 15$, $b = 3$, $c = 2$ và $a + b + c = 20$. *Đáp án: $20$.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 5.])
  p[$y' = x^(2) + 2 m x - ( m + 7 )$.]
  p[Hàm số đạt cực tiểu tại $x = 2$ thì $y' ( 2 ) = 0 ⇔ 4 + 4 m - m - 7 = 0 ⇔ m = 1$.]
  p[Thử lại: với $m = 1$, $y' = x^(2) + 2 x - 8 = ( x - 2 ) ( x + 4 )$ đổi dấu từ âm sang dương khi $x$ đi qua $2$, nên hàm số đạt cực tiểu tại $x = 2$.]
  p[Vậy $m = 1$. *Đáp án: $1$.*]
  block(sticky: true, above: 6mm, text(weight: "bold", fill: palette.primary)[Câu 6.])
  p[Giá bán là hàm bậc nhất của số lượng: cứ bán thêm $100$ chiếc thì giá giảm $30$ nghìn đồng, và tại $x = 500$ thì giá là $300$ nghìn đồng.]
  p[Do đó $p ( x ) = 300 - "0,3" ( x - 500 ) = 450 - "0,3" x$ (nghìn đồng), tức $p ( x ) = "0,45" - "0,0003" x$ (triệu đồng).]
  p[Lợi nhuận $L ( x ) = x ⋅ p ( x ) - C ( x ) = - "0,0003" x^(2) + "0,33" x - 50$ (triệu đồng).]
  p[$L ( x )$ là hàm bậc hai có hệ số $a < 0$, nên đạt giá trị lớn nhất tại $x = - frac("0,33", 2 ⋅ ( - "0,0003" )) = 550$.]
  p[Khi đó giá bán là $p ( 550 ) = 450 - 165 = 285$ nghìn đồng. *Đáp án: $285$.*]
}
