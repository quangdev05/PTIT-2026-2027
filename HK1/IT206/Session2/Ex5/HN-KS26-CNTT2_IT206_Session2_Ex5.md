# Bài 5: In-Context Learning trong phân loại review

## 1. Cơ chế In-Context Learning

In-Context Learning (ICL) là khả năng mô hình suy ra cách làm nhiệm vụ từ chỉ dẫn và ví dụ được đặt ngay trong ngữ cảnh prompt. Các ví dụ cho biết dạng đầu vào, nhãn cần trả về và quy luật cần áp dụng. Khi dự đoán phần tiếp theo, mô hình điều kiện hóa trên toàn bộ chuỗi token hiện có, nên có thể khái quát mẫu đã thấy sang review mới.

ICL không cập nhật trọng số, không huấn luyện lại mô hình và không đảm bảo ghi nhớ sau khi ngữ cảnh kết thúc. Nếu bỏ các ví dụ khỏi prompt, cách phân loại có thể khác. Trong tình huống TechShop, zero-shot dễ bám vào các từ “đẹp mê ly”, “đầm tay” và bỏ qua dữ kiện CPU đạt 98°C. Few-shot dạy mô hình xét toàn câu, đối chiếu lời khen với hậu quả và nhận diện câu nói ngược. Đây là cách hướng dẫn trong ngữ cảnh, không loại bỏ hoàn toàn khả năng phân loại sai.

## 2. Prompt Few-shot

```text
Bạn là bộ phân loại cảm xúc review của TechShop. Đọc toàn bộ review, xác định thái độ thực sự của khách. Không phân loại theo một từ khóa riêng lẻ. Xét mệnh đề chỉ hậu quả, đối chiếu lời khen với trải nghiệm thực tế và nhận diện mỉa mai/nói ngược. Nếu câu vừa khen vừa nêu lỗi nghiêm trọng, gán TIÊU_CỰC. Chỉ dùng nhãn TÍCH_CỰC, TIÊU_CỰC hoặc KHÔNG_RÕ.

Ví dụ 1
Input: "Máy đẹp mê ly, cầm đầm tay, CPU 98°C khi chơi game, đúng là mùa đông khỏi cần lò sưởi!"
Output: {"sentiment":"TIÊU_CỰC","reason":"Lời khen bị đảo nghĩa bởi câu mỉa mai; CPU 98°C cho thấy máy quá nóng."}

Ví dụ 2
Input: "Pin trâu thật, vừa rút sạc 30 phút đã phải cắm lại, đúng là tự do khỏi ổ điện!"
Output: {"sentiment":"TIÊU_CỰC","reason":"Các từ khen là mỉa mai; thời lượng sử dụng thực tế chỉ khoảng 30 phút."}

Ví dụ 3
Input: "Giao hàng siêu tốc: đặt từ thứ Hai, đến tận thứ Sáu mới tới. Nhanh đến mức tôi quên mất mình đã đặt!"
Output: {"sentiment":"TIÊU_CỰC","reason":"Lời khen tốc độ trái ngược với việc giao sau bốn ngày; câu mang ý chê châm biếm."}

Quy tắc:
- Xét toàn bộ câu, không đếm từ tích cực/tiêu cực.
- Ưu tiên sự kiện cụ thể và hậu quả được nêu; phân biệt lời khen thật với khen đểu.
- Nếu không đủ căn cứ, dùng KHÔNG_RÕ và nêu dữ kiện còn thiếu.
- Chỉ xuất JSON hợp lệ, không Markdown:
{"sentiment":"TÍCH_CỰC|TIÊU_CỰC|KHÔNG_RÕ","reason":"..."}

Review cần phân loại:
<review>
{{REVIEW}}
</review>
```

### Kết quả review trong đề

**Nhãn: TIÊU_CỰC.** CPU 98°C khi chơi game là dấu hiệu quá nóng. “Khỏi cần bật lò sưởi” là câu mỉa mai; lời khen về thiết kế không làm thay đổi cảm xúc tiêu cực về hiệu năng nhiệt.
