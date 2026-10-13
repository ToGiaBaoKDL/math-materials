#import "theme.typ": palette, fonts, exam-style, plot-style
#import "components.typ": choices
#import "exam-branding.typ": exam-header, exam-footer
#import "writing.typ": writing-space, final-writing-space

#let exam(title, code, body, variant: "de", leading: exam-style.leading) = {
  assert(("de", "de-cach", "dap-an").contains(variant), message: "Unknown exam variant")
  set document(title: title)
  set text(font: fonts.body, size: exam-style.body-size, lang: "vi", fill: palette.ink)
  show strong: set text(weight: "bold")
  show math.equation: set text(font: fonts.math, top-edge: "bounds", bottom-edge: "bounds")
  show math.equation.where(block: false): it => box(math.display(it))
  show math.frac: it => math.display(it)
  set par(justify: true, leading: leading, spacing: 2.5mm)
  set page(paper: "a4", margin: (x:12mm,top:18mm,bottom:16mm),
    background: context {
      place(top + left, exam-header())
      place(bottom + left, exam-footer(code))
    })
  body
}

#let exam-cover(organization, title, code, duration: 90, subject: "Toán",
  status: none, note: none, organization-size: 12pt) = {
  set par(justify: false, leading: 0.45em)
  grid(columns: (1fr, 1.15fr), column-gutter: 6mm, align: center + top,
    [
      #text(size: organization-size, weight: "bold", fill: palette.primary, organization)
      #linebreak()
      #context text(size:11pt,style:"italic")[(Đề thi gồm #counter(page).final().first() trang)]
      #if status != none { v(2mm); text(weight: "bold", fill: palette.exam-blue, status) }
      #if note != none { linebreak(); text(style: "italic", note) }
    ],
    [
      #text(size: 12pt, weight: "bold", fill: palette.primary, title)
      #linebreak()
      #text(weight: "bold", fill: palette.exam-blue)[Môn thi: #subject]
      #linebreak()
      #text(size: 12pt, style: "italic")[Thời gian làm bài: #duration phút, không kể thời gian phát đề]
    ],
  )
  v(4mm)
  grid(columns: (1.2fr, 1fr), column-gutter: 8mm, align: horizon,
    grid(columns: (32mm, 1fr), column-gutter: 2mm, row-gutter: 2mm, align:bottom,
      [Họ, tên thí sinh:], line(length:100%,stroke:(paint:palette.ink,thickness:0.7pt,dash:"dotted")),
      [Số báo danh:], line(length:100%,stroke:(paint:palette.ink,thickness:0.7pt,dash:"dotted"))),
    block(width: 100%, fill: palette.box-fill, stroke: 0.9pt + palette.primary,
      radius: 2mm, inset: (x:3mm,y:3mm),
      align(center, text(size:14pt,weight: "bold", fill: palette.primary)[Mã đề: #code])))
  v(3mm)
  line(length: 100%, stroke: 1.2pt + palette.primary)
}

#let exam-section(number, title, instruction: []) = block(width: 100%, sticky: true,
  above: exam-style.section-gap, below: 2mm)[
  #text(weight: "bold", fill: palette.primary)[PHẦN #number.]
  #text(weight: "bold", fill: palette.exam-blue, title) #instruction
]

#let exam-table(columns: auto, header: (), ..cells) = table(
  columns: columns, align: center + horizon, inset: 4.5pt, stroke: plot-style.table-stroke,
  fill: (x, y) => if y == 0 { plot-style.table-fill } else { white },
  table.header(..header.map(it => text(weight: "bold", fill: palette.exam-blue, it))), ..cells.pos())

#let exam-question(number, body, answers: (), statements: (), solution: [],
  variant: "de", writing-lines: 6, columns: auto, ending: none, keep-together: false) = {
  let prompt = [
    #text(weight: "bold", fill: palette.primary)[Câu #number.] #body
    #if statements.len() > 0 {
      block(above: 5mm, below: 0pt, grid(columns: (1fr,), row-gutter: exam-style.statement-gap,
        ..statements.enumerate().map(((i, it)) => [#("abcd".at(i))) #it])))
    }
    #if answers.len() > 0 { v(3mm); choices(answers, columns: columns, label-color: palette.exam-blue) }
  ]
  block(width: 100%, breakable: not keep-together and (ending == none or variant != "de-cach"), sticky: false,
    above: if variant == "de" {4mm} else {exam-style.question-gap}, below: 0pt)[
    #prompt
    #if variant == "de-cach" { writing-space(writing-lines) }
  ]
  if variant == "de-cach" {
    final-writing-space()
  }
  if variant == "dap-an" {
    let answer = [
      #block(width: 100%, sticky: true, above: 8mm, below: 3mm,
        align(center, text(weight: "bold", style: "italic", fill: palette.primary)[Lời giải]))
      #solution
    ]
    answer
  }
  if ending != none {
    if variant != "de-cach" { v(1fr) }
    ending
  }
}

#let exam-end(note: []) = block(width: 100%, above: 5mm, breakable: false)[
  #align(center, grid(columns: (22mm, auto, 22mm), column-gutter: 3mm, align: horizon,
    line(length: 22mm, stroke: 0.65pt + palette.primary),
    text(weight: "bold", fill: palette.primary)[HẾT],
    line(length: 22mm, stroke: 0.65pt + palette.primary)))
  #v(2mm)
  #note
]

#let exam-figure(body, size:100%) = block(width: 100%, breakable: false, above: 2mm, below: 2mm, align(center, scale(x:size,y:size,reflow:true,body)))

#let exam-source(ai:false) = block(width:100%,above:3mm)[
  #set text(size:10pt)
  #set par(justify:false)
  Nguồn đề: TOANMATH.com.
  #if ai {[
    #linebreak() Đề thi được gõ lại từ ảnh chụp, không phải bản chính thức từ đơn vị ra đề.
    #linebreak() Lời giải chi tiết do AI thực hiện, chỉ mang tính chất tham khảo, không thay thế đáp án chính thức.
  ]}
]
