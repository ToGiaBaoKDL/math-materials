#import "theme.typ": exam-lesson-palette as palette, lesson-style, fonts, header-style
#import "branding.typ": running-head, running-foot
#import "lesson.typ": lesson-heading, lesson-section
#import "exam.typ": exam-end, exam-table

// New exam identity reuses lesson components, with the source exam code in the folio.
#let exam(title, code, body, variant: "de-dap-an") = {
  set document(title: title)
  set text(font: fonts.body, size: 13pt, lang: "vi", fill: palette.ink, overhang: false)
  show math.equation: set text(font: fonts.math, top-edge: "bounds", bottom-edge: "bounds")
  show math.equation.where(block: false): it => box(math.display(it))
  show math.frac: it => math.display(it)
  set par(justify: true, leading: 0.85em, spacing: 2.5mm)
  set page(paper: "a4", margin: lesson-style.margin, background: context {
    place(top + left, running-head([DXT], lesson-style.branding.header, branded: true,
      margin: lesson-style.margin, palette: palette,
      style: header-style + (strip-color: palette.primary.lighten(78%),)))
    place(bottom + left, running-foot(lesson-style.branding.footer,
      counter(page).get().first(), counter(page).final().first(),
      margin: lesson-style.margin, palette: palette, folio-width: 48mm, folio-right-inset: 6mm,
      folio: [Mã đề #code – Trang #counter(page).display()/#counter(page).final().first()]))
  })
  body
}

#let exam-cover(organization, title, code, duration: 90, year: [2026–2027]) = {
  lesson-heading(organization, title, course-size: 19pt, course-inset: (x: 10mm, y: 3mm), title-size: 23pt,
    subtitle: [Năm học #year · Môn: TOÁN 12 · Thời gian: #duration phút · Mã đề: #code],
    author: none, palette: palette, border: 0.7pt + palette.primary)
  align(center, text(size: 10.5pt, style: "italic")[(Không kể thời gian giao đề)])
  block(above: 4mm, below: 4mm)[
    #set par(justify: false)
    #grid(columns: (1fr, 1fr), gutter: 8mm,
      [Họ và tên: #box(width: 45mm, repeat[.])], [Số báo danh: #box(width: 35mm, repeat[.])])
  ]
}

#let exam-section(number, title, instruction: []) = {
  lesson-section(title, badge: number, palette: palette)
  if instruction != [] { block(sticky: true, below: 4mm, instruction) }
}
