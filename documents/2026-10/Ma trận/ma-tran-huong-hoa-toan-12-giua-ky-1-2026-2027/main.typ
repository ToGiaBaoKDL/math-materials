#import "/templates/matrix.typ": matrix-document, section, specification, summary, totals-table
#import "content.typ": rows, specs, totals
#show: matrix-document.with([TRƯỜNG THPT HƯỚNG HÓA], organization: [HỘI ĐỒNG MÔN TOÁN TỈNH QUẢNG TRỊ | TỔ TOÁN])
#show math.equation.where(block: false): it => box(math.display(it))
#show math.equation: set text(top-edge: "bounds", bottom-edge: "bounds")
#let style = (merge-chapter: true, spacious: true, colored: true)
#section([I. MA TRẬN ĐỀ KIỂM TRA])
#summary(rows, totals, essay: true, style: style)
#v(2mm)
#text(
  size: 11.5pt,
)[Lưu ý: DT1 (Trắc nghiệm bốn lựa chọn): 0,25 điểm/câu; DT2 (Trắc nghiệm Đúng/Sai): 0,25 điểm/ý; DT3 (Trắc nghiệm trả lời ngắn): 0,5 điểm/câu; Tự luận: 0,5 điểm/câu.]
#pagebreak()
#section([II. BẢN ĐẶC TẢ MA TRẬN ĐỀ KIỂM TRA GIỮA KÌ I MÔN TOÁN – LỚP 12])
#specification(specs.slice(0, 2), essay: true, style: style)
#pagebreak()
#specification(specs.slice(2, 4), essay: true, style: style)
#pagebreak()
#specification(specs.slice(4), essay: true, style: style, totals: totals.map(row => (
  title: row.title,
  cells: row.cells.slice(0, 9),
)))
