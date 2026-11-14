#let figure(name)=block(width:100%,breakable:false,above:2mm,below:2mm)[
#if ("image101.svg","image155.svg").contains(name) {
 grid(columns:(1fr,1fr),gutter:5mm,align:center+horizon,image("../figures/"+name,width:65mm),image("../figures/"+name.replace(".svg","-base.svg"),width:55mm))
}else{align(center,image("../figures/"+name,width:if ("image5.svg","image27.svg").contains(name) {49mm}else if ("image40.svg","practice1.svg").contains(name) {48mm}else if name=="image392.svg" {70mm}else{58mm}))}
]
