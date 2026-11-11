#let figure(name,width:78mm)=block(width:100%,above:3mm,below:2mm,align(center,image("../figures/"+name,width:width)))
#let figure-beside(name,body)=block(width:100%,above:1mm,below:2mm,breakable:false)[
 #grid(columns:(1fr,65mm),gutter:5mm,align:(left+top,center+top),body,image("../figures/"+name,width:65mm))
]
