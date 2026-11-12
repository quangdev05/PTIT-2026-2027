# Kỹ năng Prompting với AI – Buổi 1
## Tóm tắt 4 bài học từ tài liệu Rikkei Education

> Phạm vi: Lesson 1–4 trong `Session1.zip`. Các tên model, thông số context window và giá API trong tài liệu phản ánh thời điểm biên soạn; không nên xem là thông số hiện hành hoặc cố định.

---

## Lesson 1. LLM là gì? Sự khác biệt giữa các Model

### 1. LLM và cơ chế hoạt động
- **LLM (Large Language Model)**: mô hình ngôn ngữ lớn được huấn luyện trên lượng dữ liệu văn bản lớn để xử lý và tạo ngôn ngữ.
- Cơ chế cốt lõi: **Next-Token Prediction** – dự đoán token tiếp theo dựa trên ngữ cảnh trước đó.
- Quá trình dự đoán được lặp lại liên tục để tạo thành câu trả lời hoàn chỉnh.
- Vì vậy, câu trả lời trôi chảy không đồng nghĩa với việc mô hình luôn hiểu đúng hoặc luôn nói thật.

### 2. So sánh các mô hình trong tài liệu
| Mô hình (theo tài liệu) | Thế mạnh được nêu | Công việc phù hợp |
|---|---|---|
| ChatGPT / GPT-4o | Lập luận, bảng biểu, Excel, toán và lập trình | Phân tích số liệu, viết code, bài toán nhiều bước |
| Claude 3.5 Sonnet | Văn phong tự nhiên, đọc hiểu và tóm tắt tài liệu dài | Email, biên tập, tóm tắt hợp đồng |
| Gemini 1.5 Pro | Context Window lớn, xử lý đa phương thức | Tài liệu lớn, video, dữ liệu đa phương thức |

**Lưu ý:** Đây là so sánh theo phiên bản được đề cập trong bài học, không phải bảng xếp hạng các model mới nhất hiện nay.

### 3. Multimodal – AI đa phương thức
AI đa phương thức có thể tiếp nhận/xử lý nhiều dạng dữ liệu như:
- Text: văn bản
- Image: hình ảnh
- Audio: âm thanh
- Video: video
- Documents: tài liệu

### 4. Chọn model
Chọn model dựa trên **nhiệm vụ, loại dữ liệu, độ dài đầu vào, chất lượng cần thiết, tốc độ và chi phí**. Không có một model tối ưu cho mọi công việc.

**Ghi nhớ:** LLM → Next-Token Prediction; model khác nhau có thế mạnh khác nhau; Multimodal = nhiều loại dữ liệu.

---

## Lesson 2. Đạo đức trong sử dụng AI

### 1. Accountability – Trách nhiệm giải trình
- AI là mô hình tính toán, không có tư cách pháp nhân và không thể tự chịu trách nhiệm pháp lý, tài chính hay đạo đức.
- Người viết Prompt, kiểm tra, phê duyệt hoặc triển khai kết quả phải chịu trách nhiệm về cách sử dụng kết quả đó.
- Không được sao chép code AI sinh ra vào Production mà bỏ qua kiểm thử, Unit Test và Code Review.

### 2. Human-in-the-loop (HITL) – Con người kiểm soát
Con người phải tham gia giám sát, kiểm tra và phê duyệt ở những bước quan trọng. AI là công cụ hỗ trợ, không thay thế trách nhiệm chuyên môn của con người.

### 3. Academic Integrity – Liêm chính học thuật
- Dùng AI để giải thích kiến thức, gợi ý dàn ý, phản biện, rà lỗi hoặc hỗ trợ học tập một cách minh bạch.
- Không nhận nội dung AI tạo ra là hoàn toàn do mình làm; không đạo văn hoặc che giấu việc sử dụng AI khi quy định yêu cầu công khai.
- **AI Disclosure**: công khai việc đã dùng AI và phạm vi AI hỗ trợ khi cần.

### 4. Fairness – Công bằng và AI Bias
- **AI Bias**: kết quả thiên lệch do dữ liệu huấn luyện hoặc cách thiết kế/đánh giá mô hình.
- Cần kiểm tra định kiến, dùng tiêu chí khách quan, xem xét nhiều nhóm/góc nhìn và có người thẩm định.

### 5. Privacy – Quyền riêng tư
- **PII (Personally Identifiable Information)**: thông tin có thể nhận diện cá nhân, ví dụ họ tên, số điện thoại, CCCD, địa chỉ, thông tin tài khoản.
- **Anonymization**: ẩn danh/thay thế thông tin nhận diện trước khi đưa dữ liệu vào AI, ví dụ `Nguyễn Văn A` → `[KHÁCH_HÀNG_A]`.
- Không đưa dữ liệu nhạy cảm hoặc thông tin cá nhân không cần thiết vào công cụ AI.

**Ghi nhớ 4 trụ cột:** Accountability – Academic Integrity – Fairness – Privacy. HITL nhấn mạnh con người là chốt kiểm soát.

---

## Lesson 3. Token và Context Window

### 1. Token và Tokenization
- **Token** là đơn vị mà mô hình dùng để biểu diễn và xử lý văn bản; có thể là một từ, một phần của từ hoặc dấu câu.
- **Tokenization** là quá trình chia văn bản thành các token.
- Quy tắc ước lượng trong bài: **1.000 token ≈ 750 từ tiếng Anh**. Đây chỉ là ước lượng, không phải công thức chính xác cho mọi văn bản.

### 2. Vì sao tiếng Việt có thể tốn nhiều token?
Theo tài liệu:
- Nhiều mô hình có dữ liệu huấn luyện tiếng Anh lớn.
- Đặc điểm dấu thanh và cách biểu diễn Unicode có thể khiến tokenizer chia một số từ tiếng Việt thành nhiều mảnh.
- Vì thế, cùng nội dung, tiếng Việt có thể dùng nhiều token hơn và làm tăng chi phí API. Mức “2–3 lần” là ước lượng trong bài, không phải tỷ lệ cố định.

Ví dụ minh họa trong bài: cụm “Khuyến mãi cực lớn MartX” được mô tả là 5 từ nhưng có thể tách thành 9 token.

### 3. Context Window – Cửa sổ ngữ cảnh
- Là lượng token tối đa mô hình có thể tiếp nhận/xử lý trong một lượt ngữ cảnh.
- Có thể hình dung như dung tích của một chiếc cốc: hội thoại và tài liệu đưa vào càng nhiều thì càng chiếm dung lượng.
- Khi vượt giới hạn, mô hình có thể không còn xử lý được toàn bộ ngữ cảnh cũ.

### 4. Tối ưu Context Window
1. **Chat Summary**: tóm tắt nội dung cũ, giữ lại thông tin quan trọng.
2. **System Instructions**: viết chỉ dẫn rõ ràng, ngắn gọn, tránh lặp.
3. **Tối giản Prompt**: bỏ phần thừa, giữ yêu cầu và dữ liệu cần thiết.

### 5. Ví dụ tính chi phí MartX trong bài
Giả định 1.000 tin nhắn, mỗi tin 50 từ tiếng Việt, ước tính 2,2 token/từ:
- Một tin: `50 × 2,2 = 110 token`
- 1.000 tin: `110 × 1.000 = 110.000 token`
- Với mức giá giả định `0,002 USD / 1.000 token`: `110 × 0,002 = 0,22 USD`

Đây là phép tính minh họa theo giả định của bài học; giá API thực tế phụ thuộc model, loại token đầu vào/đầu ra và bảng giá tại thời điểm sử dụng.

**Ghi nhớ:** Token là đơn vị xử lý; Tokenization là phân tách; Context Window là giới hạn ngữ cảnh; dùng Summary và Prompt ngắn gọn để tiết kiệm.

---

## Lesson 4. Ảo giác AI (Hallucination) và cách khắc phục

### 1. Hallucination là gì?
**Hallucination** là hiện tượng AI tạo ra thông tin, con số, sự kiện hoặc điều khoản không có căn cứ nhưng trình bày trôi chảy và tự tin.

### 2. Nguyên nhân
- LLM dự đoán token tiếp theo, không tự động kiểm chứng mọi thông tin với thực tế.
- Khi thiếu dữ liệu hoặc ngữ cảnh, mô hình có thể tạo câu trả lời nghe hợp lý thay vì thừa nhận không biết.
- Vì vậy, cần đối chiếu câu trả lời với nguồn đáng tin cậy.

### 3. RAG và Grounding
- **RAG (Retrieval-Augmented Generation)**: kết hợp truy xuất thông tin từ nguồn dữ liệu với việc tạo câu trả lời.
- **Grounding**: yêu cầu câu trả lời bám vào tài liệu/nguồn được cung cấp.
- Cách làm: tải PDF/Excel hoặc dán nguồn gốc → yêu cầu chỉ dùng nguồn đó → yêu cầu nêu trang/điều khoản → nếu không có thông tin thì nói rõ không tìm thấy, không đoán.

### 4. Ví dụ hợp đồng MartX
Tài liệu nêu ví dụ AI trả lời sai rằng MartX mua 500 tấn rau với giá 15.000đ/kg, trong khi hợp đồng gốc ghi 200 tấn và 18.000đ/kg. Bài học: số liệu trong câu trả lời phải được kiểm tra trực tiếp với hợp đồng.

Ví dụ khác trong bài yêu cầu AI tra cứu mức phạt giao hàng chậm, chỉ trích dẫn PDF, nêu số trang và điều khoản; nếu tài liệu không quy định thì phải ghi “Tài liệu không quy định”.

### 5. Ba kỹ thuật hạn chế Hallucination
1. **Grounding**: cung cấp nguồn dữ liệu gốc và giới hạn câu trả lời trong nguồn đó.
2. **Allow AI to Refuse**: chỉ dẫn AI nói “không tìm thấy trong tài liệu” khi thiếu căn cứ, tuyệt đối không tự đoán.
3. **Cross-check**: dùng nguồn hoặc mô hình thứ hai để rà soát, sau đó con người đối chiếu tài liệu gốc.

**Ghi nhớ:** Câu trả lời tự tin chưa chắc đúng. RAG/Grounding giúp neo câu trả lời vào nguồn; Cross-check và kiểm tra của con người giúp phát hiện sai sót.

---

## Tổng kết nhanh – 4 bài liên kết với nhau

1. **Hiểu AI:** LLM tạo văn bản bằng Next-Token Prediction và có nhiều loại model/khả năng đa phương thức.
2. **Dùng AI có trách nhiệm:** con người chịu trách nhiệm, cần HITL, liêm chính, công bằng và bảo vệ dữ liệu.
3. **Hiểu giới hạn kỹ thuật:** token tiêu thụ dung lượng/chi phí; Context Window có giới hạn.
4. **Kiểm soát độ chính xác:** AI có thể Hallucination; dùng nguồn gốc, RAG/Grounding, cho phép từ chối và Cross-check.

## Bộ thuật ngữ cần thuộc

| Thuật ngữ | Nghĩa |
|---|---|
| LLM | Large Language Model – mô hình ngôn ngữ lớn |
| Next-Token Prediction | Dự đoán token tiếp theo |
| Multimodal | Đa phương thức |
| Accountability | Trách nhiệm giải trình |
| Human-in-the-loop (HITL) | Con người tham gia kiểm soát |
| Academic Integrity | Liêm chính học thuật |
| AI Disclosure | Công khai việc sử dụng AI |
| AI Bias | Thiên lệch/định kiến AI |
| PII | Thông tin nhận dạng cá nhân |
| Anonymization | Ẩn danh hóa |
| Tokenization | Phân tách văn bản thành token |
| Context Window | Cửa sổ ngữ cảnh |
| Chat Summary | Tóm tắt hội thoại |
| Hallucination | Ảo giác AI |
| RAG | Truy xuất tăng cường tạo sinh |
| Grounding | Neo câu trả lời vào nguồn |
| Cross-check | Kiểm tra chéo |

## Tự kiểm tra trước khi thi
- [ ] Giải thích được Next-Token Prediction.
- [ ] Nêu được điểm khác nhau và cách chọn model theo nhiệm vụ.
- [ ] Kể tên 4 trụ cột đạo đức AI và giải thích HITL.
- [ ] Phân biệt Token, Tokenization và Context Window.
- [ ] Tính được ví dụ 110.000 token và 0,22 USD theo giả định trong bài.
- [ ] Giải thích Hallucination, RAG/Grounding và Cross-check.
