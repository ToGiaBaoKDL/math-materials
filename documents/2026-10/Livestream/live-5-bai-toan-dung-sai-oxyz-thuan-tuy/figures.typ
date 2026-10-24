#import "/templates/drawing.typ": label, path, solid-path
#let brown = rgb("#7B3F00")
#let blue = rgb("#0077C8")
#let hidden = (paint: brown, thickness: 1.5pt, dash: (2.5pt, 2.5pt))
#let pt(v) = (v.at(0) * 1mm, v.at(1) * 1mm)
#let edge(a, b, dashed: false, color: brown) = {
  if dashed { path((pt(a), pt(b)), stroke: (paint: color, thickness: 1.5pt, dash: (2.5pt, 2.5pt))) } else {
    solid-path((pt(a), pt(b)), thickness: 1.5pt, color: color)
  }
}
#let face(v, color) = path(v.map(pt), close: true, stroke: none, fill: color)
#let mark(p, t, dx: 0, dy: 0) = {
  place(top + left, dx: p.at(0) * 1mm - 0.65mm, dy: p.at(1) * 1mm - 0.65mm, circle(
    radius: 0.65mm,
    fill: blue,
    stroke: none,
  ))
  label(pt(p), t, dx: dx * 1mm, dy: dy * 1mm)
}
#let cube() = box(width: 86mm, height: 79mm)[
  // Affine camera: A=(0,0,1), B=(0,1,1), D=(1,0,1).
  #let A = (10, 25)
  #let B = (31, 8)
  #let C = (74, 8)
  #let D = (53, 25)
  #let Ap = (10, 68)
  #let Bp = (31, 51)
  #let Cp = (74, 51)
  #let Dp = (53, 68)
  #let I = (42, 16.5)
  #let G = ((10 + 31 + 74) / 3, (25 + 51 + 8) / 3)
  #face((A, B, C, D), rgb("#FFDFA0"))
  #face((A, D, Dp, Ap), rgb("#B5E9DE"))
  #face((D, C, Cp, Dp), rgb("#55DCE5"))
  #for (a, b) in ((B, Bp), (Bp, Ap), (Bp, Cp)) { edge(a, b, dashed: true) }
  #for (a, b) in ((A, B), (B, C), (C, D), (D, A), (A, Ap), (D, Dp), (C, Cp), (Ap, Dp), (Dp, Cp)) { edge(a, b) }
  #edge(A, C, color: blue)
  #edge(B, D, color: blue)
  #edge(Bp, I, dashed: true, color: rgb("#C60035"))
  #edge(A, Bp, dashed: true, color: rgb("#C60035"))
  #edge(Bp, C, dashed: true, color: rgb("#C60035"))
  #mark(A, $A$, dx: -4) #mark(B, $B$, dy: -4) #mark(C, $C$, dx: 3, dy: -3)
  #mark(D, $D$, dx: 5, dy: 3) #mark(Ap, $A'$, dx: -4, dy: 3)
  #mark(Bp, $B'$, dx: -4, dy: 1) #mark(Cp, $C'$, dx: 4, dy: 1) #mark(Dp, $D'$, dy: 4)
  #mark(I, $I$, dx: 1, dy: -4) #mark(G, $G$, dx: 4, dy: 2)
]
#let prism() = box(width: 86mm, height: 77mm)[
  // Equilateral base (0,0,0),(1,0,0),(1/2,sqrt(3)/2,0), height sqrt(2).
  #let project(p) = (13 + 54 * p.at(0) + 8 * p.at(1), 67 - 17 * p.at(1) - 34 * p.at(2))
  #let A = project((0, 0, 0))
  #let B = project((1, 0, 0))
  #let C = project((0.5, calc.sqrt(3) / 2, 0))
  #let Ap = project((0, 0, calc.sqrt(2)))
  #let Bp = project((1, 0, calc.sqrt(2)))
  #let Cp = project((0.5, calc.sqrt(3) / 2, calc.sqrt(2)))
  #let M = ((B.at(0) + C.at(0)) / 2, (B.at(1) + C.at(1)) / 2)
  #face((A, B, Bp, Ap), rgb("#BFFF36"))
  #face((Ap, Bp, Cp), rgb("#55DCE5"))
  #for (a, b) in ((A, C), (B, C), (C, Cp)) { edge(a, b, dashed: true) }
  #for (a, b) in ((A, B), (A, Ap), (B, Bp), (Ap, Bp), (Bp, Cp), (Cp, Ap)) { edge(a, b) }
  #edge(Ap, M, dashed: true, color: blue)
  #mark(A, $A$, dx: -3, dy: 3) #mark(B, $B$, dx: 3, dy: 3) #mark(C, $C$, dx: 4, dy: -3)
  #mark(Ap, $A'$, dx: -4) #mark(Bp, $B'$, dx: 4) #mark(Cp, $C'$, dy: -4)
  #mark(M, $M$, dx: 4, dy: 0)
  #label(pt((40, 71)), $a$)
  #label(pt((7, 42)), $a sqrt(2)$, width: 15mm)
]

// Separate views keep incidence and barycentric relations without overlapping surfaces.
#let split-triangle(number) = grid(
  columns: (80mm, 80mm),
  column-gutter: 5mm,
  box(width: 80mm, height: 76mm)[
    #let A = (35, 10)
    #let B = (10, 43)
    #let C = (68, 43)
    #let G = ((35 + 10 + 68) / 3, 32)
    #if number == 4 {
      // D=B+C-A; G is the centroid of ABC.
      let A = (35, 18)
      let B = (10, 41)
      let C = (68, 41)
      let D = (43, 64)
      let G = ((35 + 10 + 68) / 3, 100 / 3)
      face((A, B, D, C), rgb("#FFC078"))
      for (a, b) in ((A, B), (B, D), (D, C), (C, A)) { edge(a, b) }
      edge(B, C, color: blue)
      edge(A, ((10 + 68) / 2, 41), dashed: true, color: blue)
      mark(A, $A$, dy: -4)
      mark(B, $B$, dx: -4)
      mark(C, $C$, dx: 4)
      mark(D, $D$, dy: 4)
      mark(G, $G$, dx: -4)
    } else {
      // Align geometric bounds: triangle center 26.5 mm, right view center 37 mm.
      move(dy: 10.5mm, {
        let I = ((2 * 35 + 10 + 3 * 68) / 6, (2 * 10 + 43 + 3 * 43) / 6)
        face((A, B, C), rgb("#FF91A4"))
        for (a, b) in ((A, B), (B, C), (C, A)) { edge(a, b) }
        edge(A, ((10 + 68) / 2, 43), dashed: true, color: blue)
        mark(A, $A$, dy: -4)
        mark(B, $B$, dx: -4, dy: 2)
        mark(C, $C$, dx: 4, dy: 2)
        mark(G, $G$, dx: -4, dy: 0)
        mark(I, $I$, dx: 4, dy: 0)
      })
    }
  ],
  box(width: 80mm, height: 76mm)[
    #if number == 4 {
      let A = (20, 40)
      let E = (42, 43)
      let B = (10, 67)
      let C = (50, 37)
      face(((10, 30), (60, 30), (73, 52), (23, 52)), rgb("#55DCE5"))
      for (a, b) in (((10, 30), (60, 30)), ((60, 30), (73, 52)), ((73, 52), (23, 52)), ((23, 52), (10, 30))) {
        edge(a, b)
      }
      edge(B, (30, 52), color: rgb("#C45A00"))
      edge((30, 52), E, dashed: true, color: rgb("#C45A00"))
      edge(E, (58, 31), color: rgb("#C45A00"))
      edge(A, E, dashed: true, color: blue)
      mark(A, $A$, dx: -3, dy: -3)
      mark(E, $E$, dx: 4, dy: 2)
      mark(B, $B$, dx: -3, dy: 3)
      mark(C, $C$, dx: 4, dy: 0)
      label(pt((59, 48)), $(O x z)$, width: 18mm)
    } else {
      let I = (40, 12)
      let M = (46, 48)
      face(((10, 38), (62, 38), (74, 62), (22, 62)), rgb("#55DCE5"))
      for (a, b) in (((10, 38), (62, 38)), ((62, 38), (74, 62)), ((74, 62), (22, 62)), ((22, 62), (10, 38))) {
        edge(a, b)
      }
      // A representative M on the coordinate plane, not a solved optimum.
      edge(I, M, color: rgb("#C60035"))
      mark(I, $I$, dx: 4, dy: 0)
      mark(M, $M$, dx: 4, dy: 2)
      label(pt((56, 57)), $(O y z)$, width: 18mm)
    }
  ],
)

// One affine view: ABC and its barycentric points remain in a common plane.
// The coordinate plane is placed beside the triangle to keep both faces legible.
#let merged-triangle() = box(width: 112mm, height: 85mm)[
  #let A = (50, 35)
  #let B = (95, 10)
  #let C = (95, 60)
  #let G = (80, 35)
  #let I = (80, 130 / 3)
  #let M = (15, 130 / 3)
  #face(((5, 18), (27, 8), (27, 67), (5, 77)), rgb("#55DCE5"))
  #for (a, b) in (((5, 18), (27, 8)), ((27, 8), (27, 67)), ((27, 67), (5, 77)), ((5, 77), (5, 18))) { edge(a, b) }
  #face((A, B, C), rgb("#FF91A4"))
  #for (a, b) in ((A, B), (B, C), (C, A)) { edge(a, b) }
  #edge(A, (95, 35), dashed: true, color: blue)
  #edge(M, (65, 130 / 3), color: rgb("#C60035"))
  #edge((65, 130 / 3), I, dashed: true, color: rgb("#C60035"))
  #mark(A, $A$, dx: -3, dy: -3)
  #mark(B, $B$, dy: -4)
  #mark(C, $C$, dx: 3, dy: 3)
  #mark(G, $G$, dy: -4)
  #mark(I, $I$, dx: 3, dy: 3)
  #mark(M, $M$, dx: -4, dy: -3)
  #label(pt((16, 66)), $(O y z)$, width: 18mm)
]

#let coordinate-triangle(number) = if number == 5 { merged-triangle() } else { split-triangle(number) }
