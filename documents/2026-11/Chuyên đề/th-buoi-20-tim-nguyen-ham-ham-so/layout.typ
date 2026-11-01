#import "/templates/theme.typ": palette
#let formula-table(..cells)={
 set text(size:12pt)
 set par(justify:false,leading:0.6em)
 table(columns:(42%,58%),stroke:0.7pt+palette.primary,inset:(x:2mm,y:3mm),align:left+horizon,
  fill:(x,y)=>if y==0 {palette.box-fill}else{none},
  table.header(..cells.pos().slice(0,2).map(it=>strong(it))),..cells.pos().slice(2))
}
#let subparts(..items)=block(width:100%,above:3mm,below:2mm,layout(size=>{
 set par(justify:false)
 let widest=calc.max(..items.pos().map(it=>measure(it).width))
 let cols=if widest<=(size.width - 6mm)/2 {2}else{1}
 grid(columns:(1fr,)*cols,column-gutter:5mm,row-gutter:3.5mm,..items.pos())
}))
#let math-flow(parts)=block(width:100%,above:2mm,below:2mm,breakable:true,layout(size=>{
 let expressions=parts.map(it=>it.body)
 let formula(body)=math.equation(block:false,math.display(body))
 let whole=expressions.sum(default:[])
 if measure(formula(whole)).width <= size.width {
  align(center,formula(whole))
 } else {
  let lhs=expressions.first()
  let lhs-width=measure(formula(lhs)).width
  let rhs=expressions.slice(1)
  let max-rhs=calc.max(0pt,..rhs.map(it=>measure(formula(it)).width))
  if rhs.len()>0 and lhs-width+max-rhs+3mm<=size.width {
   let lines=()
   let current=[]
   for part in rhs {
    if current!=[] and measure(formula(current+part)).width>size.width - lhs-width - 3mm {
     lines.push(current)
     current=part
    }else{current+=part}
   }
   if current!=[] {lines.push(current)}
   grid(columns:(lhs-width,1fr),column-gutter:2mm,row-gutter:2.5mm,align:(right+horizon,left+horizon),
    ..lines.enumerate().map(((i,row))=>(if i==0 {formula(lhs)}else{[]},formula(row))).flatten())
  }else{
   let rows=()
   let current=[]
   for part in expressions {
    if current!=[] and measure(formula(current+part)).width>size.width {
     rows.push(current)
     current=part
    }else{current+=part}
   }
   if current!=[] {rows.push(current)}
   grid(columns:(1fr,),row-gutter:2.5mm,align:left,..rows.map(formula))
  }
 }
}))

#let formula-grid(columns:2,..items)=block(width:100%,above:3mm,below:3mm,breakable:false)[
 #set par(justify:false)
 #grid(columns:(1fr,)*columns,column-gutter:4mm,row-gutter:5mm,align:left+horizon,..items.pos())
]

#let solution-part(label, parts, continuation:none)=block(width:100%,breakable:true,above:2mm,below:1mm,layout(size=>{
 set par(justify:false)
 let formula(body)=math.equation(block:false,math.display(body))
 let indent=if continuation==none {0pt}else{measure(formula(continuation.body)).width + 5em / 18}
 let rows=()
 let current=[]
 for part in parts.map(it=>it.body) {
  if current!=[] and measure(formula(current+part)).width > size.width - 8mm - if rows.len()>0 {indent}else{0pt} {
   rows.push(current)
   current=part
  }else{current+=part}
 }
 if current!=[] {rows.push(current)}
 grid(columns:(7mm,1fr),column-gutter:1mm,row-gutter:2mm,align:left+horizon,
  ..rows.enumerate().map(((i,row))=>(if i==0 {[#label)]}else{[]},[
   #if i>0 {h(indent)}#formula(row)
  ])).flatten())
}))
