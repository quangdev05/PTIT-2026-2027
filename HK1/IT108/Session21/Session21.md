# TỔNG ÔN NHẬP MÔN CNTT – LESSON 01 ĐẾN LESSON 04
## Chủ đề: Tra cứu thông tin và kỹ năng gỡ lỗi cho Dev

> Tài liệu tóm tắt bằng ngôn ngữ dễ hiểu, tập trung vào ý chính để ôn tập nhanh.

---

# LESSON 01 – NGHỆ THUẬT “GOOGLING” CHO DEV

## 1. Bad Query và Good Query

- **Bad Query:** Gõ nguyên câu văn nói dài dòng, có nhiều từ thừa như “thầy ơi”, “giúp em với” → kết quả dễ bị nhiễu.
- **Good Query:** Chỉ giữ từ khóa quan trọng: **Tên ứng dụng + Mã lỗi + Hệ điều hành**.

Ví dụ:
- Bad: `Tại sao VS Code của em bị lỗi không mở được vậy?`
- Good: `VS Code "Permission denied" Windows 11`

## 2. Các toán tử tìm kiếm quan trọng

| Toán tử | Công dụng | Ví dụ |
|---|---|---|
| `site:` | Chỉ tìm trong website/tên miền được chỉ định | `site:stackoverflow.com Git` |
| `" "` | Tìm chính xác cụm từ, đúng thứ tự | `"Access is denied"` |
| `-` | Loại bỏ từ khóa không muốn thấy | `Python -crack` |
| `filetype:` | Lọc theo định dạng tệp | `filetype:pdf "Lập trình C"` |

**Lưu ý:** Viết liền tên miền sau `site:`, không thêm khoảng trắng. Ví dụ đúng: `site:edu.vn lịch thi`.

## 3. Kết hợp toán tử

- Tìm bài sửa lỗi: `site:stackoverflow.com "Permission denied" VS Code`
- Tìm tài liệu PDF: `filetype:pdf "Nhập môn CNTT"`
- Loại kết quả không liên quan: `cài Git Windows 11 -crack -quảng cáo`

**Search Operator:** Là ký hiệu/cú pháp đặc biệt giúp lọc và tìm thông tin chính xác hơn.

**Nhớ nhanh:** `site:` = giới hạn website | `" "` = tìm đúng cụm | `-` = loại bỏ | `filetype:` = lọc định dạng.

---

# LESSON 02 – ĐỌC HIỂU STACK OVERFLOW VÀ GITHUB ISSUES

## 1. Hai nền tảng dùng để làm gì?

- **StackOverflow:** Diễn đàn hỏi đáp giữa lập trình viên. Thường dùng khi gặp lỗi cú pháp, code, cấu hình hoặc logic.
- **GitHub Issues:** Nơi báo lỗi và trao đổi trực tiếp với nhóm phát triển phần mềm. Dùng khi lỗi nằm ở chính phần mềm hoặc cần theo dõi bản sửa lỗi.

## 2. Cách đọc StackOverflow nhanh

1. Kéo xuống phần **Answers**.
2. Tìm câu trả lời có dấu tích xanh (**Accepted Answer**) hoặc nhiều **Upvotes**.
3. Kiểm tra **Tags** như `git`, `vscode`, `windows-11` để chắc rằng đúng công nghệ và môi trường.
4. Đọc phần giải thích, xem lệnh trong **Code Block** rồi mới áp dụng.

- **Accepted Answer:** Câu trả lời được người hỏi xác nhận là giải quyết được vấn đề.
- **Upvotes:** Lượt bình chọn ủng hộ của cộng đồng.
- **Tags:** Thẻ cho biết bài viết liên quan đến công nghệ/phiên bản nào.

## 3. Đọc GitHub Issues và kiểm tra độ tin cậy

- **OPEN:** Vấn đề còn đang mở, có thể chưa được xử lý xong.
- **CLOSED:** Issue đã đóng; vẫn cần đọc nội dung để biết đã sửa hay đóng vì lý do khác.
- **Workaround:** Cách khắc phục tạm thời trong lúc chờ bản sửa chính thức.
- Ưu tiên bài viết còn mới, phù hợp phiên bản phần mềm đang dùng.
- Đọc bình luận và phản hồi của người dùng. Nếu có cảnh báo cách làm gây lỗi thêm thì không áp dụng máy móc.

## 4. So sánh nhanh

| Tiêu chí | StackOverflow | GitHub Issues |
|---|---|---|
| Mục đích | Hỏi đáp kỹ thuật | Báo lỗi, theo dõi lỗi phần mềm |
| Thường gặp | Sai code, cú pháp, cấu hình | Lỗi của chính phần mềm |
| Dấu hiệu cần xem | Accepted Answer, Upvotes, Tags | OPEN/CLOSED, Comments, Reactions |
| Cách xử lý | Tham khảo câu trả lời phù hợp | Theo dõi phản hồi, dùng workaround nếu cần |

**Nhớ nhanh:** StackOverflow = hỏi đáp/sửa code. GitHub Issues = báo lỗi phần mềm và trao đổi với nhà phát triển.

---

# LESSON 03 – GIẢI MÃ LỖI CÙNG TRỢ LÝ AI

## 1. AI giúp gì khi gặp lỗi?

AI có thể giải thích thông báo lỗi bằng ngôn ngữ dễ hiểu, phân tích nguyên nhân và hướng dẫn các bước xử lý. AI là công cụ hỗ trợ, không phải lúc nào cũng đúng.

## 2. AI Hallucination là gì?

Là hiện tượng AI đưa ra thông tin sai, tự tạo câu lệnh hoặc câu trả lời không có thật nhưng trình bày như thể chắc chắn.

## 3. Công thức Prompt 3 thành phần

| Thành phần | Ý nghĩa | Cần ghi gì? |
|---|---|---|
| **Context** | Bối cảnh | Phần mềm, hệ điều hành, phiên bản, việc đang làm |
| **Raw Error** | Lỗi nguyên văn | Sao chép chính xác thông báo lỗi |
| **Instruction** | Yêu cầu | Muốn AI giải thích hay hướng dẫn xử lý như thế nào |

Ví dụ prompt:

```text
Context: Tôi đang dùng VS Code trên Windows 11 để thực hành Git.
Raw Error: "fatal: not a git repository"
Instruction: Hãy giải thích nguyên nhân bằng tiếng Việt dễ hiểu
và hướng dẫn từng bước kiểm tra, khắc phục.
```

## 4. Một số lỗi thường gặp

- `Access is denied`: Có thể không đủ quyền truy cập hoặc ghi tệp.
- `fatal: not a git repository`: Đang đứng sai thư mục hoặc thư mục hiện tại chưa phải Git repository.
- `Port 3000 already in use`: Cổng 3000 đang được chương trình khác sử dụng.

## 5. Ba nguyên tắc an toàn khi dùng AI

1. **Không chạy lệnh mù quáng:** Hỏi rõ lệnh có tác dụng gì và kiểm tra trước khi chạy.
2. **Kiểm chứng câu trả lời:** Đối chiếu tài liệu chính thức, kiểm tra phiên bản phần mềm; cảnh giác với AI Hallucination.
3. **Bảo mật dữ liệu:** Không gửi mật khẩu, API Key, token hoặc thông tin riêng tư. Che/xóa dữ liệu nhạy cảm trước khi gửi.

**Nhớ nhanh:** Prompt = Context + Raw Error + Instruction. Dùng AI phải kiểm tra lệnh, kiểm chứng thông tin và giữ kín dữ liệu.

---

# LESSON 04 – FRAMEWORK ĐẶT CÂU HỎI KHI GẶP BUG

## 1. Vì sao không nên báo lỗi mù mờ?

Ví dụ: “Thầy ơi máy em bị lỗi rồi, giúp em với!”

Câu này thiếu thông tin về thiết bị, phần mềm, thao tác và thông báo lỗi. Người hỗ trợ phải hỏi đi hỏi lại nên mất thời gian và khó tìm nguyên nhân.

**Bug Reporting Framework** giúp mô tả lỗi rõ ràng, đủ dữ kiện để người khác kiểm tra và xử lý nhanh hơn.

## 2. Bốn thành phần của Bug Reporting Framework

| Thành phần | Ý nghĩa | Ví dụ |
|---|---|---|
| **Context** | Bối cảnh, môi trường đang dùng | Windows 11, Git phiên bản hiện tại |
| **Expected Behavior** | Kết quả mong muốn | Gõ `git init` để tạo Git repository |
| **Actual Behavior** | Kết quả thực tế xảy ra | Terminal báo không tìm thấy lệnh |
| **Log & Screenshot** | Thông báo lỗi và ảnh chụp | `git: command not found` + ảnh màn hình |

## 3. Các bước gửi ảnh lỗi

1. Chụp màn hình đúng lúc lỗi xảy ra.
2. Chụp rõ cửa sổ và thông báo lỗi.
3. Khoanh/đánh dấu đúng vị trí lỗi để người xem dễ nhận ra.
4. Che mật khẩu, tài khoản, API Key và dữ liệu riêng tư.
5. Gửi ảnh kèm mô tả các bước đã làm và thông báo lỗi nguyên văn.

Phím tắt:
- **Windows:** `Win + Shift + S`
- **macOS:** `Cmd + Shift + 4`

Không nên dùng điện thoại chụp lại màn hình máy tính vì ảnh thường khó đọc.

## 4. Mẫu báo lỗi có thể dùng ngay

```text
Em đang sử dụng [tên phần mềm] trên [hệ điều hành/phiên bản].

[Expected]
Em muốn: [kết quả mong muốn].

[Actual]
Thực tế: [hiện tượng đang xảy ra].

[Log]
Thông báo lỗi: "[chép nguyên văn lỗi]"

Em gửi kèm ảnh chụp màn hình và các bước đã thực hiện.
Nhờ anh/chị hướng dẫn cách kiểm tra và khắc phục ạ.
```

**Nhớ nhanh:** Bug Report = Context + Expected + Actual + Log/Screenshot.

---

# TỔNG HỢP 4 BÀI TRONG 1 BẢNG

| Bài | Nội dung chính | Từ khóa cần nhớ |
|---|---|---|
| Lesson 01 | Tìm kiếm Google đúng cách | Bad/Good Query, `site:`, `" "`, `-`, `filetype:` |
| Lesson 02 | Tìm và đánh giá cách sửa lỗi từ cộng đồng | StackOverflow, GitHub Issues, Accepted Answer, Upvotes, Workaround |
| Lesson 03 | Nhờ AI giải thích và xử lý lỗi | AI Hallucination, Context, Raw Error, Instruction |
| Lesson 04 | Báo lỗi rõ ràng, đủ thông tin | Context, Expected, Actual, Log, Screenshot |

## QUY TRÌNH GỠ LỖI GỢI Ý

1. **Tìm kiếm:** Bóc tách tên ứng dụng + mã lỗi + hệ điều hành, dùng toán tử Google.
2. **Tra cứu cộng đồng:** Kiểm tra StackOverflow hoặc GitHub Issues, chú ý phiên bản và độ mới.
3. **Nhờ AI hỗ trợ:** Cung cấp Context + Raw Error + Instruction.
4. **Kiểm tra an toàn:** Hiểu lệnh trước khi chạy, kiểm chứng thông tin và bảo mật dữ liệu.
5. **Báo lỗi nếu chưa xử lý được:** Gửi đủ Context + Expected + Actual + Log/Screenshot.

## TỰ KIỂM TRA TRƯỚC KHI THI

- [ ] Phân biệt được Bad Query và Good Query.
- [ ] Nhớ công dụng của `site:`, `" "`, `-`, `filetype:`.
- [ ] Phân biệt StackOverflow và GitHub Issues.
- [ ] Hiểu Accepted Answer, Upvotes, Tags, OPEN/CLOSED và Workaround.
- [ ] Giải thích được AI Hallucination.
- [ ] Nhớ công thức Prompt: Context + Raw Error + Instruction.
- [ ] Nhớ 3 nguyên tắc an toàn khi dùng AI.
- [ ] Nhớ 4 thành phần Bug Reporting: Context + Expected + Actual + Log.
- [ ] Biết cách chụp, đánh dấu và che thông tin nhạy cảm trong ảnh lỗi.

---

## MINDMAP DẠNG CÂY (BẢN TEXT)

```text
TỔNG ÔN: TRA CỨU & GỠ LỖI CHO DEV
|
|-- LESSON 01: GOOGLE
|   |-- Bad Query: câu dài, nhiều từ thừa
|   |-- Good Query: ứng dụng + mã lỗi + hệ điều hành
|   |-- site:      tìm trong website
|   |-- " "        tìm chính xác cụm từ
|   |-- -          loại từ khóa
|   `-- filetype:  lọc định dạng tệp
|
|-- LESSON 02: CỘNG ĐỒNG
|   |-- StackOverflow: hỏi đáp, sửa code/cấu hình
|   |-- GitHub Issues: báo lỗi phần mềm
|   |-- Accepted Answer: câu trả lời được xác nhận
|   |-- Upvotes: lượt bình chọn
|   |-- Tags: công nghệ/phiên bản
|   `-- Workaround: cách sửa tạm thời
|
|-- LESSON 03: TRỢ LÝ AI
|   |-- AI Hallucination: AI có thể bịa/sai
|   |-- Prompt
|   |   |-- Context: bối cảnh
|   |   |-- Raw Error: lỗi nguyên văn
|   |   `-- Instruction: yêu cầu
|   `-- An toàn
|       |-- Không chạy lệnh mù quáng
|       |-- Kiểm chứng câu trả lời
|       `-- Không lộ mật khẩu/API Key
|
`-- LESSON 04: BÁO BUG
    |-- Context: bối cảnh
    |-- Expected: mong muốn
    |-- Actual: thực tế
    `-- Log/Screenshot: thông báo lỗi + ảnh
        |-- Chụp rõ
        |-- Khoanh vùng
        `-- Che dữ liệu nhạy cảm
```

**Chốt lại:** Biết tìm đúng, biết đọc nguồn, biết hỏi AI và biết báo lỗi. Đây là 4 kỹ năng nối tiếp nhau khi Dev gặp sự cố.
