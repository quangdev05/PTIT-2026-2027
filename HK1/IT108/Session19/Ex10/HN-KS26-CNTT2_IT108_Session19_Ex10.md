# Bài 10: Đánh giá đa giải pháp xác thực đa yếu tố (2FA)

## Phần 1: Phân tích yếu tố và TOTP

### 1. Ba yếu tố xác thực

| Yếu tố                 | Ý nghĩa                               | Ví dụ                                               |
| ---------------------- | ------------------------------------- | --------------------------------------------------- |
| **Something You Know** | Thông tin người dùng biết             | Mật khẩu, PIN                                       |
| **Something You Have** | Vật/thiết bị người dùng sở hữu        | Điện thoại có Authenticator, khóa bảo mật phần cứng |
| **Something You Are**  | Đặc điểm sinh trắc học của người dùng | Vân tay, khuôn mặt                                  |

Mật khẩu thuộc **Something You Know**. Mã TOTP tạo trong ứng dụng Authenticator thuộc **Something You Have**, vì quyền tạo mã gắn với thiết bị/khóa bí mật đã đăng ký. OTP qua SMS cũng thường được xem là yếu tố sở hữu số điện thoại, dù số này có thể bị chiếm đoạt qua nhà mạng.

### 2. TOTP dùng được khi điện thoại ngoại tuyến

Khi bật 2FA, máy chủ và ứng dụng Authenticator cùng lưu một **Shared Secret**. Hai bên dùng khóa này cùng thời gian hiện tại (thường chia thành khoảng 30 giây) làm đầu vào cho phép tính HMAC, rồi rút gọn kết quả thành mã số ngắn, thường sáu chữ số. Máy chủ tự tính mã dự kiến và so khớp mã người dùng gửi.

Ứng dụng đã có Shared Secret trên điện thoại và chỉ cần đồng hồ thiết bị để tạo mã; không cần Internet, SMS hay gửi yêu cầu đến máy chủ trong lúc sinh mã. Đồng hồ sai lệch quá lớn có thể khiến mã không được chấp nhận. Shared Secret phải được giữ kín; TOTP giảm rủi ro chiếm SIM nhưng không chống tuyệt đối phishing thời gian thực hoặc malware trên thiết bị.

## Phần 2: So sánh và quyết định

| Tiêu chí                                | SMS OTP                                                                                                                | TOTP Authenticator                                                                                                                                                                     |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **SIM Swapping và nghe lén viễn thông** | Có thể bị ảnh hưởng nếu kẻ xấu chiếm số điện thoại qua Social Engineering/SIM Swapping; SMS đi qua hạ tầng viễn thông. | Không phụ thuộc SIM hay đường truyền SMS; khóa dùng tạo mã nằm trong Authenticator. Giảm đáng kể rủi ro chiếm số, nhưng không an toàn tuyệt đối: cần bảo vệ thiết bị và Shared Secret. |
| **Offline / đi nước ngoài**             | Cần nhận SMS; có thể gián đoạn khi mất sóng, roaming hoặc ở trên máy bay.                                              | Tạo mã ngoại tuyến sau khi đã thiết lập; phù hợp khi đi công tác và không có sóng.                                                                                                     |
| **Tiện dụng / chi phí**                 | Dễ làm quen, không cần cài ứng dụng riêng; tổ chức có thể phát sinh phí gửi tin và phụ thuộc nhà mạng.                 | Cần cài và đăng ký ứng dụng ban đầu; mã được sinh trên thiết bị nên không có phí cho mỗi SMS.                                                                                          |
| **Mất điện thoại**                      | Khôi phục số có thể khôi phục nhận mã nhưng tạo rủi ro nếu kẻ xấu chiếm SIM.                                           | Cần mã khôi phục lưu an toàn hoặc thiết bị dự phòng theo chính sách tổ chức. Mất cả thiết bị và mã dự phòng có thể gây khóa tài khoản.                                                 |

### 3. Lựa chọn cho PixelForge Studio

Nên yêu cầu đội ngũ dùng **TOTP Authenticator** (hoặc khóa bảo mật phần cứng nếu GitHub Enterprise hỗ trợ và tổ chức triển khai được). Tài khoản quản trị bảo vệ mã nguồn và doanh thu có giá trị cao; kỹ sư thường đi nước ngoài hoặc làm việc khi không có sóng, đồng thời có nguy cơ Social Engineering dẫn đến SIM Swapping. TOTP hoạt động ngoại tuyến và không chuyển mã qua mạng di động nên phù hợp hơn SMS. Tổ chức cần kèm quy trình lưu mã khôi phục, thiết bị dự phòng và hỗ trợ khôi phục tài khoản.

## Phần 3: Backup Codes

### 4. Mục đích và cách lưu

Bộ mã khôi phục cho phép đăng nhập khi không dùng được phương thức 2FA chính, chẳng hạn mất/hỏng điện thoại hoặc đổi thiết bị. Mỗi mã thường chỉ dùng một lần; sau khi dùng cần đánh dấu và bảo vệ những mã còn lại.

Hai vị trí an toàn:

1. Lưu trong **Secure Note/kho ghi chú bảo mật của Password Manager**, được bảo vệ bằng Master Passphrase mạnh và 2FA.
2. In hoặc ghi ra giấy, cất trong **két khóa cá nhân** hoặc nơi lưu trữ vật lý được kiểm soát, tách khỏi điện thoại/laptop.

Sai lầm cần tránh: chụp ảnh rồi lưu không bảo vệ trong thư viện ảnh/cloud, gửi qua email/nhóm chat, hay commit lên repository. Ai có mã có thể vượt qua bước 2FA, nên không chia sẻ mã cho người khác.
