#import "/templates/graphs.typ": graph, variation
#import "/templates/drawing.typ": path, figure-fill
#import "/templates/theme.typ": plot-style
#let red=rgb("#B00012")
#let sign-table()=block(width:125mm,height:18mm,breakable:false)[
 #place(top+left,rect(width:125mm,height:9mm,fill:plot-style.variation-fill,stroke:none))
 #place(top+left,rect(width:15mm,height:18mm,fill:plot-style.variation-fill,stroke:none))
 #place(top+left,rect(width:125mm,height:18mm,stroke:plot-style.table-stroke))
 #place(top+left,line(start:(15mm,0mm),end:(15mm,18mm),stroke:plot-style.table-stroke))
 #place(top+left,line(start:(0mm,9mm),end:(125mm,9mm),stroke:plot-style.table-stroke))
 #let lab(x,y,t)=place(top+left,dx:x*1mm-5mm,dy:y*1mm,box(width:10mm,align(center,text(size:11pt,t))))
 #lab(7.5,2,[$x$]) #lab(7.5,11,[$f'(x)$])
 #for (x,t) in ((23,[$-infinity$]),(46,[$-2$]),(69,[$0$]),(92,[$2$]),(116,[$+infinity$])) {lab(x,2,t)}
 #for (x,t) in ((34.5,[$+$]),(46,[$0$]),(57.5,[$-$]),(69,[$0$]),(80.5,[$+$]),(92,[$0$]),(104,[$+$])) {lab(x,11,t)}
]
#let variation-table()=variation(([$-infinity$],[$-1$],[$0$],[$1$],[$+infinity$]),([$-$],[$+$],[$-$],[$+$]),([$+infinity$],[$0$],[$3$],[$0$],[$+infinity$]),(1,0,1,0,1),width:130mm)
#let curve-plot(n)=if n==7 {
 graph(x=>x*x*x - 3*x,xrange:(-2.2,2.2),yrange:(-2.7,3),width:62mm,height:62mm,xticks:(-2,-1,1,2),yticks:(-2,-1,1,2),y-label-offsets:("1":(3mm,0mm),"-1":(-4mm,0mm),"-2":(-4mm,0mm)),curve-stroke:1pt+red)
} else if n==8 {
 graph(x=>if calc.abs(x)<=1 {x*x*x - 3*x}else if x>1 {6*(x - 1)*(x - 1) - 2}else {-6*(x+1)*(x+1)+2},xrange:(-2.5,2.7),yrange:(-4.7,4.8),domain:(-2.015,2.015),width:65mm,height:62mm,xticks:(-2,-1,1,2),yticks:(-4,-2,2,4),guides:((-2,-4),(-1,2),(1,-2),(2,4)),curve-stroke:1pt+red)
} else if n==9 {
 graph(x=>x*x*x - 3*x+1,xrange:(-2.3,2.5),yrange:(-1.8,4.2),width:65mm,height:60mm,xticks:(-2,-1,1,2),x-label-offsets:("-2":(-3mm,2mm)),yticks:(-1,1,3),guides:((-2,-1),(-1,3),(1,-1),(2,3)),curve-stroke:1pt+red)
} else {
 graph(x=>-10*(x - 1)*(x - 7),xrange:(-0.8,8),yrange:(-18,108),domain:(0.7,7.3),width:65mm,height:59mm,xticks:(1,4,7),yticks:(90,),guides:((4,90),),curve-stroke:1pt+red,x-label-offsets:("1":(1mm,1mm),"4":(0mm,1mm),"7":(-2mm,1mm)))
}
#let perfume()=box(width:90mm,height:65mm)[
 #let p(x,y,z)=((45+3.8*(0.8660254*x - 0.5*y))*1mm,(48+3.8*(0.35*(0.5*x+0.8660254*y) - calc.sqrt(1 - 0.35*0.35)*z))*1mm)
 #let edge=0.8pt+red
 #let dash=(paint:red,thickness:0.7pt,dash:"dashed")
 // Orthographic hemisphere: upper silhouette is a semicircle, equator an ellipse.
 #let rim=range(121).map(i=>p(10*calc.cos(i*3deg),10*calc.sin(i*3deg),0))
 #path(rim,close:true,fill:figure-fill(rgb("#FFDFE5")),stroke:edge)
 #let dome=range(81).map(i=>((45 - 38*calc.cos(i*180deg/80))*1mm,(48 - 38*calc.sin(i*180deg/80))*1mm))
 #path(dome,stroke:edge)
 #let h=calc.sqrt(100 - 6.4*6.4 - 3.2*3.2)
 #let A=p(-6.4,-3.2,0);#let B=p(6.4,-3.2,0);#let C=p(6.4,3.2,0);#let D=p(-6.4,3.2,0)
 #let E=p(-6.4,-3.2,h);#let F=p(6.4,-3.2,h);#let G=p(6.4,3.2,h);#let H=p(-6.4,3.2,h)
 #path((E,F,G,H),close:true,fill:figure-fill(rgb("#FFDFE5")),stroke:edge)
 #path((D,C,G,H),close:true,fill:figure-fill(rgb("#FF91A4")),stroke:edge)
 #path((B,C,G,F),close:true,fill:figure-fill(rgb("#FFB1C1")),stroke:edge)
 #path((D,A,B),stroke:dash) #path((A,E),stroke:dash)
 // The small cap is illustrative, as in the source, without added dimensions.
 #let u=1.1;#let caph=h+1.5
 #path((p(-u,u,h),p(u,u,h),p(u,u,caph),p(-u,u,caph)),close:true,fill:white,stroke:edge)
 #path((p(u,-u,h),p(u,u,h),p(u,u,caph),p(u,-u,caph)),close:true,fill:figure-fill(rgb("#FFB1C1")),stroke:edge)
 #path((p(-u,-u,caph),p(u,-u,caph),p(u,u,caph),p(-u,u,caph)),close:true,fill:figure-fill(rgb("#FFDFE5")),stroke:edge)
]
