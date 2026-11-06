#import "../layout.typ": math-flow
#let fig(name)=align(center,image("../figures/"+name+".svg",width:if sys.inputs.at("variant",default:"de")=="de" {105mm} else {85mm}))

#let theory-one()=[
*Dạng 1: Tính diện tích hình phẳng giới hạn bởi đồ thị hàm số $y=f(x)$ và trục $O x$, 2 biên $x=a$, $x=b$.*

*a)* Cho $(H): cases(y=f(x), y=0 & quad "(trục" O x ")", x=a ";" x=b & quad (a<b))$.

#fig("theory-signed-area")

Hình phẳng $(H)$ là phần gạch chéo trong hình. Khi đó:
$ S_((H))=integral_a^b abs(f(x)) dif x. $

*Chú ý:* Nếu đề bài chưa cho cận $a$, $b$ ta cần giải phương trình hoành độ giao điểm $f(x)=0$ để tìm 2 cận $a$, $b$, với $a$ là nghiệm min, $b$ là nghiệm max của phương trình.

*b)* Để phá bỏ dấu giá trị tuyệt đối ta thường làm như sau:

\- Bước 1: Giải $f(x)=0$ tìm nghiệm $x_1,x_2,...,x_n∈(a;b)$ $(a<x_1<x_2<...<x_n<b)$.

\- Bước 2: Tính

#math-flow(($S$, $=integral_a^(x_1) abs(f(x)) dif x$, $+integral_(x_1)^(x_2) abs(f(x)) dif x$, $+...+integral_(x_n)^b abs(f(x)) dif x.$,))

#math-flow(($=$, $abs(integral_a^(x_1) f(x) dif x)$, $+abs(integral_(x_1)^(x_2) f(x) dif x)$, $+...+abs(integral_(x_n)^b f(x) dif x).$,))

*Chú ý:* Ngoài cách trên, ta có thể dựa vào đồ thị để bỏ dấu giá trị tuyệt đối.
]

#let theory-two()=[
*Dạng 2: Tính diện tích hình phẳng giới hạn bởi đồ thị hàm số $y=f(x)$ và $y=g(x)$.*

#fig("theory-two-curves")

*a)* Cho $(H): cases(y=f(x), y=g(x), x=a ";" x=b & quad (a<b))$ $⇒ S_((H))=integral_a^b abs(f(x)-g(x)) dif x$.

*Chú ý:* Nếu đề bài chưa cho cận $a$, $b$ thì ta phải đi giải phương trình hoành độ giao điểm $f(x)=g(x)$

$⇒$ cận $a$, $b$ (cận $a$ = nghiệm min, cận $b$ = nghiệm max).

*Ví dụ:* Cho $(H): cases(y=f(x), y=g(x))$.

#fig("theory-intersections")

- $f(x)=g(x) ⇔ cases(x=x_1,x=x_2,x=x_3)$ $(x_1<x_2<x_3)$.

- $S_((H))=integral_(x_1)^(x_3) abs(f(x)-g(x)) dif x$.

*b)* Để phá bỏ dấu giá trị tuyệt đối ta thường làm như sau:

#block()[\- Bước 1: Giải $f(x)=g(x)$ tìm nghiệm $x_1,x_2,...,x_n∈(a;b)$ $(a<x_1<x_2<...<x_n<b)$.]

#block(sticky:true)[\- Bước 2: Tính]

#math-flow(($S$, $=integral_a^(x_1) abs(f(x)-g(x)) dif x$, $+integral_(x_1)^(x_2) abs(f(x)-g(x)) dif x$, $+...+integral_(x_n)^b abs(f(x)-g(x)) dif x.$,))

#math-flow(($=$, $abs(integral_a^(x_1)(f(x)-g(x)) dif x)$, $+abs(integral_(x_1)^(x_2)(f(x)-g(x)) dif x)$, $+...+abs(integral_(x_n)^(b)(f(x)-g(x)) dif x).$,))

*Chú ý:* Ngoài cách trên, ta có thể dựa vào đồ thị để bỏ dấu giá trị tuyệt đối.
]
