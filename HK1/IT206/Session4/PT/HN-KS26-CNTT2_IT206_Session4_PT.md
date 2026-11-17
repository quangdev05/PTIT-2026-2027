# BTVN Buổi 4: So sánh Trade-off các giải pháp ra lệnh

## 1. Đề xuất 2 prompt mẫu

### Giải pháp 1: Prompt đơn giản, ngắn gọn

```text
Bạn là trợ lý xử lý đơn hàng cho cửa hàng bán lẻ.

Hãy xử lý yêu cầu đặt hàng của khách theo các bước:
1. Đọc tin nhắn và trích xuất sản phẩm, số lượng, địa chỉ và số điện thoại.
2. Kiểm tra sản phẩm và tồn kho dựa trên dữ liệu cửa hàng cung cấp.
3. Nếu thiếu hoặc sai thông tin, hãy nêu rõ và yêu cầu khách bổ sung.
4. Tạo bản nháp phản hồi cho khách.
5. Tóm tắt kết quả để có thể tiếp tục xử lý ở lượt hội thoại sau.

Không tự suy đoán hoặc tạo dữ liệu không có trong đầu vào.
Không xác nhận đơn hàng nếu còn thiếu thông tin bắt buộc.

Trả kết quả theo cấu trúc:
- Thông tin đơn hàng
- Kết quả kiểm tra
- Thông tin còn thiếu
- Trạng thái xử lý
- Phản hồi dự kiến
- Tóm tắt ngữ cảnh

Dữ liệu đầu vào:
{{CUSTOMER_MESSAGE}}
{{PRODUCT_CATALOG}}
{{INVENTORY}}
{{STORE_RULES}}
```

### Giải pháp 2: Prompt chi tiết, có nhiều ràng buộc

```text
C - CONTEXT (Bối cảnh)
Cửa hàng bán lẻ nhận đơn hàng qua tin nhắn. Nhân viên cần trích xuất thông tin, kiểm tra sản phẩm và tồn kho, tạo phản hồi cho khách. Hội thoại có thể kéo dài hoặc bị gián đoạn; dữ liệu có thể thiếu, sai hoặc mâu thuẫn.

R - ROLE (Vai trò)
Bạn là trợ lý xử lý đơn hàng. Bạn phải làm việc chính xác, bảo toàn dữ liệu đầu vào và chỉ đưa ra kết luận dựa trên thông tin được cung cấp.

E - EXAMPLES (Ví dụ)
Tin nhắn:
"Mình muốn đặt 2 chuột không dây M01, giao đến 12 Nguyễn Trãi. Số điện thoại mình gửi sau."

Dữ liệu cửa hàng:
- M01: Chuột không dây, giá 150.000 VNĐ.
- Tồn kho M01: 5 sản phẩm.
- Quy định: Cần địa chỉ và số điện thoại trước khi xác nhận đơn.

Kết quả cần nhận diện:
- Sản phẩm: M01 – Chuột không dây.
- Số lượng: 2.
- Địa chỉ: 12 Nguyễn Trãi.
- Số điện thoại: chưa có.
- Trạng thái: cần bổ sung thông tin, chưa xác nhận đơn.

A - ACTION (Hành động)
Thực hiện lần lượt các công đoạn:

Bước 1: Trích xuất
- Xác định tên/mã sản phẩm, số lượng, địa chỉ và số điện thoại.
- Giữ nguyên thông tin khách cung cấp.
- Trường không xuất hiện phải để null.
- Nếu thông tin có nhiều cách hiểu, ghi vào danh sách ambiguities.

Bước 2: Kiểm tra
- Đối chiếu sản phẩm với danh mục.
- Kiểm tra số lượng là số nguyên dương.
- So sánh số lượng yêu cầu với tồn kho được cung cấp.
- Kiểm tra các thông tin bắt buộc theo quy định cửa hàng.
- Nếu không có dữ liệu tồn kho, đánh dấu stock_unverified.
- Nếu không tìm thấy sản phẩm, đánh dấu unknown_product.
- Nếu số lượng vượt tồn kho, đánh dấu out_of_stock.
- Không tự tạo giá, tồn kho hoặc thông tin khách hàng.

Bước 3: Xử lý kết quả
- Nếu thiếu thông tin, yêu cầu khách bổ sung đúng trường còn thiếu.
- Nếu dữ liệu sai hoặc mâu thuẫn, nêu rõ lỗi và đề xuất nhân viên kiểm tra.
- Nếu sản phẩm không đủ hàng, không xác nhận đơn.
- Nếu các điều kiện đã đạt, chỉ tạo bản nháp để nhân viên duyệt.
- Không tự tuyên bố đơn hàng đã được xác nhận.

Bước 4: Duy trì ngữ cảnh
- Tạo Context Snapshot gồm mã tác vụ, thông tin đơn hàng, dữ liệu đã xác minh, dữ liệu chưa xác minh, thông tin còn thiếu và hành động tiếp theo.
- Khi có tin nhắn mới, đọc Snapshot trước khi xử lý.
- Chỉ cập nhật trường bị ảnh hưởng bởi thông tin mới.
- Giữ nguyên dữ liệu đã xác minh nếu không có căn cứ thay đổi.
- Nếu thông tin mới mâu thuẫn dữ liệu cũ, ghi nhận mâu thuẫn và yêu cầu kiểm tra.

Bước 5: Tự kiểm tra đầu ra
- Kiểm tra số lượng sản phẩm đã trích xuất có khớp đầu vào.
- Kiểm tra không bỏ sót trường dữ liệu.
- Kiểm tra trạng thái đơn hàng phù hợp với lỗi và thông tin còn thiếu.
- Kiểm tra JSON hợp lệ trước khi trả kết quả.

T - TONE (Giọng điệu)
Chính xác, rõ ràng, chuyên nghiệp. Không trò chuyện ngoài nhiệm vụ.

E - EXPECTED OUTPUT (Đầu ra)
Chỉ trả về một JSON object hợp lệ, không Markdown, không code fence, không có văn bản ngoài JSON. Đúng cấu trúc:

{
  "order": {
    "items": [
      {
        "productCode": "M01",
        "productName": "Chuột không dây",
        "quantity": 2,
        "unitPrice": 150000,
        "stockStatus": "sufficient"
      }
    ],
    "deliveryAddress": "12 Nguyễn Trãi",
    "phone": null
  },
  "missingInformation": [
    "Số điện thoại người nhận"
  ],
  "ambiguities": [],
  "errors": [],
  "validationStatus": "needs_confirmation",
  "orderStatus": "pending",
  "replyDraft": "..."
  ,
  "contextSnapshot": {
    "taskId": "ORDER-001",
    "verifiedFacts": [],
    "unverifiedFacts": [],
    "nextAction": "..."
  }
}

Quy định:
- validationStatus chỉ sử dụng: "valid", "needs_confirmation", "invalid_data", "out_of_stock", "stock_unverified".
- orderStatus chỉ sử dụng: "pending", "ready_for_review", "not_accepted".
- Dùng null cho dữ liệu chưa được cung cấp.
- Không tự suy đoán, không tự sửa dữ liệu gốc.
- Chỉ dùng dữ liệu danh mục và tồn kho được truyền vào.
- Đơn hàng chưa được xác nhận chính thức bởi AI.

DỮ LIỆU ĐẦU VÀO:
Tin nhắn khách hàng:
{{CUSTOMER_MESSAGE}}

Danh mục sản phẩm:
{{PRODUCT_CATALOG}}

Tồn kho:
{{INVENTORY}}

Quy định cửa hàng:
{{STORE_RULES}}

Context Snapshot từ lượt trước (nếu có):
{{CONTEXT_SNAPSHOT}}
```

## 2. Bảng so sánh Trade-off

| Tiêu chí                  | Giải pháp 1 (Đơn giản)                                            | Giải pháp 2 (Chi tiết)                                |
| ------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------- |
| Độ dễ hiểu                | Cao, dễ đọc và dễ sử dụng                                         | Trung bình, nhiều quy tắc hơn                         |
| Độ dài prompt             | Ngắn                                                              | Dài                                                   |
| Lượng token               | Ít                                                                | Nhiều hơn                                             |
| Tốc độ triển khai         | Nhanh                                                             | Cần thời gian thiết kế và kiểm thử                    |
| Khả năng kiểm soát đầu ra | Cơ bản                                                            | Cao, có cấu trúc JSON cụ thể                          |
| Xử lý dữ liệu thiếu       | Có yêu cầu nhưng chưa mô tả sâu từng trường hợp                   | Có quy tắc riêng cho dữ liệu thiếu, sai và mâu thuẫn  |
| Chặn lỗi biên             | Trung bình                                                        | Tốt hơn nhờ các điều kiện kiểm tra                    |
| Prompt Chaining           | Mô tả quy trình chung, chưa tách rõ đầu vào/đầu ra từng công đoạn | Xác định rõ các công đoạn và kết quả cần giữ lại      |
| Xử lý đứt gãy ngữ cảnh    | Chỉ yêu cầu tóm tắt                                               | Có Context Snapshot và quy tắc cập nhật               |
| Khả năng bảo trì          | Dễ chỉnh sửa do ít quy tắc                                        | Cần cập nhật đồng bộ nhiều điều kiện                  |
| Phù hợp sử dụng           | Tác vụ đơn giản, ít rủi ro                                        | Quy trình nghiệp vụ cần độ nhất quán và kiểm soát cao |

## 3. Lựa chọn giải pháp và chạy thử

### 3.1. Lựa chọn

Chọn **Giải pháp 2 – Prompt chi tiết, có nhiều ràng buộc**.

**Lý do lựa chọn:**

- Bài toán có nhiều công đoạn nên cần quy định rõ thứ tự xử lý.
- Có thể kiểm soát các trường hợp thiếu dữ liệu, sai định dạng và mâu thuẫn.
- Context Snapshot giúp duy trì thông tin khi hội thoại bị gián đoạn.
- Đầu ra JSON thống nhất, thuận tiện cho việc kiểm tra và tích hợp với hệ thống.
- Hạn chế việc AI tự suy đoán hoặc xác nhận đơn hàng khi chưa đủ điều kiện.

Giải pháp 1 có ưu điểm là ngắn gọn và tiết kiệm token, nhưng chưa mô tả cụ thể cách xử lý từng trường hợp ngoại lệ. Vì vậy, giải pháp 2 phù hợp hơn với quy trình cần độ chính xác và tính nhất quán.

### 3.2. Dữ liệu chạy thử

**Tin nhắn khách hàng:**

"Mình muốn đặt 2 chuột không dây M01, giao đến 12 Nguyễn Trãi. Số điện thoại mình gửi sau nhé."

**Danh mục sản phẩm:**

| Mã sản phẩm | Tên sản phẩm    |     Giá bán |
| ----------- | --------------- | ----------: |
| M01         | Chuột không dây | 150.000 VNĐ |
| K02         | Bàn phím cơ     | 650.000 VNĐ |

**Tồn kho:**

| Mã sản phẩm | Số lượng tồn |
| ----------- | -----------: |
| M01         |            5 |
| K02         |            2 |

**Quy định cửa hàng:** Cần có địa chỉ và số điện thoại người nhận trước khi xác nhận đơn.

### 3.3. Kết quả chạy thử

```json
{
  "order": {
    "items": [
      {
        "productCode": "M01",
        "productName": "Chuột không dây",
        "quantity": 2,
        "unitPrice": 150000,
        "stockStatus": "sufficient"
      }
    ],
    "deliveryAddress": "12 Nguyễn Trãi",
    "phone": null
  },
  "missingInformation": ["Số điện thoại người nhận"],
  "ambiguities": [],
  "errors": [],
  "validationStatus": "needs_confirmation",
  "orderStatus": "pending",
  "replyDraft": "Cửa hàng đã ghi nhận yêu cầu đặt 2 chuột không dây M01 và địa chỉ giao hàng tại 12 Nguyễn Trãi. Sản phẩm hiện có đủ số lượng theo dữ liệu tồn kho được cung cấp. Bạn vui lòng gửi thêm số điện thoại người nhận để cửa hàng hoàn tất bước kiểm tra đơn hàng nhé!",
  "contextSnapshot": {
    "taskId": "ORDER-001",
    "verifiedFacts": [
      "Mã M01 có trong danh mục sản phẩm",
      "Số lượng yêu cầu là 2",
      "Tồn kho được cung cấp là 5 sản phẩm",
      "Địa chỉ giao hàng là 12 Nguyễn Trãi"
    ],
    "unverifiedFacts": ["Số điện thoại người nhận chưa được cung cấp"],
    "nextAction": "Chờ khách cung cấp số điện thoại"
  }
}
```
