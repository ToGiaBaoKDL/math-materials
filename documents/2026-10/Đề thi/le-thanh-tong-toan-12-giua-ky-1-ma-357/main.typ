#import "/templates/exam.typ": exam, exam-cover, exam-end, exam-source
#import "content/questions.typ": questions
#import "content/solutions.typ": answer-key, solutions
#let variant = sys.inputs.at("variant", default: "de-dap-an")
#show: exam.with([Kiểm tra giữa kì I Toán 12 — Lê Thánh Tông — 18/10/2026], "357", variant: variant)
#set par(justify: false, spacing: 3.5mm)
#if variant != "dap-an" {
  exam-cover(
    [SỞ GIÁO DỤC VÀ ĐÀO TẠO TP. HCM\ TRƯỜNG TH-THCS-THPT LÊ THÁNH TÔNG],
    [ĐỀ KIỂM TRA GIỮA KÌ I\ NĂM HỌC 2026–2027],
    "357",
    heading-increase: 1pt,
    left-column: 61%,
    exam-date: [18/10/2026],
    pages: context counter(page).at(<end-questions>).first(),
  )
  questions()
  v(1fr)
  exam-end(note: exam-source())
  [#metadata("end-questions") <end-questions>]
}
#if variant == "de-dap-an" { pagebreak() }
#if ("dap-an", "de-dap-an").contains(variant) {
  answer-key()
  solutions()
  v(1fr)
  exam-end(note: exam-source())
}
