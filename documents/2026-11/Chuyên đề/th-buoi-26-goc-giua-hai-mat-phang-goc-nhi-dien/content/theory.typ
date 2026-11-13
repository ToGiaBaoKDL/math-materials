#import "figures.typ": figure
#let theory=[
#set par(leading:0.9em,spacing:2mm)
*Phương pháp xác định góc giữa 2 mặt phẳng:*

Xác định góc giữa 2 mặt phẳng $lr(( P ))$ và $lr(( Q ))$:

Bước 1: Tìm giao tuyến chung của $lr(( P ))$ và $lr(( Q ))$: $Δ = lr(( P )) ∩ lr(( Q ))$

Bước 2: Xác định trên hình vẽ, 1 mặt phẳng $lr(( R ))$ sao cho $lr(( R )) ⊥ Δ$

$⇒$ Cần tìm 2 đường thẳng vuông góc với $Δ$ (thông thường ta lấy đường cao là đường thứ nhất)

Bước 3: $cases(display(lr(( R )) ∩ lr(( P )) = d _(1)), display(lr(( R )) ∩ lr(( Q )) = d _(2))) ⇒ ∠ lr(( P ";" Q )) = ∠ lr(( d _(1) ";" d _(2) ))$

*Quan hệ vuông góc cần nhớ:*

+) Đường thẳng vuông góc với mặt phẳng thì nó vuông góc với tất cả các đường nằm trong mặt phẳng đó.

+) Đường thẳng vuông góc với mặt phẳng nếu nó vuông góc với 2 đường cắt nhau trong mặt phẳng.

+) Hai mặt phẳng cắt nhau và cùng vuông góc với mặt phẳng thứ ba thì giao tuyến của chúng vuông góc với mặt phẳng thứ ba.

#block(sticky:true,above:3mm,below:2mm)[*Phương pháp xác định số đo góc nhị diện:*]


#figure("image9.svg")


Ta xác định số đo góc nhị diện tạo bởi hai mặt phẳng $lr(( P ))$ và $lr(( Q ))$ theo 3 bước:

- Bước 1: Tìm giao tuyến $a = lr(( P )) ∩ lr(( Q ))$.

- Bước 2: Tìm $x ⊂ lr(( P )) : x ⊥ a$ và $y ⊂ lr(( Q )) : y ⊥ a$.

- Bước 3: Kết luận số đo góc nhị diện $lr([ P "," a "," Q ])$ là góc $x O y$
]
