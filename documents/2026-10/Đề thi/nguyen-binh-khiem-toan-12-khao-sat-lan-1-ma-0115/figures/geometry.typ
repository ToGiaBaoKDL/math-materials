#import "/templates/drawing.typ": path, label, solid-path
#import "/templates/theme.typ": exam-palette as palette
#import "/templates/pyramid-net.typ": pyramid-net
#let net() = scale(120%, reflow:true, pyramid-net(labels:true,folded:false,edge-width:1.25pt))
#let shaded-square() = block(width:54mm,height:51mm)[
 #let p(x,y)=(7mm+x*10mm,5mm+y*10mm)
 #let regions = (((0.8,0),(3.2,0),(2,1.2)),((4,0.8),(4,3.2),(2.8,2)),((0.8,4),(3.2,4),(2,2.8)),((0,0.8),(0,3.2),(1.2,2)),((2,1.2),(2.8,2),(2,2.8),(1.2,2)))
 #for pts in regions { path(pts.map(t=>p(..t)),close:true,fill:palette.primary.lighten(65%),stroke:none) }
 // Paint each full diagonal once; the region borders must not overlap the outline.
 #for pts in (((0.8,0),(4,3.2)),((3.2,0),(0,3.2)),((0,0.8),(3.2,4)),((4,0.8),(0.8,4))) {
  solid-path(pts.map(t=>p(..t)),thickness:1.5pt,color:palette.primary)
 }
 #solid-path((p(0,0),p(4,0),p(4,4),p(0,4)),close:true,thickness:1.5pt,color:palette.primary)
 #for (pt,t) in ((p(0,0),[$A$]),(p(4,0),[$B$]),(p(4,4),[$C$]),(p(0,4),[$D$])) {label(pt,t,dx:if pt.at(0)==7mm {-3mm} else {3mm})}
]
