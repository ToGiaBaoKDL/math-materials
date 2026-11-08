#import "figures.typ": figure
#let solutions = (
"bai-hoc-1": [
Chọn D

Diện tích mặt cắt hình vuông: $S = 9 - x ^(2)$

Thể tích của vật: $V = integral_(0)^(3) lr(( 9 - x ^(2) )) dif x = 18$.
],
"bai-hoc-2": [
Chọn D

Diện tích thiết diện: $S lr(( x )) = frac(x ^(2) sqrt(3), 4)$.

Thể tích của vật thể: $V = integral_(0)^(1) S lr(( x )) dif x = integral_(0)^(1) frac(x ^(2) sqrt(3), 4) dif x$ $= frac(sqrt(3), 4) integral_(0)^(1) x ^(2) dif x$ $= lr([frac(sqrt(3), 12) lr(( x ^(3) ))]) _(0)^(1) = frac(sqrt(3), 12)$.
],
"bai-hoc-3": [
Ta có diện tích thiết diện: $S lr(( x )) = lr(( 2 sqrt(sin x) )) ^(2) . frac(sqrt(3), 4) = sqrt(3) sin x$.

$V = integral_(0)^(π) S lr(( x )) dif x = integral_(0)^(π) sqrt(3) sin x dif x = - sqrt(3) "cos" x |_0^π = 2 sqrt(3)$.
],
"bai-hoc-4": [
Chọn A

Thể tích vật thể tròn xoay là $V = π integral_(1)^(2) lr(( sqrt(e ^(x) - x) )) ^(2) dif x = π lr(( e ^(2) - e - frac(3, 2) ))$.
],
"bai-hoc-5": [
Chọn C

Phương trình hoành độ giao điểm của đồ thị $y = 2 x - x ^(2)$ và trục hoành là

$2 x - x ^(2) = 0 ⇔ lr(bracket.l vec(x = 0, x = 2, delim: #none) )$.

Thể tích vật thể tròn xoay sinh ra khi cho $lr(( H ))$ quay quanh trục hoành là

$V = π integral_(0)^(2) lr(( 2 x - x ^(2) )) ^(2) dif x = frac(16 π, 15)$.
],
"bai-hoc-6": [
Khối tròn xoay được tạo thành khi quay hình phẳng $lr(( H ))$ quanh trục $O x$ có thể tích là

$V = π integral_(1)^(3) lr(( x ^(2) - 4 x )) ^(2) dif x = frac(406, 15) π$
],
"bai-hoc-7": [
Phương trình hoành độ giao điểm của hàm số $y = sqrt(x - 1)$ và trục hoành là $sqrt(x - 1) = 0 ⇒ x = 1$.

Khi đó thể tích khối tròn xoay tạo thành khi quay $D$ quanh trục $O x$ là

$V = π integral_(1)^(5) lr(( sqrt(x - 1) )) ^(2) dif x = π integral_(1)^(5) lr(( x - 1 )) dif x = π lr([lr(( frac(x ^(2), 2) - x ))]) _(1)^(5) = 8 π$.
],
"bai-hoc-8": [
Ta có thể tích của khối chỏm cầu là

$V = π integral_(R - h)^(R) lr(( R ^(2) - x ^(2) )) dif x = lr([π lr(( R ^(2) x - frac(x ^(3), 3) ))]) _(R - h)^(R) = π lr([ R ^(2) . h - R h lr(( R - h )) - frac(h ^(3), 3) ])$ $= π lr(( R h ^(2) - frac(h ^(3), 3) ))$.
],
"bai-hoc-9": [
a) Sai: Khoảng cách từ tâm của khối cầu đến khối chỏm cầu bằng $5 - 1 = 4$.

b) Đúng: Thể tích của khối chỏm cầu được tính theo công thức

$V _(1) = π integral_(4)^(5) sqrt(25 - x ^(2)) ^(2) dif x = π integral_(4)^(5) lr(( 25 - x ^(2) )) dif x$

c) Đúng: Ta có thể tích khối chỏm cầu là

$V = π integral_(4)^(5) lr(( 25 - x ^(2) )) dif x = lr([π lr(( 25 x - frac(x ^(3), 3) ))]) _(4)^(5) = frac(14 π, 3)$.

d) Đúng: Gọi $V _(2)$ là thể tích của nửa khối cầu có bán kính bằng 5.

Ta có $V _(2) = frac(1, 2) . frac(4, 3) π . 5 ^(3) = frac(250, 3) π$ nên suy ra $frac(V _(1), V _(2)) = frac(frac(14, 3) π, frac(250, 3) π) = frac(7, 125)$.
],
"bai-hoc-10": [
Chọn D

#figure("parabol-duong-thang-loi-giai.svg")

Xét phương trình hoành độ giao điểm của hai đồ thị: $x ^(2) = 2 x ⇔ lr(bracket.l vec(x = 0, x = 2, delim: #none) )$

Ta có: $V _(O x) = π integral_(0)^(2) ( 2 x ) ^(2) dif x - π integral_(0)^(2) ( x ^(2) ) ^(2) dif x = π integral_(0)^(2) 4 x ^(2) dif x - π integral_(0)^(2) x ^(4) dif x$
],
"bai-hoc-11": [
Trả lời: 73

#figure("parabol-duong-thang.svg")

Vẽ các đường $y = x ^(2) + 2 x + 2$; $y = 6 - x$; $y = 2$.

Dựa vào hình vẽ ta có:

$V = π integral_(0)^(1) abs(lr(( x ^(2) + 2 x + 2 )) ^(2) - 2 ^(2)) dif x + π integral_(1)^(4) abs(lr(( 6 - x )) ^(2) - 2 ^(2)) dif x = frac(523 π, 15) ⇒ a = 523 "," b = 15$

Vậy $P = 523 - 2 . 15 ^(2) = 73$.

Đáp số này ứng với phân số $frac(a, b)$ tối giản. Nếu chỉ yêu cầu $a, b$ là số nguyên dương như đề đã cho thì $a$, $b$ và do đó $P$ không xác định duy nhất.
],
"bai-hoc-12": [
Chọn A

#figure("hai-parabol-loi-giai.svg")

Phương trình hoành độ giao điểm của 2 đồ thị hàm số $y = 2 lr(( x ^(2) - 1 ))$ và $y = 1 - x ^(2)$ là $2 lr(( x ^(2) - 1 )) = 1 - x ^(2)$ $⇔ x = ± 1$.

Lấy đối xứng đồ thị hàm số $y = 2 lr(( x ^(2) - 1 ))$ qua trục $O x$ ta được đồ thị hàm số $y = 2 lr(( 1 - x ^(2) ))$.

Ta có $2 lr(( 1 - x ^(2) )) ≥ 1 - x ^(2) "," ∀ x ∈ lr([ - 1 ";" 1 ])$. Suy ra thể tích khối tròn xoay cần tìm là

$V = π integral_(- 1)^(1) lr([ 2 lr(( x ^(2) - 1 )) ]) ^(2) dif x = frac(64 π, 15)$.
],
"tu-luyen-1": [
Chọn D
],
"tu-luyen-2": [
Chọn C

Thể tích vật thể $B$: $V = integral_(a)^(b) S lr(( x )) dif x$.
],
"tu-luyen-3": [
Chọn B

Thể tích của khối tròn xoay được tạo thành khi quay $lr(( H ))$ xung quanh trục $O x$ là$V = π integral_(0)^(5) lr(( x ^(2) + 3 )) ^(2) dif x$
],
"tu-luyen-4": [
Chọn B

Ta có $V = integral_(1)^(2) S lr(( x )) dif x = integral_(1)^(2) 2026 x dif x = 3039 .$
],
"tu-luyen-5": [
Ta có diện tích thiết diện: $S lr(( x )) = 3 x . x ^(2) = 3 x ^(3)$. Khi đó $V = integral_(1)^(3) 3 x ^(3) dif x = frac(3, 4) x ^(4) |_1^3 = 60$.
],
"tu-luyen-6": [
Ta có diện tích thiết diện: $S lr(( x )) = frac(x ^(2) lr(( 2 - x )) sqrt(3), 4)$.

$ V _(ℑ) = integral_(0)^(2) frac(x ^(2) (2-x) sqrt(3),4) dif x $

$ = frac(sqrt(3),4) integral_(0)^(2) x^2 (2-x) dif x $

$ = lr([frac(sqrt(3),4) (frac(2,3)x^3-frac(1,4)x^4)])_0^2 = frac(sqrt(3),3). $

],
"tu-luyen-7": [
Mặt nước là hình vuông có cạnh $sqrt(2 + frac(x ^(2), 4))$(dm) nên có diện tích là $lr(( sqrt(2 + frac(x ^(2), 4)) )) ^(2) = 2 + frac(x ^(2), 4) lr(( "dm" ^(2) ))$

Thể tích của bình chứa nước là: $V = integral_(0)^(4) lr(( 2 + frac(x ^(2), 4) )) dif x = frac(40, 3) lr(( "dm" ^(3) ))$
],
"tu-luyen-8": [
Phương trình hoành độ giao điểm của đường cong và trục hoành là: $sqrt(m ^(2) - x ^(2)) = 0 ⇔ x = ± m$

Thể tích vật thể tròn xoay cần tính là: $V = π integral_(- abs(m))^(abs(m)) lr(( m ^(2) - x ^(2) )) dif x = π lr(( m ^(2) x - frac(1, 3) x ^(3) )) |_(-abs(m))^(abs(m)) = frac(4 π m ^(2) abs(m), 3)$

Ta có: $V < 1000 π$ $⇔ frac(4 π m ^(2) abs(m), 3) < 1000 π$ $⇔ abs(m) ^(3) < 750$ $⇔ - root(3, 750) < m < root(3, 750)$.

Ta có $root(3, 750) ≃ "9,08"$ và $m ≠ 0$.

Suy ra, các giá trị $m$ nguyên là $m ∈ lr(\{ - 9 ";" - 8 ";" - 7 ";" - 6 ";" - 5 ";" - 4 ";" - 3 ";" - 2 ";" - 1 ";" 1 ";" 2 ";" 3 ";" 4 ";" 5 ";" 6 ";" 7 ";" 8 ";" 9 \})$

Vậy có $18$ giá trị nguyên của $m$.
],
"tu-luyen-9": [
$V = π integral_(- 2)^(0) lr(( sqrt(x + 2) )) ^(2) dif x = lr([π lr(( frac(x ^(2), 2) + 2 x ))]) _(- 2)^(0) = 2 π .$
],
"tu-luyen-10": [
Ta có $V = π integral_(0)^(π) lr(( - sin x )) ^(2) dif x = π integral_(0)^(π) sin ^(2) x dif x$.
],
"tu-luyen-11": [
$V = π integral_(0)^(ln 3) e ^(2 x) dif x = π frac(1, 2) e ^(2 x) | _(0)^(ln 3) = 4 π$.
],
"tu-luyen-12": [
Xét phương trình: $x ^(2) + x = 2 x ⇔ x ^(2) - x = 0 ⇔ lr(bracket.l vec(x = 0, x = 1, delim: #none) )$

Vì 2 đồ thị cùng nằm phía trên trục hoành trên đoạn $[0;1]$ nên ta có thể tích cần tìm là:

$V = π integral_(0)^(1) abs(lr(( x ^(2) + x )) ^(2) - lr(( 2 x )) ^(2)) dif x = frac(3 π, 10)$
],
"tu-luyen-13": [
Thể tích khối tròn xoay thu được là $V = π integral_(0)^(1) abs(x ^(4) - x) dif x = frac(3 π, 10)$.
],
"tu-luyen-14": [
Phương trình hoành độ giao điểm $abs(x ^(2) - 3 x + 2) = 0 ⇔ lr(bracket.l vec(x = 1, x = 2, delim: #none) )$. Vậy $V = π integral_(1)^(2) abs(x ^(2) - 3 x + 2) ^(2) dif x = frac(π, 30) .$
],
"tu-luyen-15": [
Xét phương trình $2 x - x ^(2) = 0 ⇔ lr(bracket.l vec(x = 0, x = 2, delim: #none) )$.

Tính thể tích của khối tròn xoay thu được khi quay $lr(( H ))$ xung quanh trục $O x$ là

$V = π integral_(0)^(2) lr(( 2 x - x ^(2) )) ^(2) dif x = frac(16, 15) π = lr(( 1 + frac(1, 15) )) π ⇒ a = 1 "," b = 15 ⇒ a b = 15$.
],
"tu-luyen-16": [
Phương trình hoành độ giao điểm là: $x ^(2) = 4 ⇔ x ^(2) - 4 = 0 ⇔ x = ± 2$

Thể tích khối tròn xoay là: $V = π integral_(- 2)^(2) abs(lr(( x ^(2) )) ^(2) - 4 ^(2)) dif x = frac(256 π, 5)$.
],
"tu-luyen-17": [
Ta có $V = π integral_(0)^(4) x dif x = 8 π$ và tọa độ $M lr(( a ";" sqrt(a) ))$.

Khi quay tam giác $O M H$ quanh trục $O x$ tạo thành hai hình nón có chung đáy:

Hình nón $lr(( N _(1) ))$ có đỉnh là $O$, chiều cao $h _(1) = O K = a$, bán kính đáy $R = M K = sqrt(a)$;

Hình nón $lr(( N _(2) ))$ có đỉnh là $H$, chiều cao $h _(2) = H K = 4 - a$, bán kính đáy $R = M K = sqrt(a)$.

Khi đó $V _(1) = frac(1, 3) π R ^(2) h _(1) + frac(1, 3) π R ^(2) h _(2) = frac(4, 3) π a$; $V = 2 V _(1) ⇔ 8 π = 2 . frac(4, 3) π a ⇒ a = 3$.
],
"tu-luyen-18": [
Chọn hệ trục $O x y$ thích hợp như hình sau:

#figure("nua-duong-tron-loi-giai.svg")

Phương trình nửa đường tròn lớn: $f lr(( x )) = sqrt(16 x - x ^(2))$.

Phương trình nửa đường tròn nhỏ: $g lr(( x )) = sqrt(8 x - x ^(2))$.

Phương trình đường thẳng $A C : y = frac(sqrt(3), 3) x$.

Khi đó:

$ V = π integral_(6)^(8) abs((frac(sqrt(3),3)x)^2-(8x-x^2)) dif x + π integral_(8)^(12) (frac(sqrt(3),3)x)^2 dif x $

$ quad + π integral_(12)^(16) (16x-x^2) dif x = frac(784π,3) ≈ 821. $

],
"tu-luyen-19": [
Thể tích cần tìm là thể tích của khối tròn xoay khi quay hình phẳng $lr(( H ))$ giới hạn bởi đồ thị hàm số $f lr(( x )) = sqrt(36 - x ^(2))$, trục hoành và các đường thẳng $x = - 4 "," x = 4$ quanh trục hoành.

Do đó: $V = π integral_(- 4)^(4) lr(( 36 - x ^(2) )) dif x = frac(736 π, 3) ≈ 771$ lít.
],
"tu-luyen-20": [
Chọn A

Ta có thể tích khối chỏm cầu là $V = π integral_(2)^(3) lr(( 9 - x ^(2) )) dif x = lr([π lr(( 9 x - frac(x ^(3), 3) ))]) _(2)^(3) = frac(8 π, 3)$.
],
"tu-luyen-21": [
(a) Hình phẳng được tô màu giới hạn bởi $3$ đường.

Hình phẳng đó giới hạn bởi bốn đường $y = e ^(x)$, trục hoành và hai đường thẳng $x = - 1$, $x = 1$.

» Chọn SAI.

(b) Diện tích hình phẳng được tính bởi công thức $S = integral_(- 1)^(1) lr(( e ^(x) )) ^(2) dif x$.

Ta có diện tích hình phẳng $S = integral_(- 1)^(1) abs("e" ^(x)) dif x = integral_(- 1)^(1) "e" ^(x) dif x$.

» Chọn SAI.

(c) Diện tích hình phẳng $S = e - frac(1, e)$.

Ta có diện tích hình phẳng $S = integral_(- 1)^(1) "e" ^(x) dif x = lr(["e" ^(x)]) _(- 1)^(1) = "e" - frac(1, "e")$.

» Chọn ĐÚNG.

(d) Thể tích khối tròn xoay khi quay hình phẳng đó quanh trục $O x$ là $V = frac(1, 2) π lr(( e ^(2) - frac(1, e ^(2)) ))$.

Ta có thể tích khối tròn xoay khi quay hình phẳng đó quanh trục $O x$ là $V = π integral_(- 1)^(1) lr(( e ^(x) )) ^(2) dif x = π integral_(- 1)^(1) e ^(2 x) dif x = π lr(( lr([frac(1, 2) e ^(2 x)]) _(- 1)^(1) )) = frac(1, 2) π lr(( e ^(2) - frac(1, e ^(2)) ))$.

» Chọn ĐÚNG.
],
"tu-luyen-22": [
#figure("hinh-chop-loi-giai.svg",width:80mm)

(a) Đáy của khối chóp nằm trên mặt phẳng song song với $O x$.

Đáy của khối chóp nằm trên mặt phẳng vuông góc với $O x$ tại $x = h$.

» Chọn SAI.

(b) Mỗi mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ bằng $x lr(( 0 ≤ x ≤ h ))$, cắt khối chóp theo mặt cắt là hình vuông cạnh $a$.

Mỗi mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ bằng $x lr(( 0 ≤ x ≤ h ))$, cắt khối chóp theo mặt cắt là hình vuông có cạnh là $a$.

» Chọn ĐÚNG.

(c) Diện tích mặt cắt là $S lr(( x )) = frac(L, h) x ^(2)$.

Theo định lí Tha-les, ta có $frac(x, h) = frac(frac(a, 2), frac(L, 2))$, suy ra $a = frac(L, h) x$.

Do đó, diện tích của mặt cắt này là $S lr(( x )) = frac(L ^(2), h ^(2)) x ^(2)$.

» Chọn SAI.

(d) Thể tích của khối chóp là $V = frac(1, 3) L ^(2) h$.

Thể tích của khối chóp này là $V = integral_(0)^(h) S lr(( x )) dif x = integral_(0)^(h) frac(L ^(2), h ^(2)) x ^(2) dif x = lr([frac(L ^(2), h ^(2)) frac(x ^(3), 3)]) _(0)^(h) = frac(1, 3) L ^(2) h$.

» Chọn ĐÚNG.
],
"tu-luyen-23": [
a) $F lr(( x )) = integral lr(( frac(x ^(2), 8) - frac(x, 4) + frac(9, 8) )) dif x = frac(x ^(3), 24) - frac(x ^(2), 8) + frac(9, 8) x + C$. Suy ra là mệnh đề đúng.

b) $F lr(( 3 )) = frac(1, 3) ⇒ C = - frac(73, 24) ⇒ F lr(( x )) = frac(x ^(3), 24) - frac(x ^(2), 8) + frac(9, 8) x - frac(73, 24) ⇒ F lr(( 1 )) = - 2$. Suy ra là mệnh đề đúng.

c) $S = integral_(0)^(2) abs(frac(x ^(2), 8) - frac(x, 4) + frac(9, 8) - x) dif x = 1$. Suy ra mệnh đề sai.

d) Mặt trong của món đồ chơi biểu diễn bởi một phần đồ thị hàm số $f lr(( x )) = frac(x ^(2), 8) - frac(x, 4) + frac(9, 8) - "0,1"$

Thể tích của bề dày món đồ chơi đó là $π integral_(1)^(5) lr([ lr(( frac(x ^(2), 8) - frac(x, 4) + frac(9, 8) )) ^(2) - lr(( frac(x ^(2), 8) - frac(x, 4) + frac(9, 8) - "0,1" )) ^(2) ]) dif x = frac(97 π, 75) "dm" ^(3)$

Suy ra là mệnh đề đúng.
],
"tu-luyen-24": [
a) Điều kiện $x ≠ 0$. Suy ra là mệnh đề sai.

b) $x ^(2 n) + 1 > 0 ∀ x ∈ ℝ ";" n ∈ ℕ$ nên $integral_(a)^(b) lr(( x ^(2 n) + 1 )) dif x > 0$ với $∀ a "," b ∈ ℝ ";" a < b$ và $∀ n ∈ ℕ$. Suy ra mệnh đề đúng.

c) $integral_(a)^(b) f lr(( x )) dif x ∈ ℝ$.

Diện tích hình phẳng giới hạn bởi đồ thị hàm số $y = f lr(( x ))$, trục hoành và hai đường thẳng $x = a ";" x = b$ với $a < b$ là $integral_(a)^(b) abs(f lr(( x ))) dif x ≥ 0$. Suy ra là mệnh đề sai.

#grid(columns:(64mm,1fr),gutter:4mm,align:(center+top,left+top),
 figure("giao-hai-hinh-cau.svg",width:64mm),
 [
 d) Quay quanh $O x$ phần diện tích giới hạn bởi hai đường tròn $x ^(2) + y ^(2) = 9$ và $(x - 4) ^(2) + y ^(2) = 4$ ta được thể tích $V$ cần tìm.

 Hoành độ giao điểm của hai đường tròn là nghiệm của phương trình

 $ 9 - x ^(2) = 4 - (x - 4) ^(2) ⇔ x = frac(21, 8). $
 ],
)

Thể tích phần giao nhau của hai khối cầu là

$V = π lr([ integral_(2)^(21 "/" 8) lr([ 4 - lr(( x - 4 )) ^(2) ]) dif x + integral_(21 "/" 8)^(3) lr(( 9 - x ^(2) )) dif x ])$=$frac(53, 48) π ≈ "3,5"$. Suy ra mệnh đề đúng.
],
)
