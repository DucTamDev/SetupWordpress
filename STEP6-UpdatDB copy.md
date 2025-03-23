# 📌 Hướng Dẫn Tạo Query Trong MySQL Workbench

## 🎯 Bước 1: Mở MySQL Workbench

1. Mở MySQL Workbench trên máy tính.

2. Sau khi kết nối thành công, trong MySQL Workbench, mở tab Query

![Chọn tab sql](./Images/Screenshot%202025-03-23%20140911.png)

3. Chạy câu query bên dưới.

```sql
USE investin_vn;

SET SQL_SAFE_UPDATES = 0;

UPDATE wp_options
SET option_value = 'https://investingvietnam.vn.local'
WHERE option_name IN ('siteurl', 'home');

UPDATE wp_posts
SET post_content = REPLACE(post_content, 'https://investingvietnam.vn', 'https://investingvietnam.vn.local');

UPDATE wp_postmeta
SET meta_value = REPLACE(meta_value, 'https://investingvietnam.vn', 'https://investingvietnam.vn.local');

UPDATE wp_termmeta
SET meta_value = REPLACE(meta_value, 'https://investingvietnam.vn', 'https://investingvietnam.vn.local');

```

![Chạy sql](./Images/Screenshot%202025-03-23%20141356.png)

Vào web browser mở lại site `https://investingvietnam.vn.local/`
