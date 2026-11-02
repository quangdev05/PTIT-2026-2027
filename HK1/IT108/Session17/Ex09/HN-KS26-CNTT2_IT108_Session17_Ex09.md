# Bài 9: Thiết Kế Không Gian Đa Profile Và Kiến Trúc Bookmark Cho Trạm Khám Bệnh

## Phần 1: Báo cáo phân tích kiến trúc đa Profile

### 1. Nguyên nhân xung đột phiên đăng nhập

Một Chrome Profile có vùng dữ liệu người dùng riêng (User Data), gồm cookies, history, bookmarks, extensions và các thiết lập. Cookie phiên của một dịch vụ được gửi trong các request tới dịch vụ đó theo phạm vi domain/path và thuộc tính cookie. Việc mở thêm tab GitHub cá nhân tự nó không làm CarePulse đăng xuất nếu là các domain khác nhau; tuy vậy khi nhiều người/tài khoản dùng chung một Profile, dữ liệu phiên, autofill và trạng thái đăng nhập cùng tồn tại, dễ nhầm tài khoản hoặc bị ứng dụng cùng domain/SSO ghi đè phiên. Máy dùng chung còn làm lộ lịch sử, bookmark và dữ liệu đăng nhập cho người dùng sau. Tách Profile tạo vùng lưu trữ riêng, giảm xung đột và lộ lọt do dùng chung; không thay thế tài khoản Windows, phân quyền ứng dụng hay quy trình bảo vệ dữ liệu.

### 2. Ba Profile chuyên dụng

| Profile | Mục đích | Theme nhận diện | Dữ liệu riêng trong Profile |
| --- | --- | --- | --- |
| `Work_CarePulse` | Chỉ dùng cho bác sĩ/điều dưỡng trực và các hệ thống nghiệp vụ được phê duyệt | Xanh dương đậm | Cookies/phiên CarePulse, History, Bookmarks và Extensions riêng. Không lưu mật khẩu bệnh nhân; khóa màn hình khi rời máy và đăng xuất/đóng phiên theo quy trình. |
| `Personal` | Tài khoản cá nhân của chủ máy, không dùng trong ca khám hay khi người khác xem hồ sơ | Tím | Cookies, History, Bookmarks, Extensions riêng; không đồng bộ vào tài khoản cá nhân trên máy trạm phòng khám. Tốt nhất không đăng nhập Profile này trên máy dùng chung. |
| `Sandbox_Test` | Thử nghiệm website/extension hoặc học tập, không truy cập dữ liệu thật | Cam | Cookies, History, Bookmarks, Extensions riêng; dùng dữ liệu giả và xóa phiên sau thử nghiệm. |

Chrome Profile tách dữ liệu trình duyệt, nhưng nếu tất cả dùng cùng tài khoản hệ điều hành thì không tạo ranh giới bảo mật mạnh trước người có quyền truy cập máy. Để đáp ứng yêu cầu bảo vệ dữ liệu, mỗi nhân viên cần tài khoản hệ điều hành riêng nếu hạ tầng hỗ trợ, màn hình tự khóa, và không để phiên bệnh nhân mở khi rời vị trí. Không lưu mật khẩu trên trạm dùng chung; áp dụng chính sách của cơ sở y tế.

## Phần 2: Bookmark và quy trình an toàn

### 3. Cây thư mục Bookmark

Mở Trình quản lý dấu trang bằng **Ctrl + Shift + O**. Tạo ba thư mục chính theo yêu cầu:

```text
Thanh dấu trang
├── 01_CarePulse_Clinic
│   ├── CarePulse – Cổng khám (URL nội bộ do đơn vị cấp)
│   ├── Cổng BHYT (URL chính thức do đơn vị xác nhận)
│   └── Lịch trực / hướng dẫn quy trình nội bộ
├── 02_Pharma_Portal
│   ├── Dược thư Quốc gia (địa chỉ chính thức được xác minh)
│   ├── Cổng tra cứu thuốc của cơ quan y tế có thẩm quyền
│   └── Danh mục thuốc / hướng dẫn sử dụng nội bộ đã phê duyệt
└── 03_Medical_Tools
    ├── Google Dịch (chỉ hỗ trợ dịch tài liệu, không nhập thông tin định danh bệnh nhân)
    ├── Máy tính/đổi đơn vị y khoa được cơ sở phê duyệt
    └── Hướng dẫn tra cứu thuật ngữ y khoa đáng tin cậy
```

Tên miền chính xác của hệ thống nội bộ và cổng BHYT phải lấy từ quản trị viên/cơ quan chính thức; không đoán URL hoặc lưu đường dẫn không xác minh. Để chứa ít nhất 30 liên kết mà thanh dấu trang không tràn, chỉ ghim ba thư mục gốc lên thanh; đặt các liên kết trong thư mục con, dùng tên ngắn có quy ước, phân nhóm theo công việc và loại bỏ liên kết trùng/lỗi. Không nhồi 30 liên kết trực tiếp lên thanh.

### 4. Favicon-Only cho bốn trang hay dùng

Với từng trang CarePulse, Cổng BHYT, Dược thư và Google Dịch: nhấp phải bookmark trên thanh → **Edit/Chỉnh sửa** → xóa phần **Name/Tên** nhưng giữ URL → **Save/Lưu**. Bookmark sẽ hiển thị favicon thay tên nếu trang cung cấp biểu tượng. Chỉ nên làm với trang có favicon dễ nhận diện; giữ tooltip/địa chỉ để kiểm tra khi cần và tránh nhầm các biểu tượng tương tự. Đây là tiết kiệm không gian thanh công cụ, không phải cơ chế tăng bảo mật.

### 5. Khách mượn máy và Cloud Sync

Với máy tính dùng chung và khách chỉ cần tra cứu, ưu tiên **Guest Profile/Chế độ khách**: đây là phiên tách biệt, không mở dữ liệu duyệt web, bookmark hay phiên làm việc của nhân viên; đóng cửa sổ khách để kết thúc phiên và xóa dữ liệu phiên khách. **Incognito/Ẩn danh** chỉ không lưu một số lịch sử/cookie cục bộ sau khi đóng cửa sổ, nhưng vẫn dùng cùng Chrome Profile, có thể truy cập phiên đang đăng nhập và không che hoạt động khỏi website, quản trị mạng hay phần mềm giám sát. Vì vậy Incognito không phù hợp để cho người khác dùng máy đang có dữ liệu nghiệp vụ.

Không bật Cloud Sync cho tài khoản cá nhân trên máy trạm y tế dùng chung: bookmark, history, mật khẩu hoặc dữ liệu trình duyệt cá nhân có thể đồng bộ lên tài khoản/thiết bị khác và làm tăng nguy cơ lộ dữ liệu, đồng bộ nhầm hoặc để lại phiên. Với Profile công việc, chỉ dùng đồng bộ nếu tổ chức cho phép và quản lý bằng chính sách doanh nghiệp; dữ liệu bệnh nhân không được đưa vào dịch vụ đồng bộ cá nhân. Khi mất mạng, Profile không tự bảo vệ dữ liệu bệnh nhân: không để hồ sơ mở, khóa máy khi rời chỗ và đăng xuất theo quy trình; không ghi dữ liệu bệnh nhân vào bookmark hay tài liệu cục bộ không được phê duyệt.
