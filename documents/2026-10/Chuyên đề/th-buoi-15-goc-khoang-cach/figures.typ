#let diagram(name, width: 87mm) = block(width: 100%, above: 6mm, below: 6mm, breakable: false, align(center, image(
  "figures/" + name + ".svg",
  width: width,
)))
