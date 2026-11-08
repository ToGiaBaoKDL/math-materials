#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/components.typ": end-mark
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#show: lesson.with([BUỔI 24: ỨNG DỤNG TÍCH PHÂN TÍNH THỂ TÍCH], variant:variant,
 heading-content:lesson-heading([KHÓA TINH HOA TOÀN DIỆN 9+ 2027],
 "BUỔI 24: ỨNG DỤNG TÍCH PHÂN TÍNH THỂ TÍCH", title-stretch:true,
 subtitle:[CHUYÊN ĐỀ: NGUYÊN HÀM – TÍCH PHÂN – ỨNG DỤNG]))
#set text(size:14pt)
#set par(leading:0.92em,spacing:2.5mm,justify:true)
#questions(variant)
#end-mark([],note-gap:0pt,above:6mm)
