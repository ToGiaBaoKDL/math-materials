#import "/templates/lesson.typ": lesson,lesson-heading
#import "/templates/components.typ": end-mark
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#show:lesson.with([BUỔI 25: GÓC TRONG KHÔNG GIAN],variant:variant,
 heading-content:lesson-heading([KHÓA TINH HOA TOÀN DIỆN 9+ 2027],
 ("BUỔI 25: GÓC GIỮA HAI ĐƯỜNG THẲNG CHÉO NHAU",
 "GÓC GIỮA ĐƯỜNG THẲNG VÀ MẶT PHẲNG"),title-size:29pt,title-stretch:true,
 subtitle:[CHUYÊN ĐỀ: HÌNH HỌC KHÔNG GIAN THUẦN TÚY]))
#set text(size:14pt)
#set par(leading:1.08em,spacing:3mm,justify:true)
#questions(variant)
#end-mark([],note-gap:0pt,above:4mm)
