# BÀI 2: TÀI LIỆU KỸ THUẬT HỆ THỐNG TƯỚI TỰ ĐỘNG

## Phần 1: Báo cáo phân tích (I/O)

- **Input (Văn bản thô - Chưa chuẩn hóa):**
  - **Đặc điểm:** Văn bản giải thích, câu lệnh Terminal, đoạn code Python và các ghi chú cắm dây bị trộn lẫn chung một kiểu chữ thô (Plain Text).
  - **Rủi ro lớn:** Kỹ sư vận hành rất dễ copy nhầm cả câu giải thích vào Terminal dẫn đến báo lỗi command not found; các ký tự đặc biệt như `*` (dùng trong lập lịch) hay `#` (dùng trong ghi chú) bị hiểu nhầm thành định dạng in đậm hoặc tiêu đề, làm sai lệch câu lệnh.

- **Output (Giao diện Render chuyên nghiệp bằng Markdown):**
  - **Sử dụng Inline Code (`code`):** Bao bọc các câu lệnh ngắn, đường dẫn file, tên biến số hoặc giá trị đo đạc. Giúp câu lệnh nổi bật hẳn lên trên nền chữ giải thích.
  - **Sử dụng Code Block (```python):** Khối code được tô màu cú pháp (Syntax Highlighting) phân biệt rõ từ khóa, chuỗi, biến số và comment, cực kỳ dễ đọc và dễ bảo trì.
  - **Sử dụng Bảng (Table):** Gom nhóm dữ liệu sơ đồ cắm chân GPIO và bảng so sánh thiết bị một cách trực quan, ngăn nắp.
  - **Sử dụng Task List (`- [ ]` / `- [x]`):** Tạo danh sách công việc kiểm tra thiết bị thực tế tại trang trại Lan, hỗ trợ kỹ sư tích chọn từng bước.
  - **Xử lý Bẫy dữ liệu (Escape character `\`):** Dùng Dấu gạch chéo ngược `\` đứng trước các ký tự `*` hoặc `#` để giữ nguyên định dạng câu lệnh gốc.

## Phần 2: Source code

### Khối code Python

```python
Đây là code Python.
```

### Bảng so sánh

| Tiêu chí so sánh | Cảm biến DHT11 (Loại cũ) | Cảm biến DHT22 / AM2302 (Loại mới) | Đánh giá thực tế |
| :--------------- | :----------------------- | :--------------------------------- | :--------------- |

### Task List kiểm tra thiết bị

- [x] Task 1
- [x] Task 2
- [x] Task 3
- [ ] Task 4
- [ ] Task 5
