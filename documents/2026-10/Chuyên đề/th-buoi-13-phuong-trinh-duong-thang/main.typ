#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/components.typ": end-mark
#import "content/theory.typ": theory
#import "content/questions.typ": questions

#let variant = sys.inputs.at("variant", default: "de")
#show: lesson.with(
  [BUỔI 13: CÁC CÁCH VIẾT PHƯƠNG TRÌNH ĐƯỜNG THẲNG],
  variant: variant,
  heading-content: lesson-heading(
    [KHOÁ TINH HOA TOÀN DIỆN 9+ 2027],
    [BUỔI 13: CÁC CÁCH VIẾT\ PHƯƠNG TRÌNH ĐƯỜNG THẲNG],
    subtitle: [CHUYÊN ĐỀ: HÌNH TỌA ĐỘ OXYZ],
  ),
)
#theory()
#questions(variant)
#if variant != "de-cach" {
  v(1fr)
  end-mark([])
}
