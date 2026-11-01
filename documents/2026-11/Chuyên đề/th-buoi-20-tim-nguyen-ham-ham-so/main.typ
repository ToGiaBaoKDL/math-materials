#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/components.typ": end-mark
#import "/templates/writing.typ": final-writing-space
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#show: lesson.with([BUỔI 20: TÌM NGUYÊN HÀM CỦA HÀM SỐ],variant:variant,
 heading-content:lesson-heading([KHÓA TINH HOA TOÀN DIỆN 9+ 2027],
 [BUỔI 20: TÌM NGUYÊN HÀM CỦA HÀM SỐ],
 subtitle:[CHUYÊN ĐỀ: NGUYÊN HÀM – TÍCH PHÂN – ỨNG DỤNG]))
#set text(size:14pt)
#set par(leading:if variant=="de" {0.82em}else{0.92em},spacing:3.5mm,justify:true)
#questions(variant)
#if variant=="de-cach" {final-writing-space(gap:9mm)}
#end-mark([],note-gap:0pt,above:6mm)
