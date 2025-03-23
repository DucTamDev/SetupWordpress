USE investin_vn;

-- 1. MySQL đang bật "Safe Update Mode", ngăn không cho chạy UPDATE mà không có WHERE chứa khóa chính (KEY).
-- Tắt Safe Update Mode và chạy lệnh UPDATE

SET SQL_SAFE_UPDATES = 0;


-- 2. WordPress sử dụng hai giá trị trong bảng wp_options để xác định địa chỉ chính của trang web:
-- siteurl – Đường dẫn tới thư mục cài đặt WordPress.
-- home – Địa chỉ trang chủ của trang web.


UPDATE wp_options 
SET option_value = 'https://investingvietnam.vn.local' 
WHERE option_name IN ('siteurl', 'home');


-- 3. Cập nhật URL trong toàn bộ nội dung (bài viết, trang, ảnh...)

UPDATE wp_posts 
SET post_content = REPLACE(post_content, 'https://investingvietnam.vn', 'https://investingvietnam.vn.local');


-- 4. Cập nhật URL trong bảng _postmeta (các ảnh, metadata)

UPDATE wp_postmeta 
SET meta_value = REPLACE(meta_value, 'https://investingvietnam.vn', 'https://investingvietnam.vn.local');

-- 5. Kiểm tra URL trong bảng _termmeta (nếu có dùng taxonomy)

UPDATE wp_termmeta 
SET meta_value = REPLACE(meta_value, 'https://investingvietnam.vn', 'https://investingvietnam.vn.local');