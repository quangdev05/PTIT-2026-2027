# Bài Tổng Hợp: Rà soát an toàn thông tin dự án SmartCampus

## Phần 1 – Nhận diện rủi ro và xử lý sự cố

### 1. Email giả mạo GitHub

Đây là **Phishing** có sử dụng **Typosquatting**. Tên miền `githuh-security.com` cố tình thay chữ `b` trong `github` bằng `h`, không phải tên miền chính thức `github.com`. Email tạo áp lực bằng thông báo tài khoản bị khóa và yêu cầu nhập lại mật khẩu tại đường dẫn giả. Không bấm link, không nhập thông tin; tự mở GitHub bằng địa chỉ đã biết hoặc ứng dụng chính thức để kiểm tra cảnh báo.

Áp dụng Quy tắc 5 KHÔNG: **Không bấm vào link lạ/không xác minh** và **Không cung cấp mật khẩu, OTP hay thông tin nhạy cảm qua trang được gửi trong email**.

### 2. Phần mềm crack

Đây là bẫy **phần mềm crack kèm nguy cơ mã độc/Infostealer**. Yêu cầu tắt Windows Defender nhằm vô hiệu hóa lớp bảo vệ để file độc hại không bị phát hiện hoặc chặn. Không giải nén/chạy file; không tắt antivirus theo hướng dẫn của trang tải. Áp dụng điều **Không cài phần mềm crack hoặc file từ nguồn không tin cậy**, đồng thời không tắt công cụ bảo vệ.

Nếu đã chạy file, thực hiện đúng thứ tự bốn bước:

1. **Cô lập máy:** ngắt Wi-Fi/Ethernet, dừng sử dụng máy để đăng nhập; không cắm ổ sao lưu.
2. **Dùng thiết bị sạch bảo vệ tài khoản:** đổi mật khẩu email trước, sau đó đổi các tài khoản quan trọng bằng mật khẩu riêng; bật 2FA.
3. **Thu hồi quyền truy cập:** đăng xuất phiên lạ, revoke token/OAuth, kiểm tra khóa SSH và hoạt động tài khoản GitHub; thu hồi thông tin xác thực nghi bị lộ.
4. **Làm sạch máy:** quét và xử lý từ thiết bị/công cụ đáng tin cậy; nếu nghi Infostealer, cài lại hệ điều hành từ nguồn chính thức. Khôi phục tài liệu đã kiểm tra, cập nhật máy và theo dõi cảnh báo đăng nhập.

## Phần 2 – Chuyển sang Password Manager

### 3. Rủi ro dùng chung mật khẩu

Nếu mật khẩu email nhóm bị lộ, kẻ xấu có thể thử cùng cặp email/mật khẩu ở GitHub và Vercel. Đây là **Credential Stuffing** (dùng thông tin đăng nhập bị lộ để thử trên dịch vụ khác). Nếu mật khẩu được tái sử dụng, cả ba tài khoản có nguy cơ bị chiếm quyền. Cần đổi mỗi tài khoản sang mật khẩu riêng và thu hồi các phiên đang hoạt động.

**Zero-Knowledge Architecture** có nghĩa dữ liệu Vault được mã hóa phía người dùng trước khi đồng bộ. Nhà cung cấp lưu bản mã hóa và không nắm khóa giải mã theo thiết kế, nên việc xâm nhập máy chủ không tự động giúp đọc nội dung Vault. Điều này không bảo vệ người dùng nếu Master Passphrase yếu/bị lộ, thiết bị nhiễm mã độc hoặc người dùng bị lừa cung cấp quyền truy cập.

### 4. Cấu hình Password Generator

Tạo ba mật khẩu ngẫu nhiên, khác nhau cho GitHub, Vercel và email nhóm; không tự đặt hoặc tái sử dụng mật khẩu mẫu.

| Thông số         | Cấu hình đề xuất                      |
| ---------------- | ------------------------------------- |
| Độ dài           | 20 ký tự trở lên (đề xuất 24)         |
| Chữ hoa (A–Z)    | Bật                                   |
| Chữ thường (a–z) | Bật                                   |
| Chữ số (0–9)     | Bật                                   |
| Ký tự đặc biệt   | Bật, dùng tập ký tự dịch vụ chấp nhận |

Lưu mật khẩu trong Password Manager, bảo vệ Vault bằng Master Passphrase dài và duy nhất. Không ghi mật khẩu thật vào báo cáo/repository.

## Phần 3 – Kích hoạt 2FA cho GitHub

### 5. Vì sao chọn Authenticator TOTP?

SMS OTP dễ bị ảnh hưởng bởi **SIM Swapping** (chiếm số thông qua nhà mạng) và phụ thuộc khả năng nhận tin qua viễn thông. TOTP tạo mã ngay trên thiết bị đã đăng ký, hoạt động ngoại tuyến và không cần SMS; phù hợp hơn cho tài khoản tổ chức. TOTP không chống tuyệt đối phishing, nên cần kiểm tra đúng tên miền GitHub và không đọc mã cho người khác.

### 6. Các bước thiết lập Google Authenticator

1. Đăng nhập GitHub bằng đường dẫn chính thức; mở ảnh đại diện → **Settings**.
2. Chọn **Password and authentication**.
3. Trong **Two-factor authentication**, chọn **Enable two-factor authentication** và chọn **Authenticator app** (nếu giao diện hiển thị lựa chọn).
4. Mở Google Authenticator trên điện thoại, chọn thêm tài khoản và quét QR code GitHub hiển thị. Nếu không quét được, nhập setup key theo hướng dẫn của GitHub; không chia sẻ QR/key.
5. Ứng dụng tạo mã 6 chữ số thay đổi theo chu kỳ. Nhập mã hiện tại vào GitHub để xác nhận bật 2FA.
6. Tạo/tải bộ Recovery Codes và cất an toàn trước khi kết thúc thiết lập.

### 7. Lưu Recovery Codes

**Nên:** lưu trong Secure Note của Password Manager; đồng thời có thể giữ bản giấy trong két khóa hoặc nơi lưu trữ vật lý an toàn, tách khỏi điện thoại. Hạn chế người có quyền truy cập và cập nhật bản lưu khi mã được dùng/tạo lại.

**Không nên:** lưu ảnh chụp không bảo vệ trên điện thoại/cloud, gửi qua email/nhóm chat, để trong thư mục chia sẻ công khai hoặc commit lên GitHub. Mã khôi phục là thông tin xác thực nhạy cảm.

## Phần 4 – Bảo vệ Secrets trước khi push

### 8. Nhận diện hai giá trị bị hardcode

Trong đoạn code mẫu, hai giá trị Secret là API Key (`sk-proj-abc123456789`) và mật khẩu database (`SmartCampus@2026`). Đây là giá trị mẫu do đề cung cấp, nhưng nếu chúng từng được dùng thật thì phải xem là đã lộ: thu hồi/đổi ngay, kiểm tra lịch sử sử dụng và chi phí. Xóa khỏi file hiện tại không làm chúng biến mất khỏi lịch sử Git.

### 9. Code sau khi sửa

```js
const API_KEY = process.env.API_KEY;
const DB_PASSWORD = process.env.DB_PASSWORD;

if (!API_KEY || !DB_PASSWORD) {
  throw new Error("Missing required environment variables");
}

function connectDatabase() {
  return connect(DB_PASSWORD);
}
```

Mã nguồn chỉ đọc biến môi trường; không ghi giá trị bí mật trực tiếp trong code.

### 10. Nội dung các file cấu hình

#### `.env` (chỉ trên máy/môi trường riêng, không commit)

```env
API_KEY=<API key mẫu trong đề; thay bằng key mới, đã được cấp riêng>
DB_PASSWORD=<mật khẩu mẫu trong đề; thay bằng mật khẩu mới, duy nhất>
```

Đề yêu cầu minh họa file `.env` với giá trị thật, nhưng hai chuỗi trong đề có dạng thông tin xác thực và đã được công khai trong tài liệu. Vì vậy không sao chép chúng vào một file làm việc mới. Khi cấu hình dự án cục bộ, thay chỗ trống bằng secrets mới được cấp; tuyệt đối không commit file này. Nếu giá trị mẫu từng được dùng thật, hãy thu hồi và tạo giá trị mới.

#### `.gitignore`

```gitignore
# Secrets và cấu hình môi trường cục bộ
.env
.env.*
!.env.example
```

Quy tắc phủ định giữ `.env.example` được phép commit. Nếu `.env` đã được Git theo dõi từ trước, chỉ thêm vào `.gitignore` là chưa đủ: phải bỏ theo dõi file và xử lý lịch sử phù hợp; key thật vẫn cần được rotate.

#### `.env.example` (được phép commit)

```env
API_KEY=
DB_PASSWORD=
```

File mẫu chỉ liệt kê tên biến, không chứa giá trị thật.

### 11. Quy tắc 4 bước kiểm tra trước khi Push

1. **Rà soát nội dung:** đọc diff và các file sẽ commit; tìm API key, mật khẩu, token, private key, dữ liệu cá nhân. Xác nhận code chỉ dùng `process.env`.
2. **Rà soát file được theo dõi:** kiểm tra `.env`, file backup, log và file cấu hình cục bộ không nằm trong danh sách commit; xác nhận `.gitignore` áp dụng và chỉ `.env.example` được chia sẻ.
3. **Quét bí mật và kiểm tra lịch sử:** chạy secret scanner (ví dụ Gitleaks hoặc công cụ của nền tảng) trên working tree và commit; kiểm tra cả commit sắp push. Nếu phát hiện Secret thật, dừng push, thu hồi/rotate key và xử lý lịch sử.
4. **Xác nhận lần cuối:** xem lại danh sách file/diff staged, xác nhận đúng repository/nhánh/remote và quyền truy cập dự kiến; chỉ push khi không còn Secret, file nhạy cảm hoặc thay đổi ngoài ý muốn.
