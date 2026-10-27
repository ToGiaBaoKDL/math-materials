#import "/templates/exam.typ": exam-question
#import "/templates/exam-lesson.typ": exam-section
#import "/templates/components.typ": choices
#import "../figures.typ": diagram
#let q = exam-question.with(keep-together: true, question-gap: 5mm, statement-gap: 3.5mm)
#let side(body, figure) = grid(columns: (1fr, 66mm), gutter: 6mm, align: top, body, align(right, diagram(figure)))
#let side-question(number, body, figure) = block(width: 100%, breakable: false, above: 5mm)[
  #grid(columns: (1fr, if figure == "park" { 44mm } else { 62mm }), gutter: 6mm, align: if figure == "park" { horizon } else { top },
    q(number, body, question-gap: 0mm), align(right, diagram(figure)))
]
#let questions() = [
#exam-section("I", [TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN], instruction: [Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.])
#q(1, [Gọi giá trị lớn nhất và giá trị nhỏ nhất của hàm số: $y=x^3-3x^2$ trên $[-2;5/2]$ lần lượt là $M$ và $m$. Khi đó giá trị của biểu thức $M+2m$ bằng:], answers: ([$-10$.], [$-40$.], [$12$.], [$-32$.]))
#q(2, [Cho hàm số $y=f(x)$ có đồ thị hàm số $y=f'(x)$ như hình vẽ. Chọn khẳng định đúng?
#v(3mm)
#side(choices(([Hàm số có 1 điểm cực trị.], [Hàm số có 2 điểm cực trị.], [Hàm số có 5 điểm cực trị.], [Hàm số có 3 điểm cực trị.]), columns: 1), "derivative")])
#q(3, [Gieo một con súc sắc cân đối đồng chất 2 lần. Xác suất để tổng số chấm xuất hiện của 2 lần gieo bằng 7 là:], answers: ([$1/3$.], [$2/9$.], [$11/36$.], [$1/6$.]))
#q(4, [Nghiệm của phương trình $sin 2x=1$ là:], answers: ([$x=pi/4+k 2pi$ $(k in ZZ)$.], [$x=pi/4+k pi$ $(k in ZZ)$.], [$x=pi/2+k 2pi$ $(k in ZZ)$.], [$x=(k pi)/2$ $(k in ZZ)$.]), columns: 2)
#q(5, [Hàm số nào sau đây nghịch biến trên $RR$.], answers: ([$y=(x-1)/(x-2)$.], [$y=2x^2+3x+2$.], [$y=-x^3+x+1$.], [$y=-x^3+3x^2-9x$.]), columns: 2)
#q(6, [Cho cấp số cộng $(u_n)$ có $u_1=4;u_3=10$. Công sai của cấp số cộng là:], answers: ([$-3$.], [$-6$.], [$6$.], [$3$.]))
#q(7, [Tiệm cận ngang của đồ thị hàm số: $y=(2x-1)/(x+1)$ là:], answers: ([$x=-1$.], [$y=1$.], [$y=2$.], [$y=-2$.]))
#q(8, [Trong không gian $O x y z$, cho $arrow(A B)=(0;1;-2)$ và điểm $A(-3;2;0)$. Tìm toạ độ điểm $B$?], answers: ([$(-3;3;-2)$.], [$(3;-1;-2)$.], [$(3;-3;2)$.], [$(-3;1;2)$.]))
#q(9, [Cho hình chóp $S A B C D$ có đáy $A B C D$ là hình chữ nhật và $S B perp B C$. Mệnh đề nào sau đây đúng:], answers: ([$S B perp (A B C D)$.], [$S A perp (A B C D)$.], [$B C perp (S A B)$.], [$B C perp (S A C)$.]), columns: 2)
#q(10, [Cho hình lập phương $A B C D dot A' B' C' D'$. Khẳng định nào sau đây sai?
#v(3mm)
#side(choices(([$arrow(A B)=arrow(C D)$.], [$arrow(A' B')=-arrow(C' D')$.], [$arrow(A C)=arrow(A' C')$.], [$arrow(B C)=arrow(A D)$.]), columns: 1), "cube-prime")])
#q(11, [Trong không gian $O x y z$, cho điểm $A(1;2;-3)$. Toạ độ hình chiếu của $A$ trên $O x$ là:], answers: ([$(0;2;-3)$.], [$(0;0;-3)$.], [$(1;2;0)$.], [$(1;0;0)$.]))
#q(12, [Toạ độ giao điểm của đồ thị hàm số $y=(x^2+3x-4)/(x+1)$ với trục tung là:], answers: ([$(0;-1)$.], [$(0;-4)$.], [$(-4;0)$.], [$(-1;0)$.]))
#exam-section("II", [TRẮC NGHIỆM ĐÚNG – SAI], instruction: [Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý (a), (b), (c), (d) ở mỗi câu, thí sinh chọn đúng hoặc sai.])
#q(1, [Cho bất phương trình $(1/5)^(3x-1) <= 1/5^2$ #h(3mm) (1)], statements: (
[Bất phương trình (1) tương đương với bất phương trình $(1/5)^(3x-1) <= (1/5)^2$.],
[Nghiệm của bất phương trình (1) là $x <= 1$.],
[Tập nghiệm của bất phương trình (1) là $S=[1;+infinity)$.],
[Bất phương trình (1) tương đương với bất phương trình $3x-1 <= 2$.]))
#q(2, [Cho hàm số bậc ba có bảng biến thiên như sau:
#v(4mm)
#align(center, diagram("variation"))], statements: (
[Khoảng cách giữa 2 điểm cực trị của đồ thị hàm số là $sqrt(85)/2$.],
[Tổng giá trị lớn nhất và nhỏ nhất của hàm số $g(x)=f(-x^2+4x)$ trên đoạn $[0;2]$ bằng $a/b$, trong đó $a,b$ là 2 số nguyên tố cùng nhau thì $a+b=9$.],
[Hàm số đồng biến trên khoảng $(3;+infinity)$.],
[Đồ thị hàm số $y=1/f(x)$ có 3 đường tiệm cận.]))
#q(3, [Cho hàm số $y=f(x)=a x^3+b x^2+c x+d$ có đồ thị như hình vẽ dưới đây:
#side([
#set par(spacing: 5mm, leading: 1em)
a) Hàm số đạt cực tiểu tại $x=-1$.

b) Đồ thị hàm số cắt trục $O y$ tại điểm có toạ độ $(0;-1)$.

c) Hàm số nghịch biến trên khoảng $(-infinity;-1)$.

d) $2a+2b+c=1$.
], "cubic")], question-gap: 3mm)
#q(4, [Cho hình lập phương $A B C D dot E F G H$ có cạnh bằng $a$.
#v(3mm)
#side([
#set par(spacing: 5mm, leading: 1em)
a) $arrow(A D)=-arrow(B C)$.

b) $arrow(A D) dot arrow(E G)=2a^2$.

c) $arrow(A B)+arrow(E H)=arrow(A C)$.

d) $abs(arrow(A B)+2arrow(A D)+arrow(A G))=a sqrt(14)$.
], "cube")])
#exam-section("III", [TRẮC NGHIỆM TRẢ LỜI NGẮN], instruction: [Thí sinh trả lời từ câu 1 đến câu 6.])
#q(1, [Một hãng taxi công nghệ áp dụng bảng giá cước mới cho một chuyến đi dài như sau: Giá của km đầu tiên là 12 000 đồng. Kể từ km thứ hai trở đi, giá của mỗi km sau giảm 400 đồng so với giá của km ngay trước đó. Biết rằng cấu trúc giảm giá này chỉ áp dụng tối đa cho 20 km đầu tiên. Hỏi một hành khách đi chuyến xe đó với quãng đường 15 km thì phải trả tổng cộng bao nhiêu nghìn đồng?])
#q(2, [Trong một đợt dã ngoại, một trường học cần thuê xe chở 180 người và 8 tấn hàng. Nơi thuê xe có hai loại xe $A$ và $B$, trong đó xe $A$ có 10 chiếc và xe $B$ có 9 chiếc. Một xe loại $A$ cho thuê với giá 5 triệu đồng và một xe loại $B$ cho thuê với giá 4 triệu đồng. Biết rằng mỗi xe loại $A$ có thể chở tối đa 30 người và $0","8$ tấn hàng, mỗi xe loại $B$ có thể chở tối đa 20 người và $1","6$ tấn hàng. Chi phí thuê xe thấp nhất của chuyến đi là bao nhiêu (triệu đồng)?])
#q(3, [Cho hình chóp $S dot A B C D$ có đáy là hình chữ nhật với $A B=a$, $A D=2a$. Biết $S A=2a$ và $S A$ vuông góc với mặt phẳng đáy. Khoảng cách giữa hai đường thẳng $B D$ và $S C$ bằng $(m a)/n$.

Tính $5m-n$ (Biết $m,n$ là các số tự nhiên; $m/n$ là phân số tối giản).])
#side-question(4, [Một công viên hình tam giác $A B C$ vuông tại $A$, biết $A B=40 "m"$, $A C=20 "m"$ và cạnh $B C$ tiếp giáp với đường nội đô. Trong công viên, người ta xây dựng một vườn hoa được giới hạn bởi đường parabol và hai cạnh $A B,A C$ của công viên, biết parabol có đỉnh là trung điểm của $A B$ và đi qua trung điểm của $A C$ (như hình vẽ). Người ta muốn mở một con đường nhỏ rẽ từ đường nội đô đến vườn hoa, phục vụ cho việc chăm sóc hoa. Để tiết kiệm chi phí, người ta muốn mở con đường nói trên có chiều dài ngắn nhất. Hãy tính chiều dài con đường ngắn nhất đó (đơn vị mét, làm tròn kết quả đến hàng phần trăm).], "park")
#q(5, [Một giỏ hoa treo trong nhà làm bằng ba sợi dây không giãn, mỗi sợi dài $66 ("cm")$. Miếng kê là một miếng gỗ cân đối hình tròn bán kính $22 ("cm")$. Ba sợi dây được thắt một đầu bên trên và đỡ giá gỗ tại ba điểm tạo thành tam giác đều (giả sử mối thắt của ba sợi dây và mối nối của mỗi sợi dây với miếng gỗ không đáng kể). Biết lực chịu đựng của mỗi sợi dây bằng nhau và mỗi sợi chịu không quá $16 "N"$, trọng lượng của miếng giá gỗ là $5","31 "N"$. Tính trọng lượng tối đa của các chậu hoa để dây treo không bị đứt (đơn vị $"N"$, kết quả làm tròn đến hàng phần chục).
#v(7mm)
#align(center, diagram("basket"))
#v(3mm)])
#side-question(6, [Một hình chữ nhật kích thước $8 "cm" times 10 "cm"$ được chia thành các hình vuông đơn vị cạnh $1 "cm"$ bởi các đường thẳng song song các với các cạnh của hình chữ nhật (hình vẽ). Chọn ngẫu nhiên một hình chữ nhật từ lưới hình vuông. Gọi $a,b$ là các kích thước của hình chữ nhật được chọn. Biết xác suất để $a b<a+b$ là $m/n$ ($m,n in NN^*$ và phân số $m/n$ tối giản), tính giá trị của biểu thức $m+n$.], "lattice")
]
