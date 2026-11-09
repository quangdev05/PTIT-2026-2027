# Bài 1 - Tìm kiếm tài liệu học tập chính thống bằng Google

## Mục tiêu

Tìm bản PDF của giáo trình **“Nhập môn Công nghệ Thông tin”** trên miền chính thức của Học viện, giảm kết quả quảng cáo, trang yêu cầu nạp thẻ và nội dung không liên quan.

## Truy vấn đề xuất

```text
site:ptit.edu.vn filetype:pdf "Nhập môn Công nghệ Thông tin" -tailieu -123doc
```

`site:ptit.edu.vn` giới hạn kết quả trong tên miền Học viện; `filetype:pdf` ưu tiên tài liệu PDF; cụm từ đặt trong dấu ngoặc kép yêu cầu khớp chính xác tên giáo trình. Hai dấu trừ loại kết quả có các từ khóa `tailieu` và `123doc` (có thể thay bằng tên miền rác thực tế xuất hiện trong kết quả). Nếu tài liệu nằm trên miền con/miền lưu trữ khác của trường, thử lần lượt `site:*.ptit.edu.vn` hoặc tên miền chính thức được liên kết từ trang PTIT.

## Vì sao dùng `filetype:pdf` tiết kiệm thời gian?

Truy vấn thông thường như “tải sách nhập môn CNTT” thường trả cả bài quảng cáo, trang tổng hợp, bản xem trước, trang yêu cầu đăng ký và nhiều định dạng khác. `filetype:pdf` thu hẹp kết quả tới tệp PDF có thể mở/tải trực tiếp, còn `site:` và cụm từ chính xác giảm thêm nhiễu. Toán tử chỉ lọc theo loại tệp, không chứng minh tệp an toàn hoặc đúng phiên bản; cần kiểm tra miền, tiêu đề, tác giả/đơn vị phát hành và nội dung trước khi tải.

## Kết quả tìm kiếm và ảnh minh chứng

Kết quả Google thay đổi theo thời gian, vị trí và tài khoản. Không nên điền giả tên tệp hay ảnh chụp. Thực hiện truy vấn ở trên, chụp phần màn hình thể hiện thanh tìm kiếm và ba kết quả đầu tiên, che thông tin cá nhân nếu có, rồi chèn ảnh tại đây:

> **Ảnh minh chứng:** dán ảnh chụp thực tế của 3 kết quả đầu tiên sau khi chạy truy vấn.

| Thứ tự | Tiêu đề kết quả thực tế | Miền/URL PTIT | Loại tệp | Nhận xét xác minh                     |
| ------ | ----------------------- | ------------- | -------- | ------------------------------------- |
| 1      | Điền sau khi tìm kiếm   | Điền URL      | PDF/khác | Kiểm tra đơn vị phát hành và nội dung |
| 2      | Điền sau khi tìm kiếm   | Điền URL      | PDF/khác | Kiểm tra đơn vị phát hành và nội dung |
| 3      | Điền sau khi tìm kiếm   | Điền URL      | PDF/khác | Kiểm tra đơn vị phát hành và nội dung |
