#import "/templates/drawing.typ": path, smooth, arrow-line, label, solid-path
#import "/templates/components.typ": figure-panel
#let ink=rgb("#263345")
#let blue=rgb("#005FE6")
#let red=rgb("#ED174C")
#let pink=rgb("#FF3B83")
#let lime=rgb("#BFFF36")
#let cyan=rgb("#35DDE5")
#let gold=rgb("#FFD43B")
#let pt(p)=(p.at(0)*1mm,p.at(1)*1mm)
#let edge(a,b,color:ink,dashed:false,width:1.1pt)={
 if dashed {
  let dx=b.at(0)-a.at(0); let dy=b.at(1)-a.at(1)
  let length=calc.sqrt(dx*dx+dy*dy)
  let count=calc.max(1,calc.round(length/1.8))
  let step=length/count
  for i in range(int(count)) {
   let t0=(i*step+step*0.2)/length
   let t1=(i*step+step*0.8)/length
   solid-path((pt((a.at(0)+dx*t0,a.at(1)+dy*t0)),pt((a.at(0)+dx*t1,a.at(1)+dy*t1))),thickness:width,color:color)
  }
 } else {solid-path((pt(a),pt(b)),thickness:width,color:color)}
}
#let face(ps,color)=path(ps.map(pt),close:true,fill:color,stroke:none)
#let tag(p,t,dx:0,dy:0,width:14)=label(pt(p),t,dx:dx*1mm,dy:dy*1mm,width:width*1mm)
#let arrow(a,b,color:ink)=arrow-line(pt(a),pt(b),color:color,thickness:1.2pt)
#let dot(p,t,dx:0,dy:0)={
 place(top+left,dx:p.at(0)*1mm - 0.65mm,dy:p.at(1)*1mm - 0.65mm,circle(radius:0.65mm,fill:red,stroke:none))
 tag(p,t,dx:dx,dy:dy)
}
#let rect-at(p,w,h,fill,radius:1mm)=place(top+left,dx:p.at(0)*1mm,dy:p.at(1)*1mm,rect(width:w*1mm,height:h*1mm,fill:fill,stroke:1pt+ink,radius:radius))
// One hue per solid; edge shades distinguish depth without changing line weight.
#let solid-colors=(light:rgb("#FFB5C6"),mid:rgb("#FF789A"),dark:rgb("#E84D78"),edge:rgb("#78253E"),soft:rgb("#A83D5C"))
#let solid-edge(a,b,dashed:false,width:1.1pt,colors:solid-colors) = edge(a,b,color:if dashed {colors.soft} else if b.at(1) < a.at(1) {colors.soft} else {colors.edge},dashed:dashed,width:width)
#let solid-dot(p,t,dx:0,dy:0,colors:solid-colors)={
 place(top+left,dx:p.at(0)*1mm - 0.65mm,dy:p.at(1)*1mm - 0.65mm,circle(radius:0.65mm,fill:colors.edge,stroke:none))
 tag(p,t,dx:dx,dy:dy)
}
#let rational()=box(width:98mm,height:80mm)[
 #let p(x,y)=(51+12*x,65 - 10*y)
 #arrow(p(-3.9,0),p(3.3,0)) #arrow(p(0,-1),p(0,5.7))
 #edge(p(-4/3,-1),p(-4/3,5.6),color:red)
 #edge(p(-3.8,8/3),p(3.2,8/3),color:red)
 #for (a,b) in ((-3.8,-1.69),(-1.06,3.1)) {
  smooth(t=>pt(p(t,8/3 - 1/(t+4/3))),t=>(12mm,-10mm/(t+4/3)/(t+4/3)),a,b,stroke:1.5pt+blue)
 }
 #tag(p(3.3,0),$x$,dy:4) #tag(p(0,5.7),$y$,dx:4)
 #tag(p(0,0),$O$,dx:4,dy:4)
 #tag(p(-4/3,0),$-frac(4,3)$,dx:-4,dy:7)
 #tag(p(0,8/3),$frac(8,3)$,dx:6,dy:-9)
]
#let oblique()=box(width:100mm,height:96mm)[
 #let p(x,y)=(59+15*x,48 - 10*y)
 #arrow(p(-3.5,0),p(2.3,0)) #arrow(p(0,-4.2),p(0,4.2))
 #edge(p(-3.4,2.9),p(2.1,-2.6),color:red)
 #edge(p(-0.5,-4.1),p(-0.5,4.1),color:red,dashed:true)
 #for (a,b) in ((-3.4,-0.77),(-0.23,2.1)) {
  smooth(t=>pt(p(t,-t - 0.5 - 1/(t+0.5))),t=>(15mm,10mm*(1 - 1/(t+0.5)/(t+0.5))),a,b,stroke:1.5pt+blue)
 }
 #for (x,y) in ((-1.5,2),(0.5,-2)) {
  edge(p(x,0),p(x,y),color:red,dashed:true)
  edge(p(0,y),p(x,y),color:red,dashed:true)
 }
 #tag(p(2.3,0),$x$,dy:4) #tag(p(0,4.2),$y$,dx:4) #tag(p(0,0),$O$,dx:3,dy:-4)
 #tag(p(-1.5,0),$-frac(3,2)$,dy:4) #tag(p(-0.5,0),$-frac(1,2)$,dx:-3,dy:4)
 #tag(p(0.5,0),$frac(1,2)$,dx:0,dy:-8)
 #tag(p(0,2),$2$,dx:4) #tag(p(0,-2),$-2$,dx:-4)
]
#let prism()=box(width:98mm,height:77mm)[
 #let A=(39,48); #let B=(15,64); #let C=(71,64)
 #let Ap=(48,9); #let Bp=(24,25); #let Cp=(80,25)
 #face((B,C,Cp,Bp),solid-colors.dark) #face((Ap,Bp,Cp),solid-colors.light)
 #for (a,b) in ((A,B),(A,C),(A,Ap)) {solid-edge(a,b,dashed:true)}
 #for (a,b) in ((B,C),(B,Bp),(C,Cp),(Ap,Bp),(Bp,Cp),(Cp,Ap)) {solid-edge(a,b)}
 #solid-dot(A,$A$,dx:-3,dy:-3) #solid-dot(B,$B$,dx:-4,dy:3) #solid-dot(C,$C$,dx:4,dy:3)
 #solid-dot(Ap,$A'$,dy:-4) #solid-dot(Bp,$B'$,dx:-5) #solid-dot(Cp,$C'$,dx:5)
]
#let variation()=box(width:144mm,height:62mm)[
 #face(((0,0),(144,0),(144,10),(0,10)),rgb("#FFE6ED"))
 #face(((0,10),(12,10),(12,62),(0,62)),rgb("#FFE6ED"))
 #solid-path(((0mm,0mm),(144mm,0mm),(144mm,62mm),(0mm,62mm)),close:true,thickness:0.9pt,color:ink)
 #for y in (10,22) {edge((0,y),(144,y),width:0.9pt)}
 #edge((12,0),(12,62),width:0.9pt)
 #let cell-tag(p,t,w:12,h:8)=place(top+left,dx:(p.at(0)-w/2)*1mm,dy:(p.at(1)-h/2)*1mm,box(width:w*1mm,height:h*1mm,align(center+horizon,text(size:11pt,t))))
 #cell-tag((6,5),$x$) #cell-tag((6,16),$y'$) #cell-tag((6,42),$y$)
 #for (x,t) in ((18,$-infinity$),(45,$-1$),(78,$0$),(111,$1$),(138,$+infinity$)) {cell-tag((x,5),t)}
 #for x in (28.5,61.5,94.5,127.5) {cell-tag((x,16),$-$)}
 #for x in (45,111) {for dx in (-0.5,0.5) {edge((x+dx,10),(x+dx,62),width:0.65pt)}}
 #for dx in (-0.5,0.5) {edge((78+dx,10),(78+dx,22),width:0.65pt)}
 #cell-tag((20,48),$-2$) #cell-tag((38,57),$-infinity$)
 #cell-tag((52,28),$+infinity$) #cell-tag((78,43),$-1$) #cell-tag((104,57),$-infinity$)
 #cell-tag((118,28),$+infinity$) #cell-tag((137,38),$0$)
 #for (a,b) in (((25,50),(33,54)),((57,31),(72,40)),((83,46),(98,54)),((123,30),(132,35))) {arrow(a,b,color:blue)}
]
#let pyramid-net()=box(width:166mm,height:80mm)[
 #let A=(22,42); #let B=(42,42); #let C=(42,22); #let D=(22,22)
 #face((A,B,C,D),solid-colors.light)
 #for (a,b,c,col) in ((A,B,(32,57),solid-colors.mid),(B,C,(57,32),solid-colors.dark),(C,D,(32,7),solid-colors.mid),(D,A,(7,32),solid-colors.dark)) {
  face((a,b,c),col)
 }
 #solid-path(((7mm,7mm),(57mm,7mm),(57mm,57mm),(7mm,57mm)),close:true,thickness:1.1pt,color:solid-colors.edge)
 #for (a,b,c) in ((A,B,(32,57)),(B,C,(57,32)),(C,D,(32,7)),(D,A,(7,32))) {
  solid-edge(a,c); solid-edge(b,c); solid-edge(a,b,dashed:true,width:1.5pt)
 }
 #for p in ((14,14),(50,14),(14,50),(50,50)) {tag(p,[Bỏ],width:12)}
 #tag((32,46),$x$)
 #solid-edge((7,64),(57,64)) #solid-edge((7,61),(7,67)) #solid-edge((57,61),(57,67))
 #tag((32,71),[190 cm],width:30)
 #arrow((68,34),(85,34),color:solid-colors.edge)
 // Standard square pyramid: apex above the center of the projected base.
 #let a=(98,53); #let b=(138,60); #let c=(158,45); #let d=(118,38); #let s=(128,7)
 #face((s,a,b),solid-colors.mid) #face((s,b,c),solid-colors.dark)
 #for (u,v) in ((a,d),(d,c),(s,d)) {solid-edge(u,v,dashed:true)}
 #for (u,v) in ((a,b),(b,c),(s,a),(s,b),(s,c)) {solid-edge(u,v)}
 #tag((118,61),$x$,dy:3) #tag((128,75),$(H)$)
]
#let earthquake()=box(width:104mm,height:36mm)[
 #rect-at((10,8),18,21,cyan) #rect-at((32,3),22,26,pink)
 #for (x,y) in ((14,12),(21,12),(14,20),(21,20),(37,8),(45,8),(37,17),(45,17)) {rect-at((x,y),3,4,white,radius:0mm)}
 #edge((5,30),(56,30))
 #path(((59mm,21mm),(65mm,21mm),(69mm,16mm),(73mm,28mm),(78mm,7mm),(83mm,25mm),(88mm,18mm),(93mm,21mm),(100mm,21mm)),stroke:1.4pt+red)
]
#let box-figure()=box(width:110mm,height:82mm)[
 #let solid-colors=(light:rgb("#B0EFF1"),mid:rgb("#55DCE5"),dark:rgb("#29B9C7"),edge:rgb("#19535C"),soft:rgb("#357B83"))
 #let solid-edge(a,b,dashed:false,width:1.1pt) = {
  if dashed {edge(a,b,color:red,dashed:true,width:width)} else {edge(a,b,color:solid-colors.edge,width:width)}
 }
 #let solid-dot=solid-dot.with(colors:solid-colors)
 #let A=(13,46); #let B=(60,59); #let C=(92,44); #let D=(45,31)
 #let Ap=(13,13); #let Bp=(60,26); #let Cp=(92,11); #let Dp=(45,-2)
 // Keep top labels inside the frame by shifting the full group down.
 #place(top+left,dy:9mm)[
 #face((A,B,Bp,Ap),solid-colors.mid) #face((B,C,Cp,Bp),solid-colors.dark) #face((Ap,Bp,Cp,Dp),solid-colors.light)
 #for (a,b) in ((A,D),(D,C),(D,Dp)) {solid-edge(a,b,dashed:true)}
 #for (a,b) in ((A,B),(B,C),(A,Ap),(B,Bp),(C,Cp),(Ap,Bp),(Bp,Cp),(Cp,Dp),(Dp,Ap)) {solid-edge(a,b)}
 #solid-edge(B,Cp,dashed:true) #solid-edge(C,Bp,dashed:true)
 #let G=((13+45+92)/3,(46+31+44)/3)
 #solid-edge(A,C,dashed:true)
 #solid-dot((76,35),$O$,dx:5,dy:1) #solid-dot(G,$G$,dx:4,dy:-3)
 #solid-dot(A,$A$,dx:-4) #solid-dot(B,$B$,dy:5) #solid-dot(C,$C$,dx:5) #solid-dot(D,$D$,dx:-4,dy:-2)
 #solid-dot(Ap,$A'$,dx:-5) #solid-dot(Bp,$B'$,dx:0,dy:-4) #solid-dot(Cp,$C'$,dx:5) #solid-dot(Dp,$D'$,dy:-4)
 ]
]
#let octagon()=box(width:82mm,height:77mm)[
 #let ps=range(8).map(i=>(41+27*calc.cos((202.5-i*45)*1deg),38+27*calc.sin((202.5-i*45)*1deg)))
 #face(ps,ink)
 // Nested polygons form one continuous border, including horizontal and vertical sides.
 #let inset-radius=27 - (1.8pt / 1mm) / calc.cos(22.5deg)
 #face(range(8).map(i=>(41+inset-radius*calc.cos((202.5-i*45)*1deg),38+inset-radius*calc.sin((202.5-i*45)*1deg))),lime)
 #for i in range(8) {
  let p=ps.at(i); let x=p.at(0) - 41;let y=p.at(1) - 38
  dot(p,($A$,$B$,$C$,$D$,$E$,$F$,$G$,$H$).at(i),dx:x/6,dy:y/6)
 }
]
#let kiln()=box(width:112mm,height:58mm)[
 #face(((15,8),(23,3),(76,3),(68,8)),solid-colors.mid)
 #face(((68,8),(76,3),(76,43),(68,48)),solid-colors.dark)
 #rect-at((15,8),53,40,solid-colors.mid,radius:2mm)
 #rect-at((20,13),34,29,ink,radius:2mm)
 #rect-at((23,16),28,23,solid-colors.mid,radius:1mm)
 #rect-at((26,19),22,17,solid-colors.light,radius:0.8mm)
 #for y in (20,26,32) {edge((23,y),(26,y),color:ink,width:0.65pt); edge((48,y),(51,y),color:ink,width:0.65pt)}
 // Curved ceramic vase silhouette and rim.
 #place(top+left,curve(fill:solid-colors.dark,stroke:0.8pt+ink,
  curve.move((34mm,22mm)),curve.line((40mm,22mm)),curve.line((39mm,25mm)),
  curve.cubic((46mm,28mm),(44mm,34mm),(41mm,35mm)),
  curve.line((33mm,35mm)),curve.cubic((30mm,34mm),(28mm,28mm),(35mm,25mm)),curve.close()))
 #edge((33.5,22),(40.5,22),width:0.9pt)
 #edge((25,37),(49,37),width:1.3pt)
 #rect-at((58,14),6,9,ink,radius:0.8mm)
 #rect-at((59,16),4,3,solid-colors.light,radius:0.3mm)
 #place(top+left,dx:59mm,dy:27mm,circle(radius:2mm,fill:solid-colors.dark,stroke:0.8pt+ink))
 #edge((57,35),(64,35)) #edge((57,38),(64,38))
 #rect-at((19,48),7,4,ink,radius:0mm) #rect-at((58,48),7,4,ink,radius:0mm)
 #edge((10,53),(81,53))
 #rect-at((92,11),4,28,white,radius:2mm)
 #place(top+left,dx:89mm,dy:35mm,circle(radius:5mm,fill:solid-colors.dark,stroke:1pt+ink))
 #edge((94,23),(94,39),color:solid-colors.dark,width:2pt)
 #for y in (17,22,27,32) {edge((97,y),(100,y),width:0.7pt)}
 #tag((104,10),[°C])
]
#let stations()=box(width:152mm,height:103mm)[
 // Common affine projection preserves all coordinates and the ground plane.
 #let p(x,y,z)=(65+5*x+1.6*y,78 - 1.8*y - 12*z)
 #let A=p(6,0,0); #let B=p(-6,0,0); #let C=p(0,12,3); #let H=p(0,12,0)
 #let M=p(-4,8*calc.sqrt(1 - 16/100),0)
 #face(((5,94),(117,94),(143,48),(31,48)),rgb("#D9BC8F"))
 #solid-path(((5mm,94mm),(117mm,94mm),(143mm,48mm),(31mm,48mm)),close:true,thickness:0.7pt,color:rgb("#8C633B"))
 // Corner arc denotes the plane label, not a measured angle.
 #smooth(t=>pt((5+18*calc.cos(t*1rad),94+18*calc.sin(t*1rad))),t=>(-18mm*calc.sin(t*1rad),18mm*calc.cos(t*1rad)),-1.056,0,stroke:0.8pt+ink)
 #tag((16,89),text(size:9pt)[$(O x y)$],width:16)
 #arrow(p(0,0,0),p(13,0,0)) #arrow(p(0,0,0),p(0,19,0)) #arrow(p(0,0,0),p(0,0,6))
 #tag(p(13,0,0),$x$,dx:4) #tag(p(0,19,0),$y$,dx:3,dy:-3) #tag(p(0,0,6),$z$,dy:-3)
 #edge(A,M,color:blue,width:1.3pt) #edge(B,M,color:blue,width:1.3pt)
 #edge(C,M,color:red,width:1.4pt)
 #edge(C,H,color:ink,dashed:true)
 #edge((H.at(0)-2.4,H.at(1)+2.7),(H.at(0)-2.4,H.at(1)-0.3),width:0.8pt)
 #edge((H.at(0)-2.4,H.at(1)-0.3),(H.at(0),H.at(1)-3),width:0.8pt)
 // Antenna icons stand on the ground at A and B.
 #for q in (A,B) {
  let (x,y)=q
  face(((x - 3,y),(x,y - 12),(x+3,y)),cyan)
  edge((x - 3,y),(x,y - 12)); edge((x,y - 12),(x+3,y)); edge((x - 2,y - 4),(x+2,y - 4))
  for side in (-1,1) {
   smooth(t=>pt((x+side*4*calc.cos(t*1rad),y - 12+4*calc.sin(t*1rad))),t=>(-side*4mm*calc.sin(t*1rad),4mm*calc.cos(t*1rad)),-0.7,0.7,stroke:1pt+blue)
  }
 }
 // Handheld receiver at M; the coordinate marker remains at ground contact.
 #rect-at((M.at(0)-2.5,M.at(1)-6),5,5,ink,radius:0.8mm)
 #rect-at((M.at(0)-1.5,M.at(1)-5),3,2,lime,radius:0.2mm)
 #edge((M.at(0)+1.5,M.at(1)-6),(M.at(0)+2,M.at(1)-9),width:1pt)
 // Elevated command platform: C is the reference point, its vertical guide meets the ground.
 #face(((C.at(0)-7,C.at(1)),(C.at(0)+7,C.at(1)),(C.at(0)+10,C.at(1)-3),(C.at(0)-4,C.at(1)-3)),cyan)
 #rect-at((C.at(0)-4,C.at(1)-9),9,6,pink,radius:0.6mm)
 #rect-at((C.at(0)-2,C.at(1)-8),3,2,lime,radius:0.2mm)
 #edge((C.at(0)+3,C.at(1)-9),(C.at(0)+3,C.at(1)-13))
 #tag((112,15),[Trạm chỉ huy],width:35)
 #dot(A,$A$,dy:5) #dot(B,$B$,dy:5) #dot(p(0,0,0),$O$,dx:3,dy:4)
 #dot(M,$M$,dx:-6,dy:-2) #dot(C,$C$,dx:5,dy:3)
]
#let triangles()=box(width:90mm,height:66mm)[
 #let A=(45,5); #let B=(12,59); #let C=(78,59)
 #let D=(28.5,32); #let E=(61.5,32); #let F=(45,59)
 #face((A,D,E),cyan) #face((B,D,F),cyan) #face((C,E,F),cyan) #face((D,E,F),pink)
 #for (a,b) in ((A,B),(B,C),(C,A),(D,E),(E,F),(F,D)) {edge(a,b)}
]
#let steel()=box(width:170mm,height:79mm)[
 #let solid-colors=(light:rgb("#FFC0CB"),mid:rgb("#FF91A4"),dark:rgb("#E9748D"),edge:rgb("#823C4C"),soft:rgb("#A64D63"))
 #let solid-edge=solid-edge.with(colors:solid-colors)
 #let solid-dot=solid-dot.with(colors:solid-colors)
 #let A=(8,57); #let B=(62,57); #let C=(62,16); #let D=(8,16); #let O=(35,36.5)
 #face((A,B,O),solid-colors.mid) #face((A,O,D),solid-colors.light) #face((D,O,C),solid-colors.dark)
 // Irregular right edge is damaged material removed with OBC.
 #face((O,C,(62,22),(52,27),(51,34),(58,42),B),rgb("#D8DDE5"))
 #for (a,b) in ((A,B),(B,O),(O,C),(C,D),(D,A),(A,O),(D,O)) {solid-edge(a,b)}
 #path(((62mm,16mm),(62mm,22mm),(52mm,27mm),(51mm,34mm),(58mm,42mm),(62mm,57mm)),stroke:1pt+solid-colors.edge)
 #solid-dot(A,$A$,dy:5) #solid-dot(B,$B$,dy:5) #solid-dot(C,$C$,dy:-4) #solid-dot(D,$D$,dy:-4) #solid-dot(O,$O$,dy:-5)
 #arrow((73,36),(89,36),color:solid-colors.edge)
 // OA=OB=OD=1.95; AB=BD=3.12; AD=2.34. Exact 3D model before projection.
 #let l=calc.sqrt(3.12*3.12 - 1.17*1.17)
 #let cy=(l*l - 1.17*1.17)/(2*l)
 #let h=calc.sqrt(1.95*1.95 - 1.17*1.17-cy*cy)
 #let p(x,y,z)=(121+16*x+4*y,43+3*x+6*y - 29*z)
 #let a=p(-1.17,0,0); #let d=p(1.17,0,0); #let b=p(0,l,0); #let o=p(0,cy,h)
 #face((o,a,b),solid-colors.mid) #face((o,b,d),solid-colors.dark)
 #solid-edge(a,d,dashed:true)
 #solid-edge(a,b) #solid-edge(b,d) #solid-edge(o,b) #solid-edge(o,a) #solid-edge(o,d)
 #solid-dot(o,$O$,dy:-4) #solid-dot(a,$A$,dx:-4,dy:3) #solid-dot(d,$D$,dx:4,dy:3) #solid-dot(b,$B equiv C$,dy:6)
]
#let factory()=box(width:100mm,height:40mm)[
 #face(((10,33),(10,15),(25,8),(25,15),(40,8),(40,15),(55,8),(55,33)),cyan)
 #rect-at((59,3),8,30,pink,radius:0mm)
 #for x in (16,30,44) {rect-at((x,22),7,7,lime,radius:0mm)}
 #edge((6,34),(72,34))
 #rect-at((76,24),13,10,gold,radius:0mm) #rect-at((82,14),13,10,gold,radius:0mm)
 #edge((82.5,24),(82.5,29)) #edge((88.5,14),(88.5,19))
]
#let fig(name)=figure-panel((rational:rational,oblique:oblique,prism:prism,variation:variation,pyramid-net:pyramid-net,earthquake:earthquake,box:box-figure,octagon:octagon,kiln:kiln,stations:stations,triangles:triangles,steel:steel,factory:factory).at(name)(),above:5mm,below:5mm)
