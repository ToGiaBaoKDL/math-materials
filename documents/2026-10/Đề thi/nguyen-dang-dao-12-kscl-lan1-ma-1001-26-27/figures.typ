#import "/templates/drawing.typ": path, label, smooth, arrow-line, figure-fill
#import "/templates/graphs.typ": graph
#import "/templates/theme.typ": exam-lesson-palette as palette
#let red = palette.primary
#let edge = 0.8pt + red.darken(20%)
#let hidden = (paint: red.darken(20%), thickness: 0.8pt, dash: "dashed")
#let p(x,y) = (x*1mm,y*1mm)
#let cube(prime: false) = box(width: 60mm, height: 49mm)[
  // Back-left is A for both source orientations. Draw front at the lower screen edge.
  #let pts = ((20,30),(7,40),(40,40),(53,30),(20,5),(7,15),(40,15),(53,5))
  #for (face,tone) in (((1,2,6,5),rgb("#F6B1B8")),((2,3,7,6),rgb("#E58995")),((4,5,6,7),rgb("#FADADD"))) {
    path(face.map(i=>p(..pts.at(i))),close:true,stroke:none,fill:figure-fill(tone))
  }
  #for (a,b) in ((0,1),(0,3),(0,4)) { path((p(..pts.at(a)),p(..pts.at(b))),stroke:hidden) }
  #for (a,b) in ((1,2),(2,3),(1,5),(2,6),(3,7),(4,5),(5,6),(6,7),(7,4)) { path((p(..pts.at(a)),p(..pts.at(b))),stroke:edge) }
  #let names = if prime { ([$A$],[$B$],[$C$],[$D$],[$A'$],[$B'$],[$C'$],[$D'$]) } else { ([$E$],[$F$],[$G$],[$H$],[$A$],[$B$],[$C$],[$D$]) }
  #for i in range(8) { label(p(..pts.at(i)),names.at(i),dx:if i == 0 { 3mm } else if (1,4,5).contains(i){-2mm}else{2mm},dy:if i == 0 { 4mm } else if i < 4{3mm}else{-3mm}) }
]
#let variation() = box(width: 124mm,height: 43mm)[
  #place(top+left,rect(width:124mm,height:8mm,fill:figure-fill(rgb("#F6B1B8")),stroke:none))
  #path((p(0,0),p(124,0),p(124,43),p(0,43)),close:true,stroke:edge)
  #for y in (8,16) { path((p(0,y),p(124,y)),stroke:edge) }
  #path((p(13,0),p(13,43)),stroke:edge)
  #for (x,t) in ((6,[$x$]),(21,[$-infinity$]),(47,[$0$]),(75,[$3$]),(92,[$4$]),(116,[$+infinity$])) { label(p(x,4),t) }
  #label(p(6,12),[$f'(x)$],width:12mm)
  #label(p(6,29),[$f(x)$],width:12mm)
  #for (x,t) in ((34,[$+$]),(47,[$0$]),(61,[$-$]),(75,[$0$]),(84,[$+$]),(105,[$+$])) { label(p(x,12),t) }
  #for (x,y,t) in ((21,37,[$-infinity$]),(47,22,[$4$]),(75,37,[$-1/2$]),(92,31,[$4/3$]),(116,22,[$+infinity$])) { label(p(x,y),t,width:14mm,dy:if x == 92 { 4mm } else { 0mm }) }
  #arrow-line(p(27,36),p(42,24),color:red)
  #arrow-line(p(52,24),p(70,34),color:red)
  #arrow-line(p(80,35),p(111,24),color:red)
  #path((p(92,9),p(92,27)),stroke:(paint:red,thickness:0.5pt,dash:"dotted"))
]
#let park() = box(width:44mm,height:61mm)[
  #let q(x,y)=p(7+1.2*x,57-1.2*y)
  #path((q(0,0),q(0,40),q(20,0)),close:true,stroke:edge,fill:figure-fill(rgb("#FBE5C2")))
  #let pts = (q(0,0),q(0,20)) + range(1,61).map(i=>{let x=i/6; q(x,20-x*x/5)})
  #path(pts,close:true,stroke:edge,fill:figure-fill(rgb("#EF8C99")))
  #path((q(4,40),q(24,0)),stroke:(paint:red,thickness:0.8pt,dash:"dashed"))
  #path((q(8,40),q(28,0)),stroke:edge)
  // Normal to BC: nearest joining path from (5,15) to (11,18).
  #path((q(5,15),q(11,18)),stroke:2.5pt+white)
  #path((q(5,14.6),q(11.2,17.6)),stroke:0.5pt+red)
  #path((q(5,15.4),q(10.8,18.4)),stroke:0.5pt+red)
  #label(q(0,0),[$A$],dx:-3mm,dy:2mm)
  #label(q(0,40),[$B$],dx:-3mm,dy:-1mm)
  #label(q(20,0),[$C$],dy:3mm)
]
#let lattice() = box(width:60mm,height:49mm)[
  #place(top+left,dx:0mm,dy:1mm,rect(width:60mm,height:48mm,fill:figure-fill(rgb("#FFE0E3")),stroke:none))
  #for x in range(11) { path((p(6*x,1),p(6*x,49)),stroke:0.65pt+red) }
  #for y in range(9) { path((p(0,1+6*y),p(60,1+6*y)),stroke:0.65pt+red) }
]
#let diagram(name) = block(above:2mm,below:2mm,breakable:false)[
  #if name=="derivative" { graph(x=>0.55*(x+1.7)*(x - 0.65)*(x - 1.8),xrange:(-2.2,2.8),yrange:(-1.6,3.5),width:64mm,height:47mm,guides:((-0.779968,1.866836),(1.279968,-0.536936)),curve-stroke:1.3pt+red)
    label(p(39,8),[$y=f'(x)$],width:25mm) } else if name=="cubic" { graph(x=>-x*x*x + 2*x*x - 1,xrange:(-1.5,2.5),yrange:(-1.8,3.4),width:64mm,height:43mm,xticks:(-1,1,2),yticks:(-1,2),y-label-offsets:("-1":(-4mm,3mm)),guides:((-1,2),(2,-1)),points:((-1,2),(0,-1),(2,-1)),curve-stroke:1.3pt+red) } else if name=="cube-prime" { cube(prime:true) } else if name=="cube" { cube() } else if name=="variation" { variation() } else if name=="park" { park() } else if name=="basket" { image("figures/plants.png",width:70mm) } else if name=="lattice" { lattice() }
]
