#import "/templates/exam.typ": exam-question
#import "/templates/exam-lesson.typ": exam-section

#let q = exam-question.with(
  keep-together: true,
  question-gap: 4.5mm,
  statement-gap: 3mm,
  question-label-color: rgb("#B00012"),
  question-tag: none,
)

#let fig(name, width) = block(
  width: 100%,
  breakable: false,
  above: 3mm,
  below: 2.5mm,
  align(center, image("../figures/" + name, width: width)),
)

#let questions() = [
  #exam-section(
    "I",
    [TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN],
    instruction: [Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
  )

  #q(
    1,
    [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
      #fig("variation-q1.svg", 116mm)
      Hàm số $y = f(x)$ đồng biến trên khoảng nào trong các khoảng dưới đây?],
    answers: (
      [$(-infinity; -1)$.],
      [$(2; 4)$.],
      [$(-infinity; 1)$.],
      [$(1; +infinity)$.],
    ),
  )

  #block(width: 100%, breakable: false, above: 5mm)[
    #grid(
      columns: (1fr, 52mm),
      gutter: 6mm,
      align: horizon,
      [#q(
        2,
        [Đường cong dưới đây là đồ thị của hàm số nào?],
        answers: (
          [$y = x^3 - 3x + 1$.],
          [$y = -x^3 + 3x + 1$.],
          [$y = frac(x^2 - x + 2, x - 2)$.],
          [$y = frac(-x + 2, 2x - 1)$.],
        ),
        columns: 2,
        question-gap: 0pt,
      )],
      image("../figures/cubic-q2.svg", width: 50mm),
    )
  ]

  #block(width: 100%, breakable: false, above: 1mm)[
    #grid(
      columns: (1fr, 62mm),
      gutter: 6mm,
      align: horizon,
      [#q(
        3,
        [Cho hàm số $y = f(x)$ liên tục trên đoạn $[0; 3]$ và có đồ thị như hình vẽ bên. Hàm số $y = f(x)$ trên đoạn $[0; 3]$ có bao nhiêu điểm cực đại?],
        answers: (
          [$4$.],
          [$3$.],
          [$1$.],
          [$2$.],
        ),
        columns: 2,
        question-gap: 0pt,
      )],
      image("../figures/piecewise-q3.svg", width: 60mm),
    )
  ]

  #block(width: 100%, breakable: false, above: 0mm)[
    #grid(
      columns: (1fr, 68mm),
      gutter: 5mm,
      align: top,
      [#q(
        4,
        [Trong không gian, cho hình hộp $A B C D.A'B'C'D'$. Vectơ nào sau đây bằng vectơ $arrow(A'D)$?],
        answers: (
          [$arrow(A D)$.],
          [$arrow(B C')$.],
          [$arrow(D A')$.],
          [$arrow(B'C)$.],
        ),
        columns: 2,
        question-gap: 0pt,
      )],
      move(dy: -4mm, image("../figures/box-q4.svg", width: 65mm)),
    )
  ]

  #q(
    5,
    [Cho hàm số $y = frac(a x + b, c x + d)$, ($a c != 0, a d - b c != 0$) có bảng biến thiên như hình dưới đây.
      #fig("variation-q5.svg", 112mm)
      Đường tiệm cận đứng của đồ thị hàm số đã cho có phương trình là],
    answers: (
      [$x = 2$.],
      [$x = 3$.],
      [$y = 2$.],
      [$y = 3$.],
    ),
    question-gap: 1mm,
  )

  #block(width: 100%, breakable: false, above: 2.5mm)[
    #grid(
      columns: (1fr, 67mm),
      gutter: 5mm,
      align: horizon,
      [#q(
        6,
        [Cho hàm số $y = f(x)$ có đồ thị trên đoạn $[-1; 5]$ như hình vẽ. Giá trị lớn nhất $M$ và giá trị nhỏ nhất $m$ của hàm số $f(x)$ trên $[-1; 5]$ lần lượt là],
        answers: (
          [$M = 2; m = 4$.],
          [$M = 5; m = -1$.],
          [$M = 3; m = -2$.],
          [$M = 3; m = 1$.],
        ),
        columns: 2,
        question-gap: 0pt,
      )],
      image("../figures/graph-q6.svg", width: 65mm),
    )
  ]

  #q(
    7,
    [Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = 2x + 4, forall x in RR$. Hàm số đã cho nghịch biến trên khoảng nào trong các khoảng sau?],
    answers: (
      [$(-infinity; 2)$.],
      [$(-2; 0)$.],
      [$(-infinity; -2)$.],
      [$(-2; +infinity)$.],
    ),
    question-gap: 2.5mm,
  )

  #q(
    8,
    [Cho tam giác $A B C$ có $A B = 4$, $A C = 5$ và góc $hat(B A C) = 60 degree$. Tính tích vô hướng $arrow(A B) dot arrow(A C)$.],
    answers: (
      [$arrow(A B) dot arrow(A C) = 20$.],
      [$arrow(A B) dot arrow(A C) = -10$.],
      [$arrow(A B) dot arrow(A C) = 10$.],
      [$arrow(A B) dot arrow(A C) = 10sqrt(3)$.],
    ),
    columns: 4,
    question-gap: 2.5mm,
  )

  #q(
    9,
    [Tiệm cận ngang của đồ thị hàm số $y = frac(4x + 2, 2x - 1)$ là đường thẳng có phương trình là],
    answers: (
      [$y = 2$.],
      [$y = frac(1, 2)$.],
      [$x = frac(1, 2)$.],
      [$x = 2$.],
    ),
    question-gap: 2.5mm,
  )

  #block(width: 100%, breakable: false, above: 5mm)[
    #grid(
      columns: (1fr, 60mm),
      gutter: 5mm,
      align: top,
      [#q(
        10,
        [Cho hình hộp $M N P Q.M'N'P'Q'$. Khẳng định nào sau đây là đúng?],
        answers: (
          [$arrow(M P') = arrow(M N) + arrow(N P) + arrow(M M')$.],
          [$arrow(M P') = arrow(N Q) + arrow(M P) + arrow(M M')$.],
          [$arrow(M P') = arrow(M N) + arrow(M P) + arrow(M M')$.],
          [$arrow(M P') = arrow(M N) + arrow(M Q) + arrow(M M')$.],
        ),
        columns: 1,
        question-gap: 0pt,
      )],
      image("../figures/box-q10.svg", width: 60mm),
    )
  ]

  #q(
    11,
    [Cho hình chóp $S.A B C D$ có đáy là hình bình hành $A B C D$. Tìm vectơ $arrow(A B) + arrow(A D)$.],
    answers: (
      [$arrow(B D)$.],
      [$arrow(D B)$.],
      [$arrow(C A)$.],
      [$arrow(A C)$.],
    ),
  )

  #q(
    12,
    [Cho hàm số $y = f(x)$ có bảng biến thiên như sau:
      #fig("variation-q12.svg", 118mm)
      Giá trị cực đại của hàm số đã cho là],
    answers: (
      [$0$.],
      [$2$.],
      [$-10$.],
      [$24$.],
    ),
  )

  #exam-section(
    "II",
    [TRẮC NGHIỆM ĐÚNG – SAI],
    instruction: [Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chỉ chọn đúng hoặc sai.],
  )

  #q(1, [Cho hình chóp tứ giác đều $S.A B C D$ có tất cả các cạnh đều bằng $2$. Khi đó], keep-together: false)

  #block(width: 100%, breakable: false, above: 1mm)[
    #grid(
      columns: (1fr, 63mm),
      gutter: 5mm,
      align: horizon,
      [#q(
        none,
        [],
        statements: (
          [$arrow(A B) + arrow(A D) = 2 arrow(A O)$ (với $O$ là tâm của hình vuông $A B C D$).],
          [$abs(arrow(S A) + arrow(S C)) = 2sqrt(2)$.],
          [$cos(arrow(S A), arrow(C D)) = -frac(1, 2)$.],
          [$arrow(S A) dot arrow(C D) = -2$.],
        ),
        question-gap: 0pt,
      )],
      image("../figures/pyramid-ii-q1.svg", width: 60mm),
    )
  ]

  #q(
    2,
    [Cho hàm số $y = -x^3 + 3x^2 + 9x - 1$. Khi đó
      #v(3mm)
      a) Hàm số đã cho đồng biến trên khoảng $(-1; 3)$.],
  )
  #block(above: 2mm)[b) Hàm số đạt cực đại tại điểm $x = -1$ và đạt cực tiểu tại điểm $x = 3$.]
  #block(above: 2mm)[c) Giá trị nhỏ nhất của hàm số đã cho trên đoạn $[-2; 0]$ bằng $-6$.]
  #block(above: 2mm)[d) Tâm đối xứng của đồ thị hàm số đã cho là điểm $I(1; 10)$.]

  #q(
    3,
    [Cho hàm số $y = frac(x^2 + x + 4, x + 1)$. Khi đó],
    statements: (
      [Hàm số có đạo hàm là $y' = frac(x^2 + 2x - 3, (x + 1)^2)$.],
      [Hàm số đồng biến trên các khoảng $(-infinity; -3)$ và $(1; +infinity)$.],
      [Giá trị cực đại của hàm số đã cho bằng $-3$.],
      [Tiệm cận xiên của đồ thị hàm số có phương trình $y = x$.],
    ),
    statement-gap: 2mm,
  )

  #q(
    4,
    [Một vật chuyển động theo phương nằm ngang, có chiều dương từ trái sang phải. Vị trí của vật được cho bởi hàm số $s(t) = -frac(1, 3)t^3 + 3t^2 - 8t$, trong đó $t > 0$, $t$ tính bằng giây và $s$ tính bằng mét.],
    statements: (
      [Vận tốc của vật tại thời điểm $t = 5$ là $-3" m/s"$.],
      [Gia tốc của vật tại thời điểm $t = 5$ là $4" m/s"^2$.],
      [Trong khoảng thời gian từ $t = 2$ đến $t = 4$, vật chuyển động sang phải.],
      [Vận tốc lớn nhất của vật trong suốt quá trình chuyển động bằng $1" m/s"$.],
    ),
    statement-gap: 2mm,
  )

  #exam-section(
    "III",
    [TRẮC NGHIỆM TRẢ LỜI NGẮN],
    instruction: [Thí sinh trả lời từ câu 1 đến câu 6.],
  )

  #q(
    1,
    [Giả sử hàm số $f(x) = 2x^3 - 9x^2 + 12x + 1$ đạt cực đại tại $x = a$ và đạt cực tiểu tại $x = b$. Giá trị của biểu thức $S = 3a - 2b$ là bao nhiêu?],
  )

  #q(
    2,
    [Nồng độ của một chất ô nhiễm trong một hồ nước sau $t$ giờ kể từ thời điểm bắt đầu xử lý được tính bởi công thức: $f(t) = frac(2t + 1, t + 2)$ (mg/lít). Tính tốc độ thay đổi nồng độ chất ô nhiễm đó sau $7$ giờ kể từ thời điểm bắt đầu xử lý (đơn vị: mg/lít/giờ, kết quả viết dưới dạng số thập phân, làm tròn đến hàng phần trăm).],
    keep-together: false,
  )

  #q(
    3,
    [Hình 1 biểu diễn một tấm bìa cứng dạng hình chữ nhật có các cạnh dài $4$ mét và $8$ mét. Ở mỗi góc người ta cắt đi một hình thang để được hình dạng như ở hình 2; hình này gồm hai tam giác cân bằng nhau và ba hình chữ nhật. Với mỗi tam giác cân: hai cạnh bên có độ dài $x$ mét và chiều cao là $h$ mét. Sau đó tấm bìa còn lại ở hình 2 được gấp theo các nét đứt để tạo thành một lăng trụ tam giác kín có chiều dài $y$ mét như ở hình 3. Tìm giá trị của $x$ (m) để thể tích $V$ của khối lăng trụ đạt giá trị lớn nhất (kết quả viết dưới dạng số thập phân, làm tròn đến hàng phần chục).
      #fig("net-prism-iii-q3.svg", 99mm)],
    keep-together: false,
  )

  #block(width: 100%, breakable: false, above: 3.5mm)[
    #grid(
      columns: (1fr, 58mm),
      gutter: 5mm,
      align: horizon,
      [#q(
        4,
        [Trên một công trường xây dựng, một khung thép chịu lực tại điểm móc $O$ đang bị kéo đồng thời bởi ba dây cáp $O A, O B, O C$ chịu lực không dãn (như hình vẽ minh hoạ). Lực căng của mỗi sợi dây đặt tại điểm $O$ tương ứng là ba lực $arrow(F)_1, arrow(F)_2, arrow(F)_3$ có độ lớn lần lượt là $20" N", 20" N", 15" N"$. Biết rằng $(arrow(F)_1; arrow(F)_2) = 120 degree$ và $arrow(F)_3$ đều tạo với 2 lực còn lại góc có số đo $60 degree$.],
        question-gap: 0pt,
      )],
      image("../figures/forces-iii-q4.svg", width: 56mm),
    )
    Hãy tính độ lớn của lực tổng hợp tác dụng lên điểm móc $O$ để đội ngũ kỹ thuật có thể lựa chọn thiết bị neo giữ phù hợp (đơn vị: N).
  ]

  #q(
    5,
    [Cho hình chóp tứ giác đều $S.A B C D$ có độ dài cạnh bên và cạnh đáy đều bằng $3$. Tính $arrow(A B) dot arrow(S C)$.
      #fig("pyramid-iii-q5.svg", 50.6mm)],
  )

  #q(
    6,
    [Một xưởng sản xuất thiết bị điện tử có công suất không quá $300$ chiếc tai nghe thông minh mỗi tháng. Nếu xưởng sản xuất $x$ chiếc tai nghe mỗi tháng ($1 <= x <= 300$) thì tổng doanh thu thu được khi bán hết số sản phẩm đó là $D(x) = 120x$ (triệu đồng), trong khi chi phí sản xuất bình quân cho mỗi chiếc tai nghe là $0,002 x^2 + 60 + frac(20, x)$ (triệu đồng). Hỏi lợi nhuận lớn nhất mà xưởng đạt được trong một tháng là bao nhiêu triệu đồng?],
  )
]
