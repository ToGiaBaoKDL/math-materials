#let widths=("flight-departure":103mm,"flight-airport":103mm,"cable":88mm,"roof-house":100mm,"roof-house-solution":100mm,"shifted-warehouse":100mm,"shifted-warehouse-solution":100mm,"motion-half":95mm,"motion-full":95mm,"room-simple":95mm,"room-simple-solution":95mm,"room-hanging":95mm,"warehouse-coordinates":100mm,"warehouse":100mm,"warehouse-solution":100mm,"cabin":90mm,"hanging-ball":70mm,"hanging-ball-solution":70mm,"balloon":100mm,"drones":100mm,"velocity":95mm)
#let diagram(name)=image("figures/generated/"+name+".png",width:widths.at(name))
#let compact = sys.inputs.at("variant", default:"de") == "de"
#let fig(name, width:none)=block(width:100%,breakable:false,above:if compact {3mm} else {5mm},below:if compact {2mm} else {4mm},align(center,scale(x:if compact {80%} else {100%},y:if compact {80%} else {100%},reflow:true,{
 if name=="aircraft-us" {image("figures/aircraft-us.jpg",width:82mm)}
 else if name=="aircraft-radar" {image("figures/aircraft-radar.jpg",width:82mm)}
 else if name=="cabin" {grid(columns:(70mm,90mm),column-gutter:5mm,row-gutter:2mm,align:horizon,
  image("figures/wooden-cabins.jpg",width:70mm), diagram(name),
  align(center)[Hình 1], align(center)[Hình 2])}
 else if width != none {image("figures/generated/"+name+".png",width:width)}
 else {diagram(name)}
})))
