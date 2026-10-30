# Bài 1: Hệ thống Quản lý Tài liệu Dự án Doanh nghiệp

## 1. Luồng dữ liệu

```text
Designer lưu file trên máy (Local SSD)
        ↓ phần mềm đồng bộ theo dõi thư mục dự án
Tệp được lưu tạm khi mạng mất hoặc máy đang xử lý
        ↓ có Internet, phần mềm tải phần còn thiếu lên
Cloud lưu phiên bản mới và thông báo cho nhóm
```

Designer làm việc trong một thư mục dự án đã chọn đồng bộ, ví dụ `PTIT-Museum/3D`. Khi nhấn Ctrl + S, phần mềm lưu thay đổi trên SSD trước để ứng dụng không bị phụ thuộc vào mạng. Phần mềm đồng bộ nhận biết tệp thay đổi và đưa thay đổi lên Cloud khi có kết nối. Có thể bật thông báo đồng bộ hoàn tất để biết tệp đã lên mạng.

Nếu hai người cùng sửa một tệp, nên tránh sửa đồng thời. Nếu vẫn phát sinh xung đột, hệ thống thường giữ cả hai bản hoặc tạo bản có tên “conflicted copy”. Nhóm tạm dừng sửa, so sánh thời gian và nội dung hai bản, chọn bản đúng rồi lưu thành phiên bản chính. Không xóa bản xung đột trước khi kiểm tra.

## 2. Khi mất mạng hoặc máy sập nguồn

Khi mất mạng, bản vừa lưu vẫn còn trên SSD và phần mềm đưa thay đổi vào hàng chờ. Khi máy có mạng trở lại, phần mềm tiếp tục đồng bộ. Nếu máy tắt đột ngột giữa lúc tải, phần mềm sẽ kiểm tra và tải tiếp; nhóm cần chờ trạng thái báo hoàn tất trước khi coi đó là bản sao Cloud an toàn. Vì vậy, nên bật tự khởi động phần mềm, không xóa thư mục hàng chờ, và kiểm tra biểu tượng đồng bộ sau khi mở máy. Mất điện trước khi ứng dụng kịp lưu vẫn có thể mất phần chưa lưu, nên Designer cần lưu thường xuyên và dùng UPS nếu công việc quan trọng.

Version History giúp xem và khôi phục bản cũ khi bản hiện tại hỏng hoặc bị ghi đè. Trước hết mở lịch sử phiên bản, xem người sửa và thời gian, mở bản phù hợp để kiểm tra, rồi khôi phục hoặc tải bản đó về. Nên giữ một bản ổn định trước khi khôi phục để có thể quay lại nếu chọn nhầm.

## 3. Ba bước thiết lập cho Designer

1. Cài ứng dụng đồng bộ của dịch vụ Cloud mà nhóm dùng, đăng nhập tài khoản công việc và bật xác thực hai lớp.
2. Chọn thư mục dự án `PTIT-Museum/3D` để đồng bộ hai chiều; bật tự khởi động, lưu phiên bản và đồng bộ khi có mạng. Không đặt thư mục làm việc trong nơi tạm thời.
3. Tạo thử một tệp nhỏ, lưu rồi kiểm tra tệp xuất hiện trên Cloud và mở được từ thiết bị khác. Hướng dẫn Designer kiểm tra trạng thái đồng bộ và cách mở Version History.
