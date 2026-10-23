#import "/templates/lesson.typ": formula, paragraph as base-paragraph
#import "../figures.typ": diagram
#let p = base-paragraph.with(gap: 5mm)
#let solutions = (
  "bai-hoc-1": [
    #p[Hai đường thẳng $d,d'$ lần lượt có vectơ chỉ phương $arrow(u)=(1;-1;2)$ và $arrow(u)'=(3;-1;1)$.]
    #formula((
      $cos(d, d')=(abs(arrow(u) dot arrow(u)'))/(abs(arrow(u)) dot abs(arrow(u)'))=6/(sqrt(6) dot sqrt(11))=sqrt(66)/11.$,
    ))
    #p[*Chọn C.*]
  ],
  "bai-hoc-2": [
    #p[Hai mặt phẳng $(P),(Q)$ có vectơ pháp tuyến $arrow(n)_P=(1;0;1)$ và $arrow(n)_Q=(1;-4;-1)$.]
    #formula(($cos((P), (Q))=(abs(arrow(n)_P dot arrow(n)_Q))/(abs(arrow(n)_P) dot abs(arrow(n)_Q))=0.$,))
    #p[Vậy góc giữa hai mặt phẳng bằng $90 degree$.]
  ],
  "bai-hoc-3": [
    #p[Đường thẳng $Delta$ có vectơ chỉ phương $arrow(u)_Delta=(1;2;-1)$. Mặt phẳng $(P):x-y+z=1$ có vectơ pháp tuyến $arrow(n)_P=(1;-1;1)$.]
    #formula((
      $sin(Delta, (P))=(abs(arrow(u)_Delta dot arrow(n)_P))/(abs(arrow(u)_Delta) dot abs(arrow(n)_P))$,
      $=(abs(1-2-1))/(sqrt(6) dot sqrt(3))=sqrt(2)/3.$,
    ))
    #p[Vậy góc cần tìm bằng $arcsin(sqrt(2)/3) approx "28,13" degree$.]
  ],
  "bai-hoc-4": [
    #p[Vì $d=(alpha) ∩ (beta)$ nên một vectơ chỉ phương của $d$ là tích có hướng của hai vectơ pháp tuyến $arrow(n)_alpha=(1;-2;0)$ và $arrow(n)_beta=(1;0;-2)$.]
    #formula(($[arrow(n)_alpha,arrow(n)_beta]=(4;2;2).$,))
    #p[Chọn $arrow(u)_d=(2;1;1)$. Mặt phẳng $(P)$ có vectơ pháp tuyến $arrow(n)_P=(3;4;5)$.]
    #formula((
      $sin alpha=(abs(arrow(u)_d dot arrow(n)_P))/(abs(arrow(u)_d) dot abs(arrow(n)_P))=(6+4+5)/(sqrt(6) dot sqrt(50))=sqrt(3)/2.$,
    ))
    #p[Vậy $alpha=60 degree$.]
  ],
  "bai-hoc-5": [
    #p[Chọn $A(1;1;0) in Delta$ và vectơ chỉ phương $arrow(u)_Delta=(1;1;-1)$.]
    #p[Khi đó $arrow(A M)=(0;2;2)$ và $[arrow(A M),arrow(u)_Delta]=(-4;2;-2)$.]
    #formula(($abs([arrow(A M),arrow(u)_Delta])=sqrt((-4)^2+2^2+(-2)^2)=sqrt(24).$,))
    #formula(($d(M,Delta)=(abs([arrow(A M),arrow(u)_Delta]))/(abs(arrow(u)_Delta))=sqrt(24)/sqrt(3)=2sqrt(2).$,))
    #p[*Chọn C.*]
  ],
  "bai-hoc-6": [
    #p[$d_1$ đi qua $M(0;3;2)$, có vectơ chỉ phương $arrow(u)=(1;2;1)$. $d_2$ đi qua $N(3;-1;2)$, có vectơ chỉ phương $arrow(v)=(1;-2;1)$.]
    #p[Ta có $[arrow(u),arrow(v)]=(4;0;-4)$ và $arrow(M N)=(3;-4;0)$.]
    #formula((
      $d(d_1,d_2)=(abs([arrow(u),arrow(v)] dot arrow(M N)))/(abs([arrow(u),arrow(v)]))=12/(4sqrt(2))=(3sqrt(2))/2.$,
    ))
    #p[*Chọn C.*]
  ],
  "bai-hoc-7": [
    #diagram("sphere-chord", width: 85mm)
    #p[Gọi $H$ là trung điểm của $A B$. Khi đó $I H perp A B$ và $R^2=I H^2+A H^2$.]
    #p[Ta có $A H=A B/2=8$ và $I H=d(I,d)$. Lấy $M(11;0;-25) in d$, chọn $arrow(u)_d=(2;1;-2)$.]
    #p[Suy ra $arrow(I M)=(9;-3;-24)$ và $[arrow(I M),arrow(u)_d]=(30;-30;15)$.]
    #formula(($I H=(abs([arrow(I M),arrow(u)_d]))/(abs(arrow(u)_d))=sqrt(30^2+(-30)^2+15^2)/sqrt(2^2+1^2+(-2)^2)=15.$,))
    #p[Vậy $R^2=15^2+8^2=289$. Mặt cầu tâm $I(2;3;-1)$ có phương trình:]
    #formula(($(S):(x-2)^2+(y-3)^2+(z+1)^2=289.$,))
  ],
  "bai-hoc-8": [
    #p[Lấy $A(0;-1;2) in d$ và chọn $arrow(u)_d=(1;-1;-1)$.]
    #p[Ta có $arrow(A I)=(1;4;3)$ và $[arrow(A I),arrow(u)_d]=(-1;4;-5)$, nên độ dài tích có hướng bằng $sqrt(42)$.]
    #formula(($R=d(I,d)=(abs([arrow(A I),arrow(u)_d]))/(abs(arrow(u)_d))=sqrt(42)/sqrt(3)=sqrt(14).$,))
    #p[*Chọn B.*]
  ],
  "bai-hoc-9": [
    #diagram("distance-plane", width: 92mm)
    #p[Gọi $alpha$ là góc giữa $d$ và $(P)$. Chọn $arrow(u)_d=(2;2;1)$ và $arrow(n)_P=(1;2;2)$.]
    #formula(($sin alpha=(abs(arrow(u)_d dot arrow(n)_P))/(abs(arrow(u)_d) dot abs(arrow(n)_P))=8/9.$,))
    #p[Gọi $H$ là hình chiếu vuông góc của $M$ lên $(P)$. Tam giác $I M H$ vuông tại $H$, suy ra:]
    #formula(($d(M,(P))=M H=I M sin alpha=9 dot 8/9=8.$,))
    #p[*Chọn D.*]
  ],
  "tu-luyen-1": [
    #p[Hai đường thẳng $d,d'$ lần lượt có vectơ chỉ phương $arrow(u)=(1;0;2)$ và $arrow(u)'=(2;-2;1)$.]
    #formula((
      $cos(d, d')=(abs(arrow(u) dot arrow(u)'))/(abs(arrow(u)) dot abs(arrow(u)'))=4/(sqrt(5) dot 3)=(4sqrt(5))/15.$,
    ))
    #p[*Chọn B.*]
  ],
  "tu-luyen-2": [
    #p[Hai mặt phẳng $(P),(Q)$ có vectơ pháp tuyến $arrow(n)_P=(2;0;1)$ và $arrow(n)_Q=(1;-2;2)$.]
    #formula((
      $cos((P), (Q))=(abs(arrow(n)_P dot arrow(n)_Q))/(abs(arrow(n)_P) dot abs(arrow(n)_Q))=4/(sqrt(5) dot 3)=(4sqrt(5))/15.$,
    ))
  ],
  "tu-luyen-3": [
    #p[Đường thẳng $d$ có vectơ chỉ phương $arrow(u)=(-1;2;1)$; mặt phẳng $(P)$ có vectơ pháp tuyến $arrow(n)=(1;-1;0)$.]
    #p[Gọi $alpha$ là góc giữa $d$ và $(P)$. Khi đó:]
    #formula((
      $sin alpha=(abs(arrow(u) dot arrow(n)))/(abs(arrow(u)) dot abs(arrow(n)))=(abs(-1-2))/(sqrt(6) dot sqrt(2))=sqrt(3)/2.$,
    ))
    #p[Vậy $alpha=60 degree$. *Chọn A.*]
  ],
  "tu-luyen-4": [
    #p[Mặt phẳng $(P)$ có vectơ pháp tuyến $arrow(n)=(-sqrt(3);1;0)$. Trục $O x$ có vectơ chỉ phương $arrow(i)=(1;0;0)$.]
    #formula(($sin((P), O x)=(abs(arrow(n) dot arrow(i)))/(abs(arrow(n)) dot abs(arrow(i)))=sqrt(3)/2.$,))
    #p[Vậy góc tạo bởi $(P)$ với trục $O x$ bằng $60 degree$. *Chọn A.*]
  ],
  "tu-luyen-5": [
    #p[Mặt phẳng $(P)$ có vectơ pháp tuyến $arrow(n)=(2;-2;-1)$; đường thẳng $Delta$ có vectơ chỉ phương $arrow(u)=(2;1;2)$.]
    #p[Vì $arrow(n) dot arrow(u)=0$ nên $Delta parallel (P)$ hoặc $Delta subset (P)$. Lấy $A(1;-2;1) in Delta$.]
    #formula(($d(Delta,(P))=d(A,(P))=(abs(2 dot 1-2 dot (-2)-1+1))/sqrt(4+4+1)=2.$,))
    #p[*Chọn A.*]
  ],
  "tu-luyen-6": [
    #p[Gọi $M(3;0;1) in d$. Ta có $arrow(A M)=(1;1;1)$, $arrow(u)_d=(-2;-1;1)$.]
    #p[Suy ra $[arrow(A M),arrow(u)_d]=(2;-3;1)$ và độ dài tích có hướng bằng $sqrt(14)$.]
    #formula(($d(A,d)=(abs([arrow(A M),arrow(u)_d]))/(abs(arrow(u)_d))=sqrt(14)/sqrt(6)=sqrt(21)/3.$,))
    #p[*Chọn C.*]
  ],
  "tu-luyen-7": [
    #p[Ta có $A(1;-3;2) in d$, $B(0;3;1) in d'$, với các vectơ chỉ phương tương ứng $arrow(u)=(1;-1;2)$ và $arrow(u)'=(3;-1;1)$.]
    #formula((
      $d(d,d')=(abs([arrow(u),arrow(u)'] dot arrow(A B)))/(abs([arrow(u),arrow(u)']))=27/sqrt(30)=(9sqrt(30))/10.$,
    ))
    #p[*Chọn C.*]
  ],
  "tu-luyen-8": [
    #diagram("sphere-chord", width: 85mm)
    #p[Mặt cầu $(S)$ có tâm $I(-2;3;0)$ và bán kính $R=sqrt(13-m)$. Gọi $H$ là trung điểm của dây $A B$.]
    #p[Chọn $M(4;3;3) in Delta$, suy ra $arrow(I M)=(6;0;3)$. Vectơ chỉ phương của $Delta$ là $arrow(u)_Delta=(2;1;2)$.]
    #p[Ta có $[arrow(I M),arrow(u)_Delta]=(-3;-6;6)$ và độ dài tích có hướng bằng $9$.]
    #formula(($I H=d(I,Delta)=9/sqrt(2^2+1^2+2^2)=3.$,))
    #formula(($R=sqrt(I H^2+(A B/2)^2)=sqrt(3^2+4^2)=5.$,))
    #p[Do đó $sqrt(13-m)=5 <=> 13-m=25 <=> m=-12$.]
    #p[*Chọn C.*]
  ],
  "tu-luyen-9": [
    #diagram("distance-plane-homework", width: 92mm)
    #p[Đường thẳng $d$ có vectơ chỉ phương $arrow(u)=(2;2;-1)$; mặt phẳng $(alpha)$ có vectơ pháp tuyến $arrow(n)=(1;2;-3)$.]
    #formula((
      $sin(d, (alpha))=(abs(arrow(u) dot arrow(n)))/(abs(arrow(u)) dot abs(arrow(n)))=9/(3sqrt(14))=(3sqrt(14))/14.$,
    ))
    #p[Gọi $H$ là hình chiếu vuông góc của $A$ lên $(alpha)$. Tam giác $M A H$ vuông tại $H$, nên:]
    #formula(($A H=A M sin(d, (alpha))=sqrt(14) dot (3sqrt(14))/14=3.$,))
    #p[Vậy khoảng cách từ $A$ đến $(alpha)$ bằng $3$. *Chọn B.*]
  ],
  "tu-luyen-10": [
    #diagram("minimum-angle", width: 100mm)
    #p[Lấy $A in Delta$, $A != I$ với $I=Delta ∩ (P)$. Gọi $H$ là hình chiếu vuông góc của $A$ trên $(P)$. Kẻ $H K$ vuông góc với giao tuyến $d=(P) ∩ (Q)$.]
    #p[Theo định lí ba đường vuông góc, $A K perp d$. Do đó góc giữa $(P),(Q)$ là góc $A K H$ và $sin angle(A K H)=A H/(A K)$.]
    #p[Vì $Delta,A,H$ cố định nên $A H$ không đổi. Góc $A K H$ nhỏ nhất khi $A K$ lớn nhất.]
    #p[Vì $K$ là hình chiếu vuông góc của $A$ trên $d$, mà $I in d$, nên $A K<=A I$. Dấu bằng xảy ra khi $K=I$, tức là $d perp (A H I)$.]
    #p[Ta có $arrow(n)_P=(1;2;-2)$ và $arrow(u)_Delta=(2;2;1)$. Khi đó:]
    #formula(($arrow(u)_d=[arrow(n)_P,arrow(u)_Delta]=(6;-5;-2).$,))
    #p[Vì $(Q)$ chứa $d$ và $Delta$, một vectơ pháp tuyến của $(Q)$ là:]
    #formula(($[arrow(u)_d,arrow(u)_Delta]=(-1;-10;22).$,))
    #p[Chọn $arrow(n)_Q=(1;10;-22)$. Mặt phẳng $(Q)$ đi qua $O(0;0;0) in Delta$ nên có phương trình $x+10y-22z=0$.]
    #p[*Chọn D.*]
  ],
)
