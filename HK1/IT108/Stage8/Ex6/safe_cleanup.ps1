
# 1. Khai báo đường dẫn
$thu_muc_du_an = $PSScriptRoot
$thu_muc_logs = Join-Path $thu_muc_du_an "logs"

# 2. Check folder logs
if (-not (Test-Path -LiteralPath $thu_muc_logs -PathType Container)) {
    Write-Host "Khong tim thay thu muc logs!" -ForegroundColor Red
    exit 1
}

# 3. Di chuyển vào folder logs
Set-Location -LiteralPath $thu_muc_logs

Write-Host "Dang loc WARNING tu system.log..." -ForegroundColor Cyan

# 4. Check file logs
if (-not (Test-Path -LiteralPath ".\system.log" -PathType Leaf)) {
    Write-Host "Khong tim thay system.log!" -ForegroundColor Red
    exit 1
}

# 5. Lọc các dòng WARNING từ system.log và ghi vào issues.txt
Select-String -Path ".\system.log" -SimpleMatch "WARNING" |
    ForEach-Object { $_.Line } |
    Set-Content -Path ".\issues.txt"

Write-Host "Da tao bao cao issues.txt" -ForegroundColor Green

# 6. Liệt kê trước các file .tmp trong thư mục logs
Write-Host "Cac tep .tmp se bi xoa:" -ForegroundColor Yellow

Get-ChildItem -Path $thu_muc_logs -Filter "*.tmp" -File

# 7. Chỉ xoá file .tmp trong thư mục logs
Get-ChildItem -Path $thu_muc_logs -Filter "*.tmp" -File |
    Remove-Item -WhatIf

Write-Host "Da kiem tra lenh xoa. Xem lai ket qua WhatIf truoc khi xoa that." -ForegroundColor Cyan
