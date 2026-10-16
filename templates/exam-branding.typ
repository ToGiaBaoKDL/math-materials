#import "theme.typ": exam-palette as palette, fonts, exam-style
// Exam-only running matter.
#let plain-header() = block(width:100%,inset:(x:12mm,top:5mm))[
  #set text(font:fonts.ui,size:exam-style.running-size,weight:exam-style.running-weight,fill:palette.primary,stroke:exam-style.running-stroke+palette.primary)
  #set par(justify:false,leading:0pt)
  #grid(columns:(1fr,auto),column-gutter:5mm,
    align(left)[Thầy Đỗ Xuân Thắng],
    align(right)[Luyện thi 9+ Toán THPT 10.11.12])
  #v(-0.5mm)
  #line(length:100%,stroke:1pt+palette.primary)
]
#let plain-footer(caption, folio) = block(width:100%,inset:(x:12mm,bottom:5mm))[
  #set text(font:fonts.ui,size:exam-style.running-size,weight:exam-style.running-weight,fill:palette.primary,stroke:exam-style.running-stroke+palette.primary)
  #set par(justify:false,leading:0pt)
  #grid(columns:(1fr,auto),column-gutter:5mm,align:horizon,
    align(left,caption),align(right,folio))
]

#let exam-header = plain-header
#let contact-icon(name) = image(
  bytes(read("/assets/branding/icons/" + name + ".svg").replace("#B51F36", "#000000")),
  format: "svg", width: 4mm, height: 4mm)
#let exam-footer(code) = context {
  let number=counter(page).get().first()
  let total=counter(page).final().first()
  let contacts = grid(columns:(auto,auto,auto,auto,auto,auto,auto),
    column-gutter:1.2mm,align:horizon,
    contact-icon("website"),[toanthaythang.vn],
    box(width:3mm,align(center)[|]),
    contact-icon("facebook"),[\&],
    contact-icon("tiktok"),[toanthaythangdxt])
  plain-footer(contacts,[Mã đề thi #code – Trang #number/#total])
}
