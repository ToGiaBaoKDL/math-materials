#import "/templates/drawing.typ": path as draw-path, label as draw-label, smooth as draw-smooth, arrow-line
#import "/templates/theme.typ": palette, lesson-style
#let smooth(point,tangent,start,end,..args)=draw-smooth(t=>point(t*1rad),t=>tangent(t*1rad),start/1rad,end/1rad,..args)
#let edge = 1.1pt + palette.primary
#let hidden = (paint:palette.primary, thickness:1.1pt, dash:"dashed")
#let path = draw-path.with(stroke:edge)
#let label(p,t,dx:0mm,dy:0mm,width:12mm) = draw-label(p,t,dx:dx,dy:dy,width:width)
#let dot(p) = place(top+left,dx:p.at(0)-0.55mm,dy:p.at(1)-0.55mm,circle(radius:0.55mm,fill:palette.primary,stroke:none))
#let axes(p,x,y,z)={
 for (v,t,dx,dy) in ((x,[$x$],-2mm,2mm),(y,[$y$],2mm,2mm),(z,[$z$],-2mm,-2mm)) {
  arrow-line(p,v,color:palette.ink,thickness:0.65pt)
  label(v,t,dx:dx,dy:dy)
 }
}
#let flight(kind:"departure") = block(width:92mm,height:67mm)[
 #let o=(24mm,42mm)
 #let n=(64mm,54mm)
 #let m=(64mm,19mm)
 #let a=(11mm,54mm)
 #let b=(77mm,42mm)
 #let c=(24mm,7mm)
 #axes(o,(4.5mm,60mm),(86mm,42mm),(24mm,3mm))
 #path((o,m))
 #path((o,n),stroke:hidden)
 #path((a,n,b),stroke:hidden)
 #path((n,m,c),stroke:hidden)
 #for (p,t,dx,dy) in ((o,[$O$],-3mm,-3mm),(m,[$M$],3mm,-2mm),(n,if kind=="airport" {[$H$]} else {[$N$]},3mm,3mm),(a,[$A$],-3mm,0mm),(b,[$B$],0mm,4mm),(c,[$C$],-3mm,0mm)) {label(p,t,dx:dx,dy:dy)}
 #dot(m)
 #let arc(a,b,r)=smooth(t=>(o.at(0)+r*calc.cos(t),o.at(1)+r*calc.sin(t)),
  t=>(-r*calc.sin(t),r*calc.cos(t)),a,b,stroke:0.55pt+palette.primary)
 #if kind=="airport" {
  arc(17deg,137deg,4mm)
  arc(-30deg,17deg,8mm)
  label((20mm,51mm),[$64°$])
  label((37mm,39mm),[$48°$])
  label((46mm,26mm),[$50$])
 } else {
  arc(-90deg,-30deg,6mm)
  arc(0deg,17deg,12mm)
  label((30mm,30mm),[$65°$])
  label((43mm,43mm),[$32°$])
  label((48mm,26mm),[$14$])
 }
]
#let cable() = block(width:88mm,height:66mm)[
 #let o=(28mm,42mm)
 #let a=(28mm,7mm)
 #let b=(64mm,53mm)
 #axes(o,(10mm,58.5mm),(81mm,42mm),(28mm,3mm))
 #path((a,b)); #path((o,b))
 #path(((16mm,53mm),b,(76mm,42mm)),stroke:hidden)
 #label(a,[$A$],dx:-3mm)
 #label(o,[$O$],dx:-3mm,dy:-3mm)
 #label(b,[$B$],dx:3mm,dy:3mm)
 #label((16mm,53mm),[$K$],dx:-3mm)
 #label((76mm,42mm),[$H$],dy:-3mm)
 #label((21mm,25mm),[10 m],width:16mm)
 #label((47mm,58mm),[15 m],width:16mm)
 #label((42mm,38mm),[$30°$])
 #smooth(t=>(28mm+12mm*calc.cos(t),42mm+12mm*calc.sin(t)),t=>(-12mm*calc.sin(t),12mm*calc.cos(t)),0deg,17deg,stroke:0.55pt+palette.primary)
]
// A front x-z face, rear y direction, and one common projection for every edge/label.
#let warehouse(kind:"coordinates",solution:false) = block(width:112mm,height:84mm)[
 #let depth=if kind=="coordinates" {5} else {6}
 #let wall=if kind=="coordinates" {3} else {5}
 #let ridge=if kind=="coordinates" {4} else {7}
 #let p(x,y,z)=(24mm+9mm*x+22.2mm*y/depth,73mm - 18mm*y/depth - 32.5mm*z/wall)
 #let pts=(O:p(0,0,0),A:p(4,0,0),B:p(4,depth,0),C:p(0,depth,0),E:p(0,0,wall),F:p(4,0,wall),G:p(4,depth,wall),H:p(0,depth,wall),P:p(2,0,ridge),Q:p(2,depth,ridge))
 #path((pts.E,pts.P,pts.Q,pts.H),close:true,fill:lesson-style.plane-mint,stroke:none)
 #path((pts.P,pts.F,pts.G,pts.Q),close:true,fill:lesson-style.plane-sand,stroke:none)
 #path((pts.O,pts.C,pts.B),stroke:hidden)
 #path((pts.C,pts.H),stroke:hidden)
 #path((pts.H,pts.G),stroke:hidden)
 #path((pts.O,pts.A,pts.B,pts.G,pts.Q,pts.H,pts.E),close:true)
 #path((pts.E,pts.P,pts.F,pts.A)); #path((pts.F,pts.G)); #path((pts.P,pts.Q)); #path((pts.E,pts.F))
 #axes(pts.O,p(5.5,0,0),p(0,1.25*depth,0),p(0,0,1.8*wall))
 #let names=if kind=="coordinates" {
  (O:[$O(0;0;0)$],B:[$B(4;5;0)$],E:[$E(0;0;3)$],G:[$G(4;5;3)$],P:[$P(2;0;4)$],Q:[$Q(2;5;4)$])
 } else {(:)}
 #for (name,pos) in pts {
  let label-body=names.at(name,default:eval("$"+name+"$",mode:"markup"))
  let dx=if name=="E" {if kind=="coordinates" {-9mm} else {-3mm}} else if ("B","G").contains(name) {if kind=="coordinates" {9mm} else {3mm}} else if name=="P" {if kind=="coordinates" {-8mm} else {-3mm}} else {0mm}
  let dy=if ("O","A","B","C").contains(name) {4mm} else if ("P","Q").contains(name) {-4mm} else {-1mm}
  label(pos,label-body,dx:dx,dy:dy,width:30mm)
 }
 #if solution {
  let m=p(3,6,6)
  path((pts.E,pts.H,m),stroke:hidden)
  path((pts.P,p(2,0,5)),stroke:hidden)
  dot(m);label(m,[$M$],dx:4mm,dy:-1mm)
  label(p(2,0,5),[$I$],dy:3mm)
 }
]
#let shifted-warehouse(solution:false) = block(width:100mm,height:82mm)[
 #let p(x,y,z)=(32mm-4mm*x+6mm*y,65mm+2.4mm*x - 6mm*z)
 #let pts=(O:p(0,0,0),A:p(2,0,0),B:p(2,6,0),C:p(-6,6,0),D:p(-6,0,0),E:p(2,0,5),F:p(2,6,5),G:p(-6,6,5),H:p(-6,0,5),P:p(2,3,7),Q:p(-6,3,7),T:p(-6,3,0),K:p(0,0,5))
 #path((pts.E,pts.P,pts.Q,pts.H),close:true,fill:lesson-style.plane-mint,stroke:none)
 #path((pts.P,pts.F,pts.G,pts.Q),close:true,fill:lesson-style.plane-sand,stroke:none)
 #path((pts.O,pts.D,pts.C),stroke:hidden); #path((pts.D,pts.H),stroke:hidden); #path((pts.H,pts.G),stroke:hidden)
 #path((pts.A,pts.B,pts.C,pts.G,pts.Q,pts.H,pts.E),close:true)
 #path((pts.E,pts.P,pts.F,pts.B)); #path((pts.F,pts.G)); #path((pts.P,pts.Q)); #path((pts.E,pts.F)); #path((pts.Q,pts.T),stroke:hidden)
 #axes(pts.O,p(5,0,0),p(0,9,0),p(0,0,9))
 #for (name,pos) in pts {
  label(pos,eval("$"+name+"$",mode:"markup"),dx:if ("E","K","O").contains(name) {-3mm} else if ("G","C").contains(name) {3mm} else {0mm},dy:if ("A","B","D","T").contains(name) {4mm} else {-3mm})
 }
 #if solution {
  let l=p(-2,6,5)
  path((pts.O,pts.K,l),stroke:hidden);dot(l);label(l,[$L$],dy:-3mm)
  path((pts.T,p(0,3,0)),stroke:hidden)
  path((pts.C,p(0,6,0)),stroke:hidden)
  label(p(0,3,0),[$M$],dy:4mm);label(p(0,6,0),[$N$],dy:4mm)
 }
]
#let roof-house(solution:false) = block(width:98mm,height:75mm)[
 #let p(x,y,z)=(28mm-17mm*x+48mm*y,51mm+13mm*x - 41mm*z)
 #let pts=(O:p(0,0,0),M:p(1,0,0),N:p(1,1,0),K:p(0,1,0),A:p(0,0,0.75),B:p(1,0,0.75),C:p(1,1,0.75),D:p(0,1,0.75),S:p(0.5,0.5,1))
 #path((pts.B,pts.C,pts.S),close:true,fill:lesson-style.plane-sand,stroke:none)
 #path((pts.C,pts.D,pts.S),close:true,fill:lesson-style.plane-mint,stroke:none)
 #path((pts.M,pts.O,pts.K),stroke:hidden); #path((pts.O,pts.A),stroke:hidden); #path((pts.B,pts.A,pts.D),stroke:hidden); #path((pts.A,pts.S),stroke:hidden)
 #path((pts.M,pts.N,pts.K,pts.D,pts.S,pts.B),close:true)
 #path((pts.B,pts.C,pts.D)); #path((pts.S,pts.C)); #path((pts.C,pts.N))
 #axes(pts.O,p(1.3,0,0),p(0,1.28,0),p(0,0,1.16))
 #for (name,pos) in pts {label(pos,eval("$"+name+"$",mode:"markup"),dx:if ("A","B","M","O").contains(name) {-3mm} else {3mm},dy:if ("N","K").contains(name) {3mm} else {-2mm})}
 #label(p(1,0.5,0),[1200 cm],dy:5mm,width:25mm)
 #label(p(0.5,1,0),[900 cm],dx:7mm,dy:4mm,width:22mm)
 #label(p(0,1,0.4),[450 cm],dx:10mm,width:22mm)
 #if solution {
  let i=p(0.5,0.5,0.75);let h=p(0.5,0.5,0)
  path((pts.B,pts.D),stroke:hidden);path((pts.S,h),stroke:hidden)
  dot(i);dot(h);label(i,[$I$],dx:3mm);label(h,[$H$],dx:3mm)
 }
]
#let room(kind:"simple",solution:false) = block(width:95mm,height:66mm)[
 #let p(x,y,z)=(28mm-18mm*x+48mm*y,46mm+13mm*x - 31mm*z)
 #let vs=(p(0,0,0),p(1,0,0),p(1,1,0),p(0,1,0),p(0,0,1),p(1,0,1),p(1,1,1),p(0,1,1))
 #path((vs.at(4),vs.at(5),vs.at(6),vs.at(7)),close:true,fill:lesson-style.plane-mint,stroke:none)
 #path((vs.at(1),vs.at(0),vs.at(3)),stroke:hidden);#path((vs.at(0),vs.at(4)),stroke:hidden)
 #path((vs.at(1),vs.at(2),vs.at(3),vs.at(7),vs.at(4),vs.at(5)),close:true)
 #path((vs.at(5),vs.at(6),vs.at(7)));#path((vs.at(2),vs.at(6)))
 #axes(vs.at(0),p(1.25,0,0),p(0,1.22,0),p(0,0,1.32))
 #let named=kind=="hanging" or solution
 #if named {
  let names=if kind=="hanging" {("A","B","C","D","A'","B'","C'","D'")} else {("O","A","B","C","O'","A'","B'","C'")}
  for (j,name) in names.enumerate() {label(vs.at(j),eval("$"+name+"$",mode:"markup"),dx:if (0,1,4,5).contains(j) {-3mm} else {3mm},dy:if j < 4 {3mm} else {-2mm})}
  path((vs.at(4),vs.at(6)),stroke:hidden);path((vs.at(5),vs.at(7)),stroke:hidden)
 }
 #let ceiling=p(0.5,0.5,1)
 #let lamp=p(0.5,0.5,if kind=="hanging" {0.85} else {1})
 #path((ceiling,lamp),stroke:0.6pt+palette.ink)
 #dot(lamp)
 #if solution {label(lamp,[$I$],dy:4mm)}
 #if kind=="simple" {
  label(p(1,0.5,0),[6 m],dy:5mm)
  label(p(0.5,1,0),[8 m],dx:7mm,dy:3mm)
  label(p(1,0,0.5),[3 m],dx:-7mm)
 }
]
#let cabin() = block(width:98mm,height:65mm)[
 #let p(x,y,z)=(27mm-18mm*x+49mm*y,42mm+15mm*x - 32mm*z)
 #let o=p(0,0,0);#let a=p(1,0,0);#let b=p(0.5,0,1)
 #let oo=p(0,1,0);#let aa=p(1,1,0);#let bb=p(0.5,1,1)
 #path((a,b,bb,aa),close:true,fill:lesson-style.plane-sand,stroke:none)
 #path((a,o,oo),stroke:hidden);#path((o,b),stroke:hidden)
 #path((a,aa,oo,bb,b),close:true);#path((bb,aa))
 #axes(o,p(1.35,0,0),p(0,1.25,0),p(0,0,1.22))
 #for (pos,t,dy) in ((o,[$O$],-3mm),(a,[$A$],3mm),(b,[$B$],-3mm),(oo,[$O'$],3mm),(aa,[$A'$],3mm),(bb,[$B'$],-3mm)) {label(pos,t,dy:dy)}
]
#let hanging-ball(solution:false) = block(width:78mm,height:80mm)[
 #if solution {
  let i=(24mm,42mm);let b=(57mm,7mm);let k=(57mm,42mm)
  let d=(24mm,58mm);let e=(24mm,71mm);let h=(57mm,58mm);let o=(57mm,71mm)
  place(top+left,dx:8mm,dy:26mm,circle(radius:16mm,fill:lesson-style.plane-sand,stroke:edge))
  path((e,d,i,k,b));path((e,o,b));path((d,h))
  path((i,b))
  let a=(35mm,30.3mm)
  for (pos,t,dx,dy) in ((i,[$I$],-3mm,0mm),(a,[$A$],-3mm,-3mm),(b,[$B$],3mm,0mm),(k,[$K$],3mm,0mm),(h,[$H$],3mm,0mm),(o,[$O$],3mm,3mm),(d,[$D$],-3mm,0mm),(e,[$E$],-3mm,0mm)) {dot(pos);label(pos,t,dx:dx,dy:dy)}
  label((40mm,39mm),[$r sqrt(2)$],width:20mm)
  label((20mm,50mm),[$r$])
  label((29mm,34mm),[$r$])
 } else {
  let o=(39mm,62mm)
  path(((8mm,16mm),(39mm,7mm),(39mm,62mm),(8mm,72mm)),close:true,fill:lesson-style.plane-mint,stroke:none)
  path(((39mm,7mm),(69mm,21mm),(69mm,76mm),(39mm,62mm)),close:true,fill:lesson-style.plane-sand,stroke:none)
  axes(o,(5mm,73mm),(70mm,77mm),(39mm,3mm))
  let c=(32mm,43mm);let r=13mm
  place(top+left,dx:c.at(0)-r,dy:c.at(1)-r,circle(radius:r,fill:palette.primary.lighten(95%),stroke:edge))
  smooth(t=>(32mm+r*calc.cos(t),43mm+4mm*calc.sin(t)),t=>(-r*calc.sin(t),4mm*calc.cos(t)),180deg,360deg,stroke:hidden)
  smooth(t=>(32mm+r*calc.cos(t),43mm+4mm*calc.sin(t)),t=>(-r*calc.sin(t),4mm*calc.cos(t)),0deg,180deg,stroke:edge)
  let a=(35.5mm,30.5mm);let b=(39mm,14mm)
  path((a,b));dot(a);dot(b)
  label(a,[$A$],dx:-4mm,dy:-2mm);label(b,[$B$],dx:4mm)
  label((28mm,20mm),[30 cm],width:20mm)
  path(((32mm,56mm),(32mm,68mm)),stroke:hidden)
  label((22mm,63mm),[20 cm],width:20mm)
  label(o,[$O$],dx:4mm)
  arrow-line(c,(21mm,47mm),color:palette.primary,thickness:0.65pt,tip:1mm)
  label((27mm,42mm),[$r$])
 }
]
#let balloon() = block(width:100mm,height:68mm)[
 #let o=(29mm,40mm);#let foot=(60mm,53mm);#let balloon-point=(60mm,23mm)
 #axes(o,(8mm,61mm),(88mm,40mm),(29mm,5mm))
 #path(((16mm,53mm),foot,(73mm,40mm)),stroke:hidden);#path((foot,balloon-point),stroke:hidden)
 #place(top+left,dx:54mm,dy:7mm,ellipse(width:12mm,height:14mm,fill:lesson-style.plane-sand,stroke:edge))
 #path(((56mm,19mm),(58mm,23mm),(62mm,23mm),(64mm,19mm)))
 #path(((58mm,23mm),(58mm,25mm),(62mm,25mm),(62mm,23mm)),close:true)
 #label(o,[$O$],dx:-3mm,dy:-3mm)
 #label((8mm,61mm),[Nam],dx:-1mm,dy:5mm,width:18mm)
 #label((88mm,40mm),[Đông],dy:6mm,width:18mm)
 #label((38mm,58mm),[10 km],width:20mm)
 #label((71mm,52mm),[5 km],width:20mm)
 #label((67mm,32mm),[0,4 km],width:20mm)
]
#let drones() = block(width:100mm,height:70mm)[
 #let o=(49mm,43mm);#let a=(76mm,35mm);#let b=(20mm,12mm)
 #axes(o,(13mm,66mm),(92mm,43mm),(49mm,3mm))
 #path((a,(76mm,58mm),(25mm,58mm)),stroke:hidden)
 #path(((76mm,58mm),(95mm,43mm)),stroke:hidden)
 #path((b,(20mm,31mm),(67mm,31mm)),stroke:hidden)
 #path(((20mm,31mm),(3mm,43mm)),stroke:hidden)
 #for (c,t) in ((a,[$A$]),(b,[$B$])) {
  dot(c);label(c,t,dx:3mm,dy:3mm)
  path(((c.at(0)-3mm,c.at(1)-3mm),(c.at(0)+3mm,c.at(1)-7mm)),stroke:0.7pt+palette.ink)
  path(((c.at(0)-3mm,c.at(1)-7mm),(c.at(0)+3mm,c.at(1)-3mm)),stroke:0.7pt+palette.ink)
  for dx in (-3mm,3mm) {for dy in (-3mm,-7mm) {
   place(top+left,dx:c.at(0)+dx - 1.5mm,dy:c.at(1)+dy - 0.5mm,ellipse(width:3mm,height:1mm,stroke:0.5pt+palette.ink))
  }}
 }
 #label(o,[$O$],dx:-3mm,dy:3mm)
]
#let motion(last:"C",ratio:0.5) = block(width:95mm,height:30mm)[
 #let a=(8mm,23mm);#let b=(44mm,14mm)
 #let c=(44mm+36mm*ratio,14mm - 9mm*ratio)
 #arrow-line(a,(89mm,2.75mm),color:palette.primary,thickness:1.1pt)
 #for (p,t) in ((a,[$A$]),(b,[$B$]),(c,eval("$"+last+"$",mode:"markup"))) {dot(p);label(p,t,dy:-4mm)}
]
#let velocity() = block(width:95mm,height:34mm)[
 #arrow-line((9mm,10mm),(31mm,6mm),color:palette.primary,thickness:1.1pt)
 #arrow-line((9mm,29mm),(75mm,17mm),color:palette.primary,thickness:1.1pt)
 #label((5mm,10mm),[$A$],dx:-1mm)
 #label((5mm,29mm),[$B$],dx:-1mm)
 #label((22mm,4mm),[$arrow(a)$])
 #label((48mm,18mm),[$arrow(b)$])
]
