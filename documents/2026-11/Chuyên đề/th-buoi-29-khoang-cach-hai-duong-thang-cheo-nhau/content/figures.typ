// Limit both dimensions while preserving the proportions of the diagrams.
#let height-limited = ("image128.svg", "image134.svg", "image147.svg", "image169.svg", "image193.svg", "image209.svg", "image272.svg", "image292.svg", "image319.svg", "image347.svg", "image36.svg", "image377.svg", "image381.svg", "image420.svg", "image457.svg", "image476.svg", "image496.svg", "image518.svg", "image538.svg", "image555.svg", "image6.svg", "image65.svg",)

#let figure(name, scale: 100%) = align(center, {
  let path = "../figures/" + name
  if name in height-limited { image(path, height: 61mm * scale) } else { image(path, width: 72mm * scale) }
})

#let figure-pair(left, right) = align(center, grid(
  columns: (auto, auto),
  column-gutter: 10mm,
  align: center + horizon,
  figure(left, scale: 82%),
  figure(right, scale: 82%),
))
