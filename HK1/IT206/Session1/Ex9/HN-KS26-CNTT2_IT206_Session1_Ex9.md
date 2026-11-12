# Bài 9 - RAG Grounding dập tắt ảo giác hợp đồng

## Phần 1. Phân tích nguyên nhân ảo giác

LLM tạo câu trả lời bằng cách dự đoán chuỗi từ có khả năng xuất hiện tiếp theo; nó không mặc nhiên biết quy định riêng trong hợp đồng MartX và cũng không tự xác minh câu trả lời với nguồn gốc. Khi người hỏi không cung cấp hợp đồng, mô hình dựa vào mẫu ngôn ngữ và kiến thức chung, rồi có thể tạo ra con số nghe hợp lý nhưng không có căn cứ. Cách diễn đạt tự tin không chứng minh nội dung đúng.

Trong tình huống này, con số “phạt 20% và đình chỉ nhập 30 ngày” không xuất hiện trong dữ liệu được nêu. Điều khoản thực tế quy định phạt 5% giá trị lô bị dập nát và đổi hàng trong 24 giờ. RAG Grounding đưa điều khoản làm nguồn vào ngữ cảnh, yêu cầu trả lời dựa trên chính nguồn đó; Negative Constraint yêu cầu từ chối kết luận khi nguồn không có thông tin. Người dùng vẫn cần kiểm tra trích dẫn với hợp đồng gốc trước khi ra quyết định.

## Phần 2. Prompt RAG hoàn chỉnh

```text
[VAI TRÒ]
Bạn là trợ lý tra cứu hợp đồng của MartX. Chỉ trả lời dựa trên văn bản hợp đồng được cung cấp bên dưới. Không dùng kiến thức chung hoặc quy định từ nguồn khác để bổ sung.

[1. VĂN BẢN HỢP ĐỒNG CHUẨN – NGUỒN GROUNDING]
“Trường hợp nhà cung cấp giao hàng có tỷ lệ rau bị dập nát trên 10%, nhà cung cấp chịu phạt 5% giá trị lô hàng bị dập nát và phải đổi hàng trong vòng 24 giờ.”

[2. CÂU HỎI NGHIỆP VỤ]
Theo điều khoản trên, nếu tỷ lệ rau bị dập nát trên 10% thì mức phạt được tính như thế nào và nhà cung cấp phải làm gì, trong thời hạn bao lâu? Nêu rõ căn cứ là câu nào trong văn bản.

[3. NEGATIVE CONSTRAINT – KHÓA AN TOÀN]
- Nếu thông tin không có trong văn bản, tuyệt đối trả lời đúng câu: “Không có dữ liệu trong tài liệu”. Không tự suy đoán, không viện dẫn thông lệ thị trường hoặc luật bên ngoài.
- Không đổi “giá trị lô hàng bị dập nát” thành “tổng giá trị đơn hàng”.
- Không thêm hình thức phạt, đình chỉ, thời hạn hay điều kiện không được nêu.
- Trích lại đúng căn cứ liên quan. Nếu câu hỏi có nhiều phần, trả lời phần có căn cứ và đánh dấu riêng phần không có dữ liệu.

[ĐỊNH DẠNG TRẢ LỜI]
Kết luận: ...
Căn cứ trong hợp đồng: “...”
Thông tin không có trong tài liệu (nếu có): ...
```

### Kết quả mong đợi với nguồn trên

- **Mức phạt:** 5% giá trị lô hàng bị dập nát.
- **Biện pháp và thời hạn:** Đổi hàng trong vòng 24 giờ.
- **Không được kết luận:** Phạt 20% tổng đơn hàng hoặc đình chỉ nhập 30 ngày, vì hợp đồng không nêu các nội dung đó.
