#import "/templates/exam.typ": exam-question
#import "/templates/exam-lesson.typ": exam-section

#let q = exam-question.with(
  keep-together: true,
  question-gap: 4mm,
  statement-gap: 2.5mm,
  question-label-color: rgb("#B00012"),
  question-tag: none,
)

#let fig(name, width) = block(
  width: 100%,
  breakable: false,
  above: 1.5mm,
  below: 1.5mm,
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
    [Cho hình chóp $S . A B C D$ có đáy là hình bình hành tâm $O$. Tổng
      $arrow(S A) + arrow(S B) + arrow(S C) + arrow(S D)$ bằng],
    figure: image("../figures/pyramid.svg", width: 50mm),
    answers: ([$arrow(0)$], [$4 arrow(S O)$], [$2 arrow(S O)$], [$arrow(S O)$]),
  )

  #q(
    2,
    [Cho hình lăng trụ $A B C . A' B' C'$. Đặt $arrow(A A') = arrow(a)$, $arrow(A B) = arrow(b)$, $arrow(A C) = arrow(c)$. Khẳng định nào sau đây là đúng?],
    figure: image("../figures/prism.svg", width: 48mm),
    answers: (
      [$arrow(B' C) = -arrow(a) + arrow(b) - arrow(c)$],
      [$arrow(B' C) = -arrow(a) - arrow(b) + arrow(c)$],
      [$arrow(B' C) = arrow(a) + arrow(b) - arrow(c)$],
      [$arrow(B' C) = arrow(a) + arrow(b) + arrow(c)$],
    ),
  )

  #q(
    3,
    [Cho hàm số $y = 2x + 1 + 3/(x + 3)$ có đồ thị là $(C)$. Khoảng cách từ điểm $M(2;-1)$ đến tiệm cận xiên của đồ thị $(C)$ là],
    answers: ([$2$], [$6/sqrt(5)$], [$3$], [$4/sqrt(5)$]),
  )

  #q(
    4,
    [Trong không gian, cho hai vectơ $arrow(a)$, $arrow(b)$ thỏa mãn $abs(arrow(a)) = 3$; $abs(arrow(b)) = 2$ và $arrow(a) dot arrow(b) = -3$. Góc $alpha$ là góc giữa hai vectơ $arrow(a)$ và $arrow(b)$. Khẳng định nào sau đây là đúng?],
    answers: ([$alpha = 30 degree$], [$alpha = 45 degree$], [$alpha = 60 degree$], [$alpha = 120 degree$]),
  )

  #q(
    5,
    [Cho hàm số $y = f(x) = (a x + b)/(c x + d)$, $(c != 0; a d - b c != 0)$ có bảng biến thiên như sau:
      #fig("rational-asymptote-variation.svg", 118mm)
      Đường tiệm cận đứng của đồ thị hàm số là],
    answers: ([$y = 2$], [$x = 2$], [$y = -1$], [$x = -1$]),
  )

  #q(
    6,
    [Cho hàm số đa thức bậc ba $y = f(x)$ có đồ thị như hình vẽ. Số điểm cực tiểu của hàm số $y = f(x)$ là],
    figure: image("../figures/cubic.svg", width: 59.8mm),
    columns: 1,
    answers: ([$1$], [$0$], [$3$], [$2$]),
  )

  #q(
    7,
    [Cho hàm số $y = f(x)$ liên tục trên đoạn $[-1;3]$ và có đồ thị như hình bên dưới. Gọi $M$ và $m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $f(x)$ trên đoạn $[-1;3]$. Giá trị của $M + m$ bằng],
    figure: image("../figures/piecewise.svg", width: 68mm),
    columns: 2,
    answers: ([$4$], [$3$], [$2$], [$0$]),
  )

  #q(
    8,
    [Đồ thị hàm số $y = x^3 - 3x + 2026$ có hai điểm cực trị là $A$, $B$. Độ dài đoạn thẳng $A B$ bằng],
    columns: 2,
    answers: ([$2 sqrt(5)$], [$2 sqrt(13)$], [$5 sqrt(2)$], [$5 sqrt(13)$]),
  )

  #q(
    9,
    [Cho hàm số $y = f(x) = (x + 2026)/(2x - 1)$ có đồ thị $(C)$. Tổng số đường tiệm cận đứng và tiệm cận ngang của đồ thị $(C)$ là],
    answers: ([$3$], [$1$], [$0$], [$2$]),
  )

  #q(
    10,
    [Cho hàm số đa thức bậc bốn $y = f(x)$ có bảng biến thiên như sau:
      #fig("quartic-variation.svg", 118mm)
      Hàm số đã cho đồng biến trên khoảng nào dưới đây?],
    answers: ([$(-1;0)$], [$(0;1)$], [$(-1;4)$], [$(-1;+infinity)$]),
  )

  #q(
    11,
    [Cho hàm số $y = f(x)$ liên tục và có bảng biến thiên trên đoạn $[-1;3]$ như hình dưới
      #fig("interval-extrema-variation.svg", 118mm)
      Khẳng định nào đúng?],
    answers: (
      [$min_( [-1;3] ) f(x) = 5$],
      [$min_( [-1;3] ) f(x) = 0$],
      [$min_( [-1;3] ) f(x) = 4$],
      [$min_( [-1;3] ) f(x) = 1$],
    ),
  )

  #q(
    12,
    [Giá trị nhỏ nhất của hàm số $y = x^3 + 3x + 2$ trên đoạn $[-3;2]$ là],
    answers: ([$-16$], [$-43$], [$-20$], [$-34$]),
  )

  #exam-section(
    "II",
    [TRẮC NGHIỆM ĐÚNG – SAI],
    instruction: [Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
  )

  #q(
    1,
    [Bỏ qua sức cản không khí, độ cao (mét) của một vật được phóng thẳng đứng lên trên từ điểm cách mặt đất $2$ m với vận tốc ban đầu $24,5$ m/s là $h(t) = 2 + 24,5t - 4,9t^2$ (theo Vật lí đại cương, NXB Giáo dục Việt Nam, 2016), $t$ là thời gian được tính bằng giây.],
    statement-gap: 4.5mm,
    statements: (
      [Phương trình vận tốc của vật theo thời gian là $v(t) = 24,5 - 9,8t$.],
      [Độ cao lớn nhất mà vật đạt được so với mặt đất là $30$ m.],
      [Tại thời điểm $t = 5$ giây, vật đã chạm đất.],
      [Vận tốc của vật sau $2$ giây kể từ lúc phóng là $4,9$ m/s.],
    ),
  )

  #q(
    2,
    [Cho hàm số $y = f(x)$ có đạo hàm trên tập $RR$. Hàm số $y = f'(x)$ có đồ thị như hình dưới đây:],
    figure: image("../figures/derivative.svg", width: 63.8mm),
    statements: (
      [Đồ thị hàm số $y = f(x)$ đạt cực đại tại điểm có hoành độ âm.],
      [Hàm số $g(x) = f(x + 1) - x$ đồng biến trên khoảng $(-1;0)$.],
      [Hàm số $y = f(x)$ đồng biến trên khoảng $(0;1)$.],
      [Hàm số $y = f(x)$ có hai điểm cực trị.],
    ),
  )

  #q(
    3,
    [Cho hàm số $y = f(x) = (a x + 1)/(b x + c)$, $(a,b,c in RR; b != 0; a c - b != 0)$ có bảng biến thiên như hình dưới đây
      #fig("rational-coefficients-variation.svg", 118mm)],
    statements: (
      [Đường tiệm cận đứng và đường tiệm cận ngang của đồ thị hàm số lần lượt là $x = -1$; $y = 2$.],
      [Biết $f(0) = 1$, khi đó $a - b - c = 0$.],
      [$y' > 0, forall x in RR$.],
      [Giá trị nhỏ nhất của hàm số trên khoảng $(-infinity;-1)$ là $2$.],
    ),
  )

  #q(
    4,
    [Một chất điểm $A$ nằm trên mặt phẳng nằm ngang $(alpha)$, chịu tác động bởi ba lực $arrow(F_1), arrow(F_2), arrow(F_3)$. Các lực $arrow(F_1), arrow(F_2)$ có giá nằm trên mặt phẳng $(alpha)$ và góc tạo bởi hai lực này là $(arrow(F_1), arrow(F_2)) = 120 degree$. Lực $arrow(F_3)$ có giá vuông góc với mặt phẳng $(alpha)$ và hướng lên trên. Biết độ lớn của các lực $arrow(F_1), arrow(F_2), arrow(F_3)$ lần lượt là $30$ N, $40$ N và $50$ N.
      #block(above:3mm,breakable:false)[
        #grid(columns:(1fr,74.8mm),gutter:5mm,align:horizon,
          grid(columns:(1fr,),row-gutter:2.5mm,
            [a) Hợp lực của hai lực $arrow(F_1)$ và $arrow(F_2)$ có độ lớn bằng $10 sqrt(13)$ N.],
            [b) $arrow(F_1) dot arrow(F_2) = 600 (N^2)$.],
            [c) Cường độ hợp lực của ba lực $arrow(F_1), arrow(F_2), arrow(F_3)$ tác dụng lên chất điểm $A$ là $10 sqrt(38)$ N.],
            [d) Hai lực $arrow(F_1)$ và $arrow(F_3)$ có giá vuông góc với nhau.],
          ),
          image("../figures/forces.svg",width:74.8mm),
        )
      ]
    ],
    keep-together:false,
    keep-body:false,
  )

  #exam-section(
    "III",
    [TRẮC NGHIỆM TRẢ LỜI NGẮN],
    instruction: [Thí sinh trả lời từ câu 1 đến câu 6.],
  )

  #q(
    1,
    [Trong không gian, cho hai vectơ $arrow(a)$ và $arrow(b)$ có độ dài lần lượt bằng $2$ và $3$. Biết độ dài của vectơ $arrow(a) - 3 arrow(b)$ bằng $sqrt(103)$ và số đo góc giữa hai vectơ $arrow(a)$ và $arrow(b)$ là $x degree$. Giá trị của $x$ là bao nhiêu?],
  )

  #q(
    2,
    [Giá trị lớn nhất của hàm số $f(x) = sqrt(4 - x^2) + x - 1/2$ bằng bao nhiêu (làm tròn kết quả đến hàng phần trăm)?],
  )

  #q(
    3,
    [Cho hàm số $y = -2x^3 + x^2 + 4x - 1$ đồng biến trong khoảng $(a;b)$ thỏa mãn $b - a$ lớn nhất. Giá trị của biểu thức $P = a + b$ bằng bao nhiêu (làm tròn kết quả đến hàng phần trăm)?],
  )

  #q(
    4,
    [Cho hàm số $y = (x^2 - 4x + 7)/(x - 1)$. Độ dài của đoạn thẳng nối hai điểm cực trị của đồ thị hàm số bằng bao nhiêu (làm tròn kết quả đến hàng phần trăm)?],
  )

  #q(
    5,
    [Một giá treo vật được lắp đặt vào góc tường tại ba điểm $C$, $O$ và $B$ bằng các bản lề cố định. Cấu tạo giá treo gồm ba thanh $A B$, $A C$ và $A O$ hội tụ tại điểm $A$ (khối lượng các thanh không đáng kể). Biết các thanh $A B$, $A C$ có chiều dài bằng nhau và vuông góc nhau tại $A$, cùng song song với mặt sàn. Thanh $A O$ đóng vai trò thanh chống, chịu được lực nén tối đa là $265$ N. Biết rằng khi treo vật có trọng lượng $P$ vào điểm $A$, lực căng trên hai thanh $A C$ và $A B$ có độ lớn luôn bằng một phần hai lực nén trên thanh $A O$. Trọng lượng (tính theo đơn vị N) lớn nhất có thể treo vào đầu $A$ của giá treo bằng bao nhiêu để hệ thống vẫn an toàn? (Kết quả làm tròn đến hàng đơn vị).
      #fig("wall-bracket.svg", 72mm)
    ],
    keep-together: false,
    keep-body: false,
  )

  #q(
    6,
    [Có bao nhiêu giá trị nguyên thuộc khoảng $(-2026;2027)$ của tham số $m$ để đồ thị hàm số $y = sqrt(x - 3)/(x^2 + x - m)$ có đúng hai đường tiệm cận?],
  )
]
