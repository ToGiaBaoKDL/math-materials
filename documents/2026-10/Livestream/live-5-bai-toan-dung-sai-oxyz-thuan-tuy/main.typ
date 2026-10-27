#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/theme.typ": lesson-style, palette
#import "/templates/contacts.typ": contact-links
#import "content/questions.typ": questions
#let variant = sys.inputs.at("variant", default: "de")
#show: lesson.with(
  [5 BÀI TOÁN ĐÚNG – SAI OXYZ THUẦN TÚY],
  variant: variant,
  branding: lesson-style.branding + (footer: contact-links(color: white, tracking: 0.35pt, text-offset: 0.4mm)),
  heading-content: lesson-heading(
    [ÔN THI GIỮA HK1 TOÁN 12],
    [5 BÀI TOÁN ĐÚNG – SAI OXYZ THUẦN TÚY],
    subtitle: [TỦ SÂU ĐỀ THI GK1 TOÁN 12 | CHỌN LỌC ĐỀ CHÍNH THỨC TRƯỜNG SỞ],
    horizontal-inset: 3mm,
    title-size: 25.8pt,
    course-size: 21pt,
    border: 0.8pt + palette.heading,
  ),
)
#set text(size: 14pt)
#set par(leading: 0.6em, spacing: 2.5mm, justify: false)
#questions(variant)
