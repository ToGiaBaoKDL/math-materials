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
  let school-color = palette.section-green
  let title-color = rgb("#C6001D")
  block(width: 100%, breakable: false, radius: 3mm, stroke: 1pt + palette.primary,
    fill: white, clip: true, inset: (x: 4mm, y: 4mm))[
    #set text(font: fonts.ui, size: 10.5pt)
    #set par(spacing: 1mm, leading: 1em)
    #layout(space => {
      let base-size = 12pt
      let heading-width = calc.max(
        measure(text(size: base-size, weight: "bold", organization)).width,
        measure(text(size: base-size, weight: "bold", title)).width)
      let heading-scale = calc.min(100%, (space.width / 2 - 14mm) / heading-width * 100%)
      let heading(body, color) = scale(x: heading-scale, y: heading-scale, reflow: true,
        box(width: heading-width, text(size: base-size, weight: "bold", fill: color, stroke: 0.12pt + color, body)))
      [#table(columns: (1fr, 1fr), stroke: none, inset: (x: 4mm, y: 1mm), align: horizon,
      table.cell(align: top + center, stroke: (right: 0.6pt + rgb("#E4B7C0")))[
        #heading(organization, school-color)
      ],
      table.cell(align: top, inset: (left: 10mm, right: 4mm, y: 1mm))[
        #heading(title, title-color)
      ],
      table.cell(stroke: (right: 0.6pt + rgb("#E4B7C0")))[
        #align(center)[
          #line(length: 100%, stroke: 0.5pt + rgb("#E4B7C0"))
        ]
      ], [],
      ..(
        (context text(weight: "bold")[Đề thi gồm #(if pages == none {counter(page).final().first()} else {pages}) trang], [*Môn:* #subject]),
        (text(size: 10pt, weight: "bold")[Thời gian làm bài: #text(fill: palette.primary)[#duration phút]], [*Khối:* #grade]),
        (text(size: 9.5pt, style: "italic")[(Không kể thời gian phát đề)],
          if code != none {
            box(fill: rgb("#F8E4E8"), radius: 1mm, inset: (x: 3mm, y: 1.5mm))[
              *Mã đề:* #text(weight: "bold", fill: palette.primary, code)
            ]
          } else if note != none { text(size: 10.5pt, style: "italic", note) } else { [] }),
      ).enumerate().map(((i, pair)) => (
        table.cell(inset: (left: 31mm, right: 4mm, y: 1mm), stroke: (right: 0.6pt + rgb("#E4B7C0")))[
          #block(height: 8mm)[
            #align(horizon, pair.at(0))
          ]
        ],
        table.cell(inset: (left: 10mm, right: 4mm, y: 1mm))[
          #block(height: 8mm, align(horizon, pair.at(1)))
        ],
      )).flatten()
      )]
    })
    #place(bottom + left, dx: 4mm, dy: -5.5mm,
      image("/assets/branding/icons/clock.svg", width: 19mm))
    #place(bottom + right, dx: 4mm, dy: 7mm,
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
  #set par(justify: false)
  #box(fill: plot-style.table-fill, inset: (x: 2mm, y: 1.5mm))[
    #text(weight: "bold", fill: white)[PHẦN #number.]
  ]
  #h(1mm)
  #text(weight: "bold", fill: palette.section-green, stroke: 0.12pt + palette.section-green, title)
  #parbreak()
  #instruction
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
