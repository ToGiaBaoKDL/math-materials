#import "../layout.typ": math-flow
#let solutions=(
"bai-hoc-1": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn D*]
Ta có $integral_0^(pi "/" 2) sin x dif x = lr([ -cos x ])_0^(pi "/" 2) = -cos(pi/2) + cos 0 = 1$.
],
"bai-hoc-2": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]
Ta có $I = integral_0^1 5^x dif x = lr([frac(5^x,ln 5)])_0^1 = frac(5-1,ln 5) = frac(4,ln 5)$.
],
"bai-hoc-3": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]
$integral_1^3 frac(x+2,x) dif x = integral_1^3 (1 + frac(2,x)) dif x = lr([x + 2 ln abs(x)])_1^3 = 2 + 2 ln 3$.

Do đó $a = 2$, $b = 2$, $c = 3$, suy ra $S = a+b+c = 7$.
],
"bai-hoc-4": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]
Ta có $integral (m x+n) dif x = frac(m,2)x^2 + n x + C$.

Từ giả thiết suy ra $cases(frac(m,2)+n=3, 2m+2n=8) ⇔ cases(m=2,n=2)$. Vậy $m+n=4$.
],
"bai-hoc-5": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn C*]
$integral_0^m (3x^2-2x+1) dif x = lr([x^3-x^2+x])_0^m = m^3-m^2+m$.

Do đó $m^3-m^2+m=6 ⇔ m=2$. Vậy $m in (0;4)$.
],
"bai-hoc-6": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn C*]
Ta có $integral_0^a (2x-3) dif x = lr([x^2-3x])_0^a = a^2-3a$.

$a^2-3a ≤ 4 ⇔ -1 ≤ a ≤ 4$. Vì $a in NN^*$ nên $a in {1;2;3;4}$.

Vậy có 4 giá trị thỏa mãn.
],
"bai-hoc-7": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn B*]
$I = integral_0^(pi "/" 4) f(x) dif x - 5 integral_0^(pi "/" 4) frac(1,cos^2 x) dif x = a - 5 lr([tan x])_0^(pi "/" 4) = a-5$.
],
"bai-hoc-8": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn B*]
Ta có $integral_0^2 3f(x) dif x = 3(F(2)-F(0)) = 3 dot 5 = 15$.
],
"bai-hoc-9": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]
Ta có $I = 2 integral_0^9 f(x) dif x - 3 integral_9^0 g(x) dif x = 2 dot 7 - 3 dot 1 = 11$.
],
"bai-hoc-10": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn C*]

#math-flow(($integral_1^4 (2f(x)-g(x)+1) dif x$,$= 2 integral_1^4 f(x) dif x - integral_1^4 g(x) dif x + integral_1^4 1 dif x$,$= 2(-2)+6+3$,$=5.$,))
],
"bai-hoc-11": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]

#math-flow(($I$,$= integral_(-1)^2 x dif x + 2 integral_(-1)^2 f(x) dif x - 3 integral_(-1)^2 g(x) dif x$,$= frac(3,2)+2 dot 2-3(-1)$,$=frac(17,2).$,))
],
"bai-hoc-12": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn B*]
$integral_1^2 (2+f(x)) dif x = lr([2x])_1^2 + F(2)-F(1) = 2+8-1=9$.
],
"bai-hoc-13": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn D*]
$integral_0^1 (frac(1,3)f(x)+2x) dif x = frac(1,6) integral_0^1 2f(x) dif x + lr([x^2])_0^1 = frac(1,6) dot 6+1=2$.
],
"bai-hoc-14": [
#set par(spacing:2.5mm)
Đặt $X=integral_2^7 f(x) dif x$, $Y=integral_2^7 g(x) dif x$.

Theo giả thiết, $cases(2X+3Y=1,X-2Y=4) ⇔ cases(X=2,Y=-1)$.

Vậy $integral_2^7 f(x) dif x - 3 integral_7^2 g(x) dif x = X+3Y=2+3(-1)=-1$.
],
"bai-hoc-15": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]
$integral_1^3 f(x) dif x = integral_1^5 f(x) dif x - integral_3^5 f(x) dif x = 10-1=9$.
],
"bai-hoc-16": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn C*]
Theo tính chất cộng khoảng, $integral_(-6)^11 f(x) dif x = P + integral_2^6 f(x) dif x$.

Suy ra $P=8-3=5$.
],
"bai-hoc-17": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn D*]
$integral_(-1)^2 abs(2x+1) dif x = -integral_(-1)^(-1 "/" 2) (2x+1) dif x + integral_(-1 "/" 2)^2 (2x+1) dif x$.

$= -lr([x^2+x])_(-1)^(-1 "/" 2) + lr([x^2+x])_(-1 "/" 2)^2 = frac(1,4)+frac(25,4)=frac(13,2)$.
],
"tu-luyen-1": [
#set par(spacing:2.5mm)
Theo định nghĩa, $integral_a^b f(x) dif x = F(b)-F(a)$. *Chọn A.*
],
"tu-luyen-2": [
#set par(spacing:2.5mm)
Ta có $integral_a^a f(x) dif x = 0$, nên mệnh đề B sai. *Chọn B.*
],
"tu-luyen-3": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]
Áp dụng công thức Newton–Leibniz: $integral_a^b f'(x) dif x = f(b)-f(a)$.
],
"tu-luyen-4": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]
$I = integral_(-1)^0 (2x+3)^2 dif x = lr([frac((2x+3)^3,6)])_(-1)^0 = frac(27-1,6)=frac(13,3)$.
],
"tu-luyen-5": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]
$I = integral_1^e (frac(1,x)-frac(1,x^2)) dif x = lr([ln abs(x)+frac(1,x)])_1^e = 1+frac(1,e)-1=frac(1,e)$.
],
"tu-luyen-6": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]
$I = integral_1^e (frac(1,x)-frac(1,x^2)) dif x = lr([ln abs(x)+frac(1,x)])_1^e = 1+frac(1,e)-1=frac(1,e)$.
],
"tu-luyen-7": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]
$integral_0^(pi "/" 2) (4-sin x) dif x = lr([4x+cos x])_0^(pi "/" 2)=2pi-1$.

Vậy $a=2$, $b=-1$ và $a+b=1$.
],
"tu-luyen-8": [
#set par(spacing:2.5mm)
#block(width:100%,breakable:false,above:2mm,below:2mm)[
$ integral_(pi "/" 4)^(pi "/" 3) frac(1,sin^2 x dot cos^2 x) dif x
  &= integral_(pi "/" 4)^(pi "/" 3) (frac(1,cos^2 x)+frac(1,sin^2 x)) dif x \
  &= lr([tan x-cot x])_(pi "/" 4)^(pi "/" 3)=frac(2sqrt(3),3). $
]
Vậy $P=frac(a-2b,b)=frac(2-2 dot 3,3)=-frac(4,3)$. *Chọn B.*
],
"tu-luyen-9": [
#set par(spacing:2.5mm)
Ta có $integral_0^2 f(x) dif x = F(2)-F(0)$, suy ra $F(2)=3+2=5$.
],
"tu-luyen-10": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn B*]

#math-flow(($I$,$= integral_(-1)^2 x dif x + 2 integral_(-1)^2 f(x) dif x - 3 integral_(-1)^2 g(x) dif x$,$= frac(3,2)+2 dot 3-3(-1)$,$=frac(21,2).$,))
],
"tu-luyen-11": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn D*]
$integral_(-1)^4 (f(x)-g(x)) dif x = integral_(-1)^4 f(x) dif x - integral_(-1)^4 g(x) dif x = 2-3=-1$.
],
"tu-luyen-12": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn C*]
Theo giả thiết, $2 integral_0^(ln 2) f(x) dif x + lr([e^x])_0^(ln 2)=5$.

Suy ra $2 integral_0^(ln 2) f(x) dif x +1=5$, do đó $integral_0^(ln 2) f(x) dif x =2$.
],
"tu-luyen-13": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn C*]
$integral_0^m (3x^2-2x+1) dif x = lr([x^3-x^2+x])_0^m = m^3-m^2+m$.

Do đó $m^3-m^2+m=6 ⇔ m=2 in (0;4)$.
],
"tu-luyen-14": [
#set par(spacing:2.5mm)
#math-flow(($integral_(1 "/" 2)^1 (frac(a,x^2)+frac(b,x)+2) dif x$,$=lr([-frac(a,x)+b ln abs(x)+2x])_(1 "/" 2)^1$,$=a+1+b ln 2.$,))
Vì $a,b in QQ$, đối chiếu giả thiết suy ra $a=1$, $b=-3$, nên $T=a+b=-2$. *Chọn C.*
],
"tu-luyen-15": [
#set par(spacing:2.5mm)
#math-flow(($integral_(pi "/" 4)^(pi "/" 3) (frac(1,cos^2 x)+frac(1,sin^2 x)) dif x$,$=lr([tan x-cot x])_(pi "/" 4)^(pi "/" 3)$,$=frac(2sqrt(3),3).$,))
Vậy $P=frac(a-2b,b)=frac(2-2 dot 3,3)=-frac(4,3)$. *Chọn B.*
],
"tu-luyen-16": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn D*]
Ta có $frac(sin^3 x,1+cos x)=sin x(1-cos x)$.


#math-flow(($I$,$= integral_0^(pi "/" 2) (x-sin x+sin x cos x) dif x$,$= lr([frac(x^2,2)+cos x+frac(sin^2 x,2)])_0^(pi "/" 2)$,$= frac(pi^2,8)-frac(1,2).$,))

Suy ra $a=8$, $b=1$, $c=2$, nên $T=8^2+1^2+2^2=69$.
],
"tu-luyen-17": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn C*]
$integral_0^(pi "/" 2) (2f(x)+sin x) dif x = 2 integral_0^(pi "/" 2) f(x) dif x + integral_0^(pi "/" 2) sin x dif x = 2 dot 4+1=9$.
],
"tu-luyen-18": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn C*]
$integral_0^(ln 3) f(x) dif x = 6-integral_0^(ln 3) e^x dif x = 6-(3-1)=4$.
],
"tu-luyen-19": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn B*]
$I = 10-integral_0^pi sin x dif x = 10-lr([-cos x])_0^pi = 10-2=8$.
],
"tu-luyen-20": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn B*]
$integral_1^3 f(x) dif x = integral_0^3 f(x) dif x - integral_0^1 f(x) dif x = 5-(-1)=6$.
],
"tu-luyen-21": [
#set par(spacing:2.5mm)
$integral_0^2 f(x) dif x = integral_0^5 f(x) dif x - integral_2^5 f(x) dif x =6-8=-2$.
],
"tu-luyen-22": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn B*]
Theo tính chất cộng khoảng, $P = integral_0^10 f(x) dif x - integral_2^6 f(x) dif x =7-3=4$.
],
"tu-luyen-23": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn B*]
Đặt $X=integral_1^3 f(x) dif x$, $Y=integral_1^3 g(x) dif x$.

Từ giả thiết, $cases(X+3Y=10,2X-Y=6) ⇔ cases(X=4,Y=2)$.

Vậy $integral_1^3 (f(x)+g(x)) dif x =X+Y=6$.
],
"tu-luyen-24": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn B*]
$I=integral_0^1 (2-2x) dif x + integral_1^2 (2x-2) dif x = lr([2x-x^2])_0^1+lr([x^2-2x])_1^2=1+1=2$.
],
"tu-luyen-25": [
#set par(spacing:2.5mm)
#block(sticky:true,above:0pt,below:4mm)[*Chọn A*]
$I=integral_0^2 (4x-2x^2) dif x + integral_2^3 (2x^2-4x) dif x$.

$=lr([2x^2-frac(2,3)x^3])_0^2+lr([frac(2,3)x^3-2x^2])_2^3=frac(8,3)+frac(8,3)=frac(16,3)$.
],
"tu-luyen-26": [
#set par(spacing:2.5mm)
$I=integral_0^(pi "/" 3) (3-sin x) dif x=lr([3x+cos x])_0^(pi "/" 3)=pi-frac(1,2)$.

Suy ra $a=1$, $b=1$, $c=2$.
#grid(columns:(1fr,1fr),column-gutter:5mm,row-gutter:3mm,
 [a) *Đúng:* $1+1-2=0$.],
 [b) *Sai:* $1+1<4$.],
 [c) *Sai:* $3≠2+2$.],
 [d) *Đúng:* $2=1+1$.])
],
"tu-luyen-27": [
#set par(spacing:2.5mm)
a) *Sai:* Đổi cận tích phân được $-(-4)=4$, khác $-4$.

b) *Đúng:* $(-3)(-4)=12$. c) *Đúng:* $-4+(-3)=-7$.

d) *Sai:* Ta có $-4m-3n=-51$ và $-3m-4n=20$.

Cộng hai phương trình: $-7(m+n)=-31$, suy ra $m+n=frac(31,7)≠-3$.
],
"tu-luyen-28": [
#set par(spacing:2.5mm)
a) *Sai:* Trên $[0;2]$, $abs(x^2-2x)=2x-x^2$; trên $(2;3]$, $abs(x^2-2x)=x^2-2x$.

b) *Đúng:* Áp dụng tính chất cộng khoảng tại $x=2$.

c) *Sai:* Trên $[0;2]$, $x^2-2x≤0$, nên tích phân thứ nhất phải đổi dấu.

d) *Đúng:* Tách tích phân tại $x=2$ và đổi dấu trên $[0;2]$, ta được
$I=lr([-frac(x^3,3)+x^2])_0^2+lr([frac(x^3,3)-x^2])_2^3$.
],
)
