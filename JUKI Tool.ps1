# --- CẤU HÌNH ---
$ExeUrl = "https://github.com/DONG599/DWL-OS-/releases/download/JUKI-Tool/JUKI.exe"
$SavePath = "$env:TEMP\JUKI.exe" # Lưu vào thư mục Temp

# --- GIAO DIỆN ---
Write-Host "------------------------------------------------" -ForegroundColor Cyan
Write-Host "      DANG TAI JUKI INSTALLER TOOL...           " -ForegroundColor Green
Write-Host "------------------------------------------------" -ForegroundColor Cyan

try {
    # 1. Tải file về (Sử dụng WebClient cho ổn định)
    $WebClient = New-Object System.Net.WebClient
    $WebClient.DownloadFile($ExeUrl, $SavePath)

    # 2. Chạy file
    Write-Host "Da tai xong! Dang khoi dong tool..." -ForegroundColor Yellow
    Start-Process -FilePath $SavePath -Wait # -Wait để chờ tool đóng mới kết thúc lệnh (tuỳ chọn)
    
    # 3. (Tuỳ chọn) Xóa file sau khi dùng xong để sạch máy
    # Remove-Item -Path $SavePath -Force
}
catch {
    Write-Host "Loi: Khong the tai tool. Kiem tra lai ket noi mang!" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}

