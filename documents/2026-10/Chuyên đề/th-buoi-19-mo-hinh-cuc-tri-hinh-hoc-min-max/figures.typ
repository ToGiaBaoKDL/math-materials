#import "/templates/drawing.typ": path, label, figure-fill
#let red=rgb("#B00012")
#let pink=figure-fill(rgb("#F6B1B8"))
#let pale=figure-fill(rgb("#FADADD"))
#let edge=0.8pt+red
#let hidden=(paint:red,thickness:0.8pt,dash:(2.5pt,2pt))
#let p(x,y)=(x*1mm,y*1mm)
#let seg(a,b,dash:false)=path((p(..a),p(..b)),stroke:if dash {hidden}else{edge})
#let lab(a,t,dx:0,dy:0)=context {
 let body=box(text(size:11pt,top-edge:"bounds",bottom-edge:"bounds",t))
 let size=measure(body)
 place(top+left,dx:(a.at(0)+dx)*1mm-size.width/2,dy:(a.at(1)+dy)*1mm-size.height/2,body)
}
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
#let planar-circle(above:false)=box(width:116mm,height:66mm)[
 // Open plane outline and upright circle follow the source schematic.
 #path((p(14,34),p(0,61),p(98,61),p(115,34)),stroke:edge)
 #disk((52,32),21)
 #seg((31,32),(94,32))
 #dot((52,32),[$I$],dy:5)
 #lab((23,32),[$M_(max)$])
 #lab((80,37),[$M_(min)$])
 #lab((41,27),[$R$])
 #dot((43,13.03),[$M$],dx:-2,dy:-5)
 #seg((64,17),(72,13))
 #lab((77,12),[$(C)$])
 #lab((16,57),[$(P)$])
 #if above {
  seg((94,32),(94,3));dot((94,3),[$A$],dx:-4)
  lab((98,36),[$A'$])
 } else {lab((98,35),[$A$])}
]
#let circles(overlap:false)=box(width:148mm,height:if overlap {61mm}else{72mm})[
 #let c1=if overlap {(47,31)}else{(39,33)}
 #let c2=if overlap {(79,31)}else{(104,33)}
 #let r2=if overlap {18}else{24}
 #let cy=c1.at(1)
 #if not overlap {path((p(5,5),p(0,67),p(136,67),p(147,5)),stroke:edge);lab((12,62),[$(P)$])}
 #disk(c1,23)
 #disk(c2,r2,fill:none)
 #seg((c1.at(0)-23,cy),(c2.at(0)+r2,cy))
 #dot(c1,[$I_1$],dy:5) #dot(c2,[$I_2$],dy:5)
 #lab((c1.at(0)-30,cy),[$M_(max)$])
 #lab((c2.at(0)+r2+7,cy),[$N_(max)$])
 #if not overlap {
  lab((54,27),[$M_(min)$]);lab((89,27),[$N_(min)$])
  lab((28,27),[$R_1$]);lab((115,27),[$R_2$])
  seg((52,14),(59,9));lab((66,7),[$(C_1)$])
  seg((116,12),(123,7));lab((130,5),[$(C_2)$])
  dot((17.39,40.87),[$M$],dx:-4,dy:5)
  dot((126.55,24.79),[$N$],dx:5,dy:-3)
 }
]
#let projection(mode:"point")=box(width:99mm,height:54mm)[
 #if mode=="line" {
  path((p(21,24),p(4,49),p(80,49),p(97,24)),stroke:edge)
  seg((34,43),(83,25))
  seg((42,8),(59,33.82))
  path((p(56.8,30.48),p(60.56,29.1),p(62.76,32.44)),stroke:edge)
  dot((42,8),[$A$],dx:-4,dy:-1)
  dot((59,33.82),[$H$],dy:6)
  lab((81,21),[$d$]);lab((13,45),[$(P)$])
 } else [
 #plane(name:if mode=="line-max" {[$(P')$]}else{[$(P)$]})
 #let A=if mode=="line-max" {(34,30)}else{(53,5)}
 #let H=(53,39)
 #let M=(31,39)
 #if mode=="line" or mode=="line-max" {
  seg((27,39),(84,39));lab((86,36),[$d$]);seg(A,H)
  if mode=="line-max" {path((p(49.2,37.2),p(53.2,37.2),p(57,39)),stroke:edge)} else {right-angle(H)}
  dot(A,if mode=="line-max" {[$B$]}else{[$A$]},dy:-3)
  dot(H,if mode=="line-max" {[$A$]}else{[$H$]},dy:4)
 } else {
  seg(A,H);right-angle(H)
  dot(A,[$A$],dy:-3);dot(H,if mode=="point" {[$A'$]}else{[$H$]},dx:4,dy:3)
  dot(M,[$M$],dx:-3,dy:3)
  if mode=="max" {seg(A,M);seg(M,H)}
 }
]
]
// Two intersecting planes, one vertical projection and the perpendicular to their intersection.
#let source-angle()=box(width:99mm,height:76mm)[
 #let q(x,y)=p(3+x*0.32,3+y*0.32)
 #path((q(38,146),q(234,146),q(278,214),q(77,214)),close:true,fill:pale,stroke:edge)
 #path((q(38,146),q(165,7),q(204,78),q(77,214)),close:true,fill:pink,stroke:edge)
 #path((q(7,88),q(77,214)),stroke:edge)
 #path((q(68,198),q(109,98)),stroke:edge)
 #path((q(56,177),q(142,48)),stroke:edge)
 #path((q(56,177),q(109,98)),stroke:edge)
 #path((q(109,98),q(109,168),q(56,177)),stroke:hidden)
 #path((q(68,198),q(109,168)),stroke:hidden)
 #for (x,y,t,dx,dy) in ((68,198,[$E$],-4,1),(56,177,[$K$],-4,0),(109,168,[$H$],4,2),(109,98,[$I$],4,0),(7,88,[$d$],2,-3),(142,48,[$Delta$],4,0),(185,81,[$(Q)$],0,0),(244,200,[$(P)$],0,0)) {
  lab((3+x*0.32,3+y*0.32),t,dx:dx,dy:dy)
 }
]
#let practice-angle()=box(width:104mm,height:94mm)[
 #let q(x,y)=p(5+(x - 270)*0.29,5+(y - 460)*0.29)
 #path((q(318,592),q(578,592),q(531,703),q(271,703)),close:true,fill:pale,stroke:edge)
 #path((q(388,460),q(503,592),q(456,703),q(342,572)),close:true,fill:pink,stroke:edge)
 #path((q(318,592),q(503,592)),stroke:hidden)
 #path((q(412,520),q(471,668)),stroke:edge)
 #path((q(471,668),q(486,703)),stroke:hidden)
 #path((q(486,703),q(501,741)),stroke:edge)
 #path((q(429,563),q(492,620)),stroke:edge)
 #path((q(429,563),q(429,620),q(492,620)),stroke:hidden)
 #path((q(429,620),q(471,668)),stroke:hidden)
 #for (x,y,t,dx,dy) in ((429,563,[$B$],4,-3),(471,668,[$A$],5,0),(492,620,[$K$],5,0),(429,620,[$H$],-5,0),(404,520,[$Delta$],0,0),(455,678,[$d$],0,0),(390,480,[$(Q)$],0,0),(287,690,[$(P)$],0,0)) {
  lab((5+(x - 270)*0.29,5+(y - 460)*0.29),t,dx:dx,dy:dy)
 }
 #path((q(487,631),q(478,623),q(483,613)),stroke:edge)
]
#let angle-model(kind)=box(width:108mm,height:67mm)[
 // Affine projection of E=(0,0,0), K=(1,0,0), H=(1,1,0), I=(1,1,2).
 #let E=(25,49)
 #let K=(46,42)
 #let H=(66,53)
 #let I=(66,12)
 #path((p(7,53),p(62,65),p(101,43),p(46,31)),close:true,fill:pale,stroke:edge)
 #if kind!="angle-planes" {
  path((p(14.5,52.5),p(60.7,37.1),p(101.7,0.1),p(55.5,15.5)),close:true,fill:pink,stroke:edge)
  lab((91,20),[$(Q)$])
 }
 #seg((14.5,52.5),(79.6,30.8))
 #lab((83,30),if kind=="angle-planes" {[$Delta$]}else{[$d$]})
 #seg(E,I)
 #seg(I,H,dash:true)
 #seg(H,K,dash:true)
 #seg(I,K)
 #seg(E,H,dash:true)
 #path((p(66,49),p(62,46.8),p(62,50.8)),stroke:edge)
 #path((p(42.8,43.07),p(46,44.83),p(49.2,43.76)),stroke:edge)
 #dot(E,if kind=="angle-practice" {[$A$]}else if kind=="angle-planes" {[$B$]}else if kind=="angle-axis" {[$I$]}else{[$E$]},dx:-4,dy:4)
 #dot(I,if kind=="angle-practice" {[$B$]}else if kind=="angle-planes" {[$M$]}else if kind=="angle-axis" {[$A$]}else{[$I$]},dx:-3,dy:-4)
 #dot(H,[$H$],dx:4,dy:3)
 #dot(K,if kind=="angle-planes" {[$C$]}else{[$K$]},dx:-5,dy:-3)
 #lab((85,55),if kind=="angle-planes" {[$(Q)$]}else{[$(P)$]})
 #lab((37,27),if kind=="angle-axis" {[$O x$]}else if kind=="angle-planes" {[$d$]}else{[$Delta$]})
]
#let section(kind)=box(width:102mm,height:64mm)[
 #if kind!="circle-diameter" {move(dy:13mm,plane())}
 #disk((55,31),27)
 #arc((55,31),27,7,back:true)
 #arc((55,31),27,7)
 // A horizontal section below the center; projected circle fits the sphere silhouette.
 #ellipse-at((55,48),21,5,fill:pink)
 #seg((55,31),(55,48),dash:true)
 #dot((55,31),[$I$],dx:3,dy:-4)
 #dot((55,48),[$H$],dx:5,dy:-4)
 #right-angle((55,48))
 #lab((84,12),[$(S)$])
 #if kind=="sphere-section" {
  seg((55,31),(34,48),dash:true);seg((34,48),(55,48),dash:true);dot((34,48),[$A$],dx:-4,dy:4)
 } else if kind=="chord" {
  let dx=21*calc.sqrt(1-4/25)
  let A=(55-dx,50);let B=(55+dx,50);let E=(55,50)
  seg((29,50),(83,50));seg((55,31),E,dash:true);seg((55,48),E,dash:true)
  dot(A,[$A$],dy:4);dot(B,[$B$],dy:-4);dot(E,[$E$],dx:4,dy:5);lab((31,59),[$Delta$])
 } else {
  seg((34,48),(76,48));seg((55,31),(34,48),dash:true);seg((55,31),(76,48),dash:true)
  dot((34,48),[$M$],dx:-4,dy:4);dot((76,48),[$D$],dx:4,dy:4)
 }
]
#let center-model()=box(width:122mm,height:91mm)[
 #let q(x,y)=p(4+(x - 34)*0.16,4+(y - 26)*0.16)
 #path((q(34,435),q(517,435),q(702,249),q(220,249)),close:true,fill:pale,stroke:edge)
 #let A=(201,26)
 #let B=(683,509)
 #let E=(442,267)
 #let G=(485,310)
 #let I=(367,342)
 #let F=(201,388)
 #for (a,b) in ((A,F),(F,G),(A,G),(A,I),(I,E)) {path((q(..a),q(..b)),stroke:edge)}
 #for (a,b) in ((G,B),(I,B)) {path((q(..a),q(..b)),stroke:hidden)}
 #place(top+left,curve(curve.move(q(258,249)),curve.cubic(q(258,283),q(222,300),q(193,276)),stroke:edge))
 #lab((4+(227 - 34)*0.16,4+(268 - 26)*0.16),[$(P)$])
 #for (a,t,dx,dy) in ((A,[$A$],-3,0),(B,[$B$],-2,4),(E,[$E$],1,-4),(G,[$G$],3,-3),(I,[$I$],-2,4),(F,[$F$],-4,0)) {
  let pt=q(..a)
  dot((pt.at(0)/1mm,pt.at(1)/1mm),t,dx:dx,dy:dy)
 }
]
#let inversion()=box(width:67mm,height:85mm)[
 #let q(x,y)=(4+(x - 93)*0.17,4+(y - 20)*0.17)
 #let pt(x,y)=p(..q(x,y))
 #place(top+left,dx:4mm,dy:4mm,ellipse(width:52.53mm,height:52.36mm,stroke:edge,fill:pale))
 #let ring=(q(247,99))
 #path(range(0,81).map(i=>{let a=i*360deg/80;p(ring.at(0)+22.61*calc.cos(a),ring.at(1)+3.4*calc.sin(a))}),close:true,stroke:hidden)
 #let I=q(247,174)
 #let F=q(287,234)
 #let E=q(333,303)
 #let M=q(210,324)
 #let A=q(412,422)
 #let B=q(116,437)
 #seg(I,A)
 #seg(I,M)
 #seg(M,A)
 #seg(B,F)
 #for (a,t,dx,dy) in ((I,[$I$],0,-4),(F,[$F$],4,-3),(E,[$E$],5,0),(M,[$M$],1,5),(A,[$A$],3,-3),(B,[$B$],3,4)) {dot(a,t,dx:dx,dy:dy)}
]
#let variation()=box(width:116mm,height:49mm)[
 #path((p(1,1),p(115,1),p(115,10),p(1,10)),close:true,fill:pink,stroke:none)
 #path((p(1,1),p(115,1),p(115,48),p(1,48)),close:true,stroke:edge)
 #seg((17,1),(17,48));#seg((1,10),(115,10));#seg((1,21),(115,21))
 #lab((9,5),[$t$]);#lab((9,15),[$f'(t)$]);#lab((9,34),[$f(t)$])
 #lab((24,5),[$0$]);#lab((65,5),[$3$]);#lab((106,5),[$3 sqrt(3)$])
 #lab((44,15),[$+$]);#lab((65,15),[$0$]);#lab((86,15),[$-$])
 #lab((24,42),[$0$]);#lab((65,27),[$54$]);#lab((106,42),[$0$])
 #seg((31,41),(58,29));#seg((72,29),(100,41))
 #path((p(56,29),p(58,29),p(57,31)),stroke:edge);#path((p(98,39),p(100,41),p(97,41)),stroke:edge)
]
#let origin-sphere()=box(width:80mm,height:55mm)[
 #disk((39,27),21)
 #arc((39,27),21,6,back:true)
 #arc((39,27),21,6)
 #seg((18,27),(60,27))
 #dot((39,27),[$I$],dy:5)
 #dot((18,27),[$M_(max)$],dx:-4,dy:6)
 #dot((60,27),[$O$],dx:4,dy:4)
 #lab((56,5),[$(S)$])
 #lab((48,24),[$R$])
]
#let line-max-source()=box(width:112mm,height:42mm)[
 #path((p(25,8),p(5,38),p(108,38)),stroke:edge)
 #path((p(5,38),p(7.5,34.25)),stroke:edge)
 #place(top+left,curve(curve.move(p(16,38)),curve.cubic(p(16,34),p(13.5,30),p(11,29)),stroke:edge))
 #lab((11,35),[$P'$])
 #let A=(52,22)
 #let B=(50,8)
 #seg((18,26.86),(96,15.71))
 #seg(A,B)
 #path((p(49.23,22.40),p(48.83,19.63),p(51.60,19.23)),stroke:edge)
 #dot(A,[$A$],dx:4,dy:4)
 #dot(B,[$B$],dx:2,dy:-4)
 #lab((81,14),[$d$])
]
#let axis-source()=box(width:166mm,height:76mm)[
 #let q(x,y)=p(3+(x - 58)*0.18,5+(y - 530)*0.18)
 #let line(a,b,dash:false)=path((q(..a),q(..b)),stroke:if dash {hidden}else{edge})
 #let tag(x,y,t,dx:0,dy:0)=lab((3+(x - 58)*0.18,5+(y - 530)*0.18),t,dx:dx,dy:dy)
 #path((q(58,870),q(538,857),q(680,720),q(200,733)),close:true,fill:pale,stroke:edge)
 #path((q(321,730),q(559,530),q(641,661),q(404,859)),close:true,fill:pink,stroke:edge)
 #line((200,733),(680,720),dash:true)
 #place(top+left,curve(curve.move(q(165,867)),curve.cubic(q(165,840),q(146,812),q(132,799)),stroke:edge))
 #line((321,730),(404,859))
 #line((349,862),(464,711));#line((464,711),(581,584))
 #line((372,811),(569,762))
 #line((372,811),(430,688),dash:true)
 #line((464,711),(464,788),dash:true)
 #line((402,748),(464,711))
 #line((402,748),(464,788),dash:true)
 #line((372,811),(464,788))
 #line((372,811),(372,669))
 #path((q(366,688),q(372,669),q(378,688)),stroke:edge)
 #path((q(493.2,669.6),q(510,661),q(502.8,678.4)),stroke:edge)
 #path((q(452,788),q(452,776),q(464,776)),stroke:edge)
 #path((q(380,800),q(390,809),q(382,818)),stroke:edge)
 #place(top+left,curve(curve.move(q(414,800)),curve.cubic(q(410,787),q(404,780),q(398,777)),stroke:edge))
 #for (x,y,t,dx,dy) in ((372,811,[$I$],-3,4),(464,711,[$A$],2,-5),(464,788,[$H$],-3,5),(402,748,[$K$],-4,-2),(552,625,[$O x$],3,0),(607,666,[$(Q)$],0,0),(127,844,[$(P)$],0,0),(319,772,[$a$],-2,0),(589,762,[$d'$],0,0),(345,650,[$arrow(n)_P$],-2,0),(482,664,[$arrow(i)$],0,0),(426,775,[$alpha$],0,0)) {tag(x,y,t,dx:dx,dy:dy)}
 #for (x,y) in ((372,811),(464,711),(464,788),(402,748),(823,790),(903,640),(900,752),(852,690)) {
  let pt=q(x,y)
  place(top+left,dx:pt.at(0)-0.5mm,dy:pt.at(1)-0.5mm,circle(radius:0.5mm,fill:red,stroke:none))
 }
 // Separate right-triangle construction from the source.
 #line((823,790),(903,640));#line((903,640),(900,752));#line((900,752),(823,790))
 #line((823,790),(852,690));#line((852,690),(903,640));#line((852,690),(900,752),dash:true)
 #path((q(846,709),q(856,718),q(864,705)),stroke:edge)
 #path((q(889,757),q(889,745),q(900,740)),stroke:edge)
 #for (x,y,t,dx,dy) in ((823,790,[$I$],-2,5),(903,640,[$A$],1,-5),(900,752,[$H$],5,3),(852,690,[$K$],-5,0)) {tag(x,y,t,dx:dx,dy:dy)}
]
#let section-source()=box(width:119mm,height:85mm)[
 // Source: sphere with an equator and a lower section; A is inside the section.
 #let c=(77,42)
 #let r=39
 #disk(c,r)
 #arc(c,r,9,back:true)
 #arc(c,r,9)
 #seg((38,42),(116,42),dash:true)
 #let h=(77,64)
 #let rx=calc.sqrt(r*r - 22*22)
 #arc(h,rx,6,back:true)
 #arc(h,rx,6)
 #seg(c,h,dash:true)
 #seg(c,(59,64),dash:true)
 #seg((59,64),h,dash:true)
 #lab(c,[$I$],dx:-2,dy:-3)
 #context { set text(size:14pt); lab(h,text(size:14pt,[$H$]),dx:2,dy:5) }
 #lab((59,64),text(size:14pt,[$A$]),dx:-2,dy:5)
 // Only the visible corner of P appears outside the sphere in the source.
 #seg((3,71),(35,59))
 #seg((3,71),(48,70))
 #place(top+left,curve(curve.move(p(27,70.47)),curve.cubic(p(28,67),p(26,64),p(24,63.12)),stroke:edge))
 #lab((23,67),[$(P)$])
]
#let chord-source()=box(width:118mm,height:80mm)[
 #let q(x,y)=p(3+x*0.31,3+y*0.31)
 #let line(a,b,dash:false)=path((q(..a),q(..b)),stroke:if dash {hidden}else{edge})
 #path((q(5,221),q(305,224),q(346,132),q(48,132)),close:true,fill:pale,stroke:edge)
 #place(top+left,dx:q(90,9).at(0),dy:q(90,9).at(1),circle(radius:31mm,fill:pale,stroke:none))
 // Visible silhouette ends at the section; the lower spherical cap is hidden by P.
 #path(range(0,101).map(i=>{let a=-39deg+i*258deg/100;q(190+100*calc.cos(a),109-100*calc.sin(a))}),stroke:edge)
 #path(range(0,41).map(i=>{let a=39deg+i*102deg/40;q(190+100*calc.cos(a),109+100*calc.sin(a))}),stroke:hidden)
 #line((48,132),(346,132),dash:true)
 #let c=(3+190*0.31,3+166*0.31)
 #arc(c,80*0.31,17*0.31,back:true)
 #arc(c,80*0.31,17*0.31)
 #line((190,109),(190,183),dash:true)
 #line((190,109),(270,166),dash:true)
 #line((190,166),(270,166))
 #line((190,166),(242,151))
 #line((128,215),(250,145))
 #line((190,183),(190,166))
 #path((q(190,173),q(197,173),q(197,166)),stroke:edge)
 #line((239,45),(296,35))
 #line((76,151),(140,163))
 #for (x,y,t,dx,dy) in ((190,109,[$I$],-3,-3),(190,166,[$H$],-4,-1),(190,183,[$A$],0,4),(242,151,[$B$],2,3),(216,164,[$E$],1,4),(228,120,[$R$],1,0),(290,26,[$(S)$],0,0),(65,151,[$(C)$],0,0),(123,213,[$Delta$],-2,2),(24,211,[$(P)$],0,0)) {
  lab((3+x*0.31,3+y*0.31),t,dx:dx,dy:dy)
 }
]
#let diagram(name)=if name=="sphere" {sphere-point()}else if name=="circle" {planar-circle()}else if name=="off-plane" {planar-circle(above:true)}else if name=="sphere-origin" {sphere-point(origin:true)}else if name=="circles-apart" {circles()}else if name=="circles-meet" {circles(overlap:true)}else if name=="point-plane" {projection()}else if name=="plane-max" {projection(mode:"max")}else if name=="plane-line" {projection(mode:"line")}else if name=="line-max" {line-max-source()}else if name=="angle-example" {source-angle()}else if name=="angle-practice" {practice-angle()}else if name=="angle-axis" {axis-source()}else if name=="angle-planes" {angle-model(name)}else if name=="sphere-section" {section-source()}else if name=="chord" {chord-source()}else if name=="circle-diameter" {section(name)}else if name=="sphere-center" {center-model()}else if name=="variation" {variation()}else if name=="inversion" {inversion()}
#let solution-figure(name)=block(width:100%,breakable:false,above:2mm,below:2mm,align(center,scale(x:if name=="sphere-origin" {95%}else if name=="line-max" {90%}else if name=="angle-axis" {100%}else if name=="sphere-section" {58%}else if name=="inversion" {82.5%}else{75%},y:if name=="sphere-origin" {95%}else if name=="line-max" {90%}else if name=="angle-axis" {100%}else if name=="sphere-section" {58%}else if name=="inversion" {82.5%}else{75%},reflow:true,diagram(name))))
