#import "/templates/lesson.typ": exercise, lesson-section
#import "../layout.typ": formula-table, subparts, formula-grid
#import "solutions.typ": solutions
#let questions(variant)={
 let base=exercise.with(solution-leading:1.02em,solution-title-above:4mm,solution-title-below:3mm,answer-row-gap:if variant=="dap-an" {2.5mm}else{none},writing-heading-gap:0mm,variant:variant,question-gap:if variant=="de" {4.5mm}else{5mm},keep-together:true,flow-stem:true,keep-solution-start:false,writing-line-gap:9mm,writing-single-page:false,fill-writing-page:true,writing-fill-page-end:true)
 let item(..args)={
  if variant=="dap-an" {set par(leading:0.78em); base(..args)} else {base(..args)}
 }
[
#lesson-section([LÝ THUYẾT CẦN NHỚ],badge:"I")
#block(sticky:true,above:3mm)[*Một nguyên hàm: $F lr(( x ))$ được gọi là một nguyên hàm của $f lr(( x ))$ trên $K$ $⇔ F ' lr(( x )) = f lr(( x )) ";" ∀ x ∈ K$*]
Ví dụ:

•  $x ^(2)$ là nguyên hàm của $2 x$ trên $RR$ vì $lr(( x ^(2) )) ' = 2 x ";" ∀ x ∈ RR$

•  $F lr(( x )) = sin x$ là một nguyên hàm của $f lr(( x )) = cos x$ trên $RR$ vì $lr(( sin x )) ' = cos x$.

#block(sticky:true,above:3mm)[*Họ nguyên hàm:*]
Nếu $F lr(( x ))$ là một nguyên hàm của $f lr(( x )) ⇒$ $F lr(( x )) + C$ được gọi là một họ nguyên hàm của $f lr(( x ))$.

Kí hiệu: $integral f lr(( x )) dif x = F lr(( x )) + C$ $lr(( C ∈ RR ))$

#block(sticky:true,above:3mm)[*Các tính chất về Nguyên hàm*]
• $integral f ' lr(( x )) dif x = f lr(( x )) + C$

• $integral k . f lr(( x )) dif x = k integral f lr(( x )) dif x lr(( k ≠ 0 ))$

•  $integral lr([ f lr(( x )) + g lr(( x )) ]) dif x = integral f lr(( x )) dif x + integral g lr(( x )) dif x$

•  $integral lr([ f lr(( x )) - g lr(( x )) ]) dif x = integral f lr(( x )) dif x - integral g lr(( x )) dif x$

#block(sticky:true,above:3mm)[*Bảng công thức nguyên hàm cần nhớ*]
#formula-table(
 [Nguyên hàm],
 [Nguyên hàm mở rộng (đọc thêm)],
 [$integral 1 dif x = x + C$],
 [],
 [$integral x ^(α) dif x = frac(x ^(α + 1), α + 1) + C "," α ≠ - 1$],
 [$integral lr(( a x + b )) ^(α) dif x = frac(1, a) ⋅ frac(lr(( a x + b )) ^(α + 1), α + 1) + C "," α ≠ - 1$],
 [$integral frac(1, x ^(2)) dif x = - frac(1, x) + C$],
 [$integral frac(dif x, ( a x + b ) ^(2)) = - frac(1, a) ⋅ frac(1, a x + b) + C$],
 [$integral frac(1, sqrt(x)) dif x = 2 sqrt(x) + C$],
 [$integral frac(1, sqrt(a x + b)) dif x = frac(2, a) sqrt(a x + b) + C$],
 [$integral frac(1, x) dif x = ln abs(x) + C$],
 [$integral frac(1, a x + b) dif x = frac(1, a) . ln abs(a x + b) + C$],
 [$integral a ^(x) dif x = frac(a ^(x), ln a) + C$],
 [$integral a ^(m x + n) dif x = frac(1, m) ⋅ frac(a ^(m x + n), ln a) + C$],
 [$integral e ^(x) dif x = e ^(x) + C$],
 [$integral e ^(a x + b) dif x = frac(1, a) e ^(a x + b) + C$],
 [$integral cos x dif x = sin x + C$],
 [$integral cos lr(( a x + b )) dif x = frac(1, a) . sin lr(( a x + b )) + C$],
 [$integral sin x dif x = - cos x + C$],
 [$integral sin lr(( a x + b )) dif x = - frac(1, a) cos lr(( a x + b )) + C$],
 [$integral frac(1, cos ^(2) x) dif x = tan x + C$],
 [$integral frac(1, cos ^(2) lr(( a x + b ))) dif x = frac(1, a) tan lr(( a x + b )) + C$],
 [$integral frac(1, sin ^(2) x) dif x = - cot x + C$],
 [$integral frac(1, sin ^(2) lr(( a x + b ))) dif x = - frac(1, a) cot lr(( a x + b )) + C$],
)

#lesson-section([BÀI TẬP TỰ LUẬN],badge:"II")
#lesson-section([Tìm nguyên hàm hàm số lũy thừa],number:1)
#formula-table(
 [Nguyên hàm],
 [Nguyên hàm mở rộng (đọc thêm)],
 [$integral 1 dif x = x + C$],
 [],
 [$integral x ^(α) dif x = frac(x ^(α + 1), α + 1) + C "," α ≠ - 1$],
 [$integral lr(( a x + b )) ^(α) dif x = frac(1, a) ⋅ frac(lr(( a x + b )) ^(α + 1), α + 1) + C "," α ≠ - 1$],
 [$integral frac(1, x ^(2)) dif x = - frac(1, x) + C$],
 [$integral frac(dif x, ( a x + b ) ^(2)) = - frac(1, a) ⋅ frac(1, a x + b) + C$],
 [$integral frac(1, sqrt(x)) dif x = 2 sqrt(x) + C$],
 [$integral frac(1, sqrt(a x + b)) dif x = frac(2, a) sqrt(a x + b) + C$],
 [$integral frac(1, x) dif x = ln abs(x) + C$],
 [$integral frac(1, a x + b) dif x = frac(1, a) . ln abs(a x + b) + C$],
)

#block(sticky:true,above:3mm)[*Chú ý: Công thức lũy thừa*]
#formula-grid(columns:4,[$a ^(α) a ^(β) = a ^(α + β)$],[$frac(a ^(α), a ^(β)) = a ^(α - β)$],[$lr(( a ^(α) )) ^(β) = a ^(α . β)$],[$lr(( a b )) ^(α) = a ^(α) b ^(α)$],[$lr(( frac(a, b) )) ^(α) = frac(a ^(α), b ^(α))$],[$root(n, x ^(m)) = x ^(frac(m, n))$],[$x ^(- n) = frac(1, x ^(n))$])
#item("1",[Tìm họ nguyên hàm của hàm số $f lr(( x ))$, biết:
#subparts([a) $f lr(( x )) = x ^(2)$],[b) $f lr(( x )) = x ^(4) + x ^(- 3)$],[c) $f lr(( x )) = x ^(2) + frac(3, x)$],[d) $f lr(( x )) = frac(1, x) - frac(1, x ^(2))$],[e) $f lr(( x )) = x ^(2) + frac(3, x) - 2 sqrt(x)$],[f) $f lr(( x )) = 3 sqrt(x) + frac(1, root(3, x))$])],answers:(),writing-lines:5,source-id:"bai-hoc-1",solution:solutions.at("bai-hoc-1"))
#item("2",[Tìm nguyên hàm của hàm số $f lr(( x ))$, biết:
#subparts([a) $f lr(( x )) = 2 x lr(( 1 + 3 x ^(3) ))$],[b) $f lr(( x )) = lr(( 3 x - 2 )) ^(2)$],[c) $f lr(( x )) = frac(2 x ^(4) + 3, x ^(2))$])],answers:(),writing-lines:6,source-id:"bai-hoc-2",solution:solutions.at("bai-hoc-2"))
#item("3",[Biết $F lr(( x ))$ là một nguyên hàm của hàm số $f lr(( x )) = frac(1 + 2 x ^(2), x)$ thỏa mãn $F lr(( - 1 )) = 3$. Tìm $F lr(( x ))$.],answers:(),writing-lines:6,source-id:"bai-hoc-3",solution:solutions.at("bai-hoc-3"))
#item("4",[Cho hàm số $y = f lr(( x ))$ có đạo hàm là $f' lr(( x )) = 6 x ^(2) - 2 "," ∀ x ∈ RR$ và $f lr(( 0 )) = 1$. Biết $F lr(( x ))$ là một nguyên hàm của $f lr(( x ))$ và $F lr(( 2 )) = 0$. Tính $F lr(( 4 ))$.],answers:(),writing-lines:6,source-id:"bai-hoc-4",solution:solutions.at("bai-hoc-4"))
#lesson-section([Tìm nguyên hàm hàm số lượng giác],number:2)
#formula-table(
 [Nguyên hàm],
 [Nguyên hàm mở rộng (đọc thêm)],
 [$integral cos x dif x = sin x + C$],
 [$integral cos lr(( a x + b )) dif x = frac(1, a) . sin lr(( a x + b )) + C$],
 [$integral sin x dif x = - cos x + C$],
 [$integral sin lr(( a x + b )) dif x = - frac(1, a) cos lr(( a x + b )) + C$],
 [$integral frac(1, cos ^(2) x) dif x = tan x + C$],
 [$integral frac(1, cos ^(2) lr(( a x + b ))) dif x = frac(1, a) tan lr(( a x + b )) + C$],
 [$integral frac(1, sin ^(2) x) dif x = - cot x + C$],
 [$integral frac(1, sin ^(2) lr(( a x + b ))) dif x = - frac(1, a) cot lr(( a x + b )) + C$],
)

#block(sticky:true,above:3mm)[*Chú ý các công thức biến đổi lượng giác:*]
#formula-grid(columns:2,[$⊕ quad sin ^(2) x + cos ^(2) x = 1$],[$⊕ quad tan ^(2) x = frac(1, cos ^(2) x) - 1$],[$⊕ quad cot ^(2) x = frac(1, sin ^(2) x) - 1$],[$⊕ quad sin ^(2) x = frac(1 - cos 2 x, 2)$],[$⊕ quad sin 2 x = 2 sin x . cos x$],[$⊕ quad cos 2 x = cos ^(2) x - sin ^(2) x$],[$⊕ quad cos ^(2) x = frac(1 + cos 2 x, 2)$],[$⊕ quad cos 2 x = 2 cos ^(2) x - 1 = 1 - 2 sin ^(2) x$])
#item("5",[Nguyên hàm của các hàm số
#subparts([a) $f lr(( x )) = 1 + sin x$],[b) $f lr(( x )) = 2 sin x + 3 x$],[c) $f lr(( x )) = cos ^(2) frac(x, 2)$],[d) $f lr(( x )) = 1 - frac(1, cos ^(2) x)$])],answers:(),writing-lines:6,source-id:"bai-hoc-5",solution:solutions.at("bai-hoc-5"))
#item("6",[Nguyên hàm của các hàm số
#subparts([a) $integral lr(( sin frac(x, 2) - cos frac(x, 2) )) ^(2) dif x$],[b) $integral lr(( x + tan ^(2) x )) dif x$])],answers:(),writing-lines:4,source-id:"bai-hoc-6",solution:solutions.at("bai-hoc-6"))
#lesson-section([Tìm nguyên hàm hàm số mũ],number:3)
#formula-table(
 [Nguyên hàm],
 [Nguyên hàm mở rộng (đọc thêm)],
 [$integral a ^(x) dif x = frac(a ^(x), ln a) + C$],
 [$integral a ^(m x + n) dif x = frac(1, m) ⋅ frac(a ^(m x + n), ln a) + C$],
 [$integral e ^(x) dif x = e ^(x) + C$],
 [$integral e ^(a x + b) dif x = frac(1, a) e ^(a x + b) + C$],
)

#item("7",[Tìm họ nguyên hàm của các hàm số sau, biết:
#subparts([a) $y = 2 ^(x)$],[b) $y = frac(1, 3 ^(x))$],[c) $y = lr(( 2 "e" ^(x) - 5 ^(x) ))$],[d) $y = frac(1, "e" ^(x))$],[e) $y = lr(( 2 . 3 ^(x) - frac(1, 3) . 7 ^(x) ))$],[f) $y = 2 ^(3 x) . 3 ^(2 x)$],[g) $y = frac(2 ^(x + 1) - 5 ^(x - 1), 10 ^(x))$],[h) $y = "e" ^(x) lr(( 2017 - frac(2018 "e" ^(- x), x ^(5)) ))$])],answers:(),writing-lines:14,source-id:"bai-hoc-7",solution:solutions.at("bai-hoc-7"))
#lesson-section([BÀI TẬP TRẮC NGHIỆM PHẢN XẠ],badge:"III")
#item("8",[Cho hàm số $f lr(( x )) = x - frac(1, sqrt(x))$. Trong các hàm số dưới đây, hàm số nào là một nguyên hàm của $f lr(( x ))$ trên $lr(( 0 ";" + infinity ))$?],answers:([$F _(1) lr(( x )) = frac(x ^(2), 2) + sqrt(x)$.],[$F _(2) lr(( x )) = frac(x ^(2), 2) - sqrt(x)$.],[$F _(3) lr(( x )) = frac(x ^(2), 2) + 2 sqrt(x)$.],[$F _(4) lr(( x )) = frac(x ^(2), 2) - 2 sqrt(x)$.],),writing-lines:3,source-id:"bai-hoc-8",solution:solutions.at("bai-hoc-8"))
#item("9",[Cho hàm số $f lr(( x )) = 3 + frac(1, x)$. Trong các hàm số dưới đây, hàm số nào là một nguyên hàm của $f lr(( x ))$ trên $lr(( 0 ";" + infinity ))$?],answers:([$F _(1) lr(( x )) = 3 x - frac(1, x ^(2))$.],[$F _(2) lr(( x )) = 3 x + ln x$.],[$F _(3) lr(( x )) = 3 x + frac(1, x ^(2))$.],[$F _(4) lr(( x )) = 3 x - ln x$.],),writing-lines:3,source-id:"bai-hoc-9",solution:solutions.at("bai-hoc-9"))
#item("10",[Họ tất cả các nguyên hàm của hàm số $f lr(( x )) = 2 x + 4$ là],answers:([$2 x ^(2) + 4 x + C$.],[$x ^(2) + 4 x + C$.],[$x ^(2) + C$.],[$2 x ^(2) + C$.],),writing-lines:3,source-id:"bai-hoc-10",solution:solutions.at("bai-hoc-10"))
#item("11",[Họ tất cả các nguyên hàm của hàm số $f lr(( x )) = 5 x ^(4) - 8 x ^(3) - 6 x$ là],answers:([$F lr(( x )) = x ^(5) - 2 x ^(4) - 3 x ^(2) + C .$],[$F lr(( x )) = x ^(5) - x ^(4) - x ^(2) + C .$],[$F lr(( x )) = x ^(5) - 4 x ^(4) - 2 x ^(2) + C .$],[$F lr(( x )) = x ^(5) + 2 x ^(4) - 3 x ^(2) + C .$],),writing-lines:3,source-id:"bai-hoc-11",solution:solutions.at("bai-hoc-11"))
#item("12",[Khẳng định nào đây sai?],answers:([$integral sin x dif x = - cos x + C$.],[$integral cos x dif x = - sin x + C$.],[$integral cos x dif x = sin x + C$.],[$integral frac(1,sin^2 x) dif x = - cot x + C$.],),writing-lines:3,source-id:"bai-hoc-12",solution:solutions.at("bai-hoc-12"))
#item("13",[Họ nguyên hàm của hàm số $f lr(( x )) = 3 x ^(2) + sin x$ là],answers:([$x ^(3) - cos x + C$.],[$6 x - cos x + C$.],[$x ^(3) + C$.],[$x ^(3) + sin x + C$.],),writing-lines:3,source-id:"bai-hoc-13",solution:solutions.at("bai-hoc-13"))
#item("14",[Cho hàm số $f lr(( x ))$ thỏa mãn $f' lr(( x )) = 3 - 5 cos x$ và $f lr(( 0 )) = 5$. Mệnh đề nào dưới đây đúng?],answers:([$f lr(( x )) = 3 x - 5 sin x - 5$.],[$f lr(( x )) = 3 x + 5 sin x + 5$.],[$f lr(( x )) = 3 x + 5 sin x + 2$.],[$f lr(( x )) = 3 x - 5 sin x + 5$.],),writing-lines:3,source-id:"bai-hoc-14",solution:solutions.at("bai-hoc-14"))
#item("15",[Nguyên hàm của hàm số $f lr(( x )) = 2 cos ^(2) frac(x, 2)$ là:],answers:([$4 cos frac(x, 2) + C$.],[$x + sin x + C$.],[$2 sin ^(2) frac(x, 2) + C$.],[$frac(2, 3) cos ^(3) frac(x, 2) + C$.],),writing-lines:3,source-id:"bai-hoc-15",solution:solutions.at("bai-hoc-15"))
#item("16",[Nguyên hàm của hàm số có $f lr(( x )) = tan ^(2) x + cot ^(2) x$ là:],answers:([$2 tan x + 2 cot x + C$.],[$frac(1, 3) tan ^(3) x + frac(1, 3) cot ^(3) x + C$.],[$tan x + cot x - 2 x + C$.],[$tan x - cot x - 2 x + C$.],),writing-lines:3,source-id:"bai-hoc-16",solution:solutions.at("bai-hoc-16"))
#item("17",[Cho hàm số $f lr(( x )) = 3 ^(x) + 2 x$. Khẳng định nào dưới đây đúng],answers:([$integral f lr(( x )) dif x = frac(3 ^(x), ln 3) + 2 + C$.],[$integral f lr(( x )) dif x = frac(3 ^(x), ln 3) + x ^(2) + C$.],[$integral f lr(( x )) dif x = 3 ^(x) . ln 3 + 2 + C$.],[$integral f lr(( x )) dif x = 3 ^(x) . ln 3 + x ^(2) + C$.],),writing-lines:3,source-id:"bai-hoc-17",solution:solutions.at("bai-hoc-17"))
#item("18",[Hàm số $F lr(( x )) = frac(x ^(3), 3) + e ^(x)$ là một nguyên hàm của hàm số $f lr(( x ))$ nào sau đây?],answers:([$f lr(( x )) = frac(x ^(4), 3) + e ^(x)$.],[$f lr(( x )) = 3 x ^(2) + e ^(x)$.],[$f lr(( x )) = frac(x ^(4), 12) + e ^(x)$.],[$f lr(( x )) = x ^(2) + e ^(x)$.],),writing-lines:3,source-id:"bai-hoc-18",answer-columns:if variant=="de" {4}else{auto},answer-column-gap:if variant=="de" {2.5mm}else{none},solution:solutions.at("bai-hoc-18"))
#item("19",[Cho hàm số $y = f lr(( x ))$ có đạo hàm là $f' lr(( x )) = e ^(x) + 2 x + 1 "," ∀ x ∈ RR$ và $f lr(( 0 )) = 1$. Biết $F lr(( x ))$ là nguyên hàm của $f lr(( x ))$ thỏa mãn $F lr(( 1 )) = e$. Tính $F lr(( 0 ))$.],answers:([$frac(5, 6)$.],[$- frac(1, 6)$.],[$frac(1, 6)$.],[$- frac(5, 6)$.],),writing-lines:3,source-id:"bai-hoc-19",solution:solutions.at("bai-hoc-19"))
#item("20",[Cho hàm số $F ( x ) = ( a x ^(2) + b x + c ) e ^(- 2 x)$ là một nguyên hàm của hàm số $f ( x ) = - ( 2 x ^(2) - 8 x + 7 ) e ^(- 2 x)$. Tính tổng $a + b + c$.],answers:([$0$.],[$1$.],[$- 3$.],[$- 1$.],),writing-lines:3,source-id:"bai-hoc-20",solution:solutions.at("bai-hoc-20"))
#lesson-section([BÀI TẬP TỰ LUYỆN],badge:"IV")
#item("1",[Cho hàm số $f lr(( x )) = 3 x ^(2) + 2 x$. Trong các hàm số dưới đây, hàm số nào là một nguyên hàm của $f lr(( x ))$ trên $RR$?],answers:([$F _(1) lr(( x )) = x ^(3) + x ^(2) - 4$.],[$F _(2) lr(( x )) = frac(x ^(3), 3) + frac(x ^(2), 2)$.],[$F _(3) lr(( x )) = x ^(3) - x ^(2) + 1$.],[$F _(4) lr(( x )) = 3 x ^(3) + x ^(2)$.],),writing-lines:3,source-id:"tu-luyen-1",solution:solutions.at("tu-luyen-1"))
#item("2",[Cho hàm số $f lr(( x )) = x - frac(1, sqrt(x))$. Trong các hàm số dưới đây, hàm số nào là một nguyên hàm của $f lr(( x ))$ trên $lr(( 0 ";" + infinity ))$?],answers:([$F _(1) lr(( x )) = frac(x ^(2), 2) + sqrt(x)$.],[$F _(2) lr(( x )) = frac(x ^(2), 2) - sqrt(x)$.],[$F _(3) lr(( x )) = frac(x ^(2), 2) + 2 sqrt(x)$.],[$F _(4) lr(( x )) = frac(x ^(2), 2) - 2 sqrt(x)$.],),writing-lines:3,source-id:"tu-luyen-2",solution:solutions.at("tu-luyen-2"))
#item("3",[Cho hàm số $f lr(( x )) = 3 + frac(1, x)$. Trong các hàm số dưới đây, hàm số nào là một nguyên hàm của $f lr(( x ))$ trên $lr(( 0 ";" + infinity ))$?],answers:([$F _(1) lr(( x )) = 3 x - frac(1, x ^(2))$.],[$F _(2) lr(( x )) = 3 x + ln x$.],[$F _(3) lr(( x )) = 3 x + frac(1, x ^(2))$.],[$F _(4) lr(( x )) = 3 x - ln x$.],),writing-lines:3,source-id:"tu-luyen-3",solution:solutions.at("tu-luyen-3"))
#item("4",[Họ tất cả các nguyên hàm của hàm số $f lr(( x )) = 5 x ^(4) - 8 x ^(3) - 6 x$ là],answers:([$F lr(( x )) = x ^(5) - 2 x ^(4) - 3 x ^(2) + C .$],[$F lr(( x )) = x ^(5) - x ^(4) - x ^(2) + C .$],[$F lr(( x )) = x ^(5) - 4 x ^(4) - 2 x ^(2) + C .$],[$F lr(( x )) = x ^(5) + 2 x ^(4) - 3 x ^(2) + C .$],),writing-lines:3,source-id:"tu-luyen-4",solution:solutions.at("tu-luyen-4"))
#item("5",[Nguyên hàm $F lr(( x ))$ của hàm số $f ( x ) =$ $frac(1, 3) x ^(3) - 2 x ^(2) + x - 2024$ thỏa mãn $F lr(( 1 )) = - 2024$ là],answers:([$frac(1, 12) x ^(4) - frac(2, 3) x ^(3) + frac(1, 2) x ^(2) - 2024 x + frac(5, 12)$.],[$frac(1, 12) x ^(4) - frac(2, 3) x ^(3) + frac(1, 2) x ^(2) - 2024 x - frac(1, 12)$.],[$frac(1, 12) x ^(4) - frac(2, 3) x ^(3) + frac(1, 2) x ^(2) - 2024 x + frac(1, 12)$.],[$frac(1, 12) x ^(4) - frac(2, 3) x ^(3) + frac(1, 2) x ^(2) - 2024 x - frac(5, 12)$.],),writing-lines:3,source-id:"tu-luyen-5",solution:solutions.at("tu-luyen-5"))
#item("6",[Nguyên hàm $F lr(( x ))$ của hàm số $f lr(( x )) = lr(( 2 x - 3 )) ^(2)$ thỏa mãn $F lr(( - 1 )) = - 17$ là],answers:([$frac(lr(( 2 x - 3 )) ^(3), 3) + frac(4, 3)$.],[$frac(4, 3) x ^(3) - 6 x ^(2) + 9 x - frac(2, 3)$.],[$frac(4, 3) x ^(3) - 6 x ^(2) + 9 x + frac(8, 3)$.],[$frac(4, 3) x ^(3) - 6 x ^(2) + 9 x + frac(2, 3)$.],),writing-lines:3,source-id:"tu-luyen-6",solution:solutions.at("tu-luyen-6"))
#item("7",[Tìm nguyên hàm của hàm số $f lr(( x )) = x ^(2) + frac(2, x ^(2))$.],answers:([$integral f lr(( x )) dif x = frac(x ^(3), 3) + frac(1, x) + C$.],[$integral f lr(( x )) dif x = frac(x ^(3), 3) - frac(2, x) + C$.],[$integral f lr(( x )) dif x = frac(x ^(3), 3) - frac(1, x) + C$.],[$integral f lr(( x )) dif x = frac(x ^(3), 3) + frac(2, x) + C$.],),writing-lines:3,source-id:"tu-luyen-7",solution:solutions.at("tu-luyen-7"))
#item("8",[Tìm nguyên hàm của hàm số $integral lr(( x ^(2) + frac(3, x) - 2 sqrt(x) )) dif x$.],answers:([$frac(x ^(3), 3) + 3 ln abs(x) + frac(4, 3) sqrt(x ^(3)) + C$.],[$frac(x ^(3), 3) + 3 ln abs(x) - frac(4, 3) sqrt(x ^(3)) + C$.],[$frac(x ^(3), 3) + 3 ln x - frac(4, 3) sqrt(x ^(3))$.],[$frac(x ^(3), 3) - 3 ln abs(x) - frac(4, 3) sqrt(x ^(3)) + C$.],),writing-lines:3,source-id:"tu-luyen-8",solution:solutions.at("tu-luyen-8"))
#item("9",[Họ nguyên hàm của hàm số $f lr(( x )) = 3 sqrt(x) + x ^(2024)$ là],answers:([$sqrt(x) + frac(x ^(2023), 673) + C$.],[$2 sqrt(x ^(3)) + frac(x ^(2025), 2025) + C$.],[$frac(1, sqrt(x)) + frac(x ^(2024), 2025) + C$.],[$frac(1, 2 sqrt(x)) + 6054 x ^(2025) + C$.],),writing-lines:3,source-id:"tu-luyen-9",solution:solutions.at("tu-luyen-9"))
#item("10",[Cho hàm số $y = F lr(( x ))$ là một nguyên hàm của hàm số $y = x ^(2)$. Tính $F' lr(( 25 ))$.],answers:([25.],[125.],[5.],[625.],),writing-lines:3,source-id:"tu-luyen-10",solution:solutions.at("tu-luyen-10"))
#item("11",[Tìm nguyên hàm của hàm số $f lr(( x )) = x ^(sqrt(5))$.],answers:([$integral f lr(( x )) dif x = frac(1, sqrt(5) - 1) x ^(sqrt(5) - 1) + C$.],[$integral f lr(( x )) dif x = x ^(sqrt(5) + 1) + C$.],[$integral f lr(( x )) dif x = sqrt(5) x ^(sqrt(5) - 1) + C$.],[$integral f lr(( x )) dif x = frac(1, sqrt(5) + 1) x ^(sqrt(5) + 1) + C$.],),writing-lines:3,source-id:"tu-luyen-11",solution:solutions.at("tu-luyen-11"))
#item("12",[Biết $integral lr(( frac(1, 2 x) + x ^(5) )) dif x = a ln abs(x) + b x ^(6) + C$ với $lr(( a "," b ∈ QQ "," C ∈ RR ))$. Tính $a ^(2) + b$?],answers:([$frac(5, 12)$.],[9.],[$frac(7, 13)$.],[$frac(7, 6)$.],),writing-lines:3,source-id:"tu-luyen-12",solution:solutions.at("tu-luyen-12"))
#item("13",[Họ nguyên hàm của hàm số $f lr(( x )) = lr(( x + 1 )) lr(( x + 2 ))$ là],answers:([$2 x + 3 + C$.],[$frac(x ^(3), 3) - frac(2, 3) x ^(2) + 2 x + C$.],[$frac(x ^(3), 3) + frac(2, 3) x ^(2) + 2 x + C$.],[$frac(x ^(3), 3) + frac(3, 2) x ^(2) + 2 x + C$.],),writing-lines:3,source-id:"tu-luyen-13",solution:solutions.at("tu-luyen-13"))
#item("14",[Tìm họ nguyên hàm của hàm số $f lr(( x )) = frac(5 + 2 x ^(4), x ^(2))$.],answers:([$integral f lr(( x )) dif x = frac(2 x ^(3), 3) + frac(5, x) + C$.],[$integral f lr(( x )) dif x = frac(2 x ^(3), 3) - frac(5, x) + C$.],[$integral f lr(( x )) dif x = frac(2 x ^(3), 3) + 5 ln x ^(2) + C$.],[$integral f lr(( x )) dif x = 2 x ^(3) - frac(5, x) + C$.],),writing-lines:3,source-id:"tu-luyen-14",solution:solutions.at("tu-luyen-14"))
#item("15",[Tìm hàm số $y = f lr(( x ))$, biết $f' lr(( x )) = 3 sqrt(x) + frac(2, root(3, x)) "," ( x > 0 )$ và $f lr(( 1 )) = 1$.],answers:([$f lr(( x )) = 2 x sqrt(x) + 3 root(3, x ^(2)) - 4$.],[$f lr(( x )) = 2 x sqrt(x) - 3 root(3, x ^(2)) + 2$.],[$f lr(( x )) = sqrt(x) + 3 root(3, x ^(2)) - 3$.],[$f lr(( x )) = x sqrt(x) + 3 root(3, x) - 3$.],),writing-lines:3,source-id:"tu-luyen-15",solution:solutions.at("tu-luyen-15"))
#item("16",[Gọi $F lr(( x ))$ là một nguyên hàm của hàm số $f lr(( x )) = lr(( 2 x - 3 )) ^(2)$ thỏa $F lr(( 0 )) = frac(1, 3)$. Tính giá trị của biểu thức $T = log _(2) lr([ 3 F lr(( 1 )) - 2 F lr(( 2 )) ])$.],answers:([$T = 10$.],[$T = 4$.],[$T = 2$.],[$T = - 4$.],),writing-lines:3,source-id:"tu-luyen-16",solution:solutions.at("tu-luyen-16"))
#item("17",[Với giá trị thực nào của tham số $m$ để hàm số $F lr(( x )) = m x ^(3) + lr(( 3 m + 2 )) x ^(2) - 4 x + 3$ là một nguyên hàm của hàm số $f lr(( x )) = 3 x ^(2) + 10 x - 4$?],answers:([$m = 0$.],[$m = 1$.],[$m = - 1$.],[$m = 2$.],),writing-lines:3,source-id:"tu-luyen-17",solution:solutions.at("tu-luyen-17"))
#item("18",[Tìm hàm số $y = f lr(( x ))$ biết $f' lr(( x )) = 3 x ^(2) + 2 x - m + 1$, $f lr(( 2 )) = 1$ và đồ thị của hàm số $y = f lr(( x ))$ cắt trục tung tại điểm có tung độ bằng $- 5$.],answers:(),writing-lines:6,source-id:"tu-luyen-18",solution:solutions.at("tu-luyen-18"))
#item("19",[Tìm họ nguyên hàm của hàm số $f lr(( x ))$, biết:
#subparts([a) $f lr(( x )) = frac(x ^(2) + 3 x + 2, x)$],[b) $f lr(( x )) = frac(x ^(2) + 3 x + 1, sqrt(x))$])],answers:(),writing-lines:4,source-id:"tu-luyen-19",solution:solutions.at("tu-luyen-19"))
#item("20",[Tìm
#subparts([a) $integral lr(( 2 sin x - 3 cos x )) dif x$],[b) $integral cos ^(2) frac(x, 2) dif x$],[c) $integral frac(dif x, sin ^(2) x cos ^(2) x)$],[d) $integral lr(( sin x + cos x )) ^(2) dif x$],[e) $integral frac(1, sin ^(2) x) dif x$ trên $lr(( 0 ";" π ))$],[f) $integral 2 sin frac(x, 2) cos frac(x, 2) dif x$])],answers:(),writing-lines:6,source-id:"tu-luyen-20",solution:solutions.at("tu-luyen-20"))
#item("21",[Cho hàm số $f lr(( x ))$ thỏa mãn $f' lr(( x )) = 2 - 5 sin x$ và $f lr(( 0 )) = 10$. Tìm hàm $f lr(( x ))$.],answers:(),writing-lines:6,source-id:"tu-luyen-21",solution:solutions.at("tu-luyen-21"))
#item("22",[Cho $F lr(( x )) = cos 2 x$ là một nguyên hàm của hàm số $f lr(( x )) tan x$. Tìm họ nguyên hàm của hàm số $g lr(( x )) = frac(tan x, f' lr(( x )))$.],answers:(),writing-lines:6,source-id:"tu-luyen-22",solution:solutions.at("tu-luyen-22"))
#item("23",[Một nguyên hàm của hàm số $f lr(( x )) = 2025 ^(x)$ là],answers:([$F lr(( x )) = x . 2025 ^(x - 1)$.],[$F lr(( x )) = 2025 . 2024 ^(x)$.],[$F lr(( x )) = 2025 ^(x) . ln 2025$.],[$F lr(( x )) = frac(2025 ^(x), ln 2025)$.],),writing-lines:3,source-id:"tu-luyen-23",question-gap:if variant=="de" {3mm}else{6mm},solution:solutions.at("tu-luyen-23"))
#item("24",[Cho hàm số $f lr(( x )) = 1 + e ^(x)$. Khẳng định nào dưới đây đúng?],answers:([$integral f lr(( x )) dif x = x + x e ^(x - 1) + C$.],[$integral f lr(( x )) dif x = 1 + e ^(x) + C$.],[$integral f lr(( x )) dif x = x + e ^(x) + C$.],[$integral f lr(( x )) dif x = 1 + x e ^(x - 1) + C$.],),writing-lines:3,source-id:"tu-luyen-24",question-gap:if variant=="de" {3mm}else{6mm},solution:solutions.at("tu-luyen-24"))
#item("25",[Họ tất cả các nguyên hàm của hàm số $f lr(( x )) = 5 ^(2 x - 1)$ là],answers:([$frac(1, 2) . 5 ^(2 x - 1) . ln 5 + C$.],[$2 . 5 ^(2 x - 1) . ln 5 + C$.],[$5 ^(2 x - 1) . ln 5 + C$.],[$frac(1, 2 ln 5) . 5 ^(2 x - 1) + C$.],),writing-lines:3,source-id:"tu-luyen-25",question-gap:if variant=="de" {3mm}else{6mm},solution:solutions.at("tu-luyen-25"))
#item("26",[Nguyên hàm của hàm số $f ( x ) = 2 ^(x) lr(( 1 + 2 ^(- x) ⋅ sin x ))$ là],answers:([$frac(2 ^(x + 1), x + 1) - cos x + C$],[$frac(2 ^(x), ln 2) - cos x + C$.],[$frac(2 ^(x), ln 2) + cos x + C$.],[$frac(2 ^(x - 1), x + 1) + cos x + C$.],),writing-lines:3,source-id:"tu-luyen-26",question-gap:if variant=="de" {3mm}else{6mm},solution:solutions.at("tu-luyen-26"))
#item("27",[Tìm một nguyên hàm $F lr(( x ))$ của hàm số $f lr(( x )) = e ^(x) - 1$ trên $lr(( - infinity ";" + infinity ))$, biết $F lr(( 0 )) = 2$.],answers:([$F lr(( x )) = frac(1, e ^(x)) - x + 1$.],[$F lr(( x )) = ln x - x - 1$.],[$F lr(( x )) = e ^(x) - x + 1$.],[$F lr(( x )) = e ^(x) - x + 2$.],),writing-lines:3,source-id:"tu-luyen-27",question-gap:if variant=="de" {3mm}else{6mm},solution:solutions.at("tu-luyen-27"))
#item("28",[Tìm nguyên hàm của hàm số $f lr(( x )) = e ^(- x) lr(( 2 + frac(e ^(x), cos ^(2) x) ))$.],answers:([$F lr(( x )) = - frac(2, e ^(x)) + tan x + C$.],[$F lr(( x )) = 2 e ^(x) - tan x + C$.],[$F lr(( x )) = - frac(2, e ^(x)) - tan x + C$.],[$F lr(( x )) = 2 e ^(- x) + tan x + C$.],),writing-lines:3,source-id:"tu-luyen-28",question-gap:if variant=="de" {3mm}else{6mm},solution:solutions.at("tu-luyen-28"))
#item("29",[Cho hàm số $y = f lr(( x ))$ có đạo hàm là $f' lr(( x )) = e ^(x) + 2 x + 1 "," ∀ x ∈ RR$ và $f lr(( 0 )) = 1$. Biết $F lr(( x ))$ là nguyên hàm của $f lr(( x ))$ thỏa mãn $F lr(( 1 )) = e$. Tính $F lr(( 0 ))$.],answers:([$frac(5, 6)$.],[$- frac(1, 6)$.],[$frac(1, 6)$.],[$- frac(5, 6)$.],),writing-lines:3,source-id:"tu-luyen-29",solution:solutions.at("tu-luyen-29"))
#item("30",[Tìm $F lr(( x ))$ là một nguyên hàm của hàm số $f lr(( x )) = e ^(x) - 1$ trên $lr(( - infinity ";" + infinity ))$, biết $F lr(( 0 )) = 2$.],answers:([$F lr(( x )) = ln x - x - 1$.],[$F lr(( x )) = e ^(x) - x - 1$.],[$F lr(( x )) = frac(1, e ^(x)) - x + 1$.],[$F lr(( x )) = e ^(x) - x + 1$.],),writing-lines:3,source-id:"tu-luyen-30",solution:solutions.at("tu-luyen-30"))
#item("31",[Cho $F lr(( x )) = lr(( a x ^(2) + b x + c )) e ^(2 x)$ là một nguyên hàm của hàm số $f lr(( x )) = 2 x ^(2) . e ^(2 x)$. Tính tổng $a + b + 2 c$.],answers:(),writing-lines:6,source-id:"tu-luyen-31",solution:solutions.at("tu-luyen-31"))
#item("32",[Cho $F lr(( x ))$ là một nguyên hàm của hàm số $f lr(( x )) = "e" ^(x) + 2 x$ thỏa mãn $F lr(( 0 )) = frac(3, 2)$. Tìm $F lr(( 2 ))$(làm tròn đến hàng phần chục).],answers:(),writing-lines:5,source-id:"tu-luyen-32",solution:solutions.at("tu-luyen-32"),fill-writing-page:false)
]
}
