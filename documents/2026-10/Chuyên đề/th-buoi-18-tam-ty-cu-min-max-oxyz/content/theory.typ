#import "/templates/lesson.typ": lesson-section, subheading, formula-rows, theory-box
#import "../figures.typ": diagram
#let theory() = [
#lesson-section([PHƯƠNG PHÁP GIẢI], badge:"1")
#subheading([A. TÂM TỶ CỰ])
*Bài toán 1. Cực trị độ dài tổng – hiệu các vectơ*

Cho $n$ điểm $A_1,A_2,dots.h,A_n$ và các hệ số $k_1,k_2,dots.h,k_n$ sao cho $k=k_1+k_2+dots.h+k_n != 0$. Tìm điểm $M$ trên đường thẳng $d$ hoặc mặt phẳng $(P)$ sao cho
$ abs(k_1 arrow(M A_1)+k_2 arrow(M A_2)+dots.h+k_n arrow(M A_n)) $
nhỏ nhất.

*Hướng giải quyết*

*Bước 1.* Gọi $I$ là điểm thỏa mãn
$ k_1 arrow(I A_1)+k_2 arrow(I A_2)+dots.h+k_n arrow(I A_n)=arrow(0). $
*Bước 2.* Áp dụng quy tắc ba điểm:
#formula-rows((
[$sum_(i=1)^n k_i arrow(M A_i)=sum_(i=1)^n k_i (arrow(M I)+arrow(I A_i))$],
[$=k arrow(M I)+sum_(i=1)^n k_i arrow(I A_i)=k arrow(M I)$],))
#theory-box(title: [Kết luận], breakable: false)[
$abs(sum_(i=1)^n k_i arrow(M A_i))=abs(k) M I$.

Biểu thức nhỏ nhất khi $M I$ nhỏ nhất; tìm điểm $M$ trên $d$ hoặc $(P)$ gần $I$ nhất.
]

*Bài toán 2. Cực trị tổng – hiệu bình phương các đoạn thẳng*

Cho $n$ điểm $A_1,A_2,dots.h,A_n$ và các hệ số $k_1,k_2,dots.h,k_n$ có tổng $k>0$. Tìm $M$ trên $d$ hoặc $(P)$ sao cho
$ S=k_1 M A_1^2+k_2 M A_2^2+dots.h+k_n M A_n^2 $
đạt giá trị nhỏ nhất.

*Bước 1.* Xác định $I$ thỏa mãn $sum_(i=1)^n k_i arrow(I A_i)=arrow(0)$.

*Bước 2.* Với mỗi $i$, ta có
#formula-rows(([$M A_i^2=abs(arrow(M I)+arrow(I A_i))^2$],
[$=M I^2+2 arrow(M I) dot arrow(I A_i)+I A_i^2.$],))
Do đó
#formula-rows(([$S=sum_(i=1)^n k_i M A_i^2$],
[$=k M I^2+sum_(i=1)^n k_i I A_i^2+2 arrow(M I) dot sum_(i=1)^n k_i arrow(I A_i)$],
[$=k M I^2+sum_(i=1)^n k_i I A_i^2.$],))
#theory-box(title: [Kết luận], breakable: false)[
*Bước 3.* Vì $k>0$ và $sum_(i=1)^n k_i I A_i^2$ không đổi, $S$ nhỏ nhất khi $M I$ nhỏ nhất.

*Chú ý.* Nếu $k<0$, muốn tổng $S$ đạt giá trị lớn nhất, ta cũng tìm $M$ sao cho $M I$ nhỏ nhất.
]

#theory-box(title: [Công thức tính nhanh tọa độ tâm tỷ cự], breakable: true)[
Cho $I$ thỏa mãn $a_1 arrow(I A_1)+dots.h+a_n arrow(I A_n)=arrow(0)$, với $a_1+dots.h+a_n != 0$. Khi đó:
$ cases(x_I=(sum_(i=1)^n a_i x_(A_i))/(sum_(i=1)^n a_i), y_I=(sum_(i=1)^n a_i y_(A_i))/(sum_(i=1)^n a_i), z_I=(sum_(i=1)^n a_i z_(A_i))/(sum_(i=1)^n a_i)).$
]
*Hệ hai điểm:* $a_1 arrow(I A_1)+a_2 arrow(I A_2)=arrow(0)$.
$ cases(x_I=(a_1 x_(A_1)+a_2 x_(A_2))/(a_1+a_2),y_I=(a_1 y_(A_1)+a_2 y_(A_2))/(a_1+a_2),z_I=(a_1 z_(A_1)+a_2 z_(A_2))/(a_1+a_2)). $
*Hệ ba điểm:* $a_1 arrow(I A_1)+a_2 arrow(I A_2)+a_3 arrow(I A_3)=arrow(0)$.
$ cases(x_I=(a_1 x_(A_1)+a_2 x_(A_2)+a_3 x_(A_3))/(a_1+a_2+a_3),y_I=(a_1 y_(A_1)+a_2 y_(A_2)+a_3 y_(A_3))/(a_1+a_2+a_3),z_I=(a_1 z_(A_1)+a_2 z_(A_2)+a_3 z_(A_3))/(a_1+a_2+a_3)). $

#subheading([B. PHƯƠNG PHÁP QUY ĐỔI ĐỐI XỨNG])
Cho mặt phẳng $(P)$ và hai điểm phân biệt $A,B$. Tìm $M in (P)$ sao cho $M A+M B$ nhỏ nhất hoặc $abs(M A-M B)$ lớn nhất.

#block(width:100%, breakable:true)[
*1. Tổng khoảng cách nhỏ nhất*

*Trường hợp 1:* $A,B$ nằm khác phía đối với $(P)$. Khi đó
$A M+B M>=A B.$
Đẳng thức xảy ra khi $M=A B ∩ (P)$.
#v(1mm)
#align(center,scale(x:90%,y:90%,reflow:true,box(width:96mm,height:66mm,move(dy:-6mm,diagram("opposite")))))
#v(2mm)
*Trường hợp 2:* $A,B$ nằm cùng phía đối với $(P)$. Lấy $A'$ đối xứng với $A$ qua $(P)$. Khi đó
$A M+B M=A'M+B M>=A'B.$
Đẳng thức xảy ra khi $M=A'B ∩ (P)$.
#v(1mm)
#align(center,scale(x:90%,y:90%,reflow:true,diagram("same")))
]
#v(2mm)
*2. Giá trị lớn nhất của hiệu khoảng cách*

*Trường hợp 1:* $A,B$ nằm cùng phía đối với $(P)$. Ta có $abs(A M-B M)<=A B$. Dấu bằng xảy ra khi $M$ là giao điểm của đường thẳng $A B$ với $(P)$ và nằm ngoài đoạn $A B$ (nếu đường thẳng có giao điểm với mặt phẳng).

*Trường hợp 2:* $A,B$ nằm khác phía đối với $(P)$. Lấy $A'$ đối xứng với $A$ qua $(P)$. Khi đó $abs(A M-B M)=abs(A'M-B M)<=A'B$. Dấu bằng xảy ra khi $M$ là giao điểm của đường thẳng $A'B$ với $(P)$ và nằm ngoài đoạn $A'B$ (nếu đường thẳng có giao điểm với mặt phẳng).
]
