#let widths=("flight-departure":92mm,"flight-airport":92mm,"cable":88mm,"roof-house":100mm,"roof-house-solution":100mm,"shifted-warehouse":100mm,"shifted-warehouse-solution":100mm,"motion-half":95mm,"motion-full":95mm,"room-simple":95mm,"room-simple-solution":95mm,"room-hanging":95mm,"warehouse-coordinates":100mm,"warehouse":100mm,"warehouse-solution":100mm,"cabin":90mm,"hanging-ball":70mm,"hanging-ball-solution":70mm,"balloon":100mm,"drones":100mm,"velocity":95mm)
#let diagram(name)=image("figures/generated/"+name+".png",width:widths.at(name))
#let fig(name)=block(width:100%,breakable:false,above:3mm,below:4mm,align(center,{
 if name=="aircraft-us" {image("figures/aircraft-us.jpg",width:73mm)}
 else if name=="aircraft-radar" {image("figures/aircraft-radar.jpg",width:73mm)}
 else if name=="cabin" {grid(columns:(54mm,90mm),column-gutter:8mm,align:horizon,
  [#image("figures/wooden-cabins.jpg",width:54mm)
#align(center)[Hình 1]],
  [#diagram(name)
#align(center)[Hình 2]])}
 else {diagram(name)}
}))
