#import "/templates/lesson.typ": lesson, lesson-heading
#import "content/questions.typ": questions
#import "/templates/theme.typ": palette
#let variant=sys.inputs.at("variant",default:"de")
#show: lesson.with([12 CÂU HỎI TỦ SÂU GIỮA KỲ I TOÁN 12],variant:variant,
 heading-content:lesson-heading([TOÁN THỰC TẾ CHUYÊN ĐỀ HÀM SỐ],
 [12 CÂU HỎI TỦ SÂU GIỮA KỲ I TOÁN 12], border: 0.8pt + palette.heading))
#questions(variant)
