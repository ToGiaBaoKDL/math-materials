#import "/templates/lesson.typ": lesson,lesson-heading
#import "content/questions.typ": questions
#import "/templates/components.typ": end-mark
#import "/templates/lesson-branding.typ": lesson-red-header
#let variant=sys.inputs.at("variant",default:"de")
#show: lesson.with([BUỔI 11: MỘT SỐ BÀI TOÁN THỰC TẾ OXYZ ĐIỂN HÌNH],variant:variant,header-content:lesson-red-header(),
 heading-content:lesson-heading([KHOÁ TINH HOA TOÀN DIỆN 9+ 2027],
 [BUỔI 11: MỘT SỐ BÀI TOÁN\ THỰC TẾ OXYZ ĐIỂN HÌNH],
 subtitle:[CHUYÊN ĐỀ: HỆ TRỤC TỌA ĐỘ VÀ VECTOR TRONG KHÔNG GIAN]))
#questions(variant)
#if variant != "de-cach" {v(1fr);end-mark([])}
