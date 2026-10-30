# 1. Khái niệm Stack (Ngăn xếp)

Stack (ngăn xếp) là một cấu trúc dữ liệu dùng để lưu trữ các phần tử theo nguyên tắc thêm vào và lấy ra tại cùng một đầu, gọi là đỉnh ngăn xếp (Top).

Mày có thể tưởng tượng Stack giống như một chồng đĩa. Khi muốn đặt thêm đĩa, ta đặt lên trên cùng. Khi muốn lấy đĩa, ta cũng lấy từ trên cùng, chứ không thể tùy tiện rút chiếc ở giữa mà không làm xáo trộn chồng đĩa.

Stack có hai thao tác cơ bản là `Push` và `Pop`.

# 2. Nguyên lý LIFO

Stack hoạt động theo nguyên tắc LIFO (Last In, First Out), nghĩa là vào sau, ra trước.

Ví dụ: Mày đặt ba quyển sách lên bàn theo thứ tự:

1. Đặt sách A.
2. Đặt sách B lên A.
3. Đặt sách C lên B.

Lúc này, sách C nằm trên cùng. Nếu lấy sách ra theo đúng nguyên tắc Stack, thứ tự sẽ là C → B → A.

Điều quan trọng cần nhớ: Phần tử được thêm vào sau cùng sẽ được lấy ra trước tiên.

# 3. Hai thao tác cơ bản

- Push (thêm phần tử): Đưa một phần tử mới vào đỉnh Stack.
- Pop (lấy phần tử): Loại bỏ phần tử ở đỉnh Stack và trả về phần tử đó.

Lưu ý: Không thể `Pop` khi Stack đang rỗng. Trường hợp này thường được gọi là Stack Underflow, tức là cố lấy phần tử khi không có phần tử nào.

# 4. Ví dụ minh họa từng bước

Giả sử ban đầu Stack rỗng. Ta lần lượt thực hiện `Push(10)`, `Push(20)`, `Push(30)`, sau đó `Pop()`.

Quy ước: Phần tử bên phải là đỉnh Stack.

| Bước | Thao tác   | Stack sau thao tác | Kết quả   |
| ---- | ---------- | ------------------ | --------- |
| 1    | Ban đầu    | `[]`               | Rỗng      |
| 2    | `Push(10)` | `[10]`             | Thêm 10   |
| 3    | `Push(20)` | `[10, 20]`         | Thêm 20   |
| 4    | `Push(30)` | `[10, 20, 30]`     | Thêm 30   |
| 5    | `Pop()`    | `[10, 20]`         | Lấy ra 30 |
| 6    | `Pop()`    | `[10]`             | Lấy ra 20 |

Sau hai lần `Pop()`, phần tử 30 và 20 đã bị loại bỏ. Phần tử 10 vẫn còn trong Stack.

# 5. Ứng dụng thực tế

Chức năng Undo (hoàn tác) trong trình soạn thảo văn bản là một ví dụ ứng dụng Stack.

Giả sử mày thực hiện lần lượt:

- Nhập dòng chữ A.
- Nhập dòng chữ B.
- Nhập dòng chữ C.

Nếu nhấn `Ctrl + Z`, thao tác C thường được hoàn tác trước, tiếp theo là B rồi đến A. Điều này tương tự nguyên tắc LIFO: thao tác gần nhất được xử lý trước.

Các hệ thống thực tế có thể dùng thêm nhiều cơ chế quản lý lịch sử, nhưng Stack là một mô hình nền tảng để hiểu cách hoạt động này.

# 6. Tổng kết

- Stack là cấu trúc dữ liệu hoạt động tại một đầu gọi là đỉnh.
- LIFO nghĩa là vào sau, ra trước.
- Push thêm phần tử lên đỉnh Stack.
- Pop lấy và loại bỏ phần tử ở đỉnh Stack.
- Stack được ứng dụng trong chức năng Undo, quản lý lời gọi hàm và nhiều bài toán xử lý dữ liệu.

# 7. Câu hỏi tự kiểm tra

Câu 1: Nguyên tắc LIFO có nghĩa là gì?

A. Vào trước, ra trước. B. Vào sau, ra trước. C. Các phần tử được lấy ngẫu nhiên.

Câu 2: Stack đang chứa `[5, 10, 15]`, trong đó 15 nằm trên đỉnh. Sau một lần `Pop()`, Stack còn gì?

A. `[10, 15]` B. `[5, 10]` C. `[5, 15]`

Câu 3: Stack đang rỗng mà thực hiện `Pop()` thì điều gì xảy ra?

A. Lấy được phần tử 0. B. Phần tử mới tự động được thêm vào. C. Thao tác không hợp lệ vì Stack không có phần tử để lấy.

Đáp án: Câu 1: B · Câu 2: B · Câu 3: C
