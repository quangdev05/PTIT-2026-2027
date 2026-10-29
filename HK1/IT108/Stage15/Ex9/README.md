# BÀI 9: THIẾT KẾ HỆ THỐNG LƯU TRỮ VÀ PHÂN QUYỀN CAMPUSPAY

## PHẦN 1: PHÂN TÍCH BÀI TOÁN (I/O) & THIẾT KẾ CẤU TRÚC

### 1. Xác định I/O bài toán

- **Đầu vào (Input):**
  - **4 nhóm đối tượng:** Ban Kỹ thuật (3 dev), Ban Thiết kế (2 design), Ban Kinh doanh (2 biz), Nhà đầu tư tiềm năng (1 khách ngoài).
  - **Các cấp độ tài liệu:** Mã nguồn/API keys (tối mật), Tài sản đồ họa/UI (nội bộ dự án), Kế hoạch kinh doanh (mật), Tài liệu thuyết trình Pitch Deck (công cộng/đối ngoại).
- **Đầu ra (Output):**
  - Cấu trúc thư mục Google Drive 2 cấp phân tầng khoa học, không lộn xộn.
  - Bảng phân quyền chi tiết tuân thủ nghiêm ngặt nguyên tắc **Least Privilege** (Quyền tối thiểu) và cơ chế tự động thu hồi (Expiration Date).

---

### 2. Thiết kế cấu trúc thư mục Google Drive 2 cấp

```text
📁 [CampusPay_Root] (Thư mục gốc dự án)
├── 📁 01_Chung_Va_DoiNgoai/      -> Slide Pitch, tóm tắt dự án, tài liệu gửi nhà đầu tư
├── 📁 02_Ban_KyThuat/            -> Source code, API Docs, tài liệu kiến trúc, cấu hình server
├── 📁 03_Ban_ThietKe/            -> File thiết kế Figma/Photoshop, UI Assets, Design System
├── 📁 04_Ban_KinhDoanh/          -> Business Plan chi tiết, hợp đồng đối tác, phân tích tài chính
└── 📁 05_QuanTri_NhayCam/        -> Bảng phân quyền, thông tin cá nhân thành viên, ngân sách mật
```

---

### 3. Quy trình 5 bước thiết lập hệ thống từ con số 0

1. **Bước 1 - Khởi tạo:** Tạo thư mục gốc `CampusPay_Root` và 5 thư mục con theo cây thư mục bên trên.
2. **Bước 2 - Chuẩn hóa tên:** Đặt tên có tiền tố số (`01_`, `02_`...) và viết không dấu nối gạch dưới để tránh lỗi đường dẫn khi sync.
3. **Bước 3 - Cấp quyền cấp Thư mục:** Mặc định để **Restricted**, chỉ thêm email thành viên tương ứng vào từng ban với quyền tối thiểu.
4. **Bước 4 - Kiểm tra chéo (Audit):** Dùng tài khoản phụ đóng vai Nhà đầu tư hoặc Dev để test xem có "nhìn trộm" được folder cấm hay không.
5. **Bước 5 - Cấu hình an toàn & Thu hồi:** Bật tính năng chặn Editor tự thêm người mới; cài đặt ngày hết hạn (`Set expiration: 14 days`) cho tài khoản ngoài.

---

## PHẦN 2: TRIỂN KHAI & CHỐNG LỖI

### 4. Bảng phân quyền 4 vai trò x 5 loại tài liệu chính

|  STT  | Loại tài liệu                     | Ban Kỹ thuật (3) | Ban Thiết kế (2) | Ban Kinh doanh (2) |    Nhà đầu tư (1)    | Ghi chú bảo mật & Phạm vi                                           |
| :---: | :-------------------------------- | :--------------: | :--------------: | :----------------: | :------------------: | :------------------------------------------------------------------ |
| **1** | **Source Code & API Keys**        |    **Editor**    |  Không truy cập  |   Không truy cập   |    Không truy cập    | **Restricted tuyệt đối.** Lộ API key là đi tong cả hệ thống.        |
| **2** | **Tài sản đồ họa & UI Assets**    |    **Viewer**    |    **Editor**    |     **Viewer**     |    Không truy cập    | Dev & Biz cần tải asset về lắp ráp nhưng cấm sửa file gốc.          |
| **3** | **Business Plan (Bản mật)**       |    **Viewer**    |  Không truy cập  |     **Editor**     |    Không truy cập    | Dev chỉ đọc để hiểu nghiệp vụ code, Biz toàn quyền chỉnh sửa.       |
| **4** | **Slide Pitch Deck (PDF)**        |    **Viewer**    |    **Viewer**    |     **Editor**     | **Viewer (14 ngày)** | Nhà đầu tư chỉ được xem trong 14 ngày, tự động hết hạn.             |
| **5** | **Thông tin cá nhân & Ngân sách** |  Không truy cập  |  Không truy cập  |   Không truy cập   |    Không truy cập    | **Chỉ Trưởng nhóm/Admin** có quyền. Cấm tuyệt đối Anyone with link. |

---

### 5. Giải mã 3 bẫy dữ liệu hóc búa

- **Bẫy 1: Ban Kinh doanh muốn chia sẻ Business Plan cho Ban Kỹ thuật đọc hiểu context mà không sợ bị sửa nhầm.**
  - **Quyền cấp:** `Viewer` (Người xem), phạm vi `Restricted` (chỉ thêm đích danh email của 3 bạn dev).
  - **Lý do:** Dev chỉ cần nắm luồng nghiệp vụ để thiết kế Database và API; quyền Viewer bảo vệ tính toàn vẹn của số liệu tài chính mà Biz đã dày công tính toán.

- **Bẫy 2: Nhà đầu tư muốn tải PDF Slide Pitch về thuyết trình offline, nhưng Trưởng nhóm sợ lộ bản sửa được.**
  - **Quyền cấp:** `Viewer` kèm thời hạn **14 ngày**.
  - **Bật/Tắt tính năng:**
    - Chỉ upload và chia sẻ file định dạng **`.pdf`** (không gửi file gốc `.pptx` hay Google Slides có thể copy paste nguyên khối).
    - **KHÔNG cần tắt** tính năng _"Viewers can download"_ vì họ cần tải PDF về chiếu offline theo đúng yêu cầu. Vì là PDF đã xuất bản nên họ không thể sửa đè lên bản thuyết trình gốc của nhóm.

- **Bẫy 3: Một thành viên bất ngờ nghỉ việc, cần cắt quyền truy cập ngay lập tức.**
  - **Thao tác chuẩn:**
    1. Trưởng nhóm mở hộp thoại chia sẻ tại thư mục gốc `CampusPay_Root` (và các file lẻ nếu có chia sẻ riêng).
    2. Tìm email của thành viên đó -> Nhấp vào menu quyền -> Chọn **Remove access** (Xóa quyền truy cập) -> Bấm **Save**.
    3. Kiểm tra và đổi ngay các API Key / Database Password dùng chung nếu bạn đó từng làm bên ban Kỹ thuật.
