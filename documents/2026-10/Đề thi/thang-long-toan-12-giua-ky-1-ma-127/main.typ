#import "/templates/exam.typ": exam, exam-cover, exam-end
#import "content/questions.typ": questions
#import "content/solutions.typ": answer-key, solutions
#let variant = sys.inputs.at("variant", default: "de-dap-an")
#show: exam.with([Đề giữa học kỳ I Toán 12 — THPT Thăng Long — Mã 127], "127", variant: variant, leading: 1.2em)
#set text(size: 13.5pt)
#set par(justify: false, leading: 1.2em, spacing: 4.5mm)
#if variant != "dap-an" {
  exam-cover(
    [SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI\ TRƯỜNG THPT THĂNG LONG],
    [ĐỀ KIỂM TRA GIỮA HỌC KÌ I\ NĂM HỌC 2026–2027],
    "127",
    grade: "12",
    exam-date: [23/10/2026],
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
