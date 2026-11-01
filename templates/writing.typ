#import "components.typ": solution-heading
#import "theme.typ": palette, writing-style

#let writing-space(lines, gap: writing-style.ruled-gap, heading-gap: 3mm) = block(
  width: 100%,
  breakable: true,
  above: writing-style.solution-gap,
  below: 0pt,
)[
  #solution-heading(below: heading-gap)
  #for _ in range(lines) {
    block(width: 100%, height: gap, above: 0pt, below: 0pt, align(bottom, line(
      length: 100%,
      stroke: writing-style.ruled-width + palette.ink.transparentize(100% - writing-style.ruled-opacity),
    )))
  }
]

// Share unused page height between the solution areas on that page.
#let ruled-page-remainder(gap: writing-style.ruled-gap) = block(
  width: 100%,
  height: 1fr,
  clip: true,
  above: 0pt,
  below: 0pt,
)[
  #layout(size => {
    let count = calc.max(0, calc.floor(calc.max(0pt, size.height - 3mm) / gap))
    for i in range(count) {
      place(top + left, dy: (i + 1) * gap, line(
        length: 100%,
        stroke: writing-style.ruled-width + palette.ink.transparentize(100% - writing-style.ruled-opacity),
      ))
    }
  })
]


#let final-writing-space(gap: writing-style.ruled-gap, only-page-end: false) = context {
  let current = here()
  let following = query(selector(<exercise-location>).after(current))
  let has-next-on-page = following.any(it => it.location().page() == current.page())
  if not only-page-end or not has-next-on-page {
    ruled-page-remainder(gap: gap)
  }
}

