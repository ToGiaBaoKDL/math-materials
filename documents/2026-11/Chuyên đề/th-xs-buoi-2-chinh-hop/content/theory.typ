#import "/templates/lesson.typ": theory-box, lesson-section
#let theory() = [
#lesson-section([LÝ THUYẾT CẦN NHỚ],badge:"LT")
#theory-box[
*Chỉnh hợp*

Cho tập hợp $A$ gồm $n$ phần tử ($n >= 1$). Mỗi cách sắp xếp $k$ ($1 <= k <= n$) phần tử nào đó của $A$ theo một thứ tự nhất định (quy luật) cho ta được một chỉnh hợp chập $k$ của $n$ phần tử (gọi tắt là chỉnh hợp chập $k$ của $A$).

Số chỉnh hợp chập $k$ của $A$:
$ A_n^k = n(n-1)(n-2) dots (n-k+1) = frac(n!, (n-k)!). $
]
]
