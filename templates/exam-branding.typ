#import "theme.typ": fonts
#import "branding.typ": running-head, running-foot

#let icon(name) = image(
  bytes(read("/assets/branding/icons/" + name + ".svg").replace("#B51F36", "#FFFFFF")),
  format:"svg", width:4mm, height:4mm)

#let exam-header() = running-head([], [Thầy Đỗ Xuân Thắng],
  branded:true,title-align:right,size-override:13pt)

#let exam-footer(code) = context {
  let number = counter(page).get().first()
  let total = counter(page).final().first()
  let contacts = grid(columns:(auto,auto,auto,auto,auto),column-gutter:1.2mm,align:horizon,
    icon("website"),[toanthaythang.vn #h(1mm)],icon("facebook"),icon("tiktok"),[toanthaythangdxt])
  running-foot(contacts,number,total,folio-width:45mm,folio-size:9pt,
    folio:[Mã đề thi #code – Trang #number/#total])
}
