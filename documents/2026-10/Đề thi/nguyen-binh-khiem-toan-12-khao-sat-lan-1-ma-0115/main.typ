#import "/templates/exam.typ": exam, exam-cover, exam-end, exam-source
#import "content/questions.typ": questions
#let variant = sys.inputs.at("variant", default: "de")
#show: exam.with("Khảo sát Toán 12 lần I — Nguyễn Bỉnh Khiêm — 0115", "0115", variant: variant, leading: if variant=="dap-an" {1.0em} else {0.95em})
#if variant != "dap-an" {
 exam-cover([SỞ GD\&ĐT GIA LAI #linebreak() THPT NGUYỄN BỈNH KHIÊM],
 [KHẢO SÁT CHẤT LƯỢNG #linebreak() HỌC SINH LỚP 12 – LẦN I #linebreak() NĂM HỌC 2026–2027], "0115", status:[ĐỀ CHÍNH THỨC], organization-size: 12pt, pages: context counter(page).at(<end-questions>).first())
 questions(if variant == "de-cach" {"de-cach"} else {"de"}, ending: exam-end(note: [#exam-source(ai:variant=="dap-an")
#text(style:"italic")[Thí sinh không được sử dụng tài liệu. #linebreak() Cán bộ coi thi không giải thích gì thêm.]]))

 [#metadata("end-questions") <end-questions>]
}
#if variant == "de-dap-an" { pagebreak() }
#if ("dap-an", "de-dap-an").contains(variant) {
 set par(leading: 1em)
 questions("dap-an", ending: exam-end(note: exam-source(ai: true)))
}
