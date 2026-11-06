#import "/templates/exam-lesson.typ": exam
#import "/templates/lesson.typ": lesson-heading
#import "/templates/theme.typ": exam-lesson-palette as palette
#import "/templates/exam.typ": exam-end
#import "content/questions.typ": questions

#show: exam.with(
  [ĐỀ KIỂM TRA GIỮA HỌC KÌ I – THPT ĐÔ LƯƠNG 1 – TOÁN 12 – 2026–2027],
  "2112",
  variant: "de",
)

#set par(justify: false, leading: 0.85em)

#lesson-heading(
  [ĐỀ KIỂM TRA GIỮA HK1 TOÁN 12],
  "TRƯỜNG THPT ĐÔ LƯƠNG 1 | SỞ GD & ĐT NGHỆ AN",
  title-size: 28pt,
  title-stretch: true,
  title-stroke: 0.12pt + rgb("#E00018"),
  palette: palette + (heading: rgb("#E00018"),),
  course-size: 22pt,
  subtitle: [
    #set text(size: 11pt)
    Năm học 2026 - 2027 | Mã đề: 2112
  ],
)

#questions()

#exam-end()
