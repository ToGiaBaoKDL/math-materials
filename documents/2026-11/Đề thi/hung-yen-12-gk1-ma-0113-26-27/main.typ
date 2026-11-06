#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/theme.typ": lesson-style, palette
#import "content/questions.typ": questions

#let variant = sys.inputs.at("variant", default: "de")

// Livestream edition follows the approved Xuân Phương format.
#show: lesson.with(
  [Khảo sát chất lượng giữa học kì I — Sở GD\&ĐT Hưng Yên — Toán 12 — Mã 0113],
  variant: variant,
  branding: lesson-style.branding + (
    footer: [Lớp VIPDXT Toàn Diện Luyện thi 9+ Toán 2027: IB Z.a.l.o 0833.281.128],
    footer-align: left,
    footer-page-center: false,
    footer-offset: 0.7mm,
    footer-x-offset: 0mm,
    footer-rule: false,
    header-x-offset: 0mm,
    header-align: right,
    header-offset: 0mm,
    header: lesson-style.branding.header,
  ),
  heading-content: lesson-heading(
    [KHẢO SÁT CHẤT LƯỢNG GIỮA HK I TOÁN 12],
    "SỞ GIÁO DỤC VÀ ĐÀO TẠO HƯNG YÊN",
    title-size: 28pt,
    title-stretch: true,
    title-stroke: 0.12pt + rgb("#E00018"),
    palette: palette + (heading: rgb("#E00018"),),
    course-size: 19pt,
    subtitle: [
      #set text(size: 11pt)
      #set par(leading: 0.8em)
      Năm học 2026 - 2027 | Mã đề: 0113
    ],
  ),
)

#set text(size: 13pt, overhang: false)
// The exam paper keeps the original five-page rhythm; the workbook is airier.
#set par(
  justify: true,
  leading: if variant == "de" { 1em } else { 1.2em },
  spacing: if variant == "de" { 2.5mm } else { 3.5mm },
)
#questions(variant: variant)
