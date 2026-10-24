#import "/templates/theme.typ": exam-palette as palette
#import "/templates/drawing.typ": path, label, smooth
#import "/templates/exam.typ": exam-table
#let blue=palette.geometry-blue
#let orange=palette.geometry-orange
#let edge=1pt+blue
#let hidden=(paint:blue,thickness:1pt,dash:"dashed")
#let dot(p)=place(top+left,dx:p.at(0)-0.5mm,dy:p.at(1)-0.5mm,circle(radius:0.5mm,fill:blue,stroke:none))
#let tag(p,t,dx:0mm,dy:0mm)=label(p,box(fill:white,inset:0.2mm,t),dx:dx,dy:dy)
#let sign-table()=table(columns:(14mm,)*10,align:center+horizon,rows:9mm,inset:4pt,stroke:0.6pt+palette.primary,
 fill:(x,y)=>if x==0 {palette.primary.lighten(85%)} else {none},
 [$x$],[$-infinity$],[$-1$],[],[$0$],[],[$1$],[],[$2$],[$+infinity$],
 [$f'(x)$],[$+$],[$0$],[$-$],[$0$],[$+$],[$parallel$],[$-$],[$0$],[$-$])
#let box-net()=block(width:105mm,height:44mm)[
 #let edge=1pt+rgb("#00478F")
 #let hidden=(paint:rgb("#00478F"),thickness:1pt,dash:"dashed")
 #let p(x,y)=(4mm+x*8mm,4mm+y*8mm)
 #for (x,y) in ((0,0),(3,0),(0,3),(3,3)) {path((p(x,y),p(x+1,y),p(x+1,y+1),p(x,y+1)),close:true,stroke:edge,fill:rgb("#F59E0B"))}
 #path((p(1,0),p(3,0),p(3,1),p(4,1),p(4,3),p(3,3),p(3,4),p(1,4),p(1,3),p(0,3),p(0,1),p(1,1)),close:true,stroke:edge,fill:rgb("#24B5EF"))
 #path((p(1,1),p(3,1),p(3,3),p(1,3)),close:true,stroke:hidden)
 #label((20mm,40mm),[25 cm],width:15mm)
 #place(top+left,dx:46mm,dy:19mm,[$arrow.r$])
 #let a=(62mm,28mm); #let b=(88mm,28mm); #let c=(99mm,23mm); #let d=(73mm,23mm)
 #let up(p)=(p.at(0),p.at(1)-10mm)
 #path((a,b,c,d),close:true,fill:rgb("#24B5EF"),stroke:hidden)
 #path((a,b,up(b),up(a)),close:true,fill:rgb("#008BD2"),stroke:edge)
 #path((b,c,up(c),up(b)),close:true,fill:rgb("#0070B8"),stroke:edge)
 #path((up(a),up(d),up(c)),stroke:edge)
 #path((a,d,c),stroke:hidden)
 #path((d,up(d)),stroke:hidden)
]
#let factory()=block(width:94mm,height:72mm)[
 #let ink=rgb("#163F51")
 #let stroke=0.9pt+ink
 #let dashed=(paint:ink,thickness:0.8pt,dash:"dashed")
 #let p(x,y,z)=(9mm+5.8mm*x+8.6mm*y,39mm+2.6mm*x - 3.2mm*y - 7mm*z)
 #let a=p(1.6,2.3,4); #let h=p(1.6,2.3,0)
 #let m=p(2.9,3,0); #let b=p(2.9,3,-3.5)
 #path((m,b),stroke:stroke)
 #path((p(0,0,-0.35),p(5.5,0,-0.35),p(5.5,5,-0.35),p(5.5,5,0),p(5.5,0,0),p(0,0,0)),close:true,stroke:stroke,fill:rgb("#D99A00"))
 #path((p(0,0,0),p(5.5,0,0),p(5.5,5,0),p(0,5,0)),close:true,stroke:stroke,fill:rgb("#F5C842"))
 #let cuboid(x,y,w,d,height)={
  let a=p(x,y,0); let b=p(x+w,y,0); let c=p(x+w,y+d,0)
  let aa=p(x,y,height); let bb=p(x+w,y,height); let cc=p(x+w,y+d,height); let dd=p(x,y+d,height)
  path((a,b,bb,aa),close:true,stroke:stroke,fill:rgb("#009A9E"))
  path((b,c,cc,bb),close:true,stroke:stroke,fill:rgb("#00747C"))
  path((aa,bb,cc,dd),close:true,stroke:stroke,fill:rgb("#20C4B0"))
 }
 #cuboid(0.6,0.35,1.1,0.8,0.65)
 #cuboid(0.15,2.05,0.65,0.65,0.6)
 #cuboid(2.4,4.2,0.9,0.75,1.5)
 #cuboid(3.7,4.15,1.2,0.7,0.85)
 // MB meets the lower front edge at x=5.5 in the projected floor.
 #let floor-exit=p(5.5,(m.at(0)-9mm-5.8mm*5.5)/8.6mm,-0.35)
 #path((m,floor-exit),stroke:dashed)
 #path((a,h,m),stroke:dashed)
 #path(((h.at(0),h.at(1)-2mm),(h.at(0)+2mm,h.at(1)-2mm),(h.at(0)+2mm,h.at(1))),stroke:0.6pt+ink)
 #path((a,m),stroke:stroke)
 #for point in (m,b) {
  place(top+left,dx:point.at(0)-3mm,dy:point.at(1)-0.5mm,ellipse(width:6mm,height:2.5mm,fill:rgb("#B82862"),stroke:stroke))
  place(top+left,dx:point.at(0)-3mm,dy:point.at(1)-1.5mm,ellipse(width:6mm,height:2.5mm,fill:rgb("#F04482"),stroke:stroke))
 }
 #path(((a.at(0)-4mm,a.at(1)),(a.at(0)+4mm,a.at(1)),(a.at(0)+4mm,a.at(1)-1.2mm),(a.at(0)-4mm,a.at(1)-1.2mm)),close:true,stroke:stroke)
 #for x in range(5) {path(((a.at(0)-3mm+x*1.5mm,a.at(1)-1.2mm),(a.at(0)-3mm+x*1.5mm,a.at(1)-3mm)),stroke:0.6pt+ink)}
 #for (point,t,dx,dy) in ((a,[$A$],6mm,1mm),(h,[$H$],-3mm,3mm),(m,[$M$],6mm,0mm),(b,[$B$],6mm,0mm)) {
  place(top+left,dx:point.at(0)-0.4mm,dy:point.at(1)-0.4mm,circle(radius:0.4mm,fill:ink,stroke:none))
  tag(point,t,dx:dx,dy:dy)
 }
 #label((76mm,52mm),[$(O x y)$],width:17mm)
]
#let room()=block(width:78mm,height:62mm)[
 #let a=(9mm,52mm); #let b=(27mm,40mm); #let c=(68mm,40mm); #let d=(50mm,52mm)
 #let up(p)=(p.at(0),p.at(1)-35mm)
 #path((a,b,c,d),close:true,stroke:none,fill:blue.lighten(40%))
 #path((a,b,c),stroke:hidden); #path((b,up(b)),stroke:hidden)
 #path((a,d,c,up(c),up(b),up(a)),close:true,stroke:edge)
 #path((up(a),up(d),up(c)),stroke:edge); #path((d,up(d)),stroke:edge)
 #path((up(a),b),stroke:(paint:orange,thickness:1.2pt,dash:"dashed"))
 #path((d,up(c),c),stroke:1.2pt+orange)
 #for (p,t,dx,dy) in ((a,[$A$],-2mm,4mm),(b,[$B$],0mm,4mm),(c,[$C$],3mm,2mm),(d,[$D$],1mm,4mm),(up(a),[$A'$],-3mm,0mm),(up(b),[$B'$],0mm,-3mm),(up(c),[$C'$],2mm,-3mm),(up(d),[$D'$],-3mm,-3mm)) {dot(p);tag(p,t,dx:dx,dy:dy)}
 #tag((15mm,44mm),[3 m]); #tag((32mm,23mm),[4 m]); #tag((39mm,37mm),[4 m])
]
#let tangent-square()=block(width:65mm,height:60mm)[
 #let p(x,y)=(8mm+42mm*x,50mm-42mm*y)
 #let t=52deg; #let px=calc.cos(t); #let py=calc.sin(t)
 #let mx=(1-py)/px; #let ny=(1-px)/py
 #path((p(0,0),p(0,1),p(1,1),p(1,0)),close:true,stroke:edge)
 #path((p(mx,1),p(1,1),p(1,ny)),close:true,stroke:none,fill:orange.lighten(45%))
 #smooth(t=>p(calc.cos(t*1rad),calc.sin(t*1rad)),t=>(-42mm*calc.sin(t*1rad),-42mm*calc.cos(t*1rad)),0,calc.pi/2,stroke:edge)
 #path((p(mx - 0.12,1+0.12*px/py),p(1.12,ny - 0.12*px/py)),stroke:1.2pt+orange)
 #for (pt,txt,dx,dy) in ((p(0,1),[$A$],-3mm,-1mm),(p(1,1),[$B$],3mm,-1mm),(p(1,0),[$C$],2mm,4mm),(p(0,0),[$D$],-2mm,4mm),(p(mx,1),[$M$],0mm,-4mm),(p(1,ny),[$N$],4mm,-2mm),(p(px,py),[$P$],-2mm,5mm)) {dot(pt);tag(pt,txt,dx:dx,dy:dy)}
]
#let staircase()=block(width:36mm,height:36mm)[
 #for row in range(3) {for col in range(2-row,3) {
  let x=col*10mm+3mm; let y=row*10mm+3mm
  path(((x,y),(x+10mm,y),(x+10mm,y+10mm),(x,y+10mm)),close:true,stroke:edge,fill:palette.geometry-yellow.lighten(20%))
 }}
]
