#import "/templates/exam.typ": exam, exam-cover, exam-end, exam-source
#import "content/questions.typ": questions
#import "content/solutions.typ": answer-key
#let variant = sys.inputs.at("variant", default: "de")
#show: exam.with("Đề giữa học kỳ I Toán 12 — Phan Bội Châu — 1108", "1108", variant: variant, leading: if variant=="dap-an" {1.0em} else {0.95em})
#exam-cover([SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI #linebreak() TRƯỜNG THPT PHAN BỘI CHÂU],
  [ĐỀ THI GIỮA HỌC KỲ I #linebreak() NĂM HỌC 2026–2027], "1108", subject: "Toán", organization-size: 12pt)
#if variant == "dap-an" {answer-key()}
#questions(variant, ending: exam-end(note: [#exam-source(ai:false)
Chữ ký của thí sinh: #box(width: 55mm, repeat[.]) #parbreak() #align(center)[#text(style: "italic", weight: "bold")[Cán bộ coi thi không giải thích gì thêm.]]]))
