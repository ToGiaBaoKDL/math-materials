#import "theme.typ": fonts, lesson-style, palette, plot-style
#import "lesson.typ": lesson-heading, lesson-section
#import "branding.typ": running-foot, running-head
#import "contacts.typ": contact-links

#let matrix-document(school, body, organization: none) = {
  set document(title: [Ma trận đề kiểm tra giữa kì I Toán 12 — #school])
  set text(font: "Arial", size: 12.5pt, lang: "vi")
  show math.equation: set text(font: fonts.math)
  set par(justify: false, leading: 0.65em, spacing: 2mm)
  let margin = (x: 12mm, top: 20mm, bottom: 19mm)
  set page(paper: "a4", flipped: true, margin: margin, background: context {
    place(top + left, running-head(
      lesson-style.branding.badge,
      lesson-style.branding.header,
      branded: true,
      title-align: center,
      margin: margin,
    ))
    place(bottom + left, running-foot(
      contact-links(color: white, tracking: 0.35pt, text-offset: 0.4mm),
      counter(page).get().first(),
      counter(page).final().first(),
      margin: margin,
    ))
  })
  lesson-heading(
    [MA TRẬN ĐỀ KIỂM TRA GIỮA KÌ I],
    school,
    subtitle: text(tracking: 0.6pt)[MÔN TOÁN – LỚP 12 | NĂM HỌC 2026–2027 | Thời gian: 90 phút],
    course-size: 20pt,
    course-tracking: 1.3pt,
    title-tracking: 2pt,
    title-size: 25.8pt,
    horizontal-inset: 3mm,
    author: none,
    border: 0.8pt + palette.heading,
  )
  if organization != none { align(center, text(size: 11.5pt, organization)) }
  body
}

#let section(title, badge: none) = lesson-section(title, badge: badge, above: 2mm)
#let chapter = [Ứng dụng đạo hàm để khảo sát và vẽ đồ thị của hàm số\ (24 tiết)]
#let table-style = (merge-chapter: false, spacious: false, colored: false)
#let group-colors = (rgb("#EDF4F5"), rgb("#F5EFF1"), rgb("#F0F4EB"), rgb("#F7F3E9"))
#let group-header-colors = group-colors
#let group-header-fill(index) = group-header-colors.at(if index < 2 { 0 } else if index < 5 { 1 } else if index < 7 {
  2
} else { 3 })
#let group-fill(index) = group-colors.at(if index < 2 { 0 } else if index < 5 { 1 } else if index < 7 { 2 } else { 3 })
#let data-cell(value, index, style) = table.cell(fill: if style.colored and index < 9 { group-fill(index) } else {
  white
})[#value]
#let headings(spec: false, essay: false, style: table-style) = {
  let levels = if essay { 9 } else { 7 }
  let h(body, ..args) = table.cell(fill: plot-style.table-fill, stroke: 0.6pt + white, ..args, text(
    fill: white,
    weight: "bold",
    body,
  ))
  table.header(
    h([STT], rowspan: 3),
    h([Chương/\ Chủ đề], rowspan: 3),
    h([Nội dung], rowspan: 3),
    ..if spec { (h([Yêu cầu cần đạt], rowspan: 3),) } else { () },
    h(if spec { [Số câu hỏi ở các mức độ đánh giá] } else { [Mức độ đánh giá] }, colspan: levels),
    ..if not spec { (h([Tổng], colspan: 3, rowspan: 2), h([Tỉ lệ], rowspan: 3)) } else { () },
    ..(("DT1", 2), ("DT2", 3), ("DT3", 2), ..if essay { (("Tự luận", 2),) } else { () })
      .enumerate()
      .map(((i, item)) => {
        if style.colored {
          table.cell(colspan: item.at(1), fill: group-header-colors.at(i), text(
            weight: "bold",
            fill: palette.ink,
            item.at(0),
          ))
        } else { h(item.at(0), colspan: item.at(1)) }
      }),
    ..([Biết], [Hiểu], [Biết], [Hiểu], [VD], [Hiểu], [VD], ..if essay { ([Hiểu], [VD]) } else { () })
      .enumerate()
      .map(((i, x)) => {
        if style.colored { table.cell(fill: group-header-fill(i), text(weight: "bold", fill: palette.ink, x)) } else {
          h(x)
        }
      }),
    ..if not spec { (h([Biết]), h([Hiểu]), h([VD])) } else { () },
  )
}

#let summary(rows, totals, essay: false, style: table-style) = {
  let levels = if essay { 9 } else { 7 }
  set text(size: 11pt)
  set par(leading: if style.spacious { 0.3em } else { 0.35em }, spacing: 1mm)
  table(
    columns: (8mm, 26mm, 40mm) + (1fr,) * levels + (11mm, 11mm, 11mm, 15mm),
    align: center + horizon,
    inset: (x: 1.2mm, y: if style.spacious { 0.7mm } else { 1.2mm }),
    stroke: 0.6pt + rgb("#B39A9F"),
    headings(essay: essay, style: style),
    table.cell(rowspan: rows.len())[*1*], table.cell(rowspan: rows.len())[#strong(chapter)],
    ..rows
      .enumerate()
      .map(((i, row)) => (
        table.cell(align: left + horizon)[#row.title],
        ..row
          .cells
          .enumerate()
          .map(((j, x)) => data-cell(
            if j >= levels { strong(x) } else if style.spacious { x.replace("\n", ", ") } else { x },
            j,
            style,
          )),
      ))
      .flatten(),
    ..totals
      .map(row => (
        table.cell(
          colspan: 3,
          fill: palette.box-fill,
          text(weight: "bold", row.title),
        ),
        ..row.cells.map(x => table.cell(fill: palette.box-fill)[#strong(x)]),
      ))
      .flatten(),
    table.cell(colspan: 3, fill: rgb("#FFF0B8"))[*Tỉ lệ %*],
    table.cell(colspan: 2, fill: rgb("#FFF0B8"))[*30*], table.cell(colspan: 3, fill: rgb("#FFF0B8"))[*40*], table.cell(
      colspan: 2,
      fill: rgb("#FFF0B8"),
    )[*30*],
    ..if essay { (table.cell(colspan: 2, fill: rgb("#FFF0B8"))[*0*],) } else { () },
    table.cell(colspan: 2, fill: rgb("#FFF0B8"))[*70*], table.cell(fill: rgb("#FFF0B8"))[*30*], table.cell(
      fill: rgb("#FFF0B8"),
    )[*100*],
  )
}

#let total-cells(rows, essay: false, style: table-style, label-span: 2) = (
  ..rows
    .map(row => (
      table.cell(colspan: label-span, fill: palette.box-fill, text(weight: "bold", row.title)),
      ..row.cells.enumerate().map(((i, x)) => data-cell(strong(x), i, style)),
    ))
    .flatten(),
  table.cell(colspan: label-span, fill: rgb("#FFF0B8"))[*Tỉ lệ %*],
  table.cell(colspan: 2, fill: rgb("#FFF0B8"))[*30*],
  table.cell(colspan: 3, fill: rgb("#FFF0B8"))[*40*],
  table.cell(colspan: 2, fill: rgb("#FFF0B8"))[*30*],
  ..if essay { (table.cell(colspan: 2, fill: rgb("#FFF0B8"))[*0*],) } else { () },
)

#let specification(rows, essay: false, style: table-style, totals: ()) = {
  let levels = if essay { 9 } else { 7 }
  set text(size: 12pt)
  set table.cell(breakable: false)
  set par(leading: if style.spacious { 0.72em } else { 0.65em }, spacing: 2mm)
  table(
    columns: (8mm, 24mm, 30mm, 1fr) + (if essay { 14mm } else { 18mm },) * levels,
    align: center + horizon,
    inset: (x: 1.5mm, y: 2mm),
    stroke: 0.6pt + rgb("#B39A9F"),
    headings(spec: true, essay: essay, style: style),
    ..rows
      .enumerate()
      .map(((i, row)) => (
        ..if style.merge-chapter {
          if i == 0 {
            (
              table.cell(rowspan: rows.len(), breakable: true)[*1*],
              table.cell(rowspan: rows.len(), breakable: true)[#strong(chapter)],
            )
          } else { () }
        } else { ([*1*], [#strong(chapter)]) },
        [#row.title],
        table.cell(align: left + horizon)[#row.requirements],
        ..row
          .cells
          .enumerate()
          .map(((i, x)) => data-cell(
            if type(x) == str { x.split("\n").map(line => box(line)).join(linebreak()) } else { x },
            i,
            style,
          )),
      ))
      .flatten(),
    ..if totals.len() > 0 { total-cells(totals, essay: essay, style: style, label-span: 4) } else { () },
  )
}

#let totals-table(rows, essay: false, style: table-style) = {
  let levels = if essay { 9 } else { 7 }
  set text(size: 12pt)
  table(
    columns: (75mm, 1fr) + (if essay { 12mm } else { 14mm },) * levels,
    inset: (x: 1.5mm, y: 2mm), align: center + horizon, stroke: 0.6pt + rgb("#B39A9F"),
    ..total-cells(rows, essay: essay, style: style),
  )
}

// Square pages retain the landscape summary width and natural table typography.
#let square-specification(body) = {
  set page(width: 297mm, height: 297mm, flipped: false)
  body
}
