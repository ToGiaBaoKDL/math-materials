#import "contacts.typ": contact-links
#import "theme.typ": exam-palette as palette, exam-style, fonts
// Exam-only running matter.
#let plain-header() = block(width: 100%, inset: (x: 12mm, top: 5mm))[
  #set text(
    font: fonts.ui,
    size: exam-style.running-size,
    weight: exam-style.running-weight,
    fill: palette.primary,
    stroke: exam-style.running-stroke + palette.primary,
  )
  #set par(justify: false, leading: 0pt)
  #grid(
    columns: (1fr, auto),
    column-gutter: 5mm,
    align(left)[Thầy Đỗ Xuân Thắng], align(right)[Luyện thi 9+ Toán THPT 10.11.12],
  )
  #v(-0.5mm)
  #line(length: 100%, stroke: 1pt + palette.primary)
]
#let plain-footer(caption, folio) = block(width: 100%, inset: (x: 12mm, bottom: 5mm))[
  #set text(
    font: fonts.ui,
    size: exam-style.running-size,
    weight: exam-style.running-weight,
    fill: palette.primary,
    stroke: exam-style.running-stroke + palette.primary,
  )
  #set par(justify: false, leading: 0pt)
  #grid(
    columns: (1fr, auto),
    column-gutter: 5mm,
    align: horizon,
    align(left, caption), align(right, folio),
  )
]

#let exam-header = plain-header
#let exam-footer(code) = context {
  let number = counter(page).get().first()
  let total = counter(page).final().first()
  plain-footer(contact-links(), [#if code != none { [Mã đề thi #code – ] }Trang #number/#total])
}
