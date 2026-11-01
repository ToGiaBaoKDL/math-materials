#import "../layout.typ": math-flow, solution-part
#let solutions=(
 "bai-hoc-1": [
a) Ta có $integral x ^(2) dif x = frac(x ^(3), 3) + C$

b) Ta có 
#math-flow(($integral f lr(( x )) dif x$,$= integral lr(( x ^(4) + x ^(- 3) )) dif x$,$= frac(1, 5) x ^(5) - frac(1, 2) x ^(- 2) + C$,))


c) Ta có $integral lr(( x ^(2) + frac(3, x) )) dif x = frac(x ^(3), 3) + 3 ln abs(x) + C$

d) Ta có $integral lr(( frac(1, x) - frac(1, x ^(2)) )) dif x = ln abs(x) + frac(1, x) + C$

e) Ta có 
#math-flow(($integral lr(( x ^(2) + frac(3, x) - 2 sqrt(x) )) dif x$,$= frac(x ^(3), 3) + 3 ln abs(x) - frac(4, 3) sqrt(x ^(3)) + C$,))


f) Ta có 
#math-flow(($integral lr(( 3 sqrt(x) + frac(1, root(3, x)) )) dif x$,$= integral lr(( 3 x ^(frac(1, 2)) + x ^(- frac(1, 3)) )) dif x$,$= frac(6, 3) x ^(frac(3, 2)) + frac(3, 2) x ^(frac(2, 3)) + C$,$= 2 x ^(frac(3, 2)) + frac(3, 2) x ^(frac(2, 3)) + C$,))


 ],
 "bai-hoc-2": [
a) Ta có 
#math-flow(($integral 2 x lr(( 1 + 3 x ^(3) )) dif x$,$= integral lr(( 2 x + 6 x ^(4) )) dif x$,$= x ^(2) lr(( 1 + frac(6 x ^(3), 5) )) + C$,))


b) Ta có 
#math-flow(($integral lr(( 3 x - 2 )) ^(2) dif x$,$= integral lr(( 9 x ^(2) - 12 x + 4 )) dif x$,$= 3 x ^(3) - 6 x ^(2) + 4 x + C$,))


c) Ta có 
#math-flow(($f lr(( x ))$,$= frac(2 x ^(4) + 3, x ^(2))$,$= 2 x ^(2) + 3 x ^(- 2)$,$⇒ integral f lr(( x )) dif x$,$= integral lr(( 2 x ^(2) + 3 x ^(- 2) )) dif x$,$= frac(2 x ^(3), 3) - frac(3, x) + C$,))


 ],
 "bai-hoc-3": [
Ta có 
#math-flow(($F lr(( x ))$,$= integral frac(1 + 2 x ^(2), x) dif x$,$= integral lr(( frac(1, x) + 2 x )) dif x$,$= ln abs(x) + x ^(2) + C .$,))

Mà $F lr(( - 1 )) = 3 ⇔ ln abs(- 1) + ( - 1 ) ^(2) + C = 3 ⇔ C = 2$ nên $F lr(( x )) = ln abs(x) + x ^(2) + 2$.

 ],
 "bai-hoc-4": [
Ta có: $integral f' lr(( x )) dif x = integral lr(( 6 x ^(2) - 2 )) dif x = 2 x ^(3) - 2 x + C$.

Suy ra $f lr(( x )) = 2 x ^(3) - 2 x + C$.

Theo bài ra ta có $f lr(( 0 )) = 1 ⇒ C = 1 ⇒ f lr(( x )) = 2 x ^(3) - 2 x + 1$.

Khi đó: 
#math-flow(($F lr(( x ))$,$= integral f lr(( x )) dif x$,$= integral lr(( 2 x ^(3) - 2 x + 1 )) dif x$,$= frac(1, 2) x ^(4) - x ^(2) + x + C' .$,))

Mà $F lr(( 2 )) = 0 ⇒ 6 + C' = 0 ⇒ C' = - 6$ suy ra $F lr(( x )) = frac(1, 2) x ^(4) - x ^(2) + x - 6 ⇒ F lr(( 4 )) = 110 .$

Vậy $F lr(( 4 )) = 110 .$

 ],
 "bai-hoc-5": [
a) $f lr(( x )) = 1 + sin x$


#math-flow(($integral f lr(( x )) dif x$,$= integral lr(( 1 + sin x )) dif x$,$= integral 1 dif x + integral sin x dif x$,$= x - cos x + C .$,))

b) $f lr(( x )) = 2 sin x + 3 x$


#math-flow(($integral f lr(( x )) dif x$,$= integral lr(( 2 sin x + 3 x )) dif x$,$= - 2 cos x + frac(3, 2) x ^(2) + C$,))


c) $f lr(( x )) = cos ^(2) frac(x, 2)$

Ta có:
#math-flow(($f lr(( x ))$,$= cos ^(2) frac(x, 2)$,$⇒ integral cos ^(2) frac(x, 2) dif x$,$= integral frac(1 + cos x, 2) dif x$,$= frac(1, 2) integral lr(( 1 + cos x )) dif x$,$= frac(1, 2) lr(( x + sin x )) + C$,))


d) $f lr(( x )) = 1 - frac(1, cos ^(2) x)$

$integral f lr(( x )) dif x = integral lr(( 1 - frac(1, cos ^(2) x) )) dif x = x - tan x + C$.

 ],
 "bai-hoc-6": [
a) $integral lr(( sin frac(x, 2) - cos frac(x, 2) )) ^(2) dif x$


#math-flow(($integral lr(( sin frac(x, 2) - cos frac(x, 2) )) ^(2) dif x$,$= integral lr(( sin ^(2) frac(x, 2) - 2 sin frac(x, 2) cos frac(x, 2) + cos ^(2) frac(x, 2) )) dif x$,$= integral lr(( 1 - sin x )) dif x$,$= x + cos x + C$,))


b) $integral lr(( x + tan ^(2) x )) dif x$


#math-flow(($integral lr(( x + tan ^(2) x )) dif x$,$= integral lr(( x + frac(1, cos ^(2) x) - 1 )) dif x$,$= frac(1, 2) x ^(2) + tan x - x + C .$,))

 ],
 "bai-hoc-7": [

#solution-part("a",($integral 2^x dif x = frac(2^x,ln 2)+C.$,))
#solution-part("b",(
 $integral frac(1,3^x) dif x = integral (frac(1,3))^x dif x$,
 $= frac((frac(1,3))^x,ln frac(1,3))+C = -frac(1,3^x ln 3)+C.$,
))
#solution-part("c",($integral (2 e^x-5^x) dif x=2 e^x-frac(5^x,ln 5)+C.$,))
#solution-part("d",(
 $integral frac(1,e^x) dif x=integral (frac(1,e))^x dif x$,
 $=frac((frac(1,e))^x,ln frac(1,e))+C=-frac(1,e^x)+C.$,
))
#solution-part("e",(
 $integral (2 dot 3^x-frac(1,3) dot 7^x) dif x$,
 $=2 integral 3^x dif x-frac(1,3) integral 7^x dif x$,
 $=frac(2 dot 3^x,ln 3)-frac(7^x,3 ln 7)+C.$,
))
#solution-part("f",(
 $integral (2^(3x) dot 3^(2x)) dif x=integral 8^x dot 9^x dif x$,
 $=integral 72^x dif x=frac(72^x,ln 72)+C.$,
))
#solution-part("g",continuation:$integral frac(2^(x+1)-5^(x-1),10^x) dif x$,(
 $integral frac(2^(x+1)-5^(x-1),10^x) dif x$,
 $=2 integral (frac(1,5))^x dif x-frac(1,5) integral (frac(1,2))^x dif x$,
 $=frac(2 (frac(1,5))^x,ln frac(1,5))-frac((frac(1,2))^x,5 ln frac(1,2))+C$,
 $=-frac(2,5^x ln 5)+frac(1,5 dot 2^x ln 2)+C.$,
))
#solution-part("h",(
 $integral e^x (2017-frac(2018 e^(-x),x^5)) dif x$,
 $=integral (2017 e^x-frac(2018,x^5)) dif x$,
 $=2017 e^x+frac("504,5",x^4)+C.$,
))

 ],
 "bai-hoc-8": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn D*]

Ta có: $F _(1) ' lr(( x )) = x + frac(1, 2 sqrt(x))$; $F' _(2) lr(( x )) = x - frac(1, 2 sqrt(x))$; $F' _(3) lr(( x )) = x + frac(1, sqrt(x))$; $F _(4) ' lr(( x )) = x - frac(1, sqrt(x))$.

Suy ra: $F _(4) ' lr(( x )) = x - frac(1, sqrt(x)) = f lr(( x ))$.

Vậy $F _(4) lr(( x )) = frac(x ^(2), 2) - 2 sqrt(x)$ là một nguyên hàm của $f lr(( x )) = x - frac(1, sqrt(x))$ trên $lr(( 0 ";" + infinity ))$.

 ],
 "bai-hoc-9": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Ta có: $F _(1) ' lr(( x )) = 3 + frac(2, x ^(3))$; $F' _(2) lr(( x )) = 3 + frac(1, x)$; $F' _(3) lr(( x )) = 3 - frac(2, x ^(3))$; $F _(4) ' lr(( x )) = 3 - frac(1, x)$.

Suy ra: $F _(2) ' lr(( x )) = 3 + frac(1, x) = f lr(( x ))$.

Vậy $F _(2) lr(( x )) = 3 x + ln x$ là một nguyên hàm của $f lr(( x )) = 3 + frac(1, x)$ trên $lr(( 0 ";" + infinity ))$.

 ],
 "bai-hoc-10": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Ta có 
#math-flow(($integral f lr(( x )) dif x$,$= integral lr(( 2 x + 4 )) dif x$,$= 2 integral x dif x + 4 integral dif x$,$= x ^(2) + 4 x + C .$,))

 ],
 "bai-hoc-11": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn A*]

Ta có 
#block(width:100%,breakable:false,above:2mm,below:2mm)[
  $ F(x) &= integral (5x^4 - 8x^3 - 6x) dif x \
  &= x^5 - 2x^4 - 3x^2 + C. $
]

Vậy một nguyên hàm của hàm số $f lr(( x ))$ là $F lr(( x )) = x ^(5) - 2 x ^(4) - 3 x ^(2) + C$.

 ],
 "bai-hoc-12": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Ta có $integral cos x dif x = sin x + C$, nên khẳng định B sai. Các khẳng định A, C, D đều đúng.

 ],
 "bai-hoc-13": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn A*]

Ta có $integral f lr(( x )) dif x = integral lr(( 3 x ^(2) + sin x )) dif x = x ^(3) - cos x + C$.

 ],
 "bai-hoc-14": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn D*]

Ta có 
#math-flow(($f lr(( x ))$,$= integral f' lr(( x )) dif x$,$= integral lr(( 3 - 5 cos x )) dif x$,$= 3 x - 5 sin x + C .$,))

Ta lại có:$f lr(( 0 )) = 5 ⇒ 3 ⋅ 0 - 5 sin 0 + C = 5 ⇔ C = 5$.

Vậy $f lr(( x )) = 3 x - 5 sin x + 5$.

 ],
 "bai-hoc-15": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Ta có 
#block(width:100%,breakable:false,above:2mm,below:2mm)[
  $ integral f(x) dif x &= integral 2 cos^2 frac(x,2) dif x = integral (1 + cos x) dif x \
  &= integral dif x + integral cos x dif x = x + sin x + C. $
]

 ],
 "bai-hoc-16": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn D*]

Ta có 
#math-flow(($integral f lr(( x )) dif x$,$= integral tan ^(2) x dif x + integral cot ^(2) x dif x$,$= integral lr(( 1 + tan ^(2) x - 1 )) dif x + integral lr(( 1 + cot ^(2) x - 1 )) dif x$,))



#math-flow(($= integral lr(( frac(1, cos ^(2) x) - 1 )) dif x + integral lr(( frac(1, sin ^(2) x) - 1 )) dif x$,$= integral frac(1, cos ^(2) x) dif x + integral frac(1, sin ^(2) x) dif x - 2 integral dif x$,))


$= tan x - cot x - 2 x + C$.

 ],
 "bai-hoc-17": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Ta có 
#math-flow(($integral f lr(( x )) dif x$,$= integral lr(( 3 ^(x) + 2 x )) dif x$,$= frac(3 ^(x), ln 3) + x ^(2) + C .$,))

 ],
 "bai-hoc-18": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn D*]

Hàm số $F lr(( x ))$ là một nguyên hàm của hàm số $f lr(( x )) ⇔ F ' lr(( x )) = f lr(( x ))$.

Suy ra hàm số cần tìm là $f lr(( x )) = lr(( frac(x ^(3), 3) + e ^(x) )) ' = x ^(2) + e ^(x)$.

 ],
 "bai-hoc-19": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn C*]

Ta có 
#math-flow(($f' lr(( x ))$,$= e ^(x) + 2 x + 1 "," ∀ x ∈ RR$,$⇒ f lr(( x ))$,$= integral lr(( e ^(x) + 2 x + 1 )) dif x$,$= e ^(x) + x ^(2) + x + C$,))


Vì $f lr(( 0 )) = 1 ⇔ e ^(0) + 0 + C = 1 ⇔ C = 0$ nên $f lr(( x )) = e ^(x) + x ^(2) + x$

Vì $F lr(( x ))$ là nguyên hàm của $f lr(( x ))$ nên 
#math-flow(($F lr(( x ))$,$= integral lr(( e ^(x) + x ^(2) + x )) dif x$,$= e ^(x) + frac(1, 3) x ^(3) + frac(1, 2) x ^(2) + C$,))


Lại có $F lr(( 1 )) = e ⇔ C = - frac(5, 6)$ suy ra $F lr(( x )) = e ^(x) + frac(x ^(3), 3) + frac(x ^(2), 2) - frac(5, 6)$

Khi đó $F lr(( 0 )) = e ^(0) - frac(5, 6) = 1 - frac(5, 6) = frac(1, 6)$.

 ],
 "bai-hoc-20": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn A*]

Vì $F ( x )$ là một nguyên hàm của hàm số $f ( x )$ nên $F ' ( x ) = f ( x )$.

Ta có: 
#math-flow(($F ' ( x )$,$= lr([ ( a x ^(2) + b x + c ) e ^(- 2 x) ]) '$,$= ( 2 a x + b ) e ^(- 2 x) - 2 ( a x ^(2) + b x + c ) e ^(- 2 x)$,))


$= - lr([ 2 a x ^(2) - lr(( 2 a - 2 b )) x - b + 2 c ]) e ^(- 2 x)$

Do $F ' ( x ) = f ( x )$ nên 
#math-flow(($cases(display(2 a = 2), display(- 2 a + 2 b = - 8), display(- b + 2 c = 7))$,$⇔ cases(display(a = 1), display(b = - 3), display(c = 2))$,$⇒ a + b + c$,$= 0 .$,))

 ],
 "tu-luyen-1": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn A*]

Ta có: $F _(1) ' lr(( x )) = 3 x ^(2) + 2 x$; $F' _(2) lr(( x )) = x ^(2) + x$; $F' _(3) lr(( x )) = 3 x ^(2) - 2 x$; $F _(4) ' lr(( x )) = 9 x ^(2) + 2 x$.

Suy ra: $F _(1) ' lr(( x )) = 3 x ^(2) + 2 x = f lr(( x ))$.

Vậy $F _(1) lr(( x )) = x ^(3) + x ^(2) - 4$ là một nguyên hàm của $f lr(( x )) = 3 x ^(2) + 2 x$ trên $RR$.

 ],
 "tu-luyen-2": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn D*]

Ta có: $F _(1) ' lr(( x )) = x + frac(1, 2 sqrt(x))$; $F' _(2) lr(( x )) = x - frac(1, 2 sqrt(x))$; $F' _(3) lr(( x )) = x + frac(1, sqrt(x))$; $F _(4) ' lr(( x )) = x - frac(1, sqrt(x))$.

Suy ra: $F _(4) ' lr(( x )) = x - frac(1, sqrt(x)) = f lr(( x ))$.

Vậy $F _(4) lr(( x )) = frac(x ^(2), 2) - 2 sqrt(x)$ là một nguyên hàm của $f lr(( x )) = x - frac(1, sqrt(x))$ trên $lr(( 0 ";" + infinity ))$.

 ],
 "tu-luyen-3": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Ta có: $F _(1) ' lr(( x )) = 3 + frac(2, x ^(3))$; $F' _(2) lr(( x )) = 3 + frac(1, x)$; $F' _(3) lr(( x )) = 3 - frac(2, x ^(3))$; $F _(4) ' lr(( x )) = 3 - frac(1, x)$.

Suy ra: $F _(2) ' lr(( x )) = 3 + frac(1, x) = f lr(( x ))$.

Vậy $F _(2) lr(( x )) = 3 x + ln x$ là một nguyên hàm của $f lr(( x )) = 3 + frac(1, x)$ trên $lr(( 0 ";" + infinity ))$.

 ],
 "tu-luyen-4": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn A*]

Ta có 
#block(width:100%,breakable:false,above:2mm,below:2mm)[
  $ F(x) &= integral (5x^4 - 8x^3 - 6x) dif x \
  &= x^5 - 2x^4 - 3x^2 + C. $
]

Vậy một nguyên hàm của hàm số $f lr(( x ))$ là $F lr(( x )) = x ^(5) - 2 x ^(4) - 3 x ^(2) + C$.

 ],
 "tu-luyen-5": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn C*]

Ta có 
#math-flow(($integral lr(( frac(1, 3) x ^(3) - 2 x ^(2) + x - 2024 )) dif x$,$= frac(1, 3) integral x ^(3) dif x - 2 integral x ^(2) dif x + integral x dif x - 2024 integral dif x$,))



#math-flow(($= frac(1, 3) . frac(x ^(4), 4) - 2 . frac(x ^(3), 3) + frac(x ^(2), 2) - 2024 x + C$,$= frac(1, 12) x ^(4) - frac(2, 3) x ^(3) + frac(1, 2) x ^(2) - 2024 x + C .$,))
#math-flow(($F lr(( 1 ))$,$= - 2024$,$⇔ frac(1, 12) . 1 ^(4) - frac(2, 3) . 1 ^(3) + frac(1, 2) . 1 ^(2) - 2024 . 1 + C$,$= - 2024$,$⇔ C$,$= frac(1, 12) .$,))

Vậy nguyên hàm $F lr(( x ))$ của hàm số $f ( x ) = frac(1, 3) x ^(3) - 2 x ^(2) + x - 2024$ thỏa mãn $F lr(( 1 )) = - 2024$ là $frac(1, 12) x ^(4) - frac(2, 3) x ^(3) + frac(1, 2) x ^(2) - 2024 x + frac(1, 12)$.

 ],
 "tu-luyen-6": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Ta có 
#math-flow(($integral lr(( 2 x - 3 )) ^(2) dif x$,$= integral lr(( 4 x ^(2) - 12 x + 9 )) dif x$,$= 4 integral x ^(2) dif x - 12 integral x dif x + 9 integral dif x$,$= frac(4, 3) x ^(3) - 6 x ^(2) + 9 x + C .$,))


#math-flow(($F lr(( - 1 ))$,$= - 17$,$⇔ frac(4, 3) . lr(( - 1 )) ^(3) - 6 . lr(( - 1 )) ^(2) + 9 . lr(( - 1 )) + C$,$= - 17$,$⇔ C$,$= - frac(2, 3) .$,))

Vậy nguyên hàm $F lr(( x ))$ của hàm số $f lr(( x )) = lr(( 2 x - 3 )) ^(2)$ thỏa mãn $F lr(( - 1 )) = - 17$ là $frac(4, 3) x ^(3) - 6 x ^(2) + 9 x - frac(2, 3)$.

 ],
 "tu-luyen-7": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Ta có $integral lr(( x ^(2) + frac(2, x ^(2)) )) dif x = frac(x ^(3), 3) - frac(2, x) + C$.

 ],
 "tu-luyen-8": [
Ta có: $integral lr((x^2 + frac(3,x) - 2 sqrt(x))) dif x = frac(1,3)x^3 + 3 ln abs(x) - frac(4,3)sqrt(x^3) + C.$ *Chọn B.*

 ],
 "tu-luyen-9": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Ta có: 
#math-flow(($integral lr(( 3 sqrt(x) + x ^(2024) )) dif x$,$= integral lr(( 3 x ^(frac(1, 2)) + x ^(2024) )) dif x$,$= 3 . frac(x ^(frac(3, 2)), frac(3, 2)) + frac(x ^(2025), 2025) + C$,$= 2 sqrt(x ^(3)) + frac(x ^(2025), 2025) + C .$,))

 ],
 "tu-luyen-10": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn D*]

Ta có $F lr(( x ))$ là một nguyên hàm của hàm số $y = x ^(2)$ nên ta có $F' lr(( x )) = x ^(2) "," ∀ x ∈ RR$.

Do đó $F' lr(( 25 )) = 25 ^(2) = 625$.

 ],
 "tu-luyen-11": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn D*]

Áp dụng công thức nguyên hàm cơ bản suy ra $integral f lr(( x )) dif x = frac(1, sqrt(5) + 1) x ^(sqrt(5) + 1) + C$.

 ],
 "tu-luyen-12": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn A*]

Ta có $integral lr(( frac(1, 2 x) + x ^(5) )) dif x = frac(1, 2) ln abs(x) + frac(1, 6) x ^(6) + C$ nên $a = frac(1, 2) "," b = frac(1, 6) ⇒ a ^(2) + b = frac(1, 4) + frac(1, 6) = frac(5, 12)$.

 ],
 "tu-luyen-13": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn D*]

Ta có 
#math-flow(($integral f lr(( x )) dif x$,$= integral lr(( x + 1 )) lr(( x + 2 )) dif x$,$= integral lr(( x ^(2) + 3 x + 2 )) dif x$,$= frac(x ^(3), 3) + frac(3, 2) x ^(2) + 2 x + C .$,))

 ],
 "tu-luyen-14": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Ta có 
#math-flow(($integral f lr(( x )) dif x$,$= integral lr(( 2 x ^(2) + frac(5, x ^(2)) )) dif x$,$= frac(2 x ^(3), 3) - frac(5, x) + C .$,))

 ],
 "tu-luyen-15": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn A*]

Ta có
#math-flow(($f(x)$,$= integral lr((3 sqrt(x) + frac(2,root(3,x)))) dif x$,$= 2 x sqrt(x) + 3 root(3,x^2) + C$,))
Vì $f(1)=1$ nên $2+3+C=1 ⇒ C=-4$.

Vậy $f(x)=2 x sqrt(x)+3 root(3,x^2)-4$.

 ],
 "tu-luyen-16": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn C*]

Ta có: 
#math-flow(($F lr(( x ))$,$= integral lr(( 2 x - 3 )) ^(2) dif x$,$= frac(1, 2) integral lr(( 2 x - 3 )) ^(2) "d" lr(( 2 x - 3 ))$,$= frac(1, 2) ⋅ frac(lr(( 2 x - 3 )) ^(3), 3) + C .$,))

Ta có 
#math-flow(($F lr(( 0 ))$,$= frac(1, 3)$,$⇔ frac(1, 2) . frac(lr(( 0 - 3 )) ^(3), 3) + C$,$= frac(1, 3)$,$⇔ C$,$= frac(29, 6) .$,))

Do đó $F lr(( x )) = frac(1, 2) . frac(lr(( 2 x - 3 )) ^(3), 3) + frac(29, 6)$ nên 
#math-flow(($F lr(( 1 ))$,$= frac(1, 2) . - frac(1, 3) + frac(29, 6)$,$= frac(14, 3) ";" F lr(( 2 ))$,$= frac(1, 2) . frac(1, 3) + frac(29, 6)$,$= 5 .$,))


#math-flow(($⇒ T$,$= log _(2) lr([ 3 F lr(( 1 )) - 2 F lr(( 2 )) ])$,$= log _(2) lr(( 3 . frac(14, 3) - 2 . 5 ))$,$= log _(2) 4$,$= 2 .$,))

 ],
 "tu-luyen-17": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Vì $F(x)$ là một nguyên hàm của $f(x)$ nên $F'(x)=f(x)$.
#math-flow(($3 m x^2 + 2(3m+2)x-4$,$=3x^2+10x-4$,))
Suy ra $cases(3m=3,2(3m+2)=10) ⇔ m=1$.

 ],
 "tu-luyen-18": [
Ta có 
#math-flow(($f lr(( x ))$,$= integral lr(( 3 x ^(2) + 2 x - m + 1 )) dif x$,$= x ^(3) + x ^(2) + lr(( 1 - m )) x + C$,))


Theo đề bài, ta có 
#math-flow(($cases(display(f lr(( 2 )) = 1), display(f lr(( 0 )) = - 5))$,$⇒ cases(display(2 lr(( 1 - m )) + C + 12 = 1), display(C = - 5))$,$⇒ cases(display(m = 4), display(C = - 5))$,))


Vậy $f lr(( x )) = x ^(3) + x ^(2) - 3 x - 5$

 ],
 "tu-luyen-19": [
a) 
#math-flow(($integral f lr(( x )) dif x$,$= integral frac(x ^(2) + 3 x + 2, x) dif x$,$= integral lr(( x + 3 + frac(2, x) )) dif x$,$= frac(1, 2) x ^(2) + 3 x + 2 ln abs(x) + C$,))


b) Ta có 
#math-flow(($integral f lr(( x )) dif x$,$= integral frac(x ^(2) + 3 x + 1, sqrt(x)) dif x$,$= integral lr(( x sqrt(x) + 3 sqrt(x) + frac(1, sqrt(x)) )) dif x$,))



#math-flow(($= integral lr(( x ^(frac(3, 2)) + 3 x ^(frac(1, 2)) + frac(1, sqrt(x)) )) dif x$,$= frac(2, 5) x ^(frac(5, 2)) + 2 x ^(frac(3, 2)) + 2 sqrt(x) + C .$,))

Vậy $integral f lr(( x )) dif x = frac(2, 5) x ^(frac(5, 2)) + 2 x ^(frac(3, 2)) + 2 sqrt(x) + C$.

 ],
 "tu-luyen-20": [
a) Ta có 
#math-flow(($integral lr(( 2 sin x - 3 cos x )) dif x$,$= 2 integral sin x dif x - 3 integral cos x dif x$,$= - 2 cos x - 3 sin x + C .$,))

b) Ta có 
#math-flow(($integral cos ^(2) frac(x, 2) dif x$,$= integral lr(( frac(1 + cos x, 2) )) dif x$,$= frac(1, 2) integral lr(( 1 + cos x )) dif x$,$= frac(1, 2) lr(( x + sin x )) + C .$,))

c) Ta có 
#math-flow(($integral frac(dif x, sin ^(2) x cos ^(2) x)$,$= integral frac(sin ^(2) x + cos ^(2) x, sin ^(2) x cos ^(2) x) dif x$,$= integral frac(dif x, cos ^(2) x) + integral frac(dif x, sin ^(2) x)$,$= tan x - cot x + C .$,))

d) 
#math-flow(($integral lr(( sin x + cos x )) ^(2) dif x$,$= integral lr(( sin ^(2) x + 2 sin x cos x + cos ^(2) x )) dif x$,$= integral lr(( 1 + sin 2 x )) dif x$,$= x - frac(1, 2) cos 2 x + C .$,))

e) Vì $lr(( - cot x )) ' = frac(1, sin ^(2) x)$, với mọi $x$ thuộc $lr(( 0 ";" π ))$ nên $F lr(( x )) = - cot x$ là một nguyên hàm của $frac(1, sin ^(2) x)$ trên $lr(( 0 ";" π ))$ nên $integral frac(1, sin ^(2) x) dif x = - cot x + C$ trên $lr(( 0 ";" π ))$.

f) Ta có $integral 2 sin frac(x, 2) cos frac(x, 2) dif x = integral sin x dif x = - cos x + C$

 ],
 "tu-luyen-21": [
Ta có $f lr(( x )) = integral lr(( 2 - 5 sin x )) dif x = 2 x + 5 cos x + C$.

Mà $f lr(( 0 )) = 10 ⇒ C = 5$ nên $f lr(( x )) = 2 x + 5 cos x + 5$.

 ],
 "tu-luyen-22": [
Ta có: $F' lr(( x )) = - 2 sin 2 x = - 4 sin x cos x$

Vì $F lr(( x )) = cos 2 x$ là một nguyên hàm của hàm số $f lr(( x )) tan x$ nên:


#math-flow(($F' lr(( x ))$,$= f lr(( x )) . tan x$,$⇔ - 4 sin x cos x$,$= f lr(( x )) . tan x$,$⇔ f lr(( x ))$,$= - 4 cos ^(2) x$,))


Suy ra $f' lr(( x )) = 8 sin x cos x$

Vậy 
#math-flow(($integral g lr(( x )) dif x$,$= integral frac(tan x, f' lr(( x ))) dif x$,$= integral frac(tan x, 8 sin x cos x) dif x$,$= integral frac(1, 8 cos ^(2) x) dif x$,$= frac(1, 8) tan x + C$,))


 ],
 "tu-luyen-23": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn D*]

Ta có: $integral f lr(( x )) dif x = integral 2025 ^(x) dif x = frac(2025 ^(x), ln 2025) + C$.

 ],
 "tu-luyen-24": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn C*]

Ta có: $integral f lr(( x )) dif x = integral lr(( 1 + e ^(x) )) dif x = x + e ^(x) + C$.

 ],
 "tu-luyen-25": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn D*]

Ta có: 
#math-flow(($integral f lr(( x )) dif x$,$= integral 5 ^(2 x - 1) dif x$,$= frac(1, 5) integral 25 ^(x) dif x$,$= frac(1, 5) . frac(25 ^(x), ln 25) + C$,$= frac(1, 2 ln 5) . 5 ^(2 x - 1) + C .$,))

 ],
 "tu-luyen-26": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn B*]

Ta có: 
#math-flow(($integral f lr(( x )) dif x$,$= integral 2 ^(x) lr(( 1 + 2 ^(- x) ⋅ sin x )) dif x$,$= integral lr(( 2 ^(x) + sin x )) dif x$,$= frac(2 ^(x), ln 2) - cos x + C$,))


 ],
 "tu-luyen-27": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn C*]

Ta có: $F lr(( x )) = integral ( e ^(x) - 1 ) "dx = e" ^(x) - x + C$.

Vì $F lr(( 0 )) = 2 ⇔ e ^(0) + C = 2 ⇔ C = 1$ nên $F lr(( x )) = "e" ^(x) - x + 1$.

 ],
 "tu-luyen-28": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn A*]

Ta có 
#math-flow(($F lr(( x ))$,$= integral e ^(- x) lr(( 2 + frac(e ^(x), cos ^(2) x) )) dif x$,$= integral lr(( 2 e ^(- x) + frac(1, cos ^(2) x) )) dif x$,$= - 2 e ^(- x) + tan x + C$,$= - frac(2, e ^(x)) + tan x + C .$,))

 ],
 "tu-luyen-29": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn C*]

Ta có 
#math-flow(($f' lr(( x ))$,$= e ^(x) + 2 x + 1 "," ∀ x ∈ RR$,$⇒ f lr(( x ))$,$= integral lr(( e ^(x) + 2 x + 1 )) dif x$,$= e ^(x) + x ^(2) + x + C$,))


Vì $f lr(( 0 )) = 1 ⇔ e ^(0) + 0 + C = 1 ⇔ C = 0$ nên $f lr(( x )) = e ^(x) + x ^(2) + x$

Vì $F lr(( x ))$ là nguyên hàm của $f lr(( x ))$ nên 
#math-flow(($F lr(( x ))$,$= integral lr(( e ^(x) + x ^(2) + x )) dif x$,$= e ^(x) + frac(1, 3) x ^(3) + frac(1, 2) x ^(2) + C$,))


Lại có $F lr(( 1 )) = e ⇔ C = - frac(5, 6)$ suy ra $F lr(( x )) = e ^(x) + frac(x ^(3), 3) + frac(x ^(2), 2) - frac(5, 6)$

Khi đó $F lr(( 0 )) = e ^(0) - frac(5, 6) = 1 - frac(5, 6) = frac(1, 6)$.

 ],
 "tu-luyen-30": [
#block(sticky:true,above:0pt,below:5.5mm)[*Chọn D*]

Ta có: $F(x) = integral (e^x - 1) dif x = e^x - x + C$.

$F(0) = 2 ⇔ 1 + C = 2 ⇔ C = 1$. Vậy $F(x) = e^x - x + 1$.

 ],
 "tu-luyen-31": [
Ta có
#math-flow(($F'(x)$,$= (2 a x + b)e^(2x) + 2(a x^2 + b x + c)e^(2x)$,$= (2 a x^2 + (2a + 2b)x + b + 2c)e^(2x).$,))

So sánh hệ số trong $F'(x) = f(x)$: $2a = 2$, $2a + 2b = 0$, $b + 2c = 0$.

Suy ra $a = 1$, $b = -1$, $c = frac(1,2)$. Vậy $a + b + 2c = 1$.

 ],
 "tu-luyen-32": [
$F(x) = integral (e^x + 2x) dif x = e^x + x^2 + C$.

$F(0) = frac(3,2) ⇔ 1 + C = frac(3,2) ⇔ C = frac(1,2)$, nên $F(x) = e^x + x^2 + frac(1,2)$.

Vậy $F(2) = e^2 + frac(9,2) ≈ "11,9"$.

 ],
)
