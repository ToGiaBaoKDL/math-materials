#import "/templates/lesson.typ": lesson, lesson-heading
#import "/templates/components.typ": end-mark
#import "/templates/theme.typ": palette, lesson-style
#import "/templates/contacts.typ": contact-links
#import "content/theory.typ": theory
#import "content/questions.typ": questions
#let variant=sys.inputs.at("variant",default:"de")
#show:lesson.with([BUỔI 2: CHỈNH HỢP],variant:variant,branding:lesson-style.branding + (
 header:lesson-style.branding.header,
 footer:[KHOÁ HỌC CHUYÊN SÂU TOÁN THỰC TẾ & XÁC SUẤT IB ZOLA: 0833.281.128],
 footer-align:left,
 footer-page-center:false,
 footer-offset:0mm,
 footer-x-offset:0mm,
 footer-rule:false,
 header-align:right,
),heading-content:lesson-heading(
 [4 BUỔI MỞ KHÓA NỀN TẢNG],"BUỔI 2: CHỈNH HỢP",title-size:29pt,title-tracking:0.2pt,author-color:palette.heading,
 subtitle:[TIỀN KHÓA HỌC CHUYÊN SÂU TỔ HỢP – XÁC SUẤT]))
#set text(size:14pt)
#set par(leading:1.08em,spacing:3mm,justify:true)
#theory()
#questions(variant)
#end-mark([
 #set par(justify:false,leading:0.5em)
 #set align(center)
 #set text(size:12pt,fill:black,style:"normal")
 Xem lại video record buổi học tại Fanpage Thầy Đỗ Xuân Thắng (\@toanthaythangdxt)
 #v(2mm)
 #align(center,text(fill:palette.heading,contact-links(color:palette.heading)))
],note-gap:3mm,above:4mm)
