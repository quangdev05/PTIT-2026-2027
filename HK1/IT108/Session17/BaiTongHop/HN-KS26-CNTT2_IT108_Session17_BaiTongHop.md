# Bài tập tổng hợp: Ngày Đầu Thực Tập Dev Tại Công Ty Công Nghệ

## Phần A – Thiết lập Profile và Bookmark chuẩn Dev

### Dùng chung Profile cho GitHub cá nhân và công ty

Một Profile có cùng vùng lưu cookies, history, bookmarks, extensions và dữ liệu tự điền. Khi đăng nhập GitHub cá nhân và công ty trong cùng Profile, trang GitHub có thể chỉ duy trì một tài khoản hoạt động trong một ngữ cảnh trình duyệt; phiên sau có thể thay thế phiên trước, dẫn tới mở nhầm tài khoản, commit/ thao tác bằng sai danh tính hoặc phải đăng xuất qua lại. Nên tách phiên làm việc theo Profile (hoặc dùng tính năng chuyển tài khoản có chủ đích), kiểm tra avatar/tên tài khoản trước thao tác nhạy cảm.

| Profile | Mục đích |
| --- | --- |
| `Personal` | Mạng xã hội, GitHub và dịch vụ cá nhân; không dùng cho dữ liệu công ty. |
| `Company_Work` | Tài khoản công ty, GitHub công ty, công cụ nội bộ và bookmark công việc. |
| `Sandbox_Test` | Thử website, API, extension và tài khoản thử nghiệm bằng dữ liệu giả. |

### Cấu trúc Bookmark gồm ba thư mục

```text
Bookmarks
├── 01_Company_Work
│   ├── GitHub công ty (URL do công ty cấp)
│   └── Cổng tài liệu nội bộ (URL do công ty cấp)
├── 02_Development
│   ├── MDN Web Docs (developer.mozilla.org)
│   └── Can I Use (caniuse.com)
└── 03_Tools_Testing
    ├── JSON Formatter / JSON Viewer được công ty phê duyệt
    └── Swagger/OpenAPI của môi trường test (URL do mentor cấp)
```

Chỉ lưu đường dẫn thật được công ty/mentor xác nhận, tránh bookmark thông tin bí mật hoặc URL chứa token. Khi đồng nghiệp mượn máy 5 phút, mở **Guest Profile/Chế độ khách**. Guest tạo phiên tách biệt và đóng cửa sổ sẽ xóa dữ liệu phiên khách; Incognito vẫn thuộc Profile hiện tại, nên có nguy cơ truy cập phiên đang đăng nhập hoặc dữ liệu cá nhân. Không để người mượn thao tác trong `Personal` hay `Company_Work`.

## Phần B – Chọn đúng Extension hỗ trợ

API JSON thô phù hợp với **Dev Suite**, cụ thể là tiện ích **JSON Viewer/JSON Formatter** để thụt lề, tô màu cú pháp và thu gọn/mở rộng cấu trúc JSON. **Productivity Suite** chủ yếu hỗ trợ quản lý công việc, tab hoặc ghi chú; không giải quyết việc đọc cấu trúc JSON. **Security Suite** hướng đến quyền riêng tư, chặn theo dõi hoặc bảo vệ truy cập; cũng không phải công cụ định dạng JSON.

Đặt **Site Access: On click** để extension chỉ chạy khi người dùng chủ động nhấn biểu tượng trên trang cần xem. Đây là nguyên tắc cấp quyền tối thiểu, tránh cho tiện ích quyền đọc/chỉnh sửa dữ liệu trên mọi website. Chỉ cân nhắc quyền rộng hơn nếu thật sự cần và đã được công ty duyệt.

## Phần C – Phân tích luồng HTTP Request

### Bốn giai đoạn khi mở `test.internal-tool.com`

1. **DNS Lookup:** phân giải hostname thành địa chỉ IP (có thể lấy từ cache DNS).
2. **TCP/TLS Handshake:** thiết lập kết nối tới máy chủ; với HTTPS, TLS xác thực chứng thư và thiết lập kênh mã hóa.
3. **HTTP Request/Response:** gửi yêu cầu HTTP và nhận status/header/body từ máy chủ.
4. **Rendering Pipeline:** phân tích HTML thành DOM, CSS thành CSSOM, tính Layout rồi Paint/Composite để hiển thị; JavaScript có thể tiếp tục cập nhật giao diện.

### So sánh 404 và 500

| Mã | Ý nghĩa | Lỗi thường ở đâu? | Hướng debug ban đầu |
| --- | --- | --- | --- |
| `404 Not Found` | Máy chủ nhận request nhưng không tìm thấy URL/tài nguyên yêu cầu | Đường dẫn, route, ID/tài nguyên, cấu hình routing hoặc tài nguyên đã bị di chuyển | Trong Network xác nhận Request URL/method; kiểm tra chính tả, route/API và xem response. Chỉ kết luận tài nguyên không tồn tại sau khi xác minh. |
| `500 Internal Server Error` | Máy chủ gặp lỗi khi xử lý request | Server-side code hoặc phụ thuộc backend/database | Ghi nhận thời gian, endpoint và request ID; kiểm tra response/log server theo quyền và báo đội backend. Không gửi dữ liệu nhạy cảm trong báo cáo. |

Mở **Network** để xem HTTP status của request/document; tab này cho biết request, response và mã trạng thái. **Elements** xem/sửa DOM và CSS đang hiển thị, **Console** hiển thị lỗi JavaScript và thông báo, **Application** quản lý/xem cookies, storage và tài nguyên ứng dụng; chúng không phải nơi chính để xem status từng request.

## Phần D – Chẩn đoán Cache và Cookies

### CSS mới nhưng F5 vẫn thấy giao diện cũ

Nguyên nhân có thể là trình duyệt tái sử dụng file CSS cũ trong **HTTP Cache** (hoặc service worker/CDN giữ bản cũ), nên reload thường vẫn dùng tài nguyên đã cache. Trong DevTools → **Network**, bật **Disable cache** khi DevTools đang mở rồi tải lại trang; hoặc dùng **Empty Cache and Hard Reload** (nhấp giữ/nhấp phải nút Reload khi DevTools mở). Kiểm tra Request URL/response để xác nhận phiên bản CSS mới và lưu ý server/CDN cache có thể cần được xử lý riêng. Không nhầm cache với cookie: cache lưu tài nguyên để tải nhanh, cookie lưu trạng thái/phiên và được gửi theo request.

### Cookie `session_id` thiếu HttpOnly

Nếu session cookie không bật **HttpOnly**, JavaScript phía trang có thể đọc cookie. Khi website có lỗ hổng **Cross-Site Scripting (XSS)**, mã độc được chèn có thể đánh cắp session cookie và dùng phiên đó để mạo danh người dùng (session hijacking). Cần đặt HttpOnly cùng các thuộc tính bảo vệ phù hợp như Secure và SameSite ở phía server; DevTools chỉ quan sát, không thay thế cấu hình server.

### Đăng xuất nhưng giữ cache ảnh/CSS

Xóa cookie/phiên đăng nhập của riêng website trong **Application → Storage → Cookies**, chọn domain phù hợp và xóa cookie phiên (hoặc dùng nút **Clear site data** chỉ khi đã xác nhận nó không xóa phần cache cần giữ). Cách chắc chắn hơn để giữ HTTP Cache là xóa riêng cookie `session_id`/dữ liệu phiên, không chọn “Cached images and files” trong Clear browsing data. Sau đó tải lại; thao tác sẽ đăng xuất khỏi website.

## Phần E – Inspect Element và Network

### Thử màu nút “Đăng nhập”

Mở F12 → **Elements**, dùng biểu tượng chọn phần tử (Ctrl+Shift+C) rồi bấm nút. Trong **Styles**, tìm thuộc tính `color` (màu chữ) hoặc `background-color` (màu nền), sửa giá trị hex/RGB hoặc dùng color picker để thử đúng màu thiết kế. Xác nhận trạng thái hover/focus nếu liên quan và ghi lại selector, giá trị màu và kích thước màn hình cho Dev. Đây chỉ là sửa DOM/CSS tạm trên trình duyệt, không thay đổi file dự án; reload sẽ hoàn nguyên.

### Quy trình bốn bước debug request API màu đỏ

1. **Tái hiện và thu thập:** mở DevTools → Network trước khi thao tác, bật Preserve log nếu request mất sau điều hướng, tái hiện lỗi và chọn đúng dòng API màu đỏ.
2. **Kiểm tra request:** xem Request URL, method, status, thời gian, headers/payload và thông tin phiên cần thiết; che token, cookie và dữ liệu cá nhân khi chia sẻ ảnh/log.
3. **Đọc response và phân loại:** xem Response/Preview, status và Console. Phân biệt lỗi mạng/CORS, 4xx (request, xác thực hoặc tài nguyên) và 5xx (xử lý server); không suy đoán chỉ từ màu đỏ.
4. **Khoanh vùng và báo cáo:** thử tái hiện có kiểm soát, so sánh request thành công/thất bại nếu có quyền; ghi thời gian, endpoint, status, request ID và bước tái hiện rồi chuyển đúng nhóm phụ trách. Không tự sửa dữ liệu gốc hay gửi thông tin nhạy cảm.

Để chỉ xem API, bấm bộ lọc **Fetch/XHR** trong Network. Để đảm bảo trình duyệt không lấy response từ cache, bật **Disable cache** (có hiệu lực khi DevTools đang mở), rồi thực hiện lại request.
