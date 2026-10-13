#import "geometry.typ": window, tank, led, spheres, pyramid
#import "/templates/theme.typ": fonts
#set page(width:auto,height:auto,margin:0pt,fill:white)
#set text(font:fonts.body,size:13pt)
#show math.equation: set text(font:fonts.math)
#let figures = (window:window,tank:tank,led:led,spheres:spheres,pyramid:pyramid)
#figures.at(sys.inputs.at("figure"))()
