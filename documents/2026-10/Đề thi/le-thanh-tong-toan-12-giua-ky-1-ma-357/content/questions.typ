#import "/templates/exam.typ": exam-question, exam-section, exam-table
#import "../figures.typ": (
  box-net, bridge, display-case, factory, figure, graph, pool, room, runner, sugar, transport, variation,
)
#let questions() = {
  let q = exam-question.with(keep-together: false)
  exam-section(
    "I",
    [CÂU TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN.],
    instruction: [Học sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi học sinh chỉ chọn một phương án, mỗi phương án trả lời đúng được 0,25 điểm.],
  )
  q(1, [Hàm số nào dưới đây luôn nghịch biến trên $RR$?], answers: (
    [$y=-2x^3+6x$.],
    [$y=x^3+4x-2026$.],
    [$y=-2x^3-x+2026$.],
    [$y=-x^3-4x^2-2026$.],
  ))
  q(2, [Phương trình đường thẳng đi qua hai điểm cực trị của hàm số $y=(x^2+x+2)/(x+1)$ là], answers: (
    [$y=x+1$.],
    [$y=x-1$.],
    [$y=2x-1$.],
    [$y=2x+1$.],
  ))
  q(
    3,
    [Cho hình hộp $A B C D.A' B' C' D'$. Tìm vectơ $arrow(u)=arrow(D C')+arrow(A D')-arrow(B B')+arrow(C' A)$.],
    answers: (
      [$arrow(u)=arrow(0)$.],
      [$arrow(u)=2arrow(A C')$.],
      [$arrow(u)=arrow(A C')$.],
      [$arrow(u)=2arrow(C' A)$.],
    ),
  )
  q(4, [Đường thẳng $y=x+1$ là đường tiệm cận xiên của đồ thị hàm số nào dưới đây?], answers: (
    [$y=x+1+(x^2+2)/x$.],
    [$y=(x+1)^2/(x+1)$.],
    [$y=x+1-2/(x-2)$.],
    [$y=x+1-(x+2)/(x+1)$.],
  ))
  q(5, [Phương trình đường tiệm cận ngang của đồ thị hàm số $y=2x-1+sqrt(4x^2-4)$ là], answers: (
    [$x=-1$.],
    [$x=plus.minus 1$.],
    [$y=-1$.],
    [$y=plus.minus 1$.],
  ))
  q(6, [Hàm số $y=2x^3-5x^2+3$ đồng biến trên khoảng nào dưới đây?], answers: (
    [$(0;1)$.],
    [$(2;+infinity)$.],
    [$(1;2)$.],
    [$(-infinity;1)$.],
  ))
  q(
    7,
    [Đường cong ở hình bên là đồ thị của hàm số bậc ba $y=f(x)$. Giá trị lớn nhất của hàm số đó trên khoảng $(-infinity;0)$ bằng
      #figure(graph())],
    answers: ([$2$.], [$-2$.], [$1$.], [$0$.]),
  )
  q(8, [Cho hình chóp tam giác đều $S.A B C$. Số đo góc giữa hai vectơ $arrow(S C)$ và $arrow(B A)$ bằng], answers: (
    [$45 degree$.],
    [$120 degree$.],
    [$60 degree$.],
    [$90 degree$.],
  ))
  q(
    9,
    [Mỗi ngày bác An đều chạy bộ để rèn luyện sức khoẻ. Quãng đường chạy bộ mỗi ngày (đơn vị: km) của bác An trong 30 ngày được thống kê ở bảng sau
      #block(above: 4mm, below: 4mm, exam-table(
        columns: (1.5fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        header: (
          [Quãng đường (km)],
          [$["2,5";"3,0")$],
          [$["3,0";"3,5")$],
          [$["3,5";"4,0")$],
          [$["4,0";"4,5")$],
          [$["4,5";"5,0")$],
        ),
        [Số ngày],
        [7],
        [7],
        [8],
        [5],
        [3],
      ))
      #figure(runner())
      Khoảng biến thiên của mẫu số liệu ghép nhóm đó bằng],
    answers: ([0,5.], [1,5.], [2.], [2,5.]),
  )
  q(
    10,
    [Cho lăng trụ đều $A B C.A' B' C'$ có cạnh đáy và cạnh bên bằng nhau. Góc giữa vectơ $arrow(B C')$ và vectơ $arrow(A' B')$ bằng bao nhiêu? (Làm tròn kết quả đến hàng đơn vị của độ)],
    answers: ([$45 degree$.], [$60 degree$.], [$69 degree$.], [$111 degree$.]),
  )
  q(
    11,
    [Trong mặt phẳng tọa độ $O x y z$, cho điểm $A(0;-2;3)$ và $B(1;-1;4)$. Biết tọa độ điểm $M(a;b;c)$ thuộc mặt phẳng $O x y$ và $A,B,M$ thẳng hàng. Khi đó giá trị $a+b+c$ bằng],
    answers: ([$8$.], [$-8$.], [$2$.], [$-2$.]),
  )
  q(
    12,
    [Gọi $m$ là giá trị nhỏ nhất của hàm số $f(x)=x^3-30x$ trên đoạn $[2;19]$ và $m=f(x_0)$. Tính $T=m x_0$.],
    answers: ([$-200$.], [$-199$.], [$-104$.], [$119491$.]),
  )
  exam-section(
    "II",
    [CÂU TRẮC NGHIỆM ĐÚNG SAI.],
    instruction: [Học sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, học sinh chỉ chọn ĐÚNG hoặc SAI. Phần này gồm 4 điểm.],
  )
  q(
    1,
    [Cho hàm số bậc ba $y=f(x)$ có bảng biến thiên như sau:
      #figure(variation())],
    statements: (
      [Hàm số $y=f(x)$ đạt cực đại tại điểm $x=1$.],
      [Hàm số $y=f(x)$ đồng biến trên khoảng $(-5;+infinity)$.],
      [Đồ thị hàm số $y=f(x)$ đi qua điểm có tọa độ $(0;-1)$.],
      [$f(-1)=f(2)$.],
    ),
  )
  q(
    2,
    [Tốc độ (đơn vị: km/h) của các ô tô khi đi qua một trạm đo, được cho bởi bảng tần số ghép nhóm:
      #block(above: 4mm, below: 4mm, exam-table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        header: ([Nhóm], [$[40;45)$], [$[45;50)$], [$[50;55)$], [$[55;60)$], [$[60;65)$], [$[65;70)$]),
        [Tần số],
        [4],
        [11],
        [7],
        [8],
        [8],
        [2],
      ))
      #figure(transport())],
    statements: (
      [Vận tốc trung bình của một ô tô là $"53,875"$ (km/h).],
      [Độ lệch chuẩn $s="7,15"$ (làm tròn đến hàng phần trăm).],
      [Tứ phân vị thứ nhất $Q_1="47,7"$ (làm tròn đến hàng phần chục).],
      [Khoảng tứ phân vị là $Delta Q="12,3"$ (làm tròn đến hàng phần chục).],
    ),
  )
  q(
    3,
    [Một xe khách đi từ Long Khánh đến Vũng Tàu chở tối đa được 45 hành khách một chuyến. Nếu một chuyến chở được $m$ hành khách thì giá tiền cho mỗi hành khách được tính là $(300-(5m)/2)^2$ đồng. Gọi $x$ là số hành khách trên mỗi chuyến xe và số tiền thu được của mỗi chuyến xe là $F(x)$ $(0<x<=45)$.
      #figure(transport(bus: true))],
    statements: (
      [Hàm số $F(x)=(300-(5x)/2)^2$.],
      [Khi xe chở 40 khách thì số tiền thu được của chuyến xe đó lớn hơn 1,5 triệu đồng.],
      [Để thu được số tiền lớn nhất thì chuyến xe đó phải chở tối đa 45 người.],
      [Số tiền thu được nhiều nhất có thể của chuyến xe là 1,6 triệu đồng.],
    ),
  )
  q(
    4,
    [Đặt hệ trục tọa độ $O x y z$ vào chiếc cầu (như hình vẽ), với $O$ là điểm nằm trên bệ của chân cột trụ tại mặt nước, trục $O z$ trùng với cột trụ, mặt phẳng $(O x y)$ là mặt nước. Giả sử đoạn cầu nối từ điểm $A$ đến trục $O z$ song song với trục $O y$, đoạn cầu này có độ dài bằng $343 "m"$ và nằm cách mặt nước $75 "m"$ (đơn vị trên hệ trục tọa độ là mét). Dây cáp $A D$ (xem như một đoạn thẳng) nối điểm $D$ thuộc trục $O z$ với một điểm $A$ thuộc mặt phẳng $(O y z)$. Biết điểm $D$ là đỉnh cột trụ, cách mặt nước $227 "m"$.
      #figure(bridge())],
    statements: (
      [Tọa độ điểm $A$ là $(0;-343;75)$.],
      [Số đo góc giữa hai vectơ $arrow(D A)$ và $arrow(A O)$ bằng $"36,2" degree$ (kết quả làm tròn đến hàng phần chục của độ).],
      [Nếu kéo dài đoạn dây $A D$ sẽ cắt mặt nước tại điểm có tọa độ $(0;-77861;0)$.],
      [Người ta dùng một đoạn đèn led trang trí nối thẳng từ điểm $N$ trên dây cáp $A D$ đến điểm $M$ trên thành cầu (như hình vẽ), $M$ cách trục $O z$ một khoảng bằng $230 "m"$ và $M N$ song song với cột trụ. Độ dài đoạn đèn led cần dùng là $"50,07" "m"$ (kết quả làm tròn đến hàng phần trăm).],
    ),
  )
  exam-section(
    "III",
    [CÂU TRẮC NGHIỆM TRẢ LỜI NGẮN.],
    instruction: [Học sinh trả lời từ câu 1 đến câu 6, mỗi câu trả lời đúng được 0,5 điểm.],
  )
  q(
    1,
    [Thanh tra kiểm tra độ lệch chuẩn về khối lượng (đơn vị: kg) của 20 túi đường của một công ty. Các túi được chọn ngẫu nhiên trước khi bán cho người tiêu dùng cho kết quả như sau:
      #block(above: 4mm, below: 4mm, align(center, table(columns: 10, align: center, inset: 5pt, stroke: 0.7pt
          + rgb("#C8102E"), ..(
          "0,95",
          "0,99",
          "1,05",
          "1,00",
          "0,97",
          "0,99",
          "1,03",
          "0,98",
          "1,04",
          "1,01",
          "1,05",
          "1,00",
          "1,02",
          "0,96",
          "0,94",
          "0,98",
          "1,02",
          "1,01",
          "0,99",
          "0,94",
        ).map(x => [#x]))))
      #figure(sugar())
      Đưa mẫu số liệu trên về mẫu số liệu ghép nhóm biết các nhóm có độ dài bằng nhau với nhóm đầu tiên là $["0,94";"0,97")$. Dựa vào bảng mẫu số liệu ghép nhóm đó, tính độ lệch chuẩn. (Làm tròn kết quả đến hàng phần trăm).],
  )
  q(
    2,
    [Một công ty sản xuất đồ gia dụng ước tính chi phí để sản xuất $x$ (sản phẩm) là $C(x)=150x+900$ (nghìn đồng). Khi sản xuất càng nhiều sản phẩm thì chi phí sản xuất trung bình cho mỗi sản phẩm không vượt quá $t$ (nghìn đồng). Tìm giá trị của $t$.
      #figure(scale(x: 110%, y: 110%, reflow: true, factory()))],
  )
  q(
    3,
    [Thể tích nước của một bể bơi sau $t$ phút bơm được tính theo công thức $V(t)=1/100 (30t^3-t^4/4)$ với $0<t<90$. Tốc độ bơm nước ở thời điểm $t$ được tính theo công thức $v(t)=V'(t)$. Tìm tốc độ bơm nước lớn nhất?
      #figure(pool())],
  )
  q(
    4,
    [Từ hình vuông có cạnh bằng $6 "cm"$, người ta cắt bỏ các tam giác vuông cân tạo thành hình tô đậm như hình vẽ. Sau đó người ta gấp thành hình hộp chữ nhật không nắp. Thể tích lớn nhất của khối hộp đó bằng bao nhiêu $"cm"^3$? (Làm tròn kết quả đến hàng phần chục).
      #figure(box-net())],
  )
  q(
    5,
    [Một căn phòng có dạng hình hộp chữ nhật với chiều dài $4 "m"$, chiều rộng $3 "m"$ và chiều cao $3 "m"$. Xét hệ trục tọa độ $O x y z$ có gốc $O$ trùng với một góc phòng và mặt phẳng $O x y$ trùng với mặt sàn (xem hình vẽ), đơn vị đo được lấy theo mét. Trên bức tường thuộc mặt phẳng $O y z$ có một cột dạng hình hộp chữ nhật nhô ra với chiều dài $"0,4" "m"$, chiều rộng $"0,2" "m"$. Bác Nam lắp một bóng đèn trên tường tại vị trí điểm $A(1;0;5/2)$ và công tắc bóng đèn đặt tại điểm $B(1/2;4;1)$. Dây cáp điện cho bóng đèn được đấu từ công tắc điện dọc theo các bức tường (không đi qua trần nhà, sàn nhà) và nối đến bóng đèn. Hỏi bác phải dùng đoạn dây điện có độ dài tối thiểu là bao nhiêu mét (kết quả làm tròn đến hàng phần trăm)?
      #figure(room())],
  )
  q(
    6,
    [Để chuẩn bị cho một buổi triển lãm quốc tế, các trang sức có giá trị lớn được đặt bảo mật trong các khối chóp tứ giác đều $S.A B C D$ và đặt lên phía trên trụ hình hộp chữ nhật $A B C D.A' B' C' D'$ có đáy là hình vuông (như hình vẽ bên). Chọn hệ tọa độ $O x y z$ (đơn vị trên mỗi trục là mét) sao cho $A'(0;0;0)$, $A(0;0;1)$, $B(0;1/2;1)$. Biết rằng, ban tổ chức sự kiện dự định dùng các tấm kính cường lực hình tam giác cân có cạnh bên là $60 "cm"$ để lắp lại thành khối chóp nói trên. Khi đó, tọa độ điểm $S$ là $(a;b;c)$. Tính giá trị của $a+b+c$ (làm tròn kết quả đến hàng phần trăm).
      #figure(display-case())],
  )
}
