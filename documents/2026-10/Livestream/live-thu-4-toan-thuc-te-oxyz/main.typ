#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/theme.typ": palette
#import "content/questions.typ": questions
#let variant = sys.inputs.at("variant", default: "de")
#show: lesson.with([10 CÂU TOÁN THỰC TẾ OXYZ GIỮA KỲ I], variant: variant, heading-content: lesson-heading(
  [TOÁN THỰC TẾ OXYZ – LIVE THỨ 4],
  [10 CÂU TOÁN THỰC TẾ OXYZ GIỮA KỲ 1],
  subtitle: [CHỌN LỌC TỪ ĐỀ THI CHÍNH THỨC CÁC TRƯỜNG (CÓ PHÂN DẠNG)],
  border: 0.8pt + palette.heading,
))
#set par(leading: 1.05em)
#questions(variant)
