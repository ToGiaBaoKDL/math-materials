#import "theme.typ": document-style, fonts, footer-style, header-style, palette

#let fading-rule(width, color, height: header-style.rule-height, reverse: false) = rect(
  width: width,
  height: height,
  stroke: none,
  fill: gradient.linear(
    color,
    color.transparentize(100%),
    angle: if reverse { 180deg } else { 0deg },
    relative: "self",
  ),
)

#let fitted-label(body, width, size, weight: document-style.emphasis) = {
  let label = text(font: fonts.ui, size: size, weight: weight, fill: palette.paper, body)
  let natural = measure(label).width
  let scale = if natural == 0pt { 1 } else { calc.min(1, width / natural) }
  text(font: fonts.ui, size: size * scale, weight: weight, fill: palette.paper, body)
}

#let page-insets(margin) = {
  let automatic = calc.min(page.width, page.height) * 2.5 / 21
  let resolve(value) = if value == auto { automatic } else {
    measure(box(width: value), width: page.width).width
  }
  if type(margin) == dictionary {
    let common = margin.at("x", default: margin.at("rest", default: auto))
    (left: resolve(margin.at("left", default: common)), right: resolve(margin.at("right", default: common)))
  } else {
    (left: resolve(margin), right: resolve(margin))
  }
}

#let running-head(
  badge,
  title,
  branded: false,
  palette: palette,
  title-align: left,
  size-override: none,
  style: header-style,
  margin: document-style.margin,
) = layout(size => {
  set text(font: fonts.ui, weight: document-style.emphasis, fill: palette.paper)
  set par(justify: false, leading: 0pt)
  let head = style
  let inset = page-insets(margin)
  let cut = head.tab-width - head.tab-bottom
  let badge-top = (head.height - head.badge-diameter) / 2
  let badge-left = head.badge-left
  let title-left = head.tab-width + head.title-gap
  let title-width = size.width - title-left - if branded { 4mm } else { inset.right }
  let title-size = if size-override != none { size-override } else if branded { head.title-size } else {
    head.subject-title-size
  }
  let accent = head.accents
  let accent-bottom = head.height - accent.bottom
  block(width: 100%, height: head.height)[
    #place(top + left, rect(width: 100%, height: head.bar-height, fill: palette.primary, stroke: none))
    #place(top + left, dy: head.bar-height, fading-rule(
      size.width,
      head.strip-color,
      height: head.strip-height,
      reverse: true,
    ))
    #place(top + left, polygon(
      (0mm, 0mm),
      (head.tab-width, 0mm),
      (head.tab-bottom, head.height),
      (0mm, head.height),
      fill: palette.primary,
      stroke: none,
    ))
    #place(top + left, polygon(
      (head.slash-top, 0mm),
      (head.slash-top + head.slash-width, 0mm),
      (head.slash-top + head.slash-width - cut, head.height),
      (head.slash-top - cut, head.height),
      fill: palette.paper,
      stroke: none,
    ))
    #place(top + left, dx: badge-left, dy: badge-top, circle(
      radius: head.badge-diameter / 2,
      fill: palette.paper,
      stroke: none,
    ))
    #let badge-display = if branded {
      image(
        "/assets/branding/logo-original.png",
        width: head.badge-diameter,
        height: head.badge-diameter,
        fit: "contain",
      )
    } else {
      block(width: head.badge-diameter, height: head.badge-diameter, align(center + horizon)[
        #box(width: head.subject-width)[
          #set par(leading: head.badge-leading)
          #text(
            font: fonts.ui,
            size: head.subject-size,
            fill: palette.primary,
            top-edge: "bounds",
            bottom-edge: "bounds",
            badge,
          )
        ]
      ])
    }
    #place(top + left, dx: badge-left, dy: badge-top, badge-display)
    #place(top + left, dx: title-left, block(width: title-width, height: head.bar-height, align(
      title-align + horizon,
      text(top-edge: "bounds", bottom-edge: "bounds", fitted-label(title, title-width, title-size)),
    )))
    #for i in range(2) {
      let x = accent.left + i * accent.gap
      place(top + left, polygon(
        (x + accent.step, accent-bottom - accent.height),
        (x + accent.width, accent-bottom - accent.height),
        (x + accent.width - accent.step, accent-bottom),
        (x, accent-bottom),
        fill: palette.accent,
        stroke: none,
      ))
    }
    #place(top + left, dx: head.rule-left, dy: head.rule-top, fading-rule(
      size.width - head.rule-left,
      palette.accent.darken(20%),
      height: head.rule-height,
      reverse: false,
    ))
  ]
})

#let running-foot(
  caption,
  number,
  total,
  margin: document-style.margin,
  folio: none,
  palette: palette,
  folio-width: footer-style.folio-width,
  folio-size: footer-style.folio-size,
) = layout(size => {
  set text(font: fonts.ui, weight: document-style.weight, fill: palette.paper)
  set par(justify: false)
  let foot = footer-style
  let inset = page-insets(margin)
  let bar-top = foot.height - foot.bar-height
  let folio-left = size.width - inset.right - folio-width
  let caption-width = folio-left - foot.caption-left - 2 * foot.rule-gap
  let caption-label = fitted-label(caption, caption-width, foot.caption-size)
  let text-x = foot.caption-left
  let rule-left = text-x + measure(caption-label).width + foot.rule-gap
  let rule-right = folio-left - foot.rule-gap
  block(width: 100%, height: foot.height)[
    #place(top + left, dy: bar-top - foot.strip-height, fading-rule(
      size.width,
      palette.accent,
      height: foot.strip-height,
      reverse: true,
    ))
    #place(top + left, dy: bar-top, rect(width: 100%, height: foot.bar-height, fill: palette.primary, stroke: none))
    #place(top + left, polygon(
      (size.width - foot.tab-width, 0mm),
      (size.width, 0mm),
      (size.width, foot.height),
      (size.width - foot.tab-width - foot.tab-cut, foot.height),
      (size.width - foot.tab-width - foot.tab-cut, bar-top),
      fill: palette.primary,
      stroke: none,
    ))
    #place(top + left, dx: text-x, dy: bar-top, block(height: foot.bar-height, align(horizon, text(
      top-edge: "bounds",
      bottom-edge: "bounds",
      caption-label,
    ))))
    #if rule-right > rule-left {
      place(top + left, dx: rule-left, dy: bar-top + (foot.bar-height - foot.rule-height) / 2, fading-rule(
        rule-right - rule-left,
        palette.paper,
        height: foot.rule-height,
      ))
    }
    #place(top + right, dx: -inset.right, dy: bar-top, block(width: folio-width, height: foot.bar-height, align(
      right + horizon,
      text(size: folio-size, top-edge: "bounds", bottom-edge: "bounds", if folio == none {
        [Trang #number/#total]
      } else { folio }),
    )))
  ]
})
