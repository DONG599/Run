# --- CẤU HÌNH ---
# Link file 1: JUKI Tool
$Url1 = "https://github.com/DONG599/DWL-OS-/releases/download/JUKI-Tool/JUKI.exe"

# Link file 2: Z-Boot (BẠN HÃY DÁN LINK TẢI THỰC TẾ VÀO DƯỚI ĐÂY)
$Url2 = "https://github.com/DONG599/DWL-OS-/releases/download/JUKI-Tool/Z-Boot.1-Click.WinPE.HDD.exe" 

# --- GIAO DIỆN MENU ---
Clear-Host
Write-Host "------------------------------------------------" -ForegroundColor Cyan
Write-Host "           MULTI TOOL DOWNLOADER                " -ForegroundColor Green
Write-Host "------------------------------------------------" -ForegroundColor Cyan
Write-Host "Vui long chon phien ban muon tai:" -ForegroundColor White
Write-Host " [1] JUKI Tool (Link chinh)" -ForegroundColor Yellow
Write-Host " [2] Z-Boot 1-Click WinPE HDD" -ForegroundColor Magenta
Write-Host "------------------------------------------------" -ForegroundColor Cyan

$selection = Read-Host "Nhap so (1 hoac 2)"

# --- XỬ LÝ LỰA CHỌN ---
switch ($selection) {
    '1' { 
        $ExeUrl = $Url1
        # Đặt tên file lưu riêng cho JUKI
        $SavePath = "$env:TEMP\JUKI.exe" 
        Write-Host "-> Ban da chon: JUKI Tool" -ForegroundColor Green 
    }
    '2' { 
        $ExeUrl = $Url2
        # Đặt tên file lưu riêng cho Z-Boot (nên giữ đúng tên file gốc)
        $SavePath = "$env:TEMP\Z-Boot 1-Click WinPE HDD.exe"
        Write-Host "-> Ban da chon: Z-Boot 1-Click WinPE HDD" -ForegroundColor Magenta 
    }
    Default { 
        $ExeUrl = $Url1
        $SavePath = "$env:TEMP\JUKI.exe"
        Write-Host "-> Lua chon khong hop le. Mac dinh tai JUKI Tool." -ForegroundColor DarkYellow 
    }
}

try {
    # Kiểm tra xem người dùng đã thay link chưa (tránh lỗi link ảo)
    if ($ExeUrl -eq "DÁN_LINK_ZBOOT_CỦA_BẠN_VÀO_ĐÂY") {
        Write-Host "LOI: Ban chua cap nhat link tai cho Z-Boot trong code!" -ForegroundColor Red
        Write-Host "Vui long mo file script len va sua bien `$Url2`." -ForegroundColor Red
        Read-Host "Nhan Enter de thoat..."
        exit
    }

    # 1. Tải file về
    Write-Host "Dang tai xuong [$ExeUrl]..." -ForegroundColor Cyan
    $WebClient = New-Object System.Net.WebClient
    $WebClient.DownloadFile($ExeUrl, $SavePath)

    # 2. Tự động chạy file
    Write-Host "Da tai xong! Dang khoi dong tool..." -ForegroundColor Yellow
    
    # Chạy file với quyền Admin (nếu cần thiết cho Z-Boot)
    Start-Process -FilePath $SavePath -Wait 
    
}
catch {
    Write-Host "LOI: Khong the tai tool." -ForegroundColor Red
    Write-Host "Chi tiet: " $_.Exception.Message -ForegroundColor Red
    Write-Host "Loi thuong gap: Link hong, mat mang, hoac file dang chay nen khong the ghi de." -ForegroundColor Gray
    Read-Host "Nhan Enter de thoat..."
}
catch {
    Write-Host "Loi: Khong the tai tool. Kiem tra lai ket noi mang!" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}



