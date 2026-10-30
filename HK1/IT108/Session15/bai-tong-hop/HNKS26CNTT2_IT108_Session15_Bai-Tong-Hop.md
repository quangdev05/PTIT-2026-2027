# BÀI TẬP TỔNG HỢP: NHÓM SMARTCAMPUS CHẠY NƯỚC RÚT TRƯỚC DEADLINE

## PHẦN 1: THIẾT LẬP HYBRID WORKFLOW (ĐỒNG BỘ ĐÁM MÂY)

### 1. Sự cố laptop hỏng ổ cứng mất file Slide

- **Sự cố có xảy ra không?** -> **KHÔNG.**
- **Vì sao?** -> Khi áp dụng đúng **Hybrid Workflow** (Local + Auto Sync), mỗi thao tác lưu (`Ctrl + S`) trên máy tính cục bộ sẽ được ứng dụng đám mây (Google Drive / OneDrive) tự động đồng bộ ngầm ngay lập tức lên Cloud. Khi ổ cứng máy tính bị cháy, toàn bộ phiên bản mới nhất vẫn nằm an toàn trên mây; thành viên đó chỉ cần mượn máy khác đăng nhập tài khoản là tiếp tục làm việc bình thường.

### 2. 3 bước thiết lập Auto Sync nhanh cho cả nhóm

1. **Bước 1 - Cài đặt ứng dụng Cloud Client:** Tải và cài đặt Google Drive for Desktop (hoặc OneDrive) về máy tính cá nhân.
2. **Bước 2 - Chọn thư mục đồng bộ (Mirror / Stream):** Tạo thư mục đồ án cục bộ `D:\SmartCampus_Project`, trong cài đặt ứng dụng chọn đồng bộ thư mục này với Cloud.
3. **Bước 3 - Kiểm tra biểu tượng trạng thái:** Mở thư mục, kiểm tra các file có dấu tích xanh (Green Checkmark - đã đồng bộ thành công lên mây) trước khi làm việc.

### 3. Cứu nguy khi lỡ tay xóa nhầm 2 trang Báo cáo

- **Thao tác khôi phục thần tốc bằng Version History:**
  1. Mở file `BaoCao_CuoiKy_SmartCampus.docx` trên Google Docs (hoặc Word Online).
  2. Vào menu **File (Tệp)** -> Chọn **Version history (Lịch sử phiên bản)** -> **See version history (Xem lịch sử phiên bản)**.
  3. Chọn mốc thời gian cách đây 15 phút (trước thời điểm xóa nhầm) -> Xem lại nội dung -> Bấm **Restore this version (Khôi phục phiên bản này)**. Hai trang bị xóa sẽ quay trở lại ngay lập tức mà không phải gõ lại một chữ nào!

### 4. Sai lầm khi đồng bộ `node_modules` và phim 4K

- **2 sai lầm đã học:**
  - _Đồng bộ `node_modules`:_ Sai lầm **"Bão file nhỏ" (Small Files Storm)**. Thư mục này chứa hàng chục nghìn file mã nguồn thư viện li ti, làm nghẽn tiến trình sync, ngốn băng thông và treo app đồng bộ.
  - _Đồng bộ phim 4K:_ Sai lầm **"Lãng phí dung lượng & Vi phạm mục đích lưu trữ"**. File giải trí nặng hàng chục GB làm tràn dung lượng Cloud của nhóm và làm chậm tốc độ đồng bộ tài liệu học tập.
- **Cách xử lý đúng:**
  - Thêm `node_modules` vào file `.gitignore` và loại trừ (exclude) thư mục này khỏi danh sách đồng bộ của Cloud Drive (khi cần chỉ cần chạy lệnh `npm install` để tải lại).
  - Xóa ngay các file phim 4K ra khỏi thư mục đồ án; chỉ lưu trữ tài liệu phục vụ báo cáo.

---

## PHẦN 2: PHÂN QUYỀN CHIA SẺ AN TOÀN

### 1. Bảng phân quyền 4 file trọng điểm

| Tên File                                    |            Mức quyền (Role)            |         Phạm vi chia sẻ (Scope)          | Giải thích lý do                                                                                          |
| :------------------------------------------ | :------------------------------------: | :--------------------------------------: | :-------------------------------------------------------------------------------------------------------- |
| `BaoCao_CuoiKy_SmartCampus.docx` _(gửi GV)_ |               **Viewer**               |  **Restricted** (Chỉ email giảng viên)   | Giảng viên chỉ cần đọc để chấm điểm, tránh rủi ro vô tình bấm phím sửa đè làm hỏng bài báo cáo.           |
| `Slide_BaoCao.pptx` _(5 thành viên nhóm)_   |               **Editor**               |    **Restricted** (Chỉ 5 email nhóm)     | Cả 5 bạn đều cần quyền chỉnh sửa trực tiếp để cùng hoàn thiện các slide kịp tiến độ 2 ngày.               |
| `GopY_BanNhap.docx` _(gửi anh khóa trên)_   |             **Commenter**              | **Restricted** (Chỉ email anh khóa trên) | Anh khóa trên chỉ cần để lại nhận xét/góp ý bên lề, không thể chỉnh sửa trực tiếp vào khung nội dung gốc. |
| `ThongTin_CaNhan_NhomVien.xlsx`             | **Viewer** (hoặc chỉ Admin giữ Editor) |       **Restricted** (Nội bộ nhóm)       | Chứa dữ liệu cá nhân cực kỳ nhạy cảm (CCCD, SĐT); tuyệt đối không cho phép ai ngoài nhóm tiếp cận.        |

### 2. Quy tắc Cờ Đỏ Bảo mật với file CCCD/SĐT

- **Quy tắc Cờ Đỏ (Red Flag):** Tuyệt đối KHÔNG BAO GIỜ kết hợp **`Anyone with the link` + `Editor`** cho các tài liệu chứa dữ liệu định danh cá nhân (PII - Personally Identifiable Information).
- **Vì sao?** Bất kỳ ai vô tình có được đường link (bị chuyển tiếp nhầm, lộ trên nhóm chat...) đều có thể xem, sao chép hoặc xóa sạch dữ liệu cá nhân của các thành viên. Thông tin CCCD, SĐT có thể bị kẻ gian lợi dụng để vay tiền online hoặc lừa đảo mạo danh.

### 3. 2 thao tác an toàn trong cửa sổ Settings của file Slide

Khi cấp quyền `Editor` cho 5 người trên file Slide, em mở biểu tượng **Bánh răng cài đặt (Share Settings)** và cấu hình:

1. **Tắt:** _"Editors can change permissions and share"_ (Ngăn người chỉnh sửa tự ý thay đổi quyền và mời thêm người lạ vào file).
2. **Tắt:** _"Viewers and commenters can see the option to download, print, and copy"_ (đối với những người ngoài chỉ có quyền xem).

---

## PHẦN 3: TỔ CHỨC GIAO TIẾP NHÓM CHUẨN DOANH NGHIỆP

### 1. Chỉ mặt đặt tên 3 vấn đề trong đoạn chat Zalo của nhóm

1. **Lỗi "No-Hello" (Hỏi trống không, thiếu ngữ cảnh):** Bạn Lan nhắn _"có ai rảnh không"_, _"giúp em cái này được không"_ mà không nói rõ việc gì, khiến người khác không biết có thể giúp được không và tốn thêm thời gian ping qua lại.
2. **Nhiễm tạp âm & Không phân luồng (Flat chat stream):** Hoa thả ảnh mèo và Tuấn khen cute chèn ngang giữa lúc nhóm đang cần trao đổi công việc khẩn cấp.
3. **Spam `@all` giờ khuya gây hoảng loạn:** Trưởng nhóm tag `@all` lúc 23:47 đêm để giục việc chung chung, gây quấy rầy giấc ngủ của cả những bạn đã hoàn thành phần việc của mình.

### 2. Đề xuất 2 Channel trên Lark/Slack

- `#01-thong-bao-deadline`: Kênh chuyên biệt để Trưởng nhóm chốt mốc nộp bài và các thông báo quan trọng (thành viên chỉ thả react xác nhận).
- `#02-trao-doi-do-an`: Kênh thảo luận kỹ thuật, nội dung báo cáo (mọi thảo luận theo từng vấn đề bắt buộc dùng **Thread**).

### 3. Viết lại tin nhắn của Lan (Chuẩn Asynchronous Communication)

> _"Chào cả nhà! Mình đang hoàn thiện phần 3 của báo cáo nhưng đang bị kẹt chỗ biểu đồ so sánh chi phí ở trang 12. Có bạn nào rành Excel vẽ giúp mình biểu đồ này với, mình cần trước 15h chiều nay nhé. Link file ở đây: [Link]. Cảm ơn mọi người!"_

### 4. Viết lại tin nhắn giục deadline của Trưởng nhóm (Schedule Send 8h sáng)

_(Hẹn giờ tự động gửi lúc 08:00 sáng hôm sau, không tag `@all`, chỉ gọi đích danh người chưa xong)_:

> _"Chào buổi sáng cả nhóm! Hiện tại chúng ta chỉ còn 24h nữa là đến hạn nộp báo cáo cuối kỳ. @Nam và @Hoa ơi, hai bạn kiểm tra lại phần Kết luận và Slide thuyết trình nhé, cố gắng đẩy lên trước 16h chiều nay để cả nhóm tổng duyệt lần cuối nha. Cố lên anh em!"_

---

## PHẦN 4: THÔNG BÁO TỔNG HỢP TRÊN KÊNH `#THONG-BAO`

> 📢 **[THÔNG BÁO QUAN TRỌNG: CHỐT BẢN THẢO BÁO CÁO CUỐI KỲ]**
>
> Chào cả nhóm, mình vừa hoàn tất việc tổ chức lại không gian làm việc của nhóm, cụ thể như sau:
>
> 1. Đã bật tính năng **Auto Sync** cho toàn bộ thư mục đồ án `SmartCampus_Project` trên Google Drive. Mọi người lưu ý chỉ chỉnh sửa trực tiếp trong thư mục này để file tự động lưu bản mới nhất nhé.
> 2. File `BaoCao_CuoiKy_SmartCampus.docx` đã được cấp quyền **Viewer (Restricted)** và gửi thẳng tới email của Thầy hướng dẫn để Thầy duyệt bản cuối.
> 3. Tiến độ còn lại: **@Tuan** và **@Lan** ơi, hai bạn hoàn thiện nốt 2 trang cuối của phần Thử nghiệm trong file `Slide_BaoCao.pptx` trước **17:00 chiều nay** giúp nhóm nhé (file đã mở quyền Editor cho 2 bạn rồi).
>
> Mọi người nắm thông tin thì thả reaction 👍 dưới bài này nha, ai có thắc mắc gì xin vui lòng **Reply in Thread** bên dưới! 🚀
