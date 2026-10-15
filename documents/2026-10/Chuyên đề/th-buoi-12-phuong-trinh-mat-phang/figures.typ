#import "/templates/drawing.typ": path, label, arrow-line, edge, diagram-hidden
#import "/templates/theme.typ": palette
#let dot(p) = place(top+left,dx:p.at(0)-0.55mm,dy:p.at(1)-0.55mm,circle(radius:0.55mm,fill:palette.primary,stroke:none))
#let normal-plane() = block(width:116mm,height:47mm,above:2mm,below:3mm)[
 #path(((5mm,39mm),(87mm,39mm),(110mm,22mm),(28mm,22mm)),fill:rgb("#F6EDDC"),close:true)
 #arrow-line((68mm,31mm),(68mm,4mm),color:palette.geometry-secondary)
 #path(((68mm,27mm),(72mm,27mm),(72mm,31mm)),stroke:0.6pt+palette.geometry-secondary)
 #dot((42mm,33mm))
 #label((42mm,33mm),$M(x_0;y_0;z_0)$,dx:0mm,dy:-4mm,width:36mm)
 #label((82mm,10mm),$arrow(n)=(A;B;C)$,width:42mm)
 #place(top+left,curve(curve.move((15mm,31.61mm)),
   curve.cubic((17.5mm,33mm),(18mm,36mm),(17mm,39mm)),stroke:0.65pt+palette.primary))
 #label((12.7mm,36.8mm),$P$,width:5mm)
]
#let orthocenter() = {
 // A=(0,0,4), B=(4,0,0), C=(0,5,0); one affine projection for all points.
 let project(p) = {
  let angle = 1.5deg
  let x = calc.cos(angle)*p.at(0)-calc.sin(angle)*p.at(1)
  let y = calc.sin(angle)*p.at(0)+calc.cos(angle)*p.at(1)
  (15mm+3.5mm*x+14mm*y,43mm+5.75mm*x - 9.75mm*p.at(2))
 }
 let O=(0,0,0); let A=(0,0,4); let B=(4,0,0); let C=(0,5,0)
 let H=(100/66,80/66,100/66)
 let E=(100/41,80/41,0)
 let K=(2,0,2)
 let add(a,b)=(a.at(0)+b.at(0),a.at(1)+b.at(1),a.at(2)+b.at(2))
 let vec(a,b)=(b.at(0)-a.at(0),b.at(1)-a.at(1),b.at(2)-a.at(2))
 let unit(v)={let d=calc.sqrt(v.map(x=>x*x).sum());v.map(x=>0.23*x/d)}
 let square(p,a,b)={let u=unit(vec(p,a));let v=unit(vec(p,b));path((project(add(p,u)),project(add(add(p,u),v)),project(add(p,v))),stroke:0.55pt+palette.geometry-secondary)}
 block(width:98mm,height:78mm,above:3mm,below:4mm)[
  #path((project(A),project(B),project(C)),fill:palette.geometry-tint,close:true)
  #path((project(O),project(B)),stroke:diagram-hidden)
  #path((project(O),project(C)),stroke:diagram-hidden)
  #path((project(O),project(H)),stroke:diagram-hidden)
  #path((project(A),project(O)),stroke:diagram-hidden)
  #path((project(A),project(E)),stroke:0.8pt+palette.geometry-secondary)
  #path((project(C),project(K)),stroke:0.8pt+palette.geometry-secondary)
  #square(O,A,B) #square(O,A,C) #square(O,B,C)
  #square(E,A,C) #square(K,A,C) #square(H,O,E)
  #for p in (O,A,B,C,H,E,K) {dot(project(p))}
  #label(project(A),$A$,dy:-4mm)
  #label(project(O),$O$,dx:-4mm)
  #label(project(B),$B$,dy:5mm)
  #label(project(C),$C$,dx:5mm)
  #label(project(H),$H$,dx:3.5mm,dy:-3mm)
  #label(project(E),$E$,dx:2mm,dy:4mm)
  #label(project(K),$K$,dx:-4mm,dy:-1mm)
 ]
}
