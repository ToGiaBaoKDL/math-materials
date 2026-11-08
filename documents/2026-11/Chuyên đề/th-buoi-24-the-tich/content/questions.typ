#import "/templates/lesson.typ": exercise, lesson-section, theory-box
#import "solutions.typ": solutions
#import "theory.typ": theory
#import "figures.typ": figure, figure-pair
#let questions(variant) = {
 let exercise-base=exercise.with(variant:variant, question-gap:3mm, keep-together:variant=="de-cach", flow-stem:true, keep-solution-start:false, solution-leading:0.92em, solution-title-above:2.5mm, solution-title-below:2.5mm, answer-row-gap:3mm, statement-gap:3mm, writing-line-gap:9mm, writing-heading-gap:0mm, writing-flow-prompt:variant=="de-cach", writing-keep-together:variant=="de-cach", writing-fill-page-end:false)
 // Equal minimum space; fractional remainder is shared by all exercises on the page.
 let item(number, body, source-id:none, solution:[], ..options)=exercise-base(number, body, source-id:source-id,
   writing-lines:3,
   statement-gap:if variant=="dap-an" and source-id=="tu-luyen-24" {1mm} else {3mm},
   solution-title-above:if source-id=="tu-luyen-24" {1mm} else {2.5mm},
   solution-title-below:if source-id=="tu-luyen-24" {1mm} else {2.5mm},
   keep-together:variant=="de-cach" or (variant=="dap-an" and source-id=="tu-luyen-16"),
   solution:[#set par(spacing:if source-id in ("tu-luyen-23","tu-luyen-24") {1mm} else {2mm})
   #solution],
   answer-gap:if source-id in ("bai-hoc-1", "tu-luyen-13", "tu-luyen-16") {1.5mm} else {3.5mm}, ..options)
[
#lesson-section([THỂ TÍCH VẬT THỂ TỪ DIỆN TÍCH MẶT CẮT], number:1)
#theory-box(theory.at("t1"))
#item("1", [
Khi cắt vật thể bởi mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ là $x$, $lr(( 0 ≤ x ≤ 3 ))$ ta được mặt cắt là một hình vuông có cạnh là $sqrt(9 - x ^(2))$ (được mô hình hóa bởi hình vẽ bên dưới). Thể tích của vật thể đó bằng
#if variant!="de-cach" {figure("thiet-dien-vuong.svg")}
], figure-side:if variant=="de-cach" {figure("thiet-dien-vuong.svg",width:82mm)} else {none}, figure-columns:(1fr,82mm), answers:([$171 π$.], [$171$.], [$18 π$.], [$18$.],), statements:(), answer-columns:4, source-id:"bai-hoc-1", solution:solutions.at("bai-hoc-1"))
#item("2", [
Tính thể tích $V$ của phần vật thể giới hạn bởi hai mặt phẳng $x = 0 "," x = 1$, có thiết diện bị cắt bởi mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ $x lr(( 0 ≤ x ≤ 1 ))$ là một tam giác đều có cạnh bằng $x$.
], answers:([$V = frac(12 π, 5)$.], [$V = frac(12, 5)$.], [$V = frac(sqrt(3) π, 12)$.], [$V = frac(sqrt(3), 12)$.],), statements:(), answer-columns:4, source-id:"bai-hoc-2", solution:solutions.at("bai-hoc-2"))
#item("3", [
Tính thể tích $V$ của vật thể nằm giữa hai mặt phẳng $x = 0$ và $x = π$, biết rằng thiết diện của vật thể bị cắt bởi mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ $x$ $lr(( 0 ≤ x ≤ π ))$ là một tam giác đều cạnh $2 sqrt(sin x)$.
], answers:(), statements:(), answer-columns:4, source-id:"bai-hoc-3", solution:solutions.at("bai-hoc-3"))
#lesson-section([THỂ TÍCH KHỐI TRÒN XOAY QUANH TRỤC HOÀNH], number:2, above:if variant=="dap-an" {2mm} else {7mm}, below:if variant=="dap-an" {2mm} else {5mm})
#theory-box(theory.at("t2"))
#item("4", [
Thể tích vật thể tròn xoay khi quay hình phẳng giới hạn bởi các đường $y = sqrt(e ^(x) - x)$, $y = 0$, $x = 1$, $x = 2$ xung quanh trục $O x$ là
], answers:([$π lr(( e ^(2) - e - frac(3, 2) ))$.], [$e ^(2) - e - frac(5, 2)$.], [$π lr(( e ^(2) - e - frac(5, 2) ))$.], [$e ^(2) - e - frac(3, 2)$.],), statements:(), answer-columns:4, source-id:"bai-hoc-4", solution:solutions.at("bai-hoc-4"))
#item("5", [
Cho hình phẳng $lr(( H ))$ giới hạn bởi đồ thị $y = 2 x - x ^(2)$ và trục hoành. Thể tích vật thể tròn xoay sinh ra khi cho $lr(( H ))$ quay quanh trục hoành bằng
], answers:([$frac(16, 15)$.], [$frac(4, 3)$.], [$frac(16 π, 15)$.], [$frac(4 π, 3)$.],), statements:(), answer-columns:4, source-id:"bai-hoc-5", solution:solutions.at("bai-hoc-5"))
#item("6", [
Cho hình phẳng $lr(( H ))$ giới hạn bởi đồ thị hàm số $y = x ^(2) - 4 x$, trục hoành và hai đường thẳng $x = 1$ và $x = 3$. Khối tròn xoay được tạo thành khi quay hình phẳng $lr(( H ))$ quanh trục $O x$ có thể tích là
], answers:([$V = frac(406, 15)$.], [$V = frac(406, 15) π$.], [$V = frac(22, 3) π$.], [$V = frac(512, 15) π$.],), statements:(), answer-columns:4, source-id:"bai-hoc-6", solution:solutions.at("bai-hoc-6"))
#item("7", [
Cho hình phẳng $D$ giới hạn bởi các đường $y = sqrt(x - 1)$, trục hoành và $x = 5$. Thể tích khối tròn xoay tạo thành khi quay $D$ quanh trục $O x$ bằng
], answers:([$frac(15 π, 2)$.], [$frac(15, 2)$.], [$8 π$.], [$8$.],), statements:(), answer-columns:4, source-id:"bai-hoc-7", solution:solutions.at("bai-hoc-7"))
#item("8", [
Khối chỏm cầu có bán kính $R$ và chiều cao $h$ $lr(( 0 < h ≤ R ))$ sinh ra khi quay hình phẳng giới hạn bởi cung tròn có phương trình $y = sqrt(R ^(2) - x ^(2))$, trục hoành và hai đường thẳng $x = R - h$, $x = R$ xung quanh trục $O x$. Tính thể tích của khối chỏm cầu này.
#figure("chom-cau.svg",width:if variant=="dap-an" {84mm} else {auto})
], answers:(), statements:(), answer-columns:4, source-id:"bai-hoc-8", solution:solutions.at("bai-hoc-8"))
#item("9", [
Khối chỏm cầu có bán kính $R = 5$ và chiều cao $h = 1$ sinh ra khi quay hình phẳng giới hạn bởi cung tròn có phương trình $y = sqrt(25 - x ^(2))$, trục hoành và hai đường thẳng $x = 4$, $x = 5$ xung quanh trục $O x$. Xét tính đúng sai của các khẳng định sau:
], answers:(), statements:([a) Khoảng cách từ tâm của khối cầu đến khối chỏm cầu bằng $3$.], [b) Thể tích của khối chỏm cầu $V _(1)$ được tính theo công thức $V _(1) = π integral_(4)^(5) lr(( 25 - x ^(2) )) dif x$.], [c) Thể tích của khối chỏm cầu $V _(1) = frac(14 π, 3)$.], [d) Gọi $V _(2)$ là thể tích của nửa khối cầu có bán kính bằng 5. Tỉ số thể tích $frac(V _(1), V _(2)) = frac(7, 125)$.],), answer-columns:4, source-id:"bai-hoc-9", solution:solutions.at("bai-hoc-9"))
#lesson-section([THỂ TÍCH KHỐI TRÒN XOAY GIỮA HAI ĐỒ THỊ], number:3, above:if variant=="dap-an" {2mm} else {7mm}, below:if variant=="dap-an" {2mm} else {5mm})
#theory-box(theory.at("t3"))
#item("10", [
Thể tích khối tròn xoay khi cho hình phẳng giới hạn bởi parapol (P): $y = x ^(2)$ và đường thẳng d: $y = 2 x$ quay xung quanh trục $O x$ bằng:
], answers:([$π integral_(0)^(2) ( 2 x - x ^(2) ) dif x$.], [$π integral_(0)^(2) ( x ^(2) - 2 x ) ^(2) dif x$.], [$π integral_(0)^(2) 4 x ^(2) dif x + π integral_(0)^(2) x ^(4) dif x$.], [$π integral_(0)^(2) 4 x ^(2) dif x - π integral_(0)^(2) x ^(4) dif x$.],), statements:(), answer-columns:2, source-id:"bai-hoc-10", solution:solutions.at("bai-hoc-10"))
#item("11", [
Cho hình phẳng $lr(( D ))$ được giới hạn bởi các đường $y = x ^(2) + 2 x + 2$; $y = 6 - x$; $y = 2$ và $lr(( D ))$ nằm ngoài Parabol $y = x ^(2) + 2 x + 2$. Khi cho $lr(( D ))$ quay quanh trục $O x$, ta nhận được vật thể tròn xoay có thể tích $V = frac(a π, b)$, trong đó $a "," b$ là các số nguyên dương . Giá trị biểu thức $P = a - 2 b ^(2)$ bằng bao nhiêu.
], answers:(), statements:(), answer-columns:4, source-id:"bai-hoc-11", solution:solutions.at("bai-hoc-11"))
#item("12", [
Cho hình phẳng $lr(( D ))$ được giới hạn bởi hai đường $y = 2 lr(( x ^(2) - 1 ))$; $y = 1 - x ^(2)$. Tính thể tích khối tròn xoay tạo thành do $lr(( D ))$ quay quanh trục $O x$.
], answers:([$frac(64 π, 15)$.], [$frac(32, 15)$.], [$frac(32 π, 15)$.], [$frac(64, 15)$.],), statements:(), answer-columns:4, source-id:"bai-hoc-12", solution:solutions.at("bai-hoc-12"))
#lesson-section([BÀI TẬP TỰ LUYỆN], badge:"BT")
#item("1", [
(Đề Tham Khảo 2025) Cho hàm số $y = f ( x )$ liên tục, nhận giá trị dương trên đoạn $[ a ";" b ]$. Xét hình phẳng $( H )$ giới hạn bởi đồ thị hàm số $y = f ( x )$, trục hoành và hai đường thẳng $x = a$, $x = b$. Khối tròn xoay được tạo thành khi quay hình phẳng $( H )$ quanh trục $O x$ có thể tích là:
], answers:([$V = π integral_(a)^(b) abs(f lr(( x ))) dif x$.], [$V = π ^(2) integral_(a)^(b) f lr(( x )) dif x$.], [$V = π ^(2) integral_(a)^(b) lr([ f lr(( x )) ]) ^(2) dif x$.], [$V = π integral_(a)^(b) lr([ f lr(( x )) ]) ^(2) dif x$.],), statements:(), answer-columns:2, source-id:"tu-luyen-1", solution:solutions.at("tu-luyen-1"))
#item("2", [
(Chuyên Lê Khiết - Quảng Ngãi 2025) Cho một vật thể trong không gian $"Ox" y z$. Gọi $B$ là phần vật thể giới hạn bởi hai mặt phẳng vuông góc với trục $O x$ tại các điểm có hoành độ $x = a ";" x = b$. Một mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ là $x$ cắt vật thể theo mặt cắt có diện tích là $S lr(( x ))$.Giả sử $S lr(( x ))$ là hàm số liên tục trên đoạn $lr([ a ";" b ])$. Khi đó thể tích $V$ của phần vật thể $B$ tính theo công thức
], answers:([$V = π integral_(a)^(b) S lr(( x )) dif x$.], [$V = π integral_(a)^(b) lr([ S lr(( x )) ]) ^(2) dif x$.], [$V = integral_(a)^(b) S lr(( x )) dif x$.], [$V = π ^(2) integral_(a)^(b) S lr(( x )) dif x$.],), statements:(), answer-columns:2, source-id:"tu-luyen-2", solution:solutions.at("tu-luyen-2"))
#item("3", [
(Cụm trường Hưng Yên 2025) Cho hình phẳng $lr(( H ))$ giới hạn bởi các đường $y = x ^(2) + 3 "," y = 0 "," x = 0 "," x = 5$. Gọi $V$ là thể tích của khối tròn xoay được tạo thành khi quay $lr(( H ))$ xung quanh trục $O x$. Mệnh đề nào dưới đây đúng?
], answers:([$V = integral_(0)^(5) lr(( x ^(2) + 3 )) dif x$.], [$V = π integral_(0)^(5) lr(( x ^(2) + 3 )) ^(2) dif x$.], [$V = integral_(0)^(5) lr(( x ^(2) + 3 )) ^(2) dif x$.], [$V = π integral_(0)^(5) lr(( x ^(2) + 3 )) dif x$.],), statements:(), answer-columns:2, source-id:"tu-luyen-3", solution:solutions.at("tu-luyen-3"))
#item("4", [
(THPT Ngô Sĩ Liên - Bắc Giang 2025) Cắt một vật thể bởi hai mặt phẳng vuông góc với trục $O x$ tại $x = 1$ và $x = 2$. Một mặt phẳng tùy ý vuông góc với trục $O x$ tại điểm có hoành độ $x$ ($1 ≤ x ≤ 2$) cắt vật thể đó có diện tích $S lr(( x )) = 2026 x$. Tính thể tích của phần vật thể giới hạn bởi hai mặt phẳng trên.
], answers:([$1518 π$.], [$3039$.], [$3039 π$.], [$3036$.],), statements:(), answer-columns:4, source-id:"tu-luyen-4", solution:solutions.at("tu-luyen-4"))
#item("5", [
Tính thể tích $V$ của phần vật thể giới hạn bởi hai mặt phẳng $x = 1$ và $x = 3 ","$ biết rằng khi cắt vật thể bởi mặt phẳng tùy ý vuông góc với trục $O x$ tại điểm có hoành độ $x$ $( 1 ≤ x ≤ 3 )$ thì được thiết diện là một hình chữ nhật có hai cạnh là $3 x$ và $x ^(2)$.
], answers:(), statements:(), answer-columns:4, source-id:"tu-luyen-5", solution:solutions.at("tu-luyen-5"))
#item("6", [
Cho phần vật thể $lr(( ℑ ))$ giới hạn bởi hai mặt phẳng có phương trình $x = 0$ và $x = 2$. Cắt phần vật thể $lr(( ℑ ))$ bởi mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ $x$ $lr(( 0 ≤ x ≤ 2 ))$, ta được thiết diện là một tam giác đều có độ dài cạnh bằng $x sqrt(2 - x)$. Tính thể tích $V$ của phần vật thể $lr(( ℑ ))$.
], answers:(), statements:(), answer-columns:4, source-id:"tu-luyen-6", solution:solutions.at("tu-luyen-6"))
#item("7", [
Một bình chứa nước có hình dạng như hình sau. Biết rằng khi nước trong bình có chiều cao $x$ (dm) ($0 ≤ x ≤ 4$) thì mặt nước là hình vuông có cạnh $sqrt(2 + frac(x ^(2), 4))$ (dm). Tính dung tích của bình.
#figure("binh-mat-cat-vuong.svg")
], answers:(), statements:(), answer-columns:4, source-id:"tu-luyen-7", solution:solutions.at("tu-luyen-7"))
#item("8", [
Cho hình phẳng $lr(( H ))$ được giới hạn bởi đường cong $y = sqrt(m ^(2) - x ^(2))$ ($m$ là tham số khác $0$) và trục hoành. Khi $lr(( H ))$ quay xung quanh trục hoành được khối tròn xoay có thể tích $V$. Có bao nhiêu giá trị nguyên của $m$ để $V < 1000 π$.
], answers:(), statements:(), answer-columns:4, source-id:"tu-luyen-8", solution:solutions.at("tu-luyen-8"))
#item("9", [
Cho hình phẳng giới hạn bởi đường cong $y = sqrt(x + 2)$ và hai trục toạ độ. Thể tích khối tròn xoay thu được khi quay hình phẳng đó quanh trục $O x$ bằng
], answers:([$frac(4 sqrt(2), 3) .$], [$2 .$], [$2 π .$], [$frac(4 sqrt(2), 3) π .$],), statements:(), answer-columns:4, source-id:"tu-luyen-9", solution:solutions.at("tu-luyen-9"))
#item("10", [
Cho hình phẳng $lr(( D ))$ được giới hạn bởi các đường $x = 0 "," x = π "," y = 0$ và $y = - sin x$. Thể tích $V$ của khối tròn xoay tạo thành khi quay $lr(( D ))$ xung quanh trục $O x$ được tính theo công thức
], answers:([$V = π integral_(0)^(π) abs(sin x) dif x$.], [$V = π integral_(0)^(π) sin ^(2) x dif x$.], [$V = π abs(integral_(0)^(π) lr(( - sin x )) dif x)$.], [$V = integral_(0)^(π) sin ^(2) x dif x$.],), statements:(), answer-columns:2, source-id:"tu-luyen-10", solution:solutions.at("tu-luyen-10"))
#item("11", [
Cho hình phẳng $lr(( H ))$ giới hạn bởi đồ thị hàm số $y = e ^(x)$, các đường thẳng $x = 0$, $x = ln 3$ và trục hoành. Thể tích khối tròn xoay sinh bởi $lr(( H ))$ khi quay quanh trục hoành là
], answers:([$2 π$.], [$4 π$.], [$4$.], [$π$.],), statements:(), answer-columns:4, source-id:"tu-luyen-11", solution:solutions.at("tu-luyen-11"))
#item("12", [
Cho hình phẳng $lr(( H ))$ được giới hạn bởi hai đồ thị $y = x ^(2) + x$ và $y = 2 x$. Quay hình $lr(( H ))$ quanh trục hoành, tính thể tích vật thể thu được
], answers:([$frac(3 π, 10)$.], [$frac(5 π, 6)$.], [$frac(π, 6)$.], [$frac(5, 6)$],), statements:(), answer-columns:4, source-id:"tu-luyen-12", solution:solutions.at("tu-luyen-12"))
#item("13", [
Cho hình phẳng $lr(( H ))$ được giới hạn bởi đồ thị của hàm số $y = x ^(2)$ và đồ thị của hàm số $y = sqrt(x)$ (tham khảo hình vẽ). Thể tích của khối tròn xoay thu được khi quay $lr(( H ))$ quanh trục $O x$ bằng
#figure("parabol-can-bac-hai.svg",width:if variant=="dap-an" {64mm} else {auto})
], answers:([$V = frac(9 π, 10)$.], [$V = frac(3 π, 10)$.], [$V = frac(π, 10)$.], [$V = frac(7 π, 10)$.],), statements:(), answer-columns:4, source-id:"tu-luyen-13", solution:solutions.at("tu-luyen-13"))
#item("14", [
Thể tích khối tròn xoay thu được khi quay hình phẳng giới hạn bởi hai đường $y = abs(x ^(2) - 3 x + 2)$ và $y = 0$ quanh trục $O x$ bằng
], answers:([$frac(π ^(2), 30)$.], [$frac(π, 6)$.], [$frac(π, 30)$.], [$frac(π ^(2), 6)$.],), statements:(), answer-columns:4, source-id:"tu-luyen-14", solution:solutions.at("tu-luyen-14"))
#item("15", [
Cho hình phẳng $lr(( H ))$ giới hạn bởi $y = 2 x - x ^(2) "," y = 0$. Tính thể tích của khối tròn xoay thu được khi quay $lr(( H ))$ xung quanh trục $O x$ ta được $V = π lr(( frac(a, b) + 1 ))$ với $a "," b$ là các số tự nhiên, $frac(a, b)$ là phân số tối giản. Khi đó
], answers:([$a b = 16$.], [$a b = 12$.], [$a b = 15$.], [$a b = 18$.],), statements:(), answer-columns:4, source-id:"tu-luyen-15", solution:solutions.at("tu-luyen-15"))
#item("16", [
Cho hình phẳng giới hạn bởi đồ thị hàm số $y = x ^(2)$ và đường thẳng $y = 4$ quay quanh trục $O x$. Thể tích khối tròn xoay sinh ra bằng:
#figure("parabol-va-duong-thang.svg")
], answers:([$frac(64 π, 5)$.], [$frac(128 π, 5)$.], [$frac(256 π, 5)$.], [$frac(152 π, 5)$.],), statements:(), answer-columns:4, source-id:"tu-luyen-16", solution:solutions.at("tu-luyen-16"))
#item("17", [
Gọi $V$ là thể tích khối tròn xoay tạo thành khi quay hình phẳng giới hạn bởi các đường $y = sqrt(x) ","$ $y = 0$ và $x = 4$ quanh trục $O x$. Đường thẳng $x = a lr(( 0 < a < 4 ))$ cắt đồ thị hàm số $y = sqrt(x)$ tại $M$ (xem hình vẽ sau). Gọi $V _(1)$ là thể tích khối tròn xoay tạo thành khi quay tam giác $O M H$ quanh trục $O x$. Biết rằng $V = 2 V _(1)$. Khi đó giá trị của $a$ là bao nhiêu?
#figure("mien-tam-giac.svg")
], answers:(), statements:(), answer-columns:4, source-id:"tu-luyen-17", solution:solutions.at("tu-luyen-17"))
#item("18", [
Cho các nửa đường tròn như hình vẽ sau, trong đó đường kính của nửa đường tròn lớn gấp đôi đường kính của nửa đường tròn nhỏ. Biết rằng nửa hình tròn đường kính $A B$ có diện tích là $32 π$ và góc $hat(B A C) = 30 °$. Tính thể tích vật thể tròn xoay được tạo thành khi quay hình phẳng $lr(( H ))$ (phần tô đậm) xung quanh đường thẳng $A B$.
#figure("nua-duong-tron.svg")
], answers:(), statements:(), answer-columns:4, source-id:"tu-luyen-18", solution:solutions.at("tu-luyen-18"))
#item("19", [
Một hình cầu có bán kính 6 dm, người ta cắt bỏ hai phần bằng hai mặt phẳng song song và cùng vuông góc với đường kính để làm mặt xung quanh của một chiếc lu chứa nước (như hình vẽ). Tính thể tích $V$(lít) mà chiếc lu chứa được biết mặt phẳng cách tâm mặt cầu 4 dm (làm tròn đến hàng đơn vị).
#figure-pair("mat-cat-lu.svg", "mat-cat-cau.svg",height:if variant=="de" {56mm} else if variant=="dap-an" {50mm} else {78mm})
], answers:(), statements:(), answer-columns:4, source-id:"tu-luyen-19", solution:solutions.at("tu-luyen-19"))
#item("20", [
Khối chỏm cầu có bán kính $R = 3$ và chiều cao $h = 1$ sinh ra khi quay hình phẳng giới hạn bởi cung tròn có phương trình $y = sqrt(9 - x ^(2))$, trục hoành và hai đường thẳng $x = 2$, $x = 3$ xung quanh trục $O x$. Tính thể tích khối chỏm cầu này.
], answers:([$frac(8 π, 3)$.], [$2 π$.], [$frac(10 π, 3)$.], [$π$.],), statements:(), answer-columns:4, source-id:"tu-luyen-20", solution:solutions.at("tu-luyen-20"))
#item("21", [
Cho đồ thị hàm số $y = "e" ^(x)$ và hình được tô màu như dưới.
#figure("do-thi-ham-mu.svg")
], answers:(), statements:([a) Hình phẳng được tô màu giới hạn bởi $3$ đường], [b) Diện tích hình phẳng được tính bởi công thức $S = integral_(- 1)^(1) lr(( e ^(x) )) ^(2) dif x$], [c) Diện tích hình phẳng $S = e - frac(1, e)$], [d) Thể tích khối tròn xoay khi quay hình phẳng đó quanh trục $O x$ là $V = frac(1, 2) π lr(( e ^(2) - frac(1, e ^(2)) ))$],), answer-columns:4, source-id:"tu-luyen-21", solution:solutions.at("tu-luyen-21"))
#item("22", [
Cho khối chóp đều có đáy là hình vuông cạnh $L$ và chiều cao là $h$. Chọn trục $O x$ sao cho gốc $O$ trùng với đỉnh của khối chóp và trục đi qua tâm của đáy. (như hình dưới).
#figure("thiet-dien-hinh-chop.svg",width:if variant=="de" {90mm} else if variant=="dap-an" {78mm} else {auto})
], answers:(), statements:([a) Đáy của khối chóp nằm trên mặt phẳng song song với $O x$.], [b) Mỗi mặt phẳng vuông góc với trục $O x$ tại điểm có hoành độ bằng $x lr(( 0 ≤ x ≤ h ))$, cắt khối chóp theo mặt cắt là hình vuông cạnh $a$.], [c) Diện tích mặt cắt là $S lr(( x )) = frac(L, h) x ^(2)$.], [d) Thể tích của khối chóp là $V = frac(1, 3) L ^(2) h$.],), answer-columns:4, source-id:"tu-luyen-22", solution:solutions.at("tu-luyen-22"))
#item("23", [
(Sở Khánh Hòa 2025) Cho hai hàm số $f lr(( x )) = frac(x ^(2), 8) - frac(x, 4) + frac(9, 8)$ và $g lr(( x )) = x$.
], answers:(), statements:([a) Hàm số $f lr(( x ))$ có nguyên hàm là $F lr(( x )) = frac(x ^(3), 24) - frac(x ^(2), 8) + frac(9, 8) x + C$ với $C$ là hằng số.], [b) Nếu hàm số $f lr(( x ))$ có nguyên hàm là $F lr(( x ))$ thỏa mãn $F lr(( 3 )) = frac(1, 3)$ thì $F lr(( 1 )) = - 2$.], [c) Diện tích hình phẳng giới hạn bởi đồ thị của hai hàm số $y = f lr(( x ))$, $y = g lr(( x ))$ và hai đường thẳng $x = 0$, $x = 2$ là $"0,08"$ (làm tròn đến hàng phần trăm).], [d) Một món đồ chơi có dạng khối tròn xoay rỗng, mặt ngoài là một mặt tròn xoay sinh ra khi cho một phần đồ thị hàm số $y = frac(x ^(2), 8) - frac(x, 4) + frac(9, 8) lr(( 1 ≤ x ≤ 5 ))$ ($x "," y$ tính theo decimét) quay xung quanh trục hoành và món đồ chơi đó có độ dày không đổi là 0,1 dm (như hình vẽ).
#figure("vo-do-choi.svg",width:if variant=="de" {72mm} else if variant=="dap-an" {80mm} else {auto})
Thể tích của bề dày món đồ chơi đó là $frac(97 π, 75) "dm" ^(3)$.],), answer-columns:4, source-id:"tu-luyen-23", solution:solutions.at("tu-luyen-23"))
#item("24", [
(Cụm Sào Nam - Hồ Nghinh 2025) Xét tính đúng sai của các mệnh đề sau:
], answers:(), statements:([a) Hàm số $y = frac(1, x)$ chỉ có nguyên hàm khi $x > 0$.], [b) $integral_(a)^(b) lr(( x ^(2 n) + 1 )) dif x > 0$ với $∀ a "," b ∈ ℝ ";" a < b$ và $∀ n ∈ ℕ$], [c) Tích phân $integral_(a)^(b) f lr(( x )) dif x$ luôn cho kết quả bằng diện tích hình phẳng giới hạn bởi đồ thị hàm số $y = f lr(( x ))$, trục hoành và hai đường thẳng $x = a ";" x = b$ với $a < b$.], [d) Cho hai khối cầu lần lượt có bán kính $R _(1) = 3$ và $R _(2) = 2$, khoáng cách giữa hai tâm khối cầu là $d = 4$. Khi đó thể tích phần giao của hai khối cầu là $V ∈ lr([ 3 ";" 4 ])$.],), answer-columns:4, source-id:"tu-luyen-24", solution:solutions.at("tu-luyen-24"))
]
}
