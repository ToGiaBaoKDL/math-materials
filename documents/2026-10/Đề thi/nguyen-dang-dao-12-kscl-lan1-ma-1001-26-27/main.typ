#import "/templates/exam-lesson.typ": exam, exam-cover, exam-section, exam-table, exam-end
#import "content/questions.typ": questions
#let variant = sys.inputs.at("variant",default:"de-dap-an")
#show: exam.with([Khảo sát chất lượng lần 1 – Nguyễn Đăng Đạo – Toán 12 – 2026–2027],"1001",variant:variant)
#if variant != "dap-an" {
  exam-cover([SỞ GD-ĐT BẮC NINH\ TRƯỜNG THPT NGUYỄN ĐĂNG ĐẠO], [ĐỀ KHẢO SÁT CHẤT LƯỢNG LẦN 1], "1001")
  questions()
  v(1fr)
  exam-end()
}
#if variant == "de-dap-an" { pagebreak() }
#if variant != "de" {
  exam-section("ĐA",[ĐÁP ÁN – MÃ ĐỀ 1001])
  exam-section("I",[TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN LỰA CHỌN])
  exam-table(columns:(1fr,)*12,header:range(1,13).map(n=>str(n)),..("B","D","D","B","D","D","C","A","C","A","D","B"))
  exam-section("II",[TRẮC NGHIỆM ĐÚNG – SAI])
  exam-table(columns:(1fr,)*5,header:([Câu],[a],[b],[c],[d]),
    [1],[Đ],[S],[Đ],[S], [2],[S],[Đ],[Đ],[S], [3],[S],[Đ],[Đ],[S], [4],[S],[S],[Đ],[Đ])
  exam-section("III",[TRẮC NGHIỆM TRẢ LỜI NGẮN])
  exam-table(columns:(1fr,)*6,header:range(1,7).map(n=>str(n)),[138],[32],[7],[6,71],[39,9],[15])
  v(1fr)
  exam-end()
}
