#import "/templates/drawing.typ": path, label, edge, hidden, face-tone
#import "/templates/theme.typ": palette

#let project(p) = ((60 - 10*p.at(0) + 16*p.at(1))*1mm,
  (40 + 6.5*p.at(0) - 48*p.at(2))*1mm)

#let arrowhead(a, b) = {
  path((project(a), project(b)))
  let tip = project(b)
  let from = project(a)
  let dx = (tip.at(0) - from.at(0))/1mm
  let dy = (tip.at(1) - from.at(1))/1mm
  let length = calc.sqrt(dx*dx + dy*dy)
  let ux = dx/length
  let uy = dy/length
  path((tip, (tip.at(0) - (2*ux - 0.8*uy)*1mm, tip.at(1) - (2*uy + 0.8*ux)*1mm),
    (tip.at(0) - (2*ux + 0.8*uy)*1mm, tip.at(1) - (2*uy - 0.8*ux)*1mm)),
    fill: palette.primary, close: true)
}

#let balloon(position) = {
  let p = project(position)
  place(top + left, dx: p.at(0) - 2.4mm, dy: p.at(1) - 8mm,
    ellipse(width: 4.8mm, height: 6.4mm, stroke: edge, fill: face-tone((0, 0, 1))))
  path(((p.at(0) - 1.3mm, p.at(1) - 2mm), p, (p.at(0) + 1.3mm, p.at(1) - 2mm)))
  place(top + left, dx: p.at(0) - 0.5mm, dy: p.at(1) - 0.5mm,
    circle(radius: 0.5mm, fill: palette.primary, stroke: none))
}

#let balloons() = block(width: 152mm, height: 88mm)[
  #let o = (0, 0, 0)
  #let a = (2, 3, 0.5)
  #let b = (-1, -1, 0.3)
  #for endpoint in ((4, 0, 0), (0, 4.5, 0), (0, 0, 0.8)) { arrowhead(o, endpoint) }
  #for endpoint in ((-2.4, 0, 0), (0, -3.2, 0), (0, 0, -0.5)) {
    path((project(o), project(endpoint)), stroke: hidden)
  }
  #for p in (a, b) {
    let foot = (p.at(0), p.at(1), 0)
    path((project(p), project(foot)), stroke: hidden)
    path((project((p.at(0), 0, 0)), project(foot), project((0, p.at(1), 0))), stroke: hidden)
    balloon(p)
  }
  #label(project(o), $O$, dx: 4mm, dy: 4mm)
  #label(project(a), $A$, dx: 3mm, dy: 1mm)
  #label(project(b), $B$, dx: -5mm, dy: -5mm)
  #label(project((4, 0, 0)), $x$, dx: 4mm, dy: 2mm)
  #label(project((0, 4.5, 0)), $y$, dx: -1mm, dy: 5mm)
  #label(project((0, 0, 0.8)), $z$, dx: -4mm, dy: 0mm)
  #label(project((4, 0, 0)), [Nam], dx: -7mm, dy: 0mm)
  #label(project((0, 4.5, 0)), [Đông], dx: 8mm, dy: 0mm, width: 14mm)
  #label(project((-2.4, 0, 0)), [Bắc], dx: 0mm, dy: -9mm)
  #label(project((0, -3.2, 0)), [Tây], dx: 0mm, dy: -3mm)
  #label(project((2, 1.5, 0)), [3 km], dx: 8mm, dy: 5mm)
  #label(project((1, 3, 0)), [2 km], dx: 6mm, dy: 1mm)
  // Northward ground segment, distinct from the westward horizontal segment.
  #let north-mid = project((-0.5, -1, 0))
  #path((north-mid, (north-mid.at(0) - 5mm, north-mid.at(1) - 2mm)),
    stroke: (paint: palette.primary, thickness: 0.4pt))
  #label(north-mid, [1 km], dx: -5mm, dy: -5mm)
  // Westward ground segment: keep its label clear of z, with a short leader.
  #let west-mid = project((-1, -0.5, 0))
  #path((west-mid, (west-mid.at(0) + 11mm, west-mid.at(1) - 6mm)),
    stroke: (paint: palette.primary, thickness: 0.4pt))
  #label(west-mid, [1 km], dx: 11mm, dy: -9mm)
  #label(project((2, 3, 0.35)), [0,5 km], dx: 11mm, dy: -2mm, width: 14mm)
  #label(project((-1, -1, 0.15)), [0,3 km], dx: -11mm, width: 14mm)
]
