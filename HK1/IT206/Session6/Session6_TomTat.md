# Tóm tắt Session 6 – Ứng dụng AI trong Học tập & Nghiên cứu

**Khóa học:** Kỹ năng Prompting với AI (Rikkei Education) · **Bối cảnh xuyên suốt:** Trường Đại học Công nghệ & Viện Nghiên cứu *TechEdu*

| Lesson | Chủ đề | Điểm bài đọc (TB) |
|---|---|---|
| 1 | Tóm tắt tài liệu vượt quá Context Window (Chunking, Map-Reduce) | 80.7/100 (Đạt) |
| 2 | Kỹ thuật Feynman Prompt | 82.7/100 (Đạt) |
| 3 | Xây dựng Rubric để AI chấm điểm, review, gợi ý sửa lỗi | 83.7/100 (Đạt) |

---

## Lesson 1 – Tóm tắt tài liệu vượt Context Window

**Vấn đề:** dán nguyên giáo trình PDF 300 trang (~150.000 từ) vào AI gây 2 sự cố:
1. **Tràn Context Window** → báo lỗi *Context length exceeded*.
2. **Lost in the Middle** (Liu et al., TACL 2024) → độ chính xác giảm theo **đường cong chữ U**: AI nhớ tốt phần đầu và cuối (hiệu ứng Primacy/Recency), kém ở phần giữa. Đây là suy giảm chú ý (attention degradation), không phải AI "bỏ qua hoàn toàn".

**Giải pháp: Chunking + Map-Reduce**
- **Chunking:** chia tài liệu thành các khối 10–15 trang, trọn vẹn ngữ nghĩa (thường mỗi chương một chunk).
- **MAP:** nạp từng chunk với *Extraction Prompt* trích xuất 4 tiêu chí (Mục tiêu, Thuật ngữ, Quy trình, Rủi ro).
- **REDUCE:** gom các bản tóm tắt ngắn vào một prompt cuối để tổng hợp thành báo cáo.

| Tiêu chí | Tóm tắt trực tiếp | Map-Reduce |
|---|---|---|
| Mất mát thông tin | Cao (Lost in the Middle) | Tối thiểu |
| Độ chi tiết | Chung chung, dễ ảo giác | Chính xác thuật ngữ, dễ kiểm chứng |

**Nạp tệp (Document Ingestion)**
- **PDF native** (văn bản số): parser trích xuất chuẩn ~100%. **PDF scan**: phải OCR → dễ sai công thức, số liệu, vỡ cột.
- **Bẫy dung lượng:** MB ≠ token. PDF text 3 MB có thể > 130.000 token; PDF đồ họa 25 MB có khi chỉ ~650 token. Hãy đo bằng số trang chữ và số token.

**4 quy tắc tiền xử lý**
1. Loại "rác" trang (bìa, tựa, mục lục, chỉ mục, trang trống).
2. Ưu tiên Markdown/Text.
3. Tách chương độc lập (Chunking).
4. Luôn kèm Extraction Prompt, không upload file trắng.

**Ví dụ TechEdu:** (1) giáo trình 300 trang → 10 chunk → báo cáo 3 trang so sánh Microservices vs Monolith (15 phút); (2) báo cáo việc làm IT 50 trang → lộ trình học 6 tháng; (3) 5 bài báo arXiv → bảng Markdown → chương Literature Review (tiết kiệm 80% thời gian).

**Lỗi thường gặp:** dán nguyên PDF không Chunking · prompt chung chung "tóm tắt file này" · bỏ qua giai đoạn REDUCE.

---

## Lesson 2 – Feynman Prompt

**Vấn đề:** *Bẫy ảo tưởng đã hiểu bài* (Illusion of Explanatory Depth) – đọc thụ động thấy quen nên tưởng đã hiểu, nhưng không tự giải thích được khi thi/phỏng vấn.

**Đảo ngược vai trò:** học viên là **người giảng**, AI là **người nghe tò mò + phản biện**; lỗ hổng lộ ra khi bị chất vấn → quay lại sách đọc lại.

| | Feynman | Socratic (Fallback) |
|---|---|---|
| Triết lý | Không giải thích được bằng lời đơn giản = chưa hiểu | Dạy học là thắp lửa bằng câu hỏi gợi mở |
| Vai AI | Curious Peer & Critical Reviewer | Gia sư gợi mở |
| Kích hoạt | Mặc định | Chỉ khi học viên bí ("Tôi quên mất") |
| Hành vi | Chất vấn, đòi ví dụ, tìm ngụy biện | Đưa 1 hint nhỏ, **không** đưa đáp án |

**Hỏi đáp thông thường vs Feynman:** học viên thụ động vs chủ động; AI là bách khoa toàn thư vs phản biện/Socratic; dễ mau quên vs lộ rõ lỗ hổng; câu trả lời dài vs mỗi lượt **đúng 1 câu hỏi**.

**2 rủi ro & Safe Feynman Protocol (3 lớp phòng hộ)**
- Rủi ro: **Sycophancy** (AI nịnh hót do RLHF) và **Hallucination** (AI bịa khái niệm để truy vấn).
- Lớp 1 – **Grounding:** dán nguồn chuẩn trong thẻ `<source_material>`.
- Lớp 2 – **Anti-Sycophancy:** cấm khen xã giao, đối chiếu từng câu với nguồn, chỉ ra mâu thuẫn bằng câu hỏi phản ví dụ.
- Lớp 3 – **Post-Session Audit:** AI lập *Knowledge Gap Matrix* kèm số trang/chương để tự kiểm chứng.

**Khung CREATE:** Context · Role · Explicit instructions · Ask clarifying · Tone · Example.

**Ví dụ TechEdu:** (1) RAM vs SSD (khả biến vs bất biến, ns vs µs, chi phí/mục đích); (2) Đa hình (Polymorphism) qua ẩn dụ nút Play, dẫn tới Dynamic Binding/v-table; (3) ACID trong chuyển tiền ngân hàng, phản ví dụ mất điện → Rollback/Atomicity.

**Lỗi thường gặp:** không dán `<source_material>` · thiếu chỉ thị cấm khen · cho AI hỏi dồn nhiều câu/lượt · bỏ qua bước mở sách đọc lại.

---

## Lesson 3 – Rubric cho AI chấm điểm & review

**Vấn đề:** hỏi "Hãy nhận xét bài này" → AI khen xã giao, bỏ sót lỗi (vd. chia cho 0 khi list rỗng). Giải pháp: cung cấp **Ma trận Rubric** có trọng số %.

**Ma trận A – Code Review:** Correctness & Logic 40% · Security & Robustness 20% · Clean Code & Conventions 20% · Efficiency & Complexity 20%.

**Ma trận B – Báo cáo kỹ thuật:** Technical Accuracy & Depth 40% · Architectural Trade-offs 20% · Empirical Evidence 20% · Structure & Markdown 20%.

**Actionable Feedback (3 phần):** Tọa độ lỗi (Location) → Cơ chế lỗi (Risk/Reason) → Bản vá (Fix/**Refactored Code Diff**, dòng cũ `-` / dòng mới `+`).

**4 rủi ro khi AI chấm điểm**

| Rủi ro | Biện pháp |
|---|---|
| Tính bất định (non-deterministic) | `temperature: 0.0` + Few-shot Calibration (bài chấm mẫu) |
| Verbosity Bias (ưu ái bài dài, hoa mỹ) | Rubric định lượng, thang trừ điểm cụ thể |
| Prompt Injection trong bài nộp | Bọc bài nộp trong `<student_submission>` / `<student_code>`, coi là dữ liệu thô |
| Thiếu bối cảnh con người | **Human-in-the-Loop** |

**Human-in-the-Loop:** điểm số là quyết định hệ quả lớn; AI chỉ là *trợ lý sơ loại* (first-pass reviewer). Giảng viên thẩm định ca nghi vấn, **spot-check 15–20%** bài và ký duyệt điểm chính thức.

**Ví dụ TechEdu:** (1) chấm Python bằng CREATE + Few-shot Anchor + JSON Schema (`total_score`, `breakdown`, `issues`, `actionable_diff`), độ ổn định > 95% trên 100 bài; (2) review Clean Code C++ (đổi `x`, `y` → `student_age`, `cumulative_gpa`); (3) sơ loại 100 bài luận Monolith vs Microservices thành nhóm A/B/C, gắn cờ 18 bài nhóm C, spot-check 15 bài A/B → tiết kiệm 70% thời gian.

**Lỗi thường gặp:** tin tuyệt đối điểm AI · không có Few-shot Anchor · không yêu cầu Refactored Diff · không dùng delimiters cô lập bài nộp.

---

## Tổng kết nhanh

| Kỹ thuật | Giải quyết | Từ khóa |
|---|---|---|
| Chunking + Map-Reduce | Tài liệu dài, Lost in the Middle | Chunk 10–15 trang, Extraction Prompt, MAP/REDUCE |
| Feynman Prompt | Ảo tưởng đã hiểu bài | Đảo vai, 1 câu hỏi/lượt, Socratic Fallback, 3 lớp phòng hộ |
| Rubric + Human-in-the-Loop | Review/chấm điểm cảm tính, thiếu nhất quán | Rubric %, Actionable Feedback, temp 0.0, Few-shot, delimiters |
