#import "theme.typ": exam-palette as palette, fonts, plot-style
#import "drawing.typ": arrow-line

// Curves, guides and labels use the same mathematical coordinate map.
#let graph(
  f,
  curve-stroke: plot-style.curve,
  xrange: (-3, 3),
  yrange: (-4, 4),
  width: plot-style.width,
  height: plot-style.height,
  breaks: (),
  domain: auto,
  points: (),
  xticks: (),
  yticks: (),
  guides: (),
  asymptotes: (),
  asymptote-stroke: plot-style.guide,
  origin-offset: (-1.5mm, 1.5mm),
  y-label-side: auto,
  y-label-offsets: (:),
  name: none,
) = {
  let pad = 6mm
  let p(x, y) = (
    pad + (x - xrange.first()) / (xrange.last() - xrange.first()) * (width - 2 * pad),
    pad + (yrange.last() - y) / (yrange.last() - yrange.first()) * (height - 2 * pad),
  )
  let label(point, body, horizontal: center, vertical: top, backing: white) = context {
    let content = box(fill: backing, inset: 0.5mm, text(font: fonts.body, size: plot-style.label-size, body))
    let size = measure(content)
    let dx = if horizontal == right { -size.width } else if horizontal == center { -size.width / 2 } else { 0pt }
    let dy = if vertical == bottom { -size.height } else if vertical == horizon { -size.height / 2 } else { 0pt }
    place(top + left, dx: point.at(0) + dx, dy: point.at(1) + dy, content)
  }
  block(width: width, height: height, breakable: false)[
    #let origin = p(0, 0)
    #for (x, y) in guides {
      place(top + left, curve(curve.move(p(x, 0)), curve.line(p(x, y)), curve.line(p(0, y)), stroke: plot-style.guide))
    }
    #for (a, b) in asymptotes {
      place(top + left, line(start: p(..a), end: p(..b), stroke: asymptote-stroke))
    }
    #arrow-line(p(xrange.first(), 0), p(xrange.last(), 0), color: palette.ink, thickness: 0.6pt)
    #arrow-line(p(0, yrange.first()), p(0, yrange.last()), color: palette.ink, thickness: 0.6pt)
    #let curve-range = if domain == auto { xrange } else { domain }
    #let ends = (curve-range.first(),) + breaks + (curve-range.last(),)
    #for j in range(ends.len() - 1) {
      let a = ends.at(j) + 0.015
      let b = ends.at(j + 1) - 0.015
      let segments = ()
      let active = false
      for i in range(401) {
        let x = a + (b - a) * i / 400
        let y = f(x)
        if y >= yrange.first() and y <= yrange.last() {
          segments.push(if active { curve.line(p(x, y)) } else { curve.move(p(x, y)) })
          active = true
        } else { active = false }
      }
      place(top + left, curve(..segments, stroke: curve-stroke))
    }
    #for x in xticks {
      let q = p(x, 0)
      place(top + left, line(
        start: (q.at(0), q.at(1) - 0.7mm),
        end: (q.at(0), q.at(1) + 0.7mm),
        stroke: 0.55pt + palette.ink,
      ))
    }
    #for y in yticks {
      let q = p(0, y)
      place(top + left, line(
        start: (q.at(0) - 0.7mm, q.at(1)),
        end: (q.at(0) + 0.7mm, q.at(1)),
        stroke: 0.55pt + palette.ink,
      ))
    }
    #for point in points {
      let q = p(..point)
      place(top + left, dx: q.at(0) - 0.5mm, dy: q.at(1) - 0.5mm, circle(
        radius: 0.5mm,
        fill: palette.ink,
        stroke: none,
      ))
    }
    // Label plates are last, so guides can never run through a digit.
    #label((width - pad + 0.5mm, origin.at(1)), [$x$], horizontal: left)
    #label((origin.at(0) - 1mm, pad - 0.5mm), [$y$], horizontal: right, vertical: bottom)
    #label(
      (origin.at(0) + origin-offset.at(0), origin.at(1) + origin-offset.at(1)),
      [$O$],
      horizontal: if origin-offset.at(0) > 0mm { left } else { right },
      vertical: if origin-offset.at(1) < 0mm { bottom } else { top },
      backing: none,
    )
    #for x in xticks {
      let at-break = breaks.contains(x)
      let above = if at-break { true } else { f(x) < 0 }
      let near-curve = not at-break and calc.abs(p(x, f(x)).at(1) - origin.at(1)) < 3mm
      let rising = if at-break { false } else { f(x + 0.01) > f(x - 0.01) }
      let dx = if at-break { -1.5mm } else if near-curve {
        if rising != above { 2mm } else { -2mm }
      } else { 0mm }
      label(
        (p(x, 0).at(0) + dx, origin.at(1) + if above { -2.5mm } else { 2.5mm }),
        str(x),
        horizontal: if at-break { right } else { center },
        vertical: if above { bottom } else { top },
      )
    }
    #for y in yticks {
      if y-label-offsets.keys().contains(str(y).replace("−", "-")) {
        let offset = y-label-offsets.at(str(y).replace("−", "-"))
        label(
          (origin.at(0) + offset.at(0), p(0, y).at(1) + offset.at(1)),
          str(y),
          horizontal: if offset.at(0) > 0mm { left } else { right },
          vertical: horizon,
          backing: none,
        )
        continue
      }
      // Put labels opposite their horizontal guide/curve branch, beyond tick marks.
      let matching-guides = guides.filter(point => point.at(1) == y)
      let right-side = if y-label-side != auto { y-label-side == right } else if matching-guides.len() > 0 {
        matching-guides.first().at(0) < 0
      } else { y < 0 }
      let guide-on-side = matching-guides.any(point => (point.at(0) > 0) == right-side)
      let below-guide = guide-on-side and y < 0
      let on-asymptote = asymptotes.any(pair => pair.at(0).at(1) == y and pair.at(1).at(1) == y)
      label(
        (
          origin.at(0) + if right-side { if y < 0 { 4mm } else { 2.5mm } } else { -2.5mm },
          p(0, y).at(1) + if below-guide { 1mm } else if on-asymptote or guide-on-side { -1mm } else { 0mm },
        ),
        str(y),
        horizontal: if right-side { left } else { right },
        vertical: if below-guide { top } else if on-asymptote or guide-on-side { bottom } else { horizon },
      )
    }
    #if name != none {
      label(p(xrange.first(), yrange.first()), name, horizontal: left, vertical: bottom)
    }
  ]
}

#let variation(xs, signs, values, levels, width: 110mm, closed-right: false) = {
  let n = xs.len()
  let first-x = 17mm
  let right = width - 7mm
  let step = (right - first-x) / (n - 1)
  let px(i) = first-x + i * step
  let py(i) = if levels.at(i) == 1 { 21mm } else { 33mm }
  let label(x, y, body, color: palette.ink) = context {
    let content = text(size: 11pt, fill: color, top-edge: "bounds", bottom-edge: "bounds", body)
    let size = measure(content)
    place(top + left, dx: x - size.width / 2, dy: y - size.height / 2, content)
  }
  block(width: width, height: 38mm, breakable: false)[
    #place(top + left, rect(width: width, height: 8mm, fill: plot-style.variation-fill, stroke: none))
    #place(top + left, rect(width: 10mm, height: 38mm, fill: plot-style.variation-fill, stroke: none))
    #place(top + left, rect(width: width, height: 38mm, stroke: plot-style.table-stroke))
    #place(top + left, line(start: (10mm, 0mm), end: (10mm, 38mm), stroke: plot-style.table-stroke))
    #for y in (8mm, 16mm) {
      place(top + left, line(start: (0mm, y), end: (width, y), stroke: plot-style.table-stroke))
    }
    #label(5mm, 4mm, [$x$], color: palette.primary)
    #label(5mm, 12mm, [$y'$], color: palette.primary)
    #label(5mm, 27mm, [$y$], color: palette.primary)
    #if closed-right {
      for dx in (1.5mm, 2.5mm) {
        place(top + left, line(start: (width - dx, 8mm), end: (width - dx, 38mm), stroke: plot-style.table-stroke))
      }
    }
    #for i in range(n) {
      label(px(i), 4mm, xs.at(i), color: palette.ink)
      label(px(i), py(i), values.at(i))
      if i > 0 and i < n - 1 { label(px(i), 12mm, [$0$]) }
      if i < n - 1 {
        let sign = signs.at(i)
        let x = px(i) + step / 2
        if sign == "+" or sign == "−" or sign == [$+$] or sign == [$-$] {
          place(top + left, line(start: (x - 1mm, 12mm), end: (x + 1mm, 12mm), stroke: 0.5pt + palette.ink))
          if sign == "+" or sign == [$+$] {
            place(top + left, line(start: (x, 11mm), end: (x, 13mm), stroke: 0.5pt + palette.ink))
          }
        } else { label(x, 12mm, sign) }
        arrow-line((px(i) + 5mm, py(i)), (px(i + 1) - 5mm, py(i + 1)), color: palette.primary)
      }
    }
  ]
}
