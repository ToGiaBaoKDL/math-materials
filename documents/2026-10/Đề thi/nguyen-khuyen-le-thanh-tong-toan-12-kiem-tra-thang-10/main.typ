#import "/templates/exam.typ": exam, exam-cover, exam-end, exam-source
#import "content/questions.typ": questions
#import "content/solutions.typ": answer-key, solutions
#let variant=sys.inputs.at("variant",default:"de")
#show: exam.with("Kiểm tra định kì Toán 12 — Nguyễn Khuyến – Lê Thánh Tông — 11/10/2026",none,variant:variant,leading:0.95em)
#if variant != "dap-an" {
 exam-cover([TRƯỜNG THCS–THPT NGUYỄN KHUYẾN #linebreak() TRƯỜNG TH–THCS–THPT LÊ THÁNH TÔNG],
 [ĐỀ KIỂM TRA ĐỊNH KÌ #linebreak() NĂM HỌC 2026–2027],none,subject:"Toán – Khối 12",note:[Ngày kiểm tra: 11/10/2026],organization-size:11pt,
 pages:context counter(page).at(<end-questions>).first())
 questions()
 v(1fr)
 exam-end(note:exam-source())
 [#metadata("end-questions") <end-questions>]
}
#if variant == "de-dap-an" {pagebreak()}
#if variant == "de-dap-an" {
 set page(background:none)
 answer-key()
 solutions()
 v(1fr)
 exam-end(note:exam-source(ai:true))
} else if variant == "dap-an" {
 answer-key()
 solutions()
 v(1fr)
 exam-end(note:exam-source(ai:true))
}
