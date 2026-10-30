# Bài 9: Tự động tra cứu phòng và thù lao báo cáo viên bằng VLOOKUP

## Phần 1. Phân tích bài toán (I/O)

### 1. Xác định các thành phần của VLOOKUP

- **Input:** Mã tác giả ở cột C của sheet `DanhSachBaoCao`.
- **Xử lý:** Dùng mã tác giả để tìm thông tin tương ứng trong sheet `DanhMucTacGia`.
- **Output:** Điền tên tác giả, phòng trình bày và thù lao vào các cột D, E, F.

| Cột cần điền       | Lookup_value | Table_array                | Col_index_num |
| ------------------ | ------------ | -------------------------- | ------------: |
| D: Tên tác giả     | `TRIM(C2)`   | `DanhMucTacGia!$A$2:$E$81` |             2 |
| E: Phòng trình bày | `TRIM(C2)`   | `DanhMucTacGia!$A$2:$E$81` |             4 |
| F: Thù lao         | `TRIM(C2)`   | `DanhMucTacGia!$A$2:$E$81` |             5 |

_Lưu ý:_ Bảng tra trong ví dụ được giả sử có dữ liệu từ hàng 2 đến hàng 81. Khi làm trên file Excel thực tế, cần điều chỉnh hàng cuối cho khớp với danh mục tác giả.

### 2. Cách xử lý ba lỗi dữ liệu

- **Mã tác giả có khoảng trắng:** Dùng `TRIM(C2)` để loại bỏ khoảng trắng thừa ở đầu và cuối mã, giúp việc tra cứu chính xác hơn.
- **Tác giả chưa có trong danh mục:** Bọc hàm `VLOOKUP` bằng `IFERROR`. Nếu không tìm thấy mã tác giả, ô kết quả sẽ hiển thị `Chưa cập nhật` thay vì lỗi `#N/A`.
- **Vùng tra cứu bị thay đổi khi kéo công thức:** Thêm dấu `$` vào địa chỉ vùng dữ liệu, ví dụ `$A$2:$E$81`, để vùng tra cứu được giữ nguyên.

### 3. Các bước thực hiện trên Excel

1. Mở sheet `DanhSachBaoCao` và xác định cột C chứa mã tác giả.
2. Kiểm tra sheet `DanhMucTacGia`, xác định cột A là mã tác giả và các cột B, D, E lần lượt chứa tên, phòng và thù lao.
3. Nhập công thức tra cứu vào ô D2, kết hợp `TRIM`, `VLOOKUP` và `IFERROR`.
4. Sao chép công thức xuống các dòng còn lại trong cột D.
5. Thực hiện tương tự cho cột E và F, chỉ thay đổi số thứ tự cột cần lấy.
6. Kiểm tra các dòng có khoảng trắng thừa và ba tác giả chưa có trong danh mục để bảo đảm kết quả đúng.

## Phần 2. Triển khai và chống lỗi

### 4. Công thức cho ô D2: Tên tác giả

```excel
=IFERROR(VLOOKUP(TRIM(C2),DanhMucTacGia!$A$2:$E$81,2,FALSE),"Chưa cập nhật")
```

Giải thích:

- `TRIM(C2)` lấy mã tác giả ở ô C2 và loại bỏ khoảng trắng thừa ở đầu, cuối.
- `DanhMucTacGia!$A$2:$E$81` là vùng dữ liệu dùng để tra cứu trong sheet `DanhMucTacGia`. Dấu `$` giúp cố định vùng này khi kéo công thức xuống dưới.
- `2` có nghĩa là lấy dữ liệu ở cột thứ hai của vùng tra cứu, tức cột B là Tên Tác Giả.
- `FALSE` yêu cầu tìm mã tác giả khớp chính xác.
- `IFERROR(...,"Chưa cập nhật")` hiển thị nội dung `Chưa cập nhật` nếu tra cứu bị lỗi, chẳng hạn mã tác giả chưa có trong danh mục.

### 5. Công thức cho ô E2 và F2

**Ô E2: Phòng trình bày**

```excel
=IFERROR(VLOOKUP(TRIM(C2),DanhMucTacGia!$A$2:$E$81,4,FALSE),"Chưa cập nhật")
```

**Ô F2: Thù lao**

```excel
=IFERROR(VLOOKUP(TRIM(C2),DanhMucTacGia!$A$2:$E$81,5,FALSE),"Chưa cập nhật")
```

Hai công thức này giữ nguyên cách tra cứu, chỉ đổi `Col_index_num`:

- `4` để lấy cột D, tức Phòng.
- `5` để lấy cột E, tức Thù Lao.

Không cần viết lại toàn bộ cách tra cứu vì mã tác giả, vùng dữ liệu, cách xử lý khoảng trắng và cách xử lý lỗi đều giống nhau. Chỉ khác thông tin muốn lấy về.

### 6. Điều gì xảy ra nếu bỏ dấu `$`?

Ví dụ, nếu công thức trong D2 dùng vùng tra cứu tương đối:

```excel
=IFERROR(VLOOKUP(TRIM(C2),DanhMucTacGia!A2:E81,2,FALSE),"Chưa cập nhật")
```

Khi kéo công thức từ D2 xuống D5, Excel tự dịch vùng tra cứu xuống ba hàng, từ:

```text
DanhMucTacGia!A2:E81
```

thành:

```text
DanhMucTacGia!A5:E84
```

Như vậy, các dòng đầu của danh mục có thể bị bỏ qua, khiến công thức tìm sai hoặc trả về `Chưa cập nhật` dù mã đó vẫn tồn tại. Vì thế nên cố định vùng tra cứu bằng `DanhMucTacGia!$A$2:$E$81`.
