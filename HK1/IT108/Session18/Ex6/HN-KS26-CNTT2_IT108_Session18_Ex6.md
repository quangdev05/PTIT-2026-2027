# Bài 6: Kiểm tra và tối ưu hiệu năng Portal

## 1. Phân tích Waterfall

F12 -> Network, bật Preserve log và Disable cache (DevTools phải mở), tải lại. Lọc Doc/CSS/JS/Img; ghi URL, Status, Type, Size, Time; xem Timing và sắp xếp theo Time/Size. Waterfall giúp nhận ra TTFB cao, request chờ, chuỗi phụ thuộc, ảnh lớn, lỗi/retry. Thời gian 20 giây chưa đủ xác định bottleneck; cần capture thật. Disable Cache mô phỏng tải lạnh.

## 2. Tối ưu ba bước

1. Lọc 404, sửa URL/path, route, tên file, CDN hoặc build/deploy; xác nhận tài nguyên cần thiết trả đúng.
2. Tìm ảnh lớn, resize đúng kích thước, nén, dùng WebP/AVIF khi phù hợp, lazy-load ảnh ngoài màn hình; ưu tiên bản đồ cần thấy ngay và kiểm tra chất lượng.
3. Cấu hình Cache-Control: file có hash có thể dùng `public, max-age=31536000, immutable`; HTML/API đổi thường xuyên dùng thời hạn ngắn/revalidation. Tên hash mới giúp cập nhật cache.

CSS/JS quan trọng cần tải thành công và thứ tự phụ thuộc đúng. Không phải mọi CSS/JS cần chặn render; defer/tách mã khi phù hợp và kiểm thử giao diện. Status 200 chỉ xác nhận HTTP tải, chưa xác nhận chức năng.

## 3. 304

304 Not Modified xác nhận bản cache vẫn hợp lệ qua ETag/If-None-Match hoặc Last-Modified/If-Modified-Since. Trình duyệt dùng bản lưu thay vì tải lại toàn bộ, tiết kiệm băng thông; vẫn có một lượt kiểm tra mạng. Xem Headers/Size; khi Disable Cache kết quả khác. Đề không có capture Network nên chưa thể nêu request hoặc ảnh chậm cụ thể.
