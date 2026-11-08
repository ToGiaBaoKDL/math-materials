#import "figures.typ": figure
#let theory = (
t1: [
Gọi $B$ là phần vật thể giới hạn bởi hai mặt phẳng vuông góc với trục $O x$ tại các điểm $a$ và $b$, $S lr(( x ))$ là diện tích thiết diện của vật thể bị cắt bởi mặt phẳng vuông góc với trục $O x$ tại điểm $x lr(( a ≤ x ≤ b ))$. Giả sử $S lr(( x ))$ là hàm số liên tục trên đoạn $lr([ a ";" b ])$.

#grid(columns:(105mm,1fr),gutter:3mm,align:(center+horizon,left+horizon),
 figure("thiet-dien-vat-the.svg"),
 [Khi đó thể tích của vật thể $B$ được xác định:

 $ V = integral_(a)^(b) S lr(( x )) dif x $],
)

],
t2: [
Thể tích khối tròn xoay được sinh ra khi quay hình phẳng giới hạn bởi các đường $y = f lr(( x ))$, trục hoành

và hai đường thẳng $x = a "," x = b$ quanh trục $O x$ là:

$V _(O x) = π integral_(a)^(b) f ^(2) ( x ) dif x$

#figure("khoi-tron-xoay.svg")

],
t3: [
Thể tích khối tròn xoay được sinh ra khi quay hình phẳng

giới hạn bởi các đường $y = f lr(( x )) "," y = g lr(( x ))$ (cùng nằm một phía so với $O x$) và hai đường thẳng $x = a "," x = b$ quanh trục $O x$.

#figure("hai-do-thi.svg")

$V = π integral_(a)^(b) abs(f ^(2) lr(( x )) - g ^(2) lr(( x ))) dif x$

],
)