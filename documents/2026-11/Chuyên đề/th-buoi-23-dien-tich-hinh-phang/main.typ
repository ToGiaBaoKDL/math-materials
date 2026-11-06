#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/components.typ": end-mark
#import "/templates/writing.typ": final-writing-space
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#show: lesson.with([BUỔI 23: DIỆN TÍCH HÌNH PHẲNG],variant:variant,
 heading-content:lesson-heading([KHÓA TINH HOA TOÀN DIỆN 9+ 2027],
 "BUỔI 23: ỨNG DỤNG TÍCH PHÂN TÍNH DIỆN TÍCH HÌNH PHẲNG",title-stretch:true,
 subtitle:[CHUYÊN ĐỀ: NGUYÊN HÀM – TÍCH PHÂN – ỨNG DỤNG]))
#set text(size:14pt)
#set par(leading:0.88em,spacing:3.5mm,justify:true)
#questions(variant)
#if variant=="de-cach" {final-writing-space(gap:9mm)}
#end-mark([],note-gap:0pt,above:6mm)
