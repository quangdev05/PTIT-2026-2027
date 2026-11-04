# Bài 3: Khắc phục sự cố rò rỉ thông tin đăng nhập

## 1. Báo cáo phân tích IPO

| Thành phần | Nội dung |
|---|---|
| **Input** | Máy tính có dấu hiệu nhiễm **Infostealer**; Facebook và Gmail liên tục bị chiếm quyền. Mật khẩu, cookie phiên, token và dữ liệu trong trình duyệt có thể đã bị đánh cắp. |
| **Process** | Cô lập máy; dùng thiết bị sạch để bảo vệ tài khoản và thu hồi quyền; làm sạch/cài lại máy; khôi phục dữ liệu an toàn và tăng cường bảo vệ. |
| **Output** | Thiết bị sạch, phiên/token cũ bị vô hiệu hóa, mật khẩu mới và riêng biệt, 2FA được bật, tài khoản được theo dõi để phát hiện đăng nhập bất thường. |

## 2. Quy trình cấp cứu 4 bước

### Bước 1: Cô lập thiết bị nghi nhiễm

Ngắt Wi-Fi, Ethernet và Bluetooth; không tiếp tục đăng nhập hay đổi mật khẩu trên máy đó. Việc này hạn chế mã độc gửi dữ liệu ra ngoài hoặc tiếp tục lấy thông tin. Không cắm USB/ổ cứng sao lưu vào máy nghi nhiễm.

### Bước 2: Dùng thiết bị sạch để bảo vệ tài khoản

Dùng điện thoại hoặc máy tính khác đã cập nhật và đáng tin cậy. Ưu tiên bảo vệ email chính vì email thường dùng để đặt lại mật khẩu các tài khoản khác. Đổi mật khẩu thành mật khẩu dài, duy nhất; bật 2FA; kiểm tra email/số điện thoại khôi phục và xóa thông tin lạ. Sau đó đổi mật khẩu Facebook, GitHub và các dịch vụ quan trọng khác. Không tái sử dụng mật khẩu cũ.

### Bước 3: Thu hồi phiên và quyền truy cập (Revoke)

Đăng xuất khỏi mọi phiên đang hoạt động, thu hồi token, ứng dụng OAuth và thông tin xác thực không nhận ra. Trên GitHub:

1. Mở **Settings** -> **Password and authentication**.
2. Trong phần **Sessions**, đăng xuất các phiên không nhận ra hoặc kết thúc các phiên khác.
3. Mở **Settings** -> **Applications** → **Authorized OAuth Apps** và **GitHub Apps**; thu hồi quyền của ứng dụng lạ hoặc không còn sử dụng.
4. Mở **Settings** -> **Developer settings** → **Personal access tokens**; thu hồi token lạ và tạo token mới với quyền tối thiểu nếu cần.
5. Kiểm tra **SSH and GPG keys**; xóa khóa SSH lạ. Kiểm tra email cảnh báo và lịch sử hoạt động tài khoản.

Tên mục có thể khác nhẹ theo giao diện GitHub. Cookie phiên hoặc token bị đánh cắp có thể cho phép truy cập mà không cần nhập lại mật khẩu, nên chỉ đổi mật khẩu là chưa đủ.

### Bước 4: Làm sạch thiết bị và phục hồi an toàn

Từ thiết bị sạch, chỉ sao lưu tài liệu cần thiết; không sao lưu chương trình hoặc file đáng ngờ. Quét bằng công cụ bảo mật cập nhật. Với dấu hiệu Infostealer, phương án đáng tin cậy là cài mới hệ điều hành từ nguồn chính thức hoặc nhờ kỹ thuật viên xử lý; cài lại ứng dụng từ nguồn tin cậy và cập nhật hệ thống. Sau đó đăng nhập lại, dùng mật khẩu riêng, bật 2FA và theo dõi cảnh báo đăng nhập.

## 3. Vì sao cần cả đổi mật khẩu và Revoke Token?

Đổi mật khẩu ngăn kẻ xấu dùng lại mật khẩu đã biết trong lần đăng nhập mới. Cookie phiên hoặc Personal Access Token bị lấy cắp có thể tiếp tục được dùng độc lập với mật khẩu. Thu hồi phiên/token làm vô hiệu thông tin truy cập cũ, vì vậy cần thực hiện cả hai việc.
