# Bài 5 - Tối ưu quy trình hỗ trợ kỹ thuật nội bộ

## Kiến trúc đề xuất

```text
Thành viên gặp lỗi
       │
       ▼
Tra cứu bắt buộc: Google → cộng đồng → AI để giải thích
       │ chưa giải quyết
       ▼
Tạo Bug Report theo mẫu → đăng vào kênh/ticket có thể tìm kiếm
       │
       ▼
Người hỗ trợ tái hiện, đề xuất bước nhỏ, ghi lại kết quả
       │
       ▼
Đóng ticket + cập nhật kho tri thức / FAQ
```

Dùng một kênh hỗ trợ hoặc hệ thống ticket làm nơi lưu báo cáo có thể tìm kiếm; tránh xử lý duy nhất qua chat trôi dòng. Gắn nhãn theo chủ đề (Docker, port, quyền, mạng), trạng thái và người phụ trách. Trước khi đăng, tìm kiếm kho tri thức/ticket cũ. Chỉ người được phân công mới đánh dấu đã xử lý và cập nhật cách khắc phục.

## Mẫu Bug Report bắt buộc

```markdown
### Tiêu đề

[Môi trường/thành phần] Tóm tắt lỗi ngắn gọn

### Context (Bối cảnh)

- Mục tiêu đang làm:
- Hệ điều hành/phiên bản:
- Phiên bản công cụ (Docker/Git/...):
- Các bước đã làm ngay trước khi lỗi xuất hiện:
- Lỗi bắt đầu từ khi nào? Có thay đổi gì gần đây?

### Expected (Kết quả mong đợi)

- Điều gì đáng lẽ phải xảy ra?

### Actual (Kết quả thực tế)

- Điều gì đã xảy ra?
- Có tái hiện được không? Các bước tái hiện:

### Log (Nhật ký)

- Thông báo lỗi nguyên văn / log liên quan:
- Lệnh đã chạy và thư mục chạy:
- Ảnh chụp hoặc tệp log (đã che token, mật khẩu, khóa, email/dữ liệu riêng tư):

### Đã tự tra cứu

- Từ khóa/truy vấn:
- Tài liệu hoặc issue đã xem:
- Giải pháp đã thử và kết quả:
- Rủi ro/điều cần hỗ trợ:
```

## Quy trình tra cứu 3 bước

1. **Googling:** Tìm thông báo lỗi nguyên văn trong dấu ngoặc kép cùng tên công cụ, phiên bản và hệ điều hành. Ưu tiên tài liệu chính thức: thêm `site:` theo miền dự án/nhà cung cấp. Đọc ngày cập nhật và điều kiện áp dụng; không tải tệp sửa lỗi từ nguồn không rõ.
2. **Community Search:** Tìm trên GitHub Issues, Stack Overflow hoặc diễn đàn chính thức. So sánh môi trường và phiên bản; xem câu trả lời/issue mới nhất, reactions, xác nhận của maintainer và phản hồi thành công/thất bại. Thử workaround trong môi trường an toàn, ghi lại và hoàn tác được.
3. **AI Translation:** Đưa thông báo lỗi đã loại bí mật cho AI để diễn giải thuật ngữ, tóm tắt phương án và tạo truy vấn tra cứu. Yêu cầu giải thích tác dụng/rủi ro từng lệnh và nguồn chính thức. Đối chiếu độc lập; AI giúp hiểu, không phải nguồn xác minh cuối cùng. Không đưa token, mật khẩu, khóa SSH hay log chứa dữ liệu khách hàng.

## Mục tiêu giảm câu hỏi lặp lại

Mục tiêu vận hành là tự xử lý khoảng 80% lỗi thường gặp, được đo bằng tỷ lệ ticket tự đóng sau tra cứu và chất lượng báo cáo, không phải yêu cầu thành viên cố xử lý lỗi nguy hiểm. Với mất dữ liệu, lộ thông tin, dịch vụ ngừng hoặc lệnh có quyền cao, báo người phụ trách ngay thay vì trì hoãn để đủ ba bước. Mỗi ticket đã giải quyết cần bổ sung nguyên nhân, phiên bản áp dụng, cách khắc phục và cách hoàn tác vào FAQ để giảm lặp lại.
