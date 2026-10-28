#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/components.typ": end-mark
#import "content/questions.typ": questions
#let variant = sys.inputs.at("variant", default: "de")
#show: lesson.with([BUỔI 18: PHƯƠNG PHÁP TÂM TỶ CỰ GIẢI MIN – MAX OXYZ],variant:variant,
  heading-content: lesson-heading([KHÓA TINH HOA TOÀN DIỆN 9+ 2027],
    [BUỔI 18: PHƯƠNG PHÁP TÂM TỶ CỰ\ GIẢI MIN – MAX OXYZ],
    subtitle:[CHUYÊN ĐỀ: HÌNH TỌA ĐỘ OXYZ]))
#set text(size:14pt)
#set par(leading:0.75em,spacing:3mm,justify:false)
#questions(variant)
#if variant != "de-cach" { v(1fr) }
#end-mark([])
