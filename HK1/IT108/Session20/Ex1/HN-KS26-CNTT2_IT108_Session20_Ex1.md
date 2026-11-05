# Bài 1 Xử lý cảnh báo đăng nhập giả mạo GitHub

## Kiểm tra ký tự lạ trong URL và giải thích tại sao có thể đánh lừa người dùng:

- URL giả mạo sử dụng chữ ú (Unicode U+00FA).
- URL thật sử dụng chữ u bình thường (ASCII).
- Hai ký tự nhìn khá giống nhau khi lướt mắt nhanh, nhưng thực chất là hai ký tự hoàn toàn khác nhau.

- Kẻ xấu lợi dụng những ký tự có hình dạng giống nhau để tạo ra tên miền giả, khiến người dùng tưởng rằng mình đang truy cập đúng website.

## Quy trình kiểm tra URL

### Sử dụng mắt thường:

- Đọc kỹ tên miền trên thanh địa chỉ.
- Kiểm tra từng ký tự, đặc biệt là những chữ dễ nhầm lẫn như u, ú, o, 0, l, I.
- Đảm bảo tên miền chính xác là github.com.
- Không tin tưởng chỉ vì website có biểu tượng ổ khóa HTTPS.

### Sử dụng công cụ hỗ trợ:

| Công cụ              | Công dung                                       |
| -------------------- | ----------------------------------------------- |
| VirusTotal           | Kiểm tra URL có bị đánh dấu nguy hiểm không     |
| Google Safe Browsing | Kiểm tra website có chứa nội dung lừa đảo không |
| Punycode Converter   | Phát hiện tên miền có ký tự Unicode bất thường  |
| WHOIS                | Kiểm tra thông tin đăng ký tên miền             |
