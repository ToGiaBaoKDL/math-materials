#import "/templates/exam.typ": exam-question, exam-section
#import "../figures.typ": illustration
#let questions() = {
  let q = exam-question.with(
    keep-together: false,
    keep-body: false,
    question-gap: 6mm,
    statement-gap: 5.5mm,
    answer-gap: 4mm,
  )
  exam-section(
    "I",
    [TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN.],
    instruction: [Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn đúng một phương án.],
  )
  q(
    1,
    [Trong không gian với hệ trục tọa độ $O x y z$ (đơn vị trên mỗi trục tính bằng mét) được thiết lập cho khu vực vận hành drone, một thiết bị bay di chuyển thẳng đều với vận tốc không đổi từ điểm $A ( 1 ; 1 ; 1 )$ đến điểm $B ( 7 ; 10 ; 13 )$ trong thời gian 60 giây. Trên hành trình đó, sau khi xuất phát từ $A$ được 20 giây, drone bay qua điểm kiểm soát $C ( a ; b ; c )$. Tổng $a + b + c$ bằng
      #illustration("flight")],
    columns: 4,
    answers: ([$18$.], [$10$.], [$15$.], [$12$.]),
  )
  q(
    2,
    [Một chất điểm chuyển động theo phương trình $s ( t ) = t^(3) - 3 t^(2) + 5 t + 2$, trong đó thời gian $t > 0$ tính bằng giây và quãng đường $s$ tính bằng mét. Trong 5 giây đầu vận tốc nhỏ nhất của chất điểm bằng bao nhiêu?
      #illustration("motion")],
    columns: 4,
    answers: ([$5$ m/s.], [$3$ m/s.], [$2$ m/s.], [$1$ m/s.]),
  )
  q(
    3,
    [Cho hàm số $y = f ( x )$ có đồ thị như hình vẽ:
      Giá trị cực đại của hàm số bằng
      #illustration("cubic")],
    columns: 4,
    answers: ([$3$.], [$2$.], [$1$.], [$- 1$.]),
  )
  q(4, [Đường tiệm cận đứng của đồ thị hàm số $y = 2 + frac(1, x)$ có phương trình là], columns: 4, answers: (
    [$x = 2$.],
    [$x = 0$.],
    [$y = 2$.],
    [$y = 0$.],
  ))
  q(
    5,
    [Cho hình hộp $A B C D . A_(1) B_(1) C_(1) D_(1)$. Khẳng định nào dưới đây sai?
      #illustration("box")],
    columns: 1,
    answers: (
      [$arrow(B A) + arrow(D D_(1)) + arrow(B D_(1)) = arrow(B C)$.],
      [$arrow(B A) + arrow(B C) + arrow(B B_(1)) = arrow(B D_(1))$.],
      [$arrow(B A) + arrow(B C) = arrow(B_(1) C_(1)) + arrow(B_(1) A_(1))$.],
      [$arrow(A D) + arrow(D_(1) C_(1)) + arrow(D_(1) A_(1)) = arrow(D C)$.],
    ),
  )
  q(
    6,
    [Trong không gian $O x y z$, cho vectơ $arrow(u) = 3 arrow(j) - 4 arrow(i) + 2 arrow(k)$. Tọa độ của vectơ $arrow(u)$ là],
    columns: 2,
    answers: ([$( 3 ; - 4 ; 2 )$.], [$( 3 ; 2 ; - 4 )$.], [$( - 4 ; 2 ; 3 )$.], [$( - 4 ; 3 ; 2 )$.]),
  )
  q(7, [Hàm số nào sau đây đồng biến trên $RR$?], columns: 4, answers: (
    [$y = 2$.],
    [$y = log_(2) x$.],
    [$y = frac(2 x - 1, x + 2)$.],
    [$y = 2^(x)$.],
  ))
  q(
    8,
    [Cho hình chóp $S . A B C D$ có đáy $A B C D$ là hình thoi cạnh bằng $a$, $hat(A B C) = 60 degree$. Biết $S A = S C ","$ tích vô hướng $arrow(A C) ⋅ arrow(S B)$ bằng
      #illustration("pyramid")],
    columns: 4,
    answers: ([$frac(a^(2), 2)$.], [$0$.], [$- a^(2)$.], [$a^(2)$.]),
  )
  q(
    9,
    [Cho hàm số $y = f ( x )$ có đồ thị $y = f' ( x )$ như hình vẽ:
      Hàm số đạt giá trị nhỏ nhất tại
      #illustration("derivative")],
    columns: 4,
    answers: ([$x = 2$.], [$x = 1$.], [$x = - 2$.], [$x = - 1$.]),
  )
  q(
    10,
    [Trong 8 phút đầu kể từ khi xuất phát, độ cao $h$ (tính bằng mét) so với mặt đất của khinh khí cầu vào thời điểm $t$ phút được cho bởi công thức $h ( t ) = 6 t^(3) - 81 t^(2) + 324 t$. Trong 3 phút đầu tiên, độ cao của khinh khí cầu
      #illustration("balloon")],
    columns: 4,
    answers: ([Tăng rồi giảm.], [Giảm rồi tăng.], [Tăng.], [Giảm.]),
  )
  q(
    11,
    [Trong không gian $O x y z$, cho điểm $M ( 1 ; - 2 ; 3 )$. Khoảng cách từ điểm $M$ đến trục $O y$ là],
    columns: 4,
    answers: ([$2$.], [$sqrt(7)$.], [$sqrt(10)$.], [$3$.]),
  )
  q(
    12,
    [Biết đồ thị hàm số $y = f ( x )$ có một đường tiệm cận ngang là $y = 2$. Khi đó, đồ thị hàm số $y = 3 f ( x ) - 2$ có một đường tiệm cận ngang là],
    columns: 4,
    answers: ([$y = - 2$.], [$y = 4$.], [$y = 2$.], [$y = 3$.]),
  )
  exam-section(
    "II",
    [TRẮC NGHIỆM ĐÚNG – SAI.],
    instruction: [Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
  )
  q(1, [Cho hàm số $y = frac(x^(2) + x + 1, x + 1)$.], statements: (
    [Hàm số nghịch biến trên $( - 2 ; 0 )$.],
    [Tiệm cận xiên của đồ thị hàm số là đường thẳng $y = x$.],
    [Gọi $d$ là tiếp tuyến của đồ thị hàm số tại điểm có hoành độ $x = 1$. Giao điểm của đường thẳng $d$ với tiệm cận xiên của đồ thị hàm số là $M ( 3 ; 3 )$.],
    [Đường thẳng đi qua hai điểm cực trị của đồ thị hàm số có phương trình là $y = 2 x - 1$.],
  ))
  q(
    2,
    [Sau một trận lũ lớn, một trạm cứu hộ sử dụng drone để vận chuyển nhu yếu phẩm đến người dân bị cô lập. Chọn hệ trục $O x y z$ với gốc $O$ đặt tại trạm cứu hộ, mặt phẳng $( O x y )$ trùng với mặt đất, trục $O z$ hướng thẳng đứng lên trời, đơn vị đo tính theo mét. Một chiếc drone chưa được sạc đầy pin xuất phát từ trạm, phát hiện được hai địa điểm cần cứu hộ ở trên nóc hai tòa nhà là $A ( 120 ; 90 ; 30 )$ và $B ( 40 ; 30 ; 10 )$. Sau khi bay đến điểm $A$, drone chỉ còn đủ pin để bay $40 %$ quãng đường từ $A$ đến $B .$ Các kết quả làm tròn đến hàng đơn vị.
      #illustration("rescue")],
    statements: (
      [Hai địa điểm cần cứu hộ cách nhau xấp xỉ $102$ m.],
      [Drone chỉ có thể vận chuyển nhu yếu phẩm đến từng địa điểm, nên người ở trạm cứu hộ quyết định dựng thêm một trạm cứu hộ cho riêng hai tòa nhà, mà tổng khoảng cách từ trạm cứu hộ đó đến nóc hai tòa nhà là ngắn nhất. Trạm cứu hộ mới có tọa độ $( 45 ; 60 ; 0 )$.],
      [Vị trí drone hết pin cách mặt đất $20$ m.],
      [Giả sử drone bay với tốc độ không đổi là $10$ m/s. Drone sẽ báo sắp hết pin khoảng $3$ giây trước khi pin hết hẳn. Sau $22$ giây kể từ lúc xuất phát từ trạm, drone sẽ báo sắp hết pin.],
    ),
  )
  q(
    3,
    [Để điều trị cho một bệnh nhân, bác sĩ tiêm một loại thuốc vào tĩnh mạch. Nồng độ $C ( t )$ của thuốc trong máu bệnh nhân (đơn vị: mg/l) thay đổi theo thời gian $t$ (đơn vị: giờ) kể từ lúc tiêm $( t ≥ 0 )$ được xác định bởi công thức $C ( t ) = frac(15 t, t^(2) + 9)$.
      #illustration("medicine")],
    statements: (
      [Nồng độ thuốc trong máu đạt giá trị lớn nhất tại thời điểm $t = 9$ giờ sau khi tiêm.],
      [Giá trị nồng độ thuốc trong máu cao nhất là $"2,5"$ mg/l.],
      [Trong $3$ giờ đầu tiên, nồng độ thuốc trong máu của bệnh nhân tăng.],
      [Tại thời điểm $t = 1$ giờ, tốc độ tăng của nồng độ thuốc là $"1,2"$ mg/l/giờ.],
    ),
  )
  q(
    4,
    [Trong không gian $O x y z$, cho tam giác $A B C$ biết $A ( 7 ; 3 ; 3 ) "," B ( 1 ; 2 ; 4 ) "," C ( 2 ; 3 ; 5 )$.
      #illustration("triangle")],
    statements: (
      [$sin hat(B A C) = sqrt(frac(37, 551))$.],
      [$arrow(A B) ⋅ arrow(A C) = 32$.],
      [Để tứ giác $A B D C$ là hình bình hành thì tọa độ điểm $D$ là $( 8 ; 4 ; 4 )$.],
      [Gọi $H ( a ; b ; c )$ là chân đường cao kẻ từ $A$ của tam giác $A B C$. Khi đó $2 a - 5 b + c = - 8$.],
    ),
  )
  exam-section("III", [TRẮC NGHIỆM TRẢ LỜI NGẮN.], instruction: [Thí sinh trả lời từ câu 1 đến câu 6.])
  q(
    1,
    [Trong một sân vận động, chọn hệ tọa độ $O x y z$, đơn vị đo là mét, trong đó mặt sân nằm trên mặt phẳng $(O x y)$ và trục $O z$ vuông góc với mặt sân. Một hệ thống camera tự động được lắp trên một thanh ray cố định ở phía trên sân. Hai đầu của thanh ray lần lượt có tọa độ là $A ( 0 ; 6 ; 8 )$ và $B ( 12 ; 6 ; 8 ) .$ Camera có thể di chuyển dọc theo đoạn ray $A B$. Một cầu thủ đang đứng cố định tại vị trí $C ( 6 ; 0 ; 0 )$. Gọi $M$ là vị trí của camera. Để hình ảnh cầu thủ rõ nét, nhà sản xuất quy định độ phóng đại hiệu dụng của camera tỉ lệ nghịch với bình phương khoảng cách từ camera đến cầu thủ. Do đó để hình ảnh đạt chất lượng cao nhất, cần tìm vị trí của điểm $M$ để khoảng cách $C M$ nhỏ nhất. Điểm $M$ cách đầu ray $A$ bao nhiêu mét để khoảng cách từ camera đến cầu thủ là nhỏ nhất?
      #illustration("camera")],
  )
  q(
    2,
    [Cho hàm số $y = f ( x )$ có đạo hàm $f' ( x ) = ( x - 1 )^(1) ( x - 2 )^(2) ( x - 3 )^(3) dots.h ( x - 2026 )^(2026)$. Số điểm cực đại của hàm số đã cho là bao nhiêu?],
  )
  q(
    3,
    [Tại một xưởng cơ khí, người ta dùng cần cẩu để di chuyển một kiện hàng. Kiện hàng nặng 50 kg được đặt trên một tấm ván gỗ hình vuông nặng 10 kg. Tấm ván được giữ cân bằng nằm ngang gồm 4 sợi dây cáp nhẹ, không giãn có độ dài bằng nhau. Một đầu của mỗi sợi dây cáp được gắn cố định vào một góc tấm ván, bốn đầu còn lại cùng được xỏ vào móc của cần cẩu. Khi cần cẩu nâng kiện hàng lên theo phương thẳng đứng, mỗi sợi dây cáp hợp với mặt phẳng tấm ván một góc $60 degree$. Lấy gia tốc rơi tự do $g = 10$ m/s². Lực căng của mỗi sợi dây cáp nối từ góc tấm ván đến móc của cần cẩu bằng bao nhiêu Newton? Kết quả làm tròn đến hàng đơn vị.
      #illustration("crane")],
  )
  q(
    4,
    [Bạn Trung có một tờ giấy hình chữ nhật $A B C D$ có chiều dài 15 cm và chiều rộng 10 cm. Gấp góc bên phải của tờ giấy sao cho sau khi gấp, đỉnh $B$ của góc đó chạm lên cạnh $C D$. Biết nếp gấp $M N$ có độ dài nhỏ nhất bằng $frac(a sqrt(b), c)$, với $a "," b "," c ∈ NN^(*)$, $b "," c$ là các số nguyên tố. Tính tổng $a + b + c$.
      #illustration("fold")],
  )
  q(
    5,
    [Tìm tất cả các giá trị của tham số $m$ để hàm số $y = frac(1, 3) x^(3) + m x^(2) - ( m + 7 ) x + 5$ đạt cực tiểu tại $x = 2$.],
  )
  q(
    6,
    [Một cửa hàng thời trang tự thiết kế (Local Brand) đang bán một mẫu áo phông. Hiện tại, trung bình mỗi tháng cửa hàng bán được 500 chiếc với giá 300 nghìn đồng/chiếc. Dữ liệu nghiên cứu thị trường cho thấy nếu cứ giảm giá bán 30 nghìn đồng/chiếc, số lượng áo bán ra sẽ tăng thêm 100 chiếc mỗi tháng. Biết hàm giá bán $p ( x )$ theo số lượng $x$ chiếc áo bán ra là một hàm số bậc nhất. Cửa hàng sản xuất áo với tổng chi phí hàng tháng là $C ( x ) = "0,12" x + 50$ (triệu đồng), trong đó $"0,12"$ triệu đồng là chi phí nguyên vật liệu cho một chiếc áo và $50$ triệu đồng là chi phí mặt bằng, nhân sự. Cửa hàng nên bán mỗi chiếc áo với giá bao nhiêu nghìn đồng để thu được lợi nhuận cao nhất?],
  )
}
