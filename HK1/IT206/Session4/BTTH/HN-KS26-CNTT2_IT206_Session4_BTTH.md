# BÀI TẬP THỰC HÀNH TỔNG HỢP

## Session 04: Kỹ thuật Prompting Nâng cao (Logic & Chuỗi)

## 1. Bối cảnh bài toán

Xây dựng giải pháp ứng dụng AI để xử lý đơn hàng cho cửa hàng bán lẻ trực tuyến.

Khách hàng gửi yêu cầu đặt hàng thông qua hội thoại. Hệ thống cần phân tích thông tin, kiểm tra tính hợp lệ, tạo phản hồi và lưu trạng thái để tiếp tục xử lý khi hội thoại bị gián đoạn.

**Các kỹ thuật áp dụng:**

- **Chain-of-Thought (CoT):** Phân tích yêu cầu theo từng bước logic.
- **Prompt Chaining:** Chia quy trình xử lý thành nhiều Prompt liên kết.
- **Context Snapshot:** Lưu trạng thái để khôi phục ngữ cảnh.

## 2. Thiết kế quy trình xử lý

Quy trình gồm 4 bước:

| Bước | Nhiệm vụ                     | Đầu ra             |
| ---- | ---------------------------- | ------------------ |
| 1    | Phân tích yêu cầu khách hàng | Thông tin đơn hàng |
| 2    | Kiểm tra dữ liệu và tồn kho  | Kết quả xác thực   |
| 3    | Tạo phản hồi khách hàng      | Nội dung phản hồi  |
| 4    | Lưu và khôi phục ngữ cảnh    | Context Snapshot   |

## 3. Prompt thực thi

### 3.1. Prompt 1: Phân tích yêu cầu

**Prompt:**

```text
# C - CONTEXT
Bạn là hệ thống tiếp nhận đơn hàng cho cửa hàng bán lẻ.

# R - ROLE
Bạn có nhiệm vụ phân tích tin nhắn khách hàng và trích xuất
thông tin đặt hàng.

# E - EXAMPLE
Ví dụ:
"Tôi muốn mua 2 sản phẩm mã M01"
Kết quả: productCode = M01, quantity = 2.

# A - ACTION
1. Xác định mã sản phẩm.
2. Xác định số lượng.
3. Xác định địa chỉ giao hàng.
4. Xác định số điện thoại.
5. Liệt kê thông tin còn thiếu.
6. Không tự suy đoán dữ liệu.

# T - OUTPUT
Chỉ trả về JSON hợp lệ:

{
  "productCode": "string hoặc null",
  "quantity": "number hoặc null",
  "address": "string hoặc null",
  "phone": "string hoặc null",
  "missingFields": [],
  "status": "complete hoặc incomplete"
}
```

**Dữ liệu đầu vào:**

```text
Tôi muốn mua 2 chuột không dây mã M01.
Giao hàng đến 12 Nguyễn Trãi.
Số điện thoại tôi sẽ gửi sau.
```

**Kết quả đầu ra:**

```json
{
  "productCode": "M01",
  "quantity": 2,
  "address": "12 Nguyễn Trãi",
  "phone": null,
  "missingFields": ["phone"],
  "status": "incomplete"
}
```

### 3.2. Prompt 2: Kiểm tra và xác thực dữ liệu

**Prompt:**

```text
# C - CONTEXT
Bạn là hệ thống kiểm tra dữ liệu đơn hàng.

# R - ROLE
Bạn có nhiệm vụ xác thực thông tin đơn hàng.

# E - EXAMPLE
Mã M01 tồn tại, giá 150000đ, tồn kho 5 sản phẩm.

# A - ACTION
1. Kiểm tra mã sản phẩm.
2. Kiểm tra số lượng đặt hàng.
3. Kiểm tra tồn kho.
4. Kiểm tra địa chỉ và số điện thoại.
5. Tính tổng tiền.
6. Ghi nhận lỗi nếu dữ liệu không hợp lệ.

# T - OUTPUT
Trả về JSON:

{
  "productValid": true,
  "quantityValid": true,
  "stockAvailable": true,
  "addressValid": true,
  "phoneValid": false,
  "totalPrice": 0,
  "errors": [],
  "status": "valid hoặc invalid hoặc pending"
}
```

**Dữ liệu đầu vào:**

```json
{
  "productCode": "M01",
  "quantity": 2,
  "address": "12 Nguyễn Trãi",
  "phone": null
}
```

**Kết quả đầu ra:**

```json
{
  "productValid": true,
  "quantityValid": true,
  "stockAvailable": true,
  "addressValid": true,
  "phoneValid": false,
  "totalPrice": 300000,
  "errors": ["Thiếu số điện thoại khách hàng"],
  "status": "pending"
}
```

### 3.3. Prompt 3: Tạo phản hồi khách hàng

**Prompt:**

```text
# C - CONTEXT
Bạn là trợ lý chăm sóc khách hàng của cửa hàng.

# R - ROLE
Bạn có nhiệm vụ tạo phản hồi dựa trên kết quả xác thực.

# E - EXAMPLE
Nếu thiếu số điện thoại, yêu cầu khách hàng bổ sung.

# A - ACTION
1. Đọc kết quả xác thực.
2. Xác định trạng thái đơn hàng.
3. Tạo phản hồi lịch sự, ngắn gọn.
4. Không xác nhận đơn hàng khi còn thiếu thông tin.

# T - OUTPUT
Trả về JSON:

{
  "orderStatus": "pending",
  "replyDraft": "",
  "staffNote": "",
  "nextAction": ""
}
```

**Dữ liệu đầu vào:** Kết quả xác thực từ Prompt 2.

**Kết quả đầu ra:**

```json
{
  "orderStatus": "pending",
  "replyDraft": "Cửa hàng đã tiếp nhận yêu cầu đặt 2 chuột không dây mã M01 với tổng giá trị dự kiến 300.000đ. Bạn vui lòng cung cấp số điện thoại để hoàn tất việc kiểm tra đơn hàng nhé!",
  "staffNote": "Đơn hàng còn thiếu số điện thoại, chưa được xác nhận.",
  "nextAction": "Chờ khách hàng bổ sung số điện thoại"
}
```

### 3.4. Prompt 4: Lưu và khôi phục ngữ cảnh

**Prompt:**

```text
# C - CONTEXT
Bạn là hệ thống quản lý trạng thái hội thoại đặt hàng.

# R - ROLE
Bạn có nhiệm vụ lưu và khôi phục thông tin đơn hàng.

# E - EXAMPLE
Snapshot cũ có phone = null.
Tin nhắn mới cung cấp phone = 0987654321.
Chỉ cập nhật trường phone.

# A - ACTION
1. Đọc Context Snapshot trước đó.
2. Đọc tin nhắn mới.
3. Đối chiếu thông tin.
4. Chỉ cập nhật trường có dữ liệu mới.
5. Giữ nguyên các trường không thay đổi.
6. Kiểm tra lại thông tin còn thiếu.

# T - OUTPUT
Trả về JSON:

{
  "contextSnapshot": {},
  "updatedFields": [],
  "remainingMissingFields": [],
  "status": "pending hoặc ready_for_review"
}
```

**Dữ liệu đầu vào:**

```json
{
  "productCode": "M01",
  "quantity": 2,
  "address": "12 Nguyễn Trãi",
  "phone": null,
  "totalPrice": 300000
}
```

Tin nhắn mới:

```text
Số điện thoại của tôi là 0987654321.
```

**Kết quả đầu ra:**

```json
{
  "contextSnapshot": {
    "productCode": "M01",
    "quantity": 2,
    "address": "12 Nguyễn Trãi",
    "phone": "0987654321",
    "totalPrice": 300000
  },
  "updatedFields": ["phone"],
  "remainingMissingFields": [],
  "status": "ready_for_review"
}
```

## 4. Kiểm tra kết quả

| STT | Nội dung kiểm tra                  | Kết quả |
| --- | ---------------------------------- | ------- |
| 1   | Trích xuất đúng mã sản phẩm        | Đạt     |
| 2   | Trích xuất đúng số lượng           | Đạt     |
| 3   | Phát hiện thông tin còn thiếu      | Đạt     |
| 4   | Kiểm tra tồn kho và tổng tiền      | Đạt     |
| 5   | Tạo phản hồi phù hợp               | Đạt     |
| 6   | Lưu và khôi phục ngữ cảnh          | Đạt     |
| 7   | Giữ nguyên dữ liệu cũ khi cập nhật | Đạt     |
| 8   | Trả về dữ liệu JSON                | Đạt     |

**Kiểm tra dữ liệu không hợp lệ:**

Ví dụ khách hàng đặt số lượng âm hoặc sử dụng mã sản phẩm không tồn tại, hệ thống phải trả về lỗi tương ứng thay vì tiếp tục xác nhận đơn hàng.

```json
{
  "productCode": "ABC99",
  "quantity": -2,
  "errors": ["Mã sản phẩm không tồn tại", "Số lượng phải lớn hơn 0"],
  "status": "invalid"
}
```
