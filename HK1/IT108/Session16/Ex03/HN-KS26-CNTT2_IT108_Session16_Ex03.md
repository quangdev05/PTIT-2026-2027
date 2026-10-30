# Bài 3: Xây dựng Không gian Cộng tác Doanh nghiệp

## 1. Cấu trúc kênh dự án bãi đỗ xe thông minh

| Kênh                    | Nội dung                                   | Quy ước                                                                     |
| ----------------------- | ------------------------------------------ | --------------------------------------------------------------------------- |
| `parking-announcements` | Deadline, quyết định và thông báo chung    | Chỉ quản lý đăng; thành viên xác nhận bằng biểu tượng hoặc trả lời khi cần. |
| `parking-sensors`       | Cảm biến, dữ liệu đo và vấn đề thiết bị    | Một chủ đề cho mỗi vấn đề; đăng ảnh/log và thông tin thiết bị liên quan.    |
| `parking-dev`           | Code, tích hợp và lỗi phần mềm             | Trao đổi kỹ thuật; đưa câu trả lời theo đúng thread.                        |
| `parking-tasks`         | Công việc, người phụ trách, hạn hoàn thành | Mỗi task có người nhận, kết quả cần đạt và ngày hạn.                        |
| `parking-lounge`        | Trò chuyện ngoài công việc                 | Không đăng thông tin khẩn hoặc quyết định dự án ở đây.                      |

## 2. Cách trao đổi

Tin nhắn mới nên có tiêu đề ngắn và đủ ngữ cảnh. Phản hồi vào đúng thread để kênh chính dễ theo dõi; khi thảo luận kết thúc, người tạo ghi lại kết luận và task liên quan ở kênh công việc. Thông báo quan trọng được ghim hoặc đưa vào `parking-announcements`.

Để tránh ép trả lời ngay, nhóm thống nhất thời gian phản hồi thông thường, ví dụ trong một ngày làm việc. Người đang tập trung có thể tắt thông báo hoặc đặt trạng thái bận; việc cần gấp phải ghi rõ mức khẩn và lý do, đồng thời dùng kênh liên hệ khẩn đã thống nhất. Không dùng @all cho việc thường ngày.

## 3. Ba quy tắc giao tiếp

1. Không gửi mỗi câu “Chào bạn” rồi chờ; hãy chào và nêu luôn vấn đề, bối cảnh, điều cần hỗ trợ trong cùng tin nhắn.
2. Không @all để nhắc việc cá nhân. Gắn thẻ đúng người hoặc nhóm liên quan; chỉ @all khi có sự cố ảnh hưởng toàn dự án.
3. Giữ chủ đề trong thread, viết rõ deadline theo ngày giờ và múi giờ, và không yêu cầu phản hồi tức thì nếu không khẩn cấp.
