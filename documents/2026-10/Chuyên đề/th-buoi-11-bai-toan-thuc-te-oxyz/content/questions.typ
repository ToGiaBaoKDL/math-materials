#import "/templates/lesson.typ": exercise,paragraph,lesson-section,theory-box
#import "solutions.typ": solutions
#import "../figures.typ": fig

#let questions(variant)=[
#let exercise=exercise.with(writing-keep-prompt:true,compact-statements:variant=="de-cach")
#let illustrated(body,name,answer-width:none)=if variant=="de-cach" {
 grid(columns:(1fr,90mm),column-gutter:5mm,align:top,
  block[#set text(size:13pt) #set par(leading:0.6em,justify:false) #body],
  fig(name,width:75mm))
} else { [#body #fig(name,width:if variant=="dap-an" {answer-width} else {none})] }

#lesson-section([XÁC ĐỊNH TỌA ĐỘ ĐIỂM – VECTƠ TRONG MÔ HÌNH KHÔNG GIAN], number:1,above:0pt)

#theory-box(title:[Phương pháp])[
#set text(size:if variant=="de-cach" {12pt} else {14pt})
#set par(leading:if variant=="de-cach" {0.5em} else {0.92em})

#paragraph[Để giải quyết bài toán tọa độ trong mô hình không gian, cần nắm hai kỹ năng sau:]

#paragraph[*1. Xác định tọa độ điểm.* Với điểm sơ cấp, xác định cao độ bằng khoảng cách đến mặt phẳng $(O x y)$; xác định hoành độ và tung độ qua hình chiếu trên mặt phẳng này.]

#paragraph[Với điểm thứ cấp, dùng tính chất trung điểm, trọng tâm hoặc đẳng thức vectơ theo các điểm sơ cấp đã biết.]

#paragraph[*2. Kết hợp quan hệ hình học.* Khai thác vuông góc, song song để tính vectơ, góc, chiều cao, diện tích và thể tích. Không nên phụ thuộc quá mức vào tọa độ khi cách giải hình học ngắn gọn hơn.]
]


#exercise(
1, [Một máy bay $M$ đang cất cánh từ phi trường với hệ toạ độ không gian $O x y z$ được thiết lập như hình vẽ dưới đây. Cho biết $M$ là vị trí của máy bay và $O M = 14 "," hat(N O B) = 32 ° "," hat(M O C) = 65 °$. Tìm toạ độ điểm $M$

#fig("flight-departure",width:if variant=="dap-an" {70mm} else if variant=="de-cach" {85mm} else {none})],
variant:variant,
fill-writing-page:true,
keep-together:false,
flow-stem:variant=="dap-an",
source-id:"bai-hoc-1",
writing-lines:3,
solution:solutions.at("bai-hoc-1")
)

#exercise(
2, [Một chiếc xe đang kéo căng sợi dây cáp $A B$ trong công trường xây dựng, trên đó đã thiết lập hệ toạ độ $O x y z$ như Hình với độ dài đơn vị trên các trục tọa độ bằng $1 m$. Tìm được tọa độ của vectơ $arrow(A B) = lr(( a ; b ; c ))$, khi đó $a + c = ?$

#fig("cable",width:if variant=="dap-an" {72mm} else if variant=="de-cach" {78mm} else {none})],
variant:variant,
fill-writing-page:true,
keep-together:false,
flow-stem:variant=="dap-an",
source-id:"bai-hoc-2",
writing-lines:3,
solution:solutions.at("bai-hoc-2")
)

#exercise(
3, [Một ngôi nhà gồm hai phần. Phần thân nhà dạng hình hộp chữ nhật $A B C D . O M N K$ có chiều dài 1200 cm, chiều rộng 900 cm, chiều cao 450 cm. Phần mái nhà dạng hình chóp S.ABCD có các cạnh bên bằng nhau và cùng tạo với mặt đáy một góc $α$ có $tan α = frac(1, 5)$. Chọn hệ trục toạ độ Oxyz sao cho M thuộc tia Ox, K thuộc tia Oy, A thuộc tia Oz (như hình vẽ).

Biết $S lr(( a ; b ; c ))$ (đơn vị của a, b, c là centimet). Tính giá trị của biểu thức $P = a + b + c$
#fig("roof-house",width:if variant=="dap-an" {78mm} else {none})],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"bai-hoc-3",
writing-lines:4,
solution:solutions.at("bai-hoc-3")
)

#exercise(
4, [#illustrated([Một kho chứa hàng có dạng hình lăng trụ đứng ABFPE.DCGQH với ABFE là hình chữ nhật và EFP là tam giác cân tại $P$. Gọi $T$ là trung điểm của $D C$. Các kích thước của kho chứa lần lượt là $A B = 6 "m" ; A E = 5 "m" ; A D = 8 "m" ; Q T = 7 "m"$. Người ta mô hình hoá nhà kho bằng cách chọn hệ trục toạ độ có gốc toạ độ là điểm $O$ thuộc đoạn AD sao cho $O A = 2 "m"$ và các trục toạ độ tương ứng như hình vẽ dưới đây. Khi đó:],"shifted-warehouse")],
variant:variant,
fill-writing-page:false,
keep-together:false,
source-id:"bai-hoc-4",
statement-table:true,
writing-lines:8,
solution:solutions.at("bai-hoc-4"),
statements:([a) Toạ độ điểm $Q$ là $lr(( - 6 ; 3 ; 5 ))$.],[b) Véc tơ $arrow(O C)$ có toạ độ là $lr(( - 6 ; 6 ; 0 ))$.],[c) Người ta muốn lắp camera quan sát trong nhà kho tại vị trí trung điểm của FG và đầu thu dữ liệu đặt tại vị trí $O$. Người ta thiết kế đường dây cáp nối từ $O$ đến $K$ sau đó nối thẳng đến camera. Độ dài đoạn cáp nối tối thiểu bằng $5 + 2 sqrt(10) "m"$.],[d) Mái nhà được lợp bằng tôn Hoa Sen, giá tiền mỗi mét vuông tôn là 130.000 đồng. Số tiền cần bỏ ra để mua tôn lợp mái nhà là 3.750.000 đồng (không kể hao phí do việc cắt và ghép các miếng tôn, làm tròn kết quả đến hàng nghìn).],)
)

#lesson-section([BÀI TOÁN CHUYỂN ĐỘNG],number:2)

#exercise(
5, [Một người đứng ở mặt đất điều khiển hai flycam để phục vụ trong một chương trình của đài truyền hình. Flycam $I$ ở vị trí $A$ cách vị trí điều khiển 150 m về phía nam và 200 m về phía đông, đồng thời cách mặt đất 50 m. Flycam II ở vị trí $B$ cách vị trí điều khiển 180 m về phía bắc và 240 m về phía tây, đồng thời cách mặt đất 60 m. Chọn hệ trục toạ độ Oxyz với gốc $O$ là vị trí người điều khiển, mặt phẳng (Oxy) trùng với mặt đất, trục Ox có hướng trùng với hướng nam, trục Oy trùng với hướng đông, trục Oz vuông góc với mặt đất hướng lên bầu trời, đơn vị trên mỗi trục tính theo mét. Khoảng cách giữa hai flycam đó bằng bao nhiêu mét (làm tròn đến hàng đơn vị)?

],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"bai-hoc-5",
writing-lines:4,
solution:solutions.at("bai-hoc-5")
)

#if variant=="de-cach" {pagebreak(weak:true)}
#exercise(
6, [Hai chiếc máy bay không người lái cùng bay lên từ một địa điểm. Sau một giờ bay, chiếc thứ nhất cách điểm xuất phát về phía bắc 23 km và về phía tây 18 km, đồng thời cách mặt đất 2 km. Chiếc thứ hai cách điểm xuất phát về phía đông 22 km và về phía nam 27 km , đồng thời cách mặt đất 3 km. Chọn hệ trục tọa độ Oxyz với gốc O đặt tại điểm xuất phát của hai chiếc máy bay, mặt phẳng $lr(( "Oxy" ))$ trùng với mặt đất sao cho trục Ox hướng về phía bắc, trục Oy hướng về phía tây và trục Oz hướng thẳng đứng lên trời, đơn vị đo lấy theo kilômét. Sau đúng một giờ bay, hai máy bay đó cùng bắn một mục tiêu di động trên mặt đất. Biết tổng khoảng cách từ mỗi máy bay đến mục tiêu là nhỏ nhất, lúc đó mục tiêu cách điểm xuất phát của hai máy bay bao nhiêu kilômét (kết quả làm tròn đến hàng phần trăm)?

],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"bai-hoc-6",
writing-lines:7,
solution:solutions.at("bai-hoc-6")
)

#if variant=="de-cach" {pagebreak(weak:true)}
#exercise(
7, [Trong không gian với một hệ trục toạ độ cho trước (đơn vị đo lấy theo kilômét), ra đa phát hiện một chiếc máy bay di chuyển với vận tốc và hướng không đổi từ điểm $A ( 800 ; 500 ; 7 )$ đến điểm $B ( 940 ; 550 ; 8 )$ trong 10 phút. Nếu máy bay tiếp tục giữ nguyên vận tốc và hướng bay thì toạ độ của máy bay sau 5 phút tiếp theo là gì?

#fig("motion-half",width:if variant=="de-cach" {85mm} else {none})],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"bai-hoc-7",
writing-lines:3,
solution:solutions.at("bai-hoc-7")
)

#exercise(
8, [Trong không gian chọn hệ trục tọa độ cho trước, đơn vị đo lấy kilômét, ra đa phát hiện một máy bay chiến đấu của Mỹ di chuyển với vận tốc và hướng không đổi từ điểm $M lr(( 1000 ; 600 ; 14 ))$ đến điểm $N$ trong 30 phút. Nếu máy bay tiếp tục giữ nguyên vận tốc và hướng bay thì tọa độ của máy bay sau 10 phút tiếp theo bằng $Q lr(( 1400 ; 800 ; 16 ))$. Xác định tọa độ vị trí điểm $N$.

#fig("aircraft-us",width:if variant=="de-cach" {65mm} else {none})],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"bai-hoc-8",
writing-lines:3,
solution:solutions.at("bai-hoc-8")
)

#lesson-section([BÀI TẬP TỰ LUYỆN],badge:"A")

#exercise(
1, [Một phòng học có thiết kế dạng hình hộp chữ nhật với chiều dài là $8 m$, chiều rộng là $6 m$ và chiều cao là $3 m$. Một chiếc đèn được treo tại chính giữa trần nhà của phòng học. Xét hệ trục toạ độ $O x y z$ có gốc $O$ trùng với một góc phòng và mặt phẳng $( O x y )$ trùng với mặt sàn, đơn vị đo được lấy theo mét. Hãy tìm toạ độ của điểm treo đèn.

#fig("room-simple",width:if variant=="dap-an" {70.56mm} else {none})],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-1",
writing-lines:3,
solution:solutions.at("tu-luyen-1"),
answers:([$lr(( 4 ; 4 ; 4 ))$],[$lr(( 4 ; 3 ; 4 ))$],[$lr(( 4 ; 3 ; 3 ))$],[$lr(( 4 ; 5 ; 4 ))$],)
)

#exercise(
2, [Một phòng học có thiết kế dạng hình hộp chữ nhật $A B C D . A' B' C' D'$ với $A B = 6 "m" "," A D = 7 "m" "," A A' = "3,5" "m"$. Một bóng đèn được treo ở vị trí chính giữa trần nhà của phòng học và cách trần nhà $"0,5" "m"$. Chọn hệ trục tọa độ Oxyz sao cho gốc $O$ trùng với điểm $A$, các điểm $B "," D "," A'$ lần lượt nằm trên các tia $"Ox" "," "Oy" "," "Oz"$.

#fig("room-hanging")],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-2",
statement-table:true,
writing-lines:7,
solution:solutions.at("tu-luyen-2"),
statements:([a) Điểm $D$ có toạ độ là $lr(( 0 ; 7 ; 0 ))$],[b) Các điểm C, D có tung độ bằng nhau],[c) Vectơ $arrow(C' D')$ có tọa độ $lr(( 6 ; 0 ; 0 ))$],[d) Bóng đèn nằm tại vị trí có tọa độ $lr(( 3 ; "3,5" ; "3,5" ))$],)
)

#exercise(
3, [Ở một sân bay, vị trí của máy bay được xác định bởi điểm $M$ trong không gian $O x y z$ như hình bên. Gọi $H$  là hình chiếu vuông góc của $M$ xuống mặt phẳng $lr(( O x y ))$. Cho biết $O M = 50$, $lr(( arrow(i) ; arrow(O H) )) = 64 °$, $lr(( arrow(O H) "," arrow(O M) )) = 48 °$. Tìm toạ độ của điểm $M$.

#fig("flight-airport",width:if variant=="dap-an" {85mm} else {none})],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-3",
writing-lines:5,
solution:solutions.at("tu-luyen-3"),
answers:([$M lr(( "37,2" ; "14,7" ; "30,1" ))$],[$M lr(( "14,7" ; "37,2" ; "30,1" ))$],[$M lr(( "30,1" ; "14,7" ; "37,2" ))$],[$M lr(( "14,7" ; "30,1" ; "37,2" ))$],)
)

#exercise(
4, [Một máy bay đang cất cánh từ phi trường. Với hệ toạ độ $O x y z$ được thiết lập như Hình, cho biết $M$ là vị trí của máy bay, $O M = 14 "," hat(N O B) = 32 ^(°) "," hat(M O C) = 65 ^(°)$. Tìm được tọa độ điểm $M$.

#fig("flight-departure")],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-4",
writing-lines:5,
solution:solutions.at("tu-luyen-4")
)

#exercise(
5, [Hình minh hoạ sơ đồ một ngôi nhà trong hệ trục tọa độ $O x y z$, trong đó nền nhà, bốn bức tường và hai mái nhà đều là hình chữ nhật.

Xét tính đúng sai của các mệnh đề sau:
#fig("warehouse-coordinates",width:if variant=="dap-an" {94.3mm} else if variant=="de-cach" {90mm} else {none})],
variant:variant,
fill-writing-page:false,
keep-together:false,
source-id:"tu-luyen-5",
statement-table:true,
writing-lines:9,
solution:solutions.at("tu-luyen-5"),
statements:([a) Tọa độ điểm $A$ là $( 4 ; 0 ; 0 )$.],[b) Tọa độ $arrow(A H) = lr(( 4 ; 5 ; 3 ))$],[c) $arrow(A H) . arrow(A F) = 3$],[d) Góc dốc của mái nhà, tức là số đo của góc nhị diện có cạnh là đường thẳng $F G$, hai mặt lần lượt là $( F G Q P )$ và $( F G H E )$ bằng $"26,6" ^(°)$ (làm tròn kết quả đến hàng phần mười của độ)],)
)

#exercise(
6, [Những căn nhà gỗ trong Hình 1 được phác thảo dưới dạng một hình lăng trụ đứng tam giác $O A B . O' A' B'$ như trong Hình 2. Với hệ trục toạ độ $O x y z$ thể hiện như Hình 2 (đơn vị đo lấy theo centimét), hai điểm $A'$ và $B'$ có tọa độ lần lượt là $lr(( 240 ; 450 ; 0 ))$ và $lr(( 120 ; 450 ; 300 ))$. Mỗi căn nhà gỗ có chiều dài là $a   "cm"$, chiều rộng là $b "cm"$, mỗi cạnh bên của mặt tiền có độ dài là $c "cm"$. Tính $a + b + c$ (Làm tròn đến hàng đơn vị).

#fig("cabin")],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-6",
writing-lines:5,
solution:solutions.at("tu-luyen-6")
)

#exercise(
7, [#illustrated([Một kho chứa hàng có dạng hình lăng trụ đứng $O A F P E C B G Q H$ với $O A F E$ là hình chữ nhật với $E F P$ là tam giác cân tại $P .$ Biết $O A = 4 m ; A B = 6 m ; H C = 5 ;$ độ dốc của mái nhà, tức là số đo góc nhị diện $lr([ Q "," F G "," H ])$ bằng $45 ° .$ Người ta mô hình hóa nhà kho bằng cách chọn hệ trục tọa độ tương ứng như hình vẽ dưới đây (đơn vị trên mỗi trục là $1 m$).],"warehouse",answer-width:101.2mm)],
variant:variant,
fill-writing-page:false,
keep-together:false,
source-id:"tu-luyen-7",
statement-table:true,
writing-lines:10,
solution:solutions.at("tu-luyen-7"),
statements:([a) Tọa độ của $arrow(P Q)$ là $lr(( 0 ; 6 ; 0 )) .$],[b) Tọa độ của điểm $G$ là $lr(( 6 ; 4 ; 5 )) .$],[c) Chiều cao kho hàng tức là khoảng cách từ nóc nhà (điểm cao nhất của nóc nhà) và sàn nhà bằng $7 m .$],[d) Người ta muốn lắp camera quan sát trong nhà kho tại vị trí trung điểm của $G Q$ và đầu thu dữ liệu đặt tại vị trí $O .$ Người ta thiết kế đường dây cáp nối từ $O$ đến $E$ rồi từ $E$ đến $H$, sau đó từ $H$ đến camera. Độ dài đoạn cáp nối tối thiểu bằng $11 + sqrt(10)$ m.],)
)

#exercise(
8, [Một quả bóng hình cầu có bán kính $r$ đang được treo trong một góc của tường nhà (hai bờ tường vuông góc với nhau). Một điểm $B$ cố định nằm trên mép hai bờ tường và cách mặt đất $80$ cm, sợi dây treo quả bóng có độ dài $A B = 30$ cm và đây cũng là độ dài ngắn nhất nối điểm $B$ với mặt xung quanh của quả bóng. Biết rằng quả bóng tiếp xúc với hai bên bờ tường và điểm thấp nhất của quả bóng cách mặt đất $20$ cm. Hỏi quả bóng có đường kính là bao nhiêu cm? (Kết quả làm tròn đến hàng đơn vị)

#fig("hanging-ball",width:if variant=="dap-an" {73.5mm} else {none})],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-8",
writing-lines:9,
solution:solutions.at("tu-luyen-8")
)

#exercise(
9, [Một chiếc khinh khí cầu bay lên tại điểm $O$. Sau một thời gian bay, chiếc khinh khí cầu cách điểm xuất phát về phía Đông $10 lr(( "km" ))$ và về phía Nam $5 lr(( "km" ))$, đồng thời cách mặt đất $400 lr(( m ))$.

Chọn hệ trục tọa độ $O x y z$, với gốc đặt tại điểm xuất phát của khinh khí cầu, mặt phẳng $lr(( O x y ))$ trùng với mặt đất, trục $O x$ hướng về phía Nam, trục $O y$ hướng về phía Đông, trục $O z$ hướng thẳng đứng lên trời, đơn vị đo lấy theo kilômét (xem hình vẽ).
#fig("balloon",width:if variant=="dap-an" {80mm} else {none})],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-9",
writing-lines:6,
solution:solutions.at("tu-luyen-9"),
statements:([a) Tìm tọa độ của chiếc khinh khí cầu đối với hệ trục tọa độ đã chọn.],[b) Xác định khoảng cách của chiếc khinh khí cầu với vị trí tại điểm xuất phát của nó.],)
)

#exercise(
10, [Hai chiếc khinh khí cầu bay lên từ cùng một địa điểm. Sau một thời gian chiếc thứ nhất cách điểm xuất phát 300 m về phía Nam và 100 m về phía Đông, đồng thời cách mặt đất 100 m. Chiếc thứ hai nằm cách điểm xuất phát 200 m về phía Bắc và 100 m về phía Tây, đồng thời cách mặt đất 50 m. Cùng thời điểm đó, một người đứng trên mặt đất quan sát thấy hai chiếc khinh khí cầu nói trên. Biết rằng, so với các vị trí quan sát trên mặt đất, vị trí người đứng có tổng khoảng cách đến hai chiếc khinh khí cầu là nhỏ nhất. Tính khoảng cách từ vị trí người quan sát đến địa điểm xuất phát của hai chiếc khinh khí cầu (kết quả làm tròn đến hàng đơn vị).

],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-10",
writing-lines:7,
solution:solutions.at("tu-luyen-10")
)

#exercise(
11, [Hai chiếc flycam được điều khiển cùng bay lên tại một địa điểm. Sau một thời gian bay, chiếc flycam thứ nhất bay đến vị trí điểm $A$ cách mặt đất $5 m$, cách điểm xuất phát $3 m$ về phía nam và $2 m$ về phía đông. Chiếc flycam thứ hai bay đến điểm $B$ cách mặt đất $5 m$, cách điểm xuất phát $6 m$ về phía bắc và $6 m$ về phía tây. Chọn hệ trục tọa độ $O x y z$ với gốc $O$ đặt tại điểm xuất phát của hai chiếc flycam, mặt phẳng $lr(( O x y ))$ trùng với mặt đất (coi như phẳng) có trục $O x$ hướng về phía nam, trục $O y$ hướng về phía đông và trục $O z$ hướng thẳng đứng lên trời (đơn vị đo mỗi trục là mét).

Trên mặt đất, người ta xác định được một vị trí sao cho tổng khoảng cách từ vị trí đó đến hai chiếc flycam ngắn nhất. Hỏi khoảng cách từ điểm xuất phát đến vị trí đó bằng bao nhiêu mét?
#fig("drones")],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-11",
writing-lines:6,
solution:solutions.at("tu-luyen-11")
)

#exercise(
12, [Cho biết máy bay $A$ đang bay với vectơ vận tốc $arrow(a) = ( 300 ; 200 ; 400 )$ (đơn vị: km/h). Máy bay $B$ bay cùng hướng và có tốc độ gấp ba lần tốc độ của máy bay $A$. Tính tốc độ của máy bay $B$.

#fig("velocity")],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-12",
writing-lines:3,
solution:solutions.at("tu-luyen-12")
)

#exercise(
13, [Trong không gian với một hệ trục toạ độ cho trước (đơn vị đo lấy theo kilômét), ra đa phát hiện một chiếc máy bay di chuyển với vận tốc và hướng không đổi từ điểm $A ( 800 ; 500 ; 7 )$ đến điểm $B ( 940 ; 550 ; 8 )$ trong 10 phút. Nếu máy bay tiếp tục giữ nguyên vận tốc và hướng bay thì toạ độ của máy bay sau 10 phút tiếp theo $D lr(( x ; y ; z ))$ khi đó $x + y + z = ?$

#fig("motion-full",width:if variant=="de-cach" {85mm} else {none})],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-13",
writing-lines:3,
solution:solutions.at("tu-luyen-13")
)

#exercise(
14, [Trong không gian chọn hệ trục tọa độ cho trước, đơn vị đo lấy kilômét, ra đa phát hiện một máy bay chiến đấu của Nga di chuyển với vận tốc và hướng không đổi từ điểm $M lr(( 500 ; 200 ; 8 ))$ đến điểm $N lr(( 800 ; 300 ; 10 ))$ trong 20 phút. Nếu máy bay tiếp tục giữ nguyên vận tốc và hướng bay thì tọa độ của máy bay sau 5 phút tiếp theo bằng bao nhiêu?

#fig("aircraft-radar",width:if variant=="dap-an" {62mm} else {none})],
variant:variant,
fill-writing-page:true,
keep-together:false,
source-id:"tu-luyen-14",
writing-lines:3,
solution:solutions.at("tu-luyen-14")
)
]
