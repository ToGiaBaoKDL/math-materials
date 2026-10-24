#import "/templates/drawing.typ": arrow-line, label, path
#import "/templates/components.typ": figure-panel
#let ink = rgb("#007EC7")
#let red = rgb("#B60028")
#let cyan = rgb("#55DCE5")
#let pink = rgb("#FF91A4")
#let lime = rgb("#BFFF36")
#let edge = 1.35pt + ink
#let hidden = (paint: red, thickness: 1.35pt, dash: (2.5pt, 2pt))
#let figure(body, above: 5mm, below: 6mm) = figure-panel(body, above: above, below: below)
#let dot(p) = place(top + left, dx: p.at(0) - 0.65mm, dy: p.at(1) - 0.65mm, circle(
  radius: 0.65mm,
  fill: ink,
  stroke: none,
))
#let graph() = box(width: 80mm, height: 66mm)[
  #let p(x, y) = ((53 + x * 12) * 1mm, (34 - y * 9) * 1mm)
  #arrow-line(p(-3.7, 0), p(1.7, 0), color: black)
  #arrow-line(p(0, -3.2), p(0, 3.3), color: black)
  #path((p(-2, 0), p(-2, 2), p(0, 2)), stroke: hidden)
  #path(
    range(151).map(i => {
      let x = -3.15 + i * 4.25 / 150
      p(x, x * x * x + 3 * x * x - 2)
    }),
    stroke: 1.6pt + rgb("#005FE6"),
  )
  #for (pt, txt, dx, dy) in (
    (p(-2, 0), [$-2$], 0mm, 4mm),
    (p(-1, 0), [$-1$], -2mm, 4mm),
    (p(0, 0), [$O$], 3mm, 4mm),
    (p(0, 2), [$2$], 3mm, 0mm),
    (p(0, -2), [$-2$], 6mm, 2mm),
    (p(1.7, 0), [$x$], 1mm, 4mm),
    (p(0, 3.3), [$y$], 4mm, 0mm),
  ) { label(pt, txt, dx: dx, dy: dy) }
]
#let variation() = box(width: 135mm, height: 43mm)[
  #path(((0mm, 0mm), (135mm, 0mm), (135mm, 43mm), (0mm, 43mm)), stroke: edge, close: true)
  #path(((18mm, 0mm), (18mm, 43mm)), stroke: edge)
  #for y in (9, 18) { path(((0mm, y * 1mm), (135mm, y * 1mm)), stroke: edge) }
  #label((9mm, 5mm), [$x$])
  #label((9mm, 14mm), [$f'(x)$])
  #label((9mm, 31mm), [$f(x)$])
  #for (x, t) in ((27, [$-infinity$]), (60, [$-1$]), (93, [$1$]), (126, [$+infinity$])) { label((x * 1mm, 5mm), t) }
  #for (x, t) in ((43, [$+$]), (60, [$0$]), (77, [$-$]), (93, [$0$]), (110, [$+$])) { label((x * 1mm, 14mm), t) }
  #label((27mm, 38mm), [$-infinity$])
  #label((60mm, 24mm), [$3$])
  #label((93mm, 38mm), [$-5$])
  #label((126mm, 24mm), [$+infinity$])
  #for (a, b) in (((34mm, 36mm), (54mm, 25mm)), ((66mm, 25mm), (87mm, 36mm)), ((99mm, 36mm), (119mm, 25mm))) {
    arrow-line(a, b, color: ink)
  }
]
#let bridge() = image("images/cable-stayed-bridge.png", width: 145mm)
#let box-net() = box(width: 83mm, height: 90mm)[
  #let p(u, v) = ((41 + (u - v) * 13) * 1mm, (41 + (u + v) * 13) * 1mm)
  #for (a, b) in (
    ((2mm, 2mm), (80mm, 2mm)),
    ((80mm, 2mm), (80mm, 80mm)),
    ((80mm, 80mm), (2mm, 80mm)),
    ((2mm, 80mm), (2mm, 2mm)),
  ) { path((a, b), stroke: (paint: red, thickness: 1.5pt, dash: (2.5pt, 2pt))) }
  #path(
    ((-1, -2), (1, -2), (1, -1), (2, -1), (2, 1), (1, 1), (1, 2), (-1, 2), (-1, 1), (-2, 1), (-2, -1), (-1, -1)).map(
      v => p(..v),
    ),
    stroke: edge,
    fill: pink.lighten(20%),
    close: true,
  )
  #path((p(-1, -1), p(1, -1), p(1, 1), p(-1, 1)), stroke: hidden, fill: lime, close: true)
  #label((41mm, 82mm), [$6 "cm"$], dy: 4mm)
]
#let room() = box(width: 130mm, height: 96mm)[
  #let brown = rgb("#7B3F00")
  #let edge = 1.6pt + brown
  #let hidden = (paint: brown, thickness: 1.6pt, dash: (2.5pt, 2pt))
  #let p(x, y, z) = ((39 + y * 18 - x * 10) * 1mm, (66 + x * 7 - z * 18) * 1mm)
  #path((p(0, 0, 0), p(3, 0, 0), p(3, 0, 3), p(0, 0, 3)), stroke: none, fill: cyan.lighten(25%), close: true)
  #path((p(0, 0, 0), p(0, 4, 0), p(0, 4, 3), p(0, 0, 3)), stroke: none, fill: cyan.lighten(40%), close: true)
  #path((p(0, 4, 0), p(3, 4, 0), p(3, 4, 3), p(0, 4, 3)), stroke: none, fill: cyan.lighten(15%), close: true)
  #path((p(3, 0, 0), p(3, 4, 0), p(0, 4, 0)), stroke: edge)
  #path((p(0, 0, 3), p(3, 0, 3), p(3, 0, 0), p(3, 4, 0), p(0, 4, 0), p(0, 4, 3), p(0, 0, 3)), stroke: edge)
  #path((p(3, 4, 0), p(3, 4, 3), p(0, 4, 3)), stroke: edge)
  #path((p(3, 0, 3), p(3, 4, 3)), stroke: edge)
  #for y in (1.7, 2.1) {
    path((p(0, y, 3), p(0, y, 0), p(.4, y, 0), p(.4, y, 3)), stroke: hidden)
  }
  #path((p(.4, 1.7, 0), p(.4, 2.1, 0)), stroke: hidden)
  #path((p(0, 1.7, 3), p(.4, 1.7, 3), p(.4, 2.1, 3), p(0, 2.1, 3)), stroke: edge, fill: cyan, close: true)
  #path(
    (
      p(1, 0, 2.5),
      p(0, 0, 2.35),
      p(0, 1.7, 1.92),
      p(.4, 1.7, 1.87),
      p(.4, 2.1, 1.77),
      p(0, 2.1, 1.72),
      p(0, 4, 1.12),
      p(.5, 4, 1),
    ),
    stroke: hidden,
  )
  #label(p(3, 0, 1.5), [$3 "m"$], dx: -5mm)
  #for (start, end) in ((p(0, 0, 0), p(3, 0, 0)), (p(0, 0, 0), p(0, 4, 0)), (p(0, 0, 0), p(0, 0, 3))) {
    let vx = (end.at(0) - start.at(0)) / 1pt
    let vy = (end.at(1) - start.at(1)) / 1pt
    let length = calc.sqrt(vx * vx + vy * vy)
    let ux = vx / length
    let uy = vy / length
    for d in range(0, int(calc.ceil(length)), step: 5) {
      let e = calc.min(d + 2.8, length)
      let point(t, n) = (start.at(0) + (t * ux - n * uy) * 1pt, start.at(1) + (t * uy + n * ux) * 1pt)
      path((point(d, -0.8), point(e, -0.8), point(e, 0.8), point(d, 0.8)), stroke: none, fill: brown, close: true)
    }
  }
  #for (start, end, t, dx, dy) in (
    (p(3, 0, 0), p(3.6, 0, 0), [$x$], -1mm, 4mm),
    (p(0, 4, 0), p(0, 4.7, 0), [$y$], 3mm, 0mm),
    (p(0, 0, 3), p(0, 0, 3.6), [$z$], 3mm, 0mm),
  ) {
    arrow-line(start, end, color: brown, thickness: 1.6pt)
    label(end, t, dx: dx, dy: dy)
  }
  #for (pt, t, dx, dy) in (
    (p(0, 0, 0), [$O$], -4mm, -2mm),
    (p(1, 0, 2.5), [$A$], -4mm, -1mm),
    (p(.5, 4, 1), [$B$], -3mm, 3mm),
  ) {
    dot(pt)
    label(pt, t, dx: dx, dy: dy)
  }
  #label(p(3, 2, 0), [$4 "m"$], dy: 5mm);#label(p(1.5, 4, 0), [$3 "m"$], dx: 5mm, dy: 2mm)
  #label(p(.4, 1.9, 0), text(size: 9pt)[$"0,4 m"$], dx: -2mm, dy: 3mm)
  #label(p(.2, 2.1, 0), text(size: 9pt)[$"0,2 m"$], dx: 5mm, dy: 1mm)
]
#let display-case() = box(width: 88mm, height: 94mm)[
  #let p(x, y, z) = ((33 + y * 65 - x * 40) * 1mm, (79 + x * 23 - z * 48) * 1mm)
  #let a = p(0, 0, 1);#let b = p(0, .5, 1);#let c = p(.5, .5, 1);#let d = p(.5, 0, 1);#let s = p(.25, .25, 1.485)
  #path((p(0, 0, 0), p(.5, 0, 0), d, a), stroke: edge, fill: rgb("#FFD43B").lighten(30%), close: true)
  #path((p(.5, 0, 0), p(.5, .5, 0), c, d), stroke: edge, fill: rgb("#FFD43B"), close: true)
  #path((p(.5, .5, 0), p(0, .5, 0), b, c), stroke: edge, fill: rgb("#FFD43B").lighten(45%), close: true)
  #path((b, c, s), stroke: edge, fill: pink.lighten(20%), close: true)
  #path((c, d, s), stroke: edge, fill: pink, close: true)
  #path((d, a, b), stroke: hidden)
  #path((s, a, p(0, 0, 0), p(.5, 0, 0)), stroke: hidden)
  #path((p(0, 0, 0), p(0, .5, 0)), stroke: hidden)
  #path((a, c), stroke: hidden);#path((b, d), stroke: hidden)
  #path((s, p(.25, .25, 1)), stroke: hidden)
  #for (pt, t, dx, dy) in (
    (s, [$S$], 0mm, -5mm),
    (a, [$A$], -4mm, 0mm),
    (b, [$B$], 4mm, 0mm),
    (c, [$C$], 4mm, 1mm),
    (d, [$D$], -4mm, 1mm),
    (p(0, 0, 0), [$A'$], -4mm, -3mm),
    (p(0, .5, 0), [$B'$], 4mm, 1mm),
    (p(.5, .5, 0), [$C'$], 4mm, 2mm),
    (p(.5, 0, 0), [$D'$], -4mm, 2mm),
    (p(.25, .25, 1), [$I$], -2mm, 4mm),
  ) {
    dot(pt)
    label(pt, t, dx: dx, dy: dy)
  }
]
#let transport(bus: false) = box(width: 100mm, height: 28mm)[
  #path(((5mm, 23mm), (95mm, 23mm)), stroke: 1pt + rgb("#7B3F00"))
  #let w = if bus { 72 } else { 56 }
  #path(
    ((12mm, 20mm), (12mm, 8mm), (20mm, 4mm), (w * 1mm, 4mm), ((w + 8) * 1mm, 14mm), ((w + 8) * 1mm, 20mm)),
    stroke: edge,
    fill: if bus { pink } else { lime },
    close: true,
  )
  #for x in range(22, w - 4, step: 12) {
    path(
      ((x * 1mm, 7mm), ((x + 8) * 1mm, 7mm), ((x + 8) * 1mm, 13mm), (x * 1mm, 13mm)),
      stroke: edge,
      fill: cyan.lighten(50%),
      close: true,
    )
  }
  #for x in (25, w - 2) {
    place(top + left, dx: (x - 3) * 1mm, dy: 18mm, circle(radius: 3mm, fill: rgb("#333333"), stroke: none))
    place(top + left, dx: (x - 1) * 1mm, dy: 20mm, circle(radius: 1mm, fill: white, stroke: none))
  }
]
#let runner() = box(width: 80mm, height: 33mm)[
  #path(((3mm, 30mm), (76mm, 30mm)), stroke: 2pt + rgb("#17623E"))
  #place(top + left, dx: 39mm, dy: 1mm, circle(radius: 3mm, fill: pink, stroke: edge))
  #path(((41mm, 8mm), (35mm, 18mm), (27mm, 28mm), (20mm, 28mm)), stroke: 2pt + ink)
  #path(((35mm, 18mm), (47mm, 22mm), (53mm, 29mm)), stroke: 2pt + ink)
  #path(((25mm, 8mm), (31mm, 13mm), (39mm, 11mm), (46mm, 15mm), (53mm, 10mm)), stroke: 2pt + red)
]
#let sugar() = box(width: 90mm, height: 33mm)[
  #for (x, fill) in ((15, pink), (37, lime), (59, cyan)) {
    path(
      (((x + 3) * 1mm, 4mm), ((x + 15) * 1mm, 4mm), ((x + 18) * 1mm, 27mm), (x * 1mm, 27mm)),
      stroke: edge,
      fill: fill,
      close: true,
    )
    path((((x + 2) * 1mm, 8mm), ((x + 16) * 1mm, 8mm)), stroke: edge)
    label(((x + 9) * 1mm, 18mm), [ĐƯỜNG], width: 20mm)
  }
]
#let factory() = box(width: 72mm, height: 49mm)[
  #place(top + left, dy: 13mm, box(width: 72mm, height: 36mm)[
    #path(
      ((8mm, 31mm), (8mm, 15mm), (23mm, 7mm), (23mm, 15mm), (38mm, 7mm), (38mm, 15mm), (64mm, 15mm), (64mm, 31mm)),
      stroke: edge,
      fill: cyan,
      close: true,
    )
    #path(((55mm, 15mm), (55mm, 2mm), (61mm, 2mm), (61mm, 15mm)), stroke: edge, fill: pink, close: true)
    #for x in (15, 29, 43) {
      path(
        ((x * 1mm, 20mm), ((x + 7) * 1mm, 20mm), ((x + 7) * 1mm, 26mm), (x * 1mm, 26mm)),
        stroke: edge,
        fill: lime,
        close: true,
      )
    }
  ])
  #for (x, y, r) in ((58, 10, 2.4), (61, 6, 3.2), (66, 2, 3.8)) {
    place(top + left, dx: (x - r) * 1mm, dy: (y - r + 4) * 1mm, circle(
      radius: r * 1mm,
      fill: rgb("#999999").lighten(25%),
      stroke: none,
    ))
  }
]
#let pool() = box(width: 105mm, height: 41mm)[
  #path(((8mm, 24mm), (73mm, 24mm), (95mm, 7mm), (30mm, 7mm)), stroke: edge, fill: cyan, close: true)
  #path(((8mm, 24mm), (8mm, 34mm), (73mm, 34mm), (73mm, 24mm)), stroke: edge, fill: pink, close: true)
  #path(((73mm, 24mm), (95mm, 7mm), (95mm, 17mm), (73mm, 34mm)), stroke: edge, fill: pink.darken(10%), close: true)
  #for y in (10, 14, 18, 22) {
    path(range(81).map(i => ((33 + i * .5) * 1mm, (y + 0.65 * calc.sin(i * 18deg)) * 1mm)), stroke: 1.2pt + ink)
  }
  #path(((20mm, 7mm), (20mm, 2mm), (27mm, 2mm), (27mm, 10mm)), stroke: 3.5pt + rgb("#7B3F00"))
  #path(((18mm, 4mm), (22mm, 4mm)), stroke: 2pt + rgb("#7B3F00"))
  #path(((27mm, 10mm), (27mm, 17mm)), stroke: 2.5pt + ink)
  #for (x, y) in ((26, 18), (28, 19), (27, 20)) {
    place(top + left, dx: x * 1mm, dy: y * 1mm, circle(radius: .55mm, fill: ink, stroke: none))
  }
]
