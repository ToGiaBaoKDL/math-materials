#let widths=("flight-departure":103mm,"flight-airport":103mm,"cable":88mm,"roof-house":112mm,"roof-house-solution":112mm,"shifted-warehouse":112mm,"shifted-warehouse-solution":112mm,"motion-half":95mm,"motion-full":95mm,"room-simple":104.7375mm,"room-simple-solution":104.7375mm,"room-hanging":95mm,"warehouse-coordinates":115mm,"warehouse":115mm,"warehouse-solution":115mm,"cabin":90mm,"hanging-ball":92.4mm,"hanging-ball-solution":92.4mm,"balloon":100mm,"drones":100mm,"velocity":95mm)
#let diagram(name)=image("figures/generated/"+name+".png",width:widths.at(name))
#let compact = sys.inputs.at("variant", default:"de") == "de"
#let answer-scale=if sys.inputs.at("variant",default:"de")=="dap-an" {0.9025} else if sys.inputs.at("variant",default:"de")=="de-cach" {0.95} else {1}
#let figure-scale(name)=answer-scale * (if ("roof-house","roof-house-solution").contains(name) {100%} else if compact {84%} else {105%})
#let fig(name, width:none)=block(width:100%,breakable:false,above:if name=="velocity" {8mm} else if compact {3mm} else {5mm},below:if compact {2mm} else {4mm},align(center,scale(x:figure-scale(name),y:figure-scale(name),reflow:true,{
 if name=="aircraft-us" {image("figures/aircraft-us.jpg",width:if width==none {82mm} else {width})}
 else if name=="aircraft-radar" {image("figures/aircraft-radar.jpg",width:if width==none {82mm} else {width})}
 else if name=="cabin" {grid(columns:(70mm,90mm),column-gutter:5mm,row-gutter:2mm,align:horizon,
  image("figures/wooden-cabins.jpg",width:70mm), diagram(name),
  align(center)[Hình 1], align(center)[Hình 2])}
 else if width != none {image("figures/generated/"+name+".png",width:width)}
 else {diagram(name)}
})))
