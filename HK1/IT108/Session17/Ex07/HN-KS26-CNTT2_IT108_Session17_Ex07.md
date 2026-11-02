# Bài 7: Gỡ Lỗi Luồng Yêu Cầu Kết Quả Xét Nghiệm Và Sai Lệch Mã Trạng Thái HTTP

## Phần 1: Phân tích vấn đề

### 1. Bốn điểm sai trong biên bản thực tập sinh

1. **Sai vai trò DNS:** DNS phân giải tên miền `carepulse.vn` thành địa chỉ IP (có thể đi qua cache DNS), không phân giải “cổng mạng” và không gửi nguyên chuỗi URL đến máy chủ cơ sở dữ liệu. Đường dẫn `/records/patient8821` được gửi trong HTTP request sau khi đã kết nối tới máy chủ.
2. **Bỏ qua thiết lập kết nối:** Với HTTPS, trình duyệt trước hết cần thiết lập kết nối TCP (hoặc giao thức truyền tải tương ứng); sau đó TLS thương lượng mã hóa và xác thực chứng thư. Khi kết nối sẵn sàng, trình duyệt mới gửi HTTP request và nhận response. HTTPS không tự động tải HTML mà không bắt tay.
3. **Nhầm 404 với lỗi backend:** `404 Not Found` nghĩa là tài nguyên/đường dẫn được yêu cầu không tìm thấy trên máy chủ. Lỗi nội bộ hoặc dịch vụ backend không xử lý được thường được biểu diễn bằng `500 Internal Server Error` (hoặc mã 5xx phù hợp). Không thể kết luận hồ sơ bệnh nhân đã bị xóa chỉ từ mã 404; phải kiểm tra endpoint, mã phản hồi và dữ liệu theo quy trình được phân quyền.
4. **Hiểu sai rendering và sửa DOM:** Trình duyệt phân tích HTML để tạo DOM, phân tích CSS để tạo CSSOM, kết hợp layout rồi paint; JavaScript được thực thi để tạo/tác động giao diện chứ không được vẽ nguyên văn như nội dung trang. Thay text trên **Elements** chỉ sửa DOM trên client, không ghi dữ liệu vào database CarePulse.

### 2. Vì sao lỗi backend là 500 và tác động của việc báo nhầm 404

Nếu máy chủ ứng dụng đang chạy nhưng xử lý yêu cầu thất bại do backend/database không sẵn sàng, ứng dụng cần trả một phản hồi lỗi máy chủ như **500 Internal Server Error**; nếu proxy hoặc dịch vụ phụ thuộc không khả dụng, hệ thống có thể dùng mã 5xx phù hợp như 502/503. 404 chỉ thích hợp khi tài nguyên/URL không tồn tại hoặc không được tìm thấy, không phải cách diễn đạt lỗi quá tải database.

Nói với bệnh nhân rằng hồ sơ bị xóa vĩnh viễn khi chưa xác minh có thể gây hoang mang, mất niềm tin và khiến họ trì hoãn liên hệ hoặc chăm sóc y tế cần thiết. Cần thông báo trung thực rằng hệ thống đang gặp lỗi truy cập, kết quả chưa tải được, và chuyển cho bộ phận vận hành xác minh; không suy đoán tình trạng bệnh án.

## Phần 2: Sửa lỗi và hoàn thiện giải pháp

### 3. Biên bản kỹ thuật theo bốn giai đoạn

**Bước 1 – DNS Lookup:** Trình duyệt tách hostname `carepulse.vn` khỏi URL và tra cứu DNS để lấy địa chỉ IP máy chủ (có thể dùng kết quả đã cache). DNS không xử lý phần đường dẫn bệnh nhân.

**Bước 2 – TCP/TLS Handshake:** Trình duyệt kết nối đến máy chủ qua TCP; với HTTPS, TLS xác thực chứng thư và thương lượng khóa mã hóa. Sau khi kênh kết nối sẵn sàng, dữ liệu HTTP được truyền bảo mật.

**Bước 3 – HTTP Request/Response:** Trình duyệt gửi request tới endpoint `/records/patient8821` kèm thông tin phiên cần thiết. Máy chủ ứng dụng xác thực và truy vấn backend. Nếu thành công, trả `200 OK` với dữ liệu được phép xem; nếu không tìm thấy tài nguyên trả `404`; nếu xử lý nội bộ thất bại trả `500` hoặc mã 5xx thích hợp. DevTools **Network** giúp kiểm tra request, status, response và thời gian; cần bảo vệ dữ liệu bệnh nhân khi chẩn đoán.

**Bước 4 – Rendering:** Trình duyệt xử lý HTML thành DOM Tree, CSS thành CSSOM, tính Layout, rồi Paint/Composite giao diện. JavaScript có thể cập nhật DOM sau khi chạy. Nếu request dữ liệu lỗi, giao diện nên báo lỗi tải kết quả và hướng dẫn liên hệ hỗ trợ, không hiển thị trạng thái bệnh án chưa được xác minh.

### 4. Vì sao sửa chữ ở Elements không lưu trên server

Tab **Elements** cho phép DevTools sửa biểu diễn DOM đang nằm trong bộ nhớ của trình duyệt trên máy người dùng. Thay đổi đó không tự tạo HTTP request ghi dữ liệu, không gọi API cập nhật và không được xác thực/lưu vào database. Khi reload, trình duyệt tải lại nội dung từ server và DOM tạm bị tạo lại nên chữ sửa biến mất. Muốn cập nhật dữ liệu thật, phải dùng chức năng ứng dụng có thẩm quyền, gửi yêu cầu tới API phù hợp và để server xác thực, kiểm tra quyền, ghi nhận thay đổi theo quy trình kiểm toán. Trong hệ thống y tế, tuyệt đối không tự sửa/chẩn đoán kết quả bằng DevTools.
