#import "/templates/drawing.typ": path, label as raw-label, smooth
#let label(p,t,..args)=raw-label(p,t,width:24mm,..args)
#let blue=rgb("#0077C8")
#let orange=rgb("#C45A00")
#let green=rgb("#008F78")
#let lime=rgb("#BFFF36")
#let pink=rgb("#FF91A4")
#let cyan=rgb("#55DCE5")
#let edge=1pt+blue
#let dashed=(paint:blue,thickness:0.8pt,dash:"dashed")
#let tag(p,t,dx:0mm,dy:0mm)={
 place(top+left,dx:p.at(0)-0.45mm,dy:p.at(1)-0.45mm,circle(radius:0.45mm,fill:blue,stroke:none))
 label(p,t,dx:dx,dy:dy)
}
#let route-arrow(a,b,color)={
 path((a,b),stroke:1.2pt+color)
 let dx=(b.at(0)-a.at(0))/1mm; let dy=(b.at(1)-a.at(1))/1mm
 let length=calc.sqrt(dx*dx+dy*dy)
 let ux=dx/length; let uy=dy/length
 path(((b.at(0)-2.5mm*ux+1mm*uy,b.at(1)-2.5mm*uy - 1mm*ux),b,
 (b.at(0)-2.5mm*ux - 1mm*uy,b.at(1)-2.5mm*uy+1mm*ux)),stroke:1.2pt+color)
}
#let diagram(kind)=block(width:140mm,height:if kind=="coaster" {66mm} else {58mm},above:if kind=="coaster" {8mm} else {3mm},below:2mm)[
 #set text(size:11pt)
 #if kind=="river" {
  let a=(22mm,8mm);let c=(22mm,43mm);let b=(115mm,43mm);let d=(67mm,43mm)
  path((a,c,b),close:true,fill:rgb("#B5E9DE"),stroke:none)
  path((c,b),stroke:(paint:rgb("#204B61"),thickness:1pt,dash:"dashed"));route-arrow(a,c,rgb("#204B61"));route-arrow(a,d,rgb("#C12667"));route-arrow(a,b,rgb("#204B61"))
  path(((22mm,40mm),(25mm,40mm),(25mm,43mm)),stroke:edge)
  for (p,t,dx,dy) in ((a,[$A$],0mm,-3mm),(b,[$B$],2mm,4mm),(c,[$C$],-2mm,4mm),(d,[$D$],0mm,4mm)) {tag(p,t,dx:dx,dy:dy)}
  label((12mm,25mm),[4 km]);label((71mm,54mm),[10 km])
 } else if kind=="garden" {
  let a=(43mm,9mm);let b=(92mm,9mm);let c=(116mm,43mm);let d=(19mm,43mm)
  path(((10mm,43mm),(130mm,43mm),(130mm,53mm),(10mm,53mm)),close:true,fill:rgb("#B5E9DE"),stroke:none)
  path((a,b,c,d),close:true,fill:pink,stroke:1pt+green)
  for (p,t,dx,dy) in ((a,[$A$],0mm,-4mm),(b,[$B$],0mm,-4mm),(c,[$C$],3mm,3mm),(d,[$D$],-3mm,3mm)) {tag(p,t,dx:dx,dy:dy)}
  label((68mm,3mm),[$a$ (m)]);label((25mm,24mm),[$a$ (m)]);label((111mm,24mm),[$a$ (m)])
 } else if kind=="net" {
  let edge=1pt+rgb("#326A31")
  let dashed=(paint:rgb("#326A31"),thickness:0.8pt,dash:"dashed")
  let p(x,y)=(6mm+x*1.4mm,5mm+y*1.4mm)
  path((p(0,0),p(30,0),p(30,30),p(0,30)),close:true,stroke:edge,fill:pink)
  let center=(p(15,5),p(25,15),p(15,25),p(5,15))
  for (a,b,c) in ((p(0,0),center.at(0),center.at(3)),(p(30,0),center.at(1),center.at(0)),(p(30,30),center.at(2),center.at(1)),(p(0,30),center.at(3),center.at(2))) {path((a,b,c),close:true,fill:lime,stroke:edge)}
  path(center,close:true,fill:rgb("#7DD925"),stroke:dashed)
  label((27mm,53mm),[30 m]);label((65mm,27mm),[$arrow.r$])
  let a=(84mm,46mm);let b=(116mm,46mm);let c=(130mm,30mm);let d=(98mm,30mm);let s=(108mm,5mm)
  path((a,b,s),close:true,fill:lime,stroke:edge);path((b,c,s),close:true,fill:rgb("#7DD925"),stroke:edge)
  path((a,d,c),stroke:dashed);path((d,s),stroke:dashed)
 } else if kind=="prism" {
  let cinnamon=rgb("#7B3F00")
  let edge=1.2pt+rgb("#482500")
  let dashed=(paint:rgb("#482500"),thickness:1pt,dash:"dashed")
  let folds=(paint:rgb("#FFF3D6"),thickness:1.2pt,dash:"dashed")
  let a=(7mm,8mm);let b=(61mm,8mm);let c=(61mm,44mm);let d=(7mm,44mm)
  path((a,b,c,d),close:true,fill:cinnamon,stroke:none)
  path((a,b,c,d,a),stroke:edge)
  for x in (25mm,43mm) {path(((x,8mm),(x,44mm)),stroke:folds)}
  for (p,t,dx,dy) in ((a,[$A$],-2mm,-3mm),(b,[$B$],2mm,-3mm),(c,[$C$],2mm,4mm),(d,[$D$],-2mm,4mm),((25mm,8mm),[$E$],0mm,-3mm),((25mm,44mm),[$F$],0mm,4mm),((43mm,8mm),[$G$],0mm,-3mm),((43mm,44mm),[$H$],0mm,4mm)) {tag(p,t,dx:dx,dy:dy)}
  label((34mm,54mm),[60 cm]);label((1mm,26mm),[40 cm]);label((72mm,27mm),[$arrow.r$])
  let a=(88mm,41mm);let b=(117mm,41mm);let c=(102.5mm,17mm);let shift=(12mm,-10mm)
  let up(p)=(p.at(0)+shift.at(0),p.at(1)+shift.at(1))
  path((a,b,up(b),up(a)),close:true,fill:cinnamon,stroke:edge)
  path((b,c,up(c),up(b)),close:true,fill:pink,stroke:edge)
  path((a,c,up(c)),stroke:edge);path((up(a),up(c)),stroke:dashed)
  for (pt,t,dx,dy) in ((a,[$F$],-2mm,3mm),(b,[$H$],2mm,3mm),(c,[$D equiv C$],-4mm,-3mm),(up(a),[$E$],-3mm,0mm),(up(b),[$G$],3mm,0mm),(up(c),[$A equiv B$],2mm,-3mm)) {tag(pt,t,dx:dx,dy:dy)}
 } else if kind=="lake" {
  let p(t)=(70mm+43mm*calc.cos(t),47mm-43mm*calc.sin(t))
  let a=p(180deg);let b=p(0deg);let q=p(65deg)
  smooth(t=>p(t*1rad),t=>(-43mm*calc.sin(t*1rad),-43mm*calc.cos(t*1rad)),0,calc.pi,stroke:1.5pt+green,fill:rgb("#C2EEE4"),close:true)
  path((a,b),stroke:edge);path((a,q),stroke:1.3pt+orange)
  let v=(q.at(0)-a.at(0),q.at(1)-a.at(1))
  let tip=(a.at(0)+0.64*v.at(0),a.at(1)+0.64*v.at(1))
  path(((tip.at(0)-3mm,tip.at(1)+0.3mm),tip,(tip.at(0)-0.5mm,tip.at(1)+3mm)),stroke:1pt+orange)
  let tip2=p(28deg)
  path(((tip2.at(0)-2.5mm,tip2.at(1)-1mm),tip2,(tip2.at(0)+0.6mm,tip2.at(1)-3mm)),stroke:1pt+green)
  path(((70mm,47mm),q),stroke:dashed)
  tag(a,[$P$],dx:-3mm,dy:3mm);tag(b,[$R$],dx:3mm,dy:3mm);tag(q,[$Q$],dy:-4mm);tag((70mm,47mm),[$O$],dy:4mm)
  label((89mm,51mm),[2 km]);label((51mm,21mm),[Chèo thuyền]);label((117mm,23mm),[Chạy bộ])
 } else if kind=="coaster" {
  place(top+left,dx:-12mm,dy:1mm,image("coaster-photo.png",width:72mm,height:48mm,fit:"contain"))
  let p(x,y)=(82mm+x*0.59mm,47mm-y*0.91mm)
  path((p(0,46),p(0,0),p(96,0)),stroke:0.7pt+black)
  let f(x)=30 - x*(x - 50)*(x - 80)/1500
  smooth(t=>p(t,f(t)),t=>(0.59mm,-0.91mm*(-3*t*t+260*t - 4000)/1500),0,89,stroke:1.4pt+blue)
  for (x,y) in ((0,30),(20,6),(50,30),(80,30)) {path((p(x,0),p(x,y),p(0,y)),stroke:(paint:green,dash:"dashed",thickness:0.6pt))}
  for (pt,t,dx,dy) in ((p(0,30),[$A$],2mm,-3mm),(p(50,30),[$C$],-1mm,-3mm),(p(80,30),[$D$],2mm,-3mm),(p(0,0),[$O$],-2mm,3mm)) {tag(pt,t,dx:dx,dy:dy)}
  for (pt,t) in ((p(50,-4),[50]),(p(80,-4),[80]),(p(-5,6),[6]),(p(-5,30),[30]),(p(96,-3),[$x$]),(p(-3,46),[$y$])) {label(pt,t)}
  label((24mm,62mm),[Hình 1]);label((112mm,62mm),[Hình 2])
 }
]
