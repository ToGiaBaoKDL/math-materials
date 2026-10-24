#import "/templates/exam.typ": exam, exam-cover, exam-end
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#show: exam.with([Khảo sát chất lượng Toán 12 — Liên trường THPT Bắc Ninh — Lần 1 — Mã 1006], "1006", variant:variant, leading: 1.1em)
#set text(size:13pt,overhang:false)
#set par(justify:true,leading:1.1em,spacing:3mm)
#exam-cover(
 [SỞ GD&ĐT BẮC NINH\ LIÊN TRƯỜNG THPT],
 [ĐỀ KHẢO SÁT CHẤT LƯỢNG\ LỚP 12 — LẦN 1\ NĂM HỌC 2026–2027],
 "1006",grade:"12",duration:90,exam-date:"23/10/2026",
)
#questions(variant:variant)


