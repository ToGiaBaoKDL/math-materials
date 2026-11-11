#import "/templates/drawing.typ": path, label, arrow-line, figure-fill
#import "/templates/theme.typ": figure-style
#let red = rgb("#B00012")
#let edge = figure-style.edge-width + red
#let hidden = (paint: red, thickness: figure-style.edge-width, dash: "dashed")
#let guide = (paint: black, thickness: 0.45pt, dash: "dashed")
#let pt(p) = (p.at(0)*1mm,p.at(1)*1mm)
#let seg(..ps, dashed:false, color:red) = path(ps.pos().map(pt),stroke:if dashed { (paint:color, thickness:0.8pt,dash:"dashed") } else {0.8pt+color})
#let face(ps, shade:0) = path(ps.map(pt),stroke:none,close:true,fill:figure-fill((rgb("#FFDFE5"),rgb("#FFB1C1"),rgb("#FF91A4")).at(shade)))
#let lab(p,t,dx:0,dy:0) = label(pt(p),text(size:12pt,t),dx:dx*1mm,dy:dy*1mm,width:16mm)
#let dot(p) = place(top+left,dx:p.at(0)*1mm-0.6mm,dy:p.at(1)*1mm-0.6mm,circle(radius:0.6mm,fill:black,stroke:none))
#let arr(a,b,color:black) = arrow-line(pt(a),pt(b),color:color,thickness:0.55pt)
#let cube() = box(width:76mm,height:62mm)[
 #let A=(20,44);#let B=(65,44);#let C=(52,57);#let D=(7,57)
 #let Ap=(20,7);#let Bp=(65,7);#let Cp=(52,20);#let Dp=(7,20)
 #face((Ap,Bp,Cp,Dp)) #face((Dp,Cp,C,D),shade:1) #face((Cp,Bp,B,C),shade:2)
 #seg(A,Ap,dashed:true) #seg(A,B,dashed:true) #seg(A,D,dashed:true)
 #seg(D,Dp,Ap,Bp,B,C,D) #seg(Dp,Cp,Bp) #seg(Cp,C)
 #for (p,t,dx,dy) in ((A,[$A$],-3,-1),(B,[$B$],3,-1),(C,[$C$],1,4),(D,[$D$],-2,4),(Ap,[$A'$],0,-4),(Bp,[$B'$],2,-4),(Cp,[$C'$],3,2),(Dp,[$D'$],-3,-2)) {lab(p,t,dx:dx,dy:dy)}
]
#let prism() = box(width:84mm,height:71mm)[
 #let A=(8,49);#let B=(26,64);#let C=(65,49);#let Ap=(21,8);#let Bp=(39,23);#let Cp=(78,8);#let M=(32.5,43.5)
 #face((Ap,Bp,Cp)) #face((Ap,Bp,B,A),shade:1) #face((Bp,Cp,C,B),shade:2)
 #seg(A,C,dashed:true) #seg(A,Ap,Cp,C,B,A) #seg(Ap,Bp,Cp) #seg(Bp,B) #seg(A,M)
 #for (p,t,dx,dy) in ((A,[$A$],-3,1),(B,[$B$],0,4),(C,[$C$],3,2),(Ap,[$A'$],0,-4),(Bp,[$B'$],3,2),(Cp,[$C'$],2,-4),(M,[$M$],4,0)) {lab(p,t,dx:dx,dy:dy)}
]
#let pyramid(detail:false, angle:false) = box(width:84mm,height:68mm)[
 #let S=(29,6);#let A=(29,43);#let B=(7,61);#let C=(53,61);#let D=(75,43);#let O=(41,52)
 #face((S,B,C),shade:1) #face((S,C,D),shade:2)
 #seg(S,A,dashed:true) #seg(A,B,dashed:true) #seg(A,D,dashed:true) #seg(A,C,dashed:true) #seg(B,D,dashed:true)
 #seg(S,B,C,D,S,C)
 #if detail {
   // AO²=2, SA²=9: H is the perpendicular foot, SH/SO=9/11.
   let H=(S.at(0)+9/11*(O.at(0)-S.at(0)),S.at(1)+9/11*(O.at(1)-S.at(1)))
   seg(S,O,dashed:true);seg(A,H,dashed:true);lab(H,[$H$],dx:0,dy:-4);lab(O,[$O$],dx:2,dy:4)
 } else if angle {seg((29,39),(32,39),(32,43),color:black)}
 #for (p,t,dx,dy) in ((S,[$S$],0,-4),(A,[$A$],-3,-2),(B,[$B$],-3,3),(C,[$C$],1,4),(D,[$D$],3,0)) {lab(p,t,dx:dx,dy:dy)}
]
#let tank() = box(width:91mm,height:47mm)[
 #let A=(6,20);#let B=(34,20);#let C=(83,5);#let D=(55,5);#let E=(6,42);#let F=(34,42);#let G=(83,27);#let H=(55,27)
 #face((A,B,F,E),shade:1) #face((B,C,G,F),shade:2)
 #seg(E,H,G,dashed:true) #seg(H,D,dashed:true)
 #seg(A,B,C,D,A,E,F,G,C) #seg(B,F)
]
#let graph(kind) = {
 let xmin=if kind=="range" {-1.6}else{-3.5};let xmax=if kind=="range" {3.5}else{3.3}
 let ymin=if kind=="cubic" {-1.6}else if kind=="range" {-2.7}else{-3.5};let ymax=if ("cubic", "range").contains(kind) {3.8}else{4.5}
 let sx=11;let sy=if kind=="range" {7}else{9}
 let p(x,y)=((x - xmin)*sx+4,(ymax - y)*sy+4)
 box(width:((xmax - xmin)*sx+12)*1mm,height:((ymax - ymin)*sy+10)*1mm)[
 #arr(p(xmin,0),p(xmax,0)) #arr(p(0,ymin),p(0,ymax))
 #lab(p(xmax,0),[$x$],dx:3,dy:1) #lab(p(0,ymax),[$y$],dx:3,dy:0) #lab(p(0,0),[$O$],dx:-3,dy:3)
 #let trace(f,a,b,n:120)={path(range(n+1).map(i=>pt(p(a+(b - a)*i/n,f(a+(b - a)*i/n)))),stroke:1.25pt+red)}
 #let guides(x,y)={seg(p(x,0),p(x,y),p(0,y),dashed:true,color:black);dot(p(x,y))}
 #if kind=="range" {
   trace(x=>2-x*x,-1,2);path((pt(p(2,-2)),pt(p(3,3))),stroke:1.25pt+red)
   for (x,y) in ((-1,1),(2,-2),(3,3)) {guides(x,y);lab(p(x,0),[$#x$],dy:if x==2 {-4}else{4})}
   for y in (-2,1,2,3){lab(p(0,y),[$#y$],dx:if y==1 {3}else{-3},dy:if y==3 {-3}else{0})}
 } else if kind=="cubic" {
   trace(x=>-x*x*x+3*x+1,-2.08,2.08)
   for (x,y) in ((-2,3),(-1,-1),(1,3)){guides(x,y);lab(p(x,0),[$#x$],dy:if x == -1 {-4}else{4})}
   lab(p(2,0),[$2$],dx:2,dy:4);lab(p(0,3),[$3$],dx:-3,dy:-3);lab(p(0,-1),[$-1$],dx:3)
 } else {
   seg(p(-1,ymin),p(-1,ymax),color:black)
   seg(p(xmin,xmin+1),p(xmax,xmax+1),color:black)
   trace(x=>x+1+1/(x+1),-3.5,-1.32);trace(x=>x+1+1/(x+1),-0.76,3.2)
   guides(-2,-2);lab(p(-2,0),[$-2$],dy:4);lab(p(-1,0),[$-1$],dx:-2,dy:-3)
   for y in (-2,1,2){lab(p(0,y),[$#y$],dx:3,dy:if y==2 {-3}else{0})}
 }
 ]
}
#let laser(detail:false) = {
 // Orthographic-style affine projection, common to all points and walls.
 let p(x,y,z)=(37-1.75*x+4*y,55+1.65*x - 5*z - if detail {0}else{7})
 let O=p(0,0,0);let A=p(0,6,5);let B=p(5,3.5,0);let C=p(12,0,7);let Cp=p(12,0,0);let K=p(12,0,-7);let S=p(-2,7,7)
 box(width:80mm,height:if detail {116mm}else{77mm})[
 #face((p(0,0,0),p(14,0,0),p(14,8,0),p(0,8,0)))
 #face((p(0,0,0),p(14,0,0),p(14,0,7.2),p(0,0,7.2)),shade:1)
 #face((p(0,0,0),p(0,8,0),p(0,8,7.2),p(0,0,7.2)),shade:2)
 #arr(O,p(15,0,0)) #arr(O,p(0,9,0)) #arr(O,p(0,0,9))
 #lab(p(15,0,0),[$x$],dx:-2,dy:3) #lab(p(0,9,0),[$y$],dy:3) #lab(p(0,0,9),[$z$],dx:3) #lab(O,[$O$],dx:-3,dy:-2)
 #seg(S,A,B,C)
 // Source arrows run beside the rays, not into the marked endpoints.
 #let ray-arrow(U,V,offset)={
  let at(t)=(U.at(0)+(V.at(0)-U.at(0))*t+offset.at(0),U.at(1)+(V.at(1)-U.at(1))*t+offset.at(1))
  arrow-line(pt(at(0.30)),pt(at(0.64)),color:red,thickness:0.8pt,tip:2mm)
 }
 #ray-arrow(A,B,(-3,-1)) #ray-arrow(B,C,(3,-5))
 #for (P,t,dx,dy) in ((S,[$S$],3,0),(A,[$A$],3,0),(B,[$B$],2,4),(C,[$C$],-3,-1)) {dot(P);lab(P,t,dx:dx,dy:dy)}
 #if detail {
  seg(C,K);seg(B,K);seg(Cp,p(0,6,0));seg(A,p(0,6,0),dashed:true)
  // Equal lengths CC′=C′K and projected angle arcs from the same rays.
  for z in (3.5,-3.5) {
   let T=p(12,0,z)
   seg((T.at(0)-1,T.at(1)+0.6),(T.at(0)+1,T.at(1)-0.6),color:black)
   seg((T.at(0)-1,T.at(1)+1.6),(T.at(0)+1,T.at(1)+0.4),color:black)
  }
  let arc(U,V)={
   let a=calc.atan2(U.at(1)-B.at(1),U.at(0)-B.at(0));let b=calc.atan2(V.at(1)-B.at(1),V.at(0)-B.at(0))
   let d=b - a
   if d>180deg {d-=360deg};if d< -180deg {d+=360deg}
   path(range(21).map(i=>pt((B.at(0)+3*calc.cos(a+d*i/20),B.at(1)+3*calc.sin(a+d*i/20)))),stroke:0.5pt+black)
  }
  arc(A,p(0,6,0));arc(C,Cp);arc(Cp,K)
  lab(Cp,[$C'$],dx:-4);lab(K,[$K$],dy:4);dot(K)
  lab(B,[$alpha_1$],dx:5,dy:-4);lab(B,[$alpha_2$],dx:-6,dy:-3);lab(B,[$alpha_3$],dx:-5,dy:5)
 }
 ]
}
#let park(detail:false) = {
 let p(x,y)=(24+1.6*x,54-1.6*y)
 box(width:82mm,height:112mm)[
 #path((pt(p(-10,-30)),pt(p(30,-30)),pt(p(30,30)),pt(p(-10,30))),close:true,stroke:edge)
 #place(top+left,dx:p(10,30).at(0)*1mm,dy:p(10,30).at(1)*1mm,circle(radius:16mm,stroke:edge,fill:figure-fill(rgb("#FF91A4"))))
 #let points=range(81).map(i=>pt(p(-10+i/4,-0.3*calc.pow(-10+i/4,2))))
 #path(points,close:true,stroke:edge,fill:figure-fill(rgb("#FF91A4")))
 #seg(p(0,0),p(0,-30),color:black)
 #for (x,y,t,dx,dy) in ((-10,-30,[$A$],-3,3),(10,-30,[$B$],3,3),(0,-30,[$H$],3,3),(0,0,[$O$],-3,-3)){dot(p(x,y));lab(p(x,y),t,dx:dx,dy:dy)}
 #if detail {
  arr(p(-12,0),p(33,0));arr(p(0,-32),p(0,33));lab(p(33,0),[$x$],dy:-3);lab(p(0,33),[$y$],dx:3)
  seg(p(0,20),p(20,20),p(20,0),dashed:true,color:black);seg(p(10,0),p(10,-30),dashed:true,color:black)
  dot(p(20,20));lab(p(20,20),[$I$],dx:3,dy:-2)
  for x in (-10,10,20,30){lab(p(x,0),[$#x$],dx:if x == -10 {-4}else if (10,30).contains(x) {3}else{0},dy:4)}
  for y in (-30,-20,-10,10,20,30){lab(p(0,y),[$#y$],dx:if (-10,-20).contains(y) {4.5}else{-5.5},dy:if (-30,30).contains(y) {-3}else{0})}
 }
 ]
}
