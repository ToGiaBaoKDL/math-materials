#import "/templates/lesson.typ": lesson, lesson-heading
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#show: lesson.with([12 CÂU ÔN TẬP GIỮA KÌ I – TOÁN THỰC TẾ HÀM SỐ],variant:variant,
 heading-content:lesson-heading([KHÓA TINH HOA TOÀN DIỆN 9+ 2027],
 [TOÁN THỰC TẾ HÀM SỐ],subtitle:[12 CÂU ÔN TẬP GIỮA KÌ I – TOÁN 12]))
#questions(variant)
