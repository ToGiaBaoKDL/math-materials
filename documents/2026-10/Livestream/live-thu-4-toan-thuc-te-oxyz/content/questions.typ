#import "/templates/lesson.typ": exercise, lesson-section
#import "/templates/components.typ": end-mark, figure-panel as panel
#import "../figures.typ": *

#let figure-panel = panel.with(above: 5mm, below: 6mm)

#let questions(variant) = {
  let item = exercise.with(
    variant: variant,
    keep-together: false,
    flow-stem: true,
    question-gap: 8mm,
    writing-line-gap: 9mm,
    writing-single-page: true,
    fill-writing-page: true,
  )
  lesson-section([BÀI TOÁN TỔNG HỢP LỰC], number: 1)
  item(
    1,
    [
      *(THPT ĐINH TIÊN HOÀNG – NINH BÌNH)* Một chiếc máy bay điều khiển từ xa mini đang đậu tại điểm $A$ nằm trên mặt phẳng nằm ngang $lr(( α ))$. Lúc khởi động nó chịu tác động của ba lực đẩy: $arrow(F_(1))$, $arrow(F_(2))$, $arrow(F_(3))$. Hai cánh quạt trái và phải tạo ra hai lực $arrow(F_(1))$, $arrow(F_(2))$ có giá nằm trong mặt phẳng ngang $lr(( α ))$ và $lr(( arrow(F_(1)) "," arrow(F_(2)) )) = 135 degree$. Một lực nâng $arrow(F_(3))$ do cánh quạt chính tạo ra có giá vuông góc với $lr(( α ))$ và hướng lên trên. Độ lớn hợp lực của các lực $arrow(F_(1))$, $arrow(F_(2))$, $arrow(F_(3))$ bằng bao nhiêu Niu-tơn, biết rằng độ lớn của ba lực đó lần lượt là $20$N, $15$N và $10$N (Kết quả làm tròn đến hàng phần chục)?
      #figure-panel(drone-forces())
    ],
    source-id: "question-1",
    writing-lines: 5,
  )
  item(
    2,
    [
      *(THPT CHUYÊN SƠN LA)* Một chất điểm ở vị trí đỉnh $A$ của hình lập phương $A B C D . A' B' C' D'$. Chất điểm chịu tác động bởi ba lực $arrow(a) "," arrow(b) "," arrow(c)$ lần lượt cùng hướng với $arrow(A D) "," arrow(A B)$ và $arrow(A C')$ như hình vẽ. Độ lớn của các lực $arrow(a) "," arrow(b)$ và $arrow(c)$ tương ứng là $10 "N" "," 10 "N"$ và $25 "N"$. Tính $abs(arrow(a) + arrow(b) + arrow(c))$ (làm tròn kết quả đến hàng phần mười).
      #figure-panel(scale(x: 86.4%, y: 86.4%, reflow: true, cube-forces()))
    ],
    source-id: "question-2",
    writing-lines: 5,
  )
  item(
    3,
    [
      *(THPT TRƯỜNG XUÂN – ĐỒNG THÁP)* Một chiếc đèn chùm được thiết kế với đĩa đèn được giữ bởi bốn đoạn cáp $S A$, $S B$, $S C$, $S D$  sao cho $S A=S B=S C=S D$ và $A B C D$ là hình vuông,  góc $hat(B S D) = 120 degree$ (xem hình vẽ). Biết độ lớn của lực căng của mỗi sợi dây cáp $8 sqrt(3)$ (N). Độ lớn của trọng lực $arrow(P)$ tác động lên chiếc đèn chùm bằng $a sqrt(b) ("N")$ . Tìm $a+b$ (biết $a,b$ là hai số nguyên dương và $a/b$ tối giản).
      #figure-panel(scale(x: 80%, y: 80%, reflow: true, chandelier()))
    ],
    source-id: "question-3",
    writing-lines: 7,
  )
  lesson-section([BÀI TOÁN CHUYỂN ĐỘNG], number: 2)
  item(
    4,
    [
      *(THPT CHU VĂN AN – ĐỒNG THÁP)* Trong không gian với một hệ trục toạ độ cho trước (đơn vị đo lấy theo kilômét), ra đa phát hiện một chiếc máy bay di chuyển với vận tốc và hướng không đổi từ điểm $A lr(( 800 ";" 500 ";" 7 ))$ đến điểm $B lr(( 940 ";" 550 ";" 9 ))$ trong 10 phút. Nếu máy bay tiếp tục giữ nguyên vận tốc và hướng bay thì toạ độ của máy bay sau 5 phút tiếp theo là $C ( x ";" y ";" z )$. Tính $x + y + z$.
      #figure-panel(image("../images/fighter-aircraft.jpeg", width: 90mm))
    ],
    source-id: "question-4",
    writing-lines: 5,
  )
  item(
    5,
    [
      *(THPT YÊN DŨNG SỐ 2 – BẮC NINH)* Trong không gian chọn hệ trục tọa độ cho trước, đơn vị đo lấy kilômét, ra đa phát hiện một máy bay chiến đấu $X$ di chuyển với vận tốc và hướng không đổi từ điểm $M lr(( 1000 ";" 600 ";" 14 ))$ đến điểm $N$ trong 30 phút. Nếu máy bay tiếp tục giữ nguyên vận tốc và hướng bay thì tọa độ của máy bay sau 10 phút tiếp theo đến $Q lr(( 1400 ";" 800 ";" 16 ))$. Tọa độ vị trí điểm $N lr(( a ";" b ";" c ))$, tính $S = a + b + 2 c$.
      #figure-panel(flight-path())
    ],
    source-id: "question-5",
    writing-lines: 5,
  )
  item(
    6,
    [
      *(THPT NGÔ SỸ LIÊN – BẮC NINH)* Trong không gian với hệ tọa độ $O x y z$, đơn vị trên mỗi trục tọa độ tương ứng với $10 "km"$. Trạm kiểm soát không lưu đặt tại gốc tọa độ $O lr(( 0 ";" 0 ";" 0 ))$. Một máy bay đang ở vị trí $A lr(( - 65 ";" - 54 ";" 6 ))$ chuyển động theo hướng $arrow(u) lr(( 3 ";" 4 ";" 0 ))$ với tốc độ không đổi $800 "km" / h$. Máy bay sẽ được hiển thị trên màn hình rađa nếu nó nằm trong phạm vi cách đài kiểm soát không quá $430 "km"$. Gọi $B lr(( a ";" b ";" c ))$ là vị trí cuối cùng máy bay xuất hiện trên màn hình rađa. Tính giá trị $a + b + c$.
      #figure-panel(radar-flight())
    ],
    source-id: "question-6",
    writing-lines: 7,
  )
  item(
    7,
    [
      *(THPT KIẾN AN – HẢI PHÒNG)* Một người đứng ở mặt đất điều khiển hai flycam để phục vụ trong một chương trình của đài truyền hình. Flycam $I$ ở vị trí $A$ cách vị trí điều khiển $150 m$ về phía nam và $200 m$ về phía đông, đồng thời cách mặt đất $50 m$. Flycam $I I$ ở vị trí $B$ cách vị trí điều khiển $180 m$ về phía nam và $240 m$ về phía đông, đồng thời cách mặt đất $60 m$. Chọn hệ trục tọa độ $O x y z$ với gốc $O$ là vị trí người điều khiển, mặt phẳng $lr(( O x y ))$ trùng với mặt đất, trục $O x$ có hướng trùng với hướng nam, trục $O y$ có hướng trùng với hướng đông, trục $O z$ vuông góc với mặt đất hướng lên bầu trời, đơn vị trên mỗi trục tính theo mét. Khoảng cách giữa hai flycam đó bằng bao nhiêu mét? (làm tròn kết quả đến hàng đơn vị).
      #figure-panel(scale(x: 90%, y: 90%, reflow: true, drones()))
    ],
    source-id: "question-7",
    writing-lines: 5,
  )
  lesson-section([BÀI TOÁN TỌA ĐỘ HÓA MÔ HÌNH], number: 3)
  item(
    8,
    [
      *(THPT YÊN DŨNG SỐ 2 – BẮC NINH)* Hình vẽ minh hoạ sơ đồ một ngôi nhà trong hệ trục tọa độ $O x y z$, trong đó nền nhà, bốn bức tường và hai mái nhà đều là hình chữ nhật. Biết $F ( a ";" b ";" c )$. Giá trị của tổng $a + b + c$ bằng bao nhiêu
      #figure-panel(scale(x: 80%, y: 80%, reflow: true, gable-house()))
    ],
    source-id: "question-8",
    writing-lines: 5,
  )
  item(
    9,
    [
      *(THPT TRƯỜNG XUÂN – ĐỒNG THÁP)* Chọn hệ trục tọa độ Oxyz ( đơn vị trên mỗi trục là mét) trong một căn phòng hình hộp chữ nhật cao 3,5 m như hình sau. Có một bóng đèn treo đang ở vị trí B. Gọi H là hình chiếu vuông góc của B xuống mặt sàn (Oxy). Biết độ dài dây treo $A B = 1 m$, $lr(( arrow(j) "," arrow(O H) )) = 45 degree$, khoảng cách HK từ H đến trục Oy là 5m. Khi đó tọa độ của bóng đèn B là $B(a,b,c)$. Tính giá trị biểu thức $S = a + b + 2 c$.
      #figure-panel(scale(x: 80%, y: 80%, reflow: true, room-lamp()))
    ],
    source-id: "question-9",
    writing-lines: 5,
  )
  item(
    10,
    [
      *(THPT NGUYỄN HUỆ - HỒ CHÍNH MINH)* Một ngôi nhà gồm hai phần (như hình vẽ). Phần thân nhà dạng hình hộp chữ nhật $A B C D . O M N P .$ Phần mái nhà dạng hình chóp $S . A B C D$ có các cạnh bên bằng nhau, $B D = 200 sqrt(106) lr(( c m ))$ và số đo của góc nhị diện $lr([ S "," C D "," A ])$ bằng $30 degree$. Chọn hệ trục toạ độ $O x y z$ sao cho $M$ thuộc tia $O x$, $P$ thuộc tia $O y$, $A$ thuộc tia $O z$. Giả sử cao độ của điểm $C$ là $520$, tung độ của trọng tâm $G$ của tam giác $S C D$ là $1500$, đơn vị trên mỗi trục là $c m$. Biết $arrow(S C) = lr(( m ";" n ";" p ))$. Giá trị của biểu thức $P = 4 m + 2 n + p$ bằng bao nhiêu (làm tròn kết quả đến hàng đơn vị)?
      #figure-panel(scale(x: 80%, y: 80%, reflow: true, roof-house()))
    ],
    source-id: "question-10",
    writing-lines: 7,
  )
  if variant == "de" {
    v(1fr)
    end-mark([])
  }
}
