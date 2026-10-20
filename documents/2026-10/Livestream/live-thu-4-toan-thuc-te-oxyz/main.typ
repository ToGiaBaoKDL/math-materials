#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/theme.typ": palette, lesson-style
#import "/templates/contacts.typ": contact-links
#import "content/questions.typ": questions
#let variant = sys.inputs.at("variant", default: "de")
#show: lesson.with([10 CÂU TOÁN THỰC TẾ OXYZ GIỮA KỲ I], variant: variant, branding: lesson-style.branding + (
  footer: contact-links(color: white, tracking: 0.35pt, text-offset: 0.4mm),
), heading-content: lesson-heading(
  [ÔN THI GIỮA HK1 TOÁN 12],
  [TỦ SÂU TOÁN THỰC TẾ OXYZ | ĐỀ CHỌN LỌC CÁC TRƯỜNG],
  title-tracking: 0.9pt,
  title-size: 25.8pt,
  course-size: 21pt,
  title-stroke: 0.1pt + palette.heading,
  border: 0.8pt + palette.heading,
))
#set par(leading: 1.05em)
#questions(variant)
