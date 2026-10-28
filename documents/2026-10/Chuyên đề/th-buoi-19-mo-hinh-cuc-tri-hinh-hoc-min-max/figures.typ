#import "/templates/drawing.typ": path, label, figure-fill
#let red=rgb("#B00012")
#let pink=figure-fill(rgb("#F6B1B8"))
#let pale=figure-fill(rgb("#FADADD"))
#let edge=0.8pt+red
#let hidden=(paint:red,thickness:0.8pt,dash:(2.5pt,2pt))
#let p(x,y)=(x*1mm,y*1mm)
#let seg(a,b,dash:false)=path((p(..a),p(..b)),stroke:if dash {hidden}else{edge})
#let lab(a,t,dx:0,dy:0)=label(p(..a),t,dx:dx*1mm,dy:dy*1mm)
#let dot(a,t,dx:0,dy:0)={
 place(top+left,dx:a.at(0)*1mm-0.5mm,dy:a.at(1)*1mm-0.5mm,circle(radius:0.5mm,fill:red,stroke:none))
 lab(a,t,dx:dx,dy:dy)
}
#let disk(c,r,fill:pale)=place(top+left,dx:(c.at(0)-r)*1mm,dy:(c.at(1)-r)*1mm,circle(radius:r*1mm,stroke:edge,fill:fill))
#let ellipse-at(c,rx,ry,fill:none)=place(top+left,dx:(c.at(0)-rx)*1mm,dy:(c.at(1)-ry)*1mm,ellipse(width:2*rx*1mm,height:2*ry*1mm,stroke:edge,fill:fill))
#let arc(c,rx,ry,back:false)={
 let pts=range(0,41).map(i=>{let a=(if back {180}else{0})*1deg+i*180deg/40;(p(c.at(0)+rx*calc.cos(a),c.at(1)+ry*calc.sin(a)))})
 path(pts,stroke:if back {hidden}else{edge})
}
#let plane(name:[$(P)$])={
 path((p(4,49),p(77,49),p(94,29),p(21,29)),close:true,fill:pale,stroke:edge)
 place(top+left,curve(curve.move(p(15,49)),curve.cubic(p(15,46),p(13,42),p(10,42)),stroke:edge))
 lab((11,46),name)
}
#let right-angle(a)=path((p(a.at(0),a.at(1)-3),p(a.at(0)+3,a.at(1)-3),p(a.at(0)+3,a.at(1))),stroke:edge)
#let sphere-point(plane-view:false,above:false,origin:false)=box(width:103mm,height:54mm)[
 #if plane-view { plane() }
 #disk((44,27),21)
 #seg((23,27),(91,27))
 #dot((44,27),[$I$],dy:4)
 #dot((23,27),[$M_(max)$],dx:-6,dy:4)
 #dot((65,27),[$M_(min)$],dx:5,dy:4)
 #lab((33,23),[$R$])
 #dot((39,6.6),[$M$],dx:-3,dy:-4)
 #lab((66,10),if plane-view {[$(C)$]}else{[$(S)$]})
 #if above {
   seg((91,27),(91,3));dot((91,3),[$A$],dx:4);dot((91,27),[$A'$],dx:4,dy:4)
   right-angle((91,27))
 } else { dot((91,27),if origin {[$O$]}else{[$A$]},dx:4) }
]
#let circles(overlap:false)=box(width:116mm,height:53mm)[
 #let c1=if overlap {(40,26)}else{(28,26)}
 #let c2=if overlap {(69,26)}else{(83,26)}
 #disk(c1,21)
 #disk(c2,if overlap {16}else{23},fill:none)
 #seg((c1.at(0)-21,26),(c2.at(0)+if overlap {16}else{23},26))
 #dot(c1,[$I_1$],dy:4) #dot(c2,[$I_2$],dy:4)
 #lab((c1.at(0)-21,32),[$M_(max)$],dx:-1)
 #lab((c2.at(0)+if overlap {16}else{23},32),[$N_(max)$])
 #if not overlap {
  lab((49,22),[$M_(min)$]);lab((60,22),[$N_(min)$])
  lab((19,21),[$R_1$]);lab((92,21),[$R_2$]);lab((12,7),[$(C_1)$]);lab((103,4),[$(C_2)$])
 }
]
#let projection(mode:"point")=box(width:99mm,height:54mm)[
 #plane(name:if mode=="line-max" {[$(P')$]}else{[$(P)$]})
 #let A=if mode=="line-max" {(39,32)}else{(53,5)}
 #let H=(53,39)
 #let M=(31,39)
 #if mode=="line" or mode=="line-max" {
  seg((27,44),(82,31));lab((83,28),[$d$]);seg(A,H);right-angle(H)
  dot(A,if mode=="line-max" {[$B$]}else{[$A$]},dy:-3)
  dot(H,if mode=="line-max" {[$A$]}else{[$H$]},dy:4)
 } else {
  seg(A,H);right-angle(H)
  dot(A,[$A$],dy:-3);dot(H,if mode=="point" {[$A'$]}else{[$H$]},dx:4,dy:3)
  dot(M,[$M$],dx:-3,dy:3)
  if mode=="max" {seg(A,M);seg(M,H)}
 }
]
// Two intersecting planes, one vertical projection and the perpendicular to their intersection.
#let angle-model(kind)=box(width:100mm,height:72mm)[
 #path((p(4,65),p(83,65),p(95,43),p(16,43)),close:true,fill:pale,stroke:edge)
 #let E=(26,57)
 #let H=(62,52)
 #let I=(62,15)
 #let K=(20,45)
 #if kind!="angle-planes" {
  path((p(12,40),p(26,68),p(76,23),p(62,1)),close:true,fill:pink,stroke:edge)
  lab((76,31),[$(Q)$])
 }
 #seg((12,29),(33,71))
 #lab((9,28),[$d$])
 #seg(E,I)
 #seg(I,H,dash:true)
 #seg(H,K,dash:true)
 #seg(I,K)
 #seg(E,H,dash:true)
 #right-angle(H)
 #dot(E,if kind=="angle-practice" {[$A$]}else if kind=="angle-planes" {[$B$]}else if kind=="angle-axis" {[$I$]}else{[$E$]},dx:-4,dy:2)
 #dot(I,if kind=="angle-practice" {[$B$]}else if kind=="angle-planes" {[$M$]}else if kind=="angle-axis" {[$A$]}else{[$I$]},dx:3,dy:-2)
 #dot(H,[$H$],dx:4,dy:2)
 #dot(K,if kind=="angle-planes" {[$C$]}else{[$K$]},dx:-4)
 #lab((81,61),if kind=="angle-planes" {[$(Q)$]}else{[$(P)$]})
 #lab((44,30),if kind=="angle-axis" {[$O x$]}else if kind=="angle-planes" {[$d$]}else{[$Delta$]},dx:-4)
]
#let section(kind)=box(width:102mm,height:64mm)[
 #move(dy:13mm,plane())
 #disk((55,31),27)
 #arc((55,31),27,7,back:true)
 #arc((55,31),27,7)
 // A horizontal section below the center; projected circle fits the sphere silhouette.
 #ellipse-at((55,48),21,5,fill:pink)
 #seg((55,31),(55,48),dash:true)
 #dot((55,31),[$I$],dx:3,dy:-4)
 #dot((55,48),[$H$],dx:0,dy:4)
 #right-angle((55,48))
 #lab((84,12),[$(S)$])
 #if kind=="sphere-section" {
  seg((55,31),(45,48),dash:true);seg((45,48),(55,48),dash:true);dot((45,48),[$A$],dy:4)
 } else if kind=="chord" {
  let A=(40,51.5);let B=(71,44.8);let E=(48,49.7)
  seg((31,53.5),(83,42.3));seg((55,31),E,dash:true);seg((55,48),E,dash:true)
  dot(A,[$A$],dy:4);dot(B,[$B$],dy:-4);dot(E,[$E$],dx:-2,dy:-4);lab((31,59),[$Delta$])
 } else {
  seg((36,50),(74,46));seg((55,31),(36,50),dash:true);seg((55,31),(74,46),dash:true)
  dot((36,50),[$M$],dy:4);dot((74,46),[$D$],dx:4)
 }
]
#let center-model()=box(width:100mm,height:85mm)[
 #path((p(4,64),p(72,64),p(94,35),p(26,35)),close:true,fill:pale,stroke:edge)
 #let A=(28,5)
 #let B=(91,79)
 #let E=(59.5,42)
 #let G=(66,49.6)
 #let I=(49,55)
 #let F=(28,61)
 #seg(A,F)
 #seg(F,G)
 #seg(A,G)
 #seg(G,B,dash:true)
 #seg(A,I)
 #seg(I,E)
 #seg(I,B,dash:true)
 #for (x,t,dx,dy) in ((A,[$A$],-3,-2),(B,[$B$],3,0),(E,[$E$],2,-3),(G,[$G$],3,0),(I,[$I$],-3,3),(F,[$F$],-3,2)) {dot(x,t,dx:dx,dy:dy)}
 #lab((22,44),[$(P)$])
]
#let inversion()=box(width:94mm,height:81mm)[
 #disk((46,32),26)
 #arc((46,21),23.6,5,back:true)
 #let I=(46,32)
 #let A=(77.2,73.6)
 #let F=(53.8,42.4)
 #let E=(61.6,52.8)
 #let M=(30.4,52.8)
 #let B=(-1,66.7556)
 #seg(I,A)
 #seg(I,M)
 #seg(M,A)
 #seg((7,63.2),F)
 #dot(I,[$I$],dx:-3,dy:-3)
 #dot(A,[$A$],dx:4)
 #dot(F,[$F$],dx:4,dy:-1)
 #dot(E,[$E$],dx:4)
 #dot(M,[$M$],dx:-4,dy:-1)
 #dot((7,63.2),[$B$],dx:-3,dy:4)
]
#let variation()=box(width:116mm,height:49mm)[
 #path((p(1,1),p(115,1),p(115,48),p(1,48)),close:true,stroke:edge)
 #path((p(1,1),p(115,1),p(115,10),p(1,10)),close:true,fill:pink,stroke:none)
 #seg((17,1),(17,48));#seg((1,10),(115,10));#seg((1,21),(115,21))
 #lab((9,5),[$t$]);#lab((9,15),[$f'(t)$]);#lab((9,34),[$f(t)$])
 #lab((24,5),[$0$]);#lab((65,5),[$3$]);#lab((106,5),[$3 sqrt(3)$])
 #lab((44,15),[$+$]);#lab((65,15),[$0$]);#lab((86,15),[$-$])
 #lab((24,42),[$0$]);#lab((65,27),[$54$]);#lab((106,42),[$0$])
 #seg((31,41),(58,29));#seg((72,29),(100,41))
 #path((p(56,29),p(58,29),p(57,31)),stroke:edge);#path((p(98,39),p(100,41),p(97,41)),stroke:edge)
]
#let diagram(name)=if name=="sphere" {sphere-point()}else if name=="circle" {sphere-point(plane-view:true)}else if name=="off-plane" {sphere-point(plane-view:true,above:true)}else if name=="sphere-origin" {sphere-point(origin:true)}else if name=="circles-apart" {circles()}else if name=="circles-meet" {circles(overlap:true)}else if name=="point-plane" {projection()}else if name=="plane-max" {projection(mode:"max")}else if name=="plane-line" {projection(mode:"line")}else if name=="line-max" {projection(mode:"line-max")}else if name in ("angle-example","angle-practice","angle-planes","angle-axis") {angle-model(name)}else if name in ("sphere-section","chord","circle-diameter") {section(name)}else if name=="sphere-center" {center-model()}else if name=="variation" {variation()}else if name=="inversion" {inversion()}
#let solution-figure(name)=block(width:100%,breakable:false,above:3mm,below:3mm,align(center,scale(x:85%,y:85%,reflow:true,diagram(name))))
