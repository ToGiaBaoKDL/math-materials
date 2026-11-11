#import "/templates/theme.typ": plot-style
#import "/templates/graphs.typ": variation
#let data-table() = block(above:3mm,below:3mm)[
 #set text(size:11.5pt)
 #set par(justify:false)
 #table(columns:(1.35fr,1fr,1fr,1fr,1fr,1fr),align:center+horizon,inset:5pt,stroke:0.6pt,
  table.header(..([Thời gian (phút)],[$[0;20)$],[$[20;40)$],[$[40;60)$],[$[60;80)$],[$[80;100)$]).enumerate().map(((i,c))=>table.cell(fill:plot-style.table-fill,stroke:(left:if i==0 {black}else{white},right:if i==5 {black}else{white},top:black,bottom:black),text(fill:white,weight:"bold",c)))),
  [Số học sinh],[5],[9],[13],[10],[6])
]
#let tank-variation() = block(width:100%,breakable:false,above:3mm,below:3mm)[
 #set par(justify:false)
 #align(center,variation(
  ([$0$],[$root(3,"1,8")$],[$+infinity$]),
  ([$-$],[$+$]),
  ([$+infinity$],[$4439$],[$+infinity$]),
  (1,0,1),
  width:110mm,
 ))
]
