#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/theme.typ": lesson-style, palette
#import "/templates/contacts.typ": contact-links
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
// Livestream edition follows the approved Bac Ninh format.
#show: lesson.with(
 [Kiểm tra giữa học kì I — THPT Xuân Phương — Toán 12 — Mã 1220],
 variant:variant,
 branding:lesson-style.branding + (
  footer:[Lớp VIPDXT Toàn Diện Luyện thi 9+ Toán 2027: IB Z.a.l.o 0833.281.128],
  footer-align:center,
  footer-page-center:false,
  footer-offset:0.7mm,
  footer-x-offset:7mm,
  footer-rule:false,
  header-x-offset:-3mm,
  header-align:center,
  header-offset:0.8mm,
  header:lesson-style.branding.header,
 ),
 heading-content:lesson-heading(
  [ĐỀ KIỂM TRA GIỮA HK1 TOÁN 12],
  "TRƯỜNG THPT XUÂN PHƯƠNG | SỞ GD & DT HÀ NỘI",
  title-size:28pt,
  title-stretch:true,
  title-stroke:0.12pt + rgb("#E00018"),
  palette:palette + (heading:rgb("#E00018"),),
  course-size:22pt,
  subtitle:[#set text(size:11pt)
   #set par(leading:0.8em)
   Năm học 2026 - 2027 | Mã đề: 1220
  ],
 ),
)
#set text(size:13pt,overhang:false)
#set par(justify:true,leading:1.2em,spacing:3.5mm)
#questions(variant:variant)
