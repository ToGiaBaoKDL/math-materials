#import "/templates/lesson.typ": lesson-section, theory-box

#import "figures.typ": figure

#let theory()=[

#lesson-section([MÔ HÌNH VÀ PHƯƠNG PHÁP],badge:"LT")

#theory-box[

#set par(leading:0.85em,spacing:2mm)

*Mô hình mẫu*

Cho hình chóp $S . A B C$ có $S A$ vuông góc với mặt phẳng đáy. Dựng khoảng cách từ  điểm $A$ đến mặt phẳng $lr(( S B C ))$.

*Phương pháp*


#figure("image5.svg")


$S A$ là chiều cao của chóp $⇒$ Gọi $A$ là chân đường cao

Dựng $d lr(( A ";" lr(( S B C )) )) →$ “3 nét dựng”

+) Nét 1: Kẻ $A K ⊥ B C lr(( K ∈ B C ))$

Vị trí điểm $K$ phụ thuộc vào tính chất của $Δ A B C$:

$Δ A B C$ cân tại $A ⇒ K$ là trung điểm của $B C$

$Δ A B C$ vuông tại $B ⇒ K ≡ B$

+) Nét 2: Nối $S K$

+) Nét 3: Kẻ $A H ⊥ S K lr(( H ∈ S K ))$

$ ⇒ d lr(( A ";" lr(( S B C )) )) = A H $

Cách tính $A H$

Xét $Δ S A K$ vuông tại $A$: $frac(1, A H ^(2)) = frac(1, S A ^(2)) + frac(1, A K ^(2)) ⇒ A H = frac(S A . A K, sqrt(S A ^(2) + A K ^(2)))$

*Mô hình tứ diện vuông góc*


#figure("image27.svg")


Đỉnh $A$ có ba góc vuông

$ ⇒ frac(1, A H ^(2)) = frac(1, S A ^(2)) + frac(1, A B ^(2)) + frac(1, A C ^(2)) $

*Chứng minh:*

$ cases(display(frac(1, A H ^(2)) = frac(1, S A ^(2)) + frac(1, A K ^(2))), display(frac(1, A K ^(2)) = frac(1, A B ^(2)) + frac(1, A C ^(2)))) ⇒ frac(1, A H ^(2)) = frac(1, S A ^(2)) + frac(1, A B ^(2)) + frac(1, A C ^(2)) $

]

]
