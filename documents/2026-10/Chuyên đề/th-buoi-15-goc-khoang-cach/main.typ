#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/components.typ": end-mark
#import "content/questions.typ": questions
#let variant = sys.inputs.at("variant", default: "de")
#show: lesson.with(
  [BUỔI 15: GÓC – KHOẢNG CÁCH],
  variant: variant,
  heading-content: lesson-heading(
    [KHOÁ TINH HOA TOÀN DIỆN 9+ 2027],
    [BUỔI 15: GÓC – KHOẢNG CÁCH],
    subtitle: [CHUYÊN ĐỀ: HÌNH TỌA ĐỘ OXYZ],
  ),
)
#questions(variant)
#if variant != "de-cach" {
  v(1fr)
  end-mark([])
}
