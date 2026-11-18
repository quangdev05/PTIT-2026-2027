# Tóm tắt Session 4 – Kỹ thuật Prompting Nâng cao

**Khóa học:** Kỹ năng Prompting với AI (Rikkei Education) · **Bối cảnh xuyên suốt:** Tập đoàn Công nghệ & Logistics *FastDelivery*

| Lesson | Chủ đề | Điểm bài đọc (TB) |
|---|---|---|
| 1 | Chain-of-Thought (CoT) – "suy nghĩ từng bước" | 73.3/100 (Đạt) |
| 2 | Prompt Chaining – chia nhỏ một Task/Prompt | 71.7/100 (Đạt) |
| 3 | Xử lý đứt gãy ngữ cảnh & duy trì tính nhất quán | 85/100 (Đạt) |

---

## Lesson 1 – Chain-of-Thought (CoT)

**Vấn đề:** hỏi trực tiếp một bài toán đa bước (vd. tổng chi phí 50 xe container Bắc–Nam) khiến LLM "đoán mò" con số vì mặc định dự đoán từ tiếp theo quá nhanh → sai lệch 20–30%.

**Bản chất:** CoT cho AI một "khoảng nháp" (scratchpad) để phân rã bài toán thành các bước nhỏ, tuần tự, rồi mới kết luận → chuyển từ chế độ phản xạ sang chế độ suy luận logic, giảm ảo giác.

**Hai cách kích hoạt**
- **Zero-shot CoT:** thêm câu *"Let's think step by step"* (Kojima et al., 2022).
- **Few-shot CoT:** đưa 2–3 ví dụ mẫu có sẵn bước giải thích trung gian (Wei et al., 2022, Google Brain).

**Khi nào nên / không nên dùng**

| Nhóm tác vụ | NÊN dùng CoT | KHÔNG nên |
|---|---|---|
| Toán & tài chính | Tính định mức nhiên liệu, phụ phí, phân bổ ngân sách nhiều biến | Phép tính đơn giản (1+1, đổi đơn vị) |
| Logic & nghiệp vụ | Suy luận điều kiện lồng nhau, kiểm tra hợp đồng | Tra cứu sự thật tĩnh (mã vùng, thủ đô) |
| Ngôn ngữ | Phân tích nguyên nhân gốc (5 Whys), gỡ lỗi quy trình | Dịch, tóm tắt ngắn, sửa chính tả |
| Kích thước mô hình | Mô hình lớn (> 50B tham số) | Mô hình rất nhỏ (< 7B) → dễ ngụy biện logic |

**Đánh đổi:** Direct prompt ≈ 5–10 output tokens, ~0.3 s; CoT ≈ 400–800 output tokens, 3–5 s → chi phí cao hơn hàng chục lần (output token đắt gấp 2–4 lần input). *Chỉ dùng CoT khi giá trị độ chính xác lớn hơn chi phí và thời gian chờ.*

| Tiêu chí | Direct Prompting | CoT |
|---|---|---|
| Cơ chế | Phản xạ tức thì | Nháp trung gian, lập luận từng bước |
| Độ chính xác | ~60%, dễ ảo giác | 95–99%, minh bạch `reasoning_path` |
| Token / Chi phí | Rất thấp | Cao hơn 20–40 lần |
| Độ trễ | < 1 s | 3–6 s |

**Ví dụ FastDelivery:** (1) tính chi phí vận tải 50 xe → 1.200 USD/xe, tổng 60.000 USD; (2) phân bổ 1.000 kiện vào 3 kho theo Zipcode → giảm 95% sai sót; (3) RCA 5 Whys vụ chậm hàng không → nguyên nhân gốc là nhãn mã vạch bị mờ.

**Lỗi thường gặp**
1. Dùng CoT cho tác vụ đơn giản/tra cứu tĩnh → lan man, ảo giác, tốn token.
2. Ngụy biện trong chuỗi lập luận (Faithfulness) → cần cross-validation từng bước.
3. Không quy định định dạng kết luận ở dòng cuối → nên yêu cầu `[RESULT: ...]`.

---

## Lesson 2 – Prompt Chaining

**Vấn đề:** dồn ~10 yêu cầu vào một **Mega Prompt** làm quá tải Context Window, AI mất tập trung, bỏ sót chi tiết, kết quả hời hợt.

**Nguyên lý (như dây chuyền sản xuất):** Output của Prompt trước → Input của Prompt sau qua **Data Handoff**.
1. **Task Decomposition** – phân rã bài toán thành các mắt xích đơn nhiệm.
2. **Data Handoff** – chuyển dữ liệu ở dạng sạch (JSON/Markdown).
3. **Pipeline Execution** – code điều phối tự động, kiểm định, ghi log.

**Phân biệt 3 cấp độ**

| Phương pháp | Cách vận hành | Số lần gọi API | Phù hợp |
|---|---|---|---|
| CoT | AI tự nghĩ từng bước trong 1 câu trả lời | 1 | Logic, tính toán |
| Single Prompt phân bước | 1 prompt có "Bước 1, 2, 3…" | 1 | Độ phức tạp trung bình, cần nhanh/rẻ |
| Prompt Chaining | Nhiều trạm độc lập nối qua Data Handoff | Nhiều | Quy trình doanh nghiệp phức tạp |

**5 lợi ích cốt lõi**
1. **Validation Gates** – chốt chặn kiểm định (Regex, Pydantic) giữa các trạm.
2. **Modularity** – cô lập lỗi, sửa đúng 1 prompt.
3. **Model Routing** – model rẻ cho phân loại, model mạnh cho viết → tiết kiệm 60–80% chi phí.
4. **Tích hợp Code & Data** – SQL, API, Python xen giữa các trạm.
5. **Human-in-the-Loop** – người duyệt ở khâu then chốt (vd. đền bù > 10 triệu đồng).

**Ưu điểm:** tập trung cao, kiểm soát chất lượng từng chặng, tối ưu chi phí, dễ tích hợp.
**Nhược điểm:** độ trễ tích lũy (T = t₁ + t₂ + t₃), tốn token hơn (nạp lại System Prompt), lỗi lan truyền (cascading errors), gánh nặng kỹ thuật điều phối.

**Nên dùng khi:** nhiều bước độc lập, cần kiểm định cao, cần tra DB hoặc người duyệt.
**Không nên dùng khi:** cần phản hồi realtime < 1–2 s, ngân sách API hạn hẹp, tác vụ chỉ 1–2 bước.

**Ví dụ FastDelivery:** (1) xử lý thư khiếu nại 3 bước: phân loại JSON → tra chính sách đền bù → soạn email (30 phút → 5 giây); (2) kiểm toán hóa đơn nhiên liệu: model mini trích xuất → validation bằng Python → model pro đối soát GPS (giảm 75% chi phí API).

**Lỗi thường gặp**
1. Handoff rác (câu chào xã giao lẫn vào dữ liệu) → ép trả Pure JSON / strip bằng code.
2. Thiếu chốt chặn → lỗi lan truyền → cần Validation Gate sau mỗi trạm quan trọng.
3. Over-chaining (chia 8–10 trạm cho bài đơn giản) → trễ và tốn ngân sách.

---

## Lesson 3 – Xử lý đứt gãy ngữ cảnh & duy trì nhất quán

**Hai thông số khác nhau**

| Tiêu chí | Max Output Tokens | Context Window |
|---|---|---|
| Bản chất | Số token tối đa AI sinh trong **một lượt** | Tổng bộ nhớ của **toàn phiên chat** |
| Dung lượng điển hình | 2.048 – 4.096 tokens | 32.000 – 128.000+ tokens |
| Sự cố | Phản hồi bị ngắt quãng (Truncated Response) | Trôi dạt ngữ cảnh (Context Drift) sau 30–50 lượt |
| Giải pháp | Continue Prompting | Rolling Summary, Context Anchoring, Session Reset |

**Continue Prompting:** không gõ cộc lốc "Tiếp tục" (dễ lặp, vỡ thụt lề). Hãy copy **3–5 từ cuối** trước điểm ngắt và ra lệnh *"Hãy viết tiếp ngay sau cụm từ: […]"*.

**3 chiến lược chống Context Drift**
1. **Rolling Summary** – cứ 8–10 lượt, nhờ AI tóm tắt các quyết định đã chốt (nén ~80% dung lượng).
2. **Context Anchoring** – nhắc lại vai trò/mục tiêu cốt lõi trong các prompt quan trọng (thẻ `[Neo bối cảnh]`).
3. **Session Reset** – sau > 30 lượt hoặc khi AI chậm/nhớ sai, chép bản tóm tắt sang phiên chat mới.

**Ví dụ FastDelivery:** (1) nối script Python 200 dòng bị ngắt ở dòng 120; (2) phiên chat logistics 50 lượt → Rolling Summary + Session Reset; (3) 20 bài truyền thông giữ nguyên giọng thương hiệu nhờ Context Anchoring.

**Lỗi thường gặp**
1. Chỉ gõ "Tiếp tục".
2. Kéo phiên chat quá 100 lượt mà không tóm tắt.
3. Quên neo lại vai trò → AI trở về văn phong trung tính mặc định.

---

## Tổng kết nhanh

| Kỹ thuật | Giải quyết vấn đề gì | Từ khóa nhớ |
|---|---|---|
| CoT | AI đoán mò khi tính toán/suy luận đa bước | Scratchpad, "Let's think step by step" |
| Prompt Chaining | Mega Prompt quá tải | Data Handoff, Validation Gate, Model Routing |
| Continue Prompting | Phản hồi bị cắt do Max Output Tokens | Mớm 3–5 từ cuối |
| Rolling Summary / Anchoring / Reset | Context Drift trong chat dài | Tóm tắt – Neo – Làm sạch phiên |
