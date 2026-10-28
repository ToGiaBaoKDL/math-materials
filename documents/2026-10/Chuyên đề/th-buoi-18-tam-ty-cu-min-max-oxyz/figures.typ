#import "/templates/drawing.typ": path, label, figure-fill
#let red=rgb("#B00012")
#let edge=0.8pt+red
#let hidden=(paint:red,thickness:0.8pt,dash:(3pt,2pt))
#let p(x,y)=(x*1mm,y*1mm)
#let seg(a,b,dashed:false)=path((p(..a),p(..b)),stroke:if dashed {hidden}else{edge})
#let mark(a,t,dx:0mm,dy:0mm)={
  place(top+left,dx:a.at(0)*1mm-0.6mm,dy:a.at(1)*1mm-0.6mm,circle(radius:0.6mm,fill:red,stroke:none))
  label(p(..a),t,dx:dx,dy:dy)
}
#let plane(name: [(P)])={
  path((p(5,48),p(76,48),p(91,28),p(20,28)),close:true,fill:figure-fill(rgb("#F6B1B8")),stroke:edge)
  // Small corner arc leaves room for both parentheses.
  place(top+left,curve(curve.move(p(17,48)),curve.cubic(p(17,44),p(15,40),p(12,39)),stroke:0.6pt+red))
  label(p(12,45),name,width:10mm)
}
#let diagram(name)=box(width:96mm,height:if name == "projection" {51mm} else {74mm})[
  #plane(name: if name == "projection" { [$(alpha)$] } else { [$(P)$] })
  #if name=="opposite" {
    let A=(29,12); let M=(64,36); let B=(55,66)
    seg(A,M); seg(M,(60.4,48),dashed:true); seg((60.4,48),B)
    // AB meets plane at H; hidden segment continues behind the plane.
    seg(A,(41.52,38)); seg((41.52,38),(46.33,48),dashed:true); seg((46.33,48),B)
    mark(A,[$A$],dy:-4mm);mark(M,[$M$],dx:3mm,dy:-3mm);mark(B,[$B$],dy:4mm)
  } else if name=="same" {
    let A=(29,8);let Ap=(29,68);let H=(29,38);let B=(77,20);let M=(59,38)
    seg(A,H);seg(H,(29,48),dashed:true);seg((29,48),Ap);seg(A,M);seg(M,B);seg(Ap,(49,48));seg((49,48),M,dashed:true)
    path((p(29,35),p(32,35),p(32,38)),stroke:edge)
    mark(A,[$A$],dx:-3mm,dy:-3mm);mark(Ap,[$A'$],dx:-4mm,dy:2mm)
    mark(H,[$H$],dx:-4mm,dy:2mm);mark(M,[$M$],dx:3mm,dy:3mm);mark(B,[$B$],dy:-4mm)
  } else if name=="reflection" {
    let B=(60,12);let Bp=(60,68);let H=(60,40);let I=(28,13);let M=(43.71,40)
    seg(B,H);seg(H,(60,48),dashed:true);seg((60,48),Bp);seg(I,M);seg(M,(48.36,48),dashed:true);seg((48.36,48),Bp)
    path((p(60,37),p(63,37),p(63,40)),stroke:edge)
    mark(B,[$B$],dx:4mm);mark(Bp,[$B'$],dx:4mm);mark(H,[$H$],dx:4mm,dy:2mm)
    mark(I,[$I$],dx:-3mm,dy:-3mm);mark(M,[$M$],dx:-4mm,dy:2mm)
  } else if name=="projection" {
    let A=(35,23);let I=(45,14);let B=(55,5);let H=(45,42);let M=(72,42)
    seg(A,B);seg(I,H);seg(I,M);seg(H,M)
    path((p(45,39),p(48,39),p(48,42)),stroke:edge)
    mark(A,[$A$],dx:-4mm);mark(I,[$I$],dx:-4mm);mark(B,[$B$],dy:-3mm)
    mark(H,[$H$],dx:-3mm,dy:4mm);mark(M,[$M$],dx:4mm,dy:3mm)
  }
]
