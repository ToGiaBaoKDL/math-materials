#import "theme.typ": palette, writing-style, document-style

#let writing-space(lines) = block(width: 100%, breakable: true,
  above: writing-style.solution-gap, below: 0pt,
)[
  #block(width: 100%, sticky: true, below: 3mm,
    align(center, text(style: "italic", weight: document-style.emphasis, fill: palette.primary)[Lời giải]))
  #for _ in range(lines) {
    block(width: 100%, height: writing-style.ruled-gap, above: 0pt, below: 0pt,
      align(bottom, line(length: 100%, stroke: writing-style.ruled-width
        + palette.ink.transparentize(100% - writing-style.ruled-opacity))))
  }
]

// Share unused page height between the solution areas on that page.
#let final-writing-space() = block(width: 100%, height: 1fr, clip: true, above: 0pt, below: 0pt)[
  #layout(size => {
    let count = calc.max(0, calc.floor(calc.max(0pt, size.height - 3mm) / writing-style.ruled-gap))
    for i in range(count) {
      place(top + left, dy: (i + 1) * writing-style.ruled-gap - 1pt,
        line(length: 100%, stroke: writing-style.ruled-width
          + palette.ink.transparentize(100% - writing-style.ruled-opacity)))
    }
  })
]

