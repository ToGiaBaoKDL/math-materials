#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/theme.typ": palette
#import "content/questions.typ": questions
#let variant = sys.inputs.at("variant", default: "de")
#show: lesson.with([10 CÂU TOÁN THỰC TẾ OXYZ GIỮA KỲ I], variant: variant, heading-content: lesson-heading(
  [ÔN THI GIỮA HK1 TOÁN 12],
  [TỦ SÂU TOÁN THỰC TẾ OXYZ | ĐỀ CHỌN LỌC CÁC TRƯỜNG],
  border: 0.8pt + palette.heading,
))
#set par(leading: 1.05em)
#questions(variant)
