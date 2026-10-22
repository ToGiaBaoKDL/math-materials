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
    [TRẮC NGHIỆM BỐN PHƯƠNG ÁN LỰA CHỌN.],
    instruction: [3,0 điểm, mỗi câu 0,25 điểm. Học sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi học sinh chỉ chọn một phương án.],
  )
  q(1, [Trong các dãy số sau, dãy số nào là một cấp số cộng?], columns: 2, answers: (
    [$1;-3;-6;-9;-12$.],
    [$1;-3;-7;-11;-15$.],
    [$1;3;6;9;12$.],
    [$1;2;4;6;8$.],
  ))
  q(2, [Phương trình $cos x=1$ có các nghiệm là], columns: 2, answers: (
    [$x=k 2pi thin (k in ZZ)$.],
    [$x=pi+k 2pi thin (k in ZZ)$.],
    [$x=pi/2+k pi thin (k in ZZ)$.],
    [$x=k pi thin (k in ZZ)$.],
  ))
  q(3, [Trong không gian, đường thẳng $a$ song song với mặt phẳng $(P)$ nếu], columns: 2, answers: (
    [$a parallel b$ và $b subset.not (P)$.],
    [$a subset.not (P)$ và $a parallel b$ với $b subset (P)$.],
    [$a subset (P)$ và $a parallel b$ với $b subset (P)$.],
    [$a$ và $(P)$ có duy nhất một điểm chung.],
  ))
  q(4, [Hai mặt phẳng được gọi là song song với nhau nếu chúng], columns: 1, answers: (
    [cắt nhau theo một đường thẳng.],
    [có ít nhất một điểm chung.],
    [có chứa hai đường thẳng song song với nhau.],
    [không có điểm chung nào.],
  ))
  q(
    5,
    [Cho cấp số cộng $(u_n)$ có số hạng đầu $u_1=2$ và số hạng thứ 36 là $u_36=72$. Công sai $d$ của cấp số cộng đó là],
    answers: ([$d=2$.], [$d=3$.], [$d=1/2$.], [$d=-2$.]),
  )
  q(6, [Tập nghiệm của phương trình $cos x=cos alpha$ với $alpha in [0;pi]$ là], columns: 1, answers: (
    [$S={alpha+k pi;pi-alpha+k pi | k in ZZ}$.],
    [$S={alpha+k 2pi;pi-alpha+k 2pi | k in ZZ}$.],
    [$S={alpha+k pi;-alpha+k pi | k in ZZ}$.],
    [$S={alpha+k 2pi;-alpha+k 2pi | k in ZZ}$.],
  ))
  q(
    7,
    [Cho hình chóp $S.A B C D$ có đáy $A B C D$ là hình bình hành. Khẳng định nào sau đây là đúng?
      #illustration("pyramid", width: 76mm)
    ],
    columns: 2,
    answers: (
      [$C D parallel (S A D)$.],
      [$C D parallel (S B C)$.],
      [$C D parallel (S A B)$.],
      [$C D parallel (S A C)$.],
    ),
  )
  q(
    8,
    [Cho hình hộp $A B C D.A' B' C' D'$. Mệnh đề nào sau đây là *sai*?
      #illustration("box", width: 78mm)
    ],
    columns: 2,
    answers: (
      [$(A B C D) parallel (A' B' C' D')$.],
      [$(A B B' A') parallel (C D D' C')$.],
      [$(A D D' A') parallel (B C C' B')$.],
      [$(B D D' B') parallel (A C C' A')$.],
    ),
  )
  q(
    9,
    [Một rạp hát có 20 hàng ghế. Hàng đầu tiên có 15 ghế, mỗi hàng sau có nhiều hơn hàng ngay trước nó 3 ghế. Hỏi hàng ghế thứ 20 (hàng cuối cùng) có bao nhiêu ghế?
      #illustration("theater", width: 108.1mm)
    ],
    answers: ([$72$.], [$75$.], [$60$.], [$69$.]),
  )
  q(10, [Đặc điểm nào sau đây luôn đúng với hình lăng trụ?], columns: 1, answers: (
    [Đáy của hình lăng trụ là hình bình hành.],
    [Hình lăng trụ có tất cả các mặt song song với nhau.],
    [Hình lăng trụ có tất cả các mặt bên là hình bình hành.],
    [Hình lăng trụ có tất cả các mặt là hình bình hành.],
  ))
  q(11, [Tổng tất cả các nghiệm của phương trình $sin 2x=cos x$ trên đoạn $[0;pi]$ bằng], answers: (
    [$(3pi)/2$.],
    [$pi/2$.],
    [$2pi$.],
    [$(5pi)/6$.],
  ))
  q(
    12,
    [Cho tứ diện $A B C D$. Gọi $I,J$ lần lượt là trọng tâm các tam giác $A B C$ và $A B D$. Gọi $M,N$ lần lượt là trung điểm của $B C,B D$. Mặt phẳng $(I J M N)$ song song với đường thẳng nào dưới đây?
      #illustration("tetrahedron", width: 72mm)
    ],
    answers: ([$B D$.], [$C D$.], [$A B$.], [$B C$.]),
  )
  exam-section(
    "II",
    [TRẮC NGHIỆM ĐÚNG – SAI.],
    instruction: [2,0 điểm, mỗi câu 1,0 điểm. Học sinh trả lời câu 1 và câu 2. Trong mỗi ý a), b), c), d) ở mỗi câu, học sinh chọn đúng hoặc sai.],
  )
  q(
    1,
    [Một học sinh dự định tiết kiệm tiền để mua một chiếc xe đạp trị giá 2 000 000 đồng. Học sinh đó lên kế hoạch:

      – Ngày đầu tiên tiết kiệm 10 000 đồng.

      – Từ ngày thứ hai trở đi, mỗi ngày sẽ tiết kiệm nhiều hơn ngày liền trước đó 2 000 đồng.
      #illustration("bicycle", width: 92mm)
      Xét tính đúng sai của các khẳng định sau:
    ],
    statements: (
      [Số tiền học sinh đó tiết kiệm mỗi ngày (lần lượt theo thứ tự ngày) lập thành một cấp số cộng với công sai $d=2 thin 000$ đồng.],
      [Vào đúng ngày thứ 10, số tiền học sinh đó tiết kiệm được (chỉ tính riêng ngày thứ 10) là 30 000 đồng.],
      [Tổng số tiền học sinh đó tiết kiệm được sau 15 ngày đầu tiên là 360 000 đồng.],
      [Sau đúng 35 ngày kể từ lúc bắt đầu, học sinh đó đã gom đủ tiền để mua chiếc xe đạp.],
    ),
  )
  q(
    2,
    [Cho hình chóp $S.A B C$ có đáy là tam giác đều cạnh bằng $6 "cm"$. Các điểm $M,N,P$ lần lượt thuộc cạnh $S A,S B,S C$ sao cho $(S M)/(S A)=(S N)/(S B)=(S P)/(S C)=2/3$.
      #illustration("section", width: 70mm)
      Xét tính đúng sai của các khẳng định sau:
    ],
    statements: (
      [$M N parallel (A B C)$.],
      [$(M N P) parallel (A B C)$.],
      [Tam giác $M N P$ là tam giác đều.],
      [Một mặt phẳng $(alpha)$ qua $M$ và song song với $(A B C)$ cắt các mặt bên của hình chóp $S.A B C$ theo các đoạn giao tuyến tạo thành một tam giác có diện tích bằng $(9sqrt(3))/4 "cm"^2$.],
    ),
  )
  exam-section(
    "III",
    [TRẮC NGHIỆM TRẢ LỜI NGẮN.],
    instruction: [2,0 điểm, mỗi câu 0,5 điểm. Học sinh trả lời từ câu 1 đến câu 4.],
  )
  q(1, [Cho dãy số $(u_n)$ có số hạng tổng quát $u_n=(2n+5)/(n+1)$. Tìm giá trị của số hạng thứ 4 của dãy số.])
  q(
    2,
    [Phần trong của một bể nước được xây có dạng hình hộp chữ nhật có chiều cao $4 "m"$ như hình bên. Bác An lấy một thanh thước thẳng đủ dài cắm vào bể sao cho một đầu chạm đáy bể và để thước tựa vào mép dưới của thành miệng bể, đánh dấu điểm tựa. Sau đó rút thước lên, bác đo được độ dài của phần thước chìm trong nước là $3 "m"$ và độ dài của phần thước từ điểm đánh dấu đến điểm không bị ướt nước là $2 "m"$. Tính mực nước còn lại trong bể.
      #illustration("tank", width: 112mm)
    ],
  )
  q(
    3,
    [Cho hình lăng trụ $A B C.A' B' C'$. Gọi $G$ là trọng tâm của tam giác $A A' C'$ và $H$ là một điểm thuộc cạnh $A B$ sao cho $A B=x dot A H$ với số thực $x>0$. Hỏi giá trị của số thực $x$ bằng bao nhiêu để đường thẳng $G H$ song song với mặt phẳng $(B C C' B')$?
      #illustration("prism", width: 76mm)
    ],
  )
  q(
    4,
    [Ong mật được xem là “kiến trúc sư” xuất sắc trong tự nhiên. Một tổ ong có mặt cắt được tạo thành từ các ô hình lục giác đều xếp khít nhau theo từng lớp bao quanh một ô trung tâm, như hình vẽ. Trong đó hình thứ nhất có 1 ô tổ, hình thứ hai có 7 ô tổ, hình thứ ba có 19 ô tổ. Theo quy luật ấy, gọi $f(n)$ là số ô tổ của hình thứ $n$. Giá trị của $f(30)$ bằng bao nhiêu?
      #illustration("honeycomb", width: 140mm)
    ],
  )
  exam-section("IV", [TỰ LUẬN.], instruction: [3,0 điểm. Học sinh trình bày tự luận.])
  q(1, [*(0,75 điểm)* Giải phương trình lượng giác sau: $sin(2x-pi/3)=sin(x+pi/4)$.])
  q(
    2,
    [*(1,25 điểm)* Cho hình chóp $S.A B C D$ có đáy là hình bình hành tâm $O$. Gọi $M,N$ lần lượt là trung điểm của $S A$ và $S D$.
      #illustration("pyramid-midpoints", width: 83mm)
    ],
    statements: (
      [Chứng minh $(O M N) parallel (S B C)$.],
      [Gọi $E$ là trung điểm đoạn $A B$ và $F$ là một điểm thuộc đoạn $O N$. Chứng minh $E F$ song song với mặt phẳng $(S B C)$.],
    ),
  )
  q(
    3,
    [*(1,0 điểm)* Tại một công viên giải trí, độ cao $h$ (tính bằng mét) của một cabin trên vòng quay Ferris so với mặt đất được mô hình hóa bởi hàm số:
      $ h(t)=20+15sin(pi/10 t-pi/2), $
      trong đó $t$ là thời gian (tính bằng phút) kể từ lúc cabin bắt đầu quay từ vị trí thấp nhất.
      #illustration("ferris", width: 80mm)
    ],
    keep-together: false,
    statements: (
      [Tính độ cao của cabin sau khi vòng quay hoạt động được 5 phút.],
      [Trong một chu kỳ quay đầu tiên (từ $t=0$ đến $t=20$ phút), cabin đạt độ cao $27,5 "m"$ tại những thời điểm nào? (Làm tròn kết quả đến hàng phần trăm).],
    ),
  )
}
