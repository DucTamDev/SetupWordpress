# Hướng Dẫn Cài Đặt PHP 7.4 Trên IIS

## Mục Lục
1. [Cài Đặt IIS (Nếu Chưa Có)](#1-cài-đặt-iis-nếu-chưa-có)
2. [Tải và Cài Đặt PHP 7.4](#2-tải-và-cài-đặt-php-74)
3. [Cấu Hình PHP](#3-cấu-hình-php)
4. [Cấu Hình IIS để Chạy PHP](#4-cấu-hình-iis-để-chạy-php)
5. [Cấu Hình Biến Môi Trường](#5-cấu-hình-biến-môi-trường)
6. [Kiểm Tra PHP](#6-kiểm-tra-php)

---

## 1. Cài Đặt IIS (Nếu Chưa Có)
Nếu bạn chưa cài đặt IIS, hãy làm theo hướng dẫn chi tiết tại đây:  
➡️ [Hướng Dẫn Cài Đặt IIS trên Windows](./STEP1-SetupIIS.md)

Hoặc thực hiện các bước nhanh sau:
1. Mở **Control Panel** > **Programs** > **Turn Windows features on or off**.
2. Tích chọn **Internet Information Services (IIS)**.
3. Nhấn **OK**, chờ hệ thống cài đặt và khởi động lại máy.

---

## 2. Tải và Cài Đặt PHP 7.4

### Bước 1: Tải PHP 7.4

- Tải bản **Non-Thread Safe (NTS) x64** của PHP 7.4: 
[DOWNLOAD](https://windows.php.net/downloads/releases/php-7.4.33-nts-Win32-vc15-x64.zip)

### Bước 2: Giải nén PHP
- Giải nén file vừa tải về vào thư mục `C:\php`

![Giải nén](./Images/Screenshot%202025-03-22%20140944.png)

---
## 3. Cấu Hình PHP

### Bước 1: Tạo file `php.ini`
- Mở thư mục `C:\php`
- Sao chép file `php.ini-production` và đổi tên thành `php.ini`

### Bước 2: Chỉnh sửa `php.ini`
Mở file `php.ini` bằng Notepad hoặc Notepad++ và chỉnh sửa các dòng sau:

#### 1. Thiết lập thư mục chứa extension
Tìm kiếm `extension_dir` bỏ dấu `;` trước dòng thay đổi

```ini
extension_dir = "\php\ext"
```

#### 2. Bật các extension cần thiết
Bỏ dấu `;` trước các dòng sau:
```ini
extension=bz2
extension=curl
extension=mbstring
extension=mysqli
extension=pdo_mysql
```

#### 3. Thiết lập bộ nhớ tối đa
```ini
memory_limit = 512M
```

#### 4. Hiển thị lỗi (debug)
```ini
display_errors = On
```

---

## 4. Cấu Hình IIS để Chạy PHP

### Bước 1: Mở IIS Manager
- Nhấn `Windows + R`, gõ `inetmgr`, rồi nhấn **Enter**

### Bước 2: Thêm PHP vào IIS
1. Chọn máy chủ (tên máy) ở panel bên trái
2. Chọn **Handler Mappings** > **Add Module Mapping**
3. Điền thông tin:
   - **Request Path**: `*.php`
   - **Module**: `FastCgiModule`
   - **Executable**: `C:\php\php-cgi.exe`
   - **Name**: `PHP via FastCGI`

### Cấu hình Handler Mappings

![PHP IIS](./Images/Screenshot%202025-03-22%20143119.png)

![PHP IIS](./Images/Screenshot%202025-03-22%20143301.png)

4. Nhấn **OK** và xác nhận

5. Restart IIS 
![Restart IIS](./Images/Screenshot%202025-03-22%20143837.png)
---

## 5. Kiểm Tra PHP

### Bước 1: Tạo File `info.php`
Tạo file `C:\inetpub\wwwroot\info.php` với nội dung:
```php
<?php
phpinfo();
?>
```

### Bước 2: Mở Trình Duyệt và Kiểm Tra
- Mở trình duyệt và truy cập `http://localhost/info.php`
- Nếu thấy trang thông tin PHP, cài đặt đã thành công 🎉

### Kiểm tra PHP trên trình duyệt
![Kiểm tra PHP](./Images/Screenshot%202025-03-22%20144047.png)

---

## 6. NEXT STEP
**Cài đặt database MySQL**

[STEP 3 - Hướng Dẫn Cài Đặt Database MySQL](./STEP3-SetupMySQL.md)

---
Chúc bạn cài đặt thành công! 🚀



