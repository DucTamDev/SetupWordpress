# Hướng dẫn Setup chạy Wordpress

## 1. Giải nén File

- Giải nén file backup wordpress

![Giải nén file](./Images/Screenshot%202025-03-22%20161126.png)

## 2. Hướng Dẫn Import File SQL Vào MySQL Bằng MySQL Workbench

### 🛠 Bước 1: Mở MySQL Workbench & Kết Nối Đến MySQL

- Mở **MySQL Workbench**.

  ![Mở MySQL Workbench](./Images/Screenshot%202025-03-22%20155309.png)

- Nhấn vào kết nối MySQL của bạn (thường là `Local instance MySQL`).

  ![Mở MySQL Workbench](./Images/Screenshot%202025-03-22%20160009.png)

  ![Mở MySQL Workbench](./Images/Screenshot%202025-03-22%20160128.png)

- Chọn **OK**

- Tạo Database `investin_vn`

  ![Tạo Database](./Images/Screenshot%202025-03-22%20160454.png)

- Chọn **Apply**

  ![Tạo Database](./Images/Screenshot%202025-03-22%20160732.png)

### 📂 Bước 2: Chọn "Data Import"

- Vào **Server** → Chọn **Data Import**.

  ![Import file slq](./Images/Screenshot%202025-03-22%20161838.png)

### 📥 Bước 3: Chọn File SQL Cần Import

- Chọn **"Import from Self-Contained File"**.
- Nhấn **Browse** và chọn file `investin_vn.sql` trong folder backup đã giải nén trước đó.
  ![Import file slq](./Images/Screenshot%202025-03-22%20161559.png)

- Ở mục **Default Target Schema**, chọn database `investin_vn`.

  ![Import file slq](./Images/Screenshot%202025-03-22%20161958.png)

### ▶ Bước 4: Chạy Import

- Nhấn Tab **Import Progress**
- Nhấn **Start Import** và chờ hoàn tất.

### ✅ Bước 5: Kiểm Tra Dữ Liệu Đã Import

- Sau khi import xong, vào **Schemas** bên trái, nhấn chuột phải vào database → **Refresh**.
- Dữ liệu sẽ xuất hiện trong bảng.

  ![Import file slq](./Images/Screenshot%202025-03-22%20162316.png)

🎉 **Hoàn Thành!** Bạn đã import file SQL vào MySQL thành công bằng Workbench.

## 3. Hướng Dẫn Cấu Hình WordPress Trên IIS

### ▶ Bước 1: Di Chuyển Thư Mục investingvietnam.vn WordPress Vào wwwroot

- Trong folder domains đã giải nén, di chuyển folder **investingvietnam.vn** vào `C:\inetpub\wwwroot`

![Di chuyển domain](./Images/Screenshot%202025-03-22%20163538.png)

### ▶ Bước 2: Cấu hình domain trên IIS

**1. Mở IIS Manager**

- Nhấn Win + R, nhập inetmgr, nhấn Enter.

- Nhấn chuột phải, hêm mới một Application Pool:
  ![Thêm app pool](./Images/Screenshot%202025-03-22%20164227.png)

- Name: **Investing Viet Nam Local**

**2. Cấu Hình Website**

- Nhấn chuột phải **Sites** -> **Add Website**
- Site name: **investingvietnam.vn.local**
- Application Pool chọn: **Investing Viet Nam Local**
- Physical path: `C:\inetpub\wwwroot\investingvietnam.vn\public_html`
- Binding:
  - Type: http
  - IP Address: All Unassigned
  - Port: 8080
- Nhấn **OK** để tạo site.

![Thêm app pool](./Images/Screenshot%202025-03-23%20124936.png)

### ▶ Bước 3: Cấu hình RewriteUrl

#### 1. Tạo file `web.config`

Lưu file vào đường dẫn:
`C:\inetpub\wwwroot\investingvietnam.vn\public_html`

![Rewrite Url](./Images/Screenshot%202025-03-23%20130407.png)

Trong file có nội dung

#### 2. Nội dung file `web.config`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <system.webServer>
        <defaultDocument>
            <files>
                <add value="index.php" />
            </files>
        </defaultDocument>
        <rewrite>
            <rules>
                <rule name="WordPress Permalinks" stopProcessing="true">
                    <match url=".*" />
                    <conditions>
                        <add input="{REQUEST_FILENAME}" matchType="IsFile" negate="true" />
                        <add input="{REQUEST_FILENAME}" matchType="IsDirectory" negate="true" />
                    </conditions>
                    <action type="Rewrite" url="index.php" />
                </rule>
            </rules>
        </rewrite>
    </system.webServer>
</configuration>
```

### ▶ Bước 4: Cấu hình DNS Local trên Windows

#### 📌 Các bước thực hiện:

1. Mở **Notepad** với quyền **Administrator** (Run as Administrator).
2. Mở file `hosts` bằng cách vào đường dẫn:
   ```
   C:\Windows\System32\drivers\etc\hosts
   ```
3. Thêm dòng sau vào cuối file:
   ```
   127.0.0.1 investingvietnam.vn.local
   ```

![DNS host](./Images/Screenshot%202025-03-23%20131053.png)

![DNS host](./Images/Screenshot%202025-03-23%20131351.png)

#### 👍 Xem trang web:

- Truy cập `http://investingvietnam.vn.local:8080/`

![DNS host](./Images/Screenshot%202025-03-23%20131544.png)

## 4. NEXT

[STEP 5 -Hướng Dẫn Cài Đặt HTTPS ](./STEP5-CreateSSL%20.md)

---

Chúc bạn cài đặt thành công! 🚀
