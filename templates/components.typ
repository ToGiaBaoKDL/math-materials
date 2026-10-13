#import "theme.typ": palette, rhythm, document-style, content-style, line-style

#let choices(values, columns: auto, label-color: palette.primary) = layout(size => {
  set par(justify: false)
  let format(value) = {
    show math.equation: set text(top-edge: "bounds", bottom-edge: "bounds")
    show math.equation: it => math.display(it)
    value
  }
  let required = (calc.max(..values.map(value => measure(format(value)).width))
    + content-style.answer-label-width + content-style.answer-label-gap)
  let count = if columns != auto { columns }
    else if required <= (size.width - 3 * rhythm.answer-column) / 4 { 4 }
    else if required <= (size.width - rhythm.answer-column) / 2 { 2 }
    else { 1 }
  grid(
    columns: (1fr,) * count,
    column-gutter: rhythm.answer-column, row-gutter: rhythm.answer-row,
    align: left + horizon,
    ..values.enumerate().map(((index, value)) => grid(
      columns: (content-style.answer-label-width, 1fr),
      column-gutter: content-style.answer-label-gap, align: left + horizon,
      text(weight: document-style.emphasis, fill: label-color)[#("ABCD".at(index)).],
      format(value),
    )),
  )
})

#let figure-panel(body) = block(
  width: 100%, breakable: false, above: rhythm.figure-above, below: rhythm.figure-below,
  align(center, body),
)

#let figure-row(..figures) = grid(
  columns: (auto,) * figures.pos().len(), column-gutter: rhythm.figure-column,
  align: center + horizon, ..figures.pos(),
)

#let end-mark(note) = block(width: 100%, breakable: false, above: 0pt, below: 0pt, align(center)[
  #grid(
    columns: (content-style.end-rule, auto, content-style.end-rule),
    column-gutter: content-style.end-gap, align: horizon,
    line(length: content-style.end-rule, stroke: line-style.fine + palette.primary),
    text(weight: document-style.emphasis, fill: palette.primary)[HẾT],
    line(length: content-style.end-rule, stroke: line-style.fine + palette.primary),
  )
  #v(rhythm.ending-note)
  #text(size: document-style.note-size, style: "italic", note)
])
