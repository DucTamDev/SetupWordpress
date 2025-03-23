# Hướng Dẫn Tạo Chứng Chỉ SSL Tự Ký Không Dùng OpenSSL

## 🎯 Bước 1: Tạo chứng chỉ bằng PowerShell

**Dưới đây là đoạn script PowerShell đã chỉnh sửa để:**

- Tên file: investingvietnam_vn_local.pfx
- Mật khẩu: abc12345@
- Lưu vào thư mục:
  `C:\inetpub\wwwroot\investingvietnam.vn\ssl\certs\`

📌 Chạy toàn bộ lệnh này trong PowerShell (Admin)

```powershell
# 1. Tạo chứng chỉ self-signed
$cert = New-SelfSignedCertificate -DnsName "investingvietnam.vn.local" -CertStoreLocation "Cert:\LocalMachine\My"

# 2. Lấy Thumbprint của chứng chỉ vừa tạo
$thumbprint = $cert.Thumbprint

# 3. Định nghĩa mật khẩu bảo vệ file PFX
$certPassword = ConvertTo-SecureString -String "abc12345@" -Force -AsPlainText

# 4. Xuất chứng chỉ ra file .pfx
Export-PfxCertificate -Cert "Cert:\LocalMachine\My\$thumbprint" -FilePath "C:\inetpub\wwwroot\investingvietnam.vn\ssl\certs\investingvietnam_vn_local.pfx" -Password $certPassword

# 5. Xuất chứng chỉ ra file .crt
Export-Certificate -Cert "Cert:\LocalMachine\My\$thumbprint" -FilePath "C:\inetpub\wwwroot\investingvietnam.vn\ssl\certs\investingvietnam_vn_local.crt"

# 6. Import chứng chỉ vào Trusted Root CA để tránh lỗi trình duyệt không tin tưởng
Import-Certificate -FilePath "C:\inetpub\wwwroot\investingvietnam.vn\ssl\certs\investingvietnam_vn_local.crt" -CertStoreLocation "Cert:\LocalMachine\Root"

# 7. Hiển thị thông báo hoàn tất
Write-Host "✅ Chứng chỉ đã được tạo và lưu vào C:\inetpub\wwwroot\investingvietnam.vn\ssl\certs\" -ForegroundColor Green
Write-Host "👉 Đường dẫn PFX: C:\inetpub\wwwroot\investingvietnam.vn\ssl\certs\investingvietnam_vn_local.pfx"
Write-Host "👉 Đường dẫn CRT: C:\inetpub\wwwroot\investingvietnam.vn\ssl\certs\investingvietnam_vn_local.crt"
Write-Host "🔹 Nếu vẫn gặp lỗi, hãy restart trình duyệt và thử lại."

```

---

## 🎯 Bước 2: Cài setting Site chạy HTTPS

📌 **Kiểm tra chứng chỉ trên IIS**

- Mở IIS Manager.
- Chọn Server Certificates để kiểm tra chứng chỉ đã được tạo.

![Kiểm tra chứng chỉ](./Images/Screenshot%202025-03-23%20133913.png)

![Kiểm tra chứng chỉ](./Images/Screenshot%202025-03-23%20134028.png)

📌 **Cấu hình HTTPS cho Site**

1. Trong IIS, chọn website cần cấu hình.
2. Chọn Bindings (trong menu bên phải).
3. Nhấp Add hoặc chọn Edit nếu đã có binding HTTP.
4. Chọn Type: https.
5. Host name `investingvietnam.vn.local`
6. Chọn All Unassigned.
   - Trong phần SSL Certificate, chọn chứng chỉ đã cài đặt `investingvietnam.vn.local`
   - Nhấn OK và Close.

![Cấu hình HTTPS](./Images/Screenshot%202025-03-23%20135013.png)

![Cấu hình HTTPS](./Images/Screenshot%202025-03-23%20135649.png)
📌**Kiểm tra kết quả**

Truy cập website bằng https://investingvietnam.vn.local

Nếu gặp lỗi chứng chỉ, kiểm tra lại trong IIS Manager hoặc cập nhật file hosts.

## NEXT

**Cập nhật lại đường dẫn trong Data base để chuyển trang không bị sai**

[STEP 6 - Hướng Dẫn Update Redirect URL ](./STEP6-UpdatDB.md)
