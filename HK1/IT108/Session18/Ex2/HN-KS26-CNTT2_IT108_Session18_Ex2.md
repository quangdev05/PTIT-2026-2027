# Bài 2: Sự cố phiên làm việc trên hệ thống vận tải

## 1. Cache và Cookie

Cache lưu tài nguyên (ảnh, CSS, JS) với dung lượng thường lớn, từ MB đến GB. Cookie nhỏ (khoảng vài KB mỗi cookie), được gửi theo request phù hợp nên chỉ nên chứa mã token, không chứa giỏ hàng lớn hay mật khẩu. Giỏ hàng nên lưu phía server gắn tài khoản/phiên.

Session cookie thường hết khi phiên trình duyệt đóng. Persistent cookie có Max-Age/Expires để tồn tại qua lần đóng/mở đến hạn. Dùng token ngẫu nhiên có thể thu hồi, không biến session token thành bí mật dài hạn.

## 2. Cookie an toàn

Ví dụ server gửi:

```http
Set-Cookie: __Host-GL_REMEMBER=<opaque-random-token>; Max-Age=2592000; Path=/; Secure; HttpOnly; SameSite=Lax
```

Max-Age 30 ngày chỉ là ví dụ. Secure giới hạn truyền qua HTTPS; HttpOnly chặn JS đọc cookie qua document.cookie; SameSite=Lax giảm một số request cross-site nhưng không thay CSRF protection. Tiền tố \_\_Host- yêu cầu Secure, Path=/, không Domain trên trình duyệt hỗ trợ. Lưu trạng thái phía server, xoay/thu hồi token, hết hạn hợp lý, TLS, bảo vệ XSS/CSRF. Khi logout thu hồi ở server và xóa cookie với cùng Path.

## 3. Hard Reload

Mở DevTools → Network → Disable cache (khi DevTools mở), giữ nút reload và chọn Empty Cache and Hard Reload; có thể Ctrl+Shift+R/Ctrl+F5. Việc này tải lại tài nguyên cache, không xóa cookie và không sửa lỗi server. Kiểm tra request CSS/JS mới trong Network. Header là đề xuất, cần xác nhận khi triển khai thật.
