# Bài 3: Xử lý Sự cố Giao diện Website Doanh nghiệp

## 1. Báo cáo phân tích Box Model

Trong DevTools, chọn lần lượt khung **“Nội dung bài học”** và khung **“Danh sách video”**, mở **Computed** và ghi nhận bốn lớp của từng phần tử. Vì đề không cung cấp ảnh chụp hay giá trị CSS thực tế nên không thể khẳng định số đo hiện tại; sơ đồ dưới đây biểu diễn cách đọc đúng và vị trí cần đối chiếu trực tiếp trên trang:

```text
┌──────────────────────── Margin (ngoài, trong suốt) ────────────────────────┐
│  ┌────────────────────── Border (đường viền) ──────────────────────────┐  │
│  │  ┌────────────────── Padding (đệm bên trong) ────────────────────┐  │  │
│  │  │                     Content (nội dung)                         │  │  │
│  │  └────────────────────────────────────────────────────────────────┘  │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
└────────────────────────────────────────────────────────────────────────────┘
```

| Lớp | Ý nghĩa | Cần kiểm tra trong Computed |
| --- | --- | --- |
| Content | Vùng chứa chữ, video hoặc nội dung con | `width`, `height` |
| Padding | Khoảng đệm từ nội dung tới viền | `padding-top/right/bottom/left` |
| Border | Đường viền bao quanh padding và content | `border-width` và kiểu viền |
| Margin | Khoảng cách bên ngoài viền, tách phần tử khỏi phần tử khác | `margin-top/right/bottom/left` |

Hai khung chồng lấn có thể do chiều rộng/kích thước tổng thể vượt vùng cha, margin âm, phần tử `position: absolute`/`fixed`, hoặc nội dung không xuống dòng. Cần chọn từng khung bằng biểu tượng chọn phần tử trong DevTools, đối chiếu cả **Computed** lẫn **Styles**, rồi xem phần nào tạo ra kích thước và khoảng cách bất thường. Khi có giá trị thực tế, có thể ghi chúng vào bảng để xác định nguyên nhân thay vì đoán.

Nếu phần tử dùng `box-sizing: content-box` (mặc định), tổng chiều rộng hiển thị là `width + padding trái/phải + border trái/phải`; margin làm tăng khoảng cách ngoài. Nếu dùng `border-box`, width đã bao gồm content, padding và border. Margin dọc của các phần tử block đôi khi gộp (margin collapsing), nên không phải lúc nào hai margin cũng cộng trực tiếp.

## 2. Dự đoán khi chỉ thay Margin mà bỏ qua Padding

Tăng margin chỉ đẩy phần tử ra xa phần tử khác; nó không thu nhỏ vùng nội dung và cũng không sửa padding. Nếu kích thước thật đang lớn vì `width` cộng `padding` và `border`, đổi margin có thể đẩy khung lệch khỏi cột, tạo khoảng trắng quá lớn, làm trang tràn ngang hoặc vẫn chồng lấn khi định vị/chiều cao gây lỗi. Giảm margin quá mức còn có thể khiến các khung sát nhau hơn. Vì vậy cần xác định lớp gây sai số trước rồi mới chỉnh đúng thuộc tính.

## 3. Giải pháp thử trong DevTools

1. Mở F12 → **Elements**, chọn đúng hai phần tử; trong **Computed** ghi lại `width`, `height`, bốn padding, border và margin cùng `box-sizing`.
2. Trong **Styles**, tạm bỏ chọn các giá trị gây chồng lấn như `margin` âm, `position`/`top`/`left` không phù hợp, hoặc kích thước vượt vùng cha. Thử khôi phục luồng tự nhiên (`position: static` nếu phần tử không cần định vị) và đặt khoảng cách hợp lý.
3. Thử một quy tắc an toàn ở cấp phần tử/container, chẳng hạn `box-sizing: border-box; max-width: 100%;`, đồng thời bỏ margin âm và dùng `gap` trên container flex/grid hoặc margin dương nhỏ có chủ đích để tạo khoảng cách giữa hai khung. Chỉ đặt `overflow` nếu đã hiểu nội dung nào sẽ bị cắt.
4. Kiểm tra ở kích thước cửa sổ hiện tại và hẹp hơn; đảm bảo nội dung còn đọc được, không xuất hiện thanh cuộn ngang và hai khung không che nhau. Ghi lại thay đổi cần chuyển cho Dev.

Các chỉnh sửa trong Styles/Elements chỉ là thử nghiệm tạm trên trang đang mở; reload trang sẽ khôi phục CSS gốc. Không có ảnh và số đo thật trong đề nên các thuộc tính cụ thể cần xác nhận bằng Computed trước khi đề xuất giá trị cuối cùng.
