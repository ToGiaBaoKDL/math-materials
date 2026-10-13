#import "theme.typ": palette, fonts
// Optional lesson header, independent of exam running matter.
#let lesson-red-header() = block(width:100%,inset:(x:12mm,top:5mm))[
  #set text(font:fonts.ui,size:11pt,weight:"regular",fill:palette.primary)
  #set par(justify:false,leading:0pt)
  #grid(columns:(1fr,auto),column-gutter:5mm,
    align(left)[Thầy Đỗ Xuân Thắng],
    align(right)[Luyện thi 9+ Toán THPT 10.11.12])
  #v(0.7mm)
  #line(length:100%,stroke:1pt+palette.primary)
]
