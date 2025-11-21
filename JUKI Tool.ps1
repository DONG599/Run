# --- CẤU HÌNH ---
$ExeUrl = "https://release-assets.githubusercontent.com/github-production-release-asset/853652481/bade9798-9766-4b1b-8f71-6fb2bd341313?sp=r&sv=2018-11-09&sr=b&spr=https&se=2025-11-21T20%3A32%3A56Z&rscd=attachment%3B+filename%3DJUKI.Tool.V1.0.1.exe&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2025-11-21T19%3A32%3A35Z&ske=2025-11-21T20%3A32%3A56Z&sks=b&skv=2018-11-09&sig=lLKRyYX%2ByERxgVrN%2BqewxDibeVDIs9A5CwT382Fpx3k%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc2Mzc1NTk3MCwibmJmIjoxNzYzNzU0MTcwLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.-5VNgUXyDyerQWaipu4liUGqzXBmD-1jZl7_Pgy8wtU&response-content-disposition=attachment%3B%20filename%3DJUKI.Tool.V1.0.1.exe&response-content-type=application%2Foctet-stream"
$SavePath = "$env:TEMP\JUKI Tool V1.0.1.exe" # Lưu vào thư mục Temp

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