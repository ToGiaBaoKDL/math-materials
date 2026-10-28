#import "/templates/graphs.typ": graph
#import "/templates/drawing.typ": path, label, arrow-line, figure-fill
#let red=rgb("#B00012")
#let edge=0.8pt+red
#let pink=figure-fill(rgb("#F6B1B8"))
#let p(x,y)=(x*1mm,y*1mm)
#let g=graph.with(width:72mm,height:60mm,curve-stroke:1.15pt+red)
#let h(t)=3*t*t - 2*t*t*t
#let f(x)=if x < 0 {1-3*x*x}else if x <= 2 {1-3*h(x/2)}else if x <= 4 {-2+5*h((x - 2)/2)}else{3-2*(x - 4)*(x - 4)}
#let variation(kind)=box(width:118mm,height:48mm)[
 #let label(point, body)=context {
  let content=text(size:11pt,top-edge:"bounds",bottom-edge:"bounds",body)
  let size=measure(content)
  place(top+left,dx:point.at(0)-size.width/2,dy:point.at(1)-size.height/2,content)
 }
 #let finite=kind=="table-finite"
 #let xs=if finite {([$-sqrt(3)$],[$-1$],[$1$],[$sqrt(5)$])}else if kind=="table-tf" {([$-infinity$],[$-2$],[$1$],[$+infinity$])}else{([$-infinity$],[$0$],[$2$],[$+infinity$])}
 #let ys=if finite {([$0$],[$2$],[$-2$],[$2sqrt(5)$])}else if kind=="table-tf" {([$-infinity$],[$20$],[$-7$],[$+infinity$])}else{([$-infinity$],[$4$],[$0$],[$+infinity$])}
 #path((p(1,1),p(117,1),p(117,10),p(1,10)),close:true,fill:pink,stroke:none)
 #path((p(1,1),p(117,1),p(117,47),p(1,47)),close:true,stroke:edge)
 #for (a,b) in (((1,10),(117,10)),((1,20),(117,20)),((15,1),(15,47))) {path((p(..a),p(..b)),stroke:edge)}
 #label(p(8,5.5),[$x$]) #label(p(8,15),[$f'(x)$]) #label(p(8,31),[$f(x)$])
 #for (i,x) in xs.enumerate(){label(p(24+i*28,5.5),x)}
 #for (x,t) in ((38,[$+$]),(52,[$0$]),(66,[$-$]),(80,[$0$]),(94,[$+$])) {label(p(x,15),t)}
 #let levels=if finite {(35,30,40,24)}else{(41,29,36,24)}
 #for (i,y) in ys.enumerate(){label(p(24+i*28,levels.at(i)),y)}
 #for i in range(3) {
  arrow-line(p(30+i*28,levels.at(i)),p(46+i*28,levels.at(i+1)),color:red,thickness:0.8pt)
 }

]
#let wire()=box(width:62mm,height:48mm)[
 #let pts=((p(11,6),p(37,6))+range(1,61).map(i=>{let a=-90deg+i*180deg/60;p(37+16*calc.cos(a),22+16*calc.sin(a))})+(p(11,38),))
 #path(pts,close:true,fill:pink,stroke:edge)
 #path((p(37,6),p(37,38)),stroke:(paint:red,thickness:0.8pt,dash:(2.5pt,2pt)))
 #for (a,t,dx,dy) in (((11,38),[$P$],-2,2),((37,38),[$Q$],2,2),((53,22),[$R$],3,0),((37,6),[$S$],0,-3),((11,6),[$T$],0,-3)) {label(p(..a),t,dx:dx*1mm,dy:dy*1mm)}
 #label(p(6,22),[$x$ m]) #label(p(41,22),[$x$ m]) #label(p(24,44),[$y$ m])
]
#let diagram(name)=if name=="extrema" {
 g(f,width:76mm,height:64mm,xrange:(-1.4,5.65),domain:(-1,5.45),yrange:(-3.2,4),xticks:(-1,2,3,4,5),yticks:(-2,1,3),y-label-offsets:("-2":(-2mm,-2mm),"1":(-2mm,-2mm)),guides:((-1,-2),(2,-2),(4,3),(5,1)))
}else if name=="cubic" {
 g(x=>x*x*x - 3*x*x+2,width:62mm,height:50mm,xrange:(-1.2,3.2),yrange:(-3.2,3.3),xticks:(2,),yticks:(-2,2),y-label-offsets:("2":(-2mm,-2mm)),guides:((2,-2),))
}else if name=="decreasing" {
 g(x=>-x*x*x+1,width:62mm,height:50mm,xrange:(-1.5,1.7),yrange:(-2,3.5),xticks:(-1,1),yticks:(2,),guides:((-1,2),))
}else if name=="signs" {
 g(x=>-x*x*x+3*x - 1,xrange:(-2.3,2.3),yrange:(-4.5,2.5))
}else if name=="rational" {
 g(x=>(x+1)/(x - 1),width:62mm,height:50mm,xrange:(-3,4),yrange:(-3,4),breaks:(1,),xticks:(1,),yticks:(1,),origin-offset:(1mm,1mm),asymptotes:(((1,-3),(1,4)),((-3,1),(4,1))),asymptote-stroke:0.6pt+black)
}else if name=="wire" {wire()}else{variation(name)}
