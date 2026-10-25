#import "theme.typ": figure-style, palette

// Opaque pastel fills stay consistent where faces overlap. Apply once per fill.
#let figure-fill(color) = color.mix((white, figure-style.fill-white / (100% - figure-style.fill-white)), space: rgb)

#let edge-color = palette.primary.transparentize(100% - figure-style.edge-opacity.visible)
#let hidden-color = palette.primary.transparentize(100% - figure-style.edge-opacity.hidden)
#let edge = figure-style.edge-width + edge-color
#let hidden = (paint: hidden-color, thickness: figure-style.edge-width, dash: "dashed")
#let cut = (paint: edge-color, thickness: figure-style.edge-width, dash: "dashed")
#let fold = edge
#let section-edge = edge
#let section-hidden = hidden
#let hatch = figure-style.hatch-width + palette.primary

#let dot3(a, b) = (a.at(0) * b.at(0) + a.at(1) * b.at(1) + a.at(2) * b.at(2))

#let face-tone(normal, family: "cap") = {
  let light = figure-style.light-direction
  let brightness = calc.clamp(
    dot3(normal, light) / calc.sqrt(dot3(normal, normal) * dot3(light, light)),
    0,
    1,
  )
  let tone = figure-style.faces.at(family)
  let opacity = tone.shade + (tone.light - tone.shade) * brightness
  palette.primary.transparentize(100% - opacity)
}

#let path(points, stroke: edge, fill: none, close: false) = place(
  top + left,
  curve(
    stroke: stroke,
    fill: fill,
    curve.move(points.first()),
    ..points.slice(1).map(point => curve.line(point)),
    ..if close { (curve.close(mode: "straight"),) } else { () },
  ),
)

#let label(point, body, dx: 0mm, dy: 0mm, width: figure-style.label-width) = place(
  top + left,
  dx: point.at(0) - width / 2 + dx,
  dy: point.at(1) - figure-style.label-top + dy,
  box(width: width, align(center, text(size: figure-style.label-size, fill: palette.ink, body))),
)

#let smooth(point, tangent, start, end, segments: 48, stroke: edge, fill: none, close: false) = {
  let step = (end - start) / segments
  let curves = range(segments).map(i => {
    let t = start + i * step
    let a = point(t)
    let b = point(t + step)
    let da = tangent(t)
    let db = tangent(t + step)
    curve.cubic(
      (a.at(0) + step * da.at(0) / 3, a.at(1) + step * da.at(1) / 3),
      (b.at(0) - step * db.at(0) / 3, b.at(1) - step * db.at(1) / 3),
      b,
    )
  })
  place(top + left, curve(
    stroke: stroke,
    fill: fill,
    curve.move(point(start)),
    ..curves,
    ..if close { (curve.close(mode: "straight"),) } else { () },
  ))
}

// Construct the arrowhead from a unit vector, independent of angle conventions.
#let arrow-line(start, end, color: palette.primary, thickness: figure-style.edge-width, tip: 1.7mm, dash: "solid") = {
  let dx = end.at(0) - start.at(0)
  let dy = end.at(1) - start.at(1)
  let length = calc.sqrt(calc.pow(dx / 1mm, 2) + calc.pow(dy / 1mm, 2)) * 1mm
  let ux = dx / length
  let uy = dy / length
  let base = (end.at(0) - tip * ux, end.at(1) - tip * uy)
  place(top + left, line(start: start, end: base, stroke: (paint: color, thickness: thickness, dash: dash)))
  place(top + left, polygon(
    end,
    (base.at(0) - tip * 0.36 * uy, base.at(1) + tip * 0.36 * ux),
    (base.at(0) + tip * 0.36 * uy, base.at(1) - tip * 0.36 * ux),
    fill: color,
    stroke: none,
  ))
}

#let diagram-hidden = (paint: edge-color, thickness: figure-style.edge-width, dash: "dashed")

// Filled vector bands avoid viewer-specific thin-stroke enhancement at small zoom.
#let solid-path(points, thickness: figure-style.edge-width, color: palette.primary, close: false) = {
  let vertices = if close { points + (points.first(),) } else { points }
  for i in range(vertices.len() - 1) {
    let a = vertices.at(i)
    let b = vertices.at(i + 1)
    let dx = b.at(0) - a.at(0)
    let dy = b.at(1) - a.at(1)
    let length = calc.sqrt(calc.pow(dx / 1pt, 2) + calc.pow(dy / 1pt, 2)) * 1pt
    let nx = -dy / length * thickness / 2
    let ny = dx / length * thickness / 2
    path(
      (
        (a.at(0) + nx, a.at(1) + ny),
        (b.at(0) + nx, b.at(1) + ny),
        (b.at(0) - nx, b.at(1) - ny),
        (a.at(0) - nx, a.at(1) - ny),
      ),
      close: true,
      fill: color,
      stroke: none,
    )
  }
  let joins = if close { points } else { points.slice(1, points.len() - 1) }
  for point in joins {
    place(top + left, dx: point.at(0) - thickness / 2, dy: point.at(1) - thickness / 2, circle(
      radius: thickness / 2,
      fill: color,
      stroke: none,
    ))
  }
}
