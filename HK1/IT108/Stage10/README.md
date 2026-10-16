# BÀI 1: CHUẨN HOÁ TÀI LIỆU MARKDOWN CHO DỰ ÁN

## Phần 1. Phân tích

Đoạn mã trên chứa **3 lỗi cú pháp** chính:

### Lỗi 1 – Nhảy cấp heading từ H1 xuống H3

- **Dòng lỗi:** `### Danh sách các loại rau`
- **Giải thích:** Ngay sau heading `# ` (H1), đoạn mã dùng `### ` (H3) mà bỏ qua `## ` (H2). Theo quy tắc phân cấp heading trong Markdown, các cấp phải đi liên tục H1 -> H2 -> H3, không được nhảy cấp. Ngoài ra, theo best practice.
- **Kết quả render:** Trình duyệt/trình đọc Markdown vẫn hiển thị được H3 nhưng cấu trúc mục lục bị sai logic, phá vỡ tính phân cấp của tài liệu và ảnh hưởng đến khả năng truy cập.

### Lỗi 2 – Cú pháp nhúng ảnh sai

- **Dòng lỗi:** `[Logo Dự án] (https://greentech.vn/logo.png)`
- **Giải thích:** Lỗi này mắc 2 sai sót cùng lúc:
  1. **Thiếu dấu `!` trước ngoặc vuông:** Cú pháp chèn ảnh trong Markdown là `![text](url)`, bắt đầu bằng dấu chấm than `!`. Nếu thiếu `!`, Markdown hiểu đây là một hyperlink chứ không phải hình ảnh.
  2. **Có khoảng trắng giữa `]` và `(`:** Markdown yêu cầu phần `[text]` và `(url)` phải viết liền nhau, không có khoảng trắng. Khoảng trắng thừa khiến trình phân tích cú pháp không nhận diện được đây là link/ảnh, và render ra dạng văn bản thuần.
- **Kết quả render:** Thay vì hiển thị hình ảnh logo, trình duyệt sẽ hiển thị nguyên đoạn text `[Logo Dự án] (https://greentech.vn/logo.png)` dưới dạng chữ thường.

### Lỗi 3 – Dùng sai cú pháp in đậm (bold)

- **Dòng lỗi:** `*Rất quan trọng`
- **Giải thích:** Để in đậm trong Markdown cần dùng 2 dấu sao bao quanh: `**text**`. Đoạn mã chỉ dùng 1 dấu sao `*`, đây là cú pháp in nghiêng, không phải in đậm. Hơn nữa, thiếu dấu `*` đóng ở cuối nên cú pháp cũng không hoàn chỉnh.
- **Kết quả render:** Văn bản sẽ bị hiển thị nghiêng hoặc không được định dạng gì cả (tuỳ trình phân tích), chắc chắn không phải chữ đậm như mong muốn.

---

## Phần 2. Hoàn thiện

Đoạn mã chuẩn đã được sửa lại:

```markdown
# Lợi ích của rau sạch

## Danh sách các loại rau

![Logo Dự án](https://greentech.vn/logo.png)

**Rất quan trọng**
```
