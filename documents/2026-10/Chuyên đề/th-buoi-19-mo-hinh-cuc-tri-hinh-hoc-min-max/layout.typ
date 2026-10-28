// Pack expressions to the available width, while allowing page breaks between rows.
#let math-flow(parts) = block(width:100%,breakable:true,above:2mm,below:2mm,layout(size => {
  let rows = ()
  let current = []
  for part in parts.map(it => it.body) {
    let candidate = current + part
    if current != [] and measure(math.equation(block:false,math.display(candidate))).width > size.width {
      rows.push(current)
      current = part
    } else { current = candidate }
  }
  if current != [] { rows.push(current) }
  show math.equation.where(block:true): set block(above:0pt,below:0pt,breakable:true)
  set align(left)
  grid(columns:(1fr,),row-gutter:3mm,..rows.map(row => math.equation(block:true,numbering:none,row)))
}))
#let aligned-math(body) = block(width:100%,breakable:true,above:2mm,below:2mm)[
  #show math.equation.where(block:true): set block(breakable:true,above:0pt,below:0pt)
  #set math.equation(numbering:none)
  #set par(leading:0.75em)
  #align(center, math.equation(block:true, body.body))
]
