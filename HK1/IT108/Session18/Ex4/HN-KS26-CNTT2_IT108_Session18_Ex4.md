# Bài 4: Sự cố xung đột phiên đăng nhập trên trình duyệt

## 1. Profile và Incognito

| Đặc điểm        | Dedicated Profile                      | Incognito                                                        |
| --------------- | -------------------------------------- | ---------------------------------------------------------------- |
| Cookie, lịch sử | Riêng, lưu giữa các lần mở             | Dữ liệu site bị xóa khi đóng toàn bộ cửa sổ                      |
| Mục đích        | Cách ly tài khoản lâu dài              | Phiên tạm trên máy mình                                          |
| Giới hạn        | Không phải ranh giới bảo mật tuyệt đối | Không ẩn hoạt động khỏi website/mạng; bookmark/tệp tải xuống còn |

Tạo Personal, Work, Sandbox với màu/biểu tượng phân biệt; đăng nhập đúng tài khoản mỗi profile. Work chỉ dùng tài khoản công ty; Sandbox dùng dữ liệu thử nghiệm, không cấp production. Incognito không thay thế profile riêng.

## 2. Bookmark và đồng bộ

```text
GreenLog Work
├── Điều phối: Portal, bản đồ
├── Phát triển: GitHub, Canvas LMS, API docs
└── Hỗ trợ: Hướng dẫn vận hành
```

Đăng nhập tài khoản sync được tổ chức cho phép trong Work, bật riêng Bookmarks, xác minh trên thiết bị mới. Dùng MFA, kiểm tra lần sync cuối, không đồng bộ việc vào profile cá nhân; thu hồi thiết bị cũ khi đổi máy.

## 3. Trình chiếu và máy công cộng

Trình chiếu bằng cửa sổ Work, đóng Personal, tắt thông báo cá nhân, kiểm tra tab và màn hình chia sẻ. Trên máy công cộng tránh dịch vụ nhạy cảm; nếu buộc phải dùng, chọn Guest, không lưu mật khẩu/không bật sync, đăng xuất website, đóng phiên Guest và kiểm tra tệp tải xuống. Guest chỉ dọn dữ liệu cục bộ của phiên, không ẩn lịch sử khỏi quản trị mạng.
