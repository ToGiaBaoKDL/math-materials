#import "/templates/matrix.typ": matrix-document, section, specification, summary, totals-table
#import "content.typ": rows, specs, totals
#show: matrix-document.with([TRƯỜNG THPT TRIỆU PHONG], organization: [TỔ TOÁN])
#show math.equation.where(block: false): it => box(math.display(it))
#show math.equation: set text(top-edge: "bounds", bottom-edge: "bounds")
#let style = (merge-chapter: true, spacious: true, colored: true)
#section([I. MA TRẬN ĐỀ KIỂM TRA])
#summary(rows, totals, essay: false, style: style)
#v(2mm)
#text(
  size: 11.5pt,
)[Ghi chú: DT1: 12 câu (0,25 điểm/câu); DT2: 4 câu (mỗi câu có 4 ý a, b, c, d) (0,25 điểm/ý; 1 điểm/câu); DT3: 6 câu (0,5 điểm/câu).

  Câu có đánh dấu \* là câu vận dụng cao.]
#pagebreak()
#section([II. KHUNG BẢN ĐẶC TẢ])
#specification(specs.slice(0, 2), essay: false, style: style)
#pagebreak()
#specification(specs.slice(2, 4), essay: false, style: style)
#pagebreak()
#specification(specs.slice(4), essay: false, style: style, totals: totals.map(row => (
  title: row.title,
  cells: row.cells.slice(0, 7),
)))
