# Stage ôn tập: Markdown & Tài liệu kỹ thuật

> Bản dễ hiểu, dùng để ôn nhanh trước khi thực hành.

## 1. Mindmap toàn Stage

```text
MARKDOWN
├── 1. Bản chất
│   ├── Plain Text + ký hiệu đánh dấu
│   ├── File thường có đuôi .md
│   ├── Dễ đọc, dễ sửa, dễ so sánh bằng Git Diff
│   └── Parser đọc cú pháp và dựng nội dung hiển thị
├── 2. Cú pháp cơ bản
│   ├── Heading: # đến ######
│   ├── Đậm / nghiêng / gạch ngang
│   ├── List, link, ảnh
│   └── Blockquote, đường kẻ ngang
├── 3. Cú pháp nâng cao
│   ├── Fenced code block + tên ngôn ngữ
│   ├── Table
│   ├── Task list
│   └── Escape ký tự đặc biệt
├── 4. GitHub / README
│   ├── Giới thiệu dự án
│   ├── Hướng dẫn cài đặt và chạy
│   ├── Danh sách tính năng
│   └── Công nghệ / dependencies / đóng góp
└── 5. AI & kho tri thức
    ├── Prompt: Bối cảnh + Nhiệm vụ + Yêu cầu
    ├── Thêm định dạng đầu ra và giới hạn nếu cần
    ├── Kiểm chứng câu trả lời
    └── Lưu kiến thức thành tệp .md
```

## 2. Nhớ nhanh

- **Markdown** là cách viết tài liệu bằng văn bản thuần, dùng ký hiệu đơn giản để chỉ cấu trúc.
- **Parser** đọc cú pháp Markdown, thường chuyển thành HTML hoặc cấu trúc tương đương để hiển thị.
- **Git Diff** dễ so sánh file `.md` vì nội dung là văn bản theo dòng.
- **README.md** là trang giới thiệu dự án và hướng dẫn cách cài đặt/sử dụng.
- **Markdown trong prompt** giúp chia yêu cầu rõ ràng hơn, nhưng không bảo đảm AI luôn đúng.

## 3. Cú pháp cơ bản

| Mục đích | Cú pháp |
|---|---|
| H1 | `# Tiêu đề` |
| H2 | `## Tiêu đề` |
| H3 | `### Tiêu đề` |
| In đậm | `**chữ đậm**` |
| In nghiêng | `*chữ nghiêng*` |
| Gạch ngang chữ | `~~chữ cũ~~` (thường được hỗ trợ trong GFM) |
| Danh sách | `- Mục` |
| Danh sách số | `1. Bước` |
| Liên kết | `[Tên hiển thị](https://example.com)` |
| Ảnh | `![Mô tả ảnh](https://example.com/image.png)` |
| Trích dẫn | `> Nội dung trích dẫn` |
| Đường kẻ ngang | `---` |
| Code trong câu | `` `git status` `` |

**Nhớ:** có dấu cách sau `#`. Ví dụ: `## Cài đặt`.

## 4. Cú pháp nâng cao

### Code block

Dùng ba dấu backtick ở đầu/cuối, có thể thêm ngôn ngữ để tô màu cú pháp:

````markdown
```python
def tinh_trung_binh(diem):
    return sum(diem) / len(diem)
```
````

- Mã nhiều dòng hoặc cần giữ thụt lề: dùng code block.
- Mã ngắn trong câu: dùng inline code như `` `print()` ``.

### Bảng

```markdown
| Thành phần | Mục đích |
|---|---|
| README | Giới thiệu dự án |
| Code block | Trình bày mã nguồn |
```

### Task list (được hỗ trợ trên GitHub/GFM)

```markdown
- [x] Đã hoàn thành
- [ ] Chưa hoàn thành
```

### Escape ký tự

Dùng dấu gạch chéo ngược `\` trước một số ký tự đặc biệt khi muốn hiển thị nó thay vì để parser xử lý như cú pháp. Ví dụ: `\\*không in nghiêng\\*`.

## 5. README.md: khung 5 phần

1. **Tên dự án:** tên và mô tả ngắn.
2. **Giới thiệu:** dự án làm gì, giải quyết vấn đề gì, dành cho ai.
3. **Quick Start:** yêu cầu môi trường và lệnh cài/chạy.
4. **Tính năng:** liệt kê chức năng chính, có thể kèm task list.
5. **Công nghệ / Dependencies / Đóng góp:** thư viện, phiên bản, cách báo lỗi hoặc tham gia.

### Mẫu cực ngắn

````markdown
# Ten Du An

Mo ta ngan: du an giai quyet van de gi.

## Tinh nang
- [x] Tinh nang da xong
- [ ] Tinh nang dang lam

## Cai dat
```bash
git clone <URL_REPO>
cd <TEN_THU_MUC>
```

## Cong nghe
- Ngon ngu: ...
- Thu vien: ...

## Dong gop
Mo issue hoac tao pull request neu muon dong gop.
````

## 6. Markdown khi viết prompt cho AI

Khung dễ nhớ: **Bối cảnh + Nhiệm vụ + Yêu cầu**. Khi cần, thêm mục **Giới hạn** và **Định dạng đầu ra**.

```markdown
## Bối cảnh
Tôi là sinh viên CNTT mới học PowerShell.

## Nhiệm vụ
Giải thích pipeline trong PowerShell.

## Yêu cầu
- Dùng ngôn ngữ đời thường.
- Cho 2 ví dụ chạy được.
- Nêu khác biệt giữa PowerShell và CMD.
- Trình bày ngắn gọn bằng bảng và gạch đầu dòng.

## Giới hạn
Không giả định tôi đã biết thuật ngữ nâng cao.
```

Quy trình lưu kho tri thức:

1. Yêu cầu AI trả lời có cấu trúc.
2. Đọc lại và kiểm chứng thông tin quan trọng.
3. Lưu thành file `.md` với tên dễ tìm, ví dụ `powershell_pipeline.md`.
4. Chia thư mục theo môn/chủ đề; dùng Git nếu cần lịch sử chỉnh sửa.

## 7. Các điểm dễ bị hỏi

- Markdown **không phải ngôn ngữ lập trình**; nó là cú pháp đánh dấu văn bản.
- Markdown ra đời năm 2004 từ công trình của John Gruber, có đóng góp của Aaron Swartz.
- Markdown không có một cách mở rộng duy nhất cho mọi nơi; nền tảng có thể hỗ trợ khác nhau.
- **CommonMark** chuẩn hóa một tập cú pháp chung; **GFM** dựa trên CommonMark và bổ sung tính năng như bảng, task list và gạch ngang chữ.
- Không có cơ sở để khẳng định Markdown luôn tiết kiệm 75% token hay làm AI nhanh gấp đôi. Token phụ thuộc nội dung và tokenizer.
- Heading và danh sách giúp prompt dễ hiểu hơn, nhưng không loại bỏ hoàn toàn ảo giác AI.
- Một H1 là quy ước tốt cho tài liệu chính, không phải luật tuyệt đối trong mọi file.

## 8. Câu hỏi tự kiểm tra

1. **Markdown là gì?** Cách viết tài liệu bằng văn bản thuần và các ký hiệu đánh dấu.
2. **Parser làm gì?** Đọc cú pháp và chuyển nó thành cấu trúc hiển thị.
3. **Vì sao `.md` hợp với Git?** Dễ so sánh theo dòng và theo dõi lịch sử.
4. **Cú pháp H2 là gì?** `## Tiêu đề`.
5. **Khi nào dùng code block?** Với mã nhiều dòng hoặc cần giữ thụt lề.
6. **README dùng làm gì?** Giới thiệu dự án và hướng dẫn cài đặt/sử dụng.
7. **Khung prompt dễ nhớ?** Bối cảnh + Nhiệm vụ + Yêu cầu.
8. **Markdown có khiến AI hết ảo giác không?** Không. Nó chỉ giúp tổ chức yêu cầu rõ hơn.

## 9. Tài liệu tham khảo

- CommonMark Spec: https://spec.commonmark.org/
- GitHub Docs: https://docs.github.com/en/get-started/writing-on-github
- OpenAI Prompt Engineering: https://developers.openai.com/api/docs/guides/prompt-engineering
- John Gruber Markdown: https://daringfireball.net/projects/markdown/
