# Bài thực hành 6: Chuẩn hóa dữ liệu sinh viên thành JSON

## 1. Prompt theo khung CREATE

```text
C - CONTEXT (Bối cảnh)
Phòng đào tạo nhận danh sách sinh viên từ nhiều nguồn và cần chuẩn hóa trước khi nhập hệ thống quản lý. Đầu vào gồm các dòng văn bản có thể không đồng nhất. Mỗi dòng biểu diễn một sinh viên.

R - ROLE (Vai trò)
Bạn là trợ lý xử lý dữ liệu của phòng đào tạo. Bạn phải bảo toàn nguyên trạng thông tin nhận diện được và tuyệt đối không tự suy đoán hay bổ sung dữ liệu.

E - EXAMPLES (Ví dụ)
Đầu vào: "Nguyễn Văn An - an.nguyen@gmail.com - đang học"
Diễn giải:
- fullName = "Nguyễn Văn An"
- email = "an.nguyen@gmail.com"
- status = "đang học"

Đầu vào: "Vũ Minh K - k.vu@gmail.com - trạng thái chưa rõ"
Đầu ra tương ứng:
{"fullName":"Vũ Minh K","email":"k.vu@gmail.com","status":"UNKNOWN"}

A - ACTION (Hành động)
1. Đọc từng bản ghi đầu vào và trích xuất họ tên, email, trạng thái.
2. Chuẩn hóa tên trường thành fullName, email, status.
3. status chỉ được là một trong ba chuỗi chính xác: "đang học", "bảo lưu", "nghỉ học". Nếu thiếu, mơ hồ hoặc không thể xác định trường nào thì điền "UNKNOWN" cho trường đó.
4. Không tự sửa hoặc suy ra họ tên/email. Giữ nguyên giá trị nhận diện được; trường không xác định dùng "UNKNOWN".
5. Không được làm mất hay gộp bản ghi. Mỗi dòng sinh viên đầu vào phải tương ứng đúng một object trong students.
6. Đếm số object đã tạo. Trước khi xuất, kiểm tra totalRecords bằng đúng số object trong students và bằng số bản ghi sinh viên đầu vào. Nếu đếm chưa khớp, rà soát lại rồi mới trả kết quả.

T - TONE (Giọng điệu)
Không trò chuyện, không giải thích, chỉ xuất dữ liệu theo yêu cầu.

E - EXPECTED OUTPUT (Đầu ra)
Chỉ trả về một JSON object hợp lệ, không Markdown, không code fence, không văn bản ngoài JSON. Đúng cấu trúc:
{
  "students": [
    {
      "fullName": "Nguyễn Văn An",
      "email": "an.nguyen@gmail.com",
      "status": "đang học"
    }
  ],
  "totalRecords": 1
}
Mỗi object chỉ có đúng ba khóa fullName, email, status. totalRecords là số nguyên. Dùng JSON string cho các giá trị văn bản; dùng "UNKNOWN" cho thông tin không xác định.

Dữ liệu đầu vào:
{{STUDENT_DATA}}
```

## 2. Kết quả chuẩn hóa dữ liệu đã cho

Đếm trước khi xuất: có 4 dòng sinh viên. Sau khi tạo JSON, mảng `students` có 4 object; `totalRecords` cũng bằng 4.

```json
{
  "students": [
    {
      "fullName": "Nguyễn Văn An",
      "email": "an.nguyen@gmail.com",
      "status": "đang học"
    },
    {
      "fullName": "Trần Thị Bình",
      "email": "binhtt@gmail.com",
      "status": "bảo lưu"
    },
    {
      "fullName": "Lê Hoàng Nam",
      "email": "nam.le@gmail.com",
      "status": "đang học"
    },
    {
      "fullName": "Phạm Minh Đức",
      "email": "duc.pham@gmail.com",
      "status": "nghỉ học"
    }
  ],
  "totalRecords": 4
}
```

## 3. Kiểm tra yêu cầu

- Đủ 4/4 bản ghi, không mất sinh viên nào.
- Mỗi object có đúng các trường `fullName`, `email`, `status`.
- Các trạng thái nằm trong tập giá trị cho phép.
- `totalRecords` là 4, khớp số phần tử của `students`.
- Không bổ sung dữ liệu ngoài đầu vào.
