#import "/templates/drawing.typ": arrow-line as draw-arrow, label, path, smooth
#import "/templates/theme.typ": palette
#let arrow-line = draw-arrow.with(thickness: 1.35pt)
#let blue = palette.geometry-blue
#let pink = rgb("#FF91A4")
#let cyan = rgb("#55DCE5")
#let mint = rgb("#B5E9DE")
#let brown = rgb("#7B3F00")
#let edge = 1.08pt + blue
#let hidden = (paint: blue, thickness: 1.08pt, dash: "dashed")
#let dot(p) = place(top + left, dx: p.at(0) - 0.75mm, dy: p.at(1) - 0.75mm, circle(
  radius: 0.75mm,
  fill: blue,
  stroke: none,
))
#let cube-forces() = block(width: 78mm, height: 67mm, {
  let A = (25mm, 8mm)
  let B = (65mm, 8mm)
  let C = (48mm, 25mm)
  let D = (8mm, 25mm)
  let a = (25mm, 47mm)
  let b = (65mm, 47mm)
  let c = (48mm, 64mm)
  let d = (8mm, 64mm)
  path((A, B, C, D), fill: rgb("#BFFF36"), stroke: none, close: true)
  path((B, b, c, C), fill: cyan, stroke: none, close: true)
  for points in ((A, B, C, D, A), (B, b, c, d, D), (C, c)) { path(points, stroke: 1.5525pt + blue) }
  path((A, a, b), stroke: (paint: blue, thickness: 1.5525pt, dash: "dashed"))
  path((a, d), stroke: (paint: blue, thickness: 1.5525pt, dash: "dashed"))
  arrow-line(A, (16mm, 17mm), color: palette.primary, thickness: 2.295pt)
  arrow-line(A, (45mm, 8mm), color: palette.primary, thickness: 2.295pt)
  path((A, c), stroke: (paint: blue, thickness: 1.5525pt, dash: "dashed"))
  arrow-line(A, (36.5mm, 36mm), color: palette.primary, thickness: 2.295pt)
  for (p, t, dx, dy) in (
    (A, $A$, -2mm, -4mm),
    (B, $B$, 2mm, -4mm),
    (C, $C$, 6mm, 2mm),
    (D, $D$, -4mm, 0mm),
    (a, $A'$, -4mm, -2mm),
    (b, $B'$, 4mm, 0mm),
    (c, $C'$, 3mm, 1mm),
    (d, $D'$, -3mm, 1mm),
  ) {
    dot(p)
    label(p, t, dx: dx, dy: dy)
  }
  label((16mm, 10mm), $arrow(a)$)
  label((43mm, 3mm), $arrow(b)$)
  label((39mm, 32mm), text(fill: palette.primary)[$arrow(c)$])
})
#let chain(start, end) = {
  let dx = end.at(0) - start.at(0)
  let dy = end.at(1) - start.at(1)
  let length = calc.sqrt(calc.pow(dx / 1mm, 2) + calc.pow(dy / 1mm, 2)) * 1mm
  let count = calc.ceil(length / 1.6mm)
  for i in range(count) {
    let t = (i + 0.5) / count
    place(top + left, dx: start.at(0) + t * dx - 0.6mm, dy: start.at(1) + t * dy - 1mm, rotate(
      calc.atan2(dy / 1mm, dx / 1mm) - 90deg,
      ellipse(width: 1.2mm, height: 2mm, stroke: 1.08pt + brown),
    ))
  }
}
#let chandelier() = block(width: 98mm, height: 82mm, {
  let S = (49mm, 7mm)
  let rim(t) = (49mm + 38mm * calc.cos(t), 54mm + 12mm * calc.sin(t))
  let A = rim(calc.pi - 0.22)
  let C = rim(-0.22)
  let B = rim(-calc.pi / 2 - 0.22)
  let D = rim(calc.pi / 2 - 0.22)
  // A short vertical rim gives the plate thickness; cable anchors lie on the rim.
  place(top + left, dx: 11mm, dy: 45mm, ellipse(
    width: 76mm,
    height: 24mm,
    fill: rgb("#DB657F"),
    stroke: 2.025pt + brown,
  ))
  place(top + left, dx: 11mm, dy: 42mm, ellipse(width: 76mm, height: 24mm, fill: pink, stroke: 2.025pt + brown))
  for P in (A, B, C, D) { chain(S, P) }
  place(top + left, dx: 45mm, dy: 3mm, rect(width: 8mm, height: 3mm, fill: brown, stroke: none))
  for (P, t, dx, dy) in (
    (S, $S$, 9mm, -1mm),
    (A, $A$, -4mm, 1mm),
    (B, $B$, 4mm, -2mm),
    (C, $C$, 4mm, 0mm),
    (D, $D$, 0mm, 8mm),
  ) {
    dot(P)
    label(P, t, dx: dx, dy: dy)
  }
})
#let drones() = block(width: 142mm, height: 91mm, {
  let O = (40mm, 48mm)
  let project(x, y, z) = (40mm - x * 0.12mm + y * 0.45mm, 48mm + x * 0.14mm - z * 0.7mm)
  let dash(color) = (paint: color, thickness: 1.485pt, dash: "dashed")
  arrow-line(O, (8mm, 85.33mm), color: palette.ink, thickness: 1.35pt)
  arrow-line(O, (132mm, 48mm), color: palette.ink, thickness: 1.35pt)
  arrow-line(O, (40mm, 0mm), color: palette.ink, thickness: 1.35pt)
  dot(O)
  label(O, $O$, dx: -3mm, dy: -4mm)
  label((17mm, 46mm), [người điều khiển], width: 37mm)
  label((14mm, 90mm), [Hướng nam], width: 29mm)
  label((130mm, 55mm), [Hướng đông], width: 30mm)
  label((6mm, 81mm), $x$)
  label((136mm, 48mm), $y$)
  label((44mm, 2mm), $z$)
  let axis-dash = (paint: black, thickness: 1.5pt, dash: (1.2mm, 1mm), cap: "round")
  path((O, (49mm, 37.5mm)), stroke: axis-dash)
  path((O, (29mm, 48mm)), stroke: axis-dash)
  path((O, (40mm, 59mm)), stroke: axis-dash)
  // User-requested schematic spacing: A and its guides are displaced, not to scale.
  for (x, y, z, t, color) in ((150, 200, 50, $A$, palette.primary), (180, 240, 60, $B$, blue)) {
    // Schematic axis spacing; all projection guides follow the same axis directions.
    let draw-x = if x == 150 { 130 } else { x }
    let draw-y = if y == 200 { 110 } else { 170 }
    let height = if z == 50 { 26mm } else { z * 0.7mm }
    let H = project(draw-x, draw-y, 0)
    let P = (H.at(0), H.at(1) - height)
    let X = project(draw-x, 0, 0)
    let Y = project(0, draw-y, 0)
    let Z = (O.at(0), O.at(1) - height)
    path((O, H), stroke: 1.485pt + color)
    path((X, H, Y), stroke: dash(color))
    path((H, P, Z), stroke: dash(color))
    dot(H)
    dot(P)
    label(P, t, dx: 3mm, dy: 4mm)
    label(X, str(x), dx: -5mm, dy: -1mm)
    label(Y, str(y), dx: 0mm, dy: -4mm)
    label(Z, str(z), dx: -5mm)
    path(((P.at(0) - 3mm, P.at(1) - 3mm), (P.at(0) + 3mm, P.at(1) + 1mm)), stroke: 1.89pt + color)
    path(((P.at(0) - 3mm, P.at(1) + 1mm), (P.at(0) + 3mm, P.at(1) - 3mm)), stroke: 1.89pt + color)
    for dx in (-3mm, 3mm) {
      place(top + left, dx: P.at(0) + dx - 1.7mm, dy: P.at(1) - 4mm, ellipse(
        width: 3.4mm,
        height: 1.4mm,
        stroke: 1.08pt + color,
      ))
    }
  }
})
#let gable-house() = block(inset: (top: 15mm), block(width: 130mm, height: 91mm, {
  let O = (25mm, 79mm)
  let A = (79mm, 79mm)
  let B = (101mm, 46mm)
  let C = (47mm, 46mm)
  let E = (25mm, 40mm)
  let F = (79mm, 40mm)
  let G = (101mm, 7mm)
  let H = (47mm, 7mm)
  let P = (52mm, 27mm)
  let Q = (74mm, -6mm)
  // Roof ridge is one unit above the walls; coordinates share the same projection.
  path((O, A, F, E), fill: rgb("#76D9CB"), stroke: edge, close: true)
  path((A, B, G, F), fill: rgb("#37BCAB"), stroke: edge, close: true)
  path((E, F, P), fill: rgb("#76D9CB"), stroke: edge, close: true)
  path((P, F, G, Q), fill: pink, stroke: edge, close: true)
  path((E, H, Q, P), fill: rgb("#F6B0BF"), stroke: edge, close: true)
  path((O, C, B), stroke: (paint: palette.primary, thickness: 1.35pt, dash: "dashed"))
  path((C, H, G), stroke: (paint: palette.primary, thickness: 1.35pt, dash: "dashed"))
  arrow-line(O, (110mm, 79mm), color: blue)
  arrow-line(O, (25mm, 15mm), color: blue)
  arrow-line(O, (54mm, 35mm), color: palette.primary, thickness: 1.35pt, dash: "dashed")
  for (p, t, dx, dy) in (
    (O, $O(0;0;0)$, 0mm, 5mm),
    (A, $A$, 0mm, 4mm),
    (B, $B(4;5;0)$, 13mm, 0mm),
    (C, $C$, -4mm, 0mm),
    (E, $E(0;0;3)$, -12mm, -3mm),
    (F, $F$, 4mm, 0mm),
    (G, $G(4;5;3)$, 12mm, 0mm),
    (H, $H$, -4mm, 0mm),
    (P, $P(2;0;4)$, 18mm, -2mm),
    (Q, $Q(2;5;4)$, 0mm, -4mm),
  ) {
    dot(p)
    label(p, t, dx: dx, dy: dy, width: 30mm)
  }
  label((111mm, 82mm), $x$)
  label((54mm, 32mm), $y$)
  label((21mm, 16mm), $z$)
}))
#let room-lamp() = block(inset: (left: 5mm, top: 10mm), block(width: 132mm, height: 84mm, {
  let O = (79mm, 46mm)
  let H = (35mm, 62mm)
  let K = (103mm, 62mm)
  let A = (35mm, 5mm)
  let B = (35mm, 22mm)
  path(((8mm, 46mm), (79mm, 46mm), (110mm, 66mm), (39mm, 74mm)), fill: mint, stroke: none, close: true)
  path(((8mm, 10mm), (79mm, 0mm), (79mm, 46mm), (8mm, 46mm)), fill: pink, stroke: none, close: true)
  path(((79mm, 0mm), (110mm, 13mm), (110mm, 66mm), (79mm, 46mm)), fill: cyan, stroke: none, close: true)
  arrow-line(O, (-2mm, 46mm), color: palette.ink, thickness: 1.8pt)
  arrow-line(O, (125mm, 76.67mm), color: palette.ink, thickness: 1.8pt)
  arrow-line(O, (79mm, -6mm), color: palette.ink, thickness: 1.8pt)
  path((A, B), stroke: 1.8pt + brown)
  path((B, H, K), stroke: (paint: blue, thickness: 1.8pt, dash: "dashed"))
  path((O, H), stroke: (paint: palette.primary, thickness: 1.8pt, dash: "dashed"))
  arrow-line(O, (91mm, 54mm), color: rgb("#B00020"), thickness: 2.6pt, tip: 2.2mm)
  path(((31mm, 24mm), (39mm, 24mm), B), fill: brown, stroke: edge, close: true)
  for (p, t, dx, dy) in (
    (O, $O$, -3mm, -3mm),
    (A, $A$, -4mm, 0mm),
    (B, $B$, -4mm, 0mm),
    (H, $H$, 0mm, 4mm),
    (K, $K$, 2mm, -4mm),
  ) {
    dot(p)
    label(p, t, dx: dx, dy: dy)
  }
  label((41mm, 13mm), [1 m])
  label((65mm, 65mm), [5 m])
  label((-1mm, 42mm), $x$)
  label((127mm, 74mm), $y$)
  label((83mm, -5mm), $z$)
  label((91mm, 49mm), text(fill: rgb("#B00020"), weight: "bold")[$arrow(j)$])
}))
#let roof-house() = block(width: 118mm, height: 88mm, {
  let edge-color = black
  let edge = 1.5pt + edge-color
  let hidden = (paint: edge-color, thickness: 1.5pt, dash: "dashed")
  let M = (8mm, 80mm)
  let N = (79mm, 80mm)
  let P = (108mm, 56mm)
  let O = (37mm, 56mm)
  let B = (8mm, 53mm)
  let C = (79mm, 53mm)
  let D = (108mm, 29mm)
  let A = (37mm, 29mm)
  let S = (58mm, 5mm)
  path((M, N, C, B), fill: mint, stroke: none, close: true)
  path((N, P, D, C), fill: cyan, stroke: none, close: true)
  path((B, C, S), fill: rgb("#BFFF36"), stroke: none, close: true)
  path((C, D, S), fill: rgb("#8FE817"), stroke: none, close: true)
  // Draw each edge once above all face fills, including the closing edge BM.
  for points in ((M, N, P, D, S, B, M), (B, C, D), (S, C, N)) {
    path(points, stroke: edge)
  }
  path((M, O, P), stroke: hidden)
  path((O, A, D), stroke: hidden)
  path((B, A, S), stroke: hidden)
  for (p, t, dx, dy) in (
    (M, $M$, -3mm, 4mm),
    (N, $N$, 0mm, 4mm),
    (P, $P$, 4mm, 0mm),
    (O, $O$, -4mm, 0mm),
    (A, $A$, -4mm, -2mm),
    (B, $B$, -4mm, 0mm),
    (C, $C$, 3mm, 1mm),
    (D, $D$, 4mm, 0mm),
    (S, $S$, 9mm, -1mm),
  ) {
    dot(p)
    label(p, t, dx: dx, dy: dy)
  }
})

#let drone-forces() = block(width: 115mm, height: 55mm, {
  let A = (55mm, 37mm)
  path(((8mm, 46mm), (85mm, 51mm), (107mm, 30mm), (30mm, 25mm)), fill: mint, stroke: edge, close: true)
  arrow-line(A, (94mm, 39mm), color: palette.primary, thickness: 1.8pt)
  arrow-line(A, (26mm, 46mm), color: rgb("#C58A00"), thickness: 1.8pt)
  arrow-line(A, (55mm, 5mm), color: palette.geometry-green, thickness: 1.8pt)
  let start = calc.atan(2 / 39) / 1rad
  let end = calc.pi - calc.atan(9 / 29) / 1rad
  smooth(
    t => (A.at(0) + 7mm * calc.cos(t), A.at(1) + 7mm * calc.sin(t)),
    t => (-7mm * calc.sin(t), 7mm * calc.cos(t)),
    start,
    end,
    stroke: 1pt + brown,
  )
  label((55.4mm, 40.4mm), text(size: 8pt)[$135 degree$], width: 10mm)
  dot(A)
  label(A, $A$, dx: -4mm, dy: -3mm)
  label((93mm, 34mm), $arrow(F)_1$)
  label((25mm, 41mm), $arrow(F)_2$)
  label((61mm, 8mm), $arrow(F)_3$)
  label((95mm, 46mm), $(alpha)$)
})
#let jet(p, color: blue) = {
  let x = p.at(0)
  let y = p.at(1)
  // Nose faces right; swept wings and tail make direction unambiguous.
  path(
    (
      (x + 9mm, y),
      (x + 2mm, y - 1.4mm),
      (x - 3mm, y - 6mm),
      (x - 5mm, y - 6mm),
      (x - 3mm, y - 1mm),
      (x - 7mm, y - 1mm),
      (x - 9mm, y - 3mm),
      (x - 10mm, y - 3mm),
      (x - 9mm, y),
      (x - 10mm, y + 3mm),
      (x - 9mm, y + 3mm),
      (x - 7mm, y + 1mm),
      (x - 3mm, y + 1mm),
      (x - 5mm, y + 6mm),
      (x - 3mm, y + 6mm),
      (x + 2mm, y + 1.4mm),
    ),
    fill: color,
    stroke: 0.9pt + palette.ink,
    close: true,
  )
  path(((x + 1mm, y), (x + 5mm, y)), stroke: 1.2pt + blue)
}
#let flight-path() = block(width: 124mm, height: 35mm, {
  let M = (10mm, 23mm)
  let N = (82mm, 23mm)
  let Q = (106mm, 23mm)
  arrow-line(M, (117mm, 23mm), color: blue, thickness: 1.5pt)
  path((M, N), stroke: 1.8pt + palette.primary)
  for (p, t) in ((M, $M$), (N, $N$), (Q, $Q$)) {
    dot(p)
    label(p, t, dy: 5mm)
  }
  label((46mm, 17mm), [30 phút], width: 25mm)
  label((96mm, 17mm), [10 phút], width: 25mm)
  jet((60mm, 8mm), color: cyan)
  label((73mm, 7mm), $X$)
})
#let radar-flight() = block(width: 122mm, height: 78mm, {
  let O = (65mm, 38mm)
  place(top + left, dx: 35mm, dy: 8mm, circle(radius: 30mm, fill: mint, stroke: 1.3pt + palette.geometry-green))
  let meridian(t) = (65mm + 12mm * calc.cos(t), 38mm + 30mm * calc.sin(t))
  let meridian-tangent(t) = (-12mm * calc.sin(t), 30mm * calc.cos(t))
  smooth(meridian, meridian-tangent, -calc.pi / 2, calc.pi / 2, stroke: 1pt + palette.geometry-green)
  smooth(meridian, meridian-tangent, calc.pi / 2, 3 * calc.pi / 2, stroke: (
    paint: palette.geometry-green,
    thickness: 1pt,
    dash: "dashed",
  ))
  let equator(t) = (65mm + 30mm * calc.cos(t), 38mm + 9mm * calc.sin(t))
  let tangent(t) = (-30mm * calc.sin(t), 9mm * calc.cos(t))
  smooth(equator, tangent, 0, calc.pi, stroke: 1pt + palette.geometry-green)
  smooth(equator, tangent, calc.pi, 2 * calc.pi, stroke: (
    paint: palette.geometry-green,
    thickness: 1pt,
    dash: "dashed",
  ))
  // Illustrative horizontal slice and flight chord, with B on the coverage sphere.
  let r = calc.sqrt(30 * 30 - 12 * 12) * 1mm
  place(top + left, dx: 65mm - r, dy: 26mm - 8mm, ellipse(
    width: 2 * r,
    height: 16mm,
    fill: cyan.transparentize(55%),
    stroke: (paint: blue, thickness: 0.8pt, dash: "dashed"),
  ))
  let A = (8mm, 26mm)
  let B = (65mm + r, 26mm)
  let entry = (65mm - r, 26mm)
  path((A, entry), stroke: 1.8pt + palette.primary)
  path((entry, B), stroke: (paint: palette.primary, thickness: 1.8pt, dash: (1.5mm, 1mm)))
  arrow-line(B, (113mm, 26mm), color: palette.primary, thickness: 1.8pt)
  path((O, B), stroke: (paint: blue, thickness: 1.2pt, dash: "dashed"))
  for (P, t) in ((A, $A$), (B, $B$), (O, $O$)) {
    dot(P)
    label(P, t, dx: if P == B { 5mm } else { 2mm }, dy: 5mm)
  }
  jet((18mm, 16mm), color: cyan)
  label((111mm, 21mm), $arrow(u)$)
  label((65mm, 74mm), [Vùng phủ sóng rađa], width: 50mm)
})
