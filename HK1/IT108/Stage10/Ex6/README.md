# BÀI 6: SỰ CỐ TÀI LIỆU DỰ ÁN TRÊN GITHUB

## Phần 1: Phân tích

### Sai lầm 1: Nhầm lẫn bản chất giữa Rich Text (.docx) và Plain Text (Văn bản thô):

- File Word (`.docx`) thực chất là một tập tin nén (ZIP) chứa các cấu trúc mã hóa nhị phân (Binary) rườm rà cùng hàng loạt mã định dạng XML phức tạp (font chữ, màu sắc, căn lề, layout page).
- GitHub được sinh ra để quản lý mã nguồn và văn bản thô (**Plain Text**). Do `.docx` là file nhị phân, GitHub **không thể đọc hay hiển thị (render) trực tiếp nội dung** trên trình duyệt web. Đồng đội muốn xem bắt buộc phải nhấn "Download" về máy rồi mở bằng Microsoft Word vô cùng bất tiện.

### Sai lầm 2: Ngây thơ tin rằng Git có thể theo dõi lịch sử (Git Diff/Merge) trên file Word:

- Git theo dõi thay đổi dựa trên từng dòng chữ (**Line-by-line tracking**) của văn bản thô.
- Với file nhị phân `.docx`, khi Nam chỉ sửa một dấu phẩy hoặc một từ, toàn bộ cấu trúc mã hóa nhị phân bên trong file bị thay đổi hoàn toàn. Git không thể "nhìn" vào bên trong để biết dòng nào bị sửa. Kết quả: Git coi toàn bộ file bị thay đổi và khi bạn khác cũng sửa file, Git sẽ báo "Xung đột nhị phân toàn bộ file (Binary Merge Conflict)" mà không thể tự động gộp (Auto-merge) được.

### Tại sao Markdown (.md) lại an toàn, nhẹ hơn và chống hư hại file vượt trội?

| Tiêu chí                                 | File Word (`.docx` - Rich Text / Binary)                                                                               | File Markdown (`.md` - Plain Text)                                                                                  | Ưu thế tuyệt đối của Markdown                              |
| :--------------------------------------- | :--------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------ | :--------------------------------------------------------- |
| **Bản chất dữ liệu**                     | Mã hóa nhị phân (Binary Zip), nặng hàng MB                                                                             | Văn bản thô thuần túy (Plain Text), siêu nhẹ vài KB                                                                 | Giảm 99% dung lượng, tải lên/xuống mượt mà.                |
| **Khả năng xem trên GitHub**             | KHÔNG thể xem trực tiếp, bắt buộc phải Tải về                                                                          | Hiển thị giao diện trực quan ngay trên trình duyệt\*\*                                                              | Đồng đội nhấp vào là xem được ngay lập tức.                |
| **Khả năng so sánh (Git Diff)**          | KHÔNG hỗ trợ. Git coi như một cục nhị phân đốm đen                                                                     | So sánh chính xác từng dòng, từng từ bị sửa\*\*                                                                     | Nhìn rõ ai đã sửa gì, vào lúc nào (Git Blame / Diff).      |
| **Khả năng gộp file (Git Merge)**        | Dễ bị Xung đột (Conflict) toàn bộ file dù chỉ sửa 1 dấu phẩy                                                           | Tự động gộp (Auto-merge) cực kỳ thông minh\*\*                                                                      | Nhiều người có thể cùng sửa 1 file mà không bị đè đè nhau. |
| **Độ bền khi mất dữ liệu (Bẫy dữ liệu)** | **RẤT NGUY HIỂM:** Mất 1 byte dữ liệu làm hỏng cấu trúc Zip -> **File hỏng hoàn toàn (Corrupted File)** không mở được. | **SIÊU AN TOÀN:** Mất 1 byte chỉ mất đúng 1 ký tự đó, **99.9% nội dung còn lại vẫn nguyên vẹn** và đọc bình thường. | An toàn tuyệt đối cho tài liệu kỹ thuật dài hạn.           |

## Phần 2: Hoàn thiện

- File được chuyển đổi từ Word sang Markdown có tên là [GreenTech_Intro.md](https://github.com/quangdev05/PTIT-2026-2027/blob/main/HK1/IT108/Stage10/Ex6/GreenTech_Intro.md) nằm trên cùng thư mục."
