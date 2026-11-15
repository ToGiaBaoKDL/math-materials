#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/components.typ": end-mark
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#show:lesson.with([BUỔI 28: KHOẢNG CÁCH TỪ MỘT ĐIỂM ĐẾN MẶT PHẲNG],variant:variant,
 heading-content:lesson-heading([KHÓA TINH HOA TOÀN DIỆN 9+ 2027],
 ("BUỔI 28: KHOẢNG CÁCH TỪ MỘT ĐIỂM","ĐẾN MẶT PHẲNG – PHƯƠNG PHÁP ĐỔI ĐIỂM"),title-size:27pt,title-tracking:0.2pt,
 subtitle:[CHUYÊN ĐỀ: HÌNH HỌC KHÔNG GIAN THUẦN TÚY]))
#set text(size:14pt)
#set par(leading:1em,spacing:3mm,justify:true)
#show math.equation.where(block:true): set block(above:2mm,below:2mm)
#questions(variant)
#end-mark([],note-gap:0pt,above:6mm)
