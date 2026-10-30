# STAGE 11 – TÓM TẮT ÔN TẬP

> Phạm vi: 3 bài đọc có trong ZIP: **Excel/Sheets – Database & AutoFilter**, **Excel – VLOOKUP**, **PowerPoint/Slides – thiết kế báo cáo kỹ thuật**.

## 1. Excel/Sheets: Tư duy Database & AutoFilter

### Tư duy bảng dữ liệu chuẩn
- **Row = Record (bản ghi):** một hàng là một đối tượng hoàn chỉnh, ví dụ một sinh viên hoặc một đơn hàng.
- **Column = Field (trường):** một cột là một thuộc tính, ví dụ MSSV, họ tên, điểm.
- **Header:** hàng tiêu đề duy nhất, mỗi cột có tên rõ ràng.
- Dữ liệu nên ở dạng **bảng phẳng (Flat Table)**: mỗi ô chứa một giá trị; không trộn nhiều loại dữ liệu trong cùng cột.
- **Không Merge Cells**, không chèn hàng trống giữa bảng, không đặt Total/Average ở giữa dữ liệu.

### AutoFilter
- Bật/tắt bộ lọc: **`Ctrl + Shift + L`** (Windows).
- Lọc chữ: `Text Filters` → `Contains...` hoặc chọn giá trị cần xem.
- Lọc số: `Number Filters` → `Greater Than...`, `Between...`…
- Có thể lọc nhiều cột cùng lúc; các điều kiện được kết hợp để tìm phần giao, ví dụ `Department = Sales` **và** `Salary >= 40000`.
- `Alt + ↓`: mở menu lọc ở ô tiêu đề đang chọn.
- `Ctrl + A`: chọn khối dữ liệu liên tục; `Ctrl + T`: chuyển vùng dữ liệu thành Excel Table.
- `=TRIM(A2)`: loại bỏ khoảng trắng thừa ở đầu/cuối và thu gọn khoảng trắng lặp giữa các từ trong dữ liệu văn bản.

### Lỗi Filter thường gặp
- **Lọc chỉ tới một đoạn:** thường do hàng trống hoàn toàn làm ngắt vùng dữ liệu hoặc hàng tiêu đề bị gộp ô.
- **Không lọc đúng mã/tên:** dữ liệu có khoảng trắng thừa; thử `TRIM()` và chuẩn hóa dữ liệu.
- Để dòng tổng ở ngoài vùng dữ liệu. Tránh dùng màu sắc thủ công thay cho lọc theo giá trị.

### Ứng dụng
Lọc đơn hàng chưa thanh toán, khách VIP, tồn kho thấp; bảng phẳng và sạch dễ chuyển tiếp sang PivotTable, Power BI, Python/Pandas hoặc SQL.

---

## 2. Excel: VLOOKUP – tra cứu và nối dữ liệu

### Cú pháp cần thuộc
```excel
=VLOOKUP(Lookup_value, Table_array, Col_index_num, FALSE)
```

| Tham số | Ý nghĩa |
|---|---|
| `Lookup_value` | Giá trị/khóa cần tìm, ví dụ mã sản phẩm ở `G3`. |
| `Table_array` | Vùng bảng tra cứu; **cột đầu tiên của vùng phải chứa khóa**. |
| `Col_index_num` | Số thứ tự cột cần trả về, đếm từ cột đầu tiên của `Table_array` là 1. |
| `FALSE` hoặc `0` | Tìm **chính xác**; nên dùng để tránh kết quả gần đúng ngoài ý muốn. |

Ví dụ tra tên sản phẩm từ sheet `Catalog`:
```excel
=VLOOKUP("SP01", Catalog!$A:$C, 2, FALSE)
```

### F4 và dấu `$`
- Khi kéo công thức xuống nhiều dòng, vùng `Table_array` không được trôi.
- Chọn tham chiếu vùng trong công thức rồi bấm **`F4`** để chuyển sang tham chiếu tuyệt đối, ví dụ `$A:$C` hoặc `$A$2:$C$100`.
- Nếu quên khóa vùng, vùng tra cứu bị dịch theo từng dòng; các mã không còn nằm trong vùng và có thể trả về `#N/A`.

### Điền hàng loạt và xử lý lỗi
- Nhập công thức ở dòng đầu, sau đó kéo hoặc **nhấp đúp Fill Handle** ở góc dưới bên phải ô để tự điền xuống các dòng liền kề.
- Dùng `IFERROR` để hiển thị thông báo dễ hiểu khi tra cứu thất bại:
```excel
=IFERROR(VLOOKUP(G3, $A:$E, 5, FALSE), "Chưa có giá")
```
- `#N/A` thường do khóa không tồn tại, khóa có khoảng trắng thừa, chọn sai vùng, hoặc dữ liệu khóa không nằm ở cột đầu tiên của vùng tra cứu.
- VLOOKUP tra theo chiều dọc và không tra ngược từ phải sang trái. Có thể gặp `XLOOKUP` hoặc `INDEX/MATCH` ở bài toán linh hoạt hơn.
- Về ý tưởng, VLOOKUP giúp nối thông tin giữa các bảng; đây là bước đệm để hiểu `JOIN` trong SQL.

---

## 3. PowerPoint/Google Slides: Thiết kế báo cáo trực quan

### Quy tắc 10/20/30
- **10:** tối đa khoảng 10 slide.
- **20:** bài trình bày khoảng/dưới 20 phút.
- **30:** cỡ chữ tối thiểu khoảng 30 pt để dễ đọc.

### Nguyên tắc thiết kế
- **Assertion Title:** tiêu đề là câu khẳng định/kết luận, không chỉ là tên chủ đề. Ví dụ: “Tối ưu Index giúp giảm thời gian phản hồi 65%”.
- Mỗi slide tập trung vào **một thông điệp chính**.
- Dùng biểu đồ cột/thanh thay vì dán bảng số liệu dài; thể hiện đúng insight cần người xem nhớ.
- Bố cục tham khảo: **tiêu đề kết luận → vùng nội dung/biểu đồ → nguồn dữ liệu**.
- Dùng 2 màu trung tính + 1 màu nhấn; đảm bảo tương phản tốt.
- Chừa khoảng trắng khoảng 30–40%; dùng font dễ đọc, không nhồi chữ.

### Tránh
- Dán nguyên bảng Excel nhiều ô hoặc đoạn văn dài lên slide.
- Dùng biểu đồ 3D làm méo cảm nhận về tỷ lệ.
- Chọn màu chữ/nền tương phản kém.
- Quay lưng đọc nguyên văn nội dung trên màn hình.

### Phím tắt cần nhớ
| Phím | Tác dụng |
|---|---|
| `F5` | Trình chiếu từ slide đầu tiên. |
| `Shift + F5` | Trình chiếu từ slide hiện tại. |
| `B` hoặc `.` | Làm đen màn hình khi đang trình chiếu. |
| `W` hoặc `,` | Làm trắng màn hình khi đang trình chiếu. |
| `Ctrl + P` | Bật bút để chú thích trên slide khi trình chiếu. |

---

## 4. Các ý dễ bị hỏi trong bài kiểm tra

1. **Record vs Field:** Record là hàng/đối tượng; Field là cột/thuộc tính.
2. **Vì sao Filter dừng giữa bảng?** Có hàng trống hoàn toàn hoặc hàng tiêu đề bị Merge Cells.
3. **TRIM() làm gì?** Dọn khoảng trắng thừa để dữ liệu văn bản thống nhất.
4. **VLOOKUP có 4 tham số nào?** Khóa tìm, vùng tra, chỉ số cột trả về, chế độ tìm.
5. **Vì sao cần F4?** Khóa vùng tra bằng `$`, tránh vùng bị trôi khi kéo công thức.
6. **Vì sao dùng FALSE?** Buộc tìm chính xác.
7. **IFERROR dùng làm gì?** Thay lỗi bằng thông báo dễ hiểu.
8. **Rule 10/20/30 là gì?** Tối đa 10 slide, khoảng/dưới 20 phút, chữ tối thiểu 30 pt.
9. **Assertion Title là gì?** Tiêu đề nói kết luận/thông điệp của slide.
10. **F5 khác Shift + F5?** Từ đầu bài so với từ slide hiện tại.

## 5. Mẹo nhớ cực nhanh

- **Database:** `1 hàng = 1 record`, `1 cột = 1 field`, không merge, không hàng trống.
- **Filter:** `Ctrl + Shift + L`.
- **VLOOKUP:** `Key → Table → Cột → FALSE`; nhớ `F4` khóa vùng và `IFERROR` bọc lỗi.
- **Slide:** `10–20–30`, tiêu đề kết luận, một slide một thông điệp, biểu đồ rõ, tương phản cao.

> Ghi chú phạm vi: trang LMS trong ZIP ghi “Buổi 11”, trong khi phần đầu của các bài đọc nhúng ghi “Session 10”. Bản ôn này tổng hợp đúng ba nội dung đọc được trong file, không tự thêm một Lesson 01 không có nguồn rõ ràng.
