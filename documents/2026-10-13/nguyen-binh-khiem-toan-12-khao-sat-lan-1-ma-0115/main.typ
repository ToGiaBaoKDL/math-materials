#import "/templates/exam.typ": exam, exam-cover, exam-end
#import "content/questions.typ": questions
#let variant = sys.inputs.at("variant", default: "de")
#show: exam.with("Khảo sát Toán 12 lần I — Nguyễn Bỉnh Khiêm — 0115", "0115", variant: variant, leading: if variant == "dap-an" { 0.95em } else { 0.76em })
#exam-cover([SỞ GD\&ĐT GIA LAI #linebreak() THPT NGUYỄN BỈNH KHIÊM],
 [KHẢO SÁT CHẤT LƯỢNG HỌC SINH LỚP 12 #linebreak() LẦN I – NĂM HỌC 2026–2027], "0115", status:[ĐỀ CHÍNH THỨC], organization-size: 11pt)
#questions(variant, ending: exam-end(note: [#text(style:"italic")[Thí sinh không được sử dụng tài liệu. #linebreak() Cán bộ coi thi không giải thích gì thêm.]]))
