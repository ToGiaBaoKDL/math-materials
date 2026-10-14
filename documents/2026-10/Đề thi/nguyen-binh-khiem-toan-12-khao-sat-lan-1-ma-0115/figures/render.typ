#import "geometry.typ": net, shaded-square
#import "/templates/theme.typ": fonts
#set page(width:auto,height:auto,margin:0pt,fill:white)
#set text(font:fonts.body,size:13pt)
#show math.equation: set text(font:fonts.math)
#if sys.inputs.at("figure") == "net" { net() } else { shaded-square() }
