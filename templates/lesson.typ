#import "writing.typ": final-writing-space, writing-space
#import "theme.typ": document-style, fonts, lesson-style, line-style, palette, rhythm, writing-style
#import "branding.typ": running-foot, running-head
#import "components.typ": choices, solution-heading

// Shared DXT heading: document files supply content, not presentation.
#let lesson-heading(
  course,
  title,
  subtitle: none,
  title-tracking: 0pt,
  horizontal-inset: 5mm,
  title-size: 25pt,
  course-size: 20.5pt,
  title-stroke: none,
  author: [Biên soạn và giảng dạy: Thầy Đỗ Xuân Thắng],
  plain: false,
  border: 0.6pt + palette.primary,
) = block(
  width: 100%,
  stroke: border,
  radius: 3mm,
  inset: (x: horizontal-inset, y: 4mm),
)[
  #set par(justify: false, leading: 0.5em)
  #align(center)[
    #if not plain and course != none {
      block(fill: palette.course-green, radius: 2mm, inset: (x: 7mm, y: 2mm))[
        #text(font: fonts.course, size: course-size, weight: "bold", fill: white, course)
      ]
      v(1mm)
    }
    #layout(size => {
      let candidates = (fonts.lesson-title, fonts.lesson-title-long, fonts.lesson-title-longer)
      let chosen = candidates.last()
      for candidate in candidates {
        if measure(text(font: candidate, size: title-size, tracking: title-tracking, weight: "bold", title)).width <= size.width {
          chosen = candidate
          break
        }
      }
      text(font: chosen, size: title-size, tracking: title-tracking, weight: "bold", fill: palette.heading, stroke: title-stroke, title)
    })
    #if subtitle != none {
      v(1mm)
      text(font: fonts.subtitle, size: 11.5pt, fill: if plain { palette.heading } else { palette.ink }, subtitle)
    }
  ]
  #v(1mm)
  #align(right, text(font: fonts.course, size: 11pt, style: "italic", fill: if plain { palette.heading } else {
    palette.ink
  })[\- #author -])
]

#let lesson(
  title,
  body,
  variant: "de",
  branding: lesson-style.branding,
  heading-image: none,
  heading-content: none,
  heading-top-trim: lesson-style.heading-top-trim,
) = {
  assert(("de", "de-cach", "dap-an").contains(variant), message: "Unknown lesson variant")
  set document(title: title)
  set text(font: fonts.body, size: lesson-style.body-size, fill: palette.ink, lang: "vi", overhang: false)
  show strong: set text(weight: document-style.emphasis)
  show math.equation: set text(font: fonts.math, top-edge: "bounds", bottom-edge: "bounds")
  show math.equation.where(block: false): it => box(math.display(it))
  set math.equation(supplement: none)
  show math.frac: it => math.display(it)
  set math.cases(gap: 0.8em)
  set par(justify: true, leading: lesson-style.leading, spacing: lesson-style.paragraph-gap)
  set page(paper: document-style.paper, margin: lesson-style.margin, fill: palette.paper, background: context {
    let number = counter(page).get().first()
    let total = counter(page).final().first()
    place(top + left, running-head(branding.badge, branding.header, branded: true, margin: lesson-style.margin))
    place(bottom + left, running-foot(branding.footer, number, total, margin: lesson-style.margin))
  })
  block(width: 100%, below: if heading-image == none { lesson-style.title-gap } else { 0pt })[
    #if heading-content != none {
      heading-content
    } else if heading-image != none {
      layout(size => {
        let banner = image(heading-image, width: size.width, alt: "Ảnh tiêu đề do người dùng cung cấp")
        // Clip only the image's blank top margin; keep the source asset intact.
        block(width: 100%, height: measure(banner).height - heading-top-trim, clip: true, place(
          top + left,
          dy: -heading-top-trim,
          banner,
        ))
      })
    } else {
      align(center, text(
        font: fonts.ui,
        size: lesson-style.title-size,
        weight: document-style.emphasis,
        fill: palette.primary,
        title,
      ))
    }
  ]
  body
}

#let lesson-section(title, number: none, badge: none, above: lesson-style.section-above) = block(
  width: 100%,
  sticky: true,
  above: above,
  below: 5mm,
)[
  #set par(justify: false)
  #layout(size => {
    let green = palette.lesson-green
    let edge = green.lighten(30%)
    let mark = if number != none { str(number) } else { badge }
    let raw-caption = text(
      font: fonts.section,
      size: lesson-style.section-size,
      weight: "bold",
      fill: palette.heading,
      if number == none { title } else { [DẠNG #number: #title] },
    )
    let start = if mark == none { 4mm } else { 17mm }
    let banner-left = if mark == none { 0mm } else { 6mm }
    let caption = text(
      font: fonts.section,
      size: lesson-style.section-size * calc.min(1, (size.width - 12mm - start - 6mm) / measure(raw-caption).width),
      weight: "bold",
      fill: palette.heading,
      if number == none { title } else { [DẠNG #number: #title] },
    )
    let banner-width = calc.min(size.width - 12mm, start + measure(caption).width + 6mm)
    grid(
      columns: (auto, 1fr),
      column-gutter: 4mm,
      align: horizon,
      block(width: banner-width, height: 12mm)[
        #place(top + left, dy: 0.6mm, polygon(
          (banner-left, 0mm),
          (banner-left + 25mm, 0mm),
          (banner-left + 26mm, 2mm),
          (banner-left, 2mm),
          fill: green,
          stroke: none,
        ))
        #place(top + left, dy: 1.5mm, polygon(
          (banner-left, 0mm),
          (banner-width - 2mm, 0mm),
          (banner-width, 4.5mm),
          (banner-width - 2mm, 9mm),
          (banner-left, 9mm),
          fill: palette.paper,
          stroke: 0.65pt + edge,
        ))
        #place(top + left, dx: start, block(width: banner-width - start - 3mm, height: 12mm, align(
          left + horizon,
          caption,
        )))
        #if mark != none {
          let vertices = ((0, 6), (3, 0), (10, 0), (13, 6), (10, 12), (3, 12))
          let blend(a, b, t) = ((a.at(0) + (b.at(0) - a.at(0)) * t) * 1mm, (a.at(1) + (b.at(1) - a.at(1)) * t) * 1mm)
          let segments = ()
          for i in range(6) {
            let vertex = vertices.at(i)
            let incoming = blend(vertex, vertices.at(calc.rem(i + 5, 6)), 0.22)
            let outgoing = blend(vertex, vertices.at(calc.rem(i + 1, 6)), 0.22)
            segments.push(if i == 0 { curve.move(incoming) } else { curve.line(incoming) })
            let corner = (vertex.at(0) * 1mm, vertex.at(1) * 1mm)
            let control(a) = ((a.at(0) + 2 * corner.at(0)) / 3, (a.at(1) + 2 * corner.at(1)) / 3)
            segments.push(curve.cubic(control(incoming), control(outgoing), outgoing))
          }
          place(top + left, curve(..segments, curve.close(mode: "straight"), fill: palette.lesson-badge, stroke: (
            thickness: 2pt,
            paint: gradient.linear(
              palette.lesson-badge-light,
              palette.lesson-badge-shade,
              angle: 45deg,
              relative: "self",
            ),
          )))
          place(top + left, block(width: 13mm, height: 12mm, align(center + horizon, text(
            font: fonts.section,
            size: 15pt,
            weight: document-style.emphasis,
            fill: palette.paper,
            mark,
          ))))
        }
      ],
      line(length: 100%, stroke: (paint: edge, dash: "dashed", thickness: line-style.fine)),
    )
  })
]

#let theory-box(title: none, breakable: true, body) = block(
  width: 100%,
  breakable: breakable,
  above: lesson-style.theory-above,
  below: lesson-style.theory-below,
  fill: palette.box-fill,
  stroke: 0.65pt + palette.primary,
  radius: 0pt,
  inset: lesson-style.theory-inset,
)[
  #if title != none {
    block(width: 100%, sticky: true, below: lesson-style.paragraph-gap, text(
      weight: document-style.emphasis,
      fill: palette.primary,
      title,
    ))
  }
  #body
]

#let paragraph(body, keep-next: false, gap: lesson-style.paragraph-gap) = block(
  width: 100%,
  sticky: keep-next,
  above: gap,
  below: gap,
  body,
)

#let subheading(body) = block(
  width: 100%,
  sticky: true,
  above: lesson-style.paragraph-gap,
  below: lesson-style.paragraph-gap,
)[
  #set par(justify: false)
  #text(weight: document-style.emphasis, fill: palette.primary, body)
]

#let formula(lines) = block(
  width: 100%,
  breakable: false,
  above: lesson-style.formula-gap,
  below: lesson-style.formula-gap,
  layout(size => {
    let bodies = lines.map(it => it.body)
    let rows = ()
    let current = []
    for part in bodies {
      let candidate = current + part
      let width = measure(math.equation(block: false, math.display(candidate))).width
      if width > size.width and current != [] {
        rows.push(current)
        current = part
      } else { current = candidate }
    }
    if current != [] { rows.push(current) }
    // Grid gutters measure the gap between equation bounds, without stacking
    // equation defaults, paragraph leading, and explicit vertical space.
    show math.equation.where(block: true): set block(above: 0pt, below: 0pt)
    grid(
      columns: (1fr,), row-gutter: lesson-style.formula-row-gap,
      ..rows.map(row => math.equation(block: true, numbering: none, row))
    )
  }),
)

// Independent equations occupy separate rows; formula() instead wraps one long derivation.
#let formula-rows(rows) = block(
  width: 100%,
  breakable: false,
  above: lesson-style.formula-gap,
  below: lesson-style.formula-gap,
)[
  #show math.equation.where(block: true): set block(above: 0pt, below: 0pt)
  #grid(
    columns: (1fr,), row-gutter: lesson-style.formula-row-gap,
    ..rows.map(row => block(width: 100%, breakable: false, math.equation(block: true, numbering: none, row.body)))
  )
]

#let exercise(
  number,
  body,
  answers: (),
  statements: (),
  solution: [],
  variant: "de",
  question-gap: rhythm.question,
  writing-lines: 6,
  fill-writing-page: true,
  writing-keep-prompt: true,
  writing-single-page: false,
  compact-statements: false,
  writing-line-gap: writing-style.ruled-gap,
  source-id: none,
  keep-together: true,
  keep-solution-start: false,
  flow-stem: false,
  statements-table: false,
) = {
  let stem = [
    #if source-id != none {
      context [#metadata((id: source-id, page: counter(page).get().first())) <exercise-location>]
    }
    #text(weight: document-style.emphasis, fill: palette.ink)[Câu #number:]
    #text(weight: document-style.emphasis, fill: palette.question-tag)[\[DXT\]] #body
    #if answers.len() > 0 {
      v(rhythm.answers)
      choices(answers)
    }
  ]
  let prompt = [
    #if keep-together or flow-stem { stem } else { block(width: 100%, breakable: false, above: 0pt, below: 0pt, stem) }
    #if statements.len() > 0 {
      block(width: 100%, above: lesson-style.statement-before, below: 0pt, if statements-table {
        set text(size: 12.5pt)
        table(
          columns: (1fr, 17mm, 17mm),
          inset: (x: 2.5mm, y: if compact-statements { 1.5mm } else { 2.5mm }),
          stroke: 0.6pt + palette.primary,
          align: (x, y) => if x == 0 { left + top } else { center + horizon },
          fill: (x, y) => if y == 0 { palette.primary } else { none },
          table.header(
            ..([Mệnh đề], [Đúng], [Sai])
              .enumerate()
              .map(((i, t)) => table.cell(stroke: (
                right: if i < 2 { 0.8pt + white } else { 0.6pt + palette.primary },
              ))[#text(fill: white, weight: "bold", t)]),
          ),
          ..statements
            .map(s => (
              block(width: 100%, breakable: false, above: 0pt, below: 0pt)[
                #set text(top-edge: "bounds", bottom-edge: "bounds")
                #set par(justify: false, leading: 0.65em, spacing: 0pt)
                #s
              ],
              [],
              [],
            ))
            .flatten(),
        )
      } else {
        grid(
          columns: (1fr,), row-gutter: lesson-style.statement-gap,
          ..statements.map(statement => block(width: 100%, above: 0pt, below: 0pt, statement))
        )
      })
    }
  ]
  if variant == "de-cach" {
    block(
      width: 100%,
      breakable: not writing-single-page and (statements-table or not writing-keep-prompt),
      above: question-gap,
      below: 0pt,
    )[
      #block(width: 100%, breakable: statements-table and not writing-keep-prompt, sticky: writing-keep-prompt, prompt)
      #if not writing-keep-prompt {
        block(width: 100%, breakable: false, writing-space(writing-lines, gap: writing-line-gap))
      } else { writing-space(writing-lines, gap: writing-line-gap) }
    ]
    if fill-writing-page { final-writing-space(gap: writing-line-gap) }
  } else {
    block(
      width: 100%,
      breakable: not keep-together,
      sticky: variant == "dap-an" and keep-solution-start,
      above: question-gap,
      below: 0pt,
      stroke: if variant == "dap-an" { 0.7pt + palette.primary } else { none },
      fill: if variant == "dap-an" { palette.box-fill } else { none },
      radius: 2mm,
      inset: if variant == "dap-an" { 3.5mm } else { 0pt },
      prompt,
    )
  }
  if variant == "dap-an" {
    solution-heading(
      above: lesson-style.solution-gap,
      below: lesson-style.solution-heading-gap,
    )
    solution
  }
}
