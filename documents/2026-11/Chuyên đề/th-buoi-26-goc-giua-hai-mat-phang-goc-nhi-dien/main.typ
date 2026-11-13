#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/components.typ": end-mark
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#show:lesson.with([BUỔI 26: GÓC GIỮA HAI MẶT PHẲNG – GÓC NHỊ DIỆN],variant:variant,
 heading-content:lesson-heading([KHÓA TINH HOA TOÀN DIỆN 9+ 2027],
 ("BUỔI 26: GÓC GIỮA HAI MẶT PHẲNG","GÓC NHỊ DIỆN"),title-size:29pt,title-tracking:0.2pt,
 subtitle:[CHUYÊN ĐỀ: HÌNH HỌC KHÔNG GIAN THUẦN TÚY]))
#set text(size:14pt)
#set par(leading:1.08em,spacing:3mm,justify:true)
#show math.equation.where(block:true): set block(above:2mm,below:2mm)
#questions(variant)
#end-mark([],note-gap:0pt,above:6mm)
