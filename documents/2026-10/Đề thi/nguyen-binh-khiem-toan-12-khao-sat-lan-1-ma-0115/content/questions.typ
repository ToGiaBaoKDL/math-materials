#import "/templates/exam.typ": exam-question, exam-section, exam-figure as fig, exam-table
#import "/templates/graphs.typ": graph, variation
#import "../figures.typ": derivative, hopper, shaded-square
#import "solutions.typ": multiple, true-false, short
#let questions(variant, ending: none) = {
 let q(number,body,..args) = exam-question(number,body,variant:variant,solution:multiple.at(str(number)),..args)
 exam-section("I",[Câu trắc nghiệm nhiều phương án lựa chọn.],instruction:[Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.])
 q(1,[Cho hàm số $f(x)$ có bảng biến thiên như sau:
 #fig(variation(([$-infinity$],[$-2$],[$1$],[$+infinity$]),([$+$],[$-$],[$+$]),([$-infinity$],[$0$],[$-3$],[$+infinity$]),(0,1,0,1)))
 Hàm số đã cho nghịch biến trong khoảng nào dưới đây?],answers:([$(-2;1)$],[$(-infinity;-2)$],[$(1;+infinity)$],[$(-3;0)$]))
 q(2,[Giá trị lớn nhất của hàm số $y=x^3-3x^2-9x+5$ trên $[1;5]$ là:],answers:([$-6$],[$10$],[$22$],[$15$]))
 q(3,[Khảo sát thời gian chạy bộ trong một ngày của một số học sinh khối 11 thu được mẫu số liệu ghép nhóm sau:
 #fig(exam-table(columns:(auto,1fr,1fr,1fr,1fr,1fr),header:([Thời gian (phút)],[$[0;20)$],[$[20;40)$],[$[40;60)$],[$[60;80)$],[$[80;100)$]),[Số học sinh],[5],[9],[12],[10],[6]))
 Nhóm chứa tứ phân vị thứ nhất là:],answers:([$[20;40)$],[$[40;60)$],[$[0;20)$],[$[60;80)$]))
 q(4,[Hàm số $y=x^n$ ($n in NN^*$) có đạo hàm $y'$ trên $RR$ bằng:],answers:([$n$],[$x^(n-1)$],[$n x^(n-1)$],[$n x^n$]))
 q(5,[Cho cấp số cộng $(u_n)$ có $u_1=4$ và công sai $d=-3$. Giá trị $u_5$ bằng:],answers:([$19$],[$16$],[$-11$],[$-8$]))
 q(6,[Hệ bất phương trình nào dưới đây là hệ bất phương trình bậc nhất hai ẩn?],answers:([$cases(y>=0,x+y z>=-1)$],[$cases(x^2+y^2>=0,x+2y<4)$],[$cases(x+z>=0,x-y< -1)$],[$cases(x>=0,x+y<1)$]))
 q(7,[Cho cấp số nhân $(u_n)$ với $u_1=-1/2$, $u_7=-32$. Công bội của cấp số nhân đã cho bằng:],answers:([$q=plus.minus 1$],[$q=plus.minus 4$],[$q=plus.minus 2$],[$q=plus.minus 1/2$]))
 q(8,[Cho hàm số $y=f(x)$ có đồ thị như hình vẽ bên dưới:
 #fig(graph(x=>x*x*x - 3*x,xrange:(-2.3,2.3),yrange:(-3,3),xticks:(-1,1),yticks:(-2,2),guides:((-1,2),(1,-2))),size:if variant=="dap-an" {88%} else {100%})
 Hàm số đã cho đạt cực đại tại:],answers:([$x=-2$],[$x=-1$],[$x=1$],[$x=2$]))
 q(9,[Cho hàm số $y=f(x)$ liên tục trên $[-1;4]$ và có đồ thị như hình vẽ. Hiệu của giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y=f(x)$ trên đoạn $[-1;4]$ bằng:
 #fig(graph(x=>if x < -1 or x > 4 {100} else if x<=3 {(x - 1)*(x - 1) - 1} else {-3*x+12},xrange:(-1.7,4.6),yrange:(-1.8,3.8),xticks:(-1,1,3,4),yticks:(-1,3),guides:((-1,3),(1,-1),(3,3))))],answers:([$4$],[$3$],[$-1$],[$2$]))
 q(10,[Trong hệ trục tọa độ $(O;arrow(i);arrow(j))$, tọa độ của vectơ $arrow(u)=arrow(i)+arrow(j)$ là:],answers:([$(1;-1)$],[$(0;1)$],[$(-1;1)$],[$(1;1)$]))
 q(11,[Cho hàm số $y=f(x)$ có đạo hàm trên $RR$ và $f'(x)$ có đồ thị như hình vẽ bên dưới:
 #fig(derivative())
 Hàm số đã cho đồng biến trên khoảng nào dưới đây?],answers:([$(2;+infinity)$],[$(-1;1)$],[$(1;+infinity)$],[$(-2;+infinity)$]))
 q(12,[Giá trị nhỏ nhất của hàm số $y=x^2+2/x$ với $x>0$ bằng:],answers:([$3$],[$1$],[$4$],[$2$]))
 exam-section("II",[Câu trắc nghiệm đúng sai.],instruction:[Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.])
 let q(number,body,..args) = exam-question(number,body,variant:variant,solution:true-false.at(str(number)),writing-lines:10,..args)
 q(1,[Đội thanh niên tình nguyện của một trường THPT gồm 4 học sinh khối 12, 5 học sinh khối 11, 6 học sinh khối 10. Giáo viên cần chọn 6 học sinh đi làm nhiệm vụ.],statements:([Số phần tử của không gian mẫu $n(Omega)=C_15^6$.],[Xác suất để chọn được 6 học sinh cùng khối là $1/5005$.],[Xác suất để chọn được nhiều nhất 2 học sinh khối 10 là $69/385$.],[Xác suất để chọn được 6 học sinh trong đó có đủ 3 khối là $850/1001$.]))
 q(2,[Người ta cần làm một khay chứa thóc cho máy xát gạo có dạng hình chóp đều bằng cách cắt mảnh tôn hình vuông cạnh $1","5$ m theo các tam giác cân $A E B$, $B F C$, $C G D$, $D H A$ và sau đó gò các tam giác $A E H$, $B E F$, $C F G$, $D G H$ sao cho bốn đỉnh $A,B,C,D$ trùng nhau tạo thành khối chóp. Đặt $H G=x$.
 #fig(hopper())],statements:([Khối chóp thu được là khối tứ diện đều.],[Diện tích đáy của khối chóp thu được là $S=x^2$.],[Chiều cao của khối chóp thu được là $h=sqrt(9/8-(3x)/(2sqrt(2)))$.],[Khối chóp thu được có thể tích lớn nhất khi $x=sqrt(2)/2$.]))
 q(3,[Cho hàm số $f(x)=x^3-3x+m$, với $m$ là tham số.],statements:([Hàm số nghịch biến trên khoảng $(-1;1)$.],[Hàm số có hai điểm cực trị.],[Giá trị lớn nhất của hàm số trên đoạn $[0;2]$ bằng $m$.],[Gọi $S$ là tập tất cả các giá trị của tham số $m$ sao cho giá trị lớn nhất của hàm số $y=|f(x)|$ trên đoạn $[0;2]$ bằng 3. Khi đó $S$ có một phần tử.]))
 q(4,[Cho hàm số $y=f(x)$ có đạo hàm trên $RR$ và đạo hàm $f'(x)=a x^3+b x^2+c x+d$ là hàm số bậc ba có đồ thị như hình sau:
 #fig(derivative())],statements:([Hàm số $y=f(x)$ nghịch biến trên khoảng $(-1;1)$.],[Hàm số $y=f(x)$ có hai điểm cực trị.],[Hàm số $y=f(x)$ đạt cực đại tại $x=-1$.],[Giá trị lớn nhất của hàm số $f'(x)$ trên đoạn $[1;5]$ là 108.]))
 exam-section("III",[Câu trắc nghiệm trả lời ngắn.],instruction:[Thí sinh trả lời từ câu 1 đến câu 6.])
 let q(number,body,..args) = exam-question(number,body,variant:variant,solution:short.at(str(number)),writing-lines:10,..args)
 q(1,[Biết đồ thị hàm số $y=x^3-3x^2-9x-1$ có hai điểm cực trị $A$ và $B$. Phương trình đường thẳng $A B$ là $y=a x+b$ ($a,b in RR$). Tính tổng $a+b$.])
 q(2,[Cho hình vuông $A B C D$ có cạnh bằng 4, chính giữa có một hình vuông đồng tâm với $A B C D$. Biết rằng bốn tam giác là bốn tam giác cân. Hỏi tổng diện tích của hình vuông ở giữa và bốn tam giác cân có giá trị nhỏ nhất bằng bao nhiêu? (Kết quả làm tròn đến chữ số thập phân thứ 2).
 #fig(shaded-square())])
 q(3,[Một bệnh truyền nhiễm có xác suất lây bệnh là $0","75$ nếu tiếp xúc với người bệnh mà không đeo khẩu trang và là $0","05$ nếu tiếp xúc với người bệnh mà có đeo khẩu trang. Ông X tiếp xúc với người bệnh hai lần, trong đó có một lần không đeo khẩu trang và một lần có đeo khẩu trang. Xác suất ông X bị bệnh do lây từ người bệnh đã tiếp xúc là bao nhiêu? (Kết quả làm tròn đến hàng phần trăm).])
 q(4,[Đồ thị hàm số $y=f(x)$ đối xứng với đồ thị hàm số $y=a^x$ ($a>0,a != 1$) qua điểm $I(1;1)$. Giá trị của biểu thức $T=-f(2+log_a 1/2029)$ bằng bao nhiêu?])
 q(5,[Cho hàm số $y=x^3-2x^2+a x+b$, ($a,b in RR$) có đồ thị $(C)$. Biết đồ thị $(C)$ có điểm cực trị là $A(1;3)$. Tính giá trị của $P=4a+b$.])
 q(6,[Một người bán nước giải khát đang có 24 g bột cam, 9 lít nước và 210 g đường để pha chế hai loại nước cam A và B. Để pha chế 1 lít nước cam loại A cần 30 g đường, 1 lít nước và 1 g bột cam, để pha chế 1 lít nước cam loại B cần 10 g đường, 1 lít nước và 4 g bột cam. Mỗi lít nước cam loại A bán được 60 nghìn đồng, mỗi lít nước cam loại B bán được 80 nghìn đồng. Số tiền (nghìn đồng) nhiều nhất mà người đó thu được bằng bao nhiêu?], ending: ending)
}
