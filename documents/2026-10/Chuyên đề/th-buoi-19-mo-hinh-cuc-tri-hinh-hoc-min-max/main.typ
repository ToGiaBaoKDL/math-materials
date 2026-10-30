#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/components.typ": end-mark
#import "content/questions.typ": questions
#let variant = sys.inputs.at("variant", default: "de")
#show: lesson.with([BUỔI 19: CÁC MÔ HÌNH CỰC TRỊ HÌNH HỌC GIẢI BÀI TOÁN MIN – MAX],variant:variant,
  heading-content: lesson-heading([KHÓA TINH HOA TOÀN DIỆN 9+ 2027],
    [BUỔI 19: CÁC MÔ HÌNH CỰC TRỊ HÌNH HỌC\ GIẢI BÀI TOÁN MIN – MAX],
    subtitle:[CHUYÊN ĐỀ: HÌNH TỌA ĐỘ OXYZ]))
#set text(size:14pt)
#set par(leading:0.75em,spacing:3mm,justify:true)
#questions(variant)
#if variant == "de-cach" {
  import "/templates/writing.typ": final-writing-space
  final-writing-space(gap:9mm)
} else { v(1fr) }
#end-mark([],note-gap:0pt)
