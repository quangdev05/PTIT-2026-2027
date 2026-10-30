# Bài 5: Giao tiếp Bất đồng bộ trong Doanh nghiệp

## 1. Tin nhắn mẫu yêu cầu hỗ trợ sửa lỗi

> Chào Minh, nhờ bạn xem giúp lỗi cảm biến độ ẩm không cập nhật trên nhánh `feature/sensor-sync` nhé.
>
> **Bối cảnh:** Lỗi xuất hiện sau lần gộp mã chiều nay, ở bộ cảm biến SHT31.
>
> **Cách gặp lỗi:** Chạy `npm run dev`, mở trang `/dashboard`, chọn thiết bị `GH-02`; giá trị độ ẩm đứng yên dù log nhận được dữ liệu mới.
>
> **Kết quả mong đợi:** Giá trị trên trang cập nhật theo dữ liệu cảm biến.
>
> **Đã thử:** Khởi động lại dịch vụ và kiểm tra kết nối thiết bị; log vẫn có dữ liệu mới. Ảnh màn hình và log đã đính kèm trong thread này.
>
> Bạn có thể kiểm tra giúp phần cập nhật giao diện và ghi lại nguyên nhân cùng cách sửa trong thread không? Nếu chưa kịp, cho mình biết thời gian dự kiến. Không cần phản hồi ngay; mình sẽ tiếp tục kiểm tra phần API.

Tin nhắn có đủ bối cảnh, bước tái hiện, kết quả mong muốn và việc đã thử, nên người nhận có thể bắt đầu khi thuận tiện mà không cần hỏi lại những thông tin cơ bản.

## 2. Lịch gửi tin theo múi giờ

Giả sử thành viên ở Hà Nội (UTC+7), Nhật Bản (UTC+9) và bờ Đông Hoa Kỳ (UTC−4 vào mùa hè, UTC−5 vào mùa đông). Chọn khoảng 09:00–17:00 theo giờ địa phương người nhận. Lịch ví dụ dưới đây dùng giờ Hà Nội và giả định người ở Mỹ thuộc múi giờ bờ Đông đang UTC−4:

| Người nhận     | Giờ thuận tiện tại nơi nhận | Lập lịch theo giờ Hà Nội |
| -------------- | --------------------------: | -----------------------: |
| Nhật Bản       |                   10:00 JST |                08:00 ICT |
| Hà Nội         |                   09:30 ICT |                09:30 ICT |
| Bờ Đông Hoa Kỳ |                   10:00 EDT | 21:00 ICT ngày hôm trước |

Khi Hoa Kỳ chuyển sang UTC−5, 10:00 tại bờ Đông tương ứng 22:00 giờ Hà Nội. Trước khi dùng Schedule Send, kiểm tra lại múi giờ và giờ mùa hè. Tin nhắn không khẩn nên được gửi vào đầu giờ làm việc của người nhận, không gửi ban đêm. Có thể ghi rõ deadline và cho phép phản hồi trong một khoảng thời gian hợp lý.
