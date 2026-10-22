#import "theme.typ": exam-palette as palette, exam-style, fonts, plot-style
#import "components.typ": choices, end-mark, figure-panel, solution-heading
#import "exam-branding.typ": exam-footer, exam-header
#import "writing.typ": final-writing-space, writing-space

#let exam(title, code, body, variant: "de", leading: exam-style.leading) = {
  assert(("de", "de-cach", "dap-an", "de-dap-an").contains(variant), message: "Unknown exam variant")
  set document(title: title)
  set text(font: fonts.body, size: exam-style.body-size, lang: "vi", fill: palette.ink)
  show strong: set text(weight: "bold")
  show math.equation: set text(font: fonts.math, top-edge: "bounds", bottom-edge: "bounds")
  show math.equation.where(block: false): it => box(math.display(it))
  show math.frac: it => math.display(it)
  set par(justify: true, leading: leading, spacing: 2.5mm)
  set page(paper: "a4", margin: exam-style.margin, background: context {
    place(top + left, exam-header())
    place(bottom + left, exam-footer(code))
  })
  body
}

#let exam-cover(
  organization,
  title,
  code,
  duration: 90,
  subject: "Toán",
  grade: "12",
  status: none,
  note: none,
  organization-size: 12pt,
  title-size: 12pt,
  duration-size: 12pt,
  pages: none,
  exam-date: none,
  heading-increase: 0pt,
  left-column: 56%,
) = {
  set par(justify: false, leading: 0.55em)
  let school-color = palette.section-green
  let title-color = palette.cover-title
  block(width: 100%, breakable: false, radius: 3mm, stroke: 1pt + palette.primary, fill: white, clip: true, inset: (
    x: 4mm,
    y: 4mm,
  ))[
    #set text(font: fonts.ui, size: 12.5pt)
    #set par(spacing: 1mm, leading: 1em)
    #layout(space => {
      let available-left = space.width * 0.56 - 8mm
      let available-right = space.width * 0.44 - 12mm
      let size = (
        14pt
          * calc.min(
            1,
            available-left / measure(text(size: 14pt, weight: "bold", organization)).width,
            available-right / measure(text(size: 14pt, weight: "bold", title)).width,
          )
      )
      let heading-size = size + heading-increase
      let heading(body, color) = text(size: heading-size, weight: "bold", fill: color, stroke: 0.12pt + color, body)
      [#table(
        columns: (left-column, 100% - left-column),
        stroke: none,
        inset: (x: 4mm, y: 1mm),
        align: horizon,
        table.cell(align: top + center, stroke: (right: 0.6pt + palette.cover-rule))[
          #heading(organization, school-color)
          #v(1mm)
          #line(length: 100%, stroke: 0.5pt + palette.cover-rule)
        ],
        table.cell(align: top + center, inset: (left: 4mm, right: 2mm, y: 1mm))[
          #heading(title, title-color)
        ],
        ..(
          (
            (
              context text(
                weight: "bold",
              )[Đề thi gồm #(if pages == none { counter(page).final().first() } else { pages }) trang],
              [*Môn:* #subject #grade],
            ),
            (
              text(size: 12pt, weight: "bold")[Thời gian làm bài: #text(fill: palette.primary)[#duration phút]],
              if exam-date != none { [*Ngày thi:* #exam-date] } else { [] },
            ),
            (
              text(size: 11.5pt, style: "italic")[(Không kể thời gian phát đề)],
              if code != none {
                box(fill: palette.code-fill, radius: 1mm, inset: (x: 3mm, y: 1.5mm))[
                  *Mã đề:* #text(weight: "bold", fill: palette.primary, code)
                ]
              } else if note != none { text(size: 12.5pt, style: "italic", note) } else { [] },
            ),
          )
        )
          .enumerate()
          .map(((i, pair)) => (
            table.cell(inset: (left: 35mm, right: 4mm, y: 1mm), stroke: (right: 0.6pt + palette.cover-rule))[
              #block(height: 9mm)[
                #align(horizon, pair.at(0))
              ]
            ],
            table.cell(inset: (left: 8mm, right: 4mm, y: 1mm))[
              #block(height: 9mm, align(horizon, pair.at(1)))
            ],
          ))
          .flatten(),
      )]
    })
    #place(
      bottom + left,
      dx: 3.5mm,
      dy: -6mm,
      image("/assets/branding/icons/clock.svg", width: 22mm),
    )
    #place(bottom + right, dx: 4mm, dy: 7mm, image("/assets/branding/icons/exam-corner.svg", width: 27mm))
  ]
  v(4mm)
  grid(
    columns: (1fr, 1fr),
    column-gutter: 8mm,
    align: bottom,
    grid(
      columns: (auto, 1fr),
      column-gutter: 2mm,
      align: bottom,
      [Họ, tên thí sinh:], line(length: 100%, stroke: (paint: palette.ink, thickness: 0.7pt, dash: "dotted")),
    ),
    grid(
      columns: (auto, 1fr),
      column-gutter: 2mm,
      align: bottom,
      [Số báo danh:], line(length: 100%, stroke: (paint: palette.ink, thickness: 0.7pt, dash: "dotted")),
    ),
  )
  v(3mm)
  line(length: 100%, stroke: (paint: palette.primary, thickness: 1.2pt, dash: "dashed"))
}

#let exam-section(number, title, instruction: []) = block(
  width: 100%,
  sticky: true,
  above: exam-style.section-gap,
  below: 2mm,
)[
  #set par(justify: false)
  #box(fill: palette.primary, inset: (x: 2mm, y: 1.5mm))[
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
  table.header(..header.map(it => table.cell(stroke: 0.6pt + white, text(
    weight: "bold",
    fill: white,
    it,
  )))), ..cells.pos()
)

#let exam-question(
  number,
  body,
  answers: (),
  statements: (),
  solution: [],
  variant: "de",
  writing-lines: 6,
  columns: auto,
  ending: none,
  keep-together: false,
  statements-table: false,
) = {
  let prompt = [
    #text(weight: "bold", fill: palette.primary)[Câu #number.] #body
    #if statements.len() > 0 {
      if statements-table {
        block(above: 3mm, below: 0pt, exam-table(
          columns: (1fr, 13mm, 13mm),
          header: ([Mệnh đề], [Đúng], [Sai]),
          ..statements.enumerate().map(((i, it)) => (align(left)[#("abcd".at(i))) #it], [], [])).flatten(),
        ))
      } else {
        block(above: 5mm, below: 0pt, grid(
          columns: (1fr,), row-gutter: exam-style.statement-gap,
          ..statements.enumerate().map(((i, it)) => [#("abcd".at(i))) #it])
        ))
      }
    }
    #if answers.len() > 0 {
      v(3mm)
      choices(answers, columns: columns, label-color: palette.exam-blue)
    }
  ]
  block(
    width: 100%,
    breakable: variant != "dap-an" and not keep-together and (ending == none or variant != "de-cach"),
    sticky: false,
    above: if variant == "de" { 4mm } else { exam-style.question-gap },
    below: 0pt,
    stroke: if variant == "dap-an" { 0.7pt + palette.primary } else { none },
    fill: if variant == "dap-an" { palette.box-fill } else { none },
    radius: 2mm,
    inset: if variant == "dap-an" { 3.5mm } else { 0pt },
  )[
    #prompt
    #if variant == "de-cach" { writing-space(writing-lines) }
  ]
  if variant == "de-cach" {
    final-writing-space()
  }
  if variant == "dap-an" {
    let answer = [
      #solution-heading(above: exam-style.solution-above, below: exam-style.solution-below, color: palette.primary)
      #solution
    ]
    answer
  }
  if ending != none {
    if variant != "de-cach" { v(1fr) }
    ending
  }
}

#let exam-end(note: []) = end-mark(
  note,
  rule: exam-style.end-rule,
  gap: exam-style.end-gap,
  color: palette.primary,
  thickness: exam-style.end-stroke,
  above: exam-style.end-above,
  below: auto,
  note-gap: exam-style.end-note-gap,
  styled-note: false,
)

#let exam-figure(body, size: 100%) = figure-panel(
  scale(x: size, y: size, reflow: true, body),
  above: exam-style.figure-gap,
  below: exam-style.figure-gap,
)

#let exam-source(ai: false) = block(width: 100%, above: 3mm)[
  #set text(size: 10pt)
  #set par(justify: false)
  Nguồn đề: TOANMATH.com.
  #if ai {
    [
      #linebreak() Đề thi được gõ lại từ ảnh chụp, không phải bản chính thức từ đơn vị ra đề.
      #linebreak() Lời giải chi tiết do AI thực hiện, chỉ mang tính chất tham khảo, không thay thế đáp án chính thức.
    ]
  }
]
