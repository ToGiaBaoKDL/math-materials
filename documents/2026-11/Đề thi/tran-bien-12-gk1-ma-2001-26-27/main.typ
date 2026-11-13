#import "/templates/exam-lesson.typ": exam, exam-section
#import "/templates/lesson.typ": lesson-heading
#import "/templates/components.typ": choices, solution-heading
#import "/templates/exam.typ": exam-end
#import "/templates/theme.typ": exam-lesson-palette as palette
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#let answers=variant=="dap-an"
#show:exam.with([GIỮA KỲ I – THPT TRẤN BIÊN – TOÁN 12],"2001",variant:variant)
#set par(leading:if answers {1.12em}else{1.1em},spacing:3mm,justify:true)
#lesson-heading([ĐỀ KIỂM TRA GIỮA HK1 TOÁN 12],"TRƯỜNG THPT TRẤN BIÊN – ĐỒNG NAI",
 title-size:27pt,title-tracking:0.2pt,course-size:20pt,palette:palette,author:none,
 subtitle:[Năm học 2026–2027 · Mã đề: 2001])
#if not answers {
 block(above:3mm,below:4mm)[
 #set par(justify:false)
 #grid(columns:(1fr,1fr),gutter:7mm,[Họ và tên: #box(width:42mm,repeat[.])],[Số báo danh: #box(width:35mm,repeat[.])])
 ]
}
#let fig(q)=context block(width:100%,breakable:false,above:2mm,below:2mm,align(center,scale(x:q.width/measure(q.figure).width*100%,y:q.width/measure(q.figure).width*100%,reflow:true,q.figure)))
#let question(q)={
 let side=answers and q.key=="I-7"
 block(width:100%,breakable:true,above:if answers {4mm}else{6mm},below:if answers {2mm}else{3mm})[
  #if side {
   grid(columns:(1fr,60mm),gutter:6mm,align:top,
    [#set par(justify:false)
     #text(fill:palette.primary,weight:"bold")[Câu #q.number:] #q.stem
     #v(3mm)
     #choices(q.options,columns:2,label-color:palette.primary,row-gap:3mm)
    ],fig(q))
  } else { [#text(fill:palette.primary,weight:"bold")[Câu #q.number:] #q.stem] }
  #if not answers and q.figure!=none {fig(q)}
  #if q.statements.len()>0 {
   for (i,s) in q.statements.enumerate() {block(above:3mm,below:0pt)[#str.from-unicode(97+i)) #s]}
  }
  #if q.options.len()>0 and not side {v(3mm);choices(q.options,columns:if q.key=="I-1" {2}else{4},label-color:palette.primary,row-gap:3mm)}
 ]
 if answers {
  solution-heading(color:palette.primary,below:2mm)
  if q.figure!=none and not side {fig(q)}
  block(above:0pt,below:2mm)[*#if q.section=="I" {[Chọn #q.answer.]}else{[Đáp án: #q.answer.]}*]
  q.solution
 }
}
#for (sec,title,guide) in (
 ("I",[TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN],[Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu chỉ chọn một phương án. (3,0 điểm)]),
 ("II",[TRẮC NGHIỆM ĐÚNG – SAI],[Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d), thí sinh chọn đúng hoặc sai. (4,0 điểm)]),
 ("III",[TRẮC NGHIỆM TRẢ LỜI NGẮN],[Thí sinh trả lời từ câu 1 đến câu 6. (3,0 điểm)]),
) {
 exam-section(sec,title,instruction:if answers {[]}else{guide})
 for q in questions.filter(q=>q.section==sec) {question(q)}
}
#exam-end(note:if answers {
  text(size:10.5pt,style:"italic")[Lời giải tham khảo trong tài liệu nguồn: AI & TOANMATH.com.]
}else{[]})
