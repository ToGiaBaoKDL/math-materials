#import "/templates/drawing.typ": arrow-line, label, path, smooth
#import "/templates/theme.typ": palette
#let pink = rgb("#FF91A4")
#let cyan = rgb("#55DCE5")
#let mint = rgb("#B5E9DE")
#let lime = rgb("#BFFF36")
#let green = rgb("#17623E")
#let brown = rgb("#7B3F00")
#let red = palette.heading
#let edge = 1.2pt + green
#let hidden = (paint: green, thickness: 1.2pt, dash: (1.5mm, 1.1mm))
#let accent = 1.3pt + red
#let point(p, name, dx: 0mm, dy: -4mm) = {
  place(top + left, dx: p.at(0) - 0.7mm, dy: p.at(1) - 0.7mm, circle(radius: 0.7mm, fill: red, stroke: none))
  label(p, name, dx: dx, dy: dy)
}
#let arc(c, rx, ry, start, end, stroke: edge) = smooth(
  t => (c.at(0) + rx * calc.cos(t), c.at(1) + ry * calc.sin(t)),
  t => (-rx * calc.sin(t), ry * calc.cos(t)),
  start,
  end,
  stroke: stroke,
)
#let sphere(c, r, fill: mint, equator: true) = {
  place(top + left, dx: c.at(0) - r, dy: c.at(1) - r, circle(radius: r, fill: fill, stroke: edge))
  if equator {
    arc(c, r, r * 0.23, calc.pi, 2 * calc.pi, stroke: hidden)
    arc(c, r, r * 0.23, 0, calc.pi)
  }
}
#let great-circle() = block(width: 75mm, height: 65mm, {
  let I = (37mm, 32mm)
  sphere(I, 28mm, fill: pink)
  path((I, (65mm, 32mm)), stroke: hidden)
  point(I, $I$, dy: -2mm)
  label((51mm, 32mm), $R$, dy: 4mm)
})
#let diameter() = block(width: 80mm, height: 65mm, {
  let I = (40mm, 32mm)
  sphere(I, 28mm, fill: pink)
  path(((12mm, 32mm), (68mm, 32mm)), stroke: hidden)
  point(I, $I$, dy: -2mm)
  point((12mm, 32mm), $A$, dx: -3mm, dy: 0mm)
  point((68mm, 32mm), $B$, dx: 3mm, dy: 0mm)
  label((26mm, 32mm), $R$, dy: 3mm)
})
#let sphere-chord() = block(width: 94mm, height: 72mm, {
  let I = (48mm, 33mm)
  let r = 28mm
  let h = 19mm
  let half = calc.sqrt((r / 1mm) * (r / 1mm) - (h / 1mm) * (h / 1mm)) * 1mm
  let A = (48mm - half, 52mm)
  let B = (48mm + half, 52mm)
  let H = (48mm, 52mm)
  sphere(I, r, fill: lime)
  path(((6mm, 52mm), A), stroke: 1.2pt + black)
  path((A, B), stroke: hidden)
  arrow-line(B, (90mm, 52mm), color: black, thickness: 1.2pt)
  path((A, I, B), stroke: hidden)
  path((I, H), stroke: hidden)
  path(((48mm, 49mm), (51mm, 49mm), (51mm, 52mm)), stroke: 0.8pt + brown)
  point(I, $I$, dx: 2mm, dy: -2mm)
  point(A, $A$, dy: 5mm)
  point(B, $B$, dy: 5mm)
  point(H, $H$, dy: 5mm)
  point((6mm, 52mm), $O$, dy: 5mm)
  label((91mm, 52mm), $x$, dy: 5mm)
  label((62mm, 41mm), $R$, dx: 2mm, dy: 3mm)
})
#let orthogonal-tetrahedron() = block(width: 100mm, height: 76mm, {
  // OABC is a right tetrahedron; M is midpoint AB, I=M+OC/2.
  let O = (16mm, 45mm)
  let A = (88mm, 45mm)
  let B = (37mm, 66mm)
  let C = (16mm, 7mm)
  let M = (62.5mm, 55.5mm)
  let I = (62.5mm, 36.5mm)
  path((O, B, C), close: true, fill: mint, stroke: none)
  path((C, B, A), close: true, fill: pink, stroke: none)
  path((O, C, A, B, O), stroke: edge)
  path((C, B), stroke: edge)
  path((O, A), stroke: hidden)
  path((O, M), stroke: hidden)
  path(((62.5mm, 70mm), (62.5mm, 14mm)), stroke: 1.9pt + red)
  path(((8mm, 26mm - 8mm * 10.5 / 46.5), I), stroke: hidden)
  for (p, name, dx, dy) in (
    (O, $O$, -4mm, 2mm),
    (A, $A$, 4mm, 0mm),
    (B, $B$, 0mm, 5mm),
    (C, $C$, 0mm, -4mm),
    (M, $M$, 4mm, 3mm),
    (I, $I$, 2.5mm, 2mm),
  ) {
    point(p, name, dx: dx, dy: dy)
  }
  label((66mm, 16mm), $d$)
  label((8mm, 24mm), $Δ$, dy: -3mm)
})
#let tangent-spheres() = block(width: 100mm, height: 65mm, {
  // User-requested schematic enlargement of the smaller sphere; tangency is preserved.
  let I = (22mm, 32mm)
  let J = (64mm, 32mm)
  sphere(I, 14mm, fill: pink, equator: false)
  sphere(J, 28mm, fill: cyan, equator: false)
  path((I, J), stroke: accent)
  point(I, $I$, dx: -2mm, dy: -3mm)
  point(J, $I'$, dx: 2mm, dy: -3mm)
  label((29mm, 32mm), $R$, dy: 3mm)
  label((50mm, 32mm), $R'$, dy: 3mm)
})
#let contact-circle() = block(width: 80mm, height: 86mm, {
  let I = (40mm, 29mm)
  let r = 24mm
  let distance = 42mm
  let height = r * (r / distance)
  let half = calc.sqrt((r / 1mm) * (r / 1mm) - (height / 1mm) * (height / 1mm)) * 1mm
  let H = (40mm, 29mm + height)
  let E = (40mm - half, H.at(1))
  let F = (40mm + half, H.at(1))
  let M = (40mm, 71mm)
  sphere(I, r, fill: mint, equator: false)
  path((E, M, F), stroke: accent)
  arc(H, half, 4mm, calc.pi, 2 * calc.pi, stroke: hidden)
  arc(H, half, 4mm, 0, calc.pi, stroke: 1.3pt + brown)
  path((I, M), stroke: hidden)
  path((E, I, F), stroke: hidden)
  path((E, F), stroke: hidden)
  path(((40mm, H.at(1) - 2.5mm), (42.5mm, H.at(1) - 2.5mm), (42.5mm, H.at(1))), stroke: 0.8pt + brown)
  point(I, $I$)
  point(H, $H$, dx: -3mm, dy: 2mm)
  point(E, $E$, dx: -4mm, dy: 1mm)
  point(F, $F$, dx: 4mm, dy: 1mm)
  point(M, $M$, dy: 5mm)
  point((64mm, 29mm), $B$, dx: 4mm, dy: -3mm)
})
#let apollonius-line() = block(width: 100mm, height: 19mm, {
  let A = (5mm, 10mm)
  let B = (77mm, 10mm)
  let I = (86mm, 10mm)
  arrow-line(B, A, color: lime, thickness: 2pt)
  arrow-line(I, B, color: red, thickness: 1.4pt)
  point(A, $A$, dy: -5mm)
  point(B, $B$, dy: -5mm)
  point(I, $I$, dx: 3mm, dy: -5mm)
})
#let max-distance() = block(width: 80mm, height: 65mm, {
  let I = (40mm, 32mm)
  sphere(I, 28mm, fill: pink)
  path(((12mm, 32mm), (68mm, 32mm)), stroke: accent)
  point((12mm, 32mm), $O$, dx: -4mm)
  point(I, $I$, dy: -2mm)
  point((68mm, 32mm), $M$, dx: 4mm)
  label((54mm, 32mm), $R$, dy: -2mm)
})
#let orthogonal-tangents() = block(width: 90mm, height: 68mm, {
  let I = (54mm, 33mm)
  let r = 27mm
  let distance = r * calc.sqrt(2)
  let a = (54mm - distance, 33mm)
  let near = (27mm, 33mm)
  let v = r / calc.sqrt(2)
  let T = (54mm - v, 33mm - v)
  let U = (54mm - v, 33mm + v)
  sphere(I, r, fill: cyan)
  path((T, a, U), stroke: accent)
  path((T, I, U), stroke: hidden)
  path((a, I), stroke: hidden)
  point(a, $A_2$, dx: -5mm, dy: 3mm)
  point(near, $A_1$, dx: -3mm, dy: 3mm)
  point(I, $I$)
  label((43mm, 48mm), $R$, dx: 2mm)
})
#let inscribed-tetrahedron() = block(width: 85mm, height: 76mm, {
  // Schematic matching the source: lower section circle wraps around the sphere.
  let red-hidden = (paint: red, thickness: 1.2pt, dash: (1.5mm, 1.1mm))
  let center = (42mm, 35mm)
  let radius = 30mm
  let rx = calc.sqrt(675) * 1mm
  let ry = 6mm
  let offset = calc.sqrt(225 * (1 - 36 / 675)) * 1mm
  let section = (42mm, 35mm + offset)
  let on-section(t) = (section.at(0) + rx * calc.cos(t), section.at(1) + ry * calc.sin(t))
  let tangent-y = offset / (1 - 36 / 675)
  let tangent-x = calc.sqrt(900 - calc.pow(tangent-y / 1mm, 2)) * 1mm
  let a = (42mm - tangent-x, 35mm + tangent-y)
  let b = on-section(4.25)
  let c = on-section(1.32)
  let d = (42mm + radius * calc.cos(3.78), 35mm + radius * calc.sin(3.78))
  sphere(center, radius, fill: lime, equator: false)
  // No face fill: leave the wrapping section and hidden tetrahedron edges legible.
  arc(section, rx, ry, calc.pi, 2 * calc.pi, stroke: red-hidden)
  arc(section, rx, ry, 0, calc.pi)
  path((a,b,c,a), stroke: red-hidden)
  path((a,d,b), stroke: red-hidden)
  path((d,c), stroke: red-hidden)
  point(a,$A$,dx:-3mm,dy:3mm)
  point(b,$B$,dx:-3mm,dy:-2mm)
  point(c,$C$,dx:3mm,dy:3mm)
  point(d,$D$,dx:-2mm,dy:-3mm)
  point(center,$I$,dx:2mm,dy:-2mm)
})
