# Bài 2: Quản lý Quyền truy cập Báo cáo Tài chính

## 1. Bảng phân quyền an toàn

| Đối tượng                         | Quyền              | Cách sử dụng                                                            |
| --------------------------------- | ------------------ | ----------------------------------------------------------------------- |
| Trưởng phòng nhân sự (chủ sở hữu) | Editor             | Quản lý tệp và cấp quyền; bật xác thực hai lớp.                         |
| Trưởng bộ phận                    | Commenter          | Đọc và góp ý bằng Suggesting/nhận xét; không sửa dữ liệu gốc trực tiếp. |
| Nhân viên được giao nhập liệu     | Editor có giới hạn | Chỉ cấp cho người thật sự cần cập nhật, rà soát định kỳ.                |
| Ứng viên và người ngoài           | Không có quyền     | Không dùng liên kết công khai; chỉ chia sẻ cho tài khoản cụ thể.        |

Với danh sách có SĐT và mức lương, áp dụng “cờ đỏ”: kiểm tra kỹ người nhận, dùng tài khoản cụ thể, cấp quyền tối thiểu, đặt hạn dùng nếu dịch vụ hỗ trợ, và tắt cho phép tải xuống/in/sao chép với người chỉ xem nếu có tùy chọn. Suggesting Mode hoặc nhận xét giúp trưởng bộ phận đề xuất thay đổi để chủ sở hữu duyệt, thay vì sửa thẳng dữ liệu gốc.

## 2. Xử lý khi lộ link Editor (3 bước)

1. **Thu hồi ngay:** mở phần chia sẻ, xóa người ngoài khỏi danh sách, chuyển link thành “người được chỉ định” và bỏ quyền Editor của link. Nếu link đã phát tán, tạo link mới sau khi thu hồi link cũ.
2. **Rà soát:** kiểm tra danh sách người có quyền, hoạt động gần đây và nhật ký kiểm tra truy cập nếu tổ chức cung cấp. Lưu lại thời điểm, tài khoản truy cập, thao tác tải hoặc chỉnh sửa mà hệ thống ghi nhận; báo quản lý/IT để đánh giá mức độ ảnh hưởng.
3. **Giảm thiệt hại và phòng ngừa:** nếu có nguy cơ lộ dữ liệu, báo người phụ trách bảo mật và thực hiện quy trình nội bộ, cân nhắc đổi thông tin nhạy cảm có thể thay đổi. Chia sẻ lại cho đúng người với quyền phù hợp và kiểm tra quyền định kỳ.

Thu hồi quyền ngăn truy cập tiếp theo, nhưng không thể đảm bảo người đã mở tệp chưa chụp màn hình, sao chép hoặc tải bản về. Nhật ký chỉ cho biết các hoạt động mà dịch vụ ghi lại; nếu không có sự kiện tải xuống thì cũng không chứng minh tuyệt đối rằng chưa có bản sao.
