#import "/templates/exam.typ": exam, exam-cover, exam-end
#import "content/questions.typ": questions
#import "content/solutions.typ": answer-key, solutions
#let variant = sys.inputs.at("variant", default: "de-dap-an")
#show: exam.with([Đánh giá giữa kỳ I Toán 11 — Lê Thánh Tông — 17/10/2026], "110", variant: variant, leading: 1.2em)
#set text(size: 13.5pt)
#set par(justify: true, leading: 1.2em, spacing: 4.5mm)
#if variant != "dap-an" {
  exam-cover(
    [SỞ GIÁO DỤC VÀ ĐÀO TẠO TP. HCM\ TRƯỜNG TH-THCS-THPT LÊ THÁNH TÔNG],
    [ĐỀ ĐÁNH GIÁ GIỮA KỲ I\ NĂM HỌC 2026–2027],
    "110",
    grade: "11",
    heading-increase: 1pt,
    left-column: 61%,
    exam-date: [17/10/2026],
    pages: context counter(page).at(<end-questions>).first(),
  )
  questions()
  v(1fr)
  exam-end()
  [#metadata("end-questions") <end-questions>]
}
#if variant == "de-dap-an" { pagebreak() }
#if ("dap-an", "de-dap-an").contains(variant) {
  answer-key()
  solutions()
  v(1fr)
  exam-end()
}
