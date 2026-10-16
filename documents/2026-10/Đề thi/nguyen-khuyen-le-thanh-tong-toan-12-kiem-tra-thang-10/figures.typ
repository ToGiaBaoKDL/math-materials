#import "/templates/theme.typ": exam-palette as palette
#import "/templates/drawing.typ": path, label, smooth
#import "/templates/exam.typ": exam-table
#let blue=palette.geometry-blue
#let orange=palette.geometry-orange
#let edge=1pt+blue
#let hidden=(paint:blue,thickness:1pt,dash:"dashed")
#let dot(p)=place(top+left,dx:p.at(0)-0.5mm,dy:p.at(1)-0.5mm,circle(radius:0.5mm,fill:blue,stroke:none))
#let tag(p,t,dx:0mm,dy:0mm)=label(p,box(fill:white,inset:0.2mm,t),dx:dx,dy:dy)
#let sign-table()=table(columns:(16mm,17mm,9mm,13mm,9mm,13mm,9mm,13mm,9mm,17mm),align:center,inset:4pt,stroke:0.6pt+palette.primary,
 fill:(x,y)=>if x==0 {palette.primary.lighten(85%)} else {none},
 [$x$],[$-infinity$],[$-1$],[],[$0$],[],[$1$],[],[$2$],[$+infinity$],
 [$f'(x)$],[$+$],[$0$],[$-$],[$0$],[$+$],[$parallel$],[$-$],[$0$],[$-$])
#let box-net()=block(width:105mm,height:44mm)[
 #let p(x,y)=(4mm+x*8mm,4mm+y*8mm)
 #for (x,y) in ((0,0),(3,0),(0,3),(3,3)) {path((p(x,y),p(x+1,y),p(x+1,y+1),p(x,y+1)),close:true,stroke:edge,fill:orange.lighten(35%))}
 #path((p(1,0),p(3,0),p(3,1),p(4,1),p(4,3),p(3,3),p(3,4),p(1,4),p(1,3),p(0,3),p(0,1),p(1,1)),close:true,stroke:edge,fill:blue.lighten(82%))
 #path((p(1,1),p(3,1),p(3,3),p(1,3)),close:true,stroke:hidden)
 #label((20mm,40mm),[25 cm],width:15mm)
 #place(top+left,dx:46mm,dy:17mm,[$arrow.r$])
 #let a=(62mm,21mm); #let b=(86mm,25mm); #let c=(99mm,16mm); #let d=(75mm,12mm)
 #let up(p)=(p.at(0),p.at(1)-10mm)
 #path((a,b,c,d),close:true,fill:blue.lighten(72%),stroke:hidden)
 #path((a,b,up(b),up(a)),close:true,fill:blue.lighten(50%),stroke:edge)
 #path((b,c,up(c),up(b)),close:true,fill:blue.lighten(65%),stroke:edge)
 #path((up(a),up(d),up(c)),stroke:edge)
 #path((d,up(d)),stroke:hidden)
]
#let factory()=block(width:85mm,height:62mm)[
 #let a=(30mm,5mm); #let h=(30mm,35mm); #let m=(52mm,35mm); #let b=(61mm,57mm)
 #path(((7mm,35mm),(43mm,22mm),(78mm,36mm),(42mm,49mm)),close:true,stroke:edge,fill:blue.lighten(82%))
 #path((a,h,m),stroke:hidden)
 #path((a,m),stroke:1pt+orange)
 #path((m,b),stroke:1pt+orange)
 #path(((30mm,32mm),(33mm,32mm),(33mm,35mm)),stroke:0.7pt+blue)
 #for (p,t,dx,dy) in ((a,[$A$],3mm,0mm),(h,[$H$],-4mm,1mm),(m,[$M$],5mm,0mm),(b,[$B$],4mm,0mm)) {dot(p);tag(p,t,dx:dx,dy:dy)}
 #tag((66mm,46mm),[$(O x y)$])
]
#let room()=block(width:78mm,height:62mm)[
 #let a=(9mm,52mm); #let b=(27mm,40mm); #let c=(68mm,40mm); #let d=(50mm,52mm)
 #let up(p)=(p.at(0),p.at(1)-35mm)
 #path((a,b,c,d),close:true,stroke:none,fill:blue.lighten(80%))
 #path((a,b,c),stroke:hidden); #path((b,up(b)),stroke:hidden)
 #path((a,d,c,up(c),up(b),up(a)),close:true,stroke:edge)
 #path((up(a),up(d),up(c)),stroke:edge); #path((d,up(d)),stroke:edge)
 #path((up(a),b),stroke:(paint:orange,thickness:1.2pt,dash:"dashed"))
 #path((d,up(c),c),stroke:1.2pt+orange)
 #for (p,t,dx,dy) in ((a,[$A$],-2mm,4mm),(b,[$B$],0mm,4mm),(c,[$C$],3mm,2mm),(d,[$D$],1mm,4mm),(up(a),[$A'$],-3mm,0mm),(up(b),[$B'$],0mm,-3mm),(up(c),[$C'$],2mm,-3mm),(up(d),[$D'$],1mm,-3mm)) {dot(p);tag(p,t,dx:dx,dy:dy)}
 #tag((19mm,48mm),[3 m]); #tag((31mm,23mm),[4 m]); #tag((46mm,34mm),[4 m])
]
#let tangent-square()=block(width:65mm,height:60mm)[
 #let p(x,y)=(8mm+42mm*x,50mm-42mm*y)
 #let t=52deg; #let px=calc.cos(t); #let py=calc.sin(t)
 #let mx=(1-py)/px; #let ny=(1-px)/py
 #path((p(0,0),p(0,1),p(1,1),p(1,0)),close:true,stroke:edge)
 #path((p(mx,1),p(1,1),p(1,ny)),close:true,stroke:none,fill:orange.lighten(45%))
 #smooth(t=>p(calc.cos(t*1rad),calc.sin(t*1rad)),t=>(-42mm*calc.sin(t*1rad),-42mm*calc.cos(t*1rad)),0,calc.pi/2,stroke:edge)
 #path((p(mx - 0.12,1+0.12*px/py),p(1.12,ny - 0.12*px/py)),stroke:1.2pt+orange)
 #for (pt,txt,dx,dy) in ((p(0,1),[$A$],-3mm,-1mm),(p(1,1),[$B$],3mm,-1mm),(p(1,0),[$C$],2mm,4mm),(p(0,0),[$D$],-2mm,4mm),(p(mx,1),[$M$],0mm,-4mm),(p(1,ny),[$N$],4mm,1mm),(p(px,py),[$P$],-2mm,5mm)) {dot(pt);tag(pt,txt,dx:dx,dy:dy)}
]
#let staircase()=block(width:36mm,height:36mm)[
 #for row in range(3) {for col in range(2-row,3) {
  let x=col*10mm+3mm; let y=row*10mm+3mm
  path(((x,y),(x+10mm,y),(x+10mm,y+10mm),(x,y+10mm)),close:true,stroke:edge,fill:palette.geometry-yellow.lighten(20%))
 }}
]
