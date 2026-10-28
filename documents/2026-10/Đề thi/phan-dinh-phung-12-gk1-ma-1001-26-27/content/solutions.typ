#import "/templates/exam-lesson.typ": exam-section
#let sol(n,answer,body)=block(width:100%,above:4mm,below:0pt)[
 #block(sticky:true)[#text(fill:rgb("#B00012"),weight:"bold")[Câu #n.] #strong(answer)]
 #body
]
#let solutions()=[
#set par(leading:0.92em,spacing:3mm)
#exam-section("I",[LỜI GIẢI PHẦN I])
#sol(1,[Chọn D.],[Từ đồ thị trên $[-1;5]$, ta có $f(-1)=-2$, $f(0)=1$, $f(2)=-2$, $f(4)=3$, $f(5)=1$.

Suy ra $M=3$ tại $x=4$ và $m=-2$ tại $x=-1$, $x=2$. Vậy $M-m=3-(-2)=5$.])
#sol(2,[Chọn D.],[Từ bảng biến thiên: $f(-sqrt(3))=0$, $f(-1)=2$, $f(1)=-2$, $f(sqrt(5))=2sqrt(5)$. Suy ra $max_([-sqrt(3);sqrt(5)]) y=2sqrt(5)$ và $min_([-sqrt(3);sqrt(5)]) y=-2$.])
#sol(3,[Chọn A.],[Hàm số đồng biến trên $(-infinity;0)$ và $(2;+infinity)$. Vì $(-infinity;-1) subset (-infinity;0)$ nên hàm số đồng biến trên $(-infinity;-1)$.])
#sol(4,[Chọn B.],[Đồ thị đi qua điểm $(-1;2)$. Thay $x=-1$ vào các phương án A, B, C, D được giá trị $y$ lần lượt là $3;2;5;4$. Chỉ có $y=-x^3+1$ thỏa mãn.])
#sol(5,[Chọn C.],[$lim_(x arrow.r +infinity) f(x)=2$ nên đồ thị có tiệm cận ngang $y=2$.

$lim_(x arrow.r 1^+) f(x)=+infinity$ nên đồ thị có tiệm cận đứng $x=1$.])
#sol(6,[Chọn A.],[Vận tốc $v(t)=s'(t)=-3sin t$. Tại $t=1$: $v(1)=-3sin 1 approx -2,52$ (m/s).])
#sol(7,[Chọn B.],[Khi $x arrow.r +infinity$ thì $y arrow.r -infinity$ nên $a<0$.

Hoặc: hàm số có hai điểm cực trị nên $y'=3a x^2+3=0$ có hai nghiệm phân biệt, suy ra $a<0$.

Đồ thị cắt trục tung tại $(0;d)$ nằm dưới trục hoành nên $d<0$.])
#sol(8,[Chọn A.],[$f'(x)=3x^2-3=0 equiv x=plus.minus 1 in [-2;2]$.

$f(-2)=-2$, $f(-1)=2$, $f(1)=-2$, $f(2)=2$. Suy ra giá trị lớn nhất bằng 2, giá trị nhỏ nhất bằng $-2$. Tích bằng $2 dot (-2)=-4$.])
#sol(9,[Chọn C.],[Tập xác định $D=RR without {-1}$. Tại $x=-1$, tử số bằng $1+3+2=6 != 0$ nên $lim_(x arrow.r -1^+) y=+infinity$; đồ thị có tiệm cận đứng $x=-1$.

Ta có $y=x-4+6/(x+1)$ nên đồ thị có tiệm cận xiên $y=x-4$, không có tiệm cận ngang. Vậy có 2 đường tiệm cận.])
#sol(10,[Chọn A.],[$lim_(x arrow.r -1^+) (2x-1)/(x+1)=-infinity$ nên tiệm cận đứng là $x=-1$.])
#sol(11,[Chọn B.],[Đồ thị có tiệm cận đứng $x=1$ nên loại C và D; có tiệm cận ngang $y=1$ nên loại A vì $y=(-x-1)/(x-1)$ có tiệm cận ngang $y=-1$.])
#sol(12,[Chọn A.],[$f'(x)$ đổi dấu từ dương sang âm khi qua $x=0$ nên điểm cực đại của hàm số là $x=0$.])
#exam-section("II",[LỜI GIẢI PHẦN II])
#sol(1,[a) Đúng; b) Sai; c) Đúng; d) Đúng.],[
*a)* Hàm số đạt cực đại tại $x=-2$, cực tiểu tại $x=1$ nên đồ thị có hai điểm cực trị $(-2;20)$ và $(1;-7)$.

*b)* Vì $lim_(x arrow.r +infinity) f(x)=+infinity$ nên hàm số không có giá trị lớn nhất trên $RR$.

*c)* Từ bảng biến thiên, $f'(4)>0$ vì $4 in (1;+infinity)$ và $f(-2)=20>0$. Suy ra $f(-2) dot f'(4)>0$; $x=4$ là một nghiệm thuộc $(3;+infinity)$.

*d)* $f(x)+7=0 equiv f(x)=-7$. Phương trình có đúng hai nghiệm: $x_1<-2$ và $x_2=1$. Do đó $x_1+x_2<-2+1=-1$.
])
#sol(2,[a) Đúng; b) Đúng; c) Sai; d) Đúng.],[
*a)* $D=RR without {-1}$, $y'=3/(x+1)^2>0$, $forall x != -1$. Hàm số đồng biến trên mỗi khoảng $(-infinity;-1)$ và $(-1;+infinity)$.

*b)* $lim_(x arrow.r -1^+) y=-infinity$ nên có tiệm cận đứng $x=-1$; $lim_(x arrow.r plus.minus infinity) y=1$ nên có tiệm cận ngang $y=1$.

*c)* Với $x=0$ thì $y=-2$, đồ thị cắt trục tung tại $(0;-2)$.

*d)* Hàm số đồng biến trên $[0;3]$ nên $min_([0;3]) y=y(0)=-2$, $max_([0;3]) y=y(3)=1/4$. Tổng bằng $-2+1/4=-7/4$.
])
#sol(3,[a) Đúng; b) Sai; c) Đúng; d) Sai.],[
*a)* Với $x=0$ thì $y=2/(-1)=-2$.

*b)* $y'=(x^2-2x)/(x-1)^2=0 equiv x=0$ hoặc $x=2$. Đạo hàm đổi dấu từ dương sang âm qua $x=0$ nên hàm số đạt cực đại tại $x=0$.

*c)* $y=x-1+1/(x-1)$. Ta có $lim_(x arrow.r 1^+) y=+infinity$ và $lim_(x arrow.r plus.minus infinity) [y-(x-1)]=0$, nên có tiệm cận đứng $x=1$, tiệm cận xiên $y=x-1$.

*d)* Tiệm cận xiên là $x-y-1=0$. Khoảng cách từ $O$ đến đường thẳng này bằng $abs(0-0-1)/sqrt(1^2+(-1)^2)=sqrt(2)/2 != 1$.
])
#sol(4,[a) Đúng; b) Sai; c) Đúng; d) Sai.],[
*a)* $C(35)=10+3,55 dot 35-0,00025 dot 35^2=133,94375 approx 133,94$ (triệu đồng).

*b)* Số tiền bên $B$ phải thanh toán là
$ 35 dot P(35)=35 dot (6-0,000075 dot 35^2)=206,784375 approx 206,78 $
(triệu đồng).

*c)* Doanh thu: $40 dot P(40)=40 dot (6-0,12)=235,2$ (triệu đồng).

Chi phí: $C(40)=10+142-0,4=151,6$ (triệu đồng). Lợi nhuận: $235,2-151,6=83,6<85$ (triệu đồng).

*d)* Lợi nhuận mỗi tháng:
$ L(x)=x P(x)-C(x)=-0,000075x^3+0,00025x^2+2,45x-10, $
với $x in NN$, $0<x<=130$.
$ L'(x)=-0,000225x^2+0,0005x+2,45=0 equiv 9x^2-20x-98000=0. $
Nghiệm dương là $x_0=(10+sqrt(882100))/9 approx 105,47$; nghiệm âm bị loại.

$L'(x)>0$ trên $(0;x_0)$ và $L'(x)<0$ trên $(x_0;130)$. Vì $105<x_0<106$ và $x$ là số tự nhiên, so sánh $L(105)=163,184375$ và $L(106)=163,1828$.

Lợi nhuận lớn nhất khi $a=105$, suy ra $6a=630<632$.
])
#exam-section("III",[LỜI GIẢI PHẦN III])
#sol(1,[Đáp án: 0,56.],[Bán kính nửa đường tròn là $x/2$, độ dài nửa đường tròn là $(pi x)/2$.

Chiều dài dây: $x+2y+(pi x)/2=2 arrow.r y=1-((pi+2)x)/4$.

Điều kiện: $x>0$, $y>0 equiv 0<x<4/(pi+2)$.
$ A=x y+1/2 pi (x/2)^2=x-((pi+2)x^2)/4+(pi x^2)/8=x-((4+pi)x^2)/8. $
Đây là tam thức bậc hai có hệ số của $x^2$ âm nên đạt giá trị lớn nhất tại $x=4/(4+pi) in (0;4/(pi+2))$. Vậy $x approx 0,56$ m.])
#sol(2,[Đáp án: 18,4.],[$T'(t)=-0,024t^2-0,16<0$, $forall t in [0;10]$, nên $T$ nghịch biến trên $[0;10]$.

Nhiệt độ thấp nhất là $T(10)=-0,008 dot 1000-0,16 dot 10+28=18,4$ (°C).])
#sol(3,[Đáp án: 1.],[Tiệm cận đứng $x=-d=2 arrow.r d=-2$; tiệm cận ngang $y=a=-1$.

Đồ thị qua $M(1;-3)$ nên $(-1+b)/(1-2)=-3 equiv b-1=3 equiv b=4$.

Vậy $S=a+b+d=-1+4-2=1$.])
#sol(4,[Đáp án: 2.],[$y=(2x^2-x+4)/(x-1)=2x+1+5/(x-1)$.

Vì $lim_(x arrow.r plus.minus infinity)[y-(2x+1)]=0$ nên tiệm cận xiên là $y=2x+1$. Suy ra $m=2$, $n=1$ và $m dot n=2$.])
#sol(5,[Đáp án: 12,9.],[$v(t)=h'(t)=32,5-9,8t$. Vậy $v(2)=32,5-19,6=12,9$ (m/s).])
#sol(6,[Đáp án: 1,36.],[Gọi chiều dài, chiều rộng đáy và chiều cao bể lần lượt là $a,b,h$ (m), với $a,b,h>0$.

Ta có $a=1,6h$ và $a b h=2 arrow.r 1,6h^2 b=2 arrow.r b=1,25/h^2$.

Vách kính chắn ngang bể có kích thước $b times h$. Diện tích kính xung quanh, kể cả vách, là $2a h+3b h=3,2h^2+3,75/h$; diện tích đáy là $a b=2/h$.

Chi phí mua kính:
$ F(h)=170000(3,2h^2+3,75/h)+260000 dot 2/h=544000h^2+1157500/h, $
với $h>0$.
$ F'(h)=1088000h-1157500/h^2=0 equiv h^3=1157500/1088000. $
Đạo hàm đổi dấu từ âm sang dương qua nghiệm này nên chi phí nhỏ nhất khi $h^3=1157500/1088000$.

Khi đó $m/n=a/b=(1,6h)/(1,25/h^2)=1,28h^3=1,28 dot 1157500/1088000 approx 1,36$.
])
]
