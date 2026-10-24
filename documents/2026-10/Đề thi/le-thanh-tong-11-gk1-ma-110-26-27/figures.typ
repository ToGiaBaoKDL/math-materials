#let illustration(name, width: 85mm) = block(width: 100%, above: 7mm, below: 6mm, breakable: false, align(
  center,
  if name == "bicycle" {
    image("images/bicycle-rally-coolgrey.jpg", width: width, height: width * 0.66, fit: "cover")
  } else { image("figures/" + name + ".svg", width: width) },
))
