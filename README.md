# Math Materials

Dựng lại đề và bài giảng từ ảnh, PDF hoặc bản xuất DOCX của Google Docs bằng Typst; xuất PDF có nội dung chính xác, hình vector, bố cục đẹp và màu sắc sinh động.

Tài liệu chung của repo tập trung trong README này. Metadata, mapping, trạng thái và ghi chú riêng của từng tài liệu nằm trong `manifest.json` tương ứng. Chỉ tạo file/thư mục khi có nội dung thực tế.

## Cấu trúc

```text
math-materials/
├── README.md
├── assets/
│   ├── fonts/dxt/                         # Font 9Slide nguyên bản do người dùng cung cấp
│   ├── sources/YYYY-MM/<Đề thi|Chuyên đề>/<document-id>/   # DOCX/ảnh/PDF đầu vào
│   └── targets/YYYY-MM/<Đề thi|Chuyên đề>/<document-id>/   # PDF đầu ra
├── documents/YYYY-MM/<Đề thi|Chuyên đề>/<document-id>/
│   ├── manifest.json                      # Mapping và trạng thái
│   ├── main.typ                           # Mã nguồn tài liệu
│   ├── content/                           # Chỉ tách khi tài liệu dài
│   └── figures/                           # Mã hình .typ / SVG nếu cần
├── templates/                             # Theme/component .typ dùng chung
├── scripts/build.py                       # Build các bản xuất theo manifest
└── skills/<skill>/SKILL.md                 # Bốn skill theo trách nhiệm
```

Tên file tài nguyên dùng chữ thường không dấu, nối bằng `-`, không có dấu cách hoặc `#`; tên gốc giữ trong manifest. Tên family bên trong font không đổi khi đổi tên file `.ttf`. Thư mục gốc chỉ giữ README, Makefile và các thư mục chức năng; không để ảnh/font upload rời ở gốc. Chỉ lưu bản mẫu cũ khi cần giữ lịch sử. Bộ Phú Thọ cũ đã bỏ theo yêu cầu; không có archive Phú Thọ. Chỉ bỏ bản trùng sau khi checksum khớp với bản lưu chính.

Đây là quy ước tổ chức; các thư mục tùy chọn chỉ được tạo khi cần. Mô hình hình học và tài nguyên riêng nằm trong thư mục tài liệu; theme, component và hàm vẽ dùng chung nằm trong `templates/`. Tài liệu mới import bộ hàm chung thay vì sao chép mã vẽ hoặc style.

## Skills và ownership

Mỗi skill nằm trong `skills/<skill>/SKILL.md`, chỉ thêm tài nguyên khi có nhu cầu thực tế. Ownership phân chia trách nhiệm của thao tác, không yêu cầu một agent riêng cho mỗi skill.

| Skill | Phạm vi chỉnh sửa | Đầu ra |
|---|---|---|
| [math-transcription](skills/math-transcription/SKILL.md) | Nội dung trong `main.typ`/`content/`; nguồn, metadata, phạm vi và mapping trong manifest | Nội dung đã đối chiếu với nguồn |
| [typst-figures](skills/typst-figures/SKILL.md) | `templates/drawing.typ` và `figures/`: hàm vẽ, mô hình, phép chiếu, nét, nhãn và khung nội bộ | Hình vector và giới hạn phần hình thực |
| [typst-layout](skills/typst-layout/SKILL.md) | `templates/theme.typ`, `components.typ`, `exam.typ`, `lesson.typ`; bố trí trong `main.typ`, thiết kế trong `implementation` | Template và trang trình bày nhất quán |
| [typst-review](skills/typst-review/SKILL.md) | Build và `scripts/build.py`, `assets/targets/`, `output`/`outputs` và `qa` trong manifest | PDF đã kiểm tra và metadata của bản xuất |

Trong file dùng chung, chỉnh đúng phần thuộc trách nhiệm của thao tác và giữ phần còn lại. Các skill triển khai kiểm tra phần mình sửa; review đối chiếu bản cuối và trả lỗi về đúng trách nhiệm.

## Ngày, tên và mapping

- `YYYY-MM` là tháng tiếp nhận; phân loại `Đề thi` hoặc `Chuyên đề`. Ngày tiếp nhận đầy đủ vẫn lưu trong manifest.
- `<document-id>` dùng chữ thường, không dấu, nối bằng `-`; chọn tên theo môn, lớp, chủ đề hoặc mã đề để phân biệt tài liệu.
- Dùng cùng tháng, loại và ID ở `sources`, `documents`, `targets`. Nhiều tài liệu trong một tháng dùng ID khác nhau.
- Trang nguồn đặt tên theo số trang thực: `page-01.jpg`, `page-02.jpg`, ... Không suy ra số trang từ thứ tự upload.
- Ảnh bổ sung của cùng tài liệu đưa vào bộ đã có, dù nhận vào ngày khác; cập nhật manifest.
- Bản xuất Google Docs lưu thành `source.docx`; URL và tên gốc nằm trong manifest. Nguồn nội dung và mẫu trình bày là hai vai trò riêng.
- Giữ nguyên nội dung nguồn. Bản xoay/cắt/tăng tương phản phục vụ đọc nguồn, nếu có, lưu riêng.
- Nếu cần giữ nhiều bản PDF, dùng `document-v01.pdf`, `document-v02.pdf` và cập nhật mapping.

Mỗi `manifest.json` lưu ID/ngày, metadata từ nguồn, tên file gốc, đường dẫn ảnh, số trang gốc, SHA-256, trạng thái xử lý và đường dẫn Typst/PDF. Đường dẫn tính từ gốc kho; phân biệt đường dẫn dự kiến với file đã tạo. Ghi điểm thiếu/mờ, kết quả kiểm tra và mapping theo câu/hình tại đây khi cần; không thêm trường rỗng hoặc file ghi chú riêng.

## Nguyên tắc dựng tài liệu

- **Độ chính xác nội dung được ưu tiên:** đối chiếu từng câu, lựa chọn, số liệu, dấu toán, số mũ, chỉ số, vector, prime, khoảng `[a;b)`, tên điểm và đơn vị. Không đoán chữ/công thức mờ, tự sửa nội dung hoặc bịa phần thiếu.
- Với DOCX, kiểm tra cả công thức Word, MathType OLE/WMF và hình nhúng. Trích văn bản thông thường có thể bỏ mất công thức; đọc cấu trúc toán hoặc đối chiếu bản render nguồn trước khi nhập Typst. Giữ kiểu chữ và quy ước trình bày của template đã chốt, tách khỏi định dạng Word.
- **Typst là mã nguồn chính:** PDF compile từ `.typ`; văn bản có thể chọn/tìm kiếm. Không ghép ảnh nguyên trang thành PDF, không dùng image generation để tái tạo chữ/công thức/hình toán cần chính xác.
- **Hình được dựng từ cấu trúc toán học:** dùng primitives Typst, CeTZ hoặc SVG tự dựng; kiểm tra điểm, cạnh, mặt, kích thước, đường khuất và đường gấp. Với mặt cắt, dựng giao tuyến từ phương trình hình, giới hạn nét gạch trong miền cắt và xác định điểm chuyển nét thấy/khuất theo phép chiếu. Tránh lấy hình raster từ nguồn khi có thể dựng vector chính xác.
- Phân biệt nét thấy, nét khuất, đường cắt và đường gấp theo quy ước trong nguồn. Tô pastel nhẹ cho vùng cần nhấn mạnh; nhãn không đè lên hình. Hình 3D dùng phép chiếu nhất quán và kiểm tra quan hệ hình học.
- Tách theme khỏi nội dung. Dùng component cho câu hỏi, lựa chọn, tiêu đề phần, bảng, ghi chú, footer và hình; tránh lặp style tại từng câu. Chỉ comment công thức hoặc quyết định khó suy ra từ mã.
- Không tự thêm lời giải/đáp án khi nhiệm vụ chỉ là dựng đề. Giữ đúng mã đề, nội dung và thông tin nguồn; phân biệt số trang nguồn với số trang PDF. Ghi điểm chưa chắc vào manifest và làm rõ trước khi hoàn tất.
- PDF giữ nội dung trong nguồn, không tự thêm chú thích biên tập, tên hình hoặc thông báo thiếu nguồn. Phạm vi bản trích và nội dung còn thiếu được ghi trong manifest; không coi bản thiếu nguồn là đề đầy đủ.

## Thiết kế

A4 dọc, lề cân đối, khoảng cách nhất quán, bố cục thoáng. Chọn phong cách theo yêu cầu và mẫu đã chốt cho từng tài liệu: đề thi gọn, rõ hoặc bài giảng sinh động với hình khối và màu nhấn. Mẫu tham khảo không thay thế nguồn nội dung.

Quy ước DXT hiện hành được ghi dưới đây và trong các template. Logo dùng trong bài giảng nằm tại `assets/branding/logo-original.png`; thư mục tham khảo đã bỏ theo yêu cầu.

| Thành phần | Font/quy ước chuẩn |
|---|---|
| Nội dung, câu hỏi | Times New Roman; FreeSerif chỉ dự phòng ký hiệu thiếu |
| Header và slogan footer DXT (bài giảng) | Noto Sans Bold |
| Header/footer chữ đỏ (đề thi, header Buổi 11) | Noto Sans Regular 11 pt |
| Số trang | Noto Sans Regular |
| Tên khóa học | Arial Bold |
| Tên bài học | #9Slide02 Tieu de dai; nếu dài dùng Tieu de rat dai 01 rồi 02 |
| Tiêu đề phụ/chuyên đề | #9Slide02 Noi dung dai |
| Số/chữ trong huy hiệu và tên mục | #9Slide02 Tieu de dai |
| Công thức | New Computer Modern Math |
| Nền khung/bảng | #FDF8F8 |

Font 9Slide do người dùng cung cấp nằm tại `assets/fonts/dxt/`; build nạp trực tiếp bằng `--font-path assets/fonts`, không cần cài vào hệ điều hành. Không làm đậm giả các font 9Slide vốn đã có nét đậm. Times New Roman, Arial và Noto Sans lấy từ font hệ thống. Mỗi lần đổi font phải kiểm tra font nhúng thật trong PDF, dấu tiếng Việt và ngắt dòng.

Màu thân chữ đen, nền trắng; đỏ ruby `#B51F36` cho nhận diện/header/footer; tiêu đề bài và mục dùng đỏ `#C00000`; riêng `[DXT]` sau nhãn câu dùng đỏ tươi `#E60012`. Huy hiệu lục giác xanh đậm `#006B18`, bo góc mềm, viền 2 pt chuyển từ `#E9F8E9` trên trái sang `#8FC398` dưới phải. Khung tên mục nền trắng, viền xanh, gờ xanh ngắn phía trên và nét đứt nối bên phải. Mặt phẳng hình học có thể dùng mint `#E8F2E9` hoặc kem `#F6EDDC` theo lựa chọn đã chốt; cạnh/nhãn vẫn giữ rõ.

Đề và bài giảng dùng chung màu, font và component, với bố cục phù hợp từng loại:

- **Đề thi:** thông tin đề/mã đề rõ, nhãn câu và đáp án dễ quét; lựa chọn 1/2/4 cột theo độ dài, bảng rõ; footer mã đề và số trang.
- **Bài giảng:** mục rõ; khung định nghĩa, ví dụ, ghi nhớ; thêm không gian cho hình và chú thích, dùng sắc độ đỏ và khoảng trắng để phân cấp.

Template bài học trong `lesson.typ` dùng thân chữ 14 pt, leading 0,92 em (`lesson-style.leading`), cách đoạn 3,5 mm; các ý a–d cách nhau 4,5 mm và cách đề dẫn 3,5 mm; lề hai bên 12 mm, trên 24 mm, dưới 22 mm; tiêu đề buổi 9Slide 25 pt, tên khóa Arial Bold 20,5 pt; tiêu đề dạng 9Slide 13,5 pt màu đỏ #C00000 trong khung trắng viền xanh, kèm huy hiệu lục giác bo góc. `lesson-heading` trong `templates/lesson.typ` dựng phần đầu dùng chung; file tài liệu chỉ truyền tên khóa, buổi, chuyên đề và tác giả. Header/footer nhận diện có trên mọi trang, đánh số `Trang n/N` riêng cho từng bản xuất. Khoảng cách câu/đáp án dùng token của bài giảng; công thức nhiều tầng có khoảng trống riêng và được ngắt theo các bước biến đổi khi vượt chiều rộng. Đề bài toán nằm ngoài khung; hướng giải quyết và công thức cần nhớ dùng nền đỏ rất nhạt, viền đỏ đầy đủ bốn cạnh. Khoảng cách trên/dưới khung là 5/7 mm. Công thức trong câu dùng `$math$`; công thức đứng riêng do component `formula` dựng, có khoảng cách trên/dưới 3 mm, không cộng dồn với khoảng cách mặc định và giữ các dòng cùng trang.

Khi được yêu cầu ba bản bài học, dùng chung nội dung Typst: `de` giữ lý thuyết/phương pháp và đề bài; `de-cach` thêm dòng ngang xám nhạt cách nhau 7 mm, giữ số dòng tối thiểu theo câu và chia đều phần trống dư của mỗi trang cho các vùng viết lời giải; `dap-an` thêm đáp án/lời giải trong nguồn. Cả ba giữ lý thuyết nếu nguồn có. Thứ tự mục, cách nhóm và số câu theo từng nguồn; không ép mọi DOCX vào cùng cấu trúc. Hình thuộc lời giải chỉ hiện ở bản có lời giải. Không tự tạo bảng đáp án hoặc lời giải chưa có trong nguồn.

Hai template có điểm vào riêng:

| File | Trách nhiệm |
|---|---|
| `templates/lesson.typ` | Bài giảng: cover khóa học, tiêu đề dạng, lý thuyết, ba biến thể |
| `templates/exam.typ` | Đề thi: cover hai cột, mã đề, phần I–III, câu hỏi, ba biến thể |
| `templates/branding.typ` | Header/footer DXT cho bài giảng (dải đỏ ruby, logo, slogan, `Trang n/N`) |
| `templates/lesson-branding.typ` | Header chữ đỏ tùy chọn cho bài giảng (`header-content: lesson-red-header()`) |
| `templates/exam-branding.typ` | Header/footer chữ đỏ của đề thi, icon liên hệ, `Mã đề thi … – Trang n/N` |
| `templates/theme.typ` | Font, màu và thông số riêng `lesson-style` / `exam-style` |
| `templates/components.typ` | Lựa chọn tự chia 1/2/4 cột và component nội dung |
| `templates/writing.typ` | Dòng trình bày tối thiểu và chia phần trống còn lại của trang |
| `templates/drawing.typ`, `graphs.typ` | Nét, nhãn, đồ thị và bảng biến thiên vector |
| `templates/pyramid-net.typ` | Mô hình khai triển/chóp vuông dùng ở hai đề hiện tại |

**Template đề thi** theo mẫu Phú Thọ đã chốt: cover hai cột, tên đơn vị/kỳ thi đỏ ruby, đề mục và A–D xanh navy `#245474`, câu hỏi có nhãn đỏ đậm, thân chữ Times New Roman 12 pt (`exam-style.body-size`); lề hai bên 12 mm, trên 18 mm, dưới 16 mm (đặt trong `exam()`). Leading mặc định của template là 0,76 em (`exam-style.leading`); các đề hiện tại truyền `leading` trong `main.typ`: 0,95 em, riêng `dap-an` 1,0 em. Các ý a–d cách nhau 4 mm. Bảng số liệu và bảng biến thiên có header hồng nhạt, nhãn xanh navy. Footer trên mọi trang: liên hệ bên trái, mã đề và số trang thực của bản xuất bên phải. Đồ thị mặc định 70 × 48 mm, nhãn 10 pt đặt ngoài trục và vẽ sau các đường dóng. Mũi tên dùng vector hướng chung; cạnh hình học liền/đứt giữ cùng tông đỏ và độ dày. Cụm HẾT căn giữa bằng hai nét ngang, gắn với nội dung cuối để tránh trang kết riêng. Không dùng dải header/footer DXT hay huy hiệu bài giảng cho đề thi. Nội dung/mã đề luôn lấy từ nguồn riêng, không chép từ ảnh Phú Thọ.

`main.typ` chọn template và truyền metadata; `content/questions.typ` giữ nội dung, `content/solutions.typ` giữ lời giải khi nguồn có. Các bản `de`, `de-cach`, `dap-an` dùng chung một tập câu hỏi; `de-cach` thêm dòng trình bày và `dap-an` thêm lời giải. Nguồn không có đáp án chỉ khai báo hai bản đầu trong manifest. Theo yêu cầu đã chốt, `exam-source` in dòng “Nguồn đề: TOANMATH.com.” ở cuối mọi bản đề thi; `exam-source(ai: true)` thêm ghi chú đề gõ lại từ ảnh và lời giải do AI thực hiện (hiện chỉ dùng ở bản `dap-an` của NBK). Ngoài các dòng này, không thêm ghi chú nguồn/biên tập vào PDF; thông tin nguồn và phạm vi xử lý lưu trong manifest.

Khoảng cách giữa câu hỏi, đáp án và các hàng/cột dùng token chung trong theme. Chừa khoảng trắng riêng giữa các câu, bên cạnh giãn dòng trong từng đoạn; cân lại phần đệm của hình và lề để giữ nhịp đọc thoáng. Ô đáp án tính đủ chiều cao thực của công thức, kể cả tử/mẫu và chỉ số; nhãn A–D căn cùng hàng và phần công thức có điểm bắt đầu thống nhất. Tích phân cần dấu lớn dùng `display(...)` trong công thức inline; kiểm tra cận và khoảng hở với các dòng, đáp án xung quanh. Khi tham khảo sách hoặc giáo trình, xem cả trang bài tập nhiều công thức và hình; ghi nguồn cùng quyết định thiết kế áp dụng vào manifest.

Hình toán dùng nét cạnh đồng nhất qua `figure-style.edge-width` (mặc định 0,8 pt); nét hachure phụ mảnh hơn (0,35 pt). Cạnh thấy, đường gấp và đường cắt dùng đỏ ruby; nét khuất cùng màu nhưng nhạt hơn, cấu hình qua `figure-style.edge-opacity`. Nhãn giữ màu đen để dễ đọc. Nét liền/đứt phải theo nội dung và hình học: trong hình khai triển, phân biệt đường cắt với đường gấp; trong khối 3D, xác định nét khuất từ hướng nhìn và các mặt kề. Không đổi kiểu nét chỉ để trang trí.

Mặt hình mặc định dùng sắc đỏ nhẹ hoặc các tông pastel đã được chốt cho từng bài; khi tô theo hướng sáng: mặt hướng sáng nhạt hơn, mặt khuất sáng đậm hơn. Hình khai triển dùng tông của mặt tương ứng sau khi gấp. Tô trên mặt có thật, giữ đường khuất/giao tuyến rõ và không thêm đường chia mặt để tạo bóng. Không cần nền bao ngoài khi mẫu yêu cầu đơn giản. Thu nhỏ hình đồng đều, giữ nhãn đủ đọc, căn nhóm theo phần hình thực và chừa khoảng cách với chữ, kể cả dòng kết thúc.

## Build

Cần Typst, Python 3, GNU Make, font Times New Roman/Arial/Noto Sans/FreeSerif và bộ 9Slide trong `assets/fonts/dxt/` và bộ công cụ Poppler (`pdfinfo`, `pdftotext`). New Computer Modern Math được Typst cung cấp. Hình vector dùng các hàm vẽ gốc của Typst, không cần package bên ngoài.

Chạy từ gốc repo:

```sh
make list                                 # Liệt kê tài liệu và biến thể
make build                                # Build tất cả PDF
make build DOC=phan-boi-chau               # Chọn bằng đoạn tên duy nhất
make build DOC=buoi-10 VARIANT=de-cach
make build DOC=buoi-11                    # Bài giảng: 3 bản đề / dòng viết / đáp án
make help

# Cũng chấp nhận ID đầy đủ; DOCUMENT là alias tương thích của DOC
make build DOC="2026-10/Đề thi/phan-boi-chau-toan-12-giua-ky-1-ma-1108"
```

Makefile gọi `scripts/build.py` với `--font-path assets/fonts`, tìm tài liệu theo `documents/<tháng>/<loại>/<id>/main.typ`. Nếu manifest có `variants`, mỗi bản khai báo `filename` và `inputs` truyền vào Typst qua `sys.inputs`; nếu không, xuất `document.pdf`. Build cập nhật đường dẫn, số trang, byte và checksum trong `output` hoặc `outputs`. Build cố định creation timestamp theo ngày tiếp nhận trong manifest để cùng mã nguồn/toolchain cho checksum ổn định. PDF dùng chuẩn 1.5, nhúng font và giữ văn bản có thể chọn/tìm kiếm. Khi PDF thay đổi, trạng thái review là `pending` cho đến khi bản xuất được đối chiếu; phiên bản công cụ và kết quả kiểm tra lưu trong manifest.

## Quy trình và tiêu chí hoàn tất

1. Nhận/đổi tên nguồn, cập nhật manifest và các điểm thiếu/mờ của tài liệu.
2. Gõ nội dung Typst, đối chiếu từng ký tự với nguồn, dựng hình từ dữ kiện toán học.
3. Áp dụng template; kiểm tra bảng, lựa chọn, nhãn, khoảng cách, ngắt trang và header/footer.
4. Compile với root là thư mục kho; ghi phiên bản Typst/package/font và lệnh build để có thể tái tạo PDF.
5. Mở PDF và xem từng trang; đối chiếu nội dung, công thức, hình, numbering và thông tin đề. Cập nhật mapping/trạng thái rồi xuất vào `targets`.

Chỉ hoàn tất khi compile không lỗi, văn bản có thể chọn/tìm kiếm, hình được dựng sạch, nội dung đúng và đủ trong phạm vi đã thống nhất, không còn điểm mờ chưa xử lý ảnh hưởng đến phạm vi đó. Các trang dùng cùng thiết kế; mã nguồn đủ gọn để tái sử dụng.

## Tài liệu công cụ

- [Typst: bố cục trang, header/footer](https://typst.app/docs/guides/page-setup/).
- [Typst: xuất PDF](https://typst.app/docs/reference/pdf/).
- [CeTZ: vẽ hình trong Typst](https://cetz-package.github.io/).

Các hình cần hiển thị nét ổn định giữa trình đọc PDF có thể khai báo `figure_renders` trong manifest: `entry`, `output` (tương đối với thư mục tài liệu), `inputs`, `ppi`. Build dựng ảnh 600 dpi từ mã Typst trước khi biên dịch PDF; mã hình vector vẫn là nguồn chỉnh sửa. Áp dụng cho NBK (hình vuông tô màu, khay thóc), PBC (cửa sổ, téc nước, đèn led, quả cầu, chóp pyramid) và Buổi 11 (các mô hình không gian).

Header/footer đề thi dùng chung nằm ở `templates/exam-branding.typ`: header chữ đỏ thanh mảnh (Thầy Đỗ Xuân Thắng / Luyện thi 9+ Toán THPT 10.11.12), sát đường kẻ đỏ 1 pt; footer gồm icon website, Facebook, TikTok và mã đề thi, số trang tự động theo từng bản PDF. Không dùng dải đỏ hay logo DXT cho đề thi. Biểu tượng vector nằm tại `assets/branding/icons/`.

### Đồng bộ PDF lên Drive

```sh
make upload MONTH=2026-10 CATEGORY="Chuyên đề" DRY_RUN=1  # Xem mapping; không kết nối/ghi Drive
make upload MONTH=2026-10 CATEGORY="Chuyên đề"  # Upload cả nhóm
make upload MONTH=2026-10 DOC=buoi-10            # Upload 3 PDF của một bài
make upload MONTH=2026-10 DOC=buoi-11 VARIANT=dap-an
make build DOC=buoi-11            # Dựng lại
```

`make upload` đồng bộ một chiều các PDF đã build từ local lên Drive, dùng remote `dxt-gdrive` (đổi qua `REMOTE=...`). Folder cha của các tháng có ID `11EmKdVdsShhjyQpzlozlr8bEVDiThA8R`. Bắt buộc truyền `MONTH=YYYY-MM` để chọn tháng đích trên Drive. Script đọc Drive để lấy ID folder tháng và folder phân loại tương ứng; folder nào chưa có thì tạo rồi lấy ID để upload. Không cố định tháng hoặc ID folder tháng trong code. Nếu trùng tên folder cùng cấp thì dừng để tránh gửi sai nơi.

Local dùng `<YYYY-MM>/Chuyên đề/th-<document-id>/` (cả `documents`, `assets/sources`, `assets/targets`); folder tài liệu Đề thi không thêm `th-`. Tháng đích upload do `MONTH` quyết định, không đổi đường dẫn local hoặc ngày tiếp nhận trong manifest.

Trong tháng đích đã chọn, không chọn bộ lọc tài liệu thì upload tất cả; `CATEGORY` chọn nhóm, `DOC` chọn bài, `VARIANT` chọn một PDF. `MONTH` chỉ chọn nơi nhận trên Drive, không lọc tháng nguồn local. Giữ cách đặt tên hiển thị trên Drive, không thêm thư mục slug của từng bài. File cùng tên được cập nhật, file không đổi được bỏ qua; không xóa file khác trên Drive. Đây là copy có mapping tên, không phải `rclone sync --delete` hay đồng bộ hai chiều. Không tự upload khi build. Upload kiểm tra toàn bộ PDF tồn tại và checksum khớp manifest trước khi chạy; hãy build lại sau khi sửa mã nguồn. `DRY_RUN=1` chỉ in mapping local, không kiểm tra kết nối Drive.

Không cần lệnh clean: build ghi đè đầu ra hiện tại.

Tên local vẫn là `de.pdf`, `de-cach.pdf`, `dap-an.pdf`. Tên Drive được khai báo tường minh trong `drive.filenames` của từng manifest. Ví dụ Buổi 10:

- `KHÓA TH - BUỔI 10 - MIN - MAX HÌNH HỌC - ĐỀ.pdf`
- `KHÓA TH - BUỔI 10 - MIN - MAX HÌNH HỌC - ĐỀ CÁCH.pdf`
- `KHÓA TH - BUỔI 10 - MIN - MAX HÌNH HỌC - ĐÁP ÁN.pdf`


`assets/targets/` được Git bỏ qua. Không còn lệnh preview hoặc ảnh preview trang; ảnh hình học do `figure_renders` dựng vẫn cần cho PDF. Nguồn nằm trong `assets/sources/`, tài nguyên nhận diện trong `assets/branding/`.
