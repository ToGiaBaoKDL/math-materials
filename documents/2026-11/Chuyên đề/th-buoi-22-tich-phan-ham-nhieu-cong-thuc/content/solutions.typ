#import "../layout.typ": math-flow
#let solutions=(
"bai-hoc-1": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn A*]
Ta có:

#math-flow(($integral_0^2 f(x) dif x$,$= integral_0^1 3x^2 dif x + integral_1^2 (4-x) dif x$,$= 1+frac(5,2)$,$=frac(7,2).$,))

],
"bai-hoc-2": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn B*]
Tách tích phân tại $x=0$:

#math-flow(($I$,$=integral_(-1)^0 e^(2x) dif x + integral_0^2 (x+1) dif x$,$=lr([frac(1,2)e^(2x)])_(-1)^0+lr([frac(x^2,2)+x])_0^2.$,))


#math-flow(($I$,$=frac(1,2)(1-e^(-2))+4$,$=frac(9,2)-frac(1,2e^2)$,$=frac(9e^2-1,2e^2).$,))

],
"bai-hoc-3": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn C*]
Ta có $f(x-1)=cases(2(x-1) & "khi" x≥1,(x-1)^3+(x-1)+1 & "khi" x<1)$.

Thay vào tích phân cần tìm và phân đoạn tại $x=1$, ta được:

#math-flow(($integral_0^2 f(x-1) dif x$,$=integral_0^1 ((x-1)^3+(x-1)+1) dif x +integral_1^2 2(x-1) dif x$,$=frac(5,4).$,))

],
"bai-hoc-4": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn D*]
Vì $F$ là nguyên hàm của $f$ trên $RR$, ta có:

#math-flow(($F(0)-F(-1)$,$=integral_(-1)^0 (4x+1) dif x$,$=-1.$,))


#math-flow(($F(1)-F(0)$,$=integral_0^1 (4x^3+2x+1) dif x$,$=3.$,))


#math-flow(($F(2)-F(1)$,$=integral_1^2 (4x^3+2x+1) dif x$,$=19.$,))

Kết hợp $F(1)=2$, suy ra $F(0)=-1$, $F(-1)=0$ và $F(2)=21$.

Vậy $2F(-1)+3F(2)=63$.
],
"bai-hoc-5": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn B*]
*Cách 1.* Ta có:

#math-flow(($F(x)$,$=cases(-cos x+C_1 & "khi" x≥frac(π,4),sin x+C_2 & "khi" x<frac(π,4)).$,))

Từ $F(frac(π,6))=frac(3,2)$ suy ra $frac(1,2)+C_2=frac(3,2)$, nên $C_2=1$.

Vì $F$ là nguyên hàm trên $RR$ nên $F$ liên tục tại $x=frac(π,4)$:

#math-flow(($-frac(sqrt(2),2)+C_1$,$=frac(sqrt(2),2)+1$,$⇔ C_1$,$=sqrt(2)+1.$,))

Do đó $F(x)=cases(-cos x+sqrt(2)+1 & "khi" x≥frac(π,4),sin x+1 & "khi" x<frac(π,4))$.

Suy ra $F(0)-2F(frac(π,2))=1-2(sqrt(2)+1)=-1-2sqrt(2)$.

*Cách 2.* Đặt $P=F(0)-2F(frac(π,2))$. Khi đó:

#math-flow(($P$,$=lr([F(0)-F(frac(π,6))])-2lr([F(frac(π,2))-F(frac(π,6))])-F(frac(π,6)).$,))


#math-flow(($P$,$=integral_(π "/" 6)^0 cos x dif x-2lr([integral_(π "/" 6)^(π "/" 4) cos x dif x+integral_(π "/" 4)^(π "/" 2) sin x dif x])-frac(3,2)$,))

$ P=-1-2sqrt(2). $

],
"bai-hoc-6": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn C*]
Ta có $F(x)=cases(x^3+x^2+m x+C_1 & "khi" x≥1,5x-x^2+C_2 & "khi" x<1)$.

Từ $F(-2)=-10$, suy ra $-14+C_2=-10$, nên $C_2=4$.

Vì $F$ là nguyên hàm trên $RR$, $F$ liên tục tại $x=1$:

#math-flow(($m+2+C_1$,$=4+C_2$,$⇔ C_1$,$=6-m.$,))

Các giới hạn một phía của $f$ tại $1$ tồn tại; để $F$ khả vi tại $1$, chúng phải bằng nhau. Do đó $m+5=3$, suy ra $m=-2$ và $C_1=8$.

Vậy $F(x)=cases(x^3+x^2-2x+8 & "khi" x≥1,5x-x^2+4 & "khi" x<1)$, nên $F(3)=38$.
],
"bai-hoc-7": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn C*]
Trên mỗi khoảng xác định:

#math-flow(($f(x)$,$=integral frac(x+1,x^2) dif x$,$=ln abs(x)-frac(1,x)+C.$,))

Suy ra $f(x)=cases(ln abs(x)-frac(1,x)+C_1 & "khi" x<0,ln abs(x)-frac(1,x)+C_2 & "khi" x>0)$.

Từ $f(-2)=frac(3,2)$, ta có $ln 2+frac(1,2)+C_1=frac(3,2)$, nên $C_1=1-ln 2$.

Từ $f(2)=2ln 2-frac(3,2)$, ta có $ln 2-frac(1,2)+C_2=2ln 2-frac(3,2)$, nên $C_2=ln 2-1$.

Vậy:

#math-flow(($f(-1)+f(4)$,$=(2-ln 2)+(ln 4-frac(1,4)+ln 2-1)$,$=frac(8ln 2+3,4).$,))

],
"tu-luyen-1": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn A*]
Ta có:

#math-flow(($integral_0^2 f(x) dif x$,$=integral_0^1 3x^2 dif x+integral_1^2 (4-x) dif x$,$=1+frac(5,2)$,$=frac(7,2).$,))

],
"tu-luyen-2": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn A*]
Ta có:

#math-flow(($I$,$=integral_0^1 (4-x) dif x+integral_1^2 3x^2 dif x$,$=frac(7,2)+7$,$=frac(21,2).$,))

],
"tu-luyen-3": [
Đổi tên biến tích phân và phân đoạn tại $0$, $2$:

#math-flow(($I$,$=frac(1,7)integral_(-5)^9 f(x) dif x.$,))


#math-flow(($I$,$=frac(1,7)lr([integral_(-5)^0 (2x^2-1) dif x+integral_0^2 (x-1) dif x+integral_2^9 (5-2x) dif x])$,$=frac(109,21)≈5,19.$,))

],
"tu-luyen-4": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn B*]
Vì $f$ liên tục tại $x=4$ nên $frac(1,4)-a=-4-b$, hay $a-b=frac(17,4)$.

Mặt khác:

#math-flow(($integral_(-2)^9 f(x) dif x$,$=integral_(-2)^4 (-x^2+3x-b) dif x+integral_4^9 (frac(1,2sqrt(x))-a) dif x.$,))


#math-flow(($integral_(-2)^9 f(x) dif x$,$=-6-6b+1-5a$,$=-6b-5a-5$,$=frac(27,4).$,))

Suy ra $cases(a-b=frac(17,4),5a+6b=-frac(47,4)) ⇔ cases(a=frac(5,4),b=-3)$.

Vậy $4a+b=2$.
],
"tu-luyen-5": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn B*]
Vì $f$ liên tục tại $0$ nên $1+m=0$, suy ra $m=-1$.

Ta có:

#math-flow(($integral_(-1)^1 f(x) dif x$,$=integral_(-1)^0 x^2(x^3+1)^3 dif x+integral_0^1 (e^x-1) dif x.$,))


#math-flow(($integral_(-1)^1 f(x) dif x$,$=lr([frac((x^3+1)^4,12)])_(-1)^0+lr([e^x-x])_0^1$,$=e-frac(23,12).$,))

Do đó $a=1$, $b=23$, $c=12$. Vậy $a+b+c+m=35$.
],
"tu-luyen-6": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn A*]
Vì $f$ liên tục tại $x=1$ nên $a+2=b+3$, suy ra $a=b+1$.

Ta có:

#math-flow(($integral_0^2 f(x) dif x$,$=integral_0^1 (3x^2+b) dif x+integral_1^2 (2x+a) dif x$,$=a+b+4.$,))

Theo giả thiết, $a+b+4=13$, nên $a+b=9$.

Giải hệ $cases(a-b=1,a+b=9)$, được $a=5$, $b=4$. Vậy $T=a+b-a b=-11$.
],
"tu-luyen-7": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn D*]
Ta có:

#math-flow(($integral_(-1)^2 f(x) dif x$,$=integral_(-1)^0 (2x+3) dif x+integral_0^2 (x^2-2x+3) dif x$,$=2+frac(14,3)$,$=frac(20,3).$,))

Suy ra $F(2)-F(-1)=frac(20,3)$.

Mặt khác, $F(x)=cases(x^2+3x+C_1 & "khi" x≤0,frac(x^3,3)-x^2+3x+C_2 & "khi" x>0)$.

Vì $F(3)=0$ nên $9+C_2=0$, tức $C_2=-9$.

Do đó $F(2)=frac(8,3)-4+6-9=-frac(13,3)$ và $F(-1)=-11$.

Vậy $2F(-1)+3F(2)=-35$.
],
"tu-luyen-8": [
#block(sticky:true,above:0pt,below:3mm)[*Chọn B*]
Vì $F$ liên tục tại $x=1$ nên $1+5+C_1=1+4+C_2$, suy ra $C_1-C_2=-1$.

Do đó:

#math-flow(($integral_0^2 f(x) dif x$,$=F(2)-F(0)$,$=14+C_1-C_2$,$=13.$,))

],
"tu-luyen-9": [
*a) Đúng.* Trên $[1;2]$, $f(x)=x-2$, nên:

$ integral_1^2 f(x) dif x=integral_1^2 (x-2) dif x. $

*b) Đúng.* Trên $[2;3]$, $f(x)=x^2-2x$, nên:

$ integral_2^3 f(x) dif x=integral_2^3 (x^2-2x) dif x. $

*c) Sai.* Công thức đúng là:

#math-flow(($integral_1^3 f(x) dif x$,$=integral_1^2 (x-2) dif x+integral_2^3 (x^2-2x) dif x.$,))


#math-flow(($integral_1^3 f(x) dif x$,$=lr([frac(x^2,2)-2x])_1^2+lr([frac(x^3,3)-x^2])_2^3.$,))

*d) Đúng.* Từ trên suy ra:

$ integral_1^3 f(x) dif x=-frac(1,2)+frac(4,3)=frac(5,6). $
],
"tu-luyen-10": [
*a) Đúng.* Ta có:

#math-flow(($integral f(x) dif x$,$=integral (2+frac(1,x)) dif x$,$=2x+ln abs(x)+C.$,))

*b) Đúng.* Trên $(0;+infinity)$, $F(x)=2x+ln x+C$. Điều kiện $F(1)=3$ cho $C=1$.

Vậy $F(x)=2x+ln abs(x)+1$ trên khoảng đang xét.

*c) Sai.* Ta có:

$ f'(x)=-frac(1,x^2) arrow.r f'(2x)=-frac(1,4x^2). $

#math-flow(($integral f'(2x) dif x$,$=-integral frac(1,4x^2) dif x$,$=frac(1,4x)+C.$,))

*d) Chưa đủ chặt chẽ.* Viết:

$ G(x)=cases(2x+ln x+C_1 & "khi" x>0,2x+ln(-x)+C_2 & "khi" x<0). $

Từ $G(2)=1$, suy ra $4+ln 2+C_1=1$, nên $C_1=-3-ln 2$.

Điều kiện $G(5)+G(-5)=0$ cho:

#math-flow(($(10+ln 5-3-ln 2)+(-10+ln 5+C_2)$,$=0$,$⇔ C_2$,$=3+ln 2-2ln 5.$,))

Vậy $G(-10)=-20+ln 10+3+ln 2-2ln 5=ln 10-2ln 5+ln 2-17$.

Do $ln 10=ln 2+ln 5$, các hệ số không duy nhất; chưa thể kết luận đúng/sai từ tổng hệ số như đề đã cho.
],
"tu-luyen-11": [
*a) Sai.* Công thức đúng trên mỗi khoảng xác định là:

#math-flow(($integral f(x) dif x$,$=integral (x+5-frac(7,x)) dif x$,$=frac(x^2,2)+5x-7ln abs(x)+C.$,))

*b) Đúng.* Vì $f'(x)=1+frac(7,x^2)=frac(x^2+7,x^2)=g(x)$.

*c) Đúng.* Ta có:

#math-flow(($integral_(-2)^(-1) f(x) dif x$,$=lr([frac(x^2,2)+5x-7ln abs(x)])_(-2)^(-1)$,$=frac(7,2)+7ln 2.$,))

Suy ra $m=7$, $n=2$, nên $m+2025n=4057$.

*d) Sai.* Đặt:

#math-flow(($G(x)$,$=cases(frac(x^2,2)+5x-7ln x+C_1 & "khi" x>0,frac(x^2,2)+5x-7ln(-x)+C_2 & "khi" x<0).$,))

Từ $G(1)=4$, suy ra $frac(1,2)+5+C_1=4$, nên $C_1=-frac(3,2)$.

Từ $G(3)+G(-9)=20$:

#math-flow(($frac(9,2)+15-7ln 3-frac(3,2)+frac(81,2)-45-7ln 9+C_2$,$=20.$,))

Suy ra $C_2=frac(13,2)+21ln 3$.

Do đó $G(-6)=18-30-7ln 6+frac(13,2)+21ln 3=-7ln 2+14ln 3-frac(11,2)$.

Vậy $a+b+c=-7+14-frac(11,2)=frac(3,2)$.
],
"tu-luyen-12": [
#align(center, image("../figures/quadratic-sign.svg",width:110mm))

*a) Đúng.* Từ bảng xét dấu: $x^2-9≤0$ trên $[0;3]$ và $x^2-9≥0$ trên $[3;9]$.

*b) Sai.* Theo tính chất cộng khoảng:

#math-flow(($integral_0^9 f(x) dif x$,$=integral_0^3 f(x) dif x+integral_3^9 f(x) dif x.$,))

*c) Đúng.* Theo bảng xét dấu:

#math-flow(($integral_0^9 abs(x^2-9) dif x$,$=-integral_0^3 (x^2-9) dif x+integral_3^9 (x^2-9) dif x.$,))

*d) Sai.* Thế $m=1$, vế phải bằng $integral_0^9 (x^2-9) dif x=162$, còn vế trái bằng $198$.

],
)
