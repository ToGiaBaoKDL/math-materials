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
  footer:contact-links(color:white,tracking:0.35pt,text-offset:0.4mm),
 ),
 heading-content:lesson-heading(
  [ÔN THI GIỮA HK1 TOÁN 12],
  [ĐỀ GIỮA HỌC KÌ I — THPT XUÂN PHƯƠNG],
  title-size:24pt,
  course-size:20.5pt,
  subtitle:[#set text(size:13pt)
   #set par(leading:0.8em)
   Năm học 2026–2027 · Mã đề 1220\ Thời gian làm bài: 90 phút
  ],
 ),
)
#set text(size:13pt,overhang:false)
#set par(justify:true,leading:1.2em,spacing:3.5mm)
#questions(variant:variant)
