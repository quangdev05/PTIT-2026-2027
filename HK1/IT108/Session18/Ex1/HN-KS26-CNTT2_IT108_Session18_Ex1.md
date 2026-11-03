# Bài 1: Sự cố không truy cập được hệ thống quản trị

DNS Lookup: Tên miền -> cache/hosts -> recursive resolver -> root -> TLD .vn → authoritative DNS -> bản ghi A/AAAA → IP. Trình duyệt kết nối IP, thương lượng TLS nếu HTTPS, rồi mới gửi HTTP. Tên sai `grenlog.vn` là tên miền khác; NXDOMAIN nghĩa là không tìm thấy bản ghi, chưa tới HTTP server. Không thể kết luận server mất điện.

## Phân biệt lỗi

- `DNS_PROBE_FINISHED_NXDOMAIN`: lỗi phân giải tên, request chưa nhận IP và chưa có HTTP status.
- `500 Internal Server Error`: đã có phản hồi HTTP từ server/gateway, thường cần điều tra ứng dụng/server.
- `404 Not Found`: server đã phản hồi nhưng không tìm thấy URL/tài nguyên/route.

Trong DevTools -> Network bật Preserve log, tải lại và xem request document, URL, Status, Timing, Headers. Với DNS lỗi sẽ không có mã HTTP cho document; 500/404 chứng tỏ đã tới HTTP server. Nếu đúng hostname mà 404, kiểm tra path, route và log; không đồng nghĩa toàn hệ thống sập.
