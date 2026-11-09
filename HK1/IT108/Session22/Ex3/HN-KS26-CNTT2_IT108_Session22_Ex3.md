# Bài 3 - Sử dụng AI an toàn khi xử lý lỗi phần mềm

## Tình huống

AI đưa một lệnh lạ để sửa `Path not found` khi cài Python. Chưa có nội dung lệnh cụ thể, phiên bản Windows/macOS/Linux, cách cài đặt và thông báo đầy đủ, nên **không thể kết luận lệnh an toàn**. Không dán lệnh vào Terminal cho đến khi hiểu tác dụng và xác minh nguồn.

## Báo cáo IPO

| Thành phần  | Phân tích và hành động                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Input**   | Câu trả lời/lệnh do AI đề xuất; thông báo lỗi nguyên văn; hệ điều hành và phiên bản; phiên bản Python; cách cài (installer, Store, package manager); thư mục/câu lệnh vừa chạy. Loại bỏ token, tên người dùng hoặc đường dẫn riêng tư trước khi chia sẻ.                                                                                                                                                                                                                                                              |
| **Process** | Tách lệnh thành từng phần và xác định chính xác lệnh đọc/ghi/xóa gì, có quyền quản trị hay tải/chạy nội dung từ mạng không. Tra cứu cú pháp trên tài liệu Python/nhà cung cấp hệ điều hành. Tìm đối chiếu bằng `site:stackoverflow.com "Path not found" Python` và đọc câu trả lời phù hợp đúng hệ điều hành/phiên bản; Stack Overflow chỉ là nguồn cộng đồng, cần đối chiếu tài liệu chính thức. Không chạy lệnh không hiểu; nếu cần thử thì dùng môi trường thử nghiệm, sao lưu và chạy từng phần không nâng quyền. |
| **Output**  | Chỉ xác nhận **an toàn trong phạm vi đã kiểm tra** nếu tài liệu chính thức xác nhận tác dụng, lệnh đúng phiên bản, không có tác dụng phụ không chấp nhận được và đã hiểu cách hoàn tác. Nếu thiếu dữ kiện, nguồn mâu thuẫn, lệnh bị mã hóa/khó đọc, xóa/ghi rộng hoặc yêu cầu quyền cao không cần thiết: đánh dấu **chưa xác minh/không an toàn để chạy**, hỏi người có chuyên môn.                                                                                                                                   |

## Prompt hỏi ngược AI

```text
Bạn vừa đề xuất lệnh sau để sửa lỗi “Path not found” khi cài Python:
[ DÁN NGUYÊN VĂN LỆNH Ở ĐÂY ]

Tôi dùng [HỆ ĐIỀU HÀNH + PHIÊN BẢN], cài Python bằng [CÁCH CÀI], và lỗi đầy đủ là [THÔNG BÁO]. Chưa chạy lệnh này. Hãy giải thích từng thành phần của lệnh; chỉ rõ tệp, thư mục, cài đặt hoặc quyền nào bị đọc/thay đổi/xóa; lệnh có tải hay thực thi mã từ Internet không; cần quyền quản trị không và vì sao; rủi ro và cách hoàn tác. Dẫn liên kết tới tài liệu chính thức phù hợp phiên bản và nêu điều gì chưa chắc chắn. Nếu không thể xác minh an toàn, hãy nói rõ “không chạy lệnh” và đề xuất bước chẩn đoán chỉ đọc, ít rủi ro trước. Đừng tự bịa nguồn hoặc khẳng định an toàn chỉ dựa trên suy đoán.
```
