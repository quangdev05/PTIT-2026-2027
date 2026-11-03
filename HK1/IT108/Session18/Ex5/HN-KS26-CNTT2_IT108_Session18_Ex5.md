# Bài 5: Tối ưu tiện ích mở rộng cho hệ thống điều phối vận tải

## 1. JSON Viewer

JSON Viewer định dạng JSON thành cây thụt lề, tô màu, thu gọn/mở rộng, giúp đọc field, kiểu dữ liệu và cấu trúc API, phát hiện JSON lỗi hoặc field thiếu. Không chứng minh dữ liệu đúng nghiệp vụ và không thay Network -> Response. GPS/tài xế là dữ liệu nhạy cảm; chỉ dùng extension được duyệt, tránh công cụ web bên ngoài.

## 2. Bộ 5 tiện ích đề xuất

| Nhóm         | Extension                                  | Công dụng                                           |
| ------------ | ------------------------------------------ | --------------------------------------------------- |
| Dev Suite    | JSON Viewer                                | Đọc response JSON                                   |
| Dev Suite    | Wappalyzer                                 | Nhận diện công nghệ web                             |
| Productivity | ColorZilla                                 | Lấy mã màu giao diện                                |
| Productivity | OneTab                                     | Gom tab nghiên cứu; không lưu URL bí mật            |
| Security     | uBlock Origin (hoặc công cụ tổ chức duyệt) | Chặn quảng cáo/trackers; kiểm tra không chặn Portal |

Rà nhà phát hành, quyền và chính sách công ty trước khi cài. Extensions -> Details -> Site access -> On click; cấp quyền chỉ trên site cần thiết. On click có thể khiến chặn quảng cáo không hoạt động cho tới khi bấm/cấp quyền. Ghim qua biểu tượng mảnh ghép → Pin; ghim chỉ giúp truy cập nhanh. Giữ số lượng nhỏ; RAM tùy phiên bản, máy và số tab nên phải đo.

## 3. Kiểm tra lag

Mở chrome://extensions để xem quyền, tắt tạm extension không cần. Shift+Esc mở Chrome Task Manager, so sánh CPU/RAM khi tái hiện Waterfall; chỉ đổi một yếu tố mỗi lần. Network kiểm tra request chậm/lỗi/bị chặn, rồi bật lại và xác nhận chức năng. Trang extensions chủ yếu quản lý, không phải lúc nào cũng cho biết RAM chính xác từng extension.
