# Bài 4: Tối ưu hóa Lưu trữ Dữ liệu Doanh nghiệp

## 1. Thiết lập Files On-Demand

Tạo thư mục Cloud `Campus-Video` và bật tính năng Files On-Demand (hoặc tùy chọn tương đương của dịch vụ đang dùng). Tệp chỉ hiện tên và thông tin trên máy, còn nội dung lớn vẫn ở Cloud. Khi cần xem video, mở tệp để tải về; sau khi dùng xong có thể chọn giải phóng dung lượng để giữ tệp trên Cloud và bỏ bản cục bộ. Chỉ đánh dấu “luôn giữ trên thiết bị” cho các video cần dùng ngoại tuyến.

Đội tải dữ liệu lên theo từng đợt, ưu tiên lúc mạng ít người dùng. Đặt giới hạn băng thông tải lên/tải xuống nếu phần mềm có hỗ trợ, cắm nguồn, tắt chế độ ngủ trong lúc truyền, và không gập máy cho đến khi đồng bộ xong. Nếu kết nối bị ngắt hoặc máy ngủ, phần mềm đồng bộ tiếp tục từ phần còn thiếu khi có mạng và máy hoạt động lại. Cần kiểm tra trạng thái hoàn tất trước khi xóa bản nguồn.

## 2. Tính dung lượng

Giả sử dung lượng video là **500 GB** và SSD máy là **256 GB**. Nếu tải toàn bộ, dữ liệu chiếm:

`500 / 256 ≈ 1,95 lần` dung lượng SSD. Nghĩa là riêng video đã gần gấp đôi ổ đĩa, chưa tính hệ điều hành và ứng dụng, nên không thể lưu toàn bộ trên máy.

Với Files On-Demand, dung lượng cục bộ bằng phần video đang tải về cộng hệ điều hành và ứng dụng. Ví dụ chỉ cần tải 20 GB video đang xử lý thì phần video dùng khoảng 20/256 = **7,8% SSD**, thay vì 500/256 = **195% SSD**. Cloud vẫn giữ đủ 500 GB; máy chỉ cần chỗ cho những tệp đang dùng và bộ nhớ đệm.
