#import "/templates/lesson.typ": formula, paragraph as base-paragraph
#import "../figures.typ": diagram
#let p = base-paragraph.with(gap: 5mm)
#let solutions = (
  "bai-hoc-1": [
    #p[Đường thẳng $A B$ đi qua $A(1;-2;1)$, có vectơ chỉ phương $arrow(A B)=(1;3;2)$.]
    #formula(($A B:cases(x=1+t, y=-2+3t, z=1+2t) quad (t in RR).$,))
    #p[Gọi $M=A B ∩ (P)$. Vì $M in A B$ nên $M(1+t;-2+3t;1+2t)$.]
    #formula(($M in (P) ⇒ (1+t)-(-2+3t)+2(1+2t)-3=0$, $⇔ 2t+2=0 ⇔ t=-1.$))
    #p[Vậy giao điểm cần tìm là $M(0;-5;-1)$.]
  ],
  "bai-hoc-2a": [
    #p[Gọi $(P)$ là mặt phẳng đi qua $A$ và vuông góc với $B C$. Một vectơ pháp tuyến của $(P)$ là $arrow(n)_P=arrow(B C)=(1;-1;2)$.]
    #diagram("point-line-plane", width: 88mm)
    #formula(($(P):(x-3)-(y-2)+2(z+2)=0$, $⇔ x-y+2z+3=0.$))
    #p[Gọi $H$ là hình chiếu vuông góc của $A$ trên $B C$, khi đó $H=B C ∩ (P)$.]
    #formula(($B C:cases(x=1+t, y=-t, z=1+2t) quad (t in RR).$,))
    #p[Vì $H in B C$ nên $H(1+t;-t;1+2t)$.]
    #p[*Cách 1.* Sử dụng điều kiện $H in (P)$.]
    #formula(($(1+t)-(-t)+2(1+2t)+3=0 ⇔ 6t+6=0 ⇔ t=-1.$,))
    #p[Suy ra $H(0;1;-1)$.]
    #p[*Cách 2.* Sử dụng điều kiện $A H perp B C$. Ta có $arrow(A H)=(t-2;-t-2;2t+3)$.]
    #formula(($arrow(A H) dot arrow(B C)=0 ⇔ (t-2)-(-t-2)+2(2t+3)=0$, $⇔ 6t+6=0 ⇔ t=-1.$))
    #p[Vậy $H(0;1;-1)$.]
  ],
  "bai-hoc-2b": [
    #p(keep-next: true)[Gọi $H$ là hình chiếu vuông góc của $A$ trên $d$. Viết đường thẳng dưới dạng tham số:]
    #formula(($d:cases(x=1+2t, y=-1+2t, z=-t) quad (t in RR).$,))
    #p[Vì $H in d$ nên $H(1+2t;-1+2t;-t)$. Khi đó $arrow(A H)=(2t;-1+2t;1-t)$ và $arrow(u)_d=(2;2;-1)$.]
    #formula((
      $A H perp d ⇔ arrow(A H) dot arrow(u)_d=0$,
      $⇔ 4t+2(-1+2t)-(1-t)=0 ⇔ 9t-3=0 ⇔ t=1/3.$,
    ))
    #p[Vậy $H(5/3;-1/3;-1/3)$.]
  ],
  "bai-hoc-3": [
    #p[Gọi $H$ là hình chiếu vuông góc của $A$ trên $(P)$. Đường thẳng $d$ qua $A$ và vuông góc với $(P)$ có vectơ chỉ phương $arrow(u)_d=arrow(n)_P=(1;1;1)$.]
    #diagram("point-plane", width: 84mm)
    #formula(($d:cases(x=-1+t, y=-1+t, z=-2+t) quad (t in RR).$,))
    #p(keep-next: true)[Vì $H=d ∩ (P)$ nên $H(-1+t;-1+t;-2+t)$ và:]
    #formula(($(-1+t)+(-1+t)+(-2+t)-1=0 ⇔ 3t-5=0 ⇔ t=5/3.$,))
    #p[Vậy $H(2/3;2/3;-1/3)$.]
    #p(
      keep-next: true,
    )[Gọi $(Q)$ là mặt phẳng qua $A,B$ và vuông góc với $(P)$. Ta có $arrow(A B)=(1;2;3)$, nên chọn một vectơ pháp tuyến của $(Q)$ là:]
    #formula(($arrow(n)_Q=[arrow(A B),arrow(n)_P]=(-1;2;-1).$,))
    #p(keep-next: true)[Mặt phẳng $(Q)$ đi qua $A(-1;-1;-2)$, do đó:]
    #formula(($(Q):-(x+1)+2(y+1)-(z+2)=0$, $⇔ x-2y+z+1=0.$))
  ],
  "bai-hoc-4": [
    #p[Đường thẳng $d$ qua $A(3;5;0)$ và vuông góc với $(P)$ có vectơ chỉ phương $(2;3;-1)$.]
    #formula(($d:cases(x=3+2t, y=5+3t, z=-t) quad (t in RR).$,))
    #p[Gọi $H=d ∩ (P)$. Vì $H in d$ nên $H(3+2t;5+3t;-t)$.]
    #formula(($H in (P) ⇒ 2(3+2t)+3(5+3t)-(-t)-7=0$, $⇔ 14t+14=0 ⇔ t=-1.$))
    #p(
      keep-next: true,
    )[Suy ra $H(1;2;1)$. Gọi $A'$ là điểm đối xứng của $A$ qua $(P)$. Khi đó $H$ là trung điểm của $A A'$, nên:]
    #formula(($cases(x_(A')=2x_H-x_A=-1, y_(A')=2y_H-y_A=-1, z_(A')=2z_H-z_A=2).$,))
    #p[Vậy $A'(-1;-1;2)$.]
  ],
  "bai-hoc-5": [
    #p[Đường thẳng $d$ có dạng tham số $cases(x=t, y=1+t, z=2-t)$. Thay vào $(P)$ được $2t=0$, suy ra $d ∩ (P)={A}$ với $A(0;1;2)$.]
    #diagram("line-projection", width: 93mm)
    #p(keep-next: true)[Lấy $M(2;3;0) in d$. Đường thẳng $Delta$ qua $M$ và vuông góc với $(P)$ có phương trình:]
    #formula(($Delta:(x-2)/1=(y-3)/2=z/1.$,))
    #p[Gọi $H=Delta ∩ (P)$. Vì $H in Delta$ nên $H(2+t;3+2t;t)$.]
    #formula(($(2+t)+2(3+2t)+t-4=0 ⇔ 6t+4=0 ⇔ t=-2/3.$,))
    #p[Suy ra $H(4/3;5/3;-2/3)$ và $arrow(A H)=(4/3;2/3;-8/3)$.]
    #p(
      keep-next: true,
    )[Hình chiếu vuông góc $d'$ của $d$ trên $(P)$ chính là đường thẳng $A H$. Chọn vectơ chỉ phương $arrow(u)=(2;1;-4)$, ta được:]
    #formula(($d':x/2=(y-1)/1=(z-2)/(-4).$,))
  ],
  "bai-hoc-6": [
    #p[Mặt phẳng $(P)$ qua $A(1;7;3)$ và vuông góc với $Delta$ nhận $arrow(u)_Delta=(-3;-2;1)$ làm vectơ pháp tuyến.]
    #formula(($(P):-3(x-1)-2(y-7)+(z-3)=0$, $⇔ -3x-2y+z+14=0.$))
    #p[Vì $M in Delta$ nên $M(6-3t;-1-2t;-2+t)$.]
    #formula(($A M^2=(5-3t)^2+(-8-2t)^2+(-5+t)^2$, $=14t^2-8t+114.$))
    #p(keep-next: true)[Theo giả thiết $A M=2sqrt(30)$ nên:]
    #formula(($14t^2-8t+114=120 ⇔ 14t^2-8t-6=0$, $⇔ (t-1)(7t+3)=0 ⇔ t=1 " hoặc " t=-3/7.$))
    #p[Vậy có hai điểm $M_1(3;-3;-1)$ và $M_2(51/7;-1/7;-17/7)$.]
  ],
  "bai-hoc-7": [
    #p[*a)* Hai đường thẳng $d_1,d_2$ lần lượt có vectơ chỉ phương $arrow(u)_1=(2;1;-1)$ và $arrow(u)_2=(1;-2;1)$.]
    #formula(($[arrow(u)_1,arrow(u)_2]=(-1;-3;-5).$,))
    #p(keep-next: true)[Chọn $arrow(n)_P=(1;3;5)$. Mặt phẳng $(P)$ qua $A(0;1;2)$ có phương trình:]
    #formula(($(P):x+3(y-1)+5(z-2)=0 ⇔ x+3y+5z-13=0.$,))
    #p[Điểm $(0;1;-1) in d_1$ và điểm $(1;-1;2) in d_2$ đều không thuộc $(P)$, nên $(P)$ song song với cả hai đường thẳng.]
    #p[*b)* Đặt $M(2t_1;1+t_1;-1-t_1)$, $N(1+t_2;-1-2t_2;2+t_2)$.]
    #formula(($arrow(A M)=(2t_1;t_1;-3-t_1),$, $arrow(A N)=(1+t_2;-2-2t_2;t_2).$))
    #p[Ba điểm $A,M,N$ thẳng hàng khi $arrow(A M)=k arrow(A N)$ với $k != 0$.]
    #formula(($cases(2t_1=k(1+t_2), t_1=k(-2-2t_2), -3-t_1=k t_2).$,))
    #p[Từ hai phương trình đầu, $t_1=-4t_1$ nên $t_1=0$. Phương trình thứ ba cho $k t_2=-3$; phương trình đầu cho $k+k t_2=0$, suy ra $k=3$, $t_2=-1$.]
    #p[Vậy $M(0;1;-1)$ và $N(0;1;1)$.]
  ],
  "tu-luyen-1": [
    #p[Vì $A in d$ nên $A(1+2t;3-t;1-t)$.]
    #formula(($A in (P) ⇒ (1+2t)+2(3-t)-3(1-t)+2=0$, $⇔ 3t+6=0 ⇔ t=-2.$))
    #p[Vậy $A(-3;5;3)$. *Chọn C.*]
  ],
  "tu-luyen-2": [
    #formula(($d:cases(x=12+4t, y=9+3t, z=1+t) quad (t in RR).$,))
    #p(keep-next: true)[Thay tọa độ điểm thuộc $d$ vào phương trình $(P)$, ta được:]
    #formula(($3(12+4t)+5(9+3t)-(1+t)-2=0$, $⇔ 26t+78=0 ⇔ t=-3.$))
    #p[Với $t=-3$, ta có $x=0$, $y=0$, $z=-2$. Vậy giao điểm là $(0;0;-2)$. *Chọn B.*]
  ],
  "tu-luyen-3": [
    #p[Gọi $H(1-t;-2+3t;-2t)$ là hình chiếu của $M$ lên $Delta$. Khi đó $arrow(M H)=(5-t;-2+3t;-2t)$ và $arrow(u)_Delta=(-1;3;-2)$.]
    #formula((
      $arrow(M H) dot arrow(u)_Delta=0$,
      $⇔ -(5-t)+3(-2+3t)+(-2)(-2t)=0$,
      $⇔ 14t-11=0 ⇔ t=11/14.$,
    ))
    #p[Suy ra $H(3/14;5/14;-22/14)$ và $a+b+c=-1$. *Chọn B.*]
  ],
  "tu-luyen-4": [
    #p[Gọi $(P)$ là mặt phẳng qua $A$ và vuông góc với $d$. Khi đó:]
    #diagram("line-reflection", width: 75mm)
    #formula(($(P):(x-3)+2(y-2)+2z=0 ⇔ x+2y+2z-7=0.$,))
    #p[Gọi $H$ là hình chiếu của $A$ trên $d$, khi đó $H=d ∩ (P)$. Vì $H in d$ nên $H(-1+t;-3+2t;-2+2t)$.]
    #formula(($(-1+t)+2(-3+2t)+2(-2+2t)-7=0$,))
    #formula(($⇔ 9t-18=0 ⇔ t=2.$,))
    #p[Vậy $H(1;1;2)$. Do $H$ là trung điểm của $A A'$ nên $A'(-1;0;4)$. *Chọn A.*]
  ],
  "tu-luyen-5": [
    #p(
      keep-next: true,
    )[Gọi $H$ là hình chiếu của $A$ lên $(alpha)$. Đường thẳng $A H$ nhận $arrow(n)=(1;1;1)$ làm vectơ chỉ phương:]
    #formula(($A H:(x-3)/1=(y-2)/1=(z+1)/1.$,))
    #p[Vì $H in A H$ nên $H(3+t;2+t;-1+t)$.]
    #formula(($H in (alpha) ⇒ 3+t+2+t-1+t=0 ⇔ t=-4/3.$,))
    #p[Vậy $H(5/3;2/3;-7/3)$. *Chọn B.*]
  ],
  "tu-luyen-6": [
    #p(keep-next: true)[Mặt phẳng $(alpha)$ có vectơ pháp tuyến $arrow(n)=(2;1;2)$. Vì $M M' perp (alpha)$ nên:]
    #formula(($M M':cases(x=1+2t, y=2+t, z=4+2t) quad (t in RR).$,))
    #p(keep-next: true)[Gọi $H=M M' ∩ (alpha)$. Ta có $H(1+2t;2+t;4+2t)$ và:]
    #formula(($2(1+2t)+(2+t)+2(4+2t)-3=0 ⇔ 9t+9=0 ⇔ t=-1.$,))
    #p[Suy ra $H(-1;1;2)$. Do $H$ là trung điểm của $M M'$ nên $M'(-3;0;0)$. *Chọn A.*]
  ],
  "tu-luyen-7": [
    #p[Phương trình tham số của $d$ là $cases(x=-2+2t, y=4-2t, z=-1+t)$, $t in RR$.]
    #diagram("line-projection-homework", width: 93mm)
    #p(keep-next: true)[Gọi $M=d ∩ (P)$. Khi đó $M(-2+2t;4-2t;-1+t)$, nên:]
    #formula(($(-2+2t)+(4-2t)-(-1+t)-1=0 ⇔ t=2.$,))
    #p[Suy ra $M(2;0;1)$. Lấy $N(0;2;0) in d$. Đường thẳng $Delta$ qua $N$, vuông góc với $(P)$ nhận $arrow(n)_P=(1;1;-1)$ làm vectơ chỉ phương.]
    #formula(($Delta:x/1=(y-2)/1=z/(-1) quad "hay" quad cases(x=c, y=2+c, z=-c).$,))
    #p[Gọi $M'=Delta ∩ (P)$. Vì $M' in Delta$ nên $M'(c;2+c;-c)$.]
    #formula(($c+(2+c)-(-c)-1=0 ⇔ c=-1/3.$,))
    #p[Suy ra $M'(-1/3;5/3;1/3)$ và $arrow(M M')=(-7/3;5/3;-2/3)$.]
    #p[Hình chiếu $d'$ chính là đường thẳng $M M'$, đi qua $M(2;0;1)$ và nhận $arrow(u)=-3arrow(M M')=(7;-5;2)$ làm vectơ chỉ phương.]
    #formula(($d':(x-2)/7=y/(-5)=(z-1)/2.$,))
    #p[*Chọn B.*]
  ],
  "tu-luyen-8": [
    #p(keep-next: true)[*a)* Vì $G$ là trọng tâm tam giác $O A B$ nên:]
    #formula(($G((0+1-1)/3;(0+4+2)/3;(0+2+4)/3)=(0;2;2).$,))
    #p(keep-next: true)[Ta có $arrow(O A)=(1;4;2)$ và $arrow(O B)=(-1;2;4)$, nên:]
    #formula(($[arrow(O A),arrow(O B)]=(12;-6;6).$,))
    #p(
      keep-next: true,
    )[Chọn $arrow(n)_(O A B)=(2;-1;1)$. Đường thẳng $d$ qua $G$, vuông góc với $(O A B)$ có phương trình:]
    #formula(($d:cases(x=2t, y=2-t, z=2+t) quad (t in RR).$,))
    #p[*b)* Vì $M in Delta$ nên $M(1-t;-2+t;2t)$.]
    #formula(($M A^2=t^2+(t-6)^2+(2t-2)^2=6t^2-20t+40,$, $M B^2=(t-2)^2+(t-4)^2+(2t-4)^2=6t^2-28t+36.$))
    #formula(($P=M A^2+M B^2=12t^2-48t+76=12(t-2)^2+28.$,))
    #p[Vậy $P_(min)=28$ khi $t=2$, tức là $M(-1;0;4)$.]
  ],
  "tu-luyen-9": [
    #p[Ta có $arrow(A B)=(-1;1;2)$ nên $A B:cases(x=2-t, y=1+t, z=2t)$.]
    #p[Vì $D in A B$ nên $D(2-t;1+t;2t)$ và $arrow(C D)=(1-t;t;2t)$.]
    #formula(($C D parallel (P) ⇒ arrow(C D) dot arrow(n)_P=0$, $⇔ (1-t)+t+2t=0 ⇔ t=-1/2.$))
    #p[Suy ra $D(5/2;1/2;-1)$. Vì $C(1;1;0) ∉ (P)$ nên đường thẳng $C D$ thực sự song song với $(P)$.]
  ],
  "tu-luyen-10": [
    #formula(($A B=sqrt((-2)^2+2^2+(-2)^2)=2sqrt(3), quad R=(A B)/6=sqrt(3)/3.$,))
    #diagram("sphere-tangent", width: 91mm)
    #p(keep-next: true)[Chọn vectơ chỉ phương $arrow(u)_(A B)=(1;-1;1)$. Đường thẳng $A B$ có phương trình:]
    #formula(($A B:cases(x=1+t, y=-2-t, z=3+t) quad (t in RR).$,))
    #p[Gọi $I$ là tâm của $(S)$. Vì $I in A B$ nên $I(1+t;-2-t;3+t)$.]
    #formula(($d(I,(P))=(abs((1+t)+(-2-t)+(3+t)+4))/sqrt(3)=(abs(t+6))/sqrt(3).$,))
    #p(keep-next: true)[Điều kiện tiếp xúc với $(P)$ là $d(I,(P))=R$, do đó:]
    #formula(($(abs(t+6))/sqrt(3)=sqrt(3)/3 ⇔ abs(t+6)=1$,))
    #p(keep-next: true)[Suy ra $t=-5$ hoặc $t=-7$, tương ứng với $I_1(-4;3;-2)$ và $I_2(-6;5;-4)$. Vậy có hai mặt cầu:]
    #formula(($(S_1):(x+4)^2+(y-3)^2+(z+2)^2=1/3,$, $(S_2):(x+6)^2+(y-5)^2+(z+4)^2=1/3.$))
  ],
  "tu-luyen-11": [
    #p(keep-next: true)[Vì $M in Delta$ nên $M(-2+t;1+3t;-5-2t)$. Ta có:]
    #formula(($arrow(A M)=(t;3t;-6-2t), quad arrow(A B)=(-1;-2;1),$, $[arrow(A M),arrow(A B)]=(-t-12;t+6;t).$))
    #formula((
      $S_(triangle M A B)=1/2 abs([arrow(A M),arrow(A B)])$,
      $=1/2 sqrt((t+12)^2+(t+6)^2+t^2)=1/2 sqrt(3t^2+36t+180).$,
    ))
    #p(keep-next: true)[Theo giả thiết $S_(triangle M A B)=3sqrt(5)$, suy ra:]
    #formula(($1/4 (3t^2+36t+180)=45 ⇔ 3t(t+12)=0.$,))
    #p[Vậy $t=0$ hoặc $t=-12$. Hai điểm cần tìm là $M_1(-2;1;-5)$ và $M_2(-14;-35;19)$.]
  ],
  "tu-luyen-12": [
    #p[Ta có $arrow(A B)=(2;-2;-8)$, chọn $arrow(u)_(A B)=(1;-1;-4)$.]
    #formula(($A B:cases(x=-1+t, y=2-t, z=3-4t) quad (t in RR).$,))
    #p[Để $A,B,M$ thẳng hàng và $M in (P)$ thì $M=A B ∩ (P)$. Vì $M in A B$ nên $M(-1+t;2-t;3-4t)$.]
    #formula(($2(-1+t)+(2-t)-3(3-4t)-4=0$, $⇔ 13t-13=0 ⇔ t=1.$))
    #p[Vậy $M(0;1;-1)$.]
  ],
  "tu-luyen-13": [
    #p[*a)* Gọi $H$ là hình chiếu của $A$ trên $d$. Vì $H in d$ nên $H(1+2t;t;2+2t)$, suy ra $arrow(A H)=(2t-1;t-5;2t-1)$.]
    #diagram("line-reflection", width: 65mm)
    #formula(($arrow(A H) dot arrow(u)_d=0$, $⇔ 2(2t-1)+(t-5)+2(2t-1)=0 ⇔ 9t-9=0 ⇔ t=1.$))
    #p[Suy ra $H(3;1;4)$. Gọi $A'$ là điểm đối xứng của $A$ qua $d$. Vì $H$ là trung điểm của $A A'$ nên $A'(4;-3;5)$.]
    #diagram("maximum-distance", width: 80mm)
    #p(
      keep-next: true,
    )[*b)* Gọi $I$ là hình chiếu vuông góc của $A$ trên mặt phẳng $(alpha)$ chứa $d$. Vì $H in d subset (alpha)$ nên:]
    #formula(($d(A,(alpha))=A I <= A H.$,))
    #p[Khoảng cách đạt giá trị lớn nhất khi $A I=A H$, tức là $I equiv H$. Khi đó $arrow(A H)=(1;-4;1)$ là một vectơ pháp tuyến của $(alpha)$.]
    #p(keep-next: true)[Lấy $M(1;0;2) in d$. Mặt phẳng cần tìm đi qua $M$ và có phương trình:]
    #formula(($(alpha):(x-1)-4y+(z-2)=0 ⇔ x-4y+z-3=0.$,))
  ],
)
