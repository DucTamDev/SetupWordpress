# Hướng Dẫn Cài Đặt MySQL Trên Windows

## 1. Tải MySQL Installer

Truy cập trang web chính thức của MySQL để tải MySQL Installer:

- Link tải: [https://dev.mysql.com/downloads/installer/](https://dev.mysql.com/downloads/installer/)
- Chọn phiên bản **MySQL Installer for Windows** (Full hoặc Web Community)

![Tải MySQL Installer](./Images/Screenshot%202025-03-22%20144733.png)

![Tải MySQL Installer](./Images/Screenshot%202025-03-22%20144901.png)

## 2. Cài Đặt MySQL

### Bước 1: Chạy MySQL Installer

- Mở file cài đặt vừa tải về.
- Chọn **Full**

![Chạy MySQL Installer](./Images/Screenshot%202025-03-22%20145732.png)

### Bước 2: Chọn Các Thành Phần Cài Đặt

- Nhấn **Execute** để tiếp tục.

![Chạy MySQL Installer](./Images/Screenshot%202025-03-22%20150533.png)

![Hoàn thành MySQL Installer](./Images/Screenshot%202025-03-22%20151327.png)

Sau khi hoàn thành cài đặt chọn **Next** để cấu hình.

### Bước 3: Cấu Hình MySQL Server

- Chọn **Config Type: Development Machine**
- Chọn **Port** mặc định là `3306`.
- Chọn **Next**

![Cấu hình MySQL Server](./Images/Screenshot%202025-03-22%20151533.png)

![Cấu hình MySQL Server](./Images/Screenshot%202025-03-22%20151739.png)

- Chọn **Next**

### Bước 4: Cấu Hình Tài Khoản

- Nhập mật khẩu cho tài khoản **root**. ( 1234 cho đơn giản )

![Cấu hình tài khoản MySQL](./Images/Screenshot%202025-03-22%20152200.png)

- Chọn AddUser thêm tài khoản:
- **user**: `investin_vn` **password** : `CkhvxXTthq`

![Cấu hình tài khoản MySQL](./Images/Screenshot%202025-03-22%20152512.png)

- **OK**
- **Next**

### Bước 5: Cài Đặt Dịch Vụ

- Để mặc định hoặc tùy chỉnh tên dịch vụ.
- Chọn **Start MySQL Server at System Startup** để tự khởi động MySQL cùng Windows.

![Cấu hình dịch vụ MySQL](./Images/Screenshot%202025-03-22%20152732.png)


**Next**

![Cấu hình dịch vụ MySQL](./Images/Screenshot%202025-03-22%20152824.png)

**Next**

### Bước 6: Hoàn Tất Cài Đặt

- Nhấn **Execute** để cài đặt.
- Nhấn **Finish** khi hoàn tất.

![Hoàn tất cài đặt MySQL](./Images/Screenshot%202025-03-22%20152934.png)

## 3. NEXT**

[STEP 4 - Hướng Dẫn Cài Đặt WebSite](./STEP4-SetWebWordpress.md)

---
Chúc bạn cài đặt thành công! 🚀
