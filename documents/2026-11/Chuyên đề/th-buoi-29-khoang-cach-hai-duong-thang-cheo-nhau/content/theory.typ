#import "/templates/lesson.typ": lesson-section,theory-box
#import "figures.typ": figure
#let theory()=[
#lesson-section([PHƯƠNG PHÁP],badge:"LT")
#theory-box[
*1. Đoạn vuông góc chung*

- Cho 2 đường thẳng chéo nhau $a$ và $b$. Ta có:

$cases(display(A ∈ a), display(B ∈ b), display(A B ⊥ a), display(A B ⊥ b))$ $⇒ A B$ là đoạn vuông góc chung của 2 đường thẳng $a$ và $b$.

$⇒ d lr(( a ";" b )) = A B$

#figure("image6.svg")
]
#theory-box[
*2. Phương pháp xác định khoảng cách hai đường thẳng chéo nhau $a$ và $b$*

*Trường hợp 1. Hai đường thẳng chéo nhau vuông góc với nhau*

$⇒$ “Xác định 1 mặt phẳng chứa đường thẳng này và vuông góc với đường thẳng kia”

- Xác định mặt phẳng $lr(( α ))$ chứa $b ","$ sao cho $lr(( α )) ⊥ a$

- Tìm $a ∩ lr(( α )) = A$

- Trong mặt phẳng $lr(( α ))$, kẻ $A B ⊥ b lr(( B ∈ b ))$

#figure("image14.svg")

$⇒$ $A B$ là đoạn vuông góc chung của $a$ và $b$

$⇒ d lr(( a ";" b )) = A B$
]
#theory-box[
*Trường hợp 2. Hai đường thẳng chéo nhau không vuông góc với nhau*

$⇒$ “Xác định 1 mặt phẳng chứa đường thẳng này và song song đường thẳng kia”

- Xác định mặt phẳng $lr(( α ))$ chứa $b ","$ sao cho $lr(( α )) ∥ a$

#figure("image24.svg")

- $d lr(( a ";" b )) = d lr(( a ";" lr(( α )) )) = d lr(( M ";" lr(( α )) ))$

$⇒$ Quy về bài tập tính khoảng cách từ 1 điểm đến 1 mặt phẳng ($M$ là 1 điểm thích hợp $∈ a$)

Kinh nghiệm: Ta hay chọn đường thẳng $b$ là cạnh bên của khối, đường thẳng $a$ là cạnh nằm dưới đáy.
]
]