#import "drawing.typ": path, label, diagram-hidden as hidden, solid-path
#import "theme.typ": exam-palette as palette

// A square sheet, four equal corner flaps and its folded square pyramid.
#let pyramid-net(side: none, labels: false, folded: true, edge-width: 0.8pt) = block(width:if folded {115mm} else {49mm},height:if folded {53mm} else {48mm})[
 #let a=(5mm,5mm)
 #let b=(5mm,41mm)
 #let c=(41mm,41mm)
 #let d=(41mm,5mm)
 #let e=(16mm,23mm)
 #let f=(23mm,30mm)
 #let g=(30mm,23mm)
 #let h=(23mm,16mm)
  #for pts in ((a,e,h),(b,f,e),(c,g,f),(d,h,g)) {
   path(pts,close:true,fill:palette.primary.lighten(80%),stroke:none)
 }
 #path((e,f,g,h),close:true,fill:palette.geometry-tint,stroke:none)
 #for pts in ((e,a,h),(f,b,e),(g,c,f),(h,d,g)) {
   path(pts,stroke:(paint:palette.primary,thickness:edge-width,dash:"dashed"))
 }
 #solid-path((e,f,g,h),close:true,thickness:edge-width,color:palette.primary)
 #solid-path((a,b,c,d),close:true,thickness:edge-width,color:palette.primary)
 #if side != none { label((23mm,45mm),side) }
 #if labels {
  for (pt,name,dx,dy) in ((a,[$A$],-2mm,-2mm),(b,[$B$],-2mm,2mm),(c,[$C$],2mm,2mm),(d,[$D$],2mm,-2mm),(e,[$E$],-3mm,0mm),(f,[$F$],0mm,3mm),(g,[$G$],3mm,0mm),(h,[$H$],0mm,-3mm)) { label(pt,name,dx:dx,dy:dy) }
 }
 #if folded [
 #place(top+left,dx:51mm,dy:23mm,[$arrow.r$])
 // The base edge is 7√2; the unfolded lateral edge has squared length 18²+11².
 #let base=7*calc.sqrt(2)
 #let height=calc.sqrt(18*18+11*11-7*7)
 #let project(x,y,z)=(85mm+1.8mm*(0.95*x - 0.48*y),40mm+1.8mm*(0.25*x+0.48*y - z))
 #let s=project(0,0,height)
 #let p=project(-base/2,base/2,0)
 #let q=project(base/2,base/2,0)
 #let r=project(base/2,-base/2,0)
 #let t=project(-base/2,-base/2,0)
 #path((p,q,s),close:true,fill:palette.primary.lighten(80%),stroke:edge-width+palette.primary)
 #path((q,r,s),close:true,fill:palette.primary.lighten(65%),stroke:edge-width+palette.primary)
 // Translucent base uses the same tint as EFGH in the net.
 #path((p,q,r,t),close:true,fill:palette.geometry-tint.transparentize(20%),stroke:none)
 #path((p,q,r),stroke:edge-width+palette.primary)
 #path((q,s),stroke:edge-width+palette.primary)
 #path((p,t,r),stroke:(paint:palette.primary,thickness:edge-width,dash:"dashed"))
 #path((p,r),stroke:(paint:palette.primary,thickness:edge-width,dash:"dashed"))
 #path((t,s),stroke:(paint:palette.primary,thickness:edge-width,dash:"dashed"))
 ]
]
