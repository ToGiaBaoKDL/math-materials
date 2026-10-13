#import "theme.typ": header-style, footer-style
#import "branding.typ": running-head, running-foot

#let icon(name) = image(
  bytes(read("/assets/branding/icons/" + name + ".svg").replace("#B51F36", "#FFFFFF")),
  format:"svg", width:4mm, height:4mm)

#let exam-header() = running-head([], [Thầy Đỗ Xuân Thắng - Luyện Thi 9+ Toán 10.11.12],
  branded:true,title-align:center,size-override:11.5pt,
  style:header-style + (badge-diameter:10mm,badge-left:3mm))

#let exam-footer(code) = context {
  let number = counter(page).get().first()
  let total = counter(page).final().first()
  let contacts = grid(columns:(auto,auto,auto,auto,auto,auto,auto),column-gutter:1.2mm,align:horizon,
    icon("website"),[toanthaythang.vn],
    box(width:3mm,align(center,rect(width:0.4pt,height:2.6mm,fill:white,stroke:none))),
    icon("facebook"),text(size:10pt,weight:"bold")[\&],icon("tiktok"),[toanthaythangdxt])
  running-foot(contacts,number,total,margin:(x:footer-style.caption-left),folio-width:45mm,folio-size:9pt,
    folio:text(weight:"bold")[Mã đề thi #code – Trang #number/#total])
}
