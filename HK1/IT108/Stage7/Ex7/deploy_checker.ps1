# Script: deploy_checker.ps1
# Mục đích: Trích xuất lỗi CRITICAL từ server.log vào daily_critical.txt


"=== Bat dau quet log: $(Get-Date) ===" | Out-File daily_critical.txt

$errors = @(Select-String -Path server.log -Pattern "critical")

$errors | ForEach-Object { $_.Line } | Out-File -Append daily_critical.txt

"=== Hoan tat. So dong loi: ===" | Out-File -Append daily_critical.txt

$errors.Count | Out-File -Append daily_critical.txt
