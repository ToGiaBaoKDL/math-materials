#import "/templates/drawing.typ": path, label, edge, hidden, face-tone, smooth
#import "/templates/components.typ": figure-row
#import "/templates/theme.typ": palette, lesson-style

#let cross(a, b) = a.at(0)*b.at(1) - a.at(1)*b.at(0)
#let minus(a, b) = (a.at(0) - b.at(0), a.at(1) - b.at(1))
#let project(point) = (18 + 1.4*(point.at(0) + 0.6*point.at(1)),
  34 - 0.85*(0.95*point.at(1) + point.at(2)))
#let screen(point) = project(point).map(it => it*1mm)
#let lerp(a, b, t) = a.zip(b).map(((x, y)) => x + (y - x)*t)
#let plane = ((-5, -12, 0), (40, -12, 0), (40, 12, 0), (-5, 12, 0))

#let in-plane(point) = {
  let polygon = plane.map(project)
  let signs = range(4).map(i => cross(minus(polygon.at(calc.rem(i + 1, 4)), polygon.at(i)),
    minus(point, polygon.at(i))))
  signs.all(it => it >= 0) or signs.all(it => it <= 0)
}

#let segment(a, b) = {
  let start = project(a)
  let delta = minus(project(b), start)
  let cuts = (0, 1)
  let dz = b.at(2) - a.at(2)
  if dz != 0 {
    let t = -a.at(2)/dz
    if 0 < t and t < 1 { cuts.push(t) }
  }
  let polygon = plane.map(project)
  for i in range(4) {
    let direction = minus(polygon.at(calc.rem(i + 1, 4)), polygon.at(i))
    let denominator = cross(direction, delta)
    if calc.abs(denominator) > 0.000001 {
      let t = cross(direction, minus(polygon.at(i), start))/denominator
      if 0 < t and t < 1 { cuts.push(t) }
    }
  }
  cuts = cuts.sorted()
  for i in range(cuts.len() - 1) {
    let mid = lerp(a, b, (cuts.at(i) + cuts.at(i + 1))/2)
    let covered = mid.at(2) < 0 and in-plane(project(mid))
    path((screen(lerp(a, b, cuts.at(i))), screen(lerp(a, b, cuts.at(i + 1)))),
      stroke: if covered { hidden } else { edge })
  }
}

#let point(position) = {
  let p = screen(position)
  place(top + left, dx: p.at(0) - 0.45mm, dy: p.at(1) - 0.45mm,
    circle(radius: 0.45mm, fill: palette.primary, stroke: none))
}

#let reflection-scene(opposite: false, reflected-label: $A'$, plane-label: none,
  height-a: 18, height-b: 12, show-foot: false, a-x: 0, plane-fill: lesson-style.plane-mint) = block(width: 94mm, height: if plane-label == none { 62mm } else { 68mm })[
  #let a = (a-x, 2, height-a)
  #let b = (30, -2, if opposite { -height-b } else { height-b })
  #let reflected = (a.at(0), a.at(1), -a.at(2))
  #let m = if opposite { (28, 2, 0) } else { lerp(reflected, b, height-a/(height-a + height-b)) }
  #path(plane.map(screen), fill: plane-fill, close: true)
  #if opposite {
    segment(a, b)
    segment(a, m)
    segment(b, m)
  } else {
    segment(a, reflected)
    segment(reflected, b)
    segment(a, m)
    point(reflected)
    label(screen(reflected), reflected-label, dy: 4mm)
    let foot = (a.at(0), a.at(1), 0)
    let h = screen(foot)
    path(((h.at(0), h.at(1) - 2mm), (h.at(0) + 2mm, h.at(1) - 2mm),
      (h.at(0) + 2mm, h.at(1))))
    if show-foot { label(h, $H$, dx: -4mm, dy: 0mm) }
  }
  #for p in (a, b, m) { point(p) }
  #label(screen(a), $A$, dx: -2mm, dy: -3mm)
  #label(screen(b), $B$, dx: 2mm, dy: if opposite { 4mm } else { -3mm })
  #label(screen(m), $M$, dx: 2mm, dy: 4mm)
  #if plane-label != none {
    let corner = screen(plane.first())
    let radius = 15mm
    // The arc stays inside the projected lower-left corner of the plane.
    smooth(t => (corner.at(0) + radius * calc.cos(t * 1rad),
                 corner.at(1) + radius * calc.sin(t * 1rad)),
      t => (-radius * calc.sin(t * 1rad), radius * calc.cos(t * 1rad)),
      -calc.atan(0.85 * 0.95 / (1.4 * 0.6)) / 1rad, 0)
    label(corner, plane-label, dx: 9.5mm, dy: -3mm, width: 8mm)
  }
]

#let reflection-theory() = figure-row(
  reflection-scene(opposite: true, height-b: 18),
  reflection-scene(show-foot: true, a-x: 6, plane-fill: lesson-style.plane-sand),
)

#let reflection-example() = reflection-scene(reflected-label: $C$,
  plane-label: $O x y$, height-a: 26, height-b: 30, a-x: 10)

#let reflection-practice() = reflection-scene(plane-label: $O y z$,
  height-a: 28, height-b: 32, a-x: 10, plane-fill: lesson-style.plane-sand)
