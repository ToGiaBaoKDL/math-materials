#let palette = (
  primary: rgb("#B51F36"),
  exam-blue: rgb("#245474"),
  heading: rgb("#C00000"),
  box-fill: rgb("#FDF8F8"),
  question-tag: rgb("#E60012"),
  accent: rgb("#4CAF50"),
  ink: rgb("#000000"),
  paper: rgb("#FFFFFF"),
)

#let fonts = (body: ("Times New Roman", "FreeSerif"), math: "New Computer Modern Math", ui: "Noto Sans", course: "Arial",
  lesson-title: "#9Slide02 Tieu de dai",
  lesson-title-long: "#9Slide02 Tieu de rat dai 01",
  lesson-title-longer: "#9Slide02 Tieu de rat dai 02",
  subtitle: "#9Slide02 Noi dung dai", section: "#9Slide02 Tieu de dai")

#let line-style = (edge: 0.8pt, fine: 0.5pt, underline: 0.45pt, hatch: 0.35pt)

#let document-style = (
  paper: "a4",
  margin: (x: 12mm, top: 18mm, bottom: 14mm),
  note-size: 12pt,
  weight: "regular",
  emphasis: "bold",
  justify: true,
)

#let figure-style = (
  edge-width: line-style.edge,
  edge-opacity: (visible: 100%, hidden: 60%),
  hatch-width: line-style.hatch,
  label-size: 11pt,
  label-width: 8mm,
  label-top: 2mm,
  light-direction: (1, 2, 3),
  faces: (
    body: (light: 2%, shade: 6%),
    cap: (light: 14%, shade: 28%),
    section: (light: 4%, shade: 8%),
  ),
)

#let content-style = (
  answer-label-width: 15pt,
  answer-label-gap: 6pt,
  end-rule: 28mm,
  end-gap: 3mm,
)

#let header-style = (
  height: 20mm,
  bar-height: 10.5mm,
  strip-height: 3mm,
  strip-color: palette.primary.lighten(78%),
  tab-width: 40mm,
  tab-bottom: 26.7mm,
  slash-top: 31mm,
  slash-width: 1mm,
  badge-diameter: 16mm,
  badge-left: 3mm,
  badge-size: 17pt,
  subject-size: 9pt,
  subject-width: 10mm,
  badge-leading: 2pt,
  title-gap: 2mm,
  title-size: 10.1pt,
  subject-title-size: 11pt,
  accents: (left: 34mm, width: 6.5mm, step: 2.5mm, height: 3.5mm, bottom: 1mm, gap: 6mm),
  rule-left: 48mm,
  rule-top: 17.25mm,
  rule-height: 0.45mm,
)

#let footer-style = (
  height: 19mm,
  bar-height: 11mm,
  strip-height: 4mm,
  tab-width: 38mm,
  tab-cut: 5.3mm,
  caption-left: 6mm,
  folio-width: 29mm,
  caption-size: 12pt,
  folio-size: 13pt,
  rule-gap: 5mm,
  rule-height: 0.45mm,
)

#let rhythm = (
  question: 6mm,
  answers: 3.5mm,
  answer-row: 13pt,
  answer-column: 14pt,
  figure-above: 1mm,
  figure-below: 5mm,
  figure-column: 10mm,
  ending-note: 2mm,
)

#let lesson-style = (
  leading: 0.85em,
  margin: (x: 12mm, top: 24mm, bottom: 22mm),
  body-size: 14pt,
  title-size: 24pt,
  heading-top-trim: 4mm,
  title-gap: 5mm,
  section-size: 13.5pt,
  section-above: 7mm,
  section-below: 3mm,
  badge-size: 11pt,
  badge-width: 8mm,
  badge-gap: 3mm,
  badge-radius: 1mm,
  theory-inset: 4mm,
  theory-above: 5mm,
  theory-below: 7mm,
  paragraph-gap: 3.5mm,
  statement-gap: 4.5mm,
  statement-before: 3.5mm,
  figure-scale: 80%,
  plane-mint: rgb("#E8F2E9"),
  plane-sand: rgb("#F6EDDC"),
  formula-gap: 3mm,
  formula-row-gap: 3mm,
  solution-gap: 6mm,
  branding: (
    badge: [DXT],
    header: [THẦY ĐỖ XUÂN THẮNG - CHUYÊN LUYỆN THI MÔN TOÁN THPT 10.11.12 - TỐT NGHIỆP, HSA, TSA],
    footer: [DXT – HỌC THẤU HIỂU – THI BỨT PHÁ],
  ),
)

#let exam-style = (
  margin: (x: 12mm, top: 16mm, bottom: 18mm),
  body-size: 13pt, leading: 0.76em, question-gap: 6mm,
  section-gap: 5mm, statement-gap: 4mm,
)

#let writing-style = (solution-gap: 6mm, ruled-gap: 7mm, ruled-width: 0.4pt, ruled-opacity: 20%)

#let plot-style = (
  width: 70mm, height: 48mm, label-size: 10pt,
  curve: 1pt + palette.primary,
  guide: (paint: rgb("#67727A"), thickness: 0.55pt, dash: "dashed"),
  table-fill: palette.primary.lighten(91%),
  table-stroke: 0.5pt + palette.primary.lighten(35%),
)
