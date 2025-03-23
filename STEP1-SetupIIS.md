# Hướng Dẫn Bật IIS Trên Windows

## 1. Bật IIS thông qua Windows Features
1. Nhấn `Win + R`, nhập `appwiz.cpl` và nhấn `Enter` để mở **Programs and Features**.

![Mở Windows Features](./Images/Screenshot%202025-03-22%20135105.png)

2. Chọn **Turn Windows features on or off** ở bên trái.

   ![Mở Windows Features](./Images/Screenshot%202025-03-22%20134915.png)

3. Tìm và tích chọn **Internet Information Services (IIS)**.

   ![Chọn IIS](./Images/Screenshot%202025-03-22%20135213.png)

4. Nhấp vào dấu `+` bên cạnh IIS để mở rộng, sau đó chọn các thành phần cần thiết:
   - **Web Management Tools** (bao gồm IIS Management Console).
   - **World Wide Web Services** (nếu muốn chạy ứng dụng web).
   - **Application Development Features** (bao gồm ASP.NET, .NET Extensibility, CGI, v.v.).
   
   ![Chọn IIS](./Images/Screenshot%202025-03-22%20135303.png)

5. Nhấn **OK** và chờ Windows cài đặt.

6. Khởi động lại máy nếu được yêu cầu.

---

## 2. Kiểm tra IIS đã chạy chưa
1. Mở trình duyệt và nhập địa chỉ: [localhost](http://localhost)
2. Nếu IIS đã được bật, bạn sẽ thấy trang IIS mặc định hiển thị.

![IIS Default Page](./Images/Screenshot%202025-03-22%20135451.png)

---

## 3. Mở IIS Manager
Có hai cách:
- **Cách 1:** Nhấn `Win + R`, nhập `inetmgr`, nhấn `Enter`.
- **Cách 2:** Vào thanh tìm kiếm → Chọn **Internet Information Services (IIS) Manager**. và chọn chạy với quyền admin

![IIS Manager](./Images/Screenshot%202025-03-22%20135557.png)

---

## 4. NEXT STEP
**Cài đặt PHP trên IIS**

[STEP 2 - Hướng Dẫn Cài Đặt PHP trên IIS](./STEP2-SetupPHPOnIIS.md)

---

🎉 Bạn đã bật IIS thành công!
