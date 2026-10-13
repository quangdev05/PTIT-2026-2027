# Script: hourly_log.ps1
# Mục đích: Trích xuất lỗi và cộng dồn vào weekly_errors.txt

"[$(Get-Date)] --- Bat dau quet ---" | Out-File weekly_errors.txt -Append

sls -Path app.log -Pattern "error" | Out-File weekly_errors.txt -Append

"[$(Get-Date)] --- Ket thuc quet ---" | Out-File weekly_errors.txt -Append
