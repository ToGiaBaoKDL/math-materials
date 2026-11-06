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

