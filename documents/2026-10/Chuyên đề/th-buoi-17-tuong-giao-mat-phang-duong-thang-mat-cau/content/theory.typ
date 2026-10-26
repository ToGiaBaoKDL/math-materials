#import "/templates/lesson.typ": lesson-section, theory-box, paragraph
#import "../figures.typ": diagram
#let beside(body,name,compact:false)=block(breakable:false,above:if compact {1mm} else {3mm},below:if compact {1mm} else {3mm},
  grid(columns:(1fr,69.12mm),gutter:5mm,align:left+horizon,body,box(height:if compact {51mm} else {auto},diagram(name,width:69.12mm))))
#let slide-case(body,name,flow:false)=block(width:100%,breakable:flow,above:4mm,below:5mm)[
  #block(width:100%,breakable:false,body)
  #v(2mm)
  #align(center,box(width:88mm,diagram(name,width:88mm)))
]
#let theory(n,variant:"de") = {
 let beside = beside.with(compact: variant != "dap-an")
 let slide-case = slide-case.with(flow: variant != "de")
 if n==1 {
  lesson-section([VỊ TRÍ TƯƠNG ĐỐI GIỮA HAI ĐƯỜNG THẲNG],badge:[1])
  theory-box(title:[Lý thuyết cần nhớ])[
   Cho hai đường thẳng:
   #align(center)[$d:cases(x=x_0+a_1 t,y=y_0+a_2 t,z=z_0+a_3 t)$ #h(7mm) và #h(7mm) $d':cases(x=x'_0+a'_1 t',y=y'_0+a'_2 t',z=z'_0+a'_3 t')$]
   lần lượt qua hai điểm $M,N$, có vectơ chỉ phương $arrow(a)_d,arrow(a)_(d')$.
   #paragraph[$d ∥ d' ⇔ cases(arrow(a)_d = k arrow(a)_(d'),M ∉ d')$.]
   #paragraph[$d equiv d' ⇔ cases(arrow(a)_d = k arrow(a)_(d'),M ∈ d')$.]
   #paragraph[$d$ cắt $d'$ khi hai vectơ chỉ phương không cùng phương và $[arrow(a)_d,arrow(a)_(d')] dot arrow(M N)=0$.]
   #paragraph[$d$ chéo $d' ⇔ [arrow(a)_d,arrow(a)_(d')] dot arrow(M N) != 0$.]
   *Lưu ý:* Nếu $d$ cắt $d'$, tìm tọa độ giao điểm bằng cách giải hệ:
   #align(center)[$ cases(x_0+a_1 t=x'_0+a'_1 t',y_0+a_2 t=y'_0+a'_2 t',z_0+a_3 t=z'_0+a'_3 t') $.]
  ]
 } else if n==2 {
  lesson-section([TƯƠNG GIAO MẶT PHẲNG VÀ MẶT CẦU],badge:[2])
  paragraph[Cho mặt phẳng $(P): A x+B y+C z+d=0$ và mặt cầu $(S)$ có tâm $I(a;b;c)$, bán kính $R$. Gọi $H$ là hình chiếu của $I$ trên $(P)$, khi đó $d(I;(P))=I H$.]
  slide-case([*Không có điểm chung*\ #v(2mm) Nếu $I H>R$ thì $(P)$ không cắt $(S)$.],"plane-outside")
  slide-case([*Tiếp xúc*\ #v(2mm) Nếu $I H=R$ thì $(P)$ tiếp xúc với $(S)$. Khi đó $arrow(I H)$ là vectơ pháp tuyến của $(P)$ và $H$ là tiếp điểm.],"plane-tangent")
  slide-case([*Cắt nhau*\ #v(2mm) Nếu $I H<R$ thì $(P)$ cắt $(S)$ theo đường tròn $(C)$ tâm $H$, bán kính $r$. Khi đó:\ #v(2mm) $R^2=r^2+I H^2$.],"plane-cut")
 } else {
  lesson-section([TƯƠNG GIAO ĐƯỜNG THẲNG VÀ MẶT CẦU],badge:[3])
  paragraph[Cho mặt cầu $(S)$ tâm $I$, bán kính $R$ và đường thẳng $Delta$. Để xét vị trí tương đối giữa $Delta$ và $(S)$, tính $d(I,Delta)$ rồi so sánh với $R$.]
  beside([Nếu $d(I,Delta)>R$: $Delta$ không cắt $(S)$.],"line-outside")
  beside([Nếu $d(I,Delta)=R$: $Delta$ tiếp xúc với $(S)$ tại $H$.],"line-tangent")
  beside([Nếu $d(I,Delta)<R$: $Delta$ cắt $(S)$ tại hai điểm phân biệt $A,B$.],"chord")
 }
}
