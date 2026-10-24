#import "/templates/drawing.typ": path as draw-path, label as draw-label, smooth as draw-smooth, arrow-line
#import "/templates/theme.typ": exam-palette as palette
#import "/templates/pyramid-net.typ": pyramid-net
#let edge = 1.2pt + palette.primary
#let hidden = (paint:palette.primary,thickness:1.2pt,dash:"dashed")
#let path = draw-path.with(stroke:edge)
#let smooth = draw-smooth.with(stroke:edge)
#let label(point, body, ..args) = draw-label(point, box(fill:white,inset:0.35mm,body), ..args)
#let pyramid() = pyramid-net(side: [6 dm],edge-width:1.2pt)

#let window() = block(width:45mm,height:45mm)[
 #path(((7mm,38mm),(7mm,19mm),(37mm,19mm),(37mm,38mm)),close:true,stroke:none,fill:palette.geometry-yellow.lighten(22%))
 #smooth(t=>(22mm+15mm*calc.cos(t*1rad),19mm - 15mm*calc.sin(t*1rad)),
   t=>(-15mm*calc.sin(t*1rad),-15mm*calc.cos(t*1rad)),0,calc.pi,stroke:none,fill:palette.geometry-yellow,close:true)
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
 #path((p(0,0,0),p(0,50,0),p(50,50,0)),stroke:hidden)
 #path((p(0,50,0),p(0,50,80)),stroke:hidden)
 #let c=p(20,20,20)
 #let r=10mm
 #place(top+left,dx:c.at(0)-r,dy:c.at(1)-r,circle(radius:r,fill:palette.geometry-blue.lighten(52%),stroke:1.2pt+palette.geometry-blue))
 // A light dashed equator is a shape guide, not a seam on the ball.
 #place(top+left,dx:c.at(0)-r,dy:c.at(1)-r/3,
   ellipse(width:2*r,height:2*r/3,
     stroke:(paint:palette.geometry-blue,thickness:1pt,dash:"dashed")))
 #path((p(0,0,0),p(50,0,0),p(50,50,0),p(50,50,80),p(0,50,80),p(0,0,80)),close:true)
 #path((p(0,0,80),p(50,0,80),p(50,50,80)))
 #path((p(50,0,0),p(50,0,80)))
]

#let led() = block(width:78mm,height:55mm)[
 #let p(x,y)=(10mm+9mm*x,45mm-9mm*y)
 #path((p(0,0),p(0,4),p(6,4),p(6,0)),close:true,stroke:none,fill:palette.geometry-blue.lighten(80%))
 #arrow-line(p(0,-0.3),p(0,4.8),color:palette.ink,thickness:0.6pt)
 #arrow-line(p(-0.6,0),p(7.3,0),color:palette.ink,thickness:0.6pt)
 #path((p(0,0),p(0,4),p(6,4),p(6,0)),close:true,stroke:1.2pt+palette.geometry-blue)
 #let i=p(3,1)
 #let h=p(3,2)
 #place(top+left,dx:i.at(0)-9mm,dy:i.at(1)-9mm,circle(radius:9mm,stroke:1.2pt+palette.geometry-orange,fill:palette.geometry-orange.lighten(40%)))
 #path((i,h),stroke:(paint:palette.geometry-orange,thickness:1.2pt,dash:"dashed"))
 #for point in (i,h) {place(top+left,dx:point.at(0)-0.5mm,dy:point.at(1)-0.5mm,circle(radius:0.5mm,fill:palette.geometry-orange,stroke:none))}
 #for (point,t,dx,dy) in ((p(0,0),[$A$],-3mm,4mm),(p(0,4),[$B$],-3mm,0mm),(p(6,4),[$C$],3mm,-3mm),(p(6,0),[$D$],3mm,4mm),(h,[$H$],3mm,-3mm),(i,[$I$],4mm,0mm),(p(7.3,0),[$x$],0mm,4mm),(p(0,4.8),[$y$],-3mm,0mm)) {label(point,t,dx:dx,dy:dy)}
]

// The central sphere and eight corner sectors are shown in a common axonometric projection.
#let spheres() = block(width:125mm,height:68mm)[
 #let p(x,y,z)=(23mm+30mm*(calc.cos(30deg)*x - calc.sin(30deg)*y),
   41mm+30mm*(calc.sin(20deg)*calc.sin(30deg)*x+calc.sin(20deg)*calc.cos(30deg)*y - calc.cos(20deg)*z))
 #let vertices=((0,0,0),(1,0,0),(1,1,0),(0,1,0),(0,0,1),(1,0,1),(1,1,1),(0,1,1))
 #path((p(1,0,0),p(0,0,0),p(0,1,0)),stroke:hidden)
 #path((p(0,0,0),p(0,0,1)),stroke:hidden)
 #let center=p(0.5,0.5,0.5)
 #let corner-radius=0.37
 // Keep tangency and containment: R + r = sqrt(3)/2 and R <= 1/2.
 #let radius=(calc.sqrt(3)/2 - corner-radius)*30mm
 // An octant is a solid bounded by three quarter-disks and a spherical surface.
 // Its projected convex hull supplies the curved silhouette between those disks.
 #let turn(a,b,c)=(b.at(0)-a.at(0))*(c.at(1)-a.at(1))-(b.at(1)-a.at(1))*(c.at(0)-a.at(0))
 #let hull(points)={
   let pts=points.sorted(key:q=>q.at(0)*10000+q.at(1))
   let half(seq)={
     let out=()
     for q in seq {
       while out.len()>=2 and turn(out.at(-2),out.last(),q)<=0 {let unused=out.pop()}
       out.push(q)
     }
     out.slice(0,-1)
   }
   (half(pts)+half(pts.rev())).map(q=>(q.at(0)*1mm,q.at(1)*1mm))
 }
 #let octant(v)={
   let c=p(..v)
   let inward=v.map(t=>if t==0 {1} else {-1})
   let r=corner-radius
   let pts=((c.at(0)/1mm,c.at(1)/1mm),)
   for i in range(19) {for j in range(19) {
     let a=i*90deg/18
     let b=j*90deg/18
     let unit=(calc.sin(a)*calc.cos(b),calc.sin(a)*calc.sin(b),calc.cos(a))
     let q=p(..range(3).map(k=>v.at(k)+r*inward.at(k)*unit.at(k)))
     pts.push((q.at(0)/1mm,q.at(1)/1mm))
   }}
   path(hull(pts),close:true,stroke:1.2pt+palette.geometry-purple,fill:palette.geometry-purple.lighten(55%))
   // Only the three outward-facing cube planes are visible to the viewer.
   for (u,w,normal) in ((0,1,2),(1,2,0),(2,0,1)) {
     if v.at(normal)==1 {
       let arc=range(33).map(i=>{
         let t=i*90deg/32
         let a=v
         a.at(u)+=r*inward.at(u)*calc.cos(t)
         a.at(w)+=r*inward.at(w)*calc.sin(t)
         p(..a)
       })
       path((c,)+arc,close:true,stroke:1.2pt+palette.geometry-purple,fill:palette.geometry-purple.lighten(if normal==2 {82%} else if normal==0 {68%} else {55%}))
     }
   }
 }
 #let depth(v)=0.47*v.at(0)+0.814*v.at(1)+0.342*v.at(2)
 #let middle=depth((0.5,0.5,0.5))
 #for v in vertices.sorted(key:depth).filter(v=>depth(v) < middle) {octant(v)}
 #place(top+left,dx:center.at(0)-radius,dy:center.at(1)-radius,circle(radius:radius,stroke:1.2pt+palette.geometry-purple,fill:palette.geometry-purple.lighten(85%)))
 #for v in vertices.sorted(key:depth).filter(v=>depth(v) > middle) {octant(v)}
 #path((p(1,0,0),p(1,1,0),p(0,1,0),p(0,1,1),p(0,0,1),p(1,0,1)),close:true)
 #path((p(1,0,1),p(1,1,1),p(0,1,1)))
 #path((p(1,1,0),p(1,1,1)))
 #draw-label(center,[$O_0$],dx:-5mm,dy:3mm)
 #place(top+left,dx:63mm,dy:0mm,block(width:60mm,height:68mm)[
   #for (i,v) in vertices.enumerate() {
     path((center,p(..v)),stroke:(paint:palette.geometry-purple,thickness:1.45pt,dash:"dashed"))
   }
   #path((p(1,0,0),p(1,1,0),p(0,1,0),p(0,1,1),p(0,0,1),p(1,0,1)),close:true)
   #path((p(1,0,1),p(1,1,1),p(0,1,1)))
   #path((p(1,1,0),p(1,1,1)))
   #path((p(1,0,0),p(0,0,0),p(0,1,0)),stroke:hidden)
   #path((p(0,0,0),p(0,0,1)),stroke:hidden)
   // White-centered markers remain legible where several dashed segments meet.
   #for point in vertices.map(v=>p(..v)) + (center,) {
     place(top+left,dx:point.at(0)-0.85mm,dy:point.at(1)-0.85mm,
       circle(radius:0.85mm,fill:white,stroke:0.85pt+palette.geometry-purple))
   }
   #for (i,v) in vertices.enumerate() {
     label(p(..v),[$O_#(i+1)$],dy:if v.at(2)==1 {-3mm} else {3mm})
   }
   #label(center,[$O_0$],dx:4mm)
 ])
]
