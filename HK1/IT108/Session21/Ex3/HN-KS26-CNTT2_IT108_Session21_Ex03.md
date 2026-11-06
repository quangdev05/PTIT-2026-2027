# Bài 3 - Ứng dụng mô hình IPO trong xử lý lỗi Git

## 1. Phân tích theo mô hình IPO

| Thành phần  | Phân tích                                                                                                                                                                                                                            |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Input**   | Ngữ cảnh: đang gõ lệnh Git nhưng chưa đứng trong thư mục dự án Git (hoặc thư mục cha không chứa `.git`). Mã lỗi nguyên văn: `fatal: not a git repository (or any of the parent directories): .git`.                                  |
| **Process** | AI nhận diện cụm “not a git repository” là Git không tìm thấy metadata `.git`; giải nghĩa thuật ngữ bằng tiếng Việt; đề xuất kiểm tra thư mục hiện tại, chuyển vào đúng dự án, rồi khởi tạo repository nếu đây thực sự là dự án mới. |
| **Output**  | Bản dịch dễ hiểu và các bước kiểm tra/khắc phục an toàn, không tự ý xóa hay sửa dữ liệu dự án.                                                                                                                                       |

## 2. Prompt hoàn chỉnh

> **Ngữ cảnh:** Tôi đang làm việc trên máy tính Windows trong Terminal và muốn sử dụng Git cho một dự án. Tôi chưa chắc Terminal đang mở đúng thư mục dự án.
>
> **Mã lỗi nguyên văn:** `fatal: not a git repository (or any of the parent directories): .git`
>
> **Yêu cầu:** Hãy giải thích lỗi trên bằng tiếng Việt đơn giản. Hướng dẫn tôi từng bước kiểm tra thư mục hiện tại, chuyển đến thư mục dự án đúng và xác định dự án đã được khởi tạo Git chưa. Nếu đây là dự án mới chưa có Git, hãy nêu cách khởi tạo an toàn. Cho tối đa 3 bước, ghi rõ lệnh cần nhập và tác dụng; không đề xuất lệnh xóa dữ liệu.

## 3. Bản dịch và ba bước xử lý

**Bản dịch:** “Thư mục hiện tại không phải là một kho Git; Git cũng không tìm thấy thư mục `.git` ở các thư mục cha.” Nói đơn giản, Git chưa nhận ra vị trí dự án có theo dõi phiên bản.

1. Kiểm tra vị trí hiện tại bằng `pwd` (Git Bash/terminal Unix) hoặc `Get-Location` (PowerShell). Dùng `dir`/`ls` để xem nội dung thư mục.
2. Dùng `cd đường_dẫn_đến_dự_án` để vào đúng thư mục dự án. Nếu dự án đã được clone, kiểm tra có thư mục ẩn `.git` hay không; có thể chạy `git status` để xác nhận.
3. Chỉ khi đây là dự án mới và chưa có lịch sử Git, vào đúng thư mục rồi chạy `git init`. Không chạy lệnh này ở thư mục cha rộng hoặc nơi chứa nhiều dự án.

## 4. Lưu ý

Không cung cấp mật khẩu, token hoặc dữ liệu riêng tư trong prompt. Hãy kiểm tra đường dẫn và hiểu tác dụng của lệnh trước khi chạy; nội dung AI đưa ra cần được đối chiếu với tình trạng thực tế của thư mục.
