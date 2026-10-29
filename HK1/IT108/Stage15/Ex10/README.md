# BÀI 10: LỰA CHỌN NỀN TẢNG GIAO TIẾP CHO NHÓM CAMPUSPAY

## PHẦN 1: PHÂN TÍCH YÊU CẦU & ƯU NHƯỢC ĐIỂM

### 1. Phân tích I/O bài toán

- **Đầu vào (Input):** Nhóm startup sinh viên 4-5 người thuộc 4 ban (Kỹ thuật, Thiết kế, Kinh doanh, Đối ngoại). Nhu cầu: không bị trôi deadline, giao việc minh bạch, tìm lại được file cũ, giao tiếp được cả khi lệch múi giờ sinh hoạt.
- **Đầu ra (Output):** Quyết định nền tảng tối ưu, giải quyết triệt để vấn đề phân mảnh thông tin mà không gây quá tải cho thành viên.

### 2. Ưu & Nhược điểm theo 5 tiêu chí nghiệp vụ

1. **Ngăn chặn trôi tin nhắn:**
   - _Zalo:_ Nhược điểm chí mạng. Tất cả dồn chung một luồng (flat chat), vài cái meme là trôi sạch tin hạn chót.
   - _Lark:_ Chia theo Channel & Thread, thảo luận việc nào nằm gọn trong topic đó, không lo trôi.
2. **Quản lý công việc (Task Integration):**
   - _Zalo:_ Kém. Chỉ có nhắc hẹn sơ sài, không gán người chịu trách nhiệm, không theo dõi tiến độ.
   - _Lark:_ 1-click biến tin nhắn thành Task, gán deadline, đồng bộ Calendar, bot tự động "dí" người làm.
3. **Độ miễn phí & Dễ cài đặt:**
   - _Zalo:_ Vô địch về độ phổ thông. Ai cũng có sẵn trên máy, bấm là chat luôn.
   - _Lark:_ Miễn phí gói chuẩn cho nhóm nhỏ, nhưng phải đăng ký tài khoản tổ chức (mất tầm 10 phút làm quen).
4. **Tìm kiếm lịch sử trao đổi:**
   - _Zalo:_ Thảm họa. Sau vài tuần ảnh và file báo lỗi _"không tồn tại"_, tìm lại quyết định cũ cực khó.
   - _Lark:_ Lưu trữ vĩnh viễn trên mây, bộ lọc cực xịn theo người gửi, định dạng và khoảng thời gian.
5. **Giao tiếp bất đồng bộ (Asynchronous):**
   - _Zalo:_ Hay có kiểu nhắn _"Alo có ai ở đó không"_ gây ngắt quãng, thiếu ngữ cảnh.
   - _Lark:_ Định dạng văn bản phong phú (bullet, highlight, code block), viết 1 tin nhắn đủ thông tin để người đọc lúc nửa đêm vẫn hiểu và làm được ngay.

---

## PHẦN 2: BẢNG SO SÁNH & CHỐT LỰA CHỌN

### 3. Bảng so sánh 5 tiêu chí nghiệp vụ (✅ Tốt | ⚠️ Trung bình | ❌ Kém)

| Tiêu chí đánh giá              | Zalo (Chat cá nhân) | Lark Suite (Doanh nghiệp) | Nhận xét thực tế của sinh viên                                       |
| :----------------------------- | :-----------------: | :-----------------------: | :------------------------------------------------------------------- |
| **1. Chống trôi tin nhắn**     |         ❌          |            ✅             | Zalo trôi tuột sau 10 cái meme; Lark có Thread giữ sạch kênh chính.  |
| **2. Quản lý Task & Deadline** |         ❌          |            ✅             | Lark chuyển chat thành Task trong 1 giây; Zalo phải tự ghi sổ tay.   |
| **3. Dễ dùng & Chi phí**       |         ✅          |            ⚠️             | Zalo ai cũng rành; Lark cần 1 buổi để cả nhóm làm quen giao diện.    |
| **4. Lục lại tài liệu cũ**     |         ❌          |            ✅             | Zalo tự xóa file; Lark lưu Cloud trọn đời, search là ra ngay.        |
| **5. Giao tiếp bất đồng bộ**   |         ⚠️          |            ✅             | Lark hỗ trợ viết bài văn bản chi tiết; Zalo hay bị vụn vặt tin nhắn. |

---

### 4. Chốt lựa chọn: Giải pháp Lai (Hybrid Model) cứu cánh sinh viên

Dựa trên bảng so sánh và **3 bẫy dữ liệu**, em đề xuất nhóm áp dụng **Mô hình Lai (Hybrid)**:

- **Giải mã 3 bẫy dữ liệu:**
  - _Bẫy 1 (Thành viên Biz chỉ có điện thoại):_ Lark có app mobile trên cả iOS và Android cực kỳ mượt mà, đầy đủ tính năng thông báo và nhận task. Bạn ấy hoàn toàn xử lý công việc ngon lành trên điện thoại.
  - _Bẫy 2 (Mất 1-2 ngày học dùng khi sắp deadline):_ Không cần học hết cả nền tảng, nhóm chỉ cần quy ước 3 thao tác cơ bản: Vào đúng kênh -> Bấm "Reply in Thread" -> Nhận Task được gán. Chỉ mất 15 phút là chạy việc được ngay!
  - _Bẫy 3 (Đối tác ngoài chỉ dùng Zalo):_ Không thể bắt đối tác cài Lark theo mình.

- **QUYẾT ĐỊNH CUỐI CÙNG:**
  - **Nội bộ nhóm 100% dùng Lark Suite:** Dùng để làm việc, bàn code, duyệt thiết kế, theo dõi deadline và lưu tài liệu.
  - **Duy trì 1 nhóm Zalo đối ngoại:** Chỉ dùng làm cầu nối liên hệ với đối tác ngoài trường hoặc giảng viên khi cần trao đổi nhanh.

---

## PHẦN 3: THIẾT KẾ HỆ THỐNG CHANNEL TRÊN LARK CHO CAMPUSPAY

### 5. Cấu trúc 5 Channel nội bộ

| Tên Channel          | Mục đích sử dụng                                          | Quyền đăng bài            | Quy định hoạt động                                            |
| :------------------- | :-------------------------------------------------------- | :------------------------ | :------------------------------------------------------------ |
| `#00-announcement`   | Đăng thông báo chính thức, lịch họp, deadline quan trọng. | **Chỉ Trưởng nhóm/Admin** | Thành viên chỉ thả reaction (👍, ❤️, 🆗), cấm chat nhảm.      |
| `#01-ky-thuat`       | Thảo luận kiến trúc, API, debug, bot bắn log Git.         | Ban Kỹ thuật              | Mọi trao đổi bắt buộc reply trong Thread của từng task.       |
| `#02-thiet-ke`       | Đăng demo UI/UX, xin feedback giao diện.                  | Ban Thiết kế + Lead       | Đăng kèm link Figma; góp ý gạch đầu dòng rõ ràng.             |
| `#03-kinh-doanh`     | Bàn chiến lược pitch, khảo sát người dùng, đối tác.       | Ban Kinh doanh + Lead     | Tài liệu đính kèm lưu trên Lark Docs.                         |
| `#99-random-chemgio` | Tán gẫu, rủ ăn uống, chia sẻ meme xả stress.              | **Tất cả thành viên**     | Nơi duy nhất được spam tự do mà không sợ ảnh hưởng công việc. |

### Cách phòng tránh spam `@all` (Thi hành "Quy tắc Cờ Đỏ")

1. **Khóa quyền `@all` ở cấp cài đặt:** Trong các kênh chung, chỉ Admin mới có quyền tag `@all`.
2. **Quy tắc cờ đỏ văn hóa nhóm:** Coi việc tag `@all` sau 22h đêm hoặc tag cho việc không khẩn cấp là vi phạm nội quy (phạt 1 ly trà sữa vào quỹ nhóm). Luôn dùng **Tag đích danh** `@tên_người_cần_gọi` kèm nội dung cụ thể.
