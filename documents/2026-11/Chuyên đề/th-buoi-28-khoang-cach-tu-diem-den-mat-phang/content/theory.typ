#import "/templates/lesson.typ": lesson-section, theory-box

#import "figures.typ": figure

#let theory()=[

#lesson-section([PHƯƠNG PHÁP ĐỔI ĐIỂM],badge:"LT")

#theory-box[

*Ý tưởng của phương pháp:*

Để tính khoảng cách từ điểm $B$ đến mặt phẳng $lr(( α ))$ nhưng vì điểm $B$ có quan hệ vuông góc khó dựng được hình chiếu để tìm khoảng cách, ta sẽ đổi từ việc tính khoảng cách từ điểm $B$ sang việc tính khoảng cách từ điểm $A$ đến mặt phẳng $lr(( α ))$. Sau đó liên hệ khoảng cách giữa $A$ và $B$, từ đó suy ra $d lr(( B ";" lr(( α )) ))$

Thông thường chúng ta sẽ đổi điểm về chân đường cao để tính khoảng cách theo bài toán 3 nét dựng, sau đó liên hệ khoảng cách.

Có những bài chúng ta sẽ đổi qua 2 hoặc 3 điểm để đưa về tính khoảng cách từ chân đường cao, đổi làm sao để việc liên hệ khoảng cách về chân đường cao là dễ quy đổi nhất.

*Các trường hợp liên hệ khoảng cách (có 2 trường hợp)*

*+ TH1: Đổi điểm song song:*


#figure("image10.svg")


Đổi $B → A$ ; $B A ∥ lr(( α )) ⇒ d lr(( B ";" lr(( α )) )) = d lr(( A ";" lr(( α )) ))$

*+ TH2: Đổi điểm giao cắt:*


#figure("image14.svg")


Đổi $B → A ";" B A ∩ lr(( α )) = M ⇒ frac(d lr(( B ";" lr(( α )) )), d lr(( A ";" lr(( α )) ))) = frac(B M, A M)$

]

]
