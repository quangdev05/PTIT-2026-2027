# 1. Khai báo đường dẫn
$duong_dan_log = ".\server.log"
$duong_dan_bao_cao = ".\report.txt"

# 2. Thông báo bắt đầu
Write-Host "Dang loc log..." -ForegroundColor Cyan

# 3. Tạo tiêu đề (ghi đè)
"=== HE THONG TU DONG LOC LOG ===" |
    Set-Content -Path $duong_dan_bao_cao

# 4. Kiểm tra file log
if (Test-Path -LiteralPath $duong_dan_log -PathType Leaf) {

    # 5. Đọc log và lọc các dòng chứa 404
    Get-Content -Path $duong_dan_log |
        Select-String -SimpleMatch "404" |
        ForEach-Object { $_.Line } |
        Add-Content -Path $duong_dan_bao_cao

    Write-Host "Da loc xong log!" -ForegroundColor Green
    Write-Host "Bao cao: $duong_dan_bao_cao" -ForegroundColor Yellow

}
else {
    Write-Host "Khong tim thay file server.log!" -ForegroundColor Red
}

Write-Host "Hoan tat!" -ForegroundColor Cyan
