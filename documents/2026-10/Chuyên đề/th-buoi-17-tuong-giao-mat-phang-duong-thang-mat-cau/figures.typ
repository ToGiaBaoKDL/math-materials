#import "/templates/drawing.typ": path, label, smooth, figure-fill
#let ink = rgb("#365B64")
#let pink = figure-fill(rgb("#FF91A4"))
#let mint = figure-fill(rgb("#B5E9DE"))
#let edge = 0.8pt + ink
#let hidden = (paint: ink, thickness: 0.7pt, dash: "dashed")
#let p(x,y) = (x * 1mm, y * 1mm)
#let segment(a,b,dashed:false) = path((a,b),stroke:if dashed {hidden} else {edge})
#let mark(a,t,dx:0mm,dy:0mm) = {
  place(top+left,dx:a.at(0)-0.45mm,dy:a.at(1)-0.45mm,circle(radius:0.45mm,fill:ink,stroke:none))
  label(a,t,dx:dx,dy:dy)
}
// Foreground of the opaque plane covers the lower sphere; its hidden silhouette remains dashed.
#let plane-front(ring, cy, depth, radius:25, fill:figure-fill(rgb("#D0FF73"))) = {
  let front-arc = range(65).map(i => ring(calc.pi * (1 - i/64)))
  path((p(15,cy),) + front-arc + (p(85,cy),p(72,cy+depth),p(2,cy+depth)),
    close:true,fill:fill,stroke:none)
  path((p(15,cy),p(2,cy+depth),p(72,cy+depth),p(85,cy)),stroke:edge)
  let angle = calc.asin((cy - 31)/radius)/1rad
  smooth(t=>p(50+radius*calc.cos(t*1rad),31+radius*calc.sin(t*1rad)),
    t=>p(-radius*calc.sin(t*1rad),radius*calc.cos(t*1rad)),angle,calc.pi - angle,stroke:hidden)
}
// Sphere/plane schematic: tangent contact is drawn at the silhouette bottom, as in the source.
// Intersecting sections use an orthographic projection; front arcs face down on the page.
#let plane(kind) = box(width:100mm,height:if kind == "plane-outside" {89mm} else if kind == "plane-tangent" {70mm} else {65mm})[
  #let radius = 25
  #let alpha = 20deg
  #let h = if kind == "plane-outside" {45} else if kind == "plane-tangent" {25} else {18.5}
  #let cy = if kind == "plane-tangent" {56} else {31 + h * calc.cos(alpha)}
  #let sphere-fill = figure-fill(rgb("#B8FFF5"))
  #let plane-fill = figure-fill(rgb("#D0FF73"))
  #let section-fill = figure-fill(rgb("#FF86C8"))
  #let section-ink = rgb("#A63879")
  #let front = cy + 13
  #let back = cy - 13
  #path((p(2,front),p(72,front),p(98,back),p(28,back)),close:true,fill:plane-fill,stroke:edge)
  #place(top+left,dx:25mm,dy:6mm,circle(radius:25mm,fill:sphere-fill,stroke:edge))
  #let equator(t) = p(50+radius*calc.cos(t*1rad),31+radius*calc.sin(alpha)*calc.sin(t*1rad))
  #let equator-tangent(t) = p(-radius*calc.sin(t*1rad),radius*calc.sin(alpha)*calc.cos(t*1rad))
  #smooth(equator,equator-tangent,calc.pi,2*calc.pi,stroke:hidden)
  #smooth(equator,equator-tangent,0,calc.pi,stroke:edge)
  #if h < radius {
    let r = calc.sqrt(radius*radius - h*h)
    let ring(t) = p(50+r*calc.cos(t*1rad),cy+r*calc.sin(alpha)*calc.sin(t*1rad))
    let tangent(t) = p(-r*calc.sin(t*1rad),r*calc.sin(alpha)*calc.cos(t*1rad))
    plane-front(ring,cy,13,fill:plane-fill)
    smooth(ring,tangent,0,2*calc.pi,close:true,fill:section-fill,stroke:none)
    smooth(ring,tangent,calc.pi,2*calc.pi,stroke:(paint:section-ink,thickness:0.8pt,dash:"dashed"))
    smooth(ring,tangent,0,calc.pi,stroke:1pt+section-ink)
    segment(p(50,31),p(50+r,cy),dashed:true)
    segment(p(50,cy),p(50+r,cy))
    label(p(50+r/2,cy),$r$,dy:3.5mm)
    label(p(50+r/2,31+(cy - 31)/2),$R$,dx:8mm,dy:4mm)
    path((p(50,cy - 3),p(53,cy - 3),p(53,cy)),stroke:edge)
  } else {
    segment(p(50,31),p(75,31),dashed:true)
    label(p(63,31),$R$,dy:-3mm)
  }
  #if kind != "plane-outside" {
    segment(p(50,31),p(50,cy),dashed:true)
    place(top+left,dx:49.2mm,dy:(cy - 0.8)*1mm,circle(radius:0.8mm,fill:section-ink,stroke:none))
    label(p(50,cy),$H$,dx:-5mm,dy:4mm)
  }
  #mark(p(50,31),$I$,dx:-2mm,dy:-4mm)
  #label(p(20,29),$(S)$,width:10mm)
  // Compact corner sector; the label stays clear of both rays and the arc.
  #smooth(t=>p(2+15*calc.cos(t*1rad),front+15*calc.sin(t*1rad)),t=>p(-15*calc.sin(t*1rad),15*calc.cos(t*1rad)),-calc.pi/4,0,stroke:edge)
  #place(top+left,dx:9mm,dy:(front - 4.5)*1mm,text(size:9pt,fill:black)[$(P)$])
]
// A meridian section represents the line/sphere incidence without perspective ambiguity.
#let chord(kind) = box(width:88mm,height:72mm)[
  #let R=24
  #let h=if kind=="line-outside" {29} else if kind=="line-tangent" {24} else if kind=="equilateral" {R*calc.sqrt(3)/2} else {14.4}
  #let cy=29+h
  #place(top+left,dx:20mm,dy:5mm,circle(radius:24mm,fill:mint,stroke:edge))
  #segment(p(6,cy),p(82,cy))
  #segment(p(44,29),p(44,cy),dashed:true)
  #if h < R {
    let r=calc.sqrt(R*R - h*h)
    segment(p(44,29),p(44-r,cy))
    segment(p(44,29),p(44+r,cy))
    mark(p(44-r,cy),$A$,dx:-3mm,dy:4mm)
    mark(p(44+r,cy),$B$,dx:3mm,dy:4mm)
    label(p(44+r/2,29+h/2),$R$,dx:4mm)
  }
  #path((p(44,cy - 3),p(47,cy - 3),p(47,cy)),stroke:edge)
  #mark(p(44,29),if kind=="equilateral" {$O$} else {$I$},dx:-3mm,dy:-3mm)
  #mark(p(44,cy),if kind=="equilateral" {$E$} else {$H$},dx:3mm,dy:4mm)
  #label(p(79,cy),$Delta$,dy:-3mm)
]
// Schematic lowered section requested for readability; plane offset is illustrative.
// Preserve OA=OB=AB=2, OE=sqrt(3), and E as the perpendicular chord midpoint.
#let equilateral3d() = box(width:100mm,height:60mm)[
  #let a = 6deg
  #let h = 1.4
  #let rho = calc.sqrt(4 - h*h)
  #let e = calc.sqrt(3 - h*h)
  #let phi = 90deg
  #let project(x,y,z) = p(50+12.5*x,31+12.5*(y*calc.sin(a) - z*calc.cos(a)))
  #let E = project(e*calc.cos(phi),e*calc.sin(phi),-h)
  #let A = project(e*calc.cos(phi)-calc.sin(phi),e*calc.sin(phi)+calc.cos(phi),-h)
  #let B = project(e*calc.cos(phi)+calc.sin(phi),e*calc.sin(phi)-calc.cos(phi),-h)
  #let O = p(50,31)
  #let front = 31+12.5*h*calc.cos(a)+10.5
  #path((p(2,front),p(72,front),p(98,front - 21),p(28,front - 21)),close:true,
    fill:figure-fill(rgb("#D0FF73")),stroke:edge)
  #place(top+left,dx:25mm,dy:6mm,circle(radius:25mm,fill:figure-fill(rgb("#B8FFF5")),stroke:edge))
  #let equator(t) = p(50+25*calc.cos(t*1rad),31+25*calc.sin(a)*calc.sin(t*1rad))
  #let equator-tangent(t) = p(-25*calc.sin(t*1rad),25*calc.sin(a)*calc.cos(t*1rad))
  #smooth(equator,equator-tangent,calc.pi,2*calc.pi,stroke:hidden)
  #smooth(equator,equator-tangent,0,calc.pi,stroke:edge)
  #let ring(t) = project(rho*calc.cos(t*1rad),rho*calc.sin(t*1rad),-h)
  #let tangent(t) = p(-12.5*rho*calc.sin(t*1rad),12.5*rho*calc.sin(a)*calc.cos(t*1rad))
  #plane-front(ring,31+12.5*h*calc.cos(a),10.5)
  #smooth(ring,tangent,0,2*calc.pi,close:true,fill:figure-fill(rgb("#FFB5DA")),stroke:none)
  #smooth(ring,tangent,calc.pi,2*calc.pi,stroke:hidden)
  #smooth(ring,tangent,0,calc.pi,stroke:edge)
  #path((O,A,B),close:true,fill:figure-fill(rgb("#FFD43B")).transparentize(45%),stroke:hidden)
  #segment(O,E,dashed:true)
  #let v = ((O.at(0)-E.at(0))/10,(O.at(1)-E.at(1))/10)
  #let u = ((B.at(0)-E.at(0))/6,(B.at(1)-E.at(1))/6)
  #path(((E.at(0)+v.at(0),E.at(1)+v.at(1)),
    (E.at(0)+v.at(0)+u.at(0),E.at(1)+v.at(1)+u.at(1)),
    (E.at(0)+u.at(0),E.at(1)+u.at(1))),stroke:0.6pt+ink)
  #mark(O,$O$,dx:3mm,dy:-7mm)
  #mark(A,$A$,dx:-4mm,dy:5mm)
  #mark(B,$B$,dx:4mm,dy:5mm)
  #mark(E,$E$,dx:0mm,dy:5mm)
  #label(p(78,16),$(S)$,width:10mm)
  #smooth(t=>p(2+15*calc.cos(t*1rad),front+15*calc.sin(t*1rad)),
    t=>p(-15*calc.sin(t*1rad),15*calc.cos(t*1rad)),-calc.atan(21/26)/1rad,0,stroke:edge)
  #place(top+left,dx:9mm,dy:(front - 4.5)*1mm,text(size:9pt)[$(P)$])
]
#let diagram(name,width:64mm)={
  let native = if name.starts-with("plane") or name == "equilateral" {100mm} else {88mm}
  scale(x:width/native*100%,y:width/native*100%,reflow:true,
    if name == "equilateral" {equilateral3d()} else if name.starts-with("plane") {plane(name)} else {chord(name)})
}
