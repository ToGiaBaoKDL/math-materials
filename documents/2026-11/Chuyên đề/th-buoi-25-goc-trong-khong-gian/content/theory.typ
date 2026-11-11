#import "figures.typ": figure
#let theory=(
t1:[
#set par(leading:1.08em,spacing:3mm)
#show math.equation.where(block:true): set block(above:3mm,below:3mm)
#block(sticky:true,above:0pt,below:3mm)[Phương pháp:]

*Cách 1:* (Dựng góc) Để xác định góc giữa hai đường thẳng chéo nhau $a$ và $b$ ta dùng phương pháp dịch đường song song, nghĩa là ta xác định trên hình vẽ đường thẳng $a ' ∥ a "," b' ∥ b$ và $a' ∩ b' = O$, khi đó $hat(lr(( a "," b ))) = hat(lr(( a ' "," b ' )))$

Việc xác định góc $hat(lr(( a ' "," b ' )))$ ta đưa về trong một tam giác để tính. Chú ý: $0 ° ≤ hat(lr(( a "," b ))) ≤ 90 °$

#figure("dich-duong-song-song.svg",width:80mm)

Để tính góc trong tam giác ta thường sử dụng các hệ thức lượng tam giác vuông hoặc định lý hàm số cos:

Định lý hàm số cosin trong tam giác $A B C$:

$ cos hat(B A C) = frac(A B^2 + A C^2 - B C^2, 2 dot A B dot A C); quad cos hat(A B C) = frac(B A^2 + B C^2 - A C^2, 2 dot B A dot B C); $
$ cos hat(A C B) = frac(C A^2 + C B^2 - A B^2, 2 dot C A dot C B). $


*Cách 2:* Tọa độ hóa đưa về xác định góc giữa 2 vecto chỉ phương của 2 đường thẳng
],
t2:[
#set par(leading:1.08em,spacing:3mm)
#show math.equation.where(block:true): set block(above:3mm,below:3mm)
*Phương pháp:*

+) $d ⊥ lr(( P )) ⇒ ∠ lr(( d ";" lr(( P )) )) = 90 °$

+) $d cancel(⊥) lr(( P )) ⇒ ∠ lr(( d ";" lr(( P )) )) = ∠ lr(( d ";" d ' ))$

Trong đó  $d '$ là hình chiếu vuông góc của $d$ trên $lr(( P ))$

Cách tìm $d '$

#figure("hinh-chieu-duong-thang.svg",width:85mm)

Cần tìm hình chiếu của 2 điểm $∈ d$ trên $lr(( P ))$

$⇒$ Đường thẳng $d '$ là đường thẳng đi qua 2 điểm đó

$ cases(I = d ∩ (P) limits(stretch(arrow.r))^("chiếu vuông góc trên")_((P)) I,
 A ∈ d limits(stretch(arrow.r))^("chiếu vuông góc trên")_((P)) A') $

$ d limits(stretch(arrow.r))^("chiếu vuông góc trên")_((P)) I A' ⇒ d' ≡ I A', $
$ angle(d; (P)) = angle(d; d') = angle A I A'. $


#block(sticky:true,above:0pt,below:3mm)[*Quan hệ vuông góc cần nhớ:*]

+) Đường thẳng vuông góc với mặt phẳng thì nó vuông góc với tất cả các đường nằm trong mặt phẳng đó.

+) Đường thẳng vuông góc với mặt phẳng nếu nó vuông góc với 2 đường cắt nhau trong mặt phẳng.
],
)
