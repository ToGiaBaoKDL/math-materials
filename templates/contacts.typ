// Shared contact assets and labels for exam and lesson footers.
#let contact-icon(name, color: black) = image(
  bytes(read("/assets/branding/icons/" + name + ".svg").replace("#000000", color.to-hex())),
  format: "svg",
  width: 4mm,
  height: 4mm,
)

// Position each item's measured box around the same vertical center.
#let contact-cell(body, dy: 0pt) = context {
  let item = box(text(top-edge: "bounds", bottom-edge: "bounds", body))
  block(width: measure(item).width, height: 4mm, above: 0pt, below: 0pt,
    place(left + horizon, dy: dy, item),
  )
}

#let contact-links(color: black, tracking: 0pt, text-offset: 0pt) = grid(
  columns: (auto, auto, auto, auto, auto, auto, auto),
  column-gutter: 1.2mm,
  align: horizon,
  contact-cell(contact-icon("website", color: color)),
  contact-cell(text(tracking: tracking)[toanthaythang.vn], dy: text-offset),
  contact-cell(box(width: 3mm, align(center)[|])),
  contact-cell(contact-icon("facebook", color: color)),
  contact-cell([\&]),
  contact-cell(contact-icon("tiktok", color: color)),
  contact-cell(text(tracking: tracking)[toanthaythangdxt], dy: text-offset),
)
