#import "/templates/lesson.typ": formula-rows as formula,theory-box
#import "../figures.typ": fig

#let paragraph(body) = block(width:100%, above:3.5mm, below:3.5mm, body)

#let solutions=(
"bai-hoc-1":[
 #block(breakable:false)[
 #paragraph[Trong tam giác vuông $O C M$, ta có:]
 #formula(($O C=O M cos 65°=14 cos 65°≈"5,9"$,$O N=C M=O M sin 65°=14 sin 65°≈"12,7"$,))
 ]
 #paragraph[Hình chữ nhật $O A N B$ cho $O A=B N$ và $O B=A N$. Do đó:]
 #formula(($O A=O N sin 32°≈"6,7"$,$O B=O N cos 32°≈"10,8"$,))
 #paragraph[Vì $O C M N$ là hình chữ nhật nên $arrow(O M)=arrow(O A)+arrow(O B)+arrow(O C)$. Vậy $M("6,7";"10,8";"5,9")$.]
],
"bai-hoc-2":[
 #paragraph[Điểm $A$ nằm trên trục $O z$ và $O A=10$ nên $A(0;0;10)$.]
 #formula(($O H=O B cos 30°=frac(15 sqrt(3),2)$,$O K=O B sin 30°=frac(15,2)$,))
 #paragraph[Suy ra $B(frac(15,2);frac(15 sqrt(3),2);0)$.]
 #formula(($arrow(A B)=(frac(15,2);frac(15 sqrt(3),2);-10)$,$a+c=frac(15,2)-10=-"2,5"$,))
],
"bai-hoc-3":[
 #fig("roof-house-solution",width:70mm)
 #paragraph[Gọi $I$ là tâm hình chữ nhật $A B C D$, $H$ là tâm hình chữ nhật $O K N M$. Các cạnh bên của mái bằng nhau nên $S I⊥(A B C D)$.]
 #paragraph[$B D=sqrt(900^2+1200^2)=1500$, suy ra $I D=frac(B D,2)=750$.]
 #paragraph[Góc giữa $S D$ với mặt đáy là $angle S D I$. Vì $tan angle S D I=frac(1,5)$ nên $S I=frac(1,5)I D=150$.]
 #paragraph[Theo hệ trục đã chọn, $H(450;600;0)$ và $S H=I H+S I=450+150=600$.]
 #paragraph[Vậy $S(450;600;600)$ và $P=a+b+c=1650$.]
],
"bai-hoc-4":[
 #theory-box(title:[Phương pháp],breakable:false)[
  #paragraph[a) Chiếu $Q$ xuống mặt phẳng $(O x y)$ tại $T$ để xác định hoành độ, tung độ; cao độ của $Q$ bằng $Q T$.]
  #paragraph[b) Điểm $C∈(O x y)$ nên $z_C=0$.]
  #paragraph[c) Tìm tọa độ trung điểm $L$ của $F G$, rồi tính $O K+K L$.]
  #paragraph[d) Tính $F G$, $G Q$; diện tích hai mái là $2 F G⋅G Q$.]
 ]
 #fig("shifted-warehouse-solution",width:92mm)
 #paragraph[a) Sai. Ta có $O D=A D-O A=6$, $y_T=frac(A B,2)=3$, $Q T=7$. Suy ra $Q(-6;3;7)$.]
 #paragraph[b) Đúng. Vì $C(-6;6;0)$ nên $arrow(O C)=(-6;6;0)$.]
 #paragraph[c) Đúng. Ta có $K(0;0;5)$, $F(2;6;5)$, $G(-6;6;5)$. Trung điểm $L$ của $F G$ là $L(-2;6;5)$.]
 #formula(($K L=sqrt((-2)^2+6^2)=2 sqrt(10)$,$O K+K L=5+2 sqrt(10) quad ("m")$,))
 #paragraph[d) Sai. Các kích thước của một mái là:]
 #formula(($F G=8$,$G Q=sqrt((3-6)^2+(7-5)^2)=sqrt(13)$,))
 #paragraph[Diện tích hai mái nhà bằng $2⋅8 sqrt(13)=16 sqrt(13)$ m². Chi phí mua tôn, làm tròn đến hàng nghìn, là:]
 #formula(($16 sqrt(13)⋅130000≈7 thin 499 thin 547$,$≈7 thin 500 thin 000 quad "(đồng)"$,))
],
"bai-hoc-5":[
 #paragraph[Theo hệ trục đã chọn, $A(150;200;50)$ và $B(-180;-240;60)$.]
 #formula(($arrow(A B)=(-330;-440;10)$,$A B=sqrt((-330)^2+(-440)^2+10^2)≈550 quad ("m")$,))
 #paragraph[Vậy khoảng cách giữa hai flycam, làm tròn đến hàng đơn vị, là *550 m*.]
],
"bai-hoc-6":[
 #paragraph[Trục $O x$ hướng Bắc, trục $O y$ hướng Tây nên tọa độ hai máy bay là $A(23;18;2)$ và $B(-27;-22;3)$.]
 #paragraph[Gọi $M(a;b;0)$ là vị trí mục tiêu. Lấy $B'(-27;-22;-3)$ đối xứng với $B$ qua $(O x y)$. Khi đó $M B=M B'$ và:]
 #formula(($M A+M B=M A+M B'≥A B'$,))
 #paragraph[Dấu bằng xảy ra khi $M$ là giao điểm của đoạn $A B'$ với $(O x y)$. Vì $arrow(A B')=(-50;-40;-5)$ nên:]
 #formula(($frac(a-23,-50)=frac(b-18,-40)=frac(-2,-5)=frac(2,5)$,$⇒a=3, quad b=2$,))
 #paragraph[Suy ra $M(3;2;0)$ và $O M=sqrt(3^2+2^2)=sqrt(13)≈"3,61"$ km.]
],
"bai-hoc-7":[
 #paragraph[Gọi $C(x;y;z)$ là vị trí sau 5 phút tiếp theo. Máy bay giữ nguyên vận tốc và hướng bay, thời gian bay từ $A$ đến $B$ gấp đôi từ $B$ đến $C$, nên:]
 #formula(($arrow(B C)=frac(1,2)arrow(A B)$,$=(70;25;"0,5")$,))
 #paragraph[Mặt khác, $arrow(B C)=(x-940;y-550;z-8)$. Do đó:]
 #formula(($cases(x-940=70,y-550=25,z-8="0,5")$,$⇒cases(x=1010,y=575,z="8,5")$,))
 #paragraph[Vậy tọa độ cần tìm là $C(1010;575;"8,5")$.]
],
"bai-hoc-8":[
 #paragraph[Gọi $N(x;y;z)$ là vị trí sau 30 phút kể từ $M$. Ta có $arrow(M Q)=(400;200;2)$ và $arrow(N Q)=(1400-x;800-y;16-z)$.]
 #paragraph[Thời gian bay từ $M$ đến $Q$ là 40 phút, gấp 4 lần từ $N$ đến $Q$. Do máy bay giữ nguyên vận tốc và hướng bay:]
 #formula(($arrow(M Q)=4arrow(N Q)$,$⇒cases(400=4(1400-x),200=4(800-y),2=4(16-z))$,))
 #paragraph[Suy ra $x=1300$, $y=750$, $z="15,5"$. Vậy $N(1300;750;"15,5")$.]
],
"tu-luyen-1":[
 #fig("room-simple-solution",width:72.765mm)
 #paragraph[Đặt tên các điểm như hình. Ta có $O'(0;0;3)$ và $B'(8;6;3)$. Điểm treo đèn $I$ ở chính giữa trần nhà nên là trung điểm của đường chéo $O'B'$.]
 #paragraph[Suy ra $I(frac(0+8,2);frac(0+6,2);frac(3+3,2))=I(4;3;3)$. Chọn *C*.]
],
"tu-luyen-2":[
 #paragraph[a) Đúng. Điểm $D∈O y$, $A D=7$ nên $D(0;7;0)$.]
 #paragraph[b) Đúng. Các điểm $C$, $D$ có cùng tung độ bằng $7$.]
 #paragraph[c) Sai. Ta có $D'(0;7;"3,5")$ và $C'(6;7;"3,5")$, do đó $arrow(C'D')=(-6;0;0)$.]
 #paragraph[d) Sai. Trung điểm của $A'C'$ có tọa độ:]
 #formula(($(frac(0+6,2);frac(0+7,2);frac("3,5"+"3,5",2))$,$=(3;"3,5";"3,5")$,))
 #paragraph[Bóng đèn cách trần nhà $"0,5"$ m nên có tọa độ $(3;"3,5";3)$.]
],
"tu-luyen-3":[
 #paragraph[Tam giác $O M H$ vuông tại $H$, $O M=50$, $angle H O M=48°$.]
 #formula(($O H=O M cos 48°≈"33,5"$,$O C=M H=O M sin 48°≈"37,2"$,))
 #paragraph[Tam giác $O A H$ vuông tại $A$, $angle A O H=64°$, nên:]
 #formula(($O A=O H cos 64°≈"14,7"$,$O B=A H=O H sin 64°≈"30,1"$,))
 #paragraph[Vì $arrow(O M)=arrow(O A)+arrow(O B)+arrow(O C)$ nên $M("14,7";"30,1";"37,2")$. Chọn *D*.]
],
"tu-luyen-4":[
 #paragraph[Xét tam giác $C O M$ vuông tại $C$:]
 #formula(($C O=O M cos 65°=14cos 65°≈"5,92"$,$C M=O M sin 65°=14sin 65°≈"12,69"$,))
 #paragraph[Vì $O N=C M$, trong tam giác $B O N$ vuông tại $B$ ta có $O B=O N cos 32°≈"10,76"$.]
 #paragraph[Trong tam giác $A O N$ vuông tại $A$, $angle A O N=90°-32°=58°$, do đó $O A=O N cos 58°≈"6,72"$.]
 #paragraph[Vậy $M("6,72";"10,76";"5,92")$.]
],
"tu-luyen-5":[
 #paragraph[a) Đúng. Nền nhà là hình chữ nhật $O A B C$, nên $x_A=x_B=4$. Vì $A∈O x$ nên $A(4;0;0)$.]
 #paragraph[Tường nhà là hình chữ nhật $O C H E$, suy ra $y_H=y_C=5$, $z_H=z_E=3$. Do $H∈(O y z)$ nên $H(0;5;3)$. Tương tự $F(4;0;3)$.]
 #paragraph[b) Sai. Ta có $arrow(A H)=(-4;5;3)$ và $arrow(A F)=(0;0;3)$.]
 #paragraph[c) Sai. $arrow(A H)⋅arrow(A F)=(-4)⋅0+5⋅0+3⋅3=9$.]
 #paragraph[d) Đúng. Mặt phẳng $(O z x)$ vuông góc với hai mặt $(F G Q P)$ và $(F G H E)$, nên $angle P F E$ là góc phẳng của góc nhị diện cần tìm.]
 #paragraph[Ta có $arrow(F P)=(-2;0;1)$, $arrow(F E)=(-4;0;0)$, nên $cos angle P F E=frac(8,4sqrt(5))=frac(2sqrt(5),5)$. Suy ra $angle P F E≈"26,6"°$.]
],
"tu-luyen-6":[
 #paragraph[Vì $A'(240;450;0)$ nên $A'A=450$ cm và $A'O'=240$ cm. Do đó $a=450$, $b=240$.]
 #formula(($arrow(A'B')=(-120;0;300)$,$A'B'=sqrt((-120)^2+300^2)=60sqrt(29)≈323 quad ("cm")$,))
 #paragraph[Vì $O'∈O y$ và $O O'=A A'=450$ nên $O'(0;450;0)$. Suy ra $arrow(O'B')=(120;0;300)$ và $O'B'=60sqrt(29)$ cm, bằng $A'B'$.]
 #paragraph[Vậy $a+b+c=450+240+60sqrt(29)≈1013$.]
],
"tu-luyen-7":[
 #fig("warehouse-solution",width:115mm)
 #paragraph[a) Đúng. Ta có $A(4;0;0)$, $B(4;6;0)$, $C(0;6;0)$ và $H(0;6;5)$. Hai điểm $P$, $Q$ cùng hoành độ, cao độ; $P Q=A B=6$ nên $arrow(P Q)=(0;6;0)$.]
 #paragraph[b) Sai. Điểm $G$ có tọa độ $(4;6;5)$.]
 #paragraph[c) Đúng. Gọi $I$ là trung điểm $E F$. Tam giác $E F P$ cân tại $P$ nên $P I⊥E F$. Vì $Q G⊥F G$ và $H G⊥F G$, góc nhị diện $[Q,F G,H]$ có góc phẳng $angle Q G H=45°$.]
 #paragraph[Suy ra $angle P F E=45°$, tam giác $E F P$ vuông cân tại $P$. Do đó $P I=frac(E F,2)=2$ m. Chiều cao kho hàng là $P I+F A=2+5=7$ m.]
 #paragraph[d) Đúng. Gọi $M$ là trung điểm $G Q$, vị trí camera. Tam giác $Q H G$ vuông cân tại $Q$ cho $H Q=Q G=frac(4,sqrt(2))=2sqrt(2)$ m và $Q M=sqrt(2)$ m.]
 #formula(($H M=sqrt(H Q^2+Q M^2)=sqrt(10) quad ("m")$,$O E+E H+H M=5+6+sqrt(10)=11+sqrt(10) quad ("m")$,))
],
"tu-luyen-8":[
 #fig("hanging-ball-solution",width:65.1mm)
 #paragraph[Gọi $I$ là tâm quả cầu, $D$ là điểm thấp nhất. Vì quả cầu tiếp xúc với hai tường vuông góc nên khoảng cách từ $I$ đến giao tuyến của hai tường là $I K=r sqrt(2)$.]
 #paragraph[Ta có $D E=H O=20$, $B K=80-20-r=60-r$. Dây treo ngắn nhất nối $B$ với mặt cầu nên $B$, $A$, $I$ thẳng hàng và $I B=r+30$.]
 #paragraph[Áp dụng định lý Pythagore trong tam giác vuông $B I K$:]
 #formula(($(r sqrt(2))^2+(60-r)^2=(r+30)^2$,$⇔2r^2-180r+2700=0$,$⇔r=45±15sqrt(3)$,))
 #paragraph[Điểm $B$ phải ở phía trên tâm cầu để treo quả bóng như hình, nên $r<60$. Loại $r=45+15sqrt(3)>60$, chọn $r=45-15sqrt(3)$.]
 #formula(($d=2r=90-30sqrt(3)≈38 quad ("cm")$,))
],
"tu-luyen-9":[
 #paragraph[a) Đổi $400$ m $="0,4"$ km. Trục $O x$ hướng Nam, $O y$ hướng Đông nên khinh khí cầu có tọa độ $(5;10;"0,4")$.]
 #paragraph[b) Khoảng cách đến điểm xuất phát bằng:]
 #formula(($sqrt(5^2+10^2+("0,4")^2)≈"11,2" quad ("km")$,))
],
"tu-luyen-10":[
 #paragraph[Gọi $A$, $B$, $M$ lần lượt là vị trí hai khinh khí cầu và người quan sát. Chọn $O x$ hướng Nam, $O y$ hướng Đông, $O z$ thẳng đứng lên; khi đó $A(300;100;100)$, $B(-200;-100;50)$, $M(a;b;0)$.]
 #paragraph[Lấy $B'(-200;-100;-50)$ đối xứng với $B$ qua $(O x y)$. Ta có $M A+M B=M A+M B'≥A B'$. Tổng nhỏ nhất khi $M$ là giao điểm của $A B'$ với $(O x y)$.]
 #formula(($arrow(A M)=(a-300;b-100;-100)$,$arrow(A B')=(-500;-200;-150)$,))
 #formula(($frac(a-300,-500)=frac(b-100,-200)=frac(-100,-150)=frac(2,3)$,$⇒a=b=-frac(100,3)$,))
 #paragraph[Vậy $M(-frac(100,3);-frac(100,3);0)$, suy ra $O M=frac(100sqrt(2),3)≈47$ m.]
],
"tu-luyen-11":[
 #paragraph[Theo hệ trục trong đề, $A(3;2;5)$, $B(-6;-6;5)$. Gọi $M(x;y;0)$ là vị trí cần tìm, lấy $B'(-6;-6;-5)$ đối xứng với $B$ qua $(O x y)$.]
 #paragraph[Khi đó $M A+M B=M A+M B'≥A B'$. Dấu bằng xảy ra khi $M$ nằm trên đoạn $A B'$, tương đương:]
 #formula(($frac(x-3,-9)=frac(y-2,-8)=frac(-5,-10)=frac(1,2)$,$⇒x=-"1,5", quad y=-2$,))
 #paragraph[Vậy khoảng cách cần tìm là $O M=sqrt(( -"1,5")^2+(-2)^2)=frac(5,2)="2,5"$ m.]
],
"tu-luyen-12":[
 #paragraph[Vì máy bay $B$ cùng hướng và có tốc độ gấp ba máy bay $A$, vectơ vận tốc của $B$ là:]
 #formula(($arrow(b)=3arrow(a)=3(300;200;400)=(900;600;1200)$,))
 #paragraph[Tốc độ của máy bay $B$ bằng:]
 #formula(($abs(arrow(b))=sqrt(900^2+600^2+1200^2)$,$=300sqrt(29)≈"1615,55" quad ("km/h")$,))
],
"tu-luyen-13":[
 #paragraph[Máy bay giữ nguyên vận tốc và hướng bay, hai khoảng thời gian $A B$ và $B D$ đều là 10 phút, nên:]
 #formula(($arrow(B D)=arrow(A B)=(140;50;1)$,))
 #paragraph[Mặt khác $arrow(B D)=(x-940;y-550;z-8)$, do đó:]
 #formula(($cases(x-940=140,y-550=50,z-8=1) ⇒ cases(x=1080,y=600,z=9)$,))
 #paragraph[Vậy $D(1080;600;9)$ và $x+y+z=1689$.]
],
"tu-luyen-14":[
 #paragraph[Gọi $Q(x;y;z)$ là vị trí sau 5 phút tiếp theo. Ta có $arrow(M N)=(300;100;2)$, $arrow(N Q)=(x-800;y-300;z-10)$.]
 #paragraph[Máy bay giữ nguyên vận tốc và hướng bay. Thời gian từ $M$ đến $N$ gấp 4 lần từ $N$ đến $Q$, nên:]
 #formula(($arrow(M N)=4arrow(N Q)$,$⇒cases(300=4(x-800),100=4(y-300),2=4(z-10))$,))
 #paragraph[Suy ra $x=875$, $y=325$, $z="10,5"$. Vậy $Q(875;325;"10,5")$.]
],
)
