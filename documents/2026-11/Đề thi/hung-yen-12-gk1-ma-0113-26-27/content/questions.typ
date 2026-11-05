#import "/templates/exam.typ": exam-question, exam-table
#import "/templates/exam-lesson.typ": exam-section
#let q=exam-question.with(keep-together:true,question-gap:4mm,statement-gap:2.5mm,question-label-color:rgb("#B00012"),question-tag:none)
#let fig(name,width)=block(width:100%,breakable:false,above:6mm,below:4mm,align(center,image("../figures/"+name,width:width)))
#let questions()=[
#exam-section("I",[TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN],instruction:[Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.])

#q(1,[Cho khối chóp $S.A B C$ có chiều cao bằng $3$, đáy là tam giác $A B C$ có diện tích bằng $20$. Thể tích khối chóp $S.A B C$ bằng],answers:([$60$.],[$20$.],[$10$.],[$30$.]))

#q(2,[Cho hàm số bậc ba $y=a x^3+b x^2+c x+d$ $(a != 0)$ có đồ thị như hình vẽ. Hàm số nghịch biến trên khoảng nào trong các khoảng dưới đây?],
figure:image("../figures/cubic-extrema.svg",width:58mm),columns:1,
answers:([$(1;3)$.],[$(-2;2)$.],[$(3;+infinity)$.],[$(-infinity;1)$.]))

#q(3,[Cho hàm số $y=f(x)$ có bảng biến thiên như hình vẽ dưới đây.
#fig("cubic-variation.png",118mm)
Điểm cực đại của hàm số đã cho bằng],
answers:([$x=2$.],[$y=5$.],[$x=0$.],[$y=1$.]))

#q(4,[Cặp số nào sau đây là một nghiệm của hệ bất phương trình $cases(x-3y-1>0,2x+y+5>0,x+y+1<0)$?],
answers:([$(0;-2)$.],[$(0;0)$.],[$(1;0)$.],[$(0;2)$.]))

#q(5,[Cho mẫu số liệu ghép nhóm về thống kê điểm số #emph[(thang điểm 20)] của 100 học sinh tham dự kỳ thi học sinh giỏi toán, ta có bảng số liệu sau:
#block(above:4mm,below:3mm)[
#exam-table(columns:(25mm,1fr,1fr,1fr,1fr,1fr,1fr),
header:([Điểm],[$[8;10)$],[$[10;12)$],[$[12;14)$],[$[14;16)$],[$[16;18)$],[$[18;20)$]),
[Số học sinh],[$6$],[$21$],[$30$],[$25$],[$14$],[$4$])
]
Tìm trung vị của mẫu số liệu ghép nhóm trên. #emph[(Kết quả làm tròn đến hàng phần trăm).]],
answers:([$12","18$.],[$12","81$.],[$13","53$.],[$13","35$.]))

#q(6,[Cho hàm số $y=x^3-2x^2-1$. Giá trị $y'(2)$ bằng],
answers:([$15$.],[$-1$.],[$3$.],[$4$.]))

#q(7,[Phương trình $cos x=1$ có tập nghiệm là],columns:2,
answers:([$S={pi+k 2pi | k in ZZ}$.],[$S={frac(pi,2)+k 2pi | k in ZZ}$.],[$S={k 2pi | k in ZZ}$.],[$S={-frac(pi,2)+k 2pi | k in ZZ}$.]))

#q(8,[Gọi $M$, $m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y=frac(x^2+3,x-1)$ trên đoạn $[2;4]$. Giá trị của $M+m$ bằng],
answers:([$frac(37,3)$.],[$13$.],[$5$.],[$frac(40,3)$.]))

#q(9,[Cho hàm số $y=f(x)$ liên tục trên $RR$ và có bảng xét dấu của $f'(x)$ như sau:
#fig("derivative-signs.png",118mm)
Số điểm cực trị của hàm số đã cho là],
answers:([$4$.],[$1$.],[$3$.],[$2$.]))

#q(10,[Cho cấp số cộng $(u_n)$ với $u_1=8$ và công sai $d=5$. Giá trị của $u_2$ bằng],
answers:([$frac(8,5)$.],[$3$.],[$13$.],[$40$.]))

#q(11,[Tổng số đường tiệm cận đứng và tiệm cận ngang của đồ thị hàm số $y=frac(x+2,x^2-9)$ là],
answers:([$2$.],[$3$.],[$1$.],[$4$.]))

#q(12,[Đường cong trong hình vẽ là đồ thị của hàm số nào dưới đây?],
figure:image("../figures/cubic-intercept.svg",width:58mm),columns:1,
answers:([$y=-x^3-3x-1$.],[$y=x^3-3x+1$.],[$y=x^3-3x-1$.],[$y=-x^3+3x+1$.]))

#exam-section("II",[TRẮC NGHIỆM ĐÚNG/SAI],instruction:[Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.])

#q(1,[Trong y học, độ bão hòa oxy trong máu của một bệnh nhân phục hồi theo thời gian $t$ #emph[(tính bằng phút, với $t>=0$)] sau khi tập thể dục cường độ cao được mô hình hóa bằng hàm số mũ $f(t)=98-18e^(-0","4t)$. Biết rằng đạo hàm $f'(t)$ biểu thị tốc độ thay đổi nồng độ oxy tại thời điểm $t$.],
keep-together:false,keep-body:true,statements:(
[Tại thời điểm $t=0$ #emph[(ngay khi vừa dừng tập luyện)], độ bão hòa oxy trong máu của bệnh nhân đạt mức $98%$.],
[Tại thời điểm $t=5$ phút, tốc độ tăng nồng độ oxy của bệnh nhân nhanh hơn so với tại thời điểm $t=2$ phút.],
[Độ bão hòa oxy trong máu của bệnh nhân tăng dần theo thời gian.],
[Tốc độ thay đổi nồng độ oxy của bệnh nhân tại thời điểm $t$ là $f'(t)=7","2e^(-0","4t)$.],
))

#q(2,[Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình vuông cạnh bằng $2a$, cạnh bên $S A$ vuông góc với mặt phẳng đáy $(A B C D)$ và $S A=2a sqrt(3)$ #emph[(tham khảo hình vẽ).]
],figure:image("../figures/square-pyramid.png",width:60mm),keep-together:false,keep-body:true,statements:(
[Góc giữa đường thẳng $S D$ và mặt phẳng $(A B C D)$ bằng $60 degree$.],
[Thể tích khối chóp $S.A D C$ bằng $frac(2a^3 sqrt(3),3)$.],
[Khoảng cách giữa hai đường thẳng $S A$ và $C D$ bằng $4a$.],
[Khoảng cách từ điểm $S$ đến mặt phẳng $(A B C D)$ bằng $2a sqrt(3)$.],
))

#q(3,[Lớp 11A có 45 học sinh, trong đó có 28 bạn thích học môn Tiếng Anh, 20 bạn thích học môn Tin học và 10 bạn thích học cả hai môn này. Chọn ngẫu nhiên một học sinh trong lớp.],
keep-together:false,keep-body:true,statements:(
[Xác suất để học sinh được chọn thích học cả môn Tiếng Anh và môn Tin học là $frac(2,9)$.],
[Xác suất để học sinh được chọn thích học ít nhất một trong hai môn Tiếng Anh hoặc Tin học là $frac(38,45)$.],
[Xác suất để học sinh được chọn không thích học môn Tiếng Anh và cũng không thích môn Tin học là $frac(8,45)$.],
[Xác suất để học sinh được chọn thích học môn Tiếng Anh là $frac(28,45)$.],
))

#q(4,[Cho hàm số $y=frac(x^2-4x+5,x-3)$.],
keep-together:false,keep-body:true,statements:(
[Hàm số đồng biến trên các khoảng $(-infinity;2)$ và $(4;+infinity)$.],
[Gọi $A$, $B$ là hai điểm cực trị của đồ thị hàm số. Diện tích tam giác $O A B$ bằng $frac(5,2)$ #emph[(đơn vị diện tích, với $O$ là gốc tọa độ).]],
[Đường thẳng đi qua hai điểm cực trị của đồ thị hàm số có phương trình $y=2x-4$.],
[Hàm số có giá trị cực đại lớn hơn giá trị cực tiểu.],
))

#exam-section("III",[TRẮC NGHIỆM TRẢ LỜI NGẮN],instruction:[Thí sinh trả lời từ câu 1 đến câu 6.])

#q(1,[Một xưởng sản xuất dự định sản xuất không quá 250 sản phẩm. Nếu xưởng sản xuất $x$ sản phẩm $(x in ZZ;1<=x<=250)$ thì doanh thu khi bán hết số sản phẩm đó là $F(x)=-3x^2+1800x$ (nghìn đồng), chi phí sản xuất bình quân cho một sản phẩm là $G(x)=2x^2-120x+2300+frac(16000,x)$ (nghìn đồng). Khi đó xưởng sản xuất đạt được lợi nhuận lớn nhất là bao nhiêu triệu đồng #emph[(Không làm tròn kết quả phép tính trung gian, chỉ làm tròn kết quả cuối cùng đến hàng đơn vị)]?])

#q(2,[Một trung tâm logistics lắp đặt hệ thống cảm biến thông minh để giám sát nhà kho. Trong kho có 15 vị trí chờ được thiết kế sẵn trên trần nhà, sắp xếp thành một lưới gồm 5 hàng ngang và 3 hàng dọc #emph[(khoảng cách giữa các hàng kề nhau và các cột kề nhau là bằng nhau)]. Kỹ sư cần chọn ra 3 vị trí trong số 15 vị trí này để lắp đặt ba cảm biến định vị sao cho ba vị trí là ba đỉnh của một tam giác #emph[(vùng giám sát chỉ được thiết lập tối ưu khi ba cảm biến này tạo thành ba đỉnh của một tam giác)] #emph[(tham khảo hình vẽ)]. Kỹ sư có bao nhiêu cách lựa chọn ba vị trí lắp đặt thỏa mãn yêu cầu trên?
#fig("sensor-grid.svg",25mm)
],keep-together:false,keep-body:false)

#q(3,[Một cơ sở sản xuất bánh mì cung cấp sản phẩm cho các cửa hàng ăn sáng. Mỗi ngày, cơ sở sử dụng tối đa 18 kg thịt và 11 kg rau để sản xuất hai loại: bánh mì đặc biệt và bánh mì thường. Để sản xuất một chiếc bánh mì đặc biệt cần 150 g thịt và 80 g rau, lợi nhuận thu được là 15000 đồng; để sản xuất một chiếc bánh mì thường cần 100 g thịt và 100 g rau, lợi nhuận thu được là 12000 đồng. Biết rằng toàn bộ số bánh mì sản xuất ra đều được tiêu thụ hết trong ngày và số bánh mì mỗi loại được sản xuất là số nguyên không âm. Hỏi lợi nhuận lớn nhất mà cơ sở có thể thu được trong một ngày là bao nhiêu triệu đồng?],keep-together:false,keep-body:true)

#q(4,[Cho hàm số $y=a x^3+b x^2+c x+d$ có đồ thị $(C)$. Biết $A(-1;11)$ và $B(3;-21)$ là hai điểm cực trị của đồ thị $(C)$. Tính giá trị của biểu thức $P=a+b+c+d$.])

#q(5,[Từ tập $S={1;2;...;55}$ gồm 55 số tự nhiên liên tiếp, người ta chọn ra 28 số tự nhiên phân biệt và điền vào 28 ô vuông đơn vị như hình bên thỏa mãn đồng thời bốn điều kiện sau:
#list(
[Mỗi ô vuông được điền đúng một số và mỗi số được chọn chỉ được sử dụng đúng một lần;],
[Mọi số ở một hàng đều nhỏ hơn mọi số ở các hàng phía dưới;],
[Trong mỗi hàng, các số tăng dần từ trái sang phải;],
[Các số điền vào các ô $A$, $B$, $C$, $D$, $E$, $F$, $G$ theo thứ tự đó lập thành một cấp số cộng.],
)
Gọi $T$ là số cách điền vào 28 ô số thỏa mãn các điều kiện trên. Giá trị của $log(T)$ bằng bao nhiêu? #emph[(kết quả làm tròn đến hàng phần trăm)]
],figure:image("../figures/number-staircase.svg",width:46mm),keep-together:false,keep-body:false)

#q(6,[Cho hình lăng trụ đứng $A B C.A' B' C'$ có đáy $A B C$ là tam giác vuông cân tại $A$, $B C=20sqrt(2)$, cạnh bên $A A'=15$. Khoảng cách giữa hai đường thẳng $A B$ và $A' C$ bằng bao nhiêu?])
]
