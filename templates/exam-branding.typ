#import "theme.typ": fonts, header-style, footer-style

// Exam-only compact geometry; lesson branding keeps its existing dimensions.
#let compact-header = header-style + (
  height: 15mm,
  bar-height: 8mm,
  strip-height: 2mm,
  tab-width: 30mm,
  tab-bottom: 20mm,
  slash-top: 23.5mm,
  slash-width: 0.8mm,
  badge-diameter: 12mm,
  badge-left: 2.5mm,
  title-gap: 2mm,
  accents: (left: 26mm, width: 5mm, step: 2mm, height: 2.6mm, bottom: 0.8mm, gap: 4.5mm),
  rule-left: 36mm,
  rule-top: 13mm,
  rule-height: 0.35mm,
)

#let compact-footer = footer-style + (
  height: 14mm,
  bar-height: 8.5mm,
  strip-height: 2.5mm,
  tab-width: 30mm,
  tab-cut: 4mm,
  caption-left: 5mm,
  caption-size: 9.5pt,
  rule-gap: 3mm,
  rule-height: 0.35mm,
)
#import "branding.typ": running-head, running-foot

#let icon(name) = image(
  bytes(read("/assets/branding/icons/" + name + ".svg").replace("#B51F36", "#FFFFFF")),
  format:"svg", width:3mm, height:3mm)

#let exam-header() = running-head([], [Thầy Đỗ Xuân Thắng],
  branded:true,title-align:right,size-override:10.5pt,style:compact-header)

#let exam-footer(code) = context {
  let number = counter(page).get().first()
  let total = counter(page).final().first()
  let contacts = grid(columns:(auto,auto,auto,auto,auto),column-gutter:1.2mm,align:horizon,
    icon("website"),[toanthaythang.vn #h(1mm)],icon("facebook"),icon("tiktok"),[toanthaythangdxt])
  running-foot(contacts,number,total,folio-width:45mm,folio-size:8.5pt,
    folio:[Mã đề thi #code – Trang #number/#total],
    style:compact-footer,folio-in-bar:true)
}
