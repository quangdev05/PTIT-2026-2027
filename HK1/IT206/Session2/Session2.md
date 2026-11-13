# SESSION 2 – ZERO-SHOT VS FEW-SHOT PROMPTING
## Sức mạnh của việc cung cấp ví dụ mẫu (Examples)

## 1. Tổng quan bài học
Session 2 giới thiệu cách sử dụng **ví dụ mẫu (Examples)** trong Prompt để định hướng cách AI xử lý yêu cầu và tạo đầu ra đúng cấu trúc. Thay vì chỉ mô tả bằng lời, người dùng có thể đưa một số cặp **Input – Output** tiêu biểu để mô hình nhận diện quy luật và làm theo.

Bối cảnh xuyên suốt bài học là TechShop cần tự động phân loại 1.000 đánh giá sản phẩm thành ba nhãn cố định:
- `[TÍCH_CỰC]`
- `[TIÊU_CỰC]`
- `[CẦN_HỖ_TRỢ]`

Nếu không quy định mẫu đầu ra rõ ràng, AI có thể trả về nhiều cách diễn đạt khác nhau, gây khó khăn khi đồng bộ dữ liệu vào phần mềm quản lý.

## 2. Ba cấp độ Prompting theo số lượng ví dụ

| Kỹ thuật | Số ví dụ | Đặc điểm | Trường hợp phù hợp |
|---|---:|---|---|
| **Zero-shot Prompting** | 0 | Chỉ đưa yêu cầu, không có ví dụ. AI tự suy luận cách thực hiện. | Hỏi đáp thông thường, tác vụ đơn giản, nội dung tự do. |
| **One-shot Prompting** | 1 | Cung cấp một ví dụ để AI hình dung định dạng hoặc cách làm. | Chuyển đổi văn bản ngắn, trích xuất một vài trường dữ liệu. |
| **Few-shot Prompting** | Thường 2–5 | Cung cấp nhiều ví dụ tiêu biểu để AI nhận diện quy luật và bắt chước mẫu. | Phân loại dữ liệu, trích xuất JSON, chuẩn hóa nội dung theo quy chuẩn. |

**Cần nhớ:** số lượng ví dụ không tự động bảo đảm độ chính xác. Chất lượng, tính đại diện và sự nhất quán của ví dụ mới là yếu tố quan trọng. Các tỷ lệ 60%, 80% và 99% trong tài liệu là số liệu minh họa cho tình huống học tập, không phải cam kết chính xác áp dụng cho mọi mô hình hay tác vụ.

### 2.1. Zero-shot Prompting
- Không cung cấp ví dụ mẫu.
- AI dựa vào chỉ dẫn và kiến thức đã học để tạo kết quả.
- Ưu điểm: Prompt ngắn, tiết kiệm token, triển khai nhanh.
- Hạn chế: Có thể diễn giải yêu cầu theo nhiều cách hoặc không giữ đúng định dạng mong muốn.

### 2.2. One-shot Prompting
- Cung cấp đúng một ví dụ Input – Output.
- Giúp AI hiểu sơ bộ quy tắc, phong cách hoặc cấu trúc đầu ra.
- Phù hợp với tác vụ có quy tắc đơn giản, ít trường hợp ngoại lệ.

### 2.3. Few-shot Prompting
- Cung cấp một tập nhỏ ví dụ mẫu, thường khoảng 2–5 ví dụ.
- Mỗi ví dụ minh họa cách chuyển đổi từ Input sang Output đúng chuẩn.
- AI dựa vào các mẫu trong Prompt để suy ra quy luật và áp dụng cho dữ liệu mới.
- Đặc biệt hữu ích khi cần đầu ra có cấu trúc ổn định, nhãn cố định hoặc phong cách thống nhất.

## 3. Cơ chế In-Context Learning
**In-Context Learning (học trong ngữ cảnh)** là khả năng mô hình sử dụng thông tin và ví dụ được cung cấp ngay trong Prompt hoặc ngữ cảnh hội thoại để thực hiện tác vụ.

Quy trình khái quát:
1. Người dùng cung cấp chỉ dẫn và ví dụ mẫu.
2. Mô hình phân tích mối quan hệ giữa Input và Output trong các ví dụ.
3. Mô hình nhận diện quy luật hoặc khuôn mẫu.
4. Mô hình áp dụng quy luật đó cho dữ liệu mới.

Điểm quan trọng: Few-shot Prompting **không đồng nghĩa với huấn luyện lại (retraining) hay tinh chỉnh mô hình (fine-tuning)**. Các ví dụ chỉ định hướng mô hình trong ngữ cảnh hiện tại; chúng không tự động thay đổi trọng số mô hình.

## 4. Ứng dụng thực tế tại TechShop

### 4.1. Phân loại phản hồi khách hàng
Mục tiêu: phân loại review vào một trong ba nhãn cố định.

Ví dụ mẫu:
- Input: “Pin dùng rất lâu” → Output: `[TÍCH_CỰC]`
- Input: “Máy không lên nguồn” → Output: `[CẦN_HỖ_TRỢ]`
- Input: “Chuột hơi nhỏ so với tay” → Output: `[TIÊU_CỰC]`

Khi nhận review mới, AI dựa vào ví dụ để chọn nhãn phù hợp. Nhãn cố định giúp dữ liệu dễ thống kê, lọc và tích hợp vào hệ thống quản lý.

### 4.2. Chuyển thông số kỹ thuật thành lợi ích người dùng
Few-shot có thể hướng AI diễn giải thông số bằng ngôn ngữ gần gũi với khách hàng.

Ví dụ:
- Thông số: `RAM 16GB DDR5` → Lợi ích: có thể mở nhiều ứng dụng và tab trình duyệt thuận tiện hơn.
- Thông số: `SSD NVMe 1TB` → Lợi ích: dung lượng lưu trữ lớn và tốc độ truy xuất dữ liệu nhanh.

Lưu ý: nội dung lợi ích phải phù hợp thông số thực tế; không nên đưa ra con số hiệu năng hoặc cam kết không có căn cứ.

### 4.3. Chuẩn hóa tiêu đề truyền thông
Cung cấp một vài tiêu đề mẫu giúp AI tuân thủ:
- Cấu trúc tiền tố thương hiệu.
- Quy tắc viết hoa.
- Cách dùng biểu tượng (icon).
- Cách trình bày ưu đãi và thông điệp.

Ứng dụng này giúp nội dung đồng nhất với nhận diện thương hiệu (Brand Identity).

## 5. Quy trình xây dựng Few-shot Prompt hiệu quả
1. **Xác định tác vụ:** phân loại, trích xuất, chuyển đổi hay tạo nội dung.
2. **Quy định đầu ra:** nêu rõ nhãn, trường dữ liệu, định dạng và giới hạn.
3. **Chọn ví dụ đại diện:** sử dụng khoảng 2–5 trường hợp tiêu biểu, phản ánh đúng các tình huống thường gặp.
4. **Đảm bảo nhất quán:** mọi ví dụ phải tuân thủ cùng một quy tắc và định dạng.
5. **Đưa dữ liệu mới vào xử lý:** yêu cầu AI áp dụng đúng quy luật đã minh họa.
6. **Kiểm tra kết quả:** đối chiếu đầu ra với tiêu chí, sửa Prompt nếu phát hiện lỗi.

## 6. Lỗi thường gặp và cách khắc phục

| Lỗi | Nguyên nhân | Cách khắc phục |
|---|---|---|
| Ví dụ mâu thuẫn hoặc sai định dạng | Các mẫu dùng quy tắc, nhãn hoặc cách trình bày không đồng nhất. | Chuẩn hóa và rà soát toàn bộ ví dụ trước khi sử dụng. |
| Đưa quá nhiều ví dụ | Làm Prompt dài, tiêu tốn token và chiếm dụng Context Window. | Chọn ít ví dụ nhưng có tính đại diện cao; bắt đầu với 2–5 mẫu rồi đánh giá. |
| Ví dụ không cùng tác vụ với yêu cầu | Mẫu minh họa một loại nhiệm vụ nhưng yêu cầu thực tế lại là nhiệm vụ khác. | Đảm bảo ví dụ và yêu cầu cuối cùng cùng mục tiêu, cùng logic xử lý. |

### Một số thuật ngữ cần phân biệt
- **Token:** đơn vị văn bản mà mô hình xử lý; không tương đương chính xác với một từ.
- **Context Window (cửa sổ ngữ cảnh):** lượng token mô hình có thể tiếp nhận và sử dụng trong một lần xử lý.
- **Input:** dữ liệu đầu vào.
- **Output:** kết quả đầu ra.
- **Label (nhãn):** giá trị phân loại được gán cho dữ liệu.
- **Accuracy (độ chính xác):** tỷ lệ dự đoán đúng trên tổng số trường hợp được đánh giá.
- **Fine-tuning:** quá trình tinh chỉnh mô hình bằng dữ liệu huấn luyện bổ sung, khác với việc chỉ đưa ví dụ vào Prompt.

## 7. Kết luận – ghi nhớ nhanh
- **Zero-shot:** không ví dụ, chỉ có chỉ dẫn.
- **One-shot:** một ví dụ để định hướng.
- **Few-shot:** một số ví dụ mẫu, thường 2–5, để AI nhận diện quy luật.
- **In-Context Learning:** học quy luật từ thông tin nằm trong ngữ cảnh Prompt, không cần huấn luyện lại mô hình.
- Few-shot phù hợp khi cần **phân loại nhất quán, trích xuất dữ liệu có cấu trúc và chuẩn hóa nội dung**.
- Ưu tiên ví dụ **đúng, rõ ràng, đại diện và nhất quán** thay vì nhồi nhét số lượng lớn.

## 8. Câu hỏi tự kiểm tra
1. Zero-shot, One-shot và Few-shot khác nhau ở điểm nào?
2. Vì sao Few-shot có thể giúp dữ liệu đầu ra nhất quán hơn?
3. In-Context Learning có phải là Fine-tuning không? Giải thích.
4. Vì sao ví dụ mẫu mâu thuẫn có thể làm giảm chất lượng kết quả?
5. Trong trường hợp nào nên dùng Few-shot thay vì Zero-shot?
