# Bài 10 - Đánh giá quy trình khắc phục sự cố kỹ thuật

## Phần 1: So sánh trade-off

| Tiêu chí                     | Phương án 1: Hỗ trợ cảm tính / nhóm chat                                           | Phương án 2: Troubleshooting 4 chặng                                                                                                             |
| ---------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Downtime**                 | Thời gian chờ phụ thuộc Senior có rảnh không; thông tin thiếu làm kéo dài hỏi đáp. | Kỹ thuật viên tự xử lý lỗi quen thuộc trong 5–10 phút đầu; mục tiêu theo đề là giảm đến 80%, nhưng kết quả thực tế cần đo theo dữ liệu vận hành. |
| **Áp lực và chi phí Senior** | Bị ngắt quãng bởi lỗi cơ bản lặp lại; phải hỏi lại ngữ cảnh.                       | Nhận ca khó cùng Bug Report đủ dữ kiện; có thêm thời gian cho phát triển tính năng.                                                              |
| **Năng lực, tự chủ KTV**     | Thụ động, phụ thuộc người khác và khó xử lý khi mất mạng nội bộ.                   | Rèn kỹ năng tìm kiếm, kiểm chứng, giải thích log và biết giới hạn khi cần escalate.                                                              |
| **Knowledge Base**           | Thông tin nằm rải rác trong chat, khó tìm lại và không bảo đảm đã xác minh.        | Giải pháp được ghi thành hướng dẫn nội bộ, có thể tái sử dụng và cập nhật.                                                                       |

### Lựa chọn khi mở rộng lên 1.000 trạm

Chọn Phương án 2 làm quy trình vận hành chuẩn. Khi số trạm tăng, hỗ trợ tùy biến tạo tải gần như tuyến tính lên nhóm Senior và khiến sự cố lặp lại. Chuẩn hóa giúp giải quyết lỗi phổ biến tại chỗ, ghi nhận tri thức dùng chung và chuyển ca phức tạp với dữ kiện đủ. Với mức thiệt hại đề bài là 500.000 VNĐ mỗi giờ downtime, giảm thời gian xử lý còn có lợi ích trực tiếp. Cần theo dõi số liệu thực tế; con số giảm 80%/5–10 phút là mục tiêu giả định của đề, không phải cam kết áp dụng cho mọi lỗi.

## Phần 2: Luồng quyết định

```text
Kiosk xuất hiện lỗi
  ↓
Chặng 1 — Ghi lại thông báo nguyên văn, bóc tách tên phần mềm / HĐH / thao tác.
Tạo truy vấn Google phù hợp (site:, ngoặc kép, hoặc dấu -; mỗi truy vấn dùng toán tử cần thiết).
  ↓
Có kết quả StackOverflow / GitHub Issues liên quan?
  ├─ Có → Chặng 2: đọc lướt 30 giây: tiêu đề/phiên bản và tags → dấu hiệu Accepted/Upvotes
  │       → ngày đăng và câu trả lời có khớp môi trường không → thử một giải pháp rủi ro thấp,
  │         ghi lại kết quả; không áp dụng mù quáng.
  └─ Không / chưa rõ → tiếp tục tìm tài liệu chính thức hoặc chuyển sang Chặng 3.
  ↓
Chặng 3 — Nếu log khó hiểu: prompt AI đủ Context + Raw Error + Instruction.
Đối chiếu đề xuất với nguồn đáng tin; không gửi secret và không chạy lệnh phá hoại.
  ↓
Đã giải quyết và xác nhận hoạt động bình thường?
  ├─ Có → ghi cách xử lý đã kiểm chứng vào Knowledge Base.
  └─ Không → sau tối đa 2 giải pháp AI hoặc 15 phút (điều kiện nào đến trước):
             dừng thay đổi rủi ro, lập Bug Report 4 phần và gửi IT Helpdesk.
```

### Bug Report 4 phần

1. **Context:** mã trạm/Kiosk, hệ điều hành, ứng dụng/phiên bản, thời điểm và thao tác trước khi lỗi xảy ra.
2. **Expected:** hành vi mong muốn.
3. **Actual:** hành vi thực tế, phạm vi ảnh hưởng và các bước tái hiện.
4. **Log & Evidence:** thông báo lỗi nguyên văn, thời điểm, các bước đã thử và kết quả; đính kèm ảnh đã che thông tin nhạy cảm.

Mọi hướng dẫn có thể ảnh hưởng vận hành trạm cần được kiểm chứng và tuân theo quyền hạn/quy trình nội bộ trước khi áp dụng.
