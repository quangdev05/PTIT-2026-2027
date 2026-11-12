# Bài 8 - Chat Summary duy trì ngữ cảnh tư vấn dài

## 1. Prompt tạo Chat Summary Block

```text
Hãy đọc toàn bộ cuộc trò chuyện hiện tại và tạo một “Chat Summary Block” để chuyển sang phiên mới.

Giới hạn: dưới 250 tokens. Viết ngắn, không lặp lại hội thoại. Bắt buộc giữ đủ bốn mục:
1. Mục tiêu của chiến dịch “Mùa Vàng Tri Ân”.
2. Ngân sách đã thống nhất.
3. Ý tưởng đã chốt.
4. Việc cần làm tiếp theo.

Chỉ đưa thông tin có trong hội thoại. Không tự suy diễn; mục nào chưa có thì ghi “Chưa xác định”. Trả về đúng mẫu:
[MỤC TIÊU] ...
[NGÂN SÁCH] ...
[Ý TƯỞNG ĐÃ CHỐT] ...
[TIẾP THEO] ...
```

## 2. Chat Summary Block mô phỏng

> Đây là dữ liệu mô phỏng để minh họa cách bàn giao; đề không cung cấp nội dung 30 lượt chat gốc.

```text
[MỤC TIÊU] Tăng khách quay lại và doanh số dịp tri ân khách hàng MartX.
[NGÂN SÁCH] Tối đa 50 triệu đồng cho ưu đãi và truyền thông.
[Ý TƯỞNG ĐÃ CHỐT] Chiến dịch “Mùa Vàng Tri Ân”; ưu đãi theo hạng thành viên, truyền thông qua Zalo và tại cửa hàng; giọng văn ấm áp, gần gũi.
[TIẾP THEO] Hoàn thiện lịch gửi, nội dung tin nhắn và phân bổ ngân sách từng kênh; kiểm tra điều kiện áp dụng trước khi phát hành.
```

## 3. Prompt khởi động phiên mới

```text
Tiếp tục lập kế hoạch chiến dịch MartX từ Chat Summary Block bên dưới. Coi đây là ngữ cảnh đã được xác nhận; không yêu cầu người dùng nhắc lại các thông tin đã nêu. Không tự thêm ngân sách, ưu đãi hay điều kiện chưa có căn cứ. Nếu thiếu dữ liệu cần thiết, hỏi ngắn gọn trước khi quyết định.

Ưu tiên xử lý việc cần làm tiếp theo. Hãy đề xuất lịch gửi, bản nháp tin nhắn và cách phân bổ ngân sách trong giới hạn đã nêu; tách rõ dữ kiện đã chốt với đề xuất mới để người dùng duyệt.

--- CHAT SUMMARY BLOCK ---
[MỤC TIÊU] Tăng khách quay lại và doanh số dịp tri ân khách hàng MartX.
[NGÂN SÁCH] Tối đa 50 triệu đồng cho ưu đãi và truyền thông.
[Ý TƯỞNG ĐÃ CHỐT] Chiến dịch “Mùa Vàng Tri Ân”; ưu đãi theo hạng thành viên, truyền thông qua Zalo và tại cửa hàng; giọng văn ấm áp, gần gũi.
[TIẾP THEO] Hoàn thiện lịch gửi, nội dung tin nhắn và phân bổ ngân sách từng kênh; kiểm tra điều kiện áp dụng trước khi phát hành.
--- HẾT KHỐI ---
```

## 4. Vì sao cách này hữu ích

Phiên cũ có 25.000 tokens, vượt xa ngân sách dưới 1.000 tokens mỗi lượt. Tóm tắt định kỳ chỉ giữ thông tin phục vụ quyết định tiếp theo nên giảm phần lịch sử phải đưa vào cửa sổ ngữ cảnh, giúp phiên mới gọn và nhanh hơn. Bốn trường bắt buộc ngăn mất mục tiêu, giới hạn chi tiêu, quyết định đã thống nhất và bước kế tiếp. Thông tin mô phỏng phải được thay bằng dữ kiện thật trước khi sử dụng cho chiến dịch.
