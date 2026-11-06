# Bài 9 - Prompt 3 thành phần giải mã lỗi trạm sạc

## Phần 1: Vì sao câu hỏi ban đầu dễ dẫn đến câu trả lời sai?

Câu “AI ơi phần mềm trạm sạc của tôi bị hỏng rồi làm sao đây?” thiếu thiết bị, hệ điều hành, thao tác, log lỗi và mục tiêu cụ thể. AI không có căn cứ phân biệt lỗi phần mềm, quyền truy cập hay hỏng phần cứng nên có thể đoán mò (hallucination), ví dụ khuyên tháo vỏ và kiểm tra dây dù log chỉ ra lỗi quyền ghi file. Câu trả lời có vẻ tự tin không chứng minh nó đúng.

## Prompt theo công thức Context – Raw Error – Instruction

**[Context]** Tôi là kỹ thuật viên mới đang trực hệ thống Kiosk nạp năng lượng VoltCharge tại Bến xe Miền Đông. Trụ sạc nhanh số 04 chạy Windows; dịch vụ ControllerDaemon dừng khi khởi động. Tôi cần chẩn đoán phần mềm an toàn, không can thiệp phần điện.

**[Raw Error]**

```text
[TERMINAL ERROR LOG - VOLTCHARGE CHARGER #04]
2026-09-21 21:15:30 [FATAL] ControllerDaemon failed to start. System.UnauthorizedAccessException: Access to the path 'C:\Program Files\VoltCharge\data\session.log' is denied. at System.IO .FileStream.ValidateFileHandle(SafeFileHandle handle) at VoltCharge.Core.SessionManager.Initialize() InnerException: None. Process terminated with exit code 5 (0x00000005). Suggestion: Run the application with elevated administrator privileges or verify NTFS file permissions.
```

**[Instruction]** Hãy giải thích lỗi bằng tiếng Việt đời thường, nêu nguyên nhân có khả năng nhất và đưa ra 3 bước khắc phục an toàn trên Windows 11. Ưu tiên kiểm tra tài khoản dịch vụ và cấp quyền ghi tối thiểu cho đúng thư mục/tệp, theo quy trình được quản trị viên phê duyệt. Không hướng dẫn tháo thiết bị, tắt bảo mật, cấp quyền rộng cho `Everyone` hoặc chạy lệnh chưa giải thích. Nêu cách hoàn tác và điều kiện cần dừng để báo IT nếu quyền vẫn bị từ chối.

## Phần 2: Giải mã lỗi và kịch bản khắc phục

`UnauthorizedAccessException: Access to the path ... is denied` nghĩa là chương trình bị Windows từ chối truy cập đường dẫn. Cụ thể, dịch vụ đang cần tạo/ghi `session.log` trong `C:\Program Files\VoltCharge\data`, một vị trí được bảo vệ. Exit code `5` cũng phù hợp với tình trạng truy cập bị từ chối. Khả năng gốc là tài khoản chạy `ControllerDaemon` không có quyền ghi phù hợp; log không cho thấy đây là lỗi dây điện.

1. **Xác nhận đúng dịch vụ và danh tính chạy dịch vụ:** nhờ người có thẩm quyền kiểm tra cấu hình `ControllerDaemon`, tài khoản dịch vụ, đường dẫn và quyền NTFS hiện tại. Không dùng tài khoản cá nhân hoặc nâng quyền toàn hệ thống như giải pháp mặc định.
2. **Cấp quyền tối thiểu, đúng đối tượng:** quản trị viên xác định tài khoản dịch vụ thực tế và cấp quyền ghi/sửa cần thiết riêng cho `C:\Program Files\VoltCharge\data` (hoặc file log theo thiết kế). Không cấp quyền cho `Everyone`/`Users`, không thay đổi quyền của toàn bộ `Program Files`. Lưu lại quyền ban đầu để có thể hoàn tác.
3. **Kiểm tra có kiểm soát:** theo quy trình vận hành, khởi động lại dịch vụ bằng công cụ quản trị phù hợp rồi kiểm tra trạng thái dịch vụ và log mới. Nếu vẫn bị từ chối, khôi phục thay đổi không phù hợp và chuyển log/quyền hiện tại cho IT; không tiếp tục thử các lệnh không rõ tác dụng.

**Run as Administrator:** thao tác này chỉ nâng quyền cho ứng dụng được chạy, không phải biện pháp mặc định cho dịch vụ vận hành lâu dài. Nếu quản trị viên cần kiểm tra thủ công, mở ứng dụng quản trị bằng **Run as administrator** chỉ trong phiên kiểm tra được phép; không bật chạy quản trị thường trực để né cấu hình quyền sai.

## Phần 3: Xử lý chuỗi API key

Nếu log chứa `API_KEY: volt_secret_token_889922`, không dán giá trị thật vào ChatGPT/Gemini, ảnh chụp, ticket công khai hay kho mã. Thay bằng placeholder, ví dụ `API_KEY: [REDACTED]`, đồng thời kiểm tra prompt/ảnh để không còn bản sao. Nếu khóa đã bị lộ, báo quản trị viên và thu hồi/đổi khóa theo quy trình. Khóa bí mật có thể cho phép truy cập trái phép; không thể dựa vào việc xóa tin nhắn để bảo đảm nó chưa bị lưu hoặc sử dụng.
