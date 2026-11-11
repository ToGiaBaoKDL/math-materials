#import "/templates/exam-lesson.typ": exam, exam-section
#import "/templates/lesson.typ": lesson-heading
#import "/templates/components.typ": choices, solution-heading
#import "/templates/writing.typ": writing-space, ruled-page-remainder
#import "/templates/exam.typ": exam-end
#import "/templates/theme.typ": exam-lesson-palette as palette
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#let answers=variant=="dap-an"
#let writing=variant=="de-cach"
#show: exam.with([ĐỀ THI THỬ THÁNG 11],none,variant:variant)
#set par(leading:if answers {1.12em}else{0.85em},justify:true)
#lesson-heading([ÔN TẬP GIỮA HK I],"ĐỀ THI THỬ THÁNG 11",title-size:28pt,title-stretch:false,title-tracking:0.2pt,palette:palette,author:none,subtitle:if writing {[ĐỀ CÓ KHOẢNG VIẾT]}else if answers {[ĐÁP ÁN VÀ LỜI GIẢI]}else{none})
#if not answers {
 block(above:3mm,below:4mm)[
  #set par(justify:false)
  #grid(columns:(1fr,1fr),gutter:8mm,[Họ và tên: #box(width:43mm,repeat[.])],[Số báo danh: #box(width:35mm,repeat[.])])
 ]
}
#let fig(body,width)=context align(center,scale(x:width/measure(body).width*100%,y:width/measure(body).width*100%,reflow:true,body))
#let question-body(q) = {
 block(breakable:not writing,sticky:false,above:if answers and ("I-6", "I-10", "III-6").contains(q.key) {2mm}else{4mm},below:if answers and q.key=="I-6" {1mm}else{3mm})[
  #set par(justify: q.key!="I-9",leading:if answers {1.12em}else{0.85em})
  #let side=not answers and q.qfig!=none and not ("II-2", "II-3").contains(q.key)
  #let figure-width=if q.key=="II-1" {q.width*1.1}else{q.width}
  #let statements-beside=side and q.key=="II-1"
  #let heading=[*Câu #q.number:* #text(fill:palette.primary,weight:"bold")[[DXT]] #q.stem]
  #if side {
   grid(columns:(1fr,figure-width),gutter:6mm,align:top,
    [#set par(justify:("III-4", "III-5").contains(q.key))
     #heading
     #if statements-beside {v(2mm);q.statements}
     #if q.section=="I" and q.choices.len()>0 {v(3mm);choices(q.choices,columns:2,label-color:palette.primary)}
    ],fig(q.qfig,figure-width))
  } else {
   heading
   if not answers and q.qfig!=none {
    v(if q.key=="II-3" {1.5mm}else{6mm})
    fig(q.qfig,figure-width)
    v(if q.key=="II-3" {0mm}else{3mm})
   }
  }
  #if q.statements!=[] and not statements-beside {v(2mm);q.statements}
  #if q.choices.len()>0 and not(side and q.section=="I") {v(2mm);choices(q.choices,label-color:palette.primary)}
 ]
 if answers {
  solution-heading(color:palette.primary,below:if q.key=="I-6" {0mm}else if q.key=="III-6" {2mm}else{3mm})
  let picture=if q.sfig!=none {q.sfig}else{q.qfig}
  if picture!=none {block(width:100%,breakable:false,sticky:false,above:if q.key=="I-6" {0mm}else{2mm},below:if q.key=="I-6" {0mm}else if q.key=="III-5" {1mm}else{3mm},fig(picture,if q.key=="II-3" {54mm}else if q.key=="I-9" {52mm}else if q.key=="I-6" {49.5mm}else if q.key=="I-4" {45mm}else if q.key=="III-5" {42mm}else if q.key=="III-4" {45mm}else if q.key=="I-12" {50mm}else if q.key=="II-1" {52mm}else{q.width}))}
  block(above:0pt,below:2.5mm)[*#if q.section=="I" {[Chọn #q.answer.]}else{[Đáp án: #q.answer.]}*]
  if q.key=="I-4" {
   show math.equation.where(block:true): set block(above:2mm,below:2mm)
   q.solution
  } else if ("III-4", "III-5").contains(q.key) {
   set par(justify:false,spacing:2.5mm)
   q.solution
  } else {q.solution}
 } else if writing {writing-space(q.lines,gap:9mm);ruled-page-remainder(gap:9mm)}
}
// Flow answers continuously; do not bind a question to its solution.
#let question(q) = question-body(q)
#let sections=(
 ("I",[TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN],[Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.]),
 ("II",[TRẮC NGHIỆM ĐÚNG – SAI],[Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.]),
 ("III",[TRẮC NGHIỆM TRẢ LỜI NGẮN],[Thí sinh trả lời từ câu 1 đến câu 6.]),
)
#for (sec,title,instruction) in sections {
 if sec!="I" and writing {pagebreak()}
 exam-section(sec,title,instruction:if answers {[]}else{instruction})
 let items=questions.filter(q=>q.section==sec)
 for (i,q) in items.enumerate() {
  if writing and i>0 and ((sec=="I" and (2,5,8,10).contains(i)) or sec=="II" or (sec=="III" and (2,4,5).contains(i))) {pagebreak()}
  question(q)
 }
}
#if writing {ruled-page-remainder(gap:9mm)}
#exam-end()
