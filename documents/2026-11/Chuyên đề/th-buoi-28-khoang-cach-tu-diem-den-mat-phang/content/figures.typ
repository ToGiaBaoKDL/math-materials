#let figure(name)=block(width:100%,breakable:false,above:2mm,below:3mm)[
#if name=="image88.svg" {
 grid(columns:(1fr,1fr),gutter:5mm,align:center+horizon,image("../figures/"+name,width:65mm),[#image("../figures/image88-base.svg",width:55mm) #linebreak() #text(size:11pt)[Mặt phẳng hóa đáy]])
}else{align(center,image("../figures/"+name,width:if ("image10.svg","image14.svg").contains(name) {70mm}else if name=="image25.svg" {72mm}else if name=="image220.svg" {65mm}else if ("image271.svg","image301.svg").contains(name) {72mm}else if name=="image413.svg" {62mm}else{58mm}))}
]
