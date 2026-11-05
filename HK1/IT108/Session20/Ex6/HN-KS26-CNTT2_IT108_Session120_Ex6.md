# Bài 6: Ngăn chặn rò rỉ thông tin bí mật trên GitHub

## 1. Cấu trúc repository mẫu

```text
commerce-app/
|-- .env.example
|-- .gitignore
|-- .gitattributes
|-- .pre-commit-config.yaml
|-- README.md
|-- src/
\- scripts/
    └── pre-push-secret-check.ps1
```

Không đưa `.env`, khóa API thật, private key, token, dữ liệu khách hàng, bản sao database hoặc file cấu hình triển khai chứa bí mật vào repository.

## 2. `.gitignore`

```gitignore
# Bí mật môi trường
.env
.env.*
!.env.example

# Khóa và chứng thư cá nhân
*.pem
*.key
*.p12
*.pfx

# Log, dữ liệu cục bộ và bản sao lưu
*.log
*.sqlite
*.db
*.dump
*.bak

# Phụ thuộc, build và cache
node_modules/
.venv/
venv/
dist/
build/
coverage/
.DS_Store
Thumbs.db
```

Quy tắc `!.env.example` giữ lại mẫu biến môi trường đã làm sạch. Cần rà soát để không vô tình bỏ qua các tệp cần thiết khác.

## 3. `.env.example` cho Dev, Test, Production

Chỉ ghi tên biến và giá trị minh họa vô hại; tuyệt đối không điền thông tin thật.

```dotenv
# Chọn dev, test hoặc production
APP_ENV=dev
APP_PORT=3000

# DEV — chỉ dành cho máy cá nhân, dùng dịch vụ giả lập/local
DEV_DATABASE_URL=postgres://user:change-me@localhost:5432/commerce_dev
DEV_PAYMENT_API_KEY=replace-with-local-test-key
DEV_JWT_SECRET=replace-with-random-local-secret

# TEST — dùng sandbox và dữ liệu giả
TEST_DATABASE_URL=postgres://user:change-me@localhost:5432/commerce_test
TEST_PAYMENT_API_KEY=replace-with-provider-sandbox-key
TEST_JWT_SECRET=replace-with-random-test-secret

# PRODUCTION — lấy từ Secret Manager/KMS lúc triển khai, không commit
PROD_DATABASE_URL=provided-at-deploy-time
PROD_PAYMENT_API_KEY=provided-at-deploy-time
PROD_JWT_SECRET=provided-at-deploy-time
```

Trong triển khai thực tế, mỗi môi trường có secret riêng, quyền truy cập tối thiểu và kho bí mật (ví dụ GitHub Actions Secrets hoặc cloud Secret Manager). Không đưa secret Production vào file `.env.example`, mã nguồn, log hoặc artifact build. Tránh đặt tên/giá trị khiến người khác tưởng giá trị mẫu là credential có thể dùng.

## 4. Pre-push checklist

1. Kiểm tra `git status` và `git diff --cached`; xác nhận không có `.env`, khóa, token hay dữ liệu cá nhân.
2. Quét toàn bộ lịch sử Git, không chỉ thay đổi mới, bằng secret scanner như Gitleaks hoặc TruffleHog.
3. Chạy kiểm tra trước push và trong CI; không xem cảnh báo là an toàn nếu chưa xác minh. Ghi ngoại lệ có lý do, phạm vi hẹp và người duyệt.
4. Xác nhận `.gitignore` có hiệu lực, `.env.example` chỉ chứa placeholder, không có credential trong README, issue, workflow, log hay ảnh chụp.
5. Rà soát quyền repository, workflow GitHub Actions, dependency và dữ liệu mẫu trước khi chuyển Public.
6. Nếu phát hiện bí mật: dừng push, thu hồi/đổi credential ngay. Xóa khỏi lịch sử Git bằng quy trình phù hợp rồi force-push có phối hợp; xóa lịch sử không thay thế việc thu hồi secret vì bản sao có thể đã tồn tại.

### Mẫu kiểm tra trước push (PowerShell)

```powershell
# Yêu cầu cài Gitleaks trước: https://github.com/gitleaks/gitleaks
# Chạy tại thư mục gốc repository trước khi push.
$ErrorActionPreference = 'Stop'

git diff --cached --check
if ($LASTEXITCODE -ne 0) { throw 'Có lỗi whitespace trong staged diff.' }

gitleaks git . --redact --exit-code 1
if ($LASTEXITCODE -ne 0) { throw 'Gitleaks phát hiện bí mật. Dừng push và xử lý.' }

Write-Host 'Kiểm tra bí mật hoàn tất. Vẫn cần rà soát thủ công thay đổi staged.'
```

Để tránh người dùng quên chạy thủ công, tích hợp cùng lệnh quét vào CI bắt buộc và bảo vệ nhánh. Hook cục bộ chỉ là lớp tiện ích vì có thể bị bỏ qua; CI là cổng kiểm soát đáng tin cậy hơn.

## 5. Bật 2FA bắt buộc

Với GitHub organization, quản trị viên vào **Organization settings → Authentication security**, bật yêu cầu xác thực hai yếu tố cho thành viên. Thông báo thời hạn cho team, yêu cầu từng người bật 2FA bằng passkey/security key hoặc ứng dụng xác thực, đồng thời thiết lập mã khôi phục an toàn. Sau thời hạn, tài khoản chưa bật 2FA có thể mất quyền truy cập organization. Nếu repository thuộc tài khoản cá nhân, chủ sở hữu cần yêu cầu cộng tác viên bật 2FA và kiểm tra quyền truy cập định kỳ.

Ưu tiên passkey hoặc khóa bảo mật chống phishing; có thể cấu hình thêm phương thức dự phòng. Không chia sẻ mã khôi phục trong chat hoặc repository. Thu hồi quyền của tài khoản không còn tham gia dự án.

## 6. Rủi ro nếu thiếu `.gitignore`

| Rủi ro                                                    | Hậu quả có thể xảy ra                                    | Giảm thiểu                                                             |
| --------------------------------------------------------- | -------------------------------------------------------- | ---------------------------------------------------------------------- |
| `.env` chứa khóa API bị commit                            | Người ngoài gọi API, phát sinh phí hoặc truy cập dữ liệu | Ignore `.env`, secret scanning, thu hồi/đổi khóa ngay                  |
| Private key/chứng thư bị đẩy lên public                   | Chiếm quyền dịch vụ, ký hoặc giải mã trái phép           | Bảo vệ mẫu file khóa, dùng Secret Manager, xoay vòng khóa              |
| Database, log hoặc bản sao lưu bị công khai               | Lộ thông tin cá nhân, đơn hàng, token phiên              | Ignore dữ liệu cục bộ, dùng dữ liệu giả, kiểm tra trước release        |
| File build/cache chứa cấu hình nhúng                      | Bí mật vẫn lọt vào artifact dù source có vẻ sạch         | Quét cả artifact và lịch sử; không nhúng secret lúc build              |
| Credential đã bị xóa ở commit mới nhưng còn trong lịch sử | Có thể khôi phục từ commit cũ/fork/cache                 | Thu hồi credential, xử lý lịch sử, rà soát bản sao và thông báo nội bộ |

`.gitignore` chỉ ngăn Git thêm các file chưa được theo dõi; nó không xóa file đã commit khỏi lịch sử và không phát hiện mọi bí mật bị hardcode trong mã nguồn. Vì vậy cần dùng secret scanner, review, CI, quyền tối thiểu và quy trình xoay vòng credential.
