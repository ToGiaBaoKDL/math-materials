#import "/templates/graphs.typ": graph
#let derivative() = graph(x => x*x*x - 3*x - 2, xrange:(-2.5,2.7), yrange:(-4.8,1.2), xticks:(-1,1,2),yticks:(-2,-4),guides:((1,-4),),name:[$f'(x)$])
#let hopper() = grid(columns:(auto,auto),column-gutter:12mm,align:horizon,
  image("figures/generated/net.png",width:58.8mm,height:57.6mm),
  image("figures/rice-mill.png",height:43mm))
#let shaded-square() = image("figures/generated/square.png", width:54mm, height:51mm)
