#import "theme.typ": exam-palette as palette, fonts, exam-style, plot-style
#import "components.typ": choices
#import "exam-branding.typ": exam-header, exam-footer
#import "writing.typ": writing-space, final-writing-space

#let exam(title, code, body, variant: "de", leading: exam-style.leading) = {
  assert(("de", "de-cach", "dap-an", "de-dap-an").contains(variant), message: "Unknown exam variant")
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

#let exam-cover(organization, title, code, duration: 90, subject: "Toán", grade: "12",
  status: none, note: none, organization-size: 12pt, title-size: 12pt, duration-size: 12pt, pages: none) = {
  set par(justify: false, leading: 0.55em)
  let green = rgb("#08752B")
  block(width: 100%, breakable: false, radius: 3mm, stroke: 1pt + palette.primary,
    fill: white, inset: (x: 4mm, y: 4mm))[
    #set text(font: fonts.ui, size: 10.5pt)
    #set par(spacing: 1mm, leading: 0.7em)
    #layout(space => {
      let base-size = calc.min(organization-size, title-size)
      let heading-width = calc.max(
        measure(text(size: base-size, weight: "bold", organization)).width,
        measure(text(size: base-size, weight: "bold", title)).width)
      let heading-size = base-size * calc.min(1, (space.width / 2 - 8mm) / heading-width)
      [#table(columns: (1fr, 1fr), stroke: none, inset: (x: 4mm, y: 1mm), align: horizon,
      table.cell(align: top + center, stroke: (right: 0.6pt + rgb("#E4B7C0")))[
        #text(size: heading-size, weight: "bold", fill: green, organization)
      ],
      table.cell(align: top)[
        #set par(leading: 1em)
        #text(size: heading-size, weight: "bold", fill: palette.primary, title)
      ],
      table.cell(stroke: (right: 0.6pt + rgb("#E4B7C0")))[
        #align(center)[
          #if status != none { text(weight: "bold", fill: green, status); v(2mm) }
          #line(length: 100%, stroke: 0.5pt + rgb("#E4B7C0"))
        ]
        #v(3mm)
        #grid(columns: (17mm, 1fr), column-gutter: 7mm, align: horizon,
          image("/assets/branding/icons/clock.svg", width: 17mm),
          [#context text(weight: "bold")[Đề thi gồm #(if pages == none {counter(page).final().first()} else {pages}) trang]
           #v(3mm)
           #text(size: 10pt, weight: "bold")[Thời gian làm bài: #text(fill: palette.primary)[#duration phút]]
           #v(3mm)
           #text(size: 9.5pt, style: "italic")[(Không kể thời gian phát đề)]])
      ],
      [
        #set par(leading: 1em)
        *Môn:* #subject
        #v(4mm)
        *Khối:* #grade
        #if note != none { v(4mm); text(size: 10.5pt, style: "italic", note) }
        #if code != none {
          v(4mm)
          block(fill: rgb("#F8E4E8"), radius: 1mm, inset: (x: 3mm, y: 1.5mm))[
            *Mã đề:* #text(weight: "bold", fill: palette.primary, code)
          ]
        }
      ])]
    })
    #place(bottom + right, dx: 4mm, dy: 4mm,
      image("/assets/branding/icons/exam-corner.svg", width: 27mm))
  ]
  v(4mm)
  grid(columns: (1fr, 1fr), column-gutter: 8mm, align: bottom,
    grid(columns: (auto, 1fr), column-gutter: 2mm, align: bottom,
      [Họ, tên thí sinh:], line(length: 100%, stroke: (paint: palette.ink, thickness: 0.7pt, dash: "dotted"))),
    grid(columns: (auto, 1fr), column-gutter: 2mm, align: bottom,
      [Số báo danh:], line(length: 100%, stroke: (paint: palette.ink, thickness: 0.7pt, dash: "dotted"))))
  v(3mm)
  line(length: 100%, stroke: (paint: palette.primary, thickness: 1.2pt, dash: "dashed"))
}

#let exam-section(number, title, instruction: []) = block(width: 100%, sticky: true,
  above: exam-style.section-gap, below: 2mm)[
  #text(weight: "bold", fill: palette.primary)[PHẦN #number.]
  #text(weight: "bold", fill: palette.exam-blue, title) #instruction
]

#let exam-table(columns: auto, header: (), ..cells) = table(
  columns: columns, align: center + horizon, inset: 4.5pt, stroke: plot-style.table-stroke,
  fill: (x, y) => if y == 0 { plot-style.table-fill } else { white },
  table.header(..header.map(it => text(weight: "bold", fill: white, it))), ..cells.pos())

#let exam-question(number, body, answers: (), statements: (), solution: [],
  variant: "de", writing-lines: 6, columns: auto, ending: none, keep-together: false, statements-table: false) = {
  let prompt = [
    #text(weight: "bold", fill: palette.primary)[Câu #number.] #body
    #if statements.len() > 0 {
      if statements-table {
        block(above: 3mm, below: 0pt, exam-table(columns: (1fr, 13mm, 13mm),
          header: ([Mệnh đề], [Đúng], [Sai]),
          ..statements.enumerate().map(((i, it)) => (align(left)[#("abcd".at(i))) #it], [], [])).flatten()))
      } else {
        block(above: 5mm, below: 0pt, grid(columns: (1fr,), row-gutter: exam-style.statement-gap,
          ..statements.enumerate().map(((i, it)) => [#("abcd".at(i))) #it])))
      }
    }
    #if answers.len() > 0 { v(3mm); choices(answers, columns: columns, label-color: palette.exam-blue) }
  ]
  block(width: 100%, breakable: variant != "dap-an" and not keep-together and (ending == none or variant != "de-cach"), sticky: false,
    above: if variant == "de" {4mm} else {exam-style.question-gap}, below: 0pt,
    stroke:if variant=="dap-an" {0.7pt+palette.primary} else {none},
    fill:if variant=="dap-an" {palette.box-fill} else {none},
    radius:2mm,inset:if variant=="dap-an" {3.5mm} else {0pt})[
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
