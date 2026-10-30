# Bài 6: Thiết lập Môi trường Làm việc Số cho Doanh nghiệp

## README dự án Trang trại thông minh Green-Tech

### 1. Cấu trúc thư mục

```text
Green-Tech/
├── README.md
├── sensors/
│   ├── firmware/
│   ├── docs/
│   └── tests/
├── reports/
│   ├── investor/
│   └── internal/
├── meeting-notes/
└── .gitignore
```

Mã nguồn cảm biến được quản lý bằng Git trong kho riêng của nhóm. Tài liệu và báo cáo được lưu trong Cloud Drive của tổ chức, bật đồng bộ để có bản làm việc cục bộ và bản Cloud. Báo cáo nhà đầu tư đặt riêng để dễ cấp quyền. Tệp `.env` chỉ lưu trên máy hoặc trong kho bí mật được bảo vệ, không đưa vào Git hay thư mục chia sẻ. Thêm `.env` vào `.gitignore`; dùng `.env.example` chỉ chứa tên biến và giá trị mẫu không nhạy cảm.

### 2. Kênh cộng tác

| Kênh                  | Mục đích                                                                       |
| --------------------- | ------------------------------------------------------------------------------ |
| `green-announcements` | Quyết định, mốc tiến độ và thông báo của trưởng dự án.                         |
| `green-sensors`       | Thảo luận kỹ thuật về cảm biến, log và lỗi. Mỗi lỗi trao đổi trong một thread. |
| `green-tasks`         | Danh sách việc, người phụ trách và deadline.                                   |
| `green-reports`       | Trao đổi nội dung báo cáo; không đưa thông tin bí mật vào kênh có khách ngoài. |
| `green-lounge`        | Trao đổi ngoài công việc.                                                      |

### 3. Quyền chia sẻ

| Đối tượng        | Quyền và phạm vi                                                                                        |
| ---------------- | ------------------------------------------------------------------------------------------------------- |
| Đội Dev          | Editor với kho code và thư mục kỹ thuật cần thiết; không chia sẻ `.env`.                                |
| Trưởng dự án     | Quản lý thư mục và quyền; lưu thông tin khôi phục tài khoản.                                            |
| Nhà đầu tư       | Viewer chỉ với `reports/investor`; không có quyền vào code hoặc tài liệu nội bộ.                        |
| Đối tác thiết bị | Commenter trên tài liệu yêu cầu/biên bản liên quan; không cấp quyền vào báo cáo tài chính hay kho code. |

Không bật liên kết công khai cho tài liệu nhạy cảm. Cấp quyền cho tài khoản cụ thể, rà soát theo đợt và thu hồi khi người đó không còn tham gia. Khi kết thúc bài tập, chủ sở hữu hiện tại dùng Transfer Ownership để chuyển thư mục/kho và tài liệu cho người tiếp tục quản lý; kiểm tra người nhận đã truy cập được rồi mới bàn giao hoàn tất.

### 4. Chuyển thảo luận lỗi thành task

Khi có lỗi cảm biến, người báo tạo thread trong `green-sensors`, ghi thiết bị, cách tái hiện, kết quả mong muốn, log và ảnh. Nhóm chốt người phụ trách, mức ưu tiên và deadline. Người điều phối tạo task trong `green-tasks` với đường dẫn thread, việc cần làm, người nhận và ngày giờ hạn. Khi sửa xong, người phụ trách cập nhật task và đăng kết quả trong thread để người báo kiểm tra.

### 5. Khôi phục nếu bị xóa thư mục `sensors`

1. Báo cả nhóm dừng tạo thay đổi trong thư mục đó; kiểm tra thùng rác của Cloud Drive hoặc Git để xác định phạm vi bị xóa.
2. Khôi phục thư mục hoặc phiên bản ổn định gần nhất từ thùng rác/Version History. Với code, lấy lại commit từ kho Git; nếu xóa trên Cloud Drive, phục hồi từ thùng rác của dịch vụ. Không tạo dữ liệu mới đè lên bản cần khôi phục.
3. Kiểm tra các tệp và lịch sử commit, chạy thử thiết bị/mã liên quan, xác nhận quyền truy cập và bật lại đồng bộ. Sau đó thông báo kết quả và nguyên nhân cho nhóm.
