#import "/templates/exam-lesson.typ": exam
#import "/templates/lesson.typ": lesson-heading
#import "/templates/theme.typ": exam-lesson-palette as palette
#import "/templates/components.typ": end-mark
#import "/templates/exam.typ": exam-source
#import "content/questions.typ": questions
#show: exam.with([ĐỀ KIỂM TRA GIỮA KỲ I – THPT ĐINH TIÊN HOÀNG – TOÁN 12 – 2026–2027],"1203",variant:"de")
#set par(justify:false,leading:0.95em)
#lesson-heading(
 [ĐỀ KIỂM TRA GIỮA HK1 TOÁN 12],
 "TRƯỜNG THPT ĐINH TIÊN HOÀNG | SỞ GD & ĐT NINH BÌNH",
 title-size:28pt, title-stretch:true, title-stroke:0.12pt + rgb("#E00018"),
 palette:palette + (heading:rgb("#E00018"),), course-size:22pt,
 subtitle:[#set text(size:11pt)
 Năm học 2026 - 2027 | Mã đề: 1203],
)
#questions()
#end-mark([],above:6mm,note-gap:0pt)
#exam-source()
