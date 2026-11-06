#import "../layout.typ": math-flow
#let solutions=(
"bai-hoc-1": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn A*]
Dựa vào đồ thị, ta có:
#math-flow(($S$,$=integral_(-1)^1 f(x) dif x-integral_1^2 f(x) dif x.$,))
],
"bai-hoc-2": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn D*]
Từ dấu của $f(x)$ trên hình vẽ:
#math-flow(($S$,$=-integral_(-3)^1 f(x) dif x+integral_1^2 f(x) dif x$,$=-a+b.$,))
],
"bai-hoc-3": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn B*]
Tích phân bằng tổng diện tích có dấu của ba tam giác:
#math-flow(($integral_(-3)^3 f(x) dif x$,$=-frac(1,2) dot 1 dot 1+frac(1,2) dot 3 dot 1+frac(1,2) dot 2 dot 4$,$=5.$,))
],
"bai-hoc-4": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn B*]
Ta có $x^2-x=x(x-1)$ âm trên $(0;1)$ và dương trên $(1;2)$. Vì vậy:
#math-flow(($S$,$=-integral_0^1 (x^2-x) dif x+integral_1^2 (x^2-x) dif x.$,))
],
"bai-hoc-5": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn D*]
Giải $x^2-4x+3=0$ được $x=1$ hoặc $x=3$. Trên $[0;1]$ hàm số không âm, trên $[1;3]$ hàm số không dương.
#math-flow(($S$,$=integral_0^1 (x^2-4x+3) dif x-integral_1^3 (x^2-4x+3) dif x.$,))
#math-flow(($S$,$=lr([frac(x^3,3)-2x^2+3x])_0^1-lr([frac(x^3,3)-2x^2+3x])_1^3$,))
#math-flow(($=$,$frac(8,3).$,))
],
"bai-hoc-6": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn D*]
Hoành độ giao điểm thỏa mãn $x^2-2x=0$, nên $x=0$ hoặc $x=2$.
#math-flow(($S$,$=integral_0^2 (2x-x^2) dif x$,$=lr([x^2-frac(x^3,3)])_0^2$,$=frac(4,3).$,))
],
"bai-hoc-7": [
Từ đồ thị:
#math-flow(($f(x)$,$=cases(x+3 & quad -3≤x≤-1,2 & quad -1≤x≤1,-2x+4 & quad 1≤x≤3).$,))
*a) Sai.* Diện tích phải được tính bằng $S=integral_(-3)^3 abs(f(x)) dif x$.

*b) Đúng.* Trên $[2;3]$, $f(x)≤0$, nên $S_2=-integral_2^3(-2x+4)dif x=1$.

*c) Đúng.* Phần nằm trên trục hoành có diện tích:
#math-flow(($S_1$,$=integral_(-3)^(-1)(x+3)dif x+integral_(-1)^1 2 dif x+integral_1^2(-2x+4)dif x$,$=7.$,))
*d) Đúng.* $S=S_1+S_2=S_1-integral_2^3(-2x+4)dif x=8$.
],
"bai-hoc-8": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn D*]
Trên đoạn $[-3;1]$, đường thẳng $y=-x+1$ nằm phía trên parabol $y=x^2+x-2$. Do đó:
#math-flow(($S$,$=integral_(-3)^1 ((-x+1)-(x^2+x-2)) dif x$,$=integral_(-3)^1(-x^2-2x+3)dif x.$,))
],
"bai-hoc-9": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn A*]
Miền gạch sọc được giới hạn bởi $y=2^x$, $y=2$, $x=1$ và $x=3$. Trên $[1;3]$, $2^x≥2$, nên:
#math-flow(($S$,$=integral_1^3 (2^x-2) dif x.$,))
],
"bai-hoc-10": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn B*]
Phương trình hoành độ giao điểm:
#math-flow(($x^2$,$=-x^3+2x$,$⇔ x(x+2)(x-1)$,$=0$,$⇔ x∈{-2;0;1}.$,))
Hiệu $x^3+x^2-2x$ đổi dấu tại $x=0$. Vì vậy:
#math-flow(($S$,$=integral_(-2)^0(x^3+x^2-2x)dif x-integral_0^1(x^3+x^2-2x)dif x$,$=frac(37,12).$,))
],
"bai-hoc-11": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn D*]
Giải $x^2-1=x-1$ được $x=0$ hoặc $x=1$.
#math-flow(($S$,$=integral_0^1(x-x^2)dif x$,$=lr([frac(x^2,2)-frac(x^3,3)])_0^1$,$=frac(1,6).$,))
],
"bai-hoc-12": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn D*]
Hoành độ giao điểm thỏa mãn:
#math-flow(($x^3-6x$,$=x^2$,$⇔ x(x+2)(x-3)$,$=0$,$⇔ x∈{-2;0;3}.$,))
#math-flow(($S$,$=integral_(-2)^0(x^3-x^2-6x)dif x-integral_0^3(x^3-x^2-6x)dif x$,$=frac(253,12).$,))
],
"bai-hoc-13": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn D*]
Vì $m>0$, các giao điểm có $x≥0$, $y≥0$. Giải hệ $2m y=x^2$, $2m x=y^2$ được hai giao điểm $(0;0)$ và $(2m;2m)$.
#math-flow(($S$,$=integral_0^(2m)(sqrt(2m x)-frac(x^2,2m))dif x$,$=frac(4m^2,3).$,))
Từ $S=3$ và $m>0$, suy ra $m=frac(3,2)$.
],
"bai-hoc-14": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn B*]
Ta có $F'(x)-G'(x)=2x+1$, nên $F(x)-G(x)=x^2+x+C$.
Thay vào hai giả thiết:
#math-flow(($cases(G(2)+2G(1)+6+C=2023, G(2)+2G(1)+4+2C=2019).$,))
Lấy phương trình thứ hai trừ phương trình thứ nhất: $C-2=-4$, suy ra $C=-2$.
Hai đồ thị cắt nhau tại các hoành độ $-2$ và $1$. Do đó:
#math-flow(($S$,$=integral_(-2)^1 abs(x^2+x-2)dif x$,$=frac(9,2).$,))
],
"bai-hoc-15": [
Đường thẳng qua $A(2;5)$ và $B(7;10)$ có phương trình $y=x+3$.
Đặt $f(x)=u x^2+v x+w$. Từ hai giao điểm suy ra $v=1-9u$, $w=3+14u$; hình vẽ cho $u>0$.
#math-flow(($frac(125,6)$,$=integral_2^7((x+3)-f(x))dif x$,$=frac(125,6)u.$,))
Suy ra $u=1$, $v=-8$, $w=17$, nên $f(x)=x^2-8x+17$ và $f'(x)=2x-8$.

*a) Đúng.* $integral_2^7 f(x)dif x=frac(50,3)$.

*b) Sai.* Phương trình đúng của $d$ là $y=x+3$.

*c) Đúng.* $integral_2^7 f'(x)dif x=f(7)-f(2)=10-5=5$.

*d) Đúng.*
#math-flow(($integral_2^7(2x-3)f'(x)dif x$,$=integral_2^7(4x^2-22x+24)dif x$,$=frac(215,3).$,))
],
"bai-hoc-16": [
Hai hàm bậc ba có ba giao điểm đã cho, nên:
#math-flow(($f(x)-g(x)$,$=k(x+4)(x+1)(x-4).$,))
Thay $x=2$: $5=-36k$, suy ra $k=-frac(5,36)$.
#math-flow(($S_1$,$=integral_(-4)^(-1)abs(-frac(5,36)(x+4)(x+1)(x-4))dif x$,$=frac(65,16).$,))
#math-flow(($S_2$,$=integral_(-1)^4 abs(-frac(5,36)(x+4)(x+1)(x-4))dif x$,$=frac(6875,432).$,))
Vậy $frac(S_1,S_2)=frac(351,1375)≈"0,3"$.
],
"tu-luyen-1": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn B*]
Áp dụng công thức diện tích hình phẳng giới hạn bởi đồ thị và trục hoành:
#math-flow(($S$,$=integral_a^b abs(f(x))dif x.$,))
],
"tu-luyen-2": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn C*]
Áp dụng công thức diện tích hình phẳng giữa hai đồ thị:
#math-flow(($S$,$=integral_a^b abs(f(x)-g(x))dif x.$,))
],
"tu-luyen-3": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn A*]
Đồ thị nằm trên trục hoành trong $[0;1]$ và dưới trục hoành trong $[1;2]$. Do đó:
#math-flow(($S$,$=integral_0^1 f(x)dif x-integral_1^2 f(x)dif x.$,))
],
"tu-luyen-4": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn C*]
Vì $sin x≥0$ trên $[0;π]$, ta có:
#math-flow(($S$,$=integral_0^π sin x dif x$,$=lr([-cos x])_0^π$,$=2.$,))
],
"tu-luyen-5": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn A*]
Trên $[1;2]$, $(x-2)^2-1≤0$. Do đó:
#math-flow(($S$,$=integral_1^2(1-(x-2)^2)dif x$,$=lr([x-frac((x-2)^3,3)])_1^2$,$=frac(2,3).$,))
],
"tu-luyen-6": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn D*]
Hoành độ giao điểm là nghiệm của $-x^2+x+6=0$, tức $x=-2$ hoặc $x=3$.
#math-flow(($S$,$=integral_(-2)^3(-x^2+x+6)dif x$,$=lr([-frac(x^3,3)+frac(x^2,2)+6x])_(-2)^3$,$=frac(125,6).$,))
],
"tu-luyen-7": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn A*]
Đồ thị cắt trục hoành tại $x=-1/3$ và nằm trên trục hoành trong $[-1/3;0]$.
#math-flow(($S$,$=integral_(-1"/"3)^0 frac(-3x-1,x-1)dif x.$,))
#math-flow(($S$,$=lr([-3x-4ln abs(x-1)])_(-1/3)^0$,$=4ln frac(4,3)-1.$,))
],
"tu-luyen-8": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn A*]
Hàm số $e^(x/2)$ luôn dương. Vì vậy:
#math-flow(($S$,$=integral_0^2 e^(x/2)dif x$,$=lr([2e^(x/2)])_0^2$,$=2e-2.$,))
],
"tu-luyen-9": [
Tách tại điểm đổi công thức $x=1$ và nghiệm $x=2$:
#math-flow(($S$,$=integral_0^1(7-4x^3)dif x+integral_1^2(4-x^2)dif x+integral_2^3(x^2-4)dif x.$,))
#math-flow(($S$,$=6+frac(5,3)+frac(7,3)$,$=10.$,))
],
"tu-luyen-10": [
*a) Đúng.* Trên $[a;b]$, $f(x)≥0$, nên $S_1=integral_a^b f(x)dif x$.

*b) Đúng.* Đổi cận tích phân cho:
#math-flow(($S_2$,$=integral_b^c abs(f(x))dif x$,$=-integral_c^b abs(f(x))dif x.$,))
*c) Sai.* Trên $[c;d]$, $f(x)≥0$, nên $S_3=integral_c^d f(x)dif x$.

*d) Đúng.* Cộng diện tích ba miền:
#math-flow(($S$,$=integral_a^b f(x)dif x-integral_b^c f(x)dif x+integral_c^d f(x)dif x.$,))
],
"tu-luyen-11": [
Trên $[0;1]$, $f'(x)≥0$, nên $f(1)-f(0)=S_A=4$, suy ra $f(1)=6$.

Trên $[1;3]$, $f'(x)≤0$, nên $f(3)-f(1)=-S_B=-10$.

Vậy $f(3)=6-10=-4$.
],
"tu-luyen-12": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn D*]
Trên $[-1;2]$, parabol $y=-2x^2+2x+8$ nằm phía trên đồ thị $y=x^3-3x+2$. Vì vậy:
#math-flow(($S$,$=integral_(-1)^2((-2x^2+2x+8)-(x^3-3x+2))dif x.$,))
#math-flow(($S$,$=integral_(-1)^2(-x^3-2x^2+5x+6)dif x.$,))
],
"tu-luyen-13": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn D*]
Giải $x^2=8-x^2$ được $x=±2$. Trên $[-2;2]$, $8-x^2≥x^2$.
#math-flow(($S$,$=integral_(-2)^2(8-2x^2)dif x$,$=lr([8x-frac(2x^3,3)])_(-2)^2$,$=frac(64,3).$,))
],
"tu-luyen-14": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn A*]
Hoành độ giao điểm thỏa mãn $-x^3+12x=-x^2$, nên $x∈{-3;0;4}$.
#math-flow(($S$,$=-integral_(-3)^0(-x^3+x^2+12x)dif x+integral_0^4(-x^3+x^2+12x)dif x.$,))
Tính các tích phân được $S=frac(937,12)$.
],
"tu-luyen-15": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn C*]
Giải $x^3-x=2x^2-x$ được $x=0$ hoặc $x=2$.
#math-flow(($S$,$=integral_0^2(2x^2-x^3)dif x$,$=lr([frac(2x^3,3)-frac(x^4,4)])_0^2$,$=frac(4,3).$,))
],
"tu-luyen-16": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn B*]
Phương trình hoành độ giao điểm $x^3-3x=x$ có các nghiệm $-2$, $0$, $2$.
#math-flow(($S$,$=integral_(-2)^0(x^3-4x)dif x-integral_0^2(x^3-4x)dif x$,$=4+4$,$=8.$,))
],
"tu-luyen-17": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn D*]
Giải $abs(ln x)=1$ được $x=1/e$ hoặc $x=e$. Trên đoạn này $abs(ln x)≤1$, nên:
#math-flow(($S$,$=integral_(1"/"e)^(e)(1-abs(ln x))dif x.$,))
],
"tu-luyen-18": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn A*]
Theo định lý Newton–Leibniz:
#math-flow(($F(4)-F(0)$,$=F(4)-G(0)+2m$,$⇒ G(0)-F(0)$,$=2m.$,))
Vì $F$, $G$ là hai nguyên hàm của cùng hàm số trên $RR$, hiệu $G(x)-F(x)$ không đổi. Do đó $G(x)-F(x)=2m>0$.
#math-flow(($S$,$=integral_0^4 2m dif x$,$=8m$,$=8$,$⇒ m$,$=1.$,))
],
"tu-luyen-19": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn B*]
Giải $x^3=-2x+3$ được $x=1$. Đường cong cắt trục hoành tại $0$, đường thẳng cắt trục hoành tại $3/2$.
#math-flow(($S$,$=integral_0^1 x^3 dif x+integral_1^(3"/"2)(-2x+3)dif x$,$=frac(1,4)+frac(1,4)$,$=frac(1,2).$,))
],
"tu-luyen-20": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn B*]
Ta có $f'(x)=6x^2+2a x+b$. Từ đồ thị, $f'(0)=f'(4/3)=0$, suy ra $b=0$, $a=-4$.
#math-flow(($f(x)-f'(x)$,$=2x^3-10x^2+8x$,$=2x(x-1)(x-4).$,))
#math-flow(($S$,$=integral_0^1(2x^3-10x^2+8x)dif x-integral_1^4(2x^3-10x^2+8x)dif x$,$=frac(71,3).$,))
Vậy $m+n=71+3=74$.
],
"tu-luyen-21": [
Hai đồ thị cắt nhau tại các hoành độ $1$ và $3$.

*a) Sai.* Diện tích giới hạn bởi hai đồ thị là $integral_1^3(-x^2+4x-3)dif x$.

*b) Đúng.* $S_1=integral_0^1(x^2-4x+3)dif x=frac(4,3)$.

*c) Đúng.* $S_2=integral_1^3(-x^2+4x-3)dif x=frac(4,3)=S_1$.

*d) Sai.* Diện tích giữa hai đồ thị trên đoạn $[0;3]$ bằng $S_1+S_2=frac(8,3)$.
],
"tu-luyen-22": [
Phương trình hoành độ giao điểm:
#math-flow(($x^3-2x^2-5x+6$,$=(x+2)(x-1)(x-3)$,$=0.$,))
Các giao điểm là $A(-2;-6)$, $B(1;0)$, $C(3;4)$.

*a) Đúng.* Điểm $A$ có tung độ $-6$.

*b) Sai.* Đặt $h(x)=x^3-2x^2-3x+4$. Hàm số đổi dấu tại $1$ trong đoạn $[-1;2]$:
#math-flow(($S$,$=integral_(-1)^1 h(x)dif x-integral_1^2 h(x)dif x$,$=frac(97,12).$,))
*c) Đúng.* Đặt $u(x)=x^3-2x^2-5x+6$. Ta có:
#math-flow(($S_1$,$=integral_(-2)^1 u(x)dif x$,$=frac(63,4), quad S_2$,$=-integral_1^3 u(x)dif x$,$=frac(16,3).$,))
Suy ra $S=S_1+S_2=frac(253,12)$.

*d) Sai.* $frac(S_1,S_2)=frac(63,4):frac(16,3)=frac(189,64)$.
],
"tu-luyen-23": [
*a) Sai.* Tích phân có dấu bằng:
#math-flow(($integral_(-1)^4 f'(x)dif x$,$=frac(64,3)-63$,$=-frac(125,3).$,))
*b) Đúng.* $f(1)=f(-1)+frac(64,3)=-frac(35,3)+frac(64,3)=frac(29,3)$.

*c) Sai.* Vì $f$ bậc bốn, $f'$ bậc ba và có các nghiệm $-1$, $1$, $4$, nên $f'(x)=k(x+1)(x-1)(x-4)$.
#math-flow(($integral_(-1)^1 f'(x)dif x$,$=frac(16k,3)$,$=frac(64,3)$,$⇒ k$,$=4.$,))
Lấy nguyên hàm:
#math-flow(($f(x)$,$=x^4-frac(16,3)x^3-2x^2+16x+C.$,))
Thay $f(-1)=-frac(35,3)$ được $C=0$.

*d) Đúng.* Với $g(x)=-2x^2+16x$, phương trình $f(x)=g(x)$ có nghiệm $0$, $16/3$.
#math-flow(($S$,$=integral_0^(16"/"3)(frac(16,3)x^3-x^4)dif x$,$=frac(262144,1215)≈"215,756".$,))
Làm tròn đến hàng đơn vị được $216$.
],
"tu-luyen-24": [
Phương trình hoành độ giao điểm:
#math-flow(($x^3-2x^2-5x+6$,$=(x+2)(x-1)(x-3)$,$=0.$,))
Các giao điểm là $A(-2;-6)$, $B(1;0)$, $C(3;4)$.

*a) Sai.* Điểm $A$ có tung độ $-6$.

*b) Sai.* Đặt $h(x)=x^3-2x^2-3x+4$. Hàm số đổi dấu tại $1$ trong đoạn $[-1;2]$:
#math-flow(($S$,$=integral_(-1)^1 h(x)dif x-integral_1^2 h(x)dif x$,$=frac(97,12).$,))
*c) Đúng.* Đặt $u(x)=x^3-2x^2-5x+6$. Ta có:
#math-flow(($S_1$,$=integral_(-2)^1 u(x)dif x$,$=frac(63,4), quad S_2$,$=-integral_1^3 u(x)dif x$,$=frac(16,3).$,))
Suy ra $S=S_1+S_2=frac(253,12)$.

*d) Sai.* $frac(S_1,S_2)=frac(63,4):frac(16,3)=frac(189,64)$.
],
"tu-luyen-25": [
#block(sticky:true,above:0pt,below:2mm)[*Chọn A*]
Đường thẳng qua $A(2;5)$ và $B(7;10)$ có phương trình $y=x+3$.
Đặt $f(x)=u x^2+v x+w$. Từ hai giao điểm suy ra $v=1-9u$, $w=3+14u$; hình vẽ cho $u>0$.
#math-flow(($frac(125,6)$,$=integral_2^7((x+3)-f(x))dif x$,$=frac(125,6)u.$,))
Suy ra $u=1$, $v=-8$, $w=17$, nên $f(x)=x^2-8x+17$ và $f'(x)=2x-8$.
#math-flow(($integral_2^7(2x-3)f'(x)dif x$,$=integral_2^7(4x^2-22x+24)dif x$,$=frac(215,3).$,))
],
"tu-luyen-26": [
Hai nhánh của hàm số đoạn thẳng gặp nhau tại $x=1$. Parabol cắt nhánh $y=-x$ tại $x=0$ và nhánh $y=x-2$ tại $x=3$ trong miền đang xét.
#math-flow(($S$,$=integral_0^1(frac(13,3)x-x^2)dif x+integral_1^3(frac(7,3)x-x^2+2)dif x.$,))
#math-flow(($S$,$=lr([frac(13,6)x^2-frac(x^3,3)])_0^1+lr([frac(7,6)x^2-frac(x^3,3)+2x])_1^3$,$=frac(13,2)$,$="6,5".$,))
],
"tu-luyen-27": [
Đặt $t=abs(x_P)>0$, khi đó $y_P=2t^2$. Nhờ tính đối xứng qua trục tung, có thể tính diện tích ở phía $x≥0$:
#math-flow(($S_1$,$=integral_0^(t)(2x^2-x^2)dif x$,$=frac(t^3,3).$,))
Tính miền thứ hai theo biến $y$:
#math-flow(($S_2$,$=integral_0^(2t^2)(sqrt(frac(y,2))-sqrt(frac(y,k)))dif y$,$=frac(4t^3,3)(1-sqrt(frac(2,k))).$,))
Từ $S_1=S_2$ và $t>0$:
#math-flow(($1$,$=4-4sqrt(frac(2,k))$,$⇒ k$,$=frac(32,9).$,))
Vậy $a+b=32+9=41$.
],
"tu-luyen-28": [
Hai parabol đều cắt trục hoành tại $-1$, $4$. Từ các tung độ tại $x=0$ trên hình vẽ, suy ra:
#math-flow(($f(x)$,$=-frac(3,4)(x+1)(x-4), quad g(x)$,$=-frac(1,2)(x+1)(x-4).$,))
Do đó:
#math-flow(($S$,$=integral_(-1)^4(-frac(1,4)(x+1)(x-4))dif x$,$=frac(125,24)≈"5,21".$,))
],
"tu-luyen-29": [
Parabol $(P_1)$ cắt trục hoành tại $x=±sqrt(6)$. Parabol $(P_2)$ có cùng hai nghiệm và đỉnh $(0;a)$, nên:
#math-flow(($(P_2): y$,$=frac(a,6)(6-x^2).$,))
Giao điểm của $(P_1)$ với $y=a$ có hoành độ $±sqrt(6-a)$. Vì vậy:
#math-flow(($S_1$,$=integral_(-sqrt(6-a))^(sqrt(6-a))(6-a-x^2)dif x$,$=frac(4,3)(6-a)^(3/2).$,))
#math-flow(($S_2$,$=integral_(-sqrt(6))^(sqrt(6))frac(a,6)(6-x^2)dif x$,$=frac(4sqrt(6),3)a.$,))
Do $0<a<6$, đẳng thức $S_1=S_2$ tương đương $(6-a)^3=6a^2$.
Khai triển được $a^3-12a^2+108a=216$. Vậy $T=216$.
],
)
