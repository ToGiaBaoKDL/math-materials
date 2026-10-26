#import "/templates/drawing.typ": figure-fill, arrow-line, label, path, smooth, solid-path
#import "/templates/components.typ": figure-panel
#let blue = rgb("#0077C8")
#let brown = rgb("#263345")
#let pink = rgb("#FF287F")
#let red = rgb("#ED174C")
#let orange = rgb("#C45A00")
#let cyan = rgb("#55DCE5")
#let salmon = rgb("#FF91A4")
#let lime = rgb("#BFFF36")
#let area-fill(color) = if color == brown or color == white { color } else { figure-fill(color) }
#let pt(p) = (p.at(0) * 1mm, p.at(1) * 1mm)
#let edge(a, b, color: brown, dashed: false) = path((pt(a), pt(b)), stroke: (
  paint: color,
  thickness: 1.2pt,
  dash: if dashed { (2.5pt, 2.5pt) } else { "solid" },
))
#let face(points, color) = path(points.map(pt), close: true, fill:area-fill(color), stroke: none)
#let tag(p, t, dx: 0, dy: 0, width: 10) = label(pt(p), t, dx: dx * 1mm, dy: dy * 1mm, width: width * 1mm)
#let dot(p, t, dx: 0, dy: 0) = {
  place(top + left, dx: p.at(0) * 1mm - 0.65mm, dy: p.at(1) * 1mm - 0.65mm, circle(
    radius: 0.65mm,
    fill: pink,
    stroke: none,
  ))
  tag(p, t, dx: dx, dy: dy)
}
#let arrow(a, b, color: blue) = arrow-line(pt(a), pt(b), color: color, thickness: 1.2pt)
#let disc(p, r, color) = place(top + left, dx: (p.at(0) - r) * 1mm, dy: (p.at(1) - r) * 1mm, circle(
  radius: r * 1mm,
  fill:area-fill(color),
  stroke: 1pt + brown,
))
#let drone(p) = {
  let (x, y) = p
  for (a,b) in ((-5,-3),(-5,3),(5,-3),(5,3)) {
    edge((x,y),(x+a,y+b),color: brown)
    place(top + left, dx: (x + a - 2.8)*1mm, dy: (y + b - 1.1)*1mm,
      ellipse(width:5.6mm,height:2.2mm,fill:area-fill(lime),stroke:0.8pt+brown))
  }
  place(top + left,dx:(x - 2.8)*1mm,dy:(y - 1.8)*1mm,
    rect(width:5.6mm,height:3.6mm,radius:1mm,fill:area-fill(pink),stroke:0.8pt+brown))
}
#let graph(kind) = box(width: 60mm, height: 35mm)[
  #let p(x, y) = (30 + 8.5 * x, 23 - 4 * y)
  #arrow(p(-2.8, 0), p(2.9, 0), color: black)
  #arrow(p(0, -2), p(0, 4.4), color: black)
  #tag(p(2.9, 0), $x$, dy: 4)
  #tag(p(0, 4.4), $y$, dx: 4)
  #tag(p(0, 0), $O$, dx: -3, dy: 3)
  #if kind == "cubic" {
    smooth(
      t => pt(p(t, -t * t * t + 3 * t + 1)),
      t => (8.5mm, (-3 + 3 * t * t) * 4mm),
      -2.05,
      2.05,
      stroke: 1.5pt + blue,
    )
    for (x, y) in ((-1, -1), (1, 3)) {
      edge(p(x, 0), p(x, y), color: red, dashed: true)
      edge(p(0, y), p(x, y), color: red, dashed: true)
      tag(p(x, 0), if x < 0 { $-1$ } else { $1$ }, dx: 0, dy: if x < 0 { -4 } else { 4 })
      tag(p(0, y), if y < 0 { $-1$ } else { $3$ }, dx: if y < 0 { 5 } else { -5 }, dy: if y < 0 { 2 } else { 0 })
    }
  } else {
    // Source derivative: (x+1)^2(x - 2), scaled vertically without changing intercepts.
    let p(x, y) = (43 + 13 * x, 23 - 8 * y)
    // Override axes for the lower derivative graph.
  }
]
#let derivative-graph() = box(width: 70mm, height: 57mm)[
  #let p(x, y) = (32 + 10 * x, 18 - 7 * y)
  #arrow(p(-2.6, 0), p(3, 0), color: black)
  #arrow(p(0, -4.7), p(0, 2), color: black)
  #tag(p(3, 0), $x$, dy: 4) #tag(p(0, 2), $y$, dx: 4)
  #tag(p(0, 0), $O$, dx: 3, dy: -3)
  #smooth(
    t => pt(p(t, (t + 1) * (t + 1) * (t - 2))),
    t => (10mm, -7 * (3 * t * t - 3) * 1mm),
    -2.05,
    2.18,
    stroke: 1.5pt + blue,
  )
  #tag(p(-1, 0), $-1$, dy: -4) #tag(p(1, 0), $1$, dy: 4) #tag(p(2, 0), $2$, dx: 3, dy: 3)
  #tag(p(0, -2), $-2$, dx: -5)
  #for x in (-1, 1, 2) { edge(p(x, -0.12), p(x, 0.12), color: black) }
]
#let box-figure() = box(width: 88mm, height: 70mm)[
  #let A = (12, 23); #let B = (56, 23); #let C = (76, 8); #let D = (32, 8)
  #let Ap = (12, 60); #let Bp = (56, 60); #let Cp = (76, 45); #let Dp = (32, 45)
  #face((A, B, C, D), lime) #face((A, B, Bp, Ap), cyan) #face((B, C, Cp, Bp), cyan)
  #for (a, b) in ((D, Dp), (Dp, Ap), (Dp, Cp)) { edge(a, b, dashed: true) }
  #for (a, b) in ((A, B), (B, C), (C, D), (D, A), (A, Ap), (B, Bp), (C, Cp), (Ap, Bp), (Bp, Cp)) { edge(a, b) }
  #dot(A, $A$, dx: -4) #dot(B, $B$, dx: 3, dy: 3) #dot(C, $C$, dy: -4) #dot(D, $D$, dy: -4)
  #dot(Ap, $A_1$, dx: -4, dy: 3) #dot(Bp, $B_1$, dy: 4) #dot(Cp, $C_1$, dx: 4) #dot(Dp, $D_1$, dx: -4, dy: 0)
]
#let pyramid() = box(width: 94mm, height: 73mm)[
  // Rhombus at B: AB=BC and angle ABC=60 degrees; S over center gives SA=SC.
  #let A = (15, 48); #let B = (43, 64); #let C = (79, 48); #let D = (51, 32); #let S = (47, 5)
  #face((S, A, B), lime) #face((S, B, C), lime)
  #for (a, b) in ((A, D), (D, C), (S, D)) { edge(a, b, dashed: true) }
  #for (a, b) in ((S, A), (S, B), (S, C), (A, B), (B, C)) { edge(a, b) }
  #edge(A, C, dashed: true, color: blue)
  #dot(S, $S$, dy: -3) #dot(A, $A$, dx: -4) #dot(B, $B$, dy: 4) #dot(C, $C$, dx: 4) #dot(D, $D$, dx: 4, dy: -2)
]
#let flight() = box(width: 112mm, height: 49mm)[
  #arrow((10,22),(103,22),color:brown)
  #dot((14,22),$A$,dy:5) #dot((42,22),$C$,dy:5) #dot((98,22),$B$,dy:5)
  #drone((42,12))
  #edge((14,32),(42,32),color:red)
  #edge((14,30),(14,34),color:red) #edge((42,30),(42,34),color:red)
  #tag((28,38),[20 giây],width:26)
  #edge((14,43),(98,43),color:blue)
  #edge((14,41),(14,45),color:blue) #edge((98,41),(98,45),color:blue)
  #tag((74,38),[60 giây (A → B)],width:40)
]
#let motion() = box(width:95mm,height:30mm)[
  #edge((8,24),(88,24),color:brown)
  #face(((16,17),(20,12),(25,12),(29,7),(39,7),(44,13),(49,15),(49,20),(16,20)),pink)
  #face(((29,9),(33,9),(33,13),(26,13)),cyan)
  #face(((35,9),(38,9),(42,13),(35,13)),cyan)
  #disc((24,21),3,brown) #disc((42,21),3,brown)
  #disc((24,21),1.2,white) #disc((42,21),1.2,white)
  #arrow((55,12),(78,12),color:red) #tag((69,6),$s(t)$,width:16)
]
#let balloon() = box(width:98mm,height:72mm)[
  #place(top+left,dx:24mm,dy:3mm,ellipse(width:28mm,height:32mm,fill:area-fill(pink),stroke:1.2pt+brown))
  #place(top+left,dx:32mm,dy:3mm,ellipse(width:12mm,height:32mm,fill:area-fill(lime),stroke:0.9pt+brown))
  #edge((31,32),(34,39)) #edge((45,32),(42,39))
  #face(((33,38),(43,38),(42,43),(34,43)),rgb("#FFD43B"))
  #edge((8,65),(88,65)) #tag((28,70),[Mặt đất],width:26)
  #edge((43,43),(72,43),color:blue,dashed:true)
  #arrow((70,65),(70,43),color:red) #arrow((70,43),(70,65),color:red)
  #tag((82,54),$h(t)$,width:18)
  #edge((65,65),(65,60),color:brown) #edge((65,60),(70,60),color:brown)
]
#let rescue() = box(width:126mm,height:94mm)[
  // Projection (x,y,z) -> (12+.45x+.25y,78-.1y-1.5z).
  #face(((4,84),(104,84),(122,57),(22,57)),rgb("#B98250"))
  // B is on its roof, z=10, so roof y=60, ground y=75.
  #face(((31,59),(37.5,60),(37.5,75),(31,74)),pink)
  #face(((37.5,60),(44,56),(44,71),(37.5,75)),salmon)
  #face(((31,59),(37.5,60),(44,56),(37.5,55)),cyan)
  #face(((79,22),(88.5,24),(88.5,69),(79,67)),pink)
  #face(((88.5,24),(99,18),(99,63),(88.5,69)),salmon)
  #face(((79,22),(88.5,24),(99,18),(89.5,16)),rgb("#FFD43B"))
  #edge((31,74),(37.5,75)) #edge((37.5,75),(44,71))
  #edge((79,67),(88.5,69)) #edge((88.5,69),(99,63))
  #arrow((12,78),(88.5,24),color:black)
  #dot((12,78),$O$,dx:-4,dy:3) #dot((37.5,60),$B$,dx:-8,dy:-6) #dot((88.5,24),$A$,dx:5,dy:2)
  #drone((65,9))
  #tag((24,89),[Trạm cứu hộ],width:35)
]
#let medicine() = box(width:110mm,height:38mm)[
  #place(top+left,dx:12mm,dy:11mm,rect(width:18mm,height:23mm,radius:3mm,fill:area-fill(cyan),stroke:1pt+brown))
  #place(top+left,dx:16mm,dy:6mm,rect(width:10mm,height:7mm,radius:1mm,fill:area-fill(cyan),stroke:1pt+brown))
  #place(top+left,dx:14mm,dy:3mm,rect(width:14mm,height:5mm,radius:1mm,fill:area-fill(pink),stroke:1pt+brown))
  #place(top+left,dx:14mm,dy:18mm,rect(width:14mm,height:10mm,radius:1mm,fill:white,stroke:none))
  #edge((18,23),(24,23),color:red) #edge((21,20),(21,26),color:red)
  #place(top+left,dx:48mm,dy:16mm,rect(width:34mm,height:6mm,radius:0.7mm,fill:area-fill(cyan),stroke:1pt+brown))
  #edge((39,19),(48,19)) #edge((39,15),(39,23))
  #edge((48,13),(48,25))
  #face(((82,17),(86,18),(86,20),(82,21)),pink)
  #edge((86,19),(104,19))
  #for x in (53,58,63,68,73,78) { edge((x,16),(x,18),color:brown) }
]
#let triangle-figure() = box(width:114mm,height:78mm)[
  // Plane schematic preserves BH=2BC, AH perpendicular BC and D=B+C-A.
  #let A=(80,8); #let B=(40,38); #let C=(60,38); #let H=(80,38); #let D=(20,68)
  #face((A,B,D,C),lime)
  #for (a,b) in ((A,B),(B,C),(C,A),(B,D),(D,C)) { edge(a,b) }
  #edge(C,(96,38),color:blue,dashed:true)
  #edge(A,H,color:red,dashed:true)
  #edge((76,38),(76,34),color:red) #edge((76,34),(80,34),color:red)
  #dot(A,$A$,dy:-4) #dot(B,$B$,dx:-5) #dot(C,$C$,dx:-3,dy:-4)
  #dot(H,$H$,dx:4,dy:4) #dot(D,$D$,dy:5)
]
#let camera() = box(width:120mm,height:88mm)[
  // Common affine projection: x=(4,0), y=(2,-2), z=(0,-5) mm.
  #let O=(20,74); #let A=(32,22); #let B=(80,22); #let M=(49,22); #let C=(44,74)
  #face(((10,80),(88,80),(114,54),(36,54)),lime)
  #for end in ((101,74),(48,46),(20,10)) {
    solid-path((pt(O),pt(end)),thickness:1.5pt,color:brown)
    arrow-line(pt(O),pt(end),color:brown,thickness:1.5pt)
  }
  #tag((104,74),$x$) #tag((50,44),$y$) #tag((20,6),$z$) #tag(O,$O$,dx:-4,dy:3)
  #edge(A,B,color:red)
  #edge(A,(32,62),color:blue,dashed:true) #edge(B,(80,62),color:blue,dashed:true)
  #dot(A,$A$,dx:0,dy:-5) #dot(B,$B$,dy:-5) #dot(M,$M$,dy:-5)
  #face(((45,24),(52,24),(52,29),(45,29)),pink)
  #face(((52,25),(56,23),(56,30),(52,28)),brown)
  #edge(M,C,color:blue,dashed:true)
  #disc((44,63),1.8,pink) #edge((44,65),(44,70))
  #edge((44,67),(40,69)) #edge((44,67),(48,69))
  #edge((44,70),(41,74)) #edge((44,70),(47,74))
  #dot(C,$C$,dy:5)
  #tag((91,59),$(O x y)$,width:22)
]
#let crane() = box(width: 98mm, height: 84mm)[
  #face(((39,0),(58,0),(55,3),(42,3)),rgb("#FFD43B"))
  // Square centered under hook: vertical height = half diagonal * tan(60°).
  #let A = (15, 52); #let B = (55, 65); #let C = (82, 48); #let D = (42, 35); #let S = (48.5, 7)
  #face((A, B, C, D), rgb("#E9BE7D"))
  #for (a, b) in ((A, B), (B, C), (C, D), (D, A)) { edge(a, b) }
  #for a in (A, B, C) { edge(a, S, color: blue) }
  #edge(D, S, color: blue)
  #edge(A, (48.5, 50), dashed: true, color: orange)
  #let theta1 = calc.atan2(S.at(0) - A.at(0), S.at(1) - A.at(1)) / 1rad
  #let theta2 = calc.atan2(48.5 - A.at(0), 50 - A.at(1)) / 1rad
  #smooth(
    t => ((A.at(0) + 7 * calc.cos(t * 1rad)) * 1mm, (A.at(1) + 7 * calc.sin(t * 1rad)) * 1mm),
    t => (-7 * calc.sin(t * 1rad) * 1mm, 7 * calc.cos(t * 1rad) * 1mm),
    theta1,
    theta2,
    stroke: 1pt + orange,
  )
  #tag((12, 37), $60 degree$, width: 16)
  #path((pt((14,40)),pt((19,46))),stroke:0.6pt+brown)
  #face(((36, 40), (56, 46), (65, 40), (45, 34)), salmon)
  #face(((36, 40), (56, 46), (56, 55), (36, 49)), cyan)
  #face(((56, 46), (65, 40), (65, 49), (56, 55)), rgb("#29A8B8"))
  #edge(B, S, color: blue)
  #edge((48.5, 0), (48.5, 3), color: brown)
  #path(((46mm,3mm),(46mm,5mm),(48.5mm,7mm),(51mm,5mm),(51mm,3mm)),stroke:1.8pt+brown)
  #tag((46, 47.5), [50 kg], width: 18)
  #tag((49, 74), [10 kg], width: 18)

]
#let fold() = box(width: 108mm, height: 79mm)[
  // 15×10 sheet, fold example t=8. N and M are exact perpendicular - bisector intersections.
  #let p(x, y) = (10 + 5 * x, 10 + 5 * y)
  #let A = p(0, 0); #let B = p(15, 0); #let C = p(15, 10); #let D = p(0, 10)
  #let M = p(15 - 10.25, 0); #let N = p(15, 8.2); #let Bp = p(7, 10)
  #face((A, B, C, D), lime)
  #face((M, B, N), lime)
  #face((M, Bp, N), rgb("#FF405A"))
  #let verts = (M, Bp, N)
  #for k in range(-60, 90, step: 4) {
    let hits = ()
    for i in range(3) {
      let a=verts.at(i); let b=verts.at(calc.rem(i+1,3))
      let va=a.at(0)-a.at(1); let vb=b.at(0)-b.at(1)
      if calc.min(va,vb) < k and k < calc.max(va,vb) {
        let t=(k - va)/(vb - va)
        hits.push((a.at(0)+t*(b.at(0)-a.at(0)),a.at(1)+t*(b.at(1)-a.at(1))))
      }
    }
    if hits.len()==2 { path(hits.map(pt),stroke:0.5pt+rgb("#880D30")) }
  }
  #for (a, b) in ((A, B), (B, C), (C, D), (D, A)) { edge(a, b) }
  #edge(M, N, dashed: true, color: rgb("#C60035"))
  #edge(M, Bp, color: red) #edge(Bp, N, color: red)
  #dot(A, $A$, dx: -3, dy: -3) #dot(B, $B$, dx: 3, dy: -3) #dot(C, $C$, dx: 3, dy: 3) #dot(D, $D$, dx: -3, dy: 3)
  #dot(M, $M$, dy: -4) #dot(N, $N$, dx: 4) #dot(Bp, $B'$, dy: 4)
  #tag((48, 72), [15 cm], width: 22) #tag((96, 35), [10 cm], width: 22)
]
#let illustration(name) = figure-panel(
  scale(x: if name == "cubic" { 125% } else if name == "derivative" { 100% } else if ("box", "rescue", "triangle").contains(name) { 102.6% } else { 108% }, y: if name == "cubic" { 125% } else if name == "derivative" { 100% } else if ("box", "rescue", "triangle").contains(name) { 102.6% } else { 108% }, reflow:true,
  if name == "cubic" { graph(name) } else if name == "derivative" { derivative-graph() } else {
    (
      flight: flight,
      motion: motion,
      box: box-figure,
      pyramid: pyramid,
      balloon: balloon,
      rescue: rescue,
      medicine: medicine,
      triangle: triangle-figure,
      camera: camera,
      crane: crane,
      fold: fold,
    ).at(name)()
  },
  ),
  above: if name == "crane" { 10mm } else if ("cubic", "derivative").contains(name) { 1mm } else { 5mm },
  below: if ("cubic", "derivative").contains(name) { 1mm } else { 5mm },
)
