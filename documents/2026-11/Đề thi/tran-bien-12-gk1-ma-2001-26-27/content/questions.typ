#import "../figures/diagrams.typ": *
#let questions=(
(section:"I",number:1,key:"I-1",stem:[Cho hàm số $y=x^3-3x^2$. Mệnh đề nào dưới đây đúng?],options:([Hàm số nghịch biến trên khoảng $(0;2)$.],[Hàm số đồng biến trên khoảng $(0;2)$.],[Hàm số nghịch biến trên khoảng $(2;+infinity)$.],[Hàm số nghịch biến trên khoảng $(-infinity;0)$.],),statements:(),answer:[A],solution:[Ta có $y'=3x^2-6x=3x(x-2)$; $y'<0 arrow.l.r 0<x<2$. Do đó hàm số nghịch biến trên khoảng $(0;2)$.],figure:none,width:60mm),
(section:"I",number:2,key:"I-2",stem:[Tiệm cận ngang của đồ thị hàm số $y=(3-4x)/(2x+1)$ có phương trình là],options:([$y=-2$.],[$x=-2$.],[$y=3/2$.],[$x=-1/2$.],),statements:(),answer:[A],solution:[Ta có $lim_(x arrow ±infinity) (3-4x)/(2x+1)=-2$ nên tiệm cận ngang của đồ thị hàm số là $y=-2$.],figure:none,width:60mm),
(section:"I",number:3,key:"I-3",stem:[Hàm số $y=x^3-3x^2+1$ có điểm cực tiểu là],options:([$x=-3$.],[$x=1$.],[$x=2$.],[$x=0$.],),statements:(),answer:[C],solution:[Ta có $y'=3x^2-6x$; $y'=0 arrow.l.r x=0$ hoặc $x=2$. Vì $y'$ đổi dấu từ âm sang dương khi $x$ đi qua $x=2$ nên điểm cực tiểu của hàm số là $x=2$.],figure:none,width:60mm),
(section:"I",number:4,key:"I-4",stem:[Giá trị lớn nhất của hàm số $f(x)=-x^4+2x^2+3$ trên đoạn $[0;2]$ bằng],options:([$3$.],[$-5$.],[$4$.],[$0$.],),statements:(),answer:[C],solution:[Ta có $f'(x)=-4x^3+4x=-4x(x^2-1)$. Trên đoạn $[0;2]$: $f'(x)=0 arrow.l.r x=0$ hoặc $x=1$.

Ta có $f(0)=3$, $f(1)=4$, $f(2)=-5$. Vậy $max_([0;2]) f(x)=f(1)=4$.],figure:none,width:60mm),
(section:"I",number:5,key:"I-5",stem:[Cho hàm số $f(x)$ xác định trên $RR$ và có bảng xét dấu của $f'(x)$ như sau. Số điểm cực trị của hàm số đã cho là],options:([$2$.],[$1$.],[$0$.],[$3$.],),statements:(),answer:[A],solution:[Từ bảng xét dấu, $f'(x)$ đổi dấu khi $x$ đi qua $x=-2$ và $x=0$, không đổi dấu khi $x$ đi qua $x=2$. Vậy hàm số có 2 điểm cực trị.],figure:sign-table(),width:125mm),
(section:"I",number:6,key:"I-6",stem:[Cho hàm số $f(x)$ có bảng biến thiên như sau. Hàm số đã cho đồng biến trên khoảng nào sau đây?],options:([$(-1;0)$.],[$(-infinity;-1)$.],[$(-1;+infinity)$.],[$(0;1)$.],),statements:(),answer:[A],solution:[Từ bảng biến thiên, $f'(x)>0$ trên khoảng $(-1;0)$ nên hàm số đồng biến trên khoảng $(-1;0)$.],figure:variation-table(),width:110mm),
(section:"I",number:7,key:"I-7",stem:[Đường cong ở hình dưới đây là đồ thị của hàm số nào trong các hàm số sau?],options:([$y=x^4-2x^2$.],[$y=x^3-3x$.],[$y=-x^3+3x$.],[$y=x^3-3x^2$.],),statements:(),answer:[B],solution:[Đồ thị có dạng đồ thị hàm số bậc ba với nhánh cuối đi lên nên hệ số $a>0$, loại A và C. Đồ thị đi qua gốc tọa độ $O$ và có hai điểm cực trị $(-1;2)$, $(1;-2)$.

Hàm số $y=x^3-3x$ có $y'=3x^2-3=0 arrow.l.r x=±1$, $y(-1)=2$, $y(1)=-2$, phù hợp với đồ thị.],figure:curve-plot(7),width:60mm),
(section:"I",number:8,key:"I-8",stem:[Cho hàm số $y=f(x)$ xác định, liên tục trên đoạn $[-2;2]$ và có đồ thị là đường cong trong hình vẽ. Gọi $M$, $m$ lần lượt là giá trị lớn nhất và nhỏ nhất của hàm số trên đoạn $[-2;2]$. Giá trị của $M-m$ bằng],options:([$0$.],[$4$.],[$8$.],[$2$.],),statements:(),answer:[C],solution:[Từ đồ thị, $M=f(2)=4$ và $m=f(-2)=-4$. Vậy $M-m=4-(-4)=8$.],figure:curve-plot(8),width:60mm),
(section:"I",number:9,key:"I-9",stem:[Cho hàm số bậc ba $y=f(x)$ có đồ thị như hình vẽ. Số nghiệm của phương trình $f(x)=2$ là],options:([$2$.],[$3$.],[$1$.],[$4$.],),statements:(),answer:[B],solution:[Số nghiệm của phương trình $f(x)=2$ bằng số giao điểm của đồ thị hàm số $y=f(x)$ với đường thẳng $y=2$. Vì $-1<2<3$ nên đường thẳng $y=2$ cắt đồ thị tại 3 điểm. Vậy phương trình có 3 nghiệm.],figure:curve-plot(9),width:60mm),
(section:"I",number:10,key:"I-10",stem:[Một vật chuyển động theo quy luật $s(t)=-t^3+6t^2+15t$, với $t$ (giây) là khoảng thời gian tính từ lúc bắt đầu chuyển động và $s$ (mét) là quãng đường vật đi được trong khoảng thời gian đó. Tính vận tốc tức thời của vật tại thời điểm $t=2$ giây.],options:([$15$ (m/s).],[$27$ (m/s).],[$24$ (m/s).],[$36$ (m/s).],),statements:(),answer:[B],solution:[Vận tốc của vật là $v(t)=s'(t)=-3t^2+12t+15$. Tại $t=2$: $v(2)=-12+24+15=27$ (m/s).],figure:none,width:60mm),
(section:"I",number:11,key:"I-11",stem:[Tiệm cận đứng của đồ thị hàm số $y=(3x+1)/(x-1)$ có phương trình là],options:([$x=1$.],[$x=3$.],[$y=1$.],[$y=3$.],),statements:(),answer:[A],solution:[Ta có $lim_(x arrow 1^+) (3x+1)/(x-1)=+infinity$ nên tiệm cận đứng của đồ thị hàm số là $x=1$.],figure:none,width:60mm),
(section:"I",number:12,key:"I-12",stem:[Hàm số nào sau đây đồng biến trên khoảng $(-infinity;+infinity)$?],options:([$y=x^4+2x^2$.],[$y=x^3+3x-1$.],[$y=-x^3-x$.],[$y=(x+1)/(x-2)$.],),statements:(),answer:[B],solution:[Hàm số $y=x^3+3x-1$ có $y'=3x^2+3>0$, $forall x in RR$ nên hàm số đồng biến trên khoảng $(-infinity;+infinity)$.],figure:none,width:60mm),
(section:"II",number:1,key:"II-1",stem:[Cho hàm số bậc ba $f(x)=1/3 x^3-x^2-3x+2$.],options:(),statements:([Đạo hàm của hàm số đã cho là $f'(x)=x^2-2x-3$.],[Tập nghiệm của phương trình $f'(x)=0$ là $S={3}$.],[$f(1)>f(2)$.],[Giá trị cực đại của hàm số $f(x)$ là $y_("CĐ")=11/3$.],),answer:[Đ – S – Đ – Đ],solution:[a) Đúng. Ta có $f'(x)=x^2-2x-3$.

b) Sai. $f'(x)=0 arrow.l.r x^2-2x-3=0 arrow.l.r x=-1$ hoặc $x=3$. Tập nghiệm là $S={-1;3}$.

c) Đúng. Ta có $f(1)=1/3-1-3+2=-5/3$ và $f(2)=8/3-4-6+2=-16/3$. Vậy $f(1)>f(2)$.

d) Đúng. Ta có $f'(x)>0$ trên các khoảng $(-infinity;-1)$, $(3;+infinity)$ và $f'(x)<0$ trên khoảng $(-1;3)$ nên hàm số đạt cực đại tại $x=-1$, $y_("CĐ")=f(-1)=-1/3-1+3+2=11/3$.],figure:none,width:60mm),
(section:"II",number:2,key:"II-2",stem:[Cho hàm số $f(x)=(x^2-x-2)/(x-1)$.],options:(),statements:([Tập xác định của hàm số là $D=RR without {1}$.],[Đạo hàm của hàm số là $f'(x)=(x^2-2x+3)/(x-1)^2$.],[Đồ thị hàm số có một đường tiệm cận đứng là $x=1$ và một đường tiệm cận xiên là $y=x$.],[Khoảng cách từ tâm đối xứng của đồ thị hàm số trên đến gốc tọa độ $O$ bằng 2.],),answer:[Đ – Đ – Đ – S],solution:[a) Đúng. Điều kiện xác định: $x-1 != 0 arrow.l.r x != 1$. Tập xác định $D=RR without {1}$.

b) Đúng. Ta có
$ f'(x)=((2x-1)(x-1)-(x^2-x-2))/(x-1)^2=(x^2-2x+3)/(x-1)^2. $

c) Đúng. Ta có $f(x)=x-2/(x-1)$. Vì $lim_(x arrow 1^+) f(x)=-infinity$ nên $x=1$ là tiệm cận đứng. Vì $lim_(x arrow ±infinity) [f(x)-x]=lim_(x arrow ±infinity)(-2/(x-1))=0$ nên $y=x$ là tiệm cận xiên.

d) Sai. Tâm đối xứng của đồ thị là giao điểm của hai đường tiệm cận $I(1;1)$. Khi đó $O I=sqrt(1^2+1^2)=sqrt(2) != 2$.],figure:none,width:60mm),
(section:"II",number:3,key:"II-3",stem:[Một bể chứa ban đầu có 200 lít nước tinh khiết (chưa có chất khử trùng). Cứ mỗi phút, người ta bơm thêm vào bể 40 lít nước, đồng thời cho thêm 20 gam chất khử trùng (giả sử chất khử trùng hòa tan ngay, dung dịch được khuấy đều và sự thay đổi thể tích do thêm chất rắn là không đáng kể). Gọi $f(t)$ là nồng độ chất khử trùng trong bể (đơn vị: gam/lít) tại thời điểm $t$ phút $(t>=0)$.],options:(),statements:([Tại thời điểm $t$ phút, thể tích dung dịch trong bể là $V(t)=200+40t$ (lít).],[Tại thời điểm $t$ phút, khối lượng chất khử trùng trong bể là $m(t)=200+20t$ (gam).],[Nồng độ chất khử trùng trong bể tại thời điểm $t$ phút được biểu diễn bởi hàm số $f(t)=t/(2t+10)$ (gam/lít).],[Khi thời gian $t$ tăng lên vô hạn $(t arrow +infinity)$, nồng độ chất khử trùng trong bể sẽ tiến dần đến ngưỡng 0,5 gam/lít và không bao giờ vượt quá ngưỡng này.],),answer:[Đ – S – Đ – Đ],solution:[a) Đúng. Sau $t$ phút, bể được bơm thêm $40t$ lít nước nên $V(t)=200+40t$ (lít).

b) Sai. Ban đầu bể chưa có chất khử trùng, sau $t$ phút bể có thêm $20t$ gam chất khử trùng nên $m(t)=20t$ (gam).

c) Đúng. Ta có $f(t)=m(t)/V(t)=(20t)/(200+40t)=t/(2t+10)$ (gam/lít).

d) Đúng. Ta có $lim_(t arrow +infinity) t/(2t+10)=1/2="0,5"$. Mặt khác $f(t)-1/2=t/(2t+10)-1/2=-5/(2t+10)<0$ với mọi $t>=0$ nên $f(t)<"0,5"$. Vậy nồng độ tiến dần đến $"0,5"$ gam/lít và không bao giờ vượt quá ngưỡng này.],figure:none,width:60mm),
(section:"II",number:4,key:"II-4",stem:[Cho đồ thị của hàm số lợi nhuận $y=P(x)$ (đơn vị: triệu đồng) phụ thuộc vào giá bán $x$ của một sản phẩm (đơn vị: trăm nghìn đồng) của một startup công nghệ như hình vẽ dưới đây. Biết rằng đồ thị hàm số $P(x)$ là một đường parabol.],options:(),statements:([Doanh nghiệp hòa vốn (lợi nhuận bằng 0) khi định giá bán sản phẩm là 100 000 đồng hoặc 700 000 đồng.],[Lợi nhuận của doanh nghiệp đạt giá trị lớn nhất là 90 triệu đồng khi giá bán mỗi sản phẩm là 400 000 đồng.],[Tốc độ thay đổi của lợi nhuận (lợi nhuận biên) $P'(x)$ mang giá trị dương khi giá bán $x in (4;7)$.],[Nếu doanh nghiệp quyết định bán sản phẩm với giá 200 000 đồng thì lợi nhuận thu được là 60 triệu đồng.],),answer:[Đ – Đ – S – S],solution:[Đồ thị cắt trục hoành tại $x=1$, $x=7$ nên $P(x)=k(x-1)(x-7)$. Đồ thị có đỉnh $(4;90)$ nên $P(4)=-9k=90 arrow.l.r k=-10$. Vậy $P(x)=-10(x-1)(x-7)=-10x^2+80x-70$.

a) Đúng. $P(x)=0 arrow.l.r x=1$ hoặc $x=7$, tức là giá bán 100 000 đồng hoặc 700 000 đồng.

b) Đúng. Đỉnh của parabol là $(4;90)$ nên lợi nhuận lớn nhất là 90 triệu đồng khi $x=4$, tức là giá bán 400 000 đồng.

c) Sai. Ta có $P'(x)=-20x+80<0$ với mọi $x in (4;7)$ nên lợi nhuận giảm khi giá bán tăng trong khoảng này.

d) Sai. Giá bán 200 000 đồng ứng với $x=2$, khi đó $P(2)=-10 dot 1 dot (-5)=50$ (triệu đồng) $!=60$ (triệu đồng).],figure:curve-plot(4),width:60mm),
(section:"III",number:1,key:"III-1",stem:[Một thương hiệu mỹ phẩm cao cấp thiết kế hộp trưng bày cho dòng nước hoa mới. Hộp đựng bên ngoài là một khối nhựa mica trong suốt có dạng nửa mặt cầu với bán kính $R=10$ cm, được úp khít lên một mặt đế phẳng. Bên trong hộp, lọ đựng nước hoa bằng thủy tinh có dạng khối hộp chữ nhật. Để lọ nước hoa được cố định chắc chắn mà không cần thêm mút xốp lót, nhà thiết kế yêu cầu mặt đáy của lọ phải nằm sát trên mặt đế hộp, đồng thời 4 đỉnh phía trên của lọ phải vừa chạm khít vào mặt trong của vòm mica. Biết rằng để đảm bảo tỷ lệ thẩm mỹ của thương hiệu, chiều dài mặt đáy lọ nước hoa luôn phải gấp đôi chiều rộng.

Hỏi nhà sản xuất có thể thiết kế lọ nước hoa có dung tích lớn nhất là bao nhiêu $"cm"^3$? (Bỏ qua bề dày của lớp vỏ thủy tinh và nhựa mica; làm tròn đến hàng đơn vị).],options:(),statements:(),answer:[616],solution:[Gọi chiều rộng đáy lọ là $x$, chiều dài đáy là $2x$, chiều cao lọ là $h$ (cm), với $x>0$, $0<h<10$. Gọi $O$ là tâm của nửa mặt cầu (nằm trên mặt đế). Bốn đỉnh phía trên của lọ cùng nằm trên mặt cầu nên cách đều $O$, suy ra hình chiếu của $O$ lên mặt trên của lọ là tâm của hình chữ nhật mặt trên, do đó $O$ là tâm của đáy lọ.

Nửa đường chéo đáy bằng $sqrt(x^2+4x^2)/2=(x sqrt(5))/2$. Khoảng cách từ $O$ đến một đỉnh phía trên bằng $R$ nên
$ h^2+(5x^2)/4=100 arrow.l.r x^2=4/5(100-h^2). $
Thể tích lọ là $V(h)=2x^2h=8/5(100h-h^3)$, với $0<h<10$. Ta có
$ V'(h)=8/5(100-3h^2); quad V'(h)=0 arrow.l.r h=(10 sqrt(3))/3. $
Vì $V'(h)>0$ trên $(0;(10 sqrt(3))/3)$ và $V'(h)<0$ trên $((10 sqrt(3))/3;10)$ nên $V(h)$ đạt giá trị lớn nhất tại $h=(10 sqrt(3))/3$.

Khi đó
$ V_(max)=8/5(100-100/3) dot (10 sqrt(3))/3=(3200 sqrt(3))/9 approx 616 ("cm"^3). $],figure:perfume(),width:65mm),
(section:"III",number:2,key:"III-2",stem:[Số người nhiễm một loại virus lây nhiễm trong cộng đồng sau $t$ ngày (kể từ khi phát hiện ca bệnh đầu tiên) được mô hình hóa xấp xỉ bởi hàm số $I(t)=-t^3+15t^2+10$ (người). Tốc độ truyền bệnh đạt giá trị lớn nhất vào ngày thứ mấy kể từ khi phát hiện ca bệnh đầu tiên?],options:(),statements:(),answer:[5],solution:[Tốc độ truyền bệnh là $I'(t)=-3t^2+30t=75-3(t-5)^2<=75$. Dấu bằng xảy ra khi $t=5$. Vậy tốc độ truyền bệnh đạt giá trị lớn nhất vào ngày thứ 5.],figure:none,width:60mm),
(section:"III",number:3,key:"III-3",stem:[Hàm số $y=x-2+4/x$ có giá trị cực đại và giá trị cực tiểu lần lượt là $a$, $b$. Tính $a-b$.],options:(),statements:(),answer:[−8],solution:[Tập xác định $D=RR without {0}$. Ta có $y'=1-4/x^2=(x^2-4)/x^2$; $y'=0 arrow.l.r x=±2$.

Ta có $y'>0$ trên các khoảng $(-infinity;-2)$, $(2;+infinity)$ và $y'<0$ trên các khoảng $(-2;0)$, $(0;2)$.

Hàm số đạt cực đại tại $x=-2$, $a=y(-2)=-2-2-2=-6$; đạt cực tiểu tại $x=2$, $b=y(2)=2-2+2=2$. Vậy $a-b=-6-2=-8$.],figure:none,width:60mm),
(section:"III",number:4,key:"III-4",stem:[Cho hàm số $y=(a x+b)/(x-1)$ có đồ thị $(C)$. Biết đồ thị $(C)$ đi qua điểm $M(0;-1)$ và tiệm cận ngang có phương trình $y=2$. Tính giá trị của $f(3)$.],options:(),statements:(),answer:[3,5],solution:[Xét $f(x)=(a x+b)/(x-1)$. Ta có $lim_(x arrow ±infinity) (a x+b)/(x-1)=a$ nên tiệm cận ngang là $y=a$, suy ra $a=2$.

Đồ thị đi qua $M(0;-1)$ nên $b/(-1)=-1 arrow.l.r b=1$. Khi đó $f(x)=(2x+1)/(x-1)$ và $f(3)=7/2="3,5"$.],figure:none,width:60mm),
(section:"III",number:5,key:"III-5",stem:[Một hạt chuyển động dọc theo trục tọa độ với phương trình chuyển động là $s(t)=t^3-9t^2+24t$, trong đó $s$ (mét) và thời gian $t$ (giây) tính từ lúc bắt đầu chuyển động. Tính tổng quãng đường hạt đó đã di chuyển được trong 5 giây đầu tiên kể từ lúc bắt đầu chuyển động.],options:(),statements:(),answer:[28],solution:[Vận tốc của hạt là $v(t)=s'(t)=3t^2-18t+24=3(t-2)(t-4)$. Trên đoạn $[0;5]$, $v(t)$ đổi dấu tại $t=2$ và $t=4$ nên hạt đổi chiều chuyển động tại các thời điểm này.

Ta có $s(0)=0$, $s(2)=20$, $s(4)=16$, $s(5)=20$. Tổng quãng đường hạt đi được trong 5 giây đầu là
$ abs(s(2)-s(0))+abs(s(4)-s(2))+abs(s(5)-s(4))=20+4+4=28 quad ("m"). $],figure:none,width:60mm),
(section:"III",number:6,key:"III-6",stem:[Một công ty logistics cần vận chuyển một chuyến hàng đến đối tác ở khoảng cách 150 km. Chi phí cho chuyến đi bao gồm tiền nhiên liệu và tiền công trả cho tài xế. Biết rằng nếu xe di chuyển với tốc độ $x$ (km/h) thì chi phí nhiên liệu cho mỗi kilômét đường đi được tính theo công thức $C(x)=x/30+40/x$ (đơn vị: nghìn đồng). Tiền công thuê tài xế là 80 nghìn đồng cho mỗi giờ lái xe. Do quy định an toàn giao thông, tốc độ của xe tải không được vượt quá 70 km/h. Hỏi tổng chi phí nhỏ nhất mà công ty phải trả cho chuyến đi này là bao nhiêu nghìn đồng?],options:(),statements:(),answer:[600],solution:[Gọi tốc độ của xe là $x$ (km/h), $0<x<=70$. Thời gian đi hết quãng đường là $150/x$ (giờ).

Chi phí nhiên liệu là $150(x/30+40/x)=5x+6000/x$ (nghìn đồng). Tiền công tài xế là $80 dot 150/x=12000/x$ (nghìn đồng).

Tổng chi phí là $T(x)=5x+18000/x$ (nghìn đồng), với $x in (0;70]$. Ta có
$ T'(x)=5-18000/x^2=(5(x^2-3600))/x^2. $
Trên $(0;70]$: $T'(x)=0 arrow.l.r x=60$. Vì $T'(x)<0$ trên $(0;60)$ và $T'(x)>0$ trên $(60;70)$ nên
$ min_((0;70]) T(x)=T(60)=300+300=600. $
Vậy tổng chi phí nhỏ nhất là 600 nghìn đồng.],figure:none,width:60mm),
)
