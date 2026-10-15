#import "/templates/lesson.typ": exercise, lesson-section, subheading, theory-box, paragraph, formula
#import "../figures.typ": normal-plane, orthocenter
#let questions(variant) = {
  let item = exercise.with(variant: variant, keep-solution-start: true, writing-line-gap: 9mm, writing-single-page: true, fill-writing-page: true)
lesson-section([NHẬN DIỆN PHƯƠNG TRÌNH MẶT PHẲNG],number:1)
item(1,[Trong không gian $O x y z$, cho mặt phẳng $lr(( P )) : 2 x - y + 3 z + 1 = 0$. Vectơ nào dưới đây là một vectơ pháp tuyến của $lr(( P ))$?],answers:([$arrow(n _(3)) = lr(( 2 ; 3 ; 1 ))$],[$arrow(n _(1)) = lr(( 2 ; - 1 ; - 3 ))$],[$arrow(n _(4)) = lr(( 2 ; 1 ; 3 ))$],[$arrow(n _(2)) = lr(( 2 ; - 1 ; 3 ))$],),source-id:"bai-hoc-1",writing-lines:3,solution:[
#paragraph[Chọn D]
#paragraph[Mặt phẳng $lr(( P )) : 2 x - y + 3 z + 1 = 0$ có một vectơ pháp tuyến là $arrow(n _(2)) = lr(( 2 ; - 1 ; 3 ))$]
])
item(2,[Trong không gian $O x y z$, cho mặt phẳng $lr(( P )) : 3 x - z + 2 = 0$. Vectơ nào dưới đây là một vectơ pháp tuyến của $lr(( P ))$?],answers:([$arrow(n _(4)) = lr(( - 1 ; 0 ; - 1 ))$],[$arrow(n _(1)) = lr(( 3 ; - 1 ; 2 ))$],[$arrow(n _(3)) = lr(( 3 ; - 1 ; 0 ))$],[$arrow(n _(2)) = lr(( 3 ; 0 ; - 1 ))$],),source-id:"bai-hoc-2",writing-lines:3,solution:[
#paragraph[Vectơ pháp tuyến của $(P)$ là $arrow(n)=(3;0;-1)$. Chọn D.]
])
item(3,[Trong không gian $O x y z$, một vectơ pháp tuyến của mặt phẳng $lr(( P )) : frac(x, - 2) + frac(y, - 1) + frac(z, 3) = 1$?],answers:([$arrow(n) = lr(( 3 ; 6 ; - 2 ))$],[$arrow(n) = lr(( 2 ; - 1 ; 3 ))$],[$arrow(n) = lr(( - 3 ; - 6 ; - 2 ))$],[$arrow(n) = lr(( - 2 ; - 1 ; 3 ))$],),source-id:"bai-hoc-3",writing-lines:3,solution:[
#paragraph[Ta có $lr(( P )) : frac(x, - 2) + frac(y, - 1) + frac(z, 3) = 1$ là phương trình mặt phẳng theo đoạn chắn]
#paragraph[$⇒ lr(( P )) : - frac(1, 2) x - y + frac(1, 3) z - 1 = 0$]
#paragraph[$⇒ arrow(n _(lr(( P )))) = lr(( - frac(1, 2) ; - 1 ; frac(1, 3) ))$]
#paragraph[Chú ý: Nếu $arrow(n) = lr(( A ; B ; C ))$ là một vectơ pháp tuyến của $lr(( P ))$]
#paragraph[$⇒ k dot arrow(n) lr(( k ≠ 0 ))$ cũng là một vectơ pháp tuyến của $lr(( P ))$]
#paragraph[Chọn $arrow(n)=-6(-1/2;-1;1/3)=(3;6;-2)$ là một vectơ pháp tuyến. Chọn A.]
])
item(4,[Trong không gian tọa độ $O x y z$, cho phương trình tổng quát của mặt phẳng$lr(( P )) : 2 x - 6 y - 8 z + 1 = 0$. Một vectơ pháp tuyến của mặt phẳng $lr(( P ))$ có tọa độ là:],answers:([$lr(( - 1 ;   - 3 ;   4 ))$],[$lr(( 1 ;   3 ;   4 ))$],[$lr(( 1 ; - 3 ; - 4 ))$],[$lr(( 1 ; - 3 ;   4 ))$],),source-id:"bai-hoc-4",writing-lines:3,solution:[
#paragraph[Phương trình tổng quát của mặt phẳng $lr(( P )) : 2 x - 6 y - 8 z + 1 = 0$ nên một vectơ pháp tuyến của mặt phẳng $lr(( P ))$ có tọa độ là $lr(( 2 ; - 6 ; - 8 ))$ hay $lr(( 1 ; - 3 ; - 4 ))$.]
])
item(5,[Trong không gian với hệ tọa độ $O x y z$, cho mặt phẳng $lr(( α )) : x + y + z - 6 = 0$. Điểm nào dưới đây không thuộc $lr(( α ))$?],answers:([$Q lr(( 3 ; 3 ; 0 ))$],[$N lr(( 2 ; 2 ; 2 ))$],[$P lr(( 1 ; 2 ; 3 ))$],[$M lr(( 1 ; - 1 ; 1 ))$],),source-id:"bai-hoc-5",writing-lines:3,solution:[
#paragraph[Thay lần lượt từng tọa độ ở các đáp án vào phương trình mặt phẳng $lr(( α ))$:]
#paragraph[Ta có: $1 - 1 + 1 - 6 = - 5 ≠ 0$]
#paragraph[$⇒ M lr(( 1 ; - 1 ; 1 ))$ không thuộc $lr(( α ))$.]
#paragraph[Chọn D.]
])
lesson-section([VIẾT PHƯƠNG TRÌNH MẶT PHẲNG],number:2)
subheading[Loại 1: Biết vectơ pháp tuyến của mặt phẳng]
item(6,[Trong không gian $O x y z$, mặt phẳng $lr(( O x z ))$ có phương trình?],answers:([$x = 0$],[$x + y + z = 0$],[$z = 0$],[$y = 0$],),source-id:"bai-hoc-6",writing-lines:4,solution:[
#paragraph[$cases(display(O y ⊥ lr(( O x z )) ⇒ arrow(n _(lr(( O x z )))) = arrow(j) = lr(( 0 ; 1 ; 0 ))), display(O lr(( 0 ; 0 ; 0 )) ∈ lr(( O x z ))))$]
#paragraph[$⇒$ Phương trình $lr(( O x z )) : 0 lr(( x - 0 )) + 1 lr(( y - 0 )) + 0 lr(( z - 0 )) = 0 ⇔ y = 0$]
#paragraph[Chọn D.]
])
item(7,[Trong không gian $O x y z$, mặt phẳng $lr(( O x y ))$ có phương trình là],answers:([$z = 0$],[$x = 0$],[$y = 0$],[$x + y = 0$],),source-id:"bai-hoc-7",writing-lines:4,solution:[
#paragraph[Chọn A]
#paragraph[Mặt phẳng $lr(( O x y ))$ đi qua gốc tọa độ $O lr(( 0 ; 0 ; 0 ))$, nhận vectơ đơn vị $arrow(k) = lr(( 0 ; 0 ; 1 ))$ là vectơ pháp tuyến]
#paragraph[$⇒$Phương trình tổng quát: $0 dot lr(( x - 0 )) + 0 dot lr(( y - 0 )) + 1 dot lr(( z - 0 )) = 0$$⇒$$lr(( O x y )) : z = 0$.]
])
item(8,[Trong không gian $O x y z$, cho hai điểm $A lr(( 0 ; 1 ; 1 ))$ và điểm $B lr(( 1 ; 2 ; 3 ))$. Viết phương trình mặt phẳng $lr(( P ))$ đi qua $A$ vuông góc với đường thẳng $A B$?],answers:([$x + y + 2 z - 3 = 0$],[$x + y + 2 z - 6 = 0$],[$x + 3 y + 4 z - 7 = 0$],[$x + 3 y + 4 z - 26 = 0$],),source-id:"bai-hoc-8",writing-lines:4,solution:[
#paragraph[$lr(( P )) cases(display(* "qua" A lr(( 0 ; 1 ; 1 ))), display(* lr(( P )) ⊥ A B ⇒ arrow(n _(lr(( P )))) = arrow(A B) = lr(( 1 ; 1 ; 2 ))))$]
#paragraph[$⇒$ Phương trình $lr(( P )) : 1 lr(( x - 0 )) + 1 lr(( y - 1 )) + 2 lr(( z - 1 )) = 0 ⇔ x + y + 2 z - 3 = 0$.]
#paragraph[Chọn A.]
])
item(9,[Trong không gian Oxyz, cho hai điểm $A lr(( 4 ; 0 ; 1 ))$ và $B lr(( - 2 ; 2 ; 3 )) .$Mặt phẳng trung trực của đoạn thẳng AB có phương trình là],answers:([$3 x - y - z = 0 .$],[$3 x + y + z - 6 = 0 .$],[$x + y + 2 z - 6 = 0 .$],[$6 x - 2 y - 2 z - 1 = 0 .$],),source-id:"bai-hoc-9",writing-lines:4,solution:[
#paragraph[Chọn A]
#paragraph[Mặt phẳng trung trực của đoạn thẳng AB có vectơ pháp tuyến là $arrow(A B) = lr(( - 6 ; 2 ; 2 ))$ và đi qua trung điểm $I lr(( 1 ; 1 ; 2 ))$ của đoạn thẳng AB. Do đó, phương trình mặt phẳng đó là:]
#paragraph[$- 6 lr(( x - 1 )) + 2 lr(( y - 1 )) + 2 lr(( z - 2 )) = 0 ⇔ - 6 x + 2 y + 2 z = 0 ⇔ 3 x - y - z = 0 .$]
])
item(10,[Trong không gian $O x y z$, mặt phẳng đi qua điểm $A lr(( 2 ; - 1 ; 2 ))$ và song song với mặt phẳng $lr(( P )) : 2 x - y + 3 z + 2 = 0$ có phương trình là?],answers:([$2 x - y + 3 z + 11 = 0$],[$2 x - y + 3 z + 11 = 0$],[$2 x - y + 3 z - 11 = 0$],[$2 x - y + 3 z + 11 = 0$],),source-id:"bai-hoc-10",writing-lines:4,solution:[
#paragraph[Mặt phẳng $lr(( Q )) : cases(display(* "qua" A lr(( 2 ; - 1 ; 2 ))), display(* lr(( Q )) parallel lr(( P )) ⇒ arrow(n _(lr(( Q )))) = arrow(n _(lr(( P )))) = lr(( 2 ; - 1 ; 3 ))))$]
#paragraph[$⇒$ Phương trình $lr(( Q )) : 2 x - y + 3 z - 11 = 0$.]
#paragraph[Chọn C.]
])
subheading[Loại 2: Biết cặp vectơ chỉ phương của mặt phẳng]
theory-box[
#paragraph[Vectơ $arrow(u) != arrow(0)$ là vectơ chỉ phương của $(P)$ nếu giá của nó song song hoặc nằm trong $(P)$.]
#paragraph[Nếu $arrow(u), arrow(v)$ là hai vectơ chỉ phương không cùng phương thì $arrow(n)=[arrow(u),arrow(v)]$ là một vectơ pháp tuyến của $(P)$.]
]
item(11,[Trong không gian $O x y z$, gọi $M "," N "," P$ lần lượt là hình chiếu vuông góc của điểm $A lr(( 2 ; - 3 ; 1 ))$ lên các mặt phẳng tọa độ. Phương trình mặt phẳng $lr(( M N P ))$ là?],answers:([$frac(x, 2) + frac(y, 3) + frac(z, 1) = 1$],[$3 x - 2 y + 6 z = 6$],[$frac(x, 2) - frac(y, 3) + frac(z, 1) = 0$],[$3 x - 2 y + 6 z - 12 = 0$],),source-id:"bai-hoc-11",writing-lines:6,solution:[
#paragraph[Điểm $A lr(( 2 ; - 3 ; 1 ))$ chiếu vuông góc trên:]
#paragraph[+ Mặt phẳng $lr(( O x y )) ⇒ M lr(( 2 ; - 3 ; 0 ))$]
#paragraph[+ Mặt phẳng $lr(( O y z )) ⇒ N lr(( 0 ; - 3 ; 1 ))$]
#paragraph[+ Mặt phẳng $lr(( O x z )) ⇒ P lr(( 2 ; 0 ; 1 ))$]
#paragraph[\* Viết phương trình đi qua 3 điểm $M ; N ; P$:]
#paragraph[Có $cases(display(arrow(M N) = lr(( - 2 ; 0 ; 1 ))), display(arrow(M P) = lr(( 0 ; 3 ; 1 ))))$ là một cặp vectơ của $lr(( P ))$]
#paragraph[$⇒ arrow(n _(lr(( P )))) = lr([ arrow(M N) ; arrow(M P) ]) = lr(( - 3 ; 2 ; - 6 ))$]
#paragraph[$⇒$ Chọn vectơ pháp tuyến của $lr(( P ))$ là: $arrow(n _(lr(( P )))) = lr(( 3 ; - 2 ; 6 ))$]
#paragraph[$⇒$ Phương trình mặt phẳng $lr(( M N P ))$ là: $3 x - 2 y + 6 z - 12 = 0$.]
#paragraph[Chọn D.]
])
item(12,[Trong không gian $O x y z$, mặt phẳng chứa hai điểm $A lr(( 1 ; 0 ; 1 ))$  và $B lr(( - 1 ; 2 ; 2 ))$ và song song với trục $O x$ có phương trình là?],answers:([$y - 2 z + 2 = 0$],[$x + 2 z - 3 = 0$],[$2 y - z + 1 = 0$],[$x + y - z = 0$],),source-id:"bai-hoc-12",writing-lines:4,solution:[
#paragraph[Ta có: $cases(display(arrow(A B) = lr(( - 2 ; 2 ; 1 )) ⊂ lr(( P ))), display(O x parallel lr(( P )) ⇒ arrow(i) = lr(( 1 ; 0 ; 0 )) ⊂ lr(( P ))))$]
#paragraph[$⇒ cases(display(arrow(A B) = lr(( - 2 ; 2 ; 1 ))), display(arrow(i) = lr(( 1 ; 0 ; 0 ))))$ là một cặp vectơ của $lr(( P ))$]
#paragraph[$⇒ arrow(n _(lr(( P )))) = lr([ arrow(A B) ; arrow(i) ]) = lr(( 0 ; 1 ; - 2 ))$]
#paragraph[$⇒$ Phương trình mặt phẳng $lr(( P ))$ là: $y - 2 z + 2 = 0$. Chọn A.]
])
item(13,[Trong không gian với hệ tọa độ $O x y z$, cho điểm $A lr(( 2 ; 4 ; 1 ))$ và điểm $B lr(( - 1 ; 1 ; 3 ))$ và mặt phẳng $lr(( P )) : x - 3 y + 2 z - 5 = 0$ Một mặt phẳng $lr(( Q ))$ đi qua hai điểm $A "," B$ và vuông góc với mặt phẳng $lr(( P ))$ có dạng $a x + b y + c z - 11 = 0$. Khẳng định nào sau đây là đúng?],answers:([$a + b + c = 5$],[$a + b + c = 15$],[$a + b + c = - 5$],[$a + b + c = - 15$],),source-id:"bai-hoc-13",writing-lines:6,solution:[
#paragraph[Tính chất: Nếu hai mặt phẳng vuông góc với nhau $⇒$ vectơ pháp tuyến của mặt phẳng này là vectơ chỉ phương của mặt phẳng kia]
#paragraph[Giải:]
#paragraph[Ta có: $cases(display(arrow(A B) = lr(( - 3 ; - 3 ; 2 ))), display(arrow(n _(lr(( P )))) = lr(( 1 ; - 3 ; 2 ))))$]
#paragraph[Do $lr(( P )) ⊥ lr(( Q ))$ $⇒ arrow(n _(lr(( P ))))$ là một vectơ chỉ phương của $lr(( Q ))$]
#paragraph[$⇒ arrow(A B)$ và $arrow(n _(lr(( P ))))$ là cặp vectơ  của $lr(( Q ))$]
#paragraph[$⇒ arrow(n _(lr(( Q )))) = lr([ arrow(A B) ; arrow(n _(lr(( P )))) ]) = lr(( 0 ; 8 ; 12 ))$]
#paragraph[$⇒$ Chọn $arrow(n _(lr(( Q )))) = lr(( 0 ; 2 ; 3 ))$]
#paragraph[$⇒ lr(( Q )) : 2 y + 3 z - 11 = 0$]
#paragraph[$⇒ cases(display(a = 0), display(b = 2), display(c = 3)) ⇒ S = a + b + c = 0 + 2 + 3 = 5$]
#paragraph[Chọn A.]
])
item(14,[Trong không gian với hệ tọa độ $O x y z$ cho hai mặt phẳng $lr(( α )) : 3 x - 2 y + 2 z + 7 = 0$ và $lr(( β )) : 5 x - 4 y + 3 z + 1 = 0$. Phương trình mặt phẳng đi qua $O$ đồng thời vuông góc với cả $lr(( α ))$ và $lr(( β ))$ có phương trình là],answers:([$2 x + y - 2 z + 1 = 0$],[$2 x + y - 2 z = 0$],[$2 x - y - 2 z = 0$],[$2 x - y + 2 z = 0$],),source-id:"bai-hoc-14",writing-lines:4,solution:[
#paragraph[Gọi mặt phẳng phải tìm là $lr(( P ))$. Khi đó vectơ pháp tuyến của $lr(( P ))$là: $arrow(n _(P)) = lr([ arrow(n _(α)) "," arrow(n _(β)) ]) = lr(( 2 ;   1 ;   - 2 ))$. Phương trình của $lr(( P ))$ là $2 x + y - 2 z = 0$.]
])
item(15,[Trong không gian $O x y z$, cho hai mặt phẳng $lr(( P )) : x - 3 y + 2 z - 1 = 0$, $lr(( Q )) : x - z + 2 = 0$. Mặt phẳng $lr(( α ))$ vuông góc với cả $lr(( P ))$ và $lr(( Q ))$ đồng thời cắt trục $O x$ tại điểm có hoành độ bằng $3$. Phương trình của mặt phẳng $lr(( α ))$ là:?],answers:([$x + y + z - 3 = 0$],[$x + y + z + 3 = 0$],[$- 2 x + y + z + 6 = 0$],[$- 2 x + z - 6 = 0$],),source-id:"bai-hoc-15",writing-lines:6,solution:[
#paragraph[+ $lr(( α )) ⊥ lr(( P )) ⇒ arrow(n _(lr(( P ))))$ là vectơ chỉ phương của $lr(( α ))$]
#paragraph[+ $lr(( α )) ⊥ lr(( Q )) ⇒ arrow(n _(lr(( Q ))))$ là vectơ chỉ phương của $lr(( α ))$]
#paragraph[$⇒ cases(display(arrow(n _(lr(( P )))) = lr(( 1 ; - 3 ; 2 ))), display(arrow(n _(lr(( Q )))) = lr(( 1 ; 0 ; - 1 ))))$ là một cặp vectơ chỉ phương của $lr(( α ))$]
#paragraph[$⇒ arrow(n _(lr(( α )))) = lr([ arrow(n _(lr(( P )))) ; arrow(n _(lr(( Q )))) ]) = lr(( 3 ; 3 ; 3 ))$]
#paragraph[Chọn $arrow(n _(lr(( α )))) = lr(( 1 ; 1 ; 1 ))$]
#paragraph[Mà $lr(( α ))$ cắt trục $O x$ tại $A lr(( 3 ; 0 ; 0 ))$]
#paragraph[$⇒ lr(( α )) : x + y + z - 3 = 0$.]
#paragraph[Chọn A.]
])
subheading[Loại 3: Phương trình mặt phẳng theo đoạn chắn]
theory-box[Với $A(a;0;0), B(0;b;0), C(0;0;c)$ và $a b c != 0$, mặt phẳng $(A B C)$ có phương trình $x/a+y/b+z/c=1$.]
item(16,[Trong không gian $O x y z$, cho ba điểm $A lr(( 3 ; 0 ; 0 ))$, $B lr(( 0 ; 1 ; 0 ))$ và $C lr(( 0 ; 0 ; - 2 ))$. Mặt phẳng $lr(( A B C ))$ có phương trình là:],answers:([$frac(x, 3) + frac(y, - 1) + frac(z, 2) = 1$],[$frac(x, 3) + frac(y, 1) + frac(z, - 2) = 1$],[$frac(x, 3) + frac(y, 1) + frac(z, 2) = 1$],[$frac(x, - 3) + frac(y, 1) + frac(z, 2) = 1$],),source-id:"bai-hoc-16",writing-lines:4,solution:[
#paragraph[Chọn B.]
#paragraph[$lr(( A B C )) : frac(x, a) + frac(y, b) + frac(z, c) = 1$ hay $lr(( A B C )) : frac(x, 3) + frac(y, 1) + frac(z, - 2) = 1$.]
])
item(17,[Trong không gian $O x y z$, cho điểm $M lr(( 1 ; 2 ; 3 ))$. Gọi $A "," B "," C$ lần lượt là hình chiếu vuông góc của điểm $M$ lên các trục $O x "," O y "," O z$. Viết phương trình mặt phẳng $lr(( A B C ))$?],answers:([$frac(x, 1) + frac(y, 2) + frac(z, 3) = 1$],[$frac(x, 1) - frac(y, 2) + frac(z, 3) = 1$],[$frac(x, 1) + frac(y, 2) + frac(z, 3) = 0$],[$- frac(x, 1) + frac(y, 2) + frac(z, 3) = 1$],),source-id:"bai-hoc-17",writing-lines:8,solution:[
#paragraph[Ta có điểm $M lr(( 1 ; 2 ; 3 ))$ chiếu vuông góc trên:]
#paragraph[+ $O x ⇒ A lr(( 1 ; 0 ; 0 ))$]
#paragraph[+ $O y ⇒ B lr(( 0 ; 2 ; 0 ))$]
#paragraph[+ $O z ⇒ C lr(( 0 ; 0 ; 3 ))$]
#paragraph[$⇒$ Phương trình mặt phẳng $lr(( A B C )) : frac(x, 1) + frac(y, 2) + frac(z, 3) = 1$.]
#paragraph[Chọn A.]
])
item(18,[Mặt phẳng $lr(( P ))$ đi qua điểm $M lr(( 1 ; 1 ; 1 ))$ cắt các tia $O x "," O y "," O z$ lần lượt tại $A lr(( a ; 0 ; 0 )) ; B lr(( 0 ; b ; 0 )) ; C lr(( 0 ; 0 ; c ))$ sao cho thể tích khối của tứ diện $O A B C$ nhỏ nhất. Khi đó tổng $a + 2 b + 3 c$ bằng?],answers:([$12$],[$21$],[$15$],[$18$],),source-id:"bai-hoc-18",writing-lines:8,solution:[
#paragraph[Phương trình $lr(( A B C )) : frac(x, a) + frac(y, b) + frac(z, c) = 1$]
#paragraph[Mặt phẳng $lr(( A B C ))$ đi qua $M lr(( 1 ; 1 ; 1 )) ⇒ frac(1, a) + frac(1, b) + frac(1, c) = 1$]
#paragraph[$V _(O A B C) = frac(1, 6) O A dot O B dot O C = frac(1, 6) a b c →$ đạt Min]
#paragraph[Ta có: $frac(1, a) + frac(1, b) + frac(1, c) ≥ 3 root(3, frac(1, a b c))$ (Bất đẳng thức Cô-si)]
#paragraph[$⇔ 1 ≥ 3 root(3, frac(1, a b c)) ⇔ frac(1, 27) ≥ frac(1, a b c) ⇔ a b c ≥ 27$]
#paragraph[$⇒ lr(( a b c )) _(min) = 27$]
#paragraph[$⇒ min V _(O A B C) = frac(1, 6) a b c = frac(27, 6) = frac(9, 2)$]
#paragraph[Dấu “=” xảy ra khi $1/a=1/b=1/c=1/3$, tức là $a=b=c=3$.]
#paragraph[$⇒ a + 2 b + 3 c = 3 + 2 dot 3 + 3 dot 3 = 18$]
#paragraph[Chọn D.]
])
pagebreak()
lesson-section([BÀI TẬP TỰ LUYỆN],badge:[B])
item(1,[Trong không gian $O x y z$, cho mặt phẳng $lr(( α )) : 2 x + 4 y - z + 3 = 0$. Vectơ nào sau đây là vectơ pháp tuyến của $lr(( α ))$?],answers:([$arrow(n _(1)) = lr(( 2 ; 4 ; - 1 ))$],[$arrow(n _(2)) = lr(( 2 ; - 4 ; 1 ))$],[$arrow(n _(3)) = lr(( - 2 ; 4 ; 1 ))$],[$arrow(n _(1)) = lr(( 2 ; 4 ; 1 ))$],),source-id:"tu-luyen-1",writing-lines:3,solution:[
#paragraph[Chọn A]
#paragraph[Mặt phẳng $lr(( α )) : 2 x + 4 y - z + 3 = 0$ có một vectơ pháp tuyến là $arrow(n) = lr(( 2 ; 4 ; - 1 ))$.]
])
item(2,[Trong không gian $O x y z$, vectơ nào dưới đây có giá vuông góc với mặt phẳng $lr(( α )) : 2 x - 3 y + 1 = 0 ?$],answers:([$arrow(a) = lr(( 2 ;   - 3 ;   1 ))$],[$arrow(b) = lr(( 2 ;   1 ;   - 3 ))$],[$arrow(c) = lr(( 2 ;   - 3 ;   0 ))$],[$arrow(d) = lr(( 3 ;   2 ;   0 ))$],),source-id:"tu-luyen-2",writing-lines:3,solution:[
#paragraph[Chọn C]
#paragraph[Mặt phẳng $lr(( α ))$ có một VTPT là $arrow(n) = lr(( 2 ;   - 3 ;   0 )) = arrow(c)$.]
])
item(3,[Trong không gian với hệ tọa độ $O x y z$, cho mặt phẳng $lr(( P )) : x - 2 y + z - 5 = 0 .$ Điểm nào dưới đây thuộc $lr(( P ))$?],answers:([$P lr(( 0 ; 0 ; - 5 ))$],[$M lr(( 1 ; 1 ; 6 ))$],[$Q lr(( 2 ; - 1 ; 5 ))$],[$N lr(( - 5 ; 0 ; 0 ))$],),source-id:"tu-luyen-3",writing-lines:3,solution:[
#paragraph[Chọn B]
#paragraph[Ta có $1 - 2 dot 1 + 6 - 5 = 0$ nên $M lr(( 1 ; 1 ; 6 ))$ thuộc mặt phẳng $lr(( P ))$.]
])
item(4,[Trong không gian với hệ tọa độ $O x y z$, vectơ nào dưới đây là một vectơ pháp tuyến của mặt phẳng $lr(( O x y ))$?],answers:([$arrow(i) = lr(( 1 ; 0 ; 0 ))$],[$arrow(m) = lr(( 1 ; 1 ; 1 ))$],[$arrow(j) = lr(( 0 ; 1 ; 0 ))$],[$arrow(k) = lr(( 0 ; 0 ; 1 ))$],),source-id:"tu-luyen-4",writing-lines:3,solution:[
#paragraph[Chọn D]
#paragraph[Do mặt phẳng $lr(( O x y ))$ vuông góc với trục $O z$ nên nhận vectơ $arrow(k) = lr(( 0 ; 0 ; 1 ))$ làm một vectơ pháp tuyến]
])
item(5,[Trong không gian với hệ toạ độ $O x y z$, phương trình nào dưới đây là phương trình của mặt phẳng $lr(( O y z ))$?],answers:([$y = 0$],[$x = 0$],[$y - z = 0$],[$z = 0$],),source-id:"tu-luyen-5",writing-lines:3,solution:[
#paragraph[Chọn B]
#paragraph[Mặt phẳng $lr(( O y z ))$ đi qua điểm $O lr(( 0 ; 0 ; 0 ))$ và có vectơ pháp tuyến là $arrow(i) = lr(( 1 ; 0 ; 0 ))$ nên ta có phương trình mặt phẳng $lr(( O y z ))$ là : $1 lr(( x - 0 )) + 0 lr(( y - 0 )) + 0 lr(( z - 0 )) = 0 ⇔ x = 0$.]
])
item(6,[Trong không gian với hệ tọa độ $O x y z$, phương trình nào dưới đây là phương trình mặt phẳng đi qua điểm $M lr(( 1 ; 2 ; - 3 ))$ và có một vectơ pháp tuyến $arrow(n) = lr(( 1 ; - 2 ; 3 ))$.],answers:([$x - 2 y + 3 z + 12 = 0$],[$x - 2 y - 3 z - 6 = 0$],[$x - 2 y + 3 z - 12 = 0$],[$x - 2 y - 3 z + 6 = 0$],),source-id:"tu-luyen-6",writing-lines:4,solution:[
#paragraph[Chọn A]
#paragraph[Phương trình mặt phẳng đi qua điểm $M lr(( 1 ; 2 ; - 3 ))$ và có một vectơ pháp tuyến $arrow(n) = lr(( 1 ; - 2 ; 3 ))$ là $1 lr(( x - 1 )) - 2 lr(( y - 2 )) + 3 lr(( z + 3 )) = 0$$⇔ x - 2 y + 3 z + 12 = 0$.]
])
item(7,[Trong không gian $O x y z$, cho 2 điểm $A ( 5 ; - 4 ; 2 )$ và $B ( 1 ; 2 ; 4 )$. Mặt phẳng đi qua $A$ và vuông góc với đường thẳng $A B$ là?],answers:([$3 x - y + 3 z - 25 = 0$],[$2 x - 3 y - z + 8 = 0$],[$3 x - y + 3 z - 13 = 0$],[$2 x - 3 y - z - 20 = 0$],),source-id:"tu-luyen-7",writing-lines:4,solution:[
#paragraph[Chọn D]
#paragraph[Mặt phẳng vuông góc với đường thẳng$A B$ nên nhận $arrow(A B)$ làm vectơ pháp tuyến, $arrow(A B) = ( - 4 ; 6 ; 2 )$]
#paragraph[Mặt phẳng đi qua $A ( 5 ; - 4 ; 2 )$ và có vectơ pháp tuyến, $arrow(A B) = ( - 4 ; 6 ; 2 )$ có phương trình $- 4 ( x - 5 ) + 6 ( y + 4 ) + 2 ( z - 2 ) = 0$ hay $2 x - 3 y - z - 20 = 0$. Vậy chọn D.]
])
item(8,[Trong không gian $O x y z$, cho hai điểm $A lr(( - 1 ; 2 ; 0 ))$ và $B lr(( 3 ; 0 ; 2 ))$. Mặt phẳng trung trực của đoạn thẳng $A B$ có phương trình là],answers:([$x + y + z - 3 = 0$],[$2 x - y + z + 2 = 0$],[$2 x + y + z - 4 = 0$],[$2 x - y + z - 2 = 0$],),source-id:"tu-luyen-8",writing-lines:4,solution:[
#paragraph[Chọn D]
#paragraph[Gọi $I$ là trung điểm của đoạn thẳng $A B$. Suy ra $I lr(( 1 ; 1 ; 1 ))$.]
#paragraph[Ta có $arrow(A B) = lr(( 4 ; - 2 ; 2 ))$.]
#paragraph[Phương trình mặt phẳng trung trực của đoạn thẳng $A B$ đi qua trung điểm $I$ của $A B$ và nhận $arrow(A B)$ làm vtpt, nên có phương trình là $lr(( α )) : 2 x - y + z - 2 = 0$.]
])
item(9,[Trong không gian $O x y z$, cho điểm $M lr(( 2 ; 1 ; - 2 ))$ và mặt phẳng $lr(( P )) : 3 x - 2 y + z + 1 = 0$. Phương trình của mặt phẳng đi qua $M$ và song song với $lr(( P ))$ là:],answers:([$2 x + y - 2 x + 9 = 0$],[$2 x + y - 2 z - 9 = 0$],[$3 x - 2 y + z + 2 = 0$],[$3 x - 2 y + z - 2 = 0$],),source-id:"tu-luyen-9",writing-lines:4,solution:[
#paragraph[Chọn D]
#paragraph[Phương trình mặt phẳng $(Q)$ song song với $(P)$ có dạng $3x-2y+z+D=0$.]
#paragraph[Mặt phẳng $lr(( Q ))$ qua điểm $M lr(( 2 ; 1 ; - 2 ))$, do đó: $3 dot 2 - 2 dot 1 + lr(( - 2 )) + D = 0 ⇔ D = - 2$.]
#paragraph[Vậy $lr(( Q )) : 3 x - 2 y + z - 2 = 0$.]
])
item(10,[Trong không gian với hệ tọa độ $O x y z$, mặt phẳng đi qua 3 điểm $A lr(( 1 ; 2 ; 3 ))$, $B lr(( 4 ; 5 ; 6 ))$, $C lr(( 1 ; 0 ; 2 ))$ có phương trình là],answers:([$x - y + 2 z - 5 = 0$],[$x + 2 y - 3 z + 4 = 0$],[$3 x - 3 y + z = 0$],[$x + y - 2 z + 3 = 0$],),source-id:"tu-luyen-10",writing-lines:4,solution:[
#paragraph[Chọn D]
#paragraph[Ta có: $arrow(A B) = lr(( 3 ; 3 ; 3 ))$, $arrow(A C) = lr(( 0 ; - 2 ; - 1 ))$]
#paragraph[Mặt phẳng đi qua 3 điểm $A lr(( 1 ; 2 ; 3 ))$, $B lr(( 4 ; 5 ; 6 ))$, $C lr(( 1 ; 0 ; 2 ))$ nhận $arrow(n) = lr([ arrow(A B) "," arrow(A C) ]) = lr(( 3 ; 3 ; - 6 ))$ làm vectơ pháp tuyến.]
#paragraph[Nên phương trình mặt phẳng đi qua 3 điểm $A lr(( 1 ; 2 ; 3 ))$, $B lr(( 4 ; 5 ; 6 ))$, $C lr(( 1 ; 0 ; 2 ))$ có phương trình là $3 x + 3 y - 6 z + 9 = 0$ hay $x + y - 2 z + 3 = 0$]
])
item(11,[Trong không gian hệ tọa độ $O x y z$, cho $A lr(( 1 ;   2 ;   - 1 ))$; $B lr(( - 1 ;   0 ;   1 ))$ và mặt phẳng $lr(( P )) :   x + 2 y - z + 1 = 0$. Viết phương trình mặt phẳng $lr(( Q ))$ qua $A ","   B$ và vuông góc với $lr(( P ))$],answers:([$lr(( Q )) :   2 x - y + 3 = 0$],[$lr(( Q )) :   x + z = 0$],[$lr(( Q )) :   - x + y + z = 0$],[$lr(( Q )) :   3 x - y + z = 0$],),source-id:"tu-luyen-11",writing-lines:4,solution:[
#paragraph[Chọn B]
#paragraph[$arrow(A B) = lr(( - 2 ; - 2 ;     2 )) = - 2 lr(( 1 ;   1 ;   - 1 )) ","     arrow(u) = lr(( 1 ;   1 ;   - 1 ))$]
#paragraph[$arrow(n _(lr(( P )))) = lr(( 1 ;   2 ;   - 1 ))$]
#paragraph[Chọn $arrow(n)_((Q))=[arrow(u),arrow(n)_((P))]=(1;0;1)$.]
#paragraph[Vậy $lr(( Q )) :   x + z = 0$.]
])
item(12,[Trong không gian $O x y z$, phương trình của mặt phẳng $lr(( P ))$ đi qua điểm $B lr(( 2 ; 1 ; - 3 ))$, đồng thời vuông góc với hai mặt phẳng $lr(( Q )) : x + y + 3 z = 0$, $lr(( R )) : 2 x - y + z = 0$ là],answers:([$4 x + 5 y - 3 z + 22 = 0$],[$4 x - 5 y - 3 z - 12 = 0$],[$2 x + y - 3 z - 14 = 0$],[$4 x + 5 y - 3 z - 22 = 0$],),source-id:"tu-luyen-12",writing-lines:4,solution:[
#paragraph[Mặt phẳng $lr(( Q )) : x + y + 3 z = 0$, $lr(( R )) : 2 x - y + z = 0$ có các vectơ pháp tuyến lần lượt là $arrow(n _(1)) = lr(( 1 ; 1 ; 3 ))$ và $arrow(n _(2)) = lr(( 2 ; - 1 ; 1 ))$.]
#paragraph[Vì $lr(( P ))$ vuông góc với hai mặt phẳng $lr(( Q ))$, $lr(( R ))$ nên $lr(( P ))$ có vectơ pháp tuyến là $arrow(n) = lr([ arrow(n _(1)) "," arrow(n _(2)) ]) = lr(( 4 ; 5 ; - 3 ))$.]
#paragraph[Ta lại có $lr(( P ))$ đi qua điểm $B lr(( 2 ; 1 ; - 3 ))$ nên $lr(( P )) : 4 lr(( x - 2 )) + 5 lr(( y - 1 )) - 3 lr(( z + 3 )) = 0$ $⇔ 4 x + 5 y - 3 z - 22 = 0$.]
])
item(13,[Trong không gian với hệ tọa độ $O x y z$, cho $3$ điểm $A lr(( 1 ; 0 ; 0 ))$; $B lr(( 0 ; - 2 ; 0 ))$;$C lr(( 0 ; 0 ; 3 ))$. Phương trình nào dưới đây là phương trình mặt phẳng $lr(( A B C ))$?],answers:([$frac(x, 3) + frac(y, - 2) + frac(z, 1) = 1$],[$frac(x, - 2) + frac(y, 1) + frac(z, 3) = 1$],[$frac(x, 1) + frac(y, - 2) + frac(z, 3) = 1$],[$frac(x, 3) + frac(y, 1) + frac(z, - 2) = 1$],),source-id:"tu-luyen-13",writing-lines:4,solution:[
#paragraph[Chọn C]
#paragraph[Phương trình mặt phẳng theo đoạn chắn đi qua 3 điểm $A$, $B$,$C$ là $frac(x, 1) + frac(y, - 2) + frac(z, 3) = 1 .$]
])
item(14,[Trong không gian $O x y z$, nếu ba điểm $A "," B "," C$ lần lượt là hình chiếu vuông góc của điểm $M lr(( 1 ; 2 ; 3 ))$ lên các trục tọa độ thì phương trình mặt phẳng $lr(( A B C ))$ là],answers:([$frac(1, x) + frac(2, y) + frac(3, z) = 1$],[$frac(x, 1) + frac(y, 2) + frac(z, 3) = 1$],[$frac(1, x) + frac(2, y) + frac(3, z) = 0$],[$frac(x, 1) + frac(y, 2) + frac(z, 3) = 0$],),source-id:"tu-luyen-14",writing-lines:4,solution:[
#paragraph[Gọi $A "," B "," C$ lần lượt là hình chiếu vuông góc của điểm $M lr(( 1 ; 2 ; 3 ))$ lên $O x "," O y "," O z$.]
#paragraph[Suy ra: $A lr(( 1 ; 0 ; 0 )) "," B lr(( 0 ; 2 ; 0 )) "," C lr(( 0 ; 0 ; 3 ))$.]
#paragraph[Vậy phương trình mặt phẳng $lr(( A B C ))$theo đoạn chắn là $frac(x, 1) + frac(y, 2) + frac(z, 3) = 1$.]
])
if variant == "dap-an" {pagebreak(weak:true)}
item(15,[Trong không gian $O x y z$, cho mặt phẳng $lr(( α ))$ đi qua điểm $M lr(( 1 ; 2 ; 3 ))$ và cắt các trục $O x "," O y "," O z$ lần lượt tại $A "," B "," C$ (khác gốc tọa độ $O$) sao cho điểm $M$ là trực tâm tam giác $A B C$. Mặt phẳng $lr(( α ))$ có phương trình dạng $a x + b y + c z - 14 = 0$. Tính tổng $T = a + b + c$?],answers:([$8$],[$14$],[$6$],[$11$],),source-id:"tu-luyen-15",writing-lines:8,solution:[
#grid(columns:(1fr,88mm),column-gutter:5mm,align:top,
 [
 #paragraph[Trong hình chóp $O.A B C$, ba cạnh $O A$, $O B$, $O C$ đôi một vuông góc.]
 #paragraph[Gọi $H$ là hình chiếu vuông góc của $O$ lên $(A B C)$. Ta có $O H perp B C$ và $O A perp B C$, nên $B C perp (O A H)$, suy ra $A H perp B C$.]
 #paragraph[Tương tự, $C H perp A B$. Vì vậy $H$ là trực tâm tam giác $A B C$.]
 ],
 scale(x:88/98*100%,y:88/98*100%,reflow:true,orthocenter()))
#paragraph[Theo đề bài, $M$ là trực tâm tam giác $A B C$, do đó $O M perp (A B C)$. Mặt phẳng $(alpha)$ đi qua $M(1;2;3)$ và nhận $arrow(O M)=(1;2;3)$ làm vectơ pháp tuyến.]
#formula(($ (x-1)+2(y-2)+3(z-3)=0 $,$⇔ x+2y+3z-14=0.$))
#paragraph[Suy ra $a=1$, $b=2$, $c=3$, nên $T=a+b+c=6$. Chọn C.]
])
item(16,[Trong không gian $O x y z$ cho điểm $M lr(( 1 ; 2 ; 3 ))$. Viết phương trình mặt phẳng $lr(( P ))$ đi qua điểm $M$ và cắt các trục tọa độ $O x ","   O y ","   O z$ lần lượt tại $A$, $B$, $C$ sao cho $M$ là trọng tâm của tam giác $A B C$.],answers:([$lr(( P )) : 6 x + 3 y + 2 z + 18 = 0$],[$lr(( P )) : 6 x + 3 y + 2 z + 6 = 0$],[$lr(( P )) : 6 x + 3 y + 2 z - 18 = 0$],[$lr(( P )) : 6 x + 3 y + 2 z - 6 = 0$],),source-id:"tu-luyen-16",writing-lines:4,solution:[
#paragraph[Chọn C]
#paragraph[Theo giả thiết $A ∈ O x ","   B ∈ O y ","   C ∈ O z$ nên ta có thể đặt $A lr(( a ; 0 ; 0 )) ","   B lr(( 0 ; b ; 0 )) ","   C lr(( 0 ; 0 ; c ))$.]
#paragraph[Vì $M lr(( 1 ; 2 ; 3 ))$ là trọng tâm tam giác $A B C$ nên $cases(display(a = 3), display(b = 6), display(c = 9))$.]
#paragraph[Từ đó ta có phương trình mặt phẳng theo đoạn chắn là:]
#paragraph[$lr(( P )) : frac(x, 3) + frac(y, 6) + frac(z, 9) = 1 ⇔ 6 x + 3 y + 2 z - 18 = 0$.]
])
item(17,[Trong không gian với hệ tọa độ $O x y z$, có bao nhiêu mặt phẳng qua $M lr(( 2 ; 1 ; 3 ))$, $A lr(( 0 ; 0 ; 4 ))$ và cắt hai trục $O x$, $O y$ lần lượt tại $B$, $C$ khác $O$ thỏa mãn diện tích tam giác $O B C$ bằng $1$?],answers:([$0$],[$3$],[$2$],[$4$],),source-id:"tu-luyen-17",writing-lines:8,solution:[
#paragraph[Chọn C]
#paragraph[Gọi $B lr(( a ; 0 ; 0 ))$, $C lr(( 0 ; b ; 0 ))$ lần lượt là giao điểm của $lr(( P ))$ với các trục $O x "," O y$.]
#paragraph[Phương trình mặt phẳng $lr(( P )) : frac(x, a) + frac(y, b) + frac(z, 4) = 1$.]
#paragraph[Vì $M lr(( 2 ; 1 ; 3 ))$ thuộc $lr(( P ))$ nên ta có $frac(2, a) + frac(1, b) + frac(3, 4) = 1$ $⇔ frac(2, a) + frac(1, b) = frac(1, 4) ⇔ 4 a + 8 b = a b$.]
#paragraph[Diện tích tam giác $S _(Δ O B C) = frac(1, 2) O B dot O C = frac(1, 2) abs(a) dot abs(b) = frac(1, 2) abs(a b) = 1$$⇔ abs(a b) = 2$]
#paragraph[Xét hệ phương trình $cases(display(4 a + 8 b = a b), display(a b = 2)) "," lr(( I ))$]
#paragraph[$⇔ cases(display(4 a + 8 b = 2), display(a b = 2))$]
#paragraph[$⇔ cases(display(2 a + 4 b = 1), display(2 a b = 4))$ $⇔ cases(display(2 a = 1 - 4 b), display(lr(( 1 - 4 b )) b = 4))$]
#paragraph[$⇔ cases(display(2 a = 1 - 4 b), display(4 b ^(2) - b + 4 = 0 "," lr(( v n ))))$]
#paragraph[Hệ vô nghiệm.]
#paragraph[Xét hệ phương trình $cases(display(4 a + 8 b = a b), display(a b = - 2))$]
#paragraph[$⇔ cases(display(4 a + 8 b = - 2), display(a b = - 2))$]
#paragraph[$⇔ cases(display(2 a + 4 b = - 1), display(2 a b = - 4))$ $⇔ cases(display(2 a = - 1 - 4 b), display(lr(( - 1 - 4 b )) b = - 4))$]
#paragraph[$⇔ cases(display(2 a = - 1 - 4 b), display(4 b ^(2) + b - 4 = 0))$]
#paragraph[Hệ có hai nghiệm.]
#paragraph[Vậy có hai mặt phẳng thỏa yêu cầu bài toán.]
])
item(18,[Trong không gian $O x y z$, cho mặt phẳng $lr(( P ))$ đi qua điểm $M lr(( 9 ; 1 ; 1 ))$ cắt các tia $O x "," O y "," O z$ lần lượt tại $A "," B "," C$ ($A "," B "," C$ không trùng gốc tọa độ). Thể tích của tứ diện $O A B C$ đạt giá trị nhỏ nhất bằng bao nhiêu?],answers:([$frac(81, 2)$],[$frac(243, 2)$],[$frac(27, 3)$],[$243$],),source-id:"tu-luyen-18",writing-lines:8,solution:[
#paragraph[\* Ta có: $cases(display(A lr(( a ; 0 ; 0 ))), display(B lr(( 0 ; b ; 0 ))), display(C lr(( 0 ; 0 ; c )))) lr(( a "," b "," c > 0 ))$]
#paragraph[$⇒$ Phương trình mặt phẳng $lr(( A B C )) : frac(x, a) + frac(y, b) + frac(z, c) = 1$]
#paragraph[$lr(( A B C ))$ qua $M lr(( 9 ; 1 ; 1 )) ⇒ frac(9, a) + frac(1, b) + frac(1, c) = 1$]
#paragraph[\* $V _(O A B C) = frac(1, 6) a b c →$ đạt Min]
#paragraph[Bất đẳng thức Cô-si: $frac(9, a) + frac(1, b) + frac(1, c) ≥ 3 root(3, frac(9, a b c))$]
#paragraph[$⇔ 1 ≥ 3 root(3, frac(9, a b c)) ⇔ frac(1, 27) ≥ frac(9, a b c) ⇔ a b c ≥ 243$]
#paragraph[$V_(O A B C)=1/6 a b c >= 1/6 dot 243=81/2$.]
#paragraph[Dấu “=” xảy ra khi $frac(9, a) = frac(1, b) = frac(1, c) = frac(1, 3) ⇔ cases(display(a = 27), display(b = 3), display(c = 3))$]
#paragraph[Chọn A.]
])
item(19,[Trong không gian $O x y z$, cho hai mặt phẳng $lr(( P )) : x + 4 y - 2 z - 6 = 0$ và $lr(( Q )) : x - 2 y + 4 z - 6 = 0$. Mặt phẳng $lr(( α ))$ chứa giao tuyến với $lr(( P ))$ và $lr(( Q ))$ và cắt các trục tọa độ tại các điểm $A "," B "," C$ sao cho hình chóp $O dot A B C$ là hình chóp đều. Phương trình mặt phẳng $lr(( α ))$ là?],answers:([$x + y + z - 6 = 0$],[$x + y + z + 6 = 0$],[$x + y + z - 3 = 0$],[$x + y - z - 6 = 0$],),source-id:"tu-luyen-19",writing-lines:8,solution:[
#paragraph[\* Gọi $cases(display(A lr(( a ; 0 ; 0 )) ∈ O x), display(B lr(( 0 ; b ; 0 )) ∈ O y), display(C lr(( 0 ; 0 ; c )) ∈ O z)) lr(( a "," b "," c ≠ 0 ))$]
#paragraph[Phương trình $(alpha)$ có dạng $x/a+y/b+z/c=1$.]
#paragraph[\* $cases(display(lr(( P )) : x + 4 y - 2 z - 6 = 0), display(lr(( Q )) : x - 2 y + 4 z - 6 = 0))$]
#paragraph[Cho $x = 0 ⇒ cases(display(y = 3), display(z = 3)) ⇒ M lr(( 0 ; 3 ; 3 ))$]
#paragraph[Cho $y = 0 ⇒ cases(display(x = 6), display(z = 0)) ⇒ N lr(( 6 ; 0 ; 0 ))$]
#paragraph[$⇒ cases(display(M ∈ lr(( α ))), display(N ∈ lr(( α )))) ⇒ cases(display(frac(3, b) + frac(3, c) = 1 lr(( 1 ))), display(frac(6, a) = 1 ⇔ a = 6))$]
#paragraph[\* $O A B C$ là hình chóp đều $⇔ O A = O B = O C$ $⇔ abs(a) = abs(b) = abs(c) ⇒ abs(b) = abs(c) = 6 lr(( 2 ))$]
#paragraph[Giải $lr(( 1 )) + lr(( 2 )) ⇒ b = c = 6$]
#paragraph[Vậy $a = b = c = 6$]
#paragraph[Vậy phương trình $lr(( α )) : frac(x, 6) + frac(y, 6) + frac(z, 6) = 1 ⇔ x + y + z - 6 = 0$.]
#paragraph[Chọn A.]
])
}
