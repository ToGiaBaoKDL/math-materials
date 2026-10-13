#import "/templates/drawing.typ": path as draw-path, label as draw-label, smooth as draw-smooth, arrow-line
#import "/templates/theme.typ": palette
#import "/templates/pyramid-net.typ": pyramid-net
#let edge = 1.2pt + palette.primary
#let hidden = (paint:palette.primary,thickness:1.2pt,dash:"dashed")
#let path = draw-path.with(stroke:edge)
#let smooth = draw-smooth.with(stroke:edge)
#let label(point, body, ..args) = draw-label(point, box(fill:white,inset:0.35mm,body), ..args)
#let pyramid() = pyramid-net(side: [6 dm],edge-width:1.2pt)

#let window() = block(width:45mm,height:45mm)[
 #for inset in (0mm,0.8mm) {
  let radius = 15mm - inset
  path(((7mm+inset,38mm - inset),(7mm+inset,19mm),(37mm - inset,19mm),(37mm - inset,38mm - inset)),close:true,stroke:0.65pt+palette.primary)
  smooth(t=>(22mm+radius*calc.cos(t*1rad),19mm - radius*calc.sin(t*1rad)),
    t=>(-radius*calc.sin(t*1rad),-radius*calc.cos(t*1rad)),0,calc.pi,stroke:0.65pt+palette.primary)
 }
 #path(((7.8mm,19.8mm),(36.2mm,19.8mm)),stroke:0.65pt+palette.primary)
 #label((22mm,42mm),[$x$])
 #label((41mm,29mm),[$y$])
]

// Oblique projection: the rear direction is visible, while the ball stays clear of the front edge.
#let tank() = block(width:70mm,height:58mm)[
 #let p(x,y,z)=(7mm+0.7mm*x+0.36mm*y,52mm-0.24mm*y - 0.42mm*z)
 #path((p(50,0,0),p(50,50,0),p(0,50,0)),stroke:hidden)
 #path((p(0,50,0),p(0,50,80)),stroke:hidden)
 #let c=p(20,20,20)
 #let r=10mm
 #place(top+left,dx:c.at(0)-r,dy:c.at(1)-r,circle(radius:r,fill:palette.primary.lighten(90%),stroke:edge))
 #place(top+left,dx:c.at(0)-r,dy:c.at(1)-r/3,ellipse(width:2*r,height:2*r/3,stroke:hidden))
 #path((p(0,0,0),p(50,0,0),p(50,50,0),p(50,50,80),p(0,50,80),p(0,0,80)),close:true)
 #path((p(0,0,80),p(50,0,80),p(50,50,80)))
 #path((p(50,0,0),p(50,0,80)))
]

#let led() = block(width:78mm,height:55mm)[
 #let p(x,y)=(10mm+9mm*x,45mm-9mm*y)
 #arrow-line(p(0,-0.3),p(0,4.8),color:palette.ink,thickness:0.6pt)
 #arrow-line(p(-0.6,0),p(7.3,0),color:palette.ink,thickness:0.6pt)
 #path((p(0,0),p(0,4),p(6,4),p(6,0)),close:true)
 #let i=p(3,1)
 #let h=p(3,2)
 #place(top+left,dx:i.at(0)-9mm,dy:i.at(1)-9mm,circle(radius:9mm,stroke:edge))
 #path((i,h),stroke:hidden)
 #for point in (i,h) {place(top+left,dx:point.at(0)-0.5mm,dy:point.at(1)-0.5mm,circle(radius:0.5mm,fill:palette.primary,stroke:none))}
 #for (point,t,dx,dy) in ((p(0,0),[$A$],-3mm,4mm),(p(0,4),[$B$],-3mm,0mm),(p(6,4),[$C$],3mm,-3mm),(p(6,0),[$D$],3mm,4mm),(h,[$H$],3mm,-3mm),(i,[$I$],4mm,0mm),(p(7.3,0),[$x$],0mm,4mm),(p(0,4.8),[$y$],-3mm,0mm)) {label(point,t,dx:dx,dy:dy)}
]

// The central sphere and eight corner sectors are shown in a common axonometric projection.
#let spheres() = block(width:125mm,height:68mm)[
 #let p(x,y,z)=(23mm+30mm*(calc.cos(30deg)*x - calc.sin(30deg)*y),
   41mm+30mm*(calc.sin(20deg)*calc.sin(30deg)*x+calc.sin(20deg)*calc.cos(30deg)*y - calc.cos(20deg)*z))
 #let vertices=((0,0,0),(1,0,0),(1,1,0),(0,1,0),(0,0,1),(1,0,1),(1,1,1),(0,1,1))
 #path((p(1,0,0),p(0,0,0),p(0,1,0)),stroke:hidden)
 #path((p(0,0,0),p(0,0,1)),stroke:hidden)
 #for v in vertices {
   let c=p(..v)
   // Project the three circular arcs bounding the octant into the cube.
   let inward=v.map(t=>if t==0 {1} else {-1})
   let r=calc.sqrt(3)/2 - 0.4
   let samples=range(21).map(i=>i*90deg/20)
   for (u,w) in ((0,1),(1,2),(2,0)) {
     let pts=samples.map(t=>{
       let a=v
       a.at(u)+=r*inward.at(u)*calc.cos(t)
       a.at(w)+=r*inward.at(w)*calc.sin(t)
       p(..a)
     })
     path((c,)+pts,close:true,stroke:edge,fill:palette.primary.lighten(91%))
   }
 }
 #let center=p(0.5,0.5,0.5)
 #let radius=0.4*30mm
 #place(top+left,dx:center.at(0)-radius,dy:center.at(1)-radius,circle(radius:radius,stroke:edge,fill:palette.primary.lighten(86%)))
 #path((p(1,0,0),p(1,1,0),p(0,1,0),p(0,1,1),p(0,0,1),p(1,0,1)),close:true)
 #path((p(1,0,1),p(1,1,1),p(0,1,1)))
 #path((p(1,1,0),p(1,1,1)))
 #label(center,[$O_0$])
 #place(top+left,dx:63mm,dy:0mm,block(width:60mm,height:68mm)[
   #for (i,v) in vertices.enumerate() {
     path((center,p(..v)),stroke:hidden)
   }
   #path((p(1,0,0),p(1,1,0),p(0,1,0),p(0,1,1),p(0,0,1),p(1,0,1)),close:true)
   #path((p(1,0,1),p(1,1,1),p(0,1,1)))
   #path((p(1,1,0),p(1,1,1)))
   #path((p(1,0,0),p(0,0,0),p(0,1,0)),stroke:hidden)
   #path((p(0,0,0),p(0,0,1)),stroke:hidden)
   #for (i,v) in vertices.enumerate() {
     label(p(..v),[$O_#(i+1)$],dy:if v.at(2)==1 {-3mm} else {3mm})
   }
   #label(center,[$O_0$],dx:4mm)
 ])
]
