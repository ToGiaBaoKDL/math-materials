#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/theme.typ": lesson-style, palette
#import "/templates/contacts.typ": contact-links
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
// This livestream edition alone uses the lesson heading and running branding.
#show: lesson.with(
 [Khảo sát chất lượng Toán 12 — Liên trường THPT Bắc Ninh — Lần 1 — Mã 1006],
 variant:variant,
 branding:lesson-style.branding + (
  footer:contact-links(color:white,tracking:0.35pt,text-offset:0.4mm),
 ),
 heading-content:lesson-heading(
  [ÔN THI GIỮA HK1 TOÁN 12],
  [ĐỀ KSCL LIÊN TRƯỜNG THPT BẮC NINH — LẦN 1],
  title-size:24pt,
  course-size:20.5pt,
  subtitle:[#set text(size:13pt)
   #set par(leading:0.8em)
   Năm học 2026–2027 · Mã đề 1006\ Ngày thi: 23/10/2026 · Thời gian làm bài: 90 phút
  ],
 ),
)
#set text(size:13pt,overhang:false)
#set par(justify:true,leading:1.1em,spacing:3mm)
#questions(variant:variant)
