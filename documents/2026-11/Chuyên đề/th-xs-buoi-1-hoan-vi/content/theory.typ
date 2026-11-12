#import "/templates/lesson.typ": theory-box, lesson-section
#let theory() = [
#lesson-section([LÝ THUYẾT CẦN NHỚ],badge:"LT")
#theory-box[
*1. Hoán vị*

Cho tập hợp gồm $n$ phần tử khác nhau $(n >= 1)$. Mỗi cách sắp xếp $n$ phần tử này theo 1 thứ tự nào đó ta được 1 hoán vị của $n$ phần tử.

Số hoán vị của $n$ phần tử là:
$ P_n = n! = n(n-1)(n-2) dots 1. $

*2. Hoán vị lặp*

Cho $n$ phần tử, trong đó: Có $n_1$ phần tử giống nhau, $n_2$ phần tử khác giống nhau, …, $n_k$ phần tử khác giống nhau ($n=n_1+n_2+dots+n_k$). Khi đó, ta có số hoán vị của $n$ phần tử trên là:
$ frac(n!,n_1! n_2! dots n_k!). $
]
]
