#import "/templates/drawing.typ": arrow-line, label, path, smooth
#import "/templates/theme.typ": figure-style, palette

#let salmon = rgb("#FF91A4")
#let cyan = rgb("#55DCE5")
#let lime = rgb("#BFFF36")
#let cinnamon = rgb("#7B3F00")
#let edge(color) = figure-style.edge-width + color
#let hidden(color) = (paint: color, thickness: figure-style.edge-width, dash: "dashed")
#let dot(p, color: palette.ink) = place(top + left, dx: p.at(0) - 0.55mm, dy: p.at(1) - 0.55mm, circle(
  radius: 0.55mm,
  fill: color,
  stroke: none,
))

#let direction-vectors() = block(width: 112mm, height: 34mm)[
  #path(((8mm, 29mm), (102mm, 9mm)), stroke: edge(palette.geometry-green))
  #arrow-line((20mm, 14mm), (48mm, 8mm), color: palette.geometry-orange)
  #arrow-line((48mm, 25mm), (90mm, 16mm), color: palette.geometry-blue)
  #label((37mm, 6mm), $k ⋅ arrow(u)$, width: 26mm)
  #label((69mm, 25mm), $arrow(u)$)
  #label((104mm, 8mm), $d$, dx: 3mm)
]

#let normal-plane() = block(width: 96mm, height: 62mm)[
  #path(
    ((6mm, 53mm), (72mm, 53mm), (90mm, 32mm), (24mm, 32mm)),
    fill: lime,
    stroke: edge(palette.geometry-green),
    close: true,
  )
  #path(((60mm, 42mm), (60mm, 4mm)), stroke: 1.2pt + palette.geometry-blue)
  #path(((60mm, 37mm), (65mm, 37mm), (65mm, 42mm), (60mm, 42mm)), stroke: edge(palette.geometry-green))
  #arrow-line((37mm, 44mm), (37mm, 26mm), color: palette.geometry-orange, thickness: 1.2pt)
  #dot((60mm, 18mm), color: palette.geometry-blue)
  #label((60mm, 18mm), $A$, dx: 4mm, dy: -2mm)
  #label((32mm, 27mm), $arrow(n)_(lr((P)))$, width: 24mm)
  #label((15mm, 50mm), $(P)$)
]

#let angle-bisector() = {
  // Reorient u2 so the source acute angle has cosine 1/3; sum equal-length rays.
  let A = (22mm, 30mm)
  let u = (20mm, -20mm / calc.sqrt(2))
  let v = (20mm, 20mm / calc.sqrt(2))
  let along(v, t) = (A.at(0) + t * v.at(0), A.at(1) + t * v.at(1))
  let B = along(u, 1)
  let C = along(v, 1)
  let K = (62mm, 30mm)
  block(width: 108mm, height: 62mm, {
    path((A, B, K, C), fill: salmon, stroke: none, close: true)
    path((along(u, -0.8), along(u, 1.7)), stroke: edge(palette.geometry-green))
    path((along(v, -0.8), along(v, 1.7)), stroke: edge(palette.geometry-blue))
    path((A, (101mm, 30mm)), stroke: edge(cinnamon))
    path((B, K, C), stroke: hidden(cinnamon))
    arrow-line(A, B, color: palette.geometry-green)
    arrow-line(A, C, color: palette.geometry-blue)
    dot(A)
    label((61mm, 6mm), $Delta$)
    label((61mm, 54mm), $d$)
    label((101mm, 27mm), $gamma$)
  })
}

#let triangle-bisector() = {
  // |AB| = |AM| and cos(BAM) = -2/3 from the source coordinates.
  let rise = 32mm / calc.sqrt(5)
  let A = (40mm, 8mm)
  let B = (8mm, 8mm + rise)
  let M = (72mm, 8mm + rise)
  let C = (104mm, 8mm + 2 * rise)
  let K = (40mm, 8mm + 2 * rise)
  let edge-color = palette.geometry-blue
  block(width: 116mm, height: 49mm, {
    path((A, B, C), fill: cyan, stroke: none, close: true)
    path((B, K, M), fill: salmon, stroke: none, close: true)
    path((A, B, C), stroke: edge(edge-color), close: true)
    path((B, K, M), stroke: edge(palette.geometry-green))
    path((A, K), stroke: edge(cinnamon))
    let alpha = calc.atan(1 / calc.sqrt(5)) / 1rad
    let point(t) = (A.at(0) + 9mm * calc.cos(t), A.at(1) + 9mm * calc.sin(t))
    let tangent(t) = (-9mm * calc.sin(t), 9mm * calc.cos(t))
    smooth(point, tangent, alpha, calc.pi - alpha, stroke: edge(cinnamon))
    for t in ((alpha + calc.pi / 2) / 2, (calc.pi * 1.5 - alpha) / 2) {
      path(
        (
          (A.at(0) + 7.5mm * calc.cos(t), A.at(1) + 7.5mm * calc.sin(t)),
          (A.at(0) + 10.5mm * calc.cos(t), A.at(1) + 10.5mm * calc.sin(t)),
        ),
        stroke: edge(cinnamon),
      )
    }
    for p in (A, B, C, M, K) { dot(p, color: edge-color) }
    label(A, $A$, dy: -4mm)
    label(B, $B$, dx: -4mm, dy: 2mm)
    label(C, $C$, dx: 4mm)
    label(M, $M$, dy: -4mm)
    label(K, $K$, dy: 5mm)
  })
}

#let line-plane-midpoint() = {
  let M = (43mm, 17mm)
  let N = (65mm, 53mm)
  let A = ((M.at(0) + N.at(0)) / 2, (M.at(1) + N.at(1)) / 2)
  block(width: 108mm, height: 78mm, {
    path(
      ((5mm, 64mm), (80mm, 64mm), (101mm, 43mm), (26mm, 43mm)),
      fill: cyan,
      stroke: edge(palette.geometry-blue),
      close: true,
    )
    path(((10mm, 24mm), (96mm, 5.76mm)), stroke: edge(palette.geometry-green))
    path(((34mm, 2.27mm), N), stroke: edge(palette.primary))
    path((N, (71.72mm, 64mm)), stroke: hidden(palette.primary))
    path(((71.72mm, 64mm), (77mm, 72.64mm)), stroke: edge(palette.primary))
    for p in (M, A) { dot(p, color: palette.primary) }
    dot(N, color: palette.primary)
    label(M, $M$, dx: 4mm, dy: -2mm)
    label(A, $A$, dx: 4mm, dy: -1mm)
    label(N, $N$, dx: 4mm)
    label((37mm, 3mm), $Delta$, dx: 4mm)
    label((95mm, 4mm), $d$, dy: -1mm)
    smooth(
      t => (5mm + 8mm * calc.cos(t), 64mm + 8mm * calc.sin(t)),
      t => (-8mm * calc.sin(t), 8mm * calc.cos(t)),
      -calc.pi / 4,
      0,
      stroke: edge(palette.geometry-blue),
    )
    label((19mm, 61mm), $(P)$)
  })
}
