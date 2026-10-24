#import "/templates/drawing.typ": label, path, smooth
#let blue = rgb("#0077C8")
#let red = rgb("#BD153C")
#let brown = rgb("#7B3F00")
#let orange = rgb("#C45A00")
#let mint = rgb("#B5E9DE")
#let salmon = rgb("#FF91A4")
#let cyan = rgb("#55DCE5")
#let lime = rgb("#D5FF62")
#let pt(p) = (p.at(0) * 1mm, p.at(1) * 1mm)
#let segment(points, color: brown, dashed: false, fill: none, close: false, thickness: 1pt) = path(
  points.map(pt),
  stroke: (paint: color, thickness: thickness, dash: if dashed { (2.5pt, 2.5pt) } else { "solid" }),
  fill: fill,
  close: close,
)
#let dot(p, name, dx: 0, dy: -4) = {
  place(top + left, dx: p.at(0) * 1mm - 0.65mm, dy: p.at(1) * 1mm - 0.65mm, circle(
    radius: 0.65mm,
    fill: blue,
    stroke: none,
  ))
  label(pt(p), name, dx: dx * 1mm, dy: dy * 1mm, width: 12mm)
}
#let note(p, name) = label(pt(p), name, width: 14mm)
#let arc(c, r, start, end, color: brown) = smooth(
  t => pt((c.at(0) + r * calc.cos(t * 1rad), c.at(1) + r * calc.sin(t * 1rad))),
  t => pt((-r * calc.sin(t * 1rad), r * calc.cos(t * 1rad))),
  start,
  end,
  stroke: 1pt + color,
)
#let plane(points, name: $(P)$, fill: mint, corner: true, radius: 10) = {
  segment(points, fill: fill, close: true)
  let c = points.first()
  // Plane patches have a horizontal front edge and an upper-right side.
  let last = points.last()
  let start = calc.atan2(last.at(0) - c.at(0), last.at(1) - c.at(1)) / 1rad
  if corner {
    arc(c, radius, start, 0)
    note((c.at(0) + radius * .60, c.at(1) - 2.7), name)
  }
}
#let marks(x, y, color: red) = segment(((x - 1.4, y - 0.8), (x + 1.4, y + 0.8)), color: color, thickness: 1pt)
#let picture(name) = {
  if name == "point-line-plane" {
    plane(((9, 48), (80, 48), (94, 28), (23, 28)), fill: rgb("#FFE6A3"))
    segment(((65, 5), (65, 38)), color: blue)
    segment(((65, 38), (65, 48)), color: blue, dashed: true)
    segment(((65, 48), (65, 63)), color: blue)
    segment(((34, 38), (65, 38)), color: red, thickness: 1pt)
    segment(((61.5, 38), (61.5, 34.5), (65, 34.5)))
    dot((34, 38), $A$, dx: -3, dy: -4)
    dot((65, 38), $H$, dx: 4.5, dy: 1.5)
    dot((65, 24), $B$, dx: 4, dy: 0)
    dot((65, 10), $C$, dx: 4, dy: 0)
  } else if name in ("point-plane", "plane-reflection") {
    plane(((9, 48), (80, 48), (94, 28), (23, 28)), fill: if name == "point-plane" { lime } else { salmon })
    segment(((53, 4), (53, 38)), color: orange, thickness: 1.3pt)
    segment(((53, 38), (53, 48)), color: orange, dashed: true, thickness: 1.3pt)
    segment(((53, 48), (53, 73)), color: orange, thickness: 1.3pt)
    segment(((53, 34.5), (56.5, 34.5), (56.5, 38)))
    dot((53, 8), $A$, dx: 4, dy: 0)
    dot((53, 38), $H$, dx: -4.5, dy: 1.5)
    note((47, 5), $d$)
    if name == "plane-reflection" {
      dot((53, 68), $A'$, dx: 5, dy: 0)
      marks(53, 23)
      marks(53, 53)
    }
  } else if name in ("line-projection", "line-projection-homework") {
    let homework = name == "line-projection-homework"
    plane(((8, 56), (98, 56), (88, 35), (22, 35)), fill: if homework { salmon } else { lime }, corner: false)
    // Label the upper-left corner, clear of the line passing through the plane.
    arc((22, 35), 7, 0, calc.atan2(-14, 21) / 1rad)
    note((24, 38), text(size: 9pt)[$(P)$])
    // d joins (30,45) to (68,14); d' joins their projections on P.
    segment(((4, 45), (99, 45)), color: blue, thickness: 1pt)
    segment(((30, 45), (82, 45 - 52 * 31 / 38)), color: orange, thickness: 1pt)
    let edge = (30 - 11 * 38 / 31, 56)
    segment(((30, 45), edge), color: orange, dashed: true, thickness: 1pt)
    segment((edge, (9, 45 + 21 * 31 / 38)), color: orange, thickness: 1pt)
    segment(((68, 14), (68, 45)), color: red, thickness: 1pt)
    segment(((64.5, 45), (64.5, 41.5), (68, 41.5)))
    dot((30, 45), if homework { $M$ } else { $A$ }, dx: 4, dy: 4.5)
    dot((68, 14), if homework { $N$ } else { $M$ }, dx: -5, dy: -3)
    dot((68, 45), if homework { $M'$ } else { $H$ }, dx: 5, dy: 4.5)
    note((78, 10), $d$)
    note((96, 41), $d'$)
    note((73, 29), $Delta$)
  } else if name == "line-reflection" {
    segment(((10, 40), (91, 40)), color: blue, thickness: 1.3pt)
    segment(((49, 10), (49, 70)), color: orange, thickness: 1.3pt)
    segment(((49, 36.5), (52.5, 36.5), (52.5, 40)))
    marks(49, 25)
    marks(49, 55)
    dot((49, 10), $A$, dx: 4, dy: 0)
    dot((49, 40), $H$, dx: -4, dy: 4)
    dot((49, 70), $A'$, dx: 5, dy: 0)
    note((88, 35), $d$)
  } else if name == "sphere-tangent" {
    plane(((9, 88), (81, 88), (95, 70), (23, 70)), fill: salmon)
    // Schematic line positions retain collinearity and IA:IB=5:3.
    // Distances along AB are compressed for a compact illustration.
    let c = (45, 65)
    let r = 12
    place(top + left, dx: 33mm, dy: 53mm, circle(radius: 12mm, fill: lime, stroke: 1pt + brown))
    for (a, b, hidden) in ((calc.pi, 2 * calc.pi, true), (0, calc.pi, false)) {
      smooth(
        t => pt((45 + r * calc.cos(t * 1rad), 65 + 3.4 * calc.sin(t * 1rad))),
        t => pt((-r * calc.sin(t * 1rad), 3.4 * calc.cos(t * 1rad))),
        a,
        b,
        stroke: (paint: orange, thickness: 1pt, dash: if hidden { (2.5pt, 2.5pt) } else { "solid" }),
      )
    }
    let norm = calc.sqrt(4.4 * 4.4 + 8 * 8)
    let vx = 4.4 / norm
    let vy = -8 / norm
    let entry = (45 + 12 * vx, 65 + 12 * vy)
    let exit = (45 - 12 * vx, 65 - 12 * vy)
    segment(((68.65, 22), entry), color: blue)
    segment((entry, exit), color: blue, dashed: true)
    segment((exit, (38.4, 77)), color: blue)
    segment(((38.4, 77), (34.55, 84)), color: blue, dashed: true)
    segment((c, (45, 77)), color: red, dashed: true)
    // Extend the normal below H to show a clear right angle on the plane.
    segment(((45, 77), (45, 82)), color: red, dashed: true)
    segment(((45, 77), (53, 77)), color: brown)
    segment(((45, 80.5), (48.5, 80.5), (48.5, 77)), color: brown)
    dot(c, $I$, dx: -5, dy: 0.5)
    dot((45, 77), $H$, dx: 6, dy: 4)
    dot((67, 25), $A$, dx: 5, dy: 0)
    dot((58.2, 41), $B$, dx: 5, dy: 0)
    note((49, 72), $R$)
  } else if name == "maximum-distance" {
    plane(((10, 62), (83, 62), (98, 26), (25, 26)), name: $(alpha)$, fill: salmon, radius: 8)
    let A = (45, 6)
    let H = (70, 43)
    let foot = (45, 43)
    segment(((49.65, 56.75), (90.35, 29.25)), color: blue, thickness: 1pt)
    segment((A, H), color: orange, thickness: 1pt)
    segment((A, foot), color: red, thickness: 1pt)
    segment((foot, H), color: brown, dashed: true)
    segment(((45, 39.5), (48.5, 39.5), (48.5, 43)))
    // AH and the displayed d - direction (37,-25) are perpendicular.
    let v = (-25 / calc.sqrt(1994), -37 / calc.sqrt(1994))
    let u = (37 / calc.sqrt(1994), -25 / calc.sqrt(1994))
    segment((
      (70 + 3 * v.at(0), 43 + 3 * v.at(1)),
      (70 + 3 * (u.at(0) + v.at(0)), 43 + 3 * (u.at(1) + v.at(1))),
      (70 + 3 * u.at(0), 43 + 3 * u.at(1)),
    ))
    dot(A, $A$, dx: -4, dy: 0)
    dot(foot, $I$, dx: -4, dy: 2)
    dot(H, $H$, dx: 4, dy: 3)
    note((92, 34), $d$)
  }
}
#let diagram(name, width: 88mm) = block(width: 100%, above: 6mm, below: 6mm, breakable: false, align(center, scale(
  x: 1.1 * width / 100mm * 100%,
  y: 1.1 * width / 100mm * 100%,
  reflow: true,
  origin: top + left,
  box(
    width: 100mm,
    height: if name in ("plane-reflection", "point-plane", "line-reflection") { 78mm } else if name
      == "sphere-tangent" { 76mm } else { 70mm },
    if name == "sphere-tangent" {
      place(top + left, dy: -18mm, picture(name))
    } else { picture(name) },
  ),
)))
