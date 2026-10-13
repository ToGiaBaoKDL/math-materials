#import "/templates/exam.typ": exam-question, exam-section, exam-figure as fig
#import "/templates/graphs.typ": graph, variation
#import "../figures.typ": window, tank, spheres, led, pyramid
#let questions(variant, ending: none) = {
 let q = exam-question.with(variant: variant)
 exam-section("I", [Câu trắc nghiệm nhiều phương án lựa chọn.], instruction: [(3 điểm) Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.])
 q(1, [Đường cong dưới đây là đồ thị của hàm số nào
 #fig(graph(x => (x*x - 3*x+6)/(x - 1), xrange:(-5,7),yrange:(-8,7),breaks:(1,),xticks:(-4,-2,-1,1,2,4,6),yticks:(-6,-4,-2,2,4),guides:((-3,-6),(-1,-5),(3,3),(5,4)),asymptotes:(((1,-8),(1,7)),((-5,-7),(7,5))),width:68mm,height:82mm,asymptote-stroke:0.7pt+black,y-label-side:left))],
 answers:([$y=(x^2 - 3x+6)/(x - 1)$],[$y=(2x+3)/(x - 1)$],[$y=(x^2-x+3)/(x - 1)$],[$y=-x^3+x^2 - 2x+1$]))
 q(2,[Phương trình đường thẳng đi qua hai điểm cực trị của đồ thị hàm số $y=(x^2 - 3x+6)/(x - 2)$ là],answers:([$y=2x - 3$],[$y=-2x+3$],[$y=2x+3$],[$y=x - 1$]))
 q(3,[Cho hàm số $y=f(x)$ có bảng biến thiên trên nửa khoảng $[-5;7)$ như sau:
 #fig(variation(([$-5$],[$1$],[$7$]),([$-$],[$+$]),([$6$],[$2$],[$9$]),(1,0,1),width:80mm,closed-right:true))
 Mệnh đề nào dưới đây đúng?],answers:([$min_([-5;7)) f(x)=6$],[$max_([-5;7)) f(x)=9$],[$min_([-5;7)) f(x)=2$],[$max_([-5;7)) f(x)=6$]))
 q(4,[Cho hàm số bậc bốn $y=f(x)$ có đồ thị là đường cong như hình bên.
 #fig(graph(x => x*x*x*x - 2*x*x - 1,xrange:(-2.2,2.2),yrange:(-2.5,2.2),xticks:(-2,-1,1,2),yticks:(-2,-1,1),asymptotes:(((-2.2,-0.5),(2.2,-0.5)),),origin-offset:(-1.5mm,-1.5mm),y-label-offsets:("-1":(1.5mm,3mm))))
 Số nghiệm của phương trình $f(x)=-1/2$ là],answers:([$3$],[$2$],[$x=1$],[$4$]))
 q(5,[Giá trị lớn nhất của hàm số $f(x)=-x^3+3x$ trên đoạn $[0;2]$ bằng],answers:([$0$],[$-2$],[$4$],[$2$]))
 q(6,[Cho hàm số $y=f(x)$ có bảng biến thiên như sau
 #fig(variation(([$-infinity$],[$-2$],[$0$],[$2$],[$+infinity$]),([$-$],[$+$],[$-$],[$+$]),([$+infinity$],[$-1$],[$1$],[$-1$],[$+infinity$]),(1,0,1,0,1)))
 Hàm số đã cho nghịch biến trên khoảng nào dưới đây?],answers:([$(-2;0)$],[$(-infinity;-2)$],[$(0;+infinity)$],[$(-1;1)$]))
 q(7,[Số đường tiệm cận của đồ thị hàm số $y=(2x - 1)/(x+1)$ là],answers:([$1$],[$3$],[$2$],[$4$]))
 q(8,[Tọa độ tâm đối xứng $I$ của đồ thị hàm số $y=(3x - 1)/(2x+3)$ là],answers:([$(-3/2;3/2)$],[$(-1/3;3/2)$],[$(1;3)$],[$(3/2;-3/2)$]))
 q(9,[Hàm số $y=x+4/x$ nghịch biến trên khoảng],answers:([$(-2;2)$],[$(-2;0)$],[$(-infinity;-2)$],[$(2;+infinity)$]))
 q(10,[Cho hàm số $y=f(x)$ có bảng biến thiên như sau
 #fig(variation(([$-infinity$],[$-1$],[$2$],[$+infinity$]),([$+$],[$-$],[$+$]),([$-infinity$],[$1$],[$-2$],[$+infinity$]),(0,1,0,1)))
 Giá trị cực tiểu của hàm số đã cho bằng],answers:([$-2$],[$-1$],[$1$],[$2$]))
 q(11,[Cho hàm số $y=a x^3+b x^2+c x+d$ có đồ thị như hình vẽ bên
 #fig(graph(x => -x*x*x+1.5*x*x+2*x - 1,xrange:(-2.1,3),yrange:(-2.5,4)))
 Mệnh đề nào sau đây đúng],answers:([$a>0;b<0;c<0;d>0$],[$a<0;b>0;c<0;d<0$],[$a<0;b<0;c>0;d<0$],[$a<0;b>0;c>0;d<0$]),columns:2)
 let option-graph = graph.with(width:65mm,height:65mm,origin-offset:(1.5mm,-2.5mm))
 q(12,[Hàm số $y=(2+2x)/(2+x)$ có đồ thị là hình vẽ nào sau đây? Hãy chọn câu trả lời đúng.],columns:2,keep-together:true,
 answers:(
 [#option-graph(x=>2 - 1/(x+1),xrange:(-4,4),yrange:(-2,6),breaks:(-1,),xticks:(-2,-1,1),yticks:(1,2),asymptotes:(((-1,-2),(-1,6)),((-4,2),(4,2))))],
 [#option-graph(x=>2 - 2/(x+2),xrange:(-6,3),yrange:(-2,6),breaks:(-2,),xticks:(-3,-2,-1,1),yticks:(1,2,4),guides:((-3,4),),asymptotes:(((-2,-2),(-2,6)),((-6,2),(3,2))))],
 [#option-graph(x=>if x < -2 {2 - 1/(x+2)} else {2 - 2/(x+2)},xrange:(-6,2),yrange:(-2,6),breaks:(-2,),xticks:(-3,-2,-1,1),yticks:(1,2,3),guides:((-3,3),),asymptotes:(((-2,-2),(-2,6)),((-6,2),(2,2))))],
 [#option-graph(x=>1+1/(x+1),xrange:(-5,5),yrange:(-3,5),breaks:(-1,),xticks:(-2,-1,1),yticks:(1,2),asymptotes:(((-1,-3),(-1,5)),((-5,1),(5,1))))]))
 exam-section("II",[Câu trắc nghiệm đúng sai.],instruction:[(4 điểm) Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.])
 q(1,[Một công ty có sản xuất một loại sản phẩm với chi phí để sản xuất một loại sản phẩm là 600 nghìn đồng và bán ra mỗi sản phẩm là 900 nghìn đồng. Biết rằng số lượng sản phẩm bán ra tăng theo số tiền chi cho quảng cáo là $n(x)=a+b.ln(1+x)$ (sản phẩm), trong đó $x$ là số tiền chi cho quảng cáo tính theo đơn vị triệu đồng. Khi không chi cho quảng cáo thì sẽ bán được 400 sản phẩm, khi chi cho quảng cáo $(e^3 - 1)$ triệu đồng thì bán được 750 sản phẩm. Số tiền quảng cáo luôn đảm bảo số lượng sản phẩm bán được là một số nguyên],writing-lines:10,
 statements:([Lợi nhuận lớn nhất là 210 triệu đồng (kết quả làm tròn đến hàng đơn vị).],[Lợi nhuận thu được là $120+50ln(1+x)-x$ (triệu đồng).],[$a+6b=1100$.],[Lợi nhuận thu được lớn nhất khi ta sử dụng số tiền cho quảng cáo là 34 triệu đồng.]))
 q(2,[Để làm một cửa sổ dạng một hình bán nguyệt và một hình chữ nhật ghép lại như hình vẽ bên dưới, người ta dùng 8 m dây thép để làm các đường viền. Gọi $x,y$ là độ dài cạnh của khung hình chữ nhật.
 #fig(window())],writing-lines:10,
 statements:([Giá trị của $y$ tính theo $x$ là $4-(x(4+pi))/4$.],[Khi diện tích của cửa sổ lớn nhất thì $y=16/(8+pi)$.],[Diện tích của cửa sổ là $S=4x-x^2$.],[Chiều dài dây để uốn ra hình bán nguyệt là $(pi x)/2$.]))
 q(3,[Một cái bình có dạng hình hộp chữ nhật với đáy là hình vuông cạnh 50 (cm), cạnh bên bằng 80 (cm) và bên trong đặt một quả cầu sắt có bán kính bằng 20 (cm). Ban đầu bình không chứa nước. Ta tiến hành dùng một vòi nước cho chảy vào bình với lưu lượng không đổi bằng $x$ ($"cm"^3$/phút). Biết rằng sau khoảng thời gian 120 phút thì nước trong bình đầy. Chọn gốc thời gian là lúc bắt đầu cho nước chảy vào bình.
 #fig(tank())],writing-lines:10,
 statements:([Thời gian để nước chảy vào bình đủ để ngập hết quả cầu là 48 phút.],[Sau 24 phút đầu tiên thì mực nước trong bình có chiều cao là 20 (cm) (kết quả làm tròn đến hàng đơn vị).],[$x=1387$ ($"cm"^3$/phút) (kết quả làm tròn đến hàng đơn vị).],[Thể tích quả cầu sắt là $33150 "cm"^3$ (kết quả làm tròn đến hàng đơn vị).]))
 q(4,[Cho hàm số $y=(x^2-x+1)/(-x+1)$],writing-lines:10,
 statements:([Tâm đối xứng của đồ thị hàm số là $I(1;-1)$.],[Hàm số đồng biến trên khoảng $(0;2)$.],[Đồ thị hàm số có điểm cực tiểu là $A(0;1)$.],[Giá trị lớn nhất của hàm số trên khoảng $(1;+infinity)$ bằng $-3$.]))
 exam-section("III",[Câu trắc nghiệm trả lời ngắn.],instruction:[(3 điểm) Thí sinh trả lời từ câu 1 đến câu 6.])
 q(1,[Minh họa hình vẽ bên, ở bên trong hình lập phương cạnh 1, có 8 phần hình cầu $O_i$ ($i=1,2,3,...,8$) có tâm là các đỉnh của hình lập phương và có bán kính bằng nhau. Có thêm một hình cầu $O_0$ có tâm là tâm của hình lập phương. Biết $O_0$ tiếp xúc với mỗi $O_i$ ($i=1,2,3,...,8$). Khi đó giá trị nhỏ nhất của tổng thể tích 9 phần nói trên bằng bao nhiêu? (không làm tròn các kết quả trung gian, chỉ làm tròn kết quả đến hàng phần trăm).
 #fig(spheres())],writing-lines:10)
 q(2,[Biết giá trị nhỏ nhất của hàm số $f(x)=2cos^3 x-cos 2x$ trên đoạn $[-pi/3;pi/3]$ là $a/b$ với $a,b in NN$ và $a/b$ tối giản. Khi đó tích $P=a.b$ bằng bao nhiêu?],writing-lines:10)
 q(3,[Cho hình chữ nhật $A B C D$ có một cạnh nằm trên trục hoành và hai đỉnh $A(0;0)$, $C(6;4)$. Gọi $H$ là trung điểm của đoạn thẳng $A C$. Đường tròn $(C)$ có tâm $I(3;1)$ và đi qua $H$. Người ta muốn thiết kế một dải LED bắt đầu từ điểm $A$ và kết thúc tại $C$. Dải LED có hình dạng một phần của đồ thị hàm bậc ba $f(x)=a x^3+b x^2+c x+d$. Biết dải LED tiếp xúc với đường tròn $(C)$ tại $H$, tính $27a+3b+c+9d$.
 #fig(led())],writing-lines:10)
 q(4,[Một con cá bơi ngược dòng nước với khoảng cách là 300 km. Vận tốc dòng nước là 6 (km/h). Nếu vận tốc bơi của cá khi nước đứng yên là $v$ (km/h) thì năng lượng tiêu hao của cá trong $t$ giờ được cho bởi công thức $E(v)=c v^3 t$ (trong đó $c$ là hằng số dương, $E$ được tính bằng đơn vị Jun). Cá bơi ngược dòng quãng đường 300 km trong khoảng thời gian $t$ với vận tốc bằng bao nhiêu để năng lượng tiêu hao là thấp nhất?],writing-lines:10)
 q(5,[Một vệ tinh rời quỹ đạo Trái Đất theo đường cong $y=(3x^2-x+5)/(x - 1)$ ($x>1$, đơn vị km). Có 2 chùm tia laser tham chiếu được phóng dọc theo hai đường tiệm cận của quỹ đạo này. Các kỹ sư nhận thấy, cho dù vệ tinh $M$ bay đến đâu trên quỹ đạo, tích khoảng cách từ $M$ đến hai chùm tia laser luôn là một hằng số an toàn $C$. Tính giá trị của $10/7 C^2$?],writing-lines:10)
 q(6,[Từ một tấm bìa mỏng hình vuông cạnh 6 dm, cắt bỏ bốn tam giác cân bằng nhau có cạnh đáy là cạnh của hình vuông ban đầu và đỉnh là đỉnh của một hình vuông nhỏ phía trong rồi gấp lên, ghép lại tạo thành một khối chóp tứ giác đều như hình sau:
 #fig(pyramid())
 Thể tích của khối chóp có giá trị lớn nhất bằng bao nhiêu decimet khối (Kết quả làm tròn đến hàng phần chục)],writing-lines:10, ending: ending)
}
