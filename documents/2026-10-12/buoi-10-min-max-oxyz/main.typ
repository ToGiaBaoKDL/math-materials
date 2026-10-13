#import "/templates/lesson.typ": lesson, lesson-heading
#import "content/bai-hoc.typ": bai-hoc
#import "content/tu-luyen.typ": tu-luyen
#import "/templates/components.typ": end-mark
#import "/templates/theme.typ": rhythm

#let variant = sys.inputs.at("variant", default: "de")
#show: lesson.with([BUỔI 10: MIN – MAX OXYZ], variant: variant,
  heading-content: lesson-heading(
    [KHOÁ TINH HOA TOÀN DIỆN 9+ 2027], [BUỔI 10: MIN – MAX OXYZ],
    subtitle: [CHUYÊN ĐỀ: HỆ TRỤC TỌA ĐỘ VÀ VECTOR TRONG KHÔNG GIAN],
  ))

#bai-hoc(variant)
#tu-luyen(variant)
#if variant != "de-cach" {
  v(rhythm.question)
  end-mark([])
}
