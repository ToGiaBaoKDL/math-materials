#import "writing.typ": writing-space, final-writing-space
#import "theme.typ": palette, fonts, rhythm, document-style, lesson-style, line-style
#import "branding.typ": running-head, running-foot
#import "components.typ": choices

// Shared DXT heading: document files supply content, not presentation.
#let lesson-heading(course, title, subtitle: none,
  author: [Biên soạn và giảng dạy: Thầy Đỗ Xuân Thắng]) = block(
  width: 100%, stroke: 0.6pt + palette.primary,
  radius: 3mm, inset: (x: 5mm, y: 4mm),
)[
  #set par(justify: false, leading: 0.5em)
  #align(center)[
    #block(fill: rgb("#008000"), radius: 2mm, inset: (x: 7mm, y: 2mm))[
      #text(font: fonts.course, size: 20.5pt, weight: "bold", fill: white, course)
    ]
    #v(1mm)
    #layout(size => {
      let candidates = (fonts.lesson-title, fonts.lesson-title-long, fonts.lesson-title-longer)
      let chosen = candidates.last()
      for candidate in candidates {
        if measure(text(font: candidate, size: 25pt, weight: "bold", title)).width <= size.width {
          chosen = candidate
          break
        }
      }
      text(font: chosen, size: 25pt, weight: "bold", fill: palette.heading, title)
    })
    #if subtitle != none {
      v(1mm)
      text(font: fonts.subtitle, size: 11.5pt, subtitle)
    }
  ]
  #v(1mm)
  #align(right, text(font: fonts.course, size: 11pt, style: "italic")[\- #author -])
]

#let lesson(title, body, variant: "de", branding: lesson-style.branding, heading-image: none, heading-content: none, heading-top-trim: lesson-style.heading-top-trim) = {
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
  set page(paper: document-style.paper, margin: lesson-style.margin, fill: palette.paper,
    background: context {
      let number = counter(page).get().first()
      let total = counter(page).final().first()
      place(top + left, running-head(branding.badge, branding.header,
        branded: true, margin: lesson-style.margin))
      place(bottom + left, running-foot(branding.footer, number, total,
        margin: lesson-style.margin))
    },
  )
  block(width: 100%, below: if heading-image == none { lesson-style.title-gap } else { 0pt })[
    #if heading-content != none {
      heading-content
    } else if heading-image != none {
      layout(size => {
        let banner = image(heading-image, width: size.width,
          alt: "Ảnh tiêu đề do người dùng cung cấp")
        // Clip only the image's blank top margin; keep the source asset intact.
        block(width: 100%, height: measure(banner).height - heading-top-trim,
          clip: true, place(top + left, dy: -heading-top-trim, banner))
      })
    } else {
      align(center, text(font: fonts.ui, size: lesson-style.title-size,
        weight: document-style.emphasis, fill: palette.primary, title))
    }
  ]
  body
}

#let lesson-section(title, number: none, badge: none, above: lesson-style.section-above) = block(
  width: 100%, sticky: true, above: above, below: 5mm,
)[
  #set par(justify: false)
  #layout(size => {
    let green = rgb("#008A16")
    let edge = green.lighten(30%)
    let mark = if number != none { str(number) } else { badge }
    let raw-caption = text(font: fonts.section, size: lesson-style.section-size,
      weight: "bold", fill: palette.heading,
      if number == none { title } else { [DẠNG #number: #title] })
    let start = if mark == none { 4mm } else { 17mm }
    let banner-left = if mark == none { 0mm } else { 6mm }
    let caption = text(font: fonts.section, size: lesson-style.section-size * calc.min(1, (size.width - 12mm - start - 6mm)/measure(raw-caption).width),
      weight: "bold", fill: palette.heading,
      if number == none { title } else { [DẠNG #number: #title] })
    let banner-width = calc.min(size.width - 12mm, start + measure(caption).width + 6mm)
    grid(columns: (auto, 1fr), column-gutter: 4mm, align: horizon,
      block(width: banner-width, height: 12mm)[
        #place(top + left, dy: 0.6mm, polygon(
          (banner-left, 0mm), (banner-left + 25mm, 0mm),
          (banner-left + 26mm, 2mm), (banner-left, 2mm),
          fill: green, stroke: none))
        #place(top + left, dy: 1.5mm, polygon(
          (banner-left, 0mm), (banner-width - 2mm, 0mm), (banner-width, 4.5mm),
          (banner-width - 2mm, 9mm), (banner-left, 9mm),
          fill: palette.paper, stroke: 0.65pt + edge))
        #place(top + left, dx: start,
          block(width: banner-width - start - 3mm, height: 12mm,
            align(left + horizon, caption)))
        #if mark != none {
          let vertices = ((0, 6), (3, 0), (10, 0), (13, 6), (10, 12), (3, 12))
          let blend(a, b, t) = ((a.at(0) + (b.at(0) - a.at(0))*t)*1mm,
            (a.at(1) + (b.at(1) - a.at(1))*t)*1mm)
          let segments = ()
          for i in range(6) {
            let vertex = vertices.at(i)
            let incoming = blend(vertex, vertices.at(calc.rem(i + 5, 6)), 0.22)
            let outgoing = blend(vertex, vertices.at(calc.rem(i + 1, 6)), 0.22)
            segments.push(if i == 0 { curve.move(incoming) } else { curve.line(incoming) })
            let corner = (vertex.at(0)*1mm, vertex.at(1)*1mm)
            let control(a) = ((a.at(0) + 2*corner.at(0))/3,
              (a.at(1) + 2*corner.at(1))/3)
            segments.push(curve.cubic(control(incoming), control(outgoing), outgoing))
          }
          place(top + left, curve(..segments, curve.close(mode: "straight"),
            fill: rgb("#006B18"), stroke: (thickness: 2pt, paint: gradient.linear(
              rgb("#E9F8E9"), rgb("#8FC398"), angle: 45deg, relative: "self"))))
          place(top + left, block(width: 13mm, height: 12mm,
            align(center + horizon, text(font: fonts.section, size: 15pt,
              weight: document-style.emphasis, fill: palette.paper, mark))))
        }
      ],
      line(length: 100%, stroke: (paint: edge, dash: "dashed",
        thickness: line-style.fine)),
    )
  })
]

#let theory-box(title: none, breakable: true, body) = block(width: 100%, breakable: breakable,
  above: lesson-style.theory-above, below: lesson-style.theory-below,
  fill: palette.box-fill,
  stroke: 0.65pt + palette.primary,
  radius: 0pt, inset: lesson-style.theory-inset,
)[
  #if title != none {
    block(width: 100%, sticky: true, below: lesson-style.paragraph-gap,
      text(weight: document-style.emphasis, fill: palette.primary, title))
  }
  #body
]

#let paragraph(body, keep-next: false) = block(width: 100%, sticky: keep-next,
  above: 0pt, below: lesson-style.paragraph-gap, body)

#let subheading(body) = block(width: 100%, sticky: true,
  above: lesson-style.paragraph-gap, below: lesson-style.paragraph-gap,
)[
  #set par(justify: false)
  #text(weight: document-style.emphasis, fill: palette.primary, body)
]

#let formula(lines) = block(width: 100%, breakable: false,
  above: lesson-style.formula-gap, below: lesson-style.formula-gap,
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
  grid(columns: (1fr,), row-gutter: lesson-style.formula-row-gap,
    ..rows.map(row => math.equation(block: true, numbering: none, row)))
}))

// Independent equations occupy separate rows; formula() instead wraps one long derivation.
#let formula-rows(rows) = block(width:100%,breakable:false,above:lesson-style.formula-gap,below:lesson-style.formula-gap)[
  #show math.equation.where(block:true): set block(above:0pt,below:0pt)
  #grid(columns:(1fr,),row-gutter:lesson-style.formula-row-gap,
    ..rows.map(row=>block(width:100%,breakable:false,math.equation(block:true,numbering:none,row.body))))
]

#let exercise(number, body, answers: (), statements: (), solution: [],
  variant: "de", writing-lines: 6, source-id: none, keep-together: true) = {
  let stem = [
    #if source-id != none {
      context [#metadata((id: source-id, page: counter(page).get().first())) <exercise-location>]
    }
    #text(weight: document-style.emphasis, fill: palette.ink)[Câu #number:]
    #text(weight: document-style.emphasis, fill: palette.question-tag)[\[DXT\]] #body
    #if answers.len()>0 {v(rhythm.answers);choices(answers)}
  ]
  let prompt = [
    #if keep-together {stem} else {block(width:100%,breakable:false,above:0pt,below:0pt,stem)}
    #if statements.len()>0 {
      block(width:100%,above:lesson-style.statement-before,below:0pt,
        grid(columns:(1fr,),row-gutter:lesson-style.statement-gap,
          ..statements.map(statement=>block(width:100%,above:0pt,below:0pt,statement))))
    }
  ]
  if variant == "de-cach" {
    block(width: 100%, breakable: false, above: rhythm.question, below: 0pt)[
      #prompt
      #writing-space(writing-lines)
    ]
    final-writing-space()
  } else {
    block(width: 100%, breakable: not keep-together, sticky: variant == "dap-an" and keep-together,
      above: rhythm.question, below: 0pt, prompt)
  }
  if variant == "dap-an" {
    let heading = block(width:100%,sticky:true,above:if keep-together {lesson-style.solution-gap} else {0pt},
      below:lesson-style.paragraph-gap,
      align(center,text(style:"italic",weight:document-style.emphasis,
        fill:palette.primary)[Lời giải]))
    if keep-together {
      heading
      solution
    } else {
      // Discard inter-block whitespace so the heading attaches to real content.
      let parts=solution.fields().at("children",default:(solution,))
        .filter(it=>repr(it.func()) != "space")
      if parts.len()>0 {
        block(width:100%,breakable:false,above:lesson-style.solution-gap)[#heading#parts.first()]
        if parts.len()>2 {
          for part in parts.slice(1,calc.max(1,parts.len()-2)) {part}
          block(width:100%,breakable:false)[#parts.at(-2)#parts.last()]
        } else if parts.len()==2 {parts.last()}
      } else {heading}
    }
  }
}
