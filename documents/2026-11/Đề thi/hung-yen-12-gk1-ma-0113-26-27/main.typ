#import "/templates/exam-lesson.typ": exam
#import "/templates/lesson.typ": lesson-heading
#import "/templates/theme.typ": exam-lesson-palette as palette
#import "/templates/exam.typ": exam-end
#import "content/questions.typ": questions

#show: exam.with([KHẢO SÁT CHẤT LƯỢNG GIỮA HỌC KỲ I – HƯNG YÊN – TOÁN 12 – 2026–2027], "0113", variant:"de")
#set par(justify:true,leading:0.9em)
#lesson-heading(
 [KHẢO SÁT CHẤT LƯỢNG GIỮA HK I TOÁN 12],
 "SỞ GIÁO DỤC VÀ ĐÀO TẠO HƯNG YÊN",
 title-size:24pt,title-stretch:true,course-size:19pt,
 title-stroke:0.12pt + rgb("#E00018"),
 palette:palette + (heading:rgb("#E00018"),),
 subtitle:[#set text(size:11pt)
 Năm học 2026 - 2027 | Mã đề: 0113],
)
#block(above:4mm,below:3mm)[
 #grid(columns:(1fr,1fr),gutter:8mm,
 [Họ tên: #box(width:57mm,repeat[.])],
 [Số báo danh: #box(width:40mm,repeat[.])])
]
#questions()
#exam-end()
