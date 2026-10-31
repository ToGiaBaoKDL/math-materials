#import "/templates/drawing.typ": path, arrow-line, figure-fill
#import "/templates/graphs.typ": graph
#let red=rgb("#B00012")
#let edge=0.8pt+red
#let hidden=(paint:red,thickness:0.8pt,dash:(2.5pt,2pt))
#let pink=figure-fill(rgb("#F6B1B8"))
#let p(x,y)=(x*1mm,y*1mm)
#let label(x,y,body)=context {
 let body=box(text(size:11pt,top-edge:"bounds",bottom-edge:"bounds",body))
 let m=measure(body)
 place(top+left,dx:x*1mm-m.width/2,dy:y*1mm-m.height/2,body)
}
#let seg(a,b,dash:false)=path((p(..a),p(..b)),stroke:if dash {hidden}else{edge})
#let variation(kind)= {
 let xs=if kind=="v1" {([$-infinity$],[$-1$],[$0$],[$1$],[$+infinity$])}else if kind=="v2" {([$-5$],[$1$],[$7$])}else if kind=="v12" {([$-infinity$],[$-2$],[$3$],[$+infinity$])}else{([$-infinity$],[$0$],[$2$],[$4$],[$+infinity$])}
 let signs=if kind=="v1" or kind=="last" {([$-$],[$+$],[$-$],[$+$])}else if kind=="v2" {([$-$],[$+$])}else{([$+$],[$-$],[$+$])}
 let n=xs.len()
 let xx(i)=24+i*100/(n - 1)
 box(width:135mm,height:50mm)[
  #path((p(1,1),p(134,1),p(134,10),p(1,10)),close:true,fill:pink,stroke:none)
  #seg((1,1),(134,1)) #seg((1,49),(134,49))
  #seg((15,1),(15,49)) #seg((1,10),(134,10)) #seg((1,20),(134,20))
  #label(8,5.5,[$x$]) #label(8,15,if kind=="v1" or kind=="v12" {[$f'(x)$]}else{[$y'$]})
  #label(8,34,if kind=="v1" or kind=="v12" {[$f(x)$]}else{[$y$]})
  #for (i,x) in xs.enumerate(){label(xx(i),5.5,x)}
  #for i in range(n - 1){label((xx(i)+xx(i+1))/2,15,if kind=="last" {if i==0 or i==3 {[$-$]}else{[$+$]}}else{signs.at(i)})}
  #for i in range(1,n - 1){if kind!="last" or i!=2 {label(xx(i),15,[$0$])}}
  #if kind=="last" {
   for dx in (-0.6,0.6){seg((xx(2)+dx,10),(xx(2)+dx,49))}
   for (x,y,t) in ((24,25,[$+infinity$]),(49,35,[$2$]),(69,25,[$+infinity$]),(79,44,[$-infinity$]),(99,38,[$-6$]),(124,44,[$-infinity$])) {label(x,y,t)}
   for (a,b) in (((30,27),(44,34)),((54,34),(66,27)),((82,43),(94,39)),((104,39),(118,43))) {arrow-line(p(..a),p(..b),color:red)}
  } else {
   let vals=if kind=="v1" {([$+infinity$],[$-2$],[$3$],[$-2$],[$+infinity$])}else if kind=="v2" {([$6$],[$2$],[$9$])}else{([$-infinity$],[$4$],[$-1$],[$+infinity$])}
   let ys=if kind=="v1" {(25,43,31,43,25)}else if kind=="v2" {(31,43,25)}else{(44,30,39,25)}
   for i in range(n){label(xx(i),ys.at(i),vals.at(i))}
   for i in range(n - 1){arrow-line(p(xx(i)+6,ys.at(i)),p(xx(i+1)-6,ys.at(i+1)),color:red)}
   if kind=="v2" {for x in (129,130){seg((x,10),(x,49))}}
  }
 ]
}
#let sign-table()=box(width:125mm,height:21mm)[
 #path((p(1,1),p(124,1),p(124,10),p(1,10)),close:true,fill:pink,stroke:none)
 #seg((1,1),(124,1)) #seg((1,20),(124,20))
 #seg((15,1),(15,20)) #seg((1,10),(124,10))
 #label(8,5.5,[$x$]) #label(8,15,[$f'(x)$])
 #for (x,t) in ((24,[$-infinity$]),(47,[$3$]),(70,[$7$]),(93,[$11$]),(116,[$+infinity$])){label(x,5.5,t)}
 #for (x,t) in ((35.5,[$+$]),(47,[$0$]),(58.5,[$-$]),(70,[$0$]),(81.5,[$+$]),(93,[$0$]),(104.5,[$-$])) {label(x,15,t)}
]
#let tank()=box(width:66mm,height:48mm)[
 #let A=(5,20)
 #let B=(43,20)
 #let C=(58,5)
 #let D=(20,5)
 #path((p(..A),p(..B),p(..C),p(..D)),close:true,fill:pink,stroke:edge)
 #path((p(5,20),p(43,20),p(43,43),p(5,43)),close:true,fill:figure-fill(rgb("#FADADD")),stroke:edge)
 #path((p(43,20),p(58,5),p(58,28),p(43,43)),close:true,fill:figure-fill(rgb("#DF8D98")),stroke:edge)
 #seg((20,5),(20,28),dash:true) #seg((20,28),(58,28),dash:true) #seg((5,43),(20,28),dash:true)
 // Square opening: its projected edges use the same two base vectors.
 #let t=calc.sqrt(8/27)
 #let u=(38*t*3/4,0)
 #let v=(15*t, -15*t)
 #let O=(58-u.at(0),5)
 #path((p(..O),p(58,5),p(58-v.at(0),5-v.at(1)),p(O.at(0) - v.at(0),O.at(1) - v.at(1))),close:true,fill:red.lighten(25%),stroke:edge)
]
#let fold()=box(width:150mm,height:65mm)[
 #let A=(6,5)
 #let B=(6,55)
 #let C=(56,55)
 #let D=(56,5)
 #let E=(18,30)
 #let F=(31,43)
 #let G=(44,30)
 #let H=(31,17)
 #path((p(..A),p(..B),p(..C),p(..D)),close:true,stroke:edge)
 #path((p(..E),p(..F),p(..G),p(..H)),close:true,fill:pink,stroke:edge)
 #for (a,b) in ((A,E),(A,H),(B,E),(B,F),(C,F),(C,G),(D,G),(D,H)) {seg(a,b)}
 #seg(A,C,dash:true)
 #place(top+left,dx:30.55mm,dy:29.55mm,circle(radius:0.45mm,fill:red,stroke:none))
 #label(31,33,[$O$]) #label(40,39,[$M$])
 #for (pt,t,dx,dy) in ((A,[$A$],-2,-3),(B,[$B$],-2,3),(C,[$C$],2,3),(D,[$D$],2,-3),(E,[$E$],-3,0),(F,[$F$],0,4),(G,[$G$],3,0),(H,[$H$],0,-3)){label(pt.at(0)+dx,pt.at(1)+dy,t)}
 #let S=(108,5)
 #let E2=(92,39)
 #let F2=(80,55)
 #let G2=(123,55)
 #let H2=(137,39)
 #let O=(108,47)
 #let M=(130,47)
 #path((p(..S),p(..F2),p(..G2)),close:true,fill:figure-fill(rgb("#FADADD")),stroke:edge)
 #path((p(..S),p(..G2),p(..H2)),close:true,fill:pink,stroke:edge)
 #for (a,b) in ((S,E2),(E2,F2),(E2,H2),(E2,G2),(F2,H2),(S,O)) {seg(a,b,dash:true)}
 #seg(S,M)
 #place(top+left,dx:107.55mm,dy:46.55mm,circle(radius:0.45mm,fill:red,stroke:none))
 #for (pt,t,dx,dy) in ((S,[$A$],0,-3),(E2,[$E$],-4,-4),(F2,[$F$],-2,3),(G2,[$G$],1,3),(H2,[$H$],3,0),(O,[$O$],0,4),(M,[$M$],4,1)){label(pt.at(0)+dx,pt.at(1)+dy,t)}
]
#let g=graph.with(width:67mm,height:50mm,curve-stroke:1.15pt+red)
#let fig(name)=if name=="rational" {g(x=>(2*x - 3)/(x - 1),xrange:(-4,5),yrange:(-4,7),breaks:(1,),xticks:(1,),yticks:(2,),x-label-offsets:("1":(-1.5mm,0.5mm)),y-label-offsets:("2":(-1mm,1.6mm)),asymptotes:(((1,-4),(1,7)),((-4,2),(5,2))),asymptote-stroke:0.6pt+black)}else if name=="cubic" {g(x=>-x*x*x+6*x*x - 9*x+3,xrange:(-0.8,4.4),yrange:(-2,6),origin-offset:(-1.5mm,1mm))}else if name=="oblique" {g(x=>x+1+1/(x+1),xrange:(-3.6,2.6),yrange:(-4.5,5),breaks:(-1,),xticks:(-2,-1),yticks:(-2,1,2),x-label-offsets:("-2":(0mm,-0.5mm),"-1":(-2mm,1mm)),y-label-offsets:("2":(1.5mm,-2.5mm),"1":(1mm,1.2mm),"-2":(1mm,0mm)),guides:((-2,-2),),asymptotes:(((-1,-4.5),(-1,5)),((-3.6,-2.6),(2.6,3.6))),asymptote-stroke:0.6pt+black)}else if name=="signs" {sign-table()}else if name=="tank" {tank()}else if name=="fold" {fold()}else{variation(name)}
