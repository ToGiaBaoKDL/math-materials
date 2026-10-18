#import "/templates/lesson.typ": lesson, lesson-heading
#import "content/questions.typ": questions
#import "/templates/theme.typ": palette
#let variant=sys.inputs.at("variant",default:"de")
#show: lesson.with([12 CÂU ÔN TẬP GIỮA KÌ I – TOÁN THỰC TẾ HÀM SỐ],variant:variant,
 heading-content:lesson-heading(none,
 [TOÁN THỰC TẾ CHUYÊN ĐỀ HÀM SỐ #linebreak() (12 CÂU HỎI TỦ SÂU GIỮA KÌ 1 TOÁN 12)], border: 0.8pt + palette.heading))
#questions(variant)
