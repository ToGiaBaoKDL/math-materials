#import "/templates/exam.typ": exam, exam-cover, exam-end
#import "content/questions.typ": questions
#let variant = sys.inputs.at("variant", default: "de")
#show: exam.with("Đề giữa học kỳ I Toán 12 — Phan Bội Châu — 1108", "1108", variant: variant, leading: 0.95em)
#exam-cover([SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI #linebreak() TRƯỜNG THPT PHAN BỘI CHÂU],
  [ĐỀ THI HỌC GIỮA HỌC KỲ I #linebreak() NĂM HỌC 2026–2027], "1108", subject: "Toán 12", organization-size: 10.5pt)
#questions(variant, ending: exam-end(note: [Chữ ký của thí sinh: #box(width: 55mm, repeat[.]) #parbreak() #align(center)[#text(style: "italic", weight: "bold")[Cán bộ coi thi không giải thích gì thêm.]]]))
