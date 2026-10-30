# (BÀI TỔNG HỢP) HỒ SƠ ĐỒ ÁN HỆ THỐNG QUẢN LÝ THƯ VIỆN TRƯỜNG

## Phần 2. Chuẩn hóa dữ liệu và AutoFilter

### 1. Ba lỗi vi phạm quy tắc dữ liệu

| STT | Vị trí trong bảng gốc | Lỗi                                          | Quy tắc bị vi phạm                          |
| --: | --------------------- | -------------------------------------------- | ------------------------------------------- |
|   1 | Hàng 1, vùng A1:E1    | Các ô bị gộp (Merge) để làm tiêu đề lớn      | Không gộp ô trong vùng dữ liệu              |
|   2 | Hàng 5                | Có một hàng trống hoàn toàn giữa các bản ghi | Không để hàng trống trong vùng dữ liệu      |
|   3 | Hàng 6                | Dòng “Tổng cộng” nằm giữa vùng dữ liệu       | Không đặt dòng tổng cộng trong vùng dữ liệu |

### 2. Record và Field là gì?

- **Record (bản ghi):** Một hàng chứa thông tin của một đối tượng. Ví dụ, hàng của **SV002 – Trần Thị Bình – S002 – 03/10/2026 – Quá hạn** là một Record.
- **Field (trường dữ liệu):** Một cột mô tả một loại thông tin. Ví dụ, cột **MSSV** hoặc cột **Tình Trạng** là một Field.

### 3. Bật AutoFilter và lọc phiếu quá hạn

1. Bấm vào một ô bất kỳ trong bảng đã chuẩn hóa.
2. Nhấn **Ctrl + Shift + L** để bật AutoFilter.
3. Bấm nút lọc ở cột **Tình Trạng**.
4. Bỏ chọn các giá trị khác, chỉ chọn **Quá hạn**, rồi nhấn **OK**.

---

## Phần 4. Nội dung cho một slide báo cáo tiến độ

### Áp dụng Rule 10/20/30

- **10:** Một slide trong tổng số 10 slide chiếm **10%** tổng số slide.
- **20:** Nếu dành tổng cộng 20 phút và phân bổ đều thời gian, slide này có khoảng **2 phút** trình bày.
- **30:** Cỡ chữ nên từ **30 pt trở lên** để nội dung dễ đọc khi trình chiếu.
