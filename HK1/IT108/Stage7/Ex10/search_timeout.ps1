# Folder gốc cần quét
$Root = "C:\var\logs"
$Keyword = "TIMEOUT"

# Kiểm tra folder
if (-not (Test-Path -LiteralPath $Root -PathType Container)) {
    Write-Error "Folder khong ton tai: $Root"
    return
}

# Tìm TIMEOUT trong tất cả các file và folder con
gci -LiteralPath $Root -Recurse -File -ErrorAction SilentlyContinue |
    ForEach-Object {
        $file = $_

        try {
            sls -LiteralPath $file.FullName `
                -Pattern $Keyword -SimpleMatch -ErrorAction Stop
        }
        catch {
            Write-Warning "Khong doc duoc file: $($file.FullName)"
        }
    } |
    Select-Object Path, LineNumber, Line |
    Format-Table -AutoSize -Wrap
