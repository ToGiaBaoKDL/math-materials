#import "theme.typ": content-style, document-style, line-style, palette, rhythm

#let choices(values, columns: auto, label-color: palette.primary, row-gap: none) = layout(size => {
  set par(justify: false)
  let format(value) = {
    show math.equation: set text(top-edge: "bounds", bottom-edge: "bounds")
    show math.equation: it => math.display(it)
    value
  }
  let required = (
    calc.max(..values.map(value => measure(format(value)).width))
      + content-style.answer-label-width
      + content-style.answer-label-gap
  )
  let count = if columns != auto { columns } else if required <= (size.width - 3 * rhythm.answer-column) / 4 {
    4
  } else if required <= (size.width - rhythm.answer-column) / 2 { 2 } else { 1 }
  grid(
    columns: (1fr,) * count,
    column-gutter: rhythm.answer-column, row-gutter: if row-gap == none { rhythm.answer-row } else { row-gap },
    align: left + horizon,
    ..values
      .enumerate()
      .map(((index, value)) => block(width: 100%)[
        #set par(hanging-indent: content-style.answer-label-width + content-style.answer-label-gap)
        #box(width: content-style.answer-label-width, text(weight: document-style.emphasis, fill: label-color)[#("ABCD".at(index)).])#h(content-style.answer-label-gap)#format(value)
      ]),
  )
})

#let figure-panel(body, above: rhythm.figure-above, below: rhythm.figure-below) = block(
  width: 100%,
  breakable: false,
  above: above,
  below: below,
  align(center, body),
)

#let figure-row(..figures) = grid(
  columns: (auto,) * figures.pos().len(), column-gutter: rhythm.figure-column,
  align: center + horizon, ..figures.pos(),
)

#let solution-heading(above: 0pt, below: 3mm, color: palette.primary) = block(
  width: 100%,
  sticky: true,
  above: above,
  below: below,
  align(center, text(style: "italic", weight: document-style.emphasis, fill: color)[Lời giải]),
)

#let end-mark(
  note,
  rule: content-style.end-rule,
  gap: content-style.end-gap,
  color: palette.primary,
  thickness: line-style.fine,
  above: 0pt,
  below: 0pt,
  note-gap: rhythm.ending-note,
  styled-note: true,
) = block(
  width: 100%,
  breakable: false,
  above: above,
  below: below,
  align(if styled-note { center } else { left })[
    #align(center, grid(
      columns: (rule, auto, rule),
      column-gutter: gap,
      align: horizon,
      line(length: rule, stroke: thickness + color),
      text(weight: document-style.emphasis, fill: color)[HẾT],
      line(length: rule, stroke: thickness + color),
    ))
    #v(note-gap)
    #if styled-note { text(size: document-style.note-size, style: "italic", note) } else { note }
  ],
)
