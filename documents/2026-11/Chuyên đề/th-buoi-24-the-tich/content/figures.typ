#let enlarged = (
  "thiet-dien-vat-the.svg", "thiet-dien-vuong.svg", "khoi-tron-xoay.svg",
  "chom-cau.svg", "hai-do-thi.svg", "parabol-can-bac-hai.svg", "mien-tam-giac.svg",
  "nua-duong-tron.svg", "do-thi-ham-mu.svg", "thiet-dien-hinh-chop.svg", "vo-do-choi.svg",
  "parabol-duong-thang-loi-giai.svg", "hai-parabol-loi-giai.svg", "parabol-duong-thang.svg",
  "nua-duong-tron-loi-giai.svg", "giao-hai-hinh-cau.svg", "hinh-chop-loi-giai.svg",
)
#let figure(name, width: auto) = block(width: 100%, above: 1mm, below: 0pt, align(center,
  image("../figures/" + name, width: if width!=auto {width} else if name=="chom-cau.svg" {122.4mm}
    else if name=="binh-mat-cat-vuong.svg" {86.4mm}
    else if name=="parabol-duong-thang-loi-giai.svg" {68mm}
    else if name=="parabol-duong-thang.svg" {72mm}
    else if name=="parabol-can-bac-hai.svg" {90mm}
    else if name=="parabol-va-duong-thang.svg" {60mm}
    else if name=="khoi-tron-xoay.svg" {117.7mm}
    else if name in ("parabol-va-duong-thang.svg", "mat-cat-cau.svg") {72mm}
    else if name in enlarged {102mm} else {85mm}),
))
#let figure-pair(first, second, height:78mm) = block(width: 100%, above: 1mm, below: 0pt, grid(
  columns: (1fr, 1fr), gutter: 5mm, align: center + horizon,
  image("../figures/" + first, width: 100%, height: height, fit: "contain"),
  image("../figures/" + second, width: 100%, height: height, fit: "contain"),
))
