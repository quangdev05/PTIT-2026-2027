# Bài thực hành 5: Phân loại phản hồi của khách hàng

## 1. Mục tiêu

So sánh Zero-shot và Few-shot Prompting để phân loại phản hồi khách hàng theo ba nhãn: **Tích cực**, **Tiêu cực**, **Yêu cầu hỗ trợ**. Đầu ra cần có bảng gồm số thứ tự, phản hồi, nhãn và lý do.

## 2. Quy ước phân loại

Để tránh nhầm giữa phàn nàn và yêu cầu hỗ trợ, áp dụng thứ tự ưu tiên sau:

1. **Yêu cầu hỗ trợ**: phản hồi nêu vấn đề cụ thể chưa được giải quyết hoặc yêu cầu hành động như kiểm tra, sửa chữa, đổi hàng, hoàn tiền, giao hàng.
2. **Tiêu cực**: có phàn nàn/không hài lòng nhưng không yêu cầu hay hàm ý cần xử lý một vấn đề cụ thể.
3. **Tích cực**: chủ yếu khen ngợi hoặc thể hiện hài lòng và không nêu vấn đề cần giải quyết.

Mỗi phản hồi nhận đúng một nhãn. Không suy diễn nguyên nhân hoặc thông tin ngoài câu chữ.

## 3. Prompt 1 — Zero-shot

```text
Bạn là nhân viên phân loại phản hồi khách hàng cho một cửa hàng bán đồ công nghệ. Với từng phản hồi, hãy chọn đúng một nhãn:
- "Tích cực": khách hàng hài lòng hoặc khen ngợi, không nêu vấn đề cần xử lý.
- "Tiêu cực": khách hàng phàn nàn hoặc không hài lòng nhưng không nêu yêu cầu xử lý cụ thể.
- "Yêu cầu hỗ trợ": phản hồi nêu vấn đề cụ thể chưa được giải quyết hoặc yêu cầu/hàm ý cần cửa hàng thực hiện hành động như kiểm tra, sửa chữa, giao hàng, đổi hàng hay hoàn tiền.

Nếu phản hồi vừa tiêu cực vừa nêu vấn đề cần xử lý, ưu tiên nhãn "Yêu cầu hỗ trợ". Chỉ dùng thông tin có trong phản hồi. Trả kết quả thành bảng Markdown với các cột: STT | Phản hồi | Nhãn phân loại | Lý do. Sau bảng, viết phần so sánh ngắn gọn về kết quả Zero-shot và Few-shot. Không bỏ phản hồi nào.

Danh sách phản hồi:
1. "Sản phẩm đẹp, giao hàng nhanh, rất hài lòng."
2. "Tôi đã đặt hàng 5 ngày nhưng chưa nhận được."
3. "Tai nghe không kết nối được Bluetooth."
4. "Nhân viên tư vấn rất nhiệt tình."
5. "Tôi muốn hoàn tiền vì sản phẩm bị lỗi."
```

## 4. Prompt 2 — Few-shot

```text
Bạn là nhân viên phân loại phản hồi khách hàng cho một cửa hàng bán đồ công nghệ. Với mỗi phản hồi, chọn đúng một nhãn trong ba nhãn: "Tích cực", "Tiêu cực", "Yêu cầu hỗ trợ".

Quy tắc:
- "Tích cực": hài lòng/khen ngợi và không có vấn đề cần xử lý.
- "Tiêu cực": không hài lòng nhưng không nêu yêu cầu hoặc vấn đề cụ thể cần cửa hàng xử lý.
- "Yêu cầu hỗ trợ": có vấn đề cụ thể chưa giải quyết hoặc yêu cầu/hàm ý hành động như kiểm tra, sửa, giao, đổi, hoàn tiền.
- Nếu vừa phàn nàn vừa có vấn đề cần giải quyết, ưu tiên "Yêu cầu hỗ trợ".
- Chỉ dựa trên thông tin được cung cấp; không bỏ bản ghi.

Ví dụ 1:
Phản hồi: "Máy dùng ổn định, nhân viên hướng dẫn tận tình, tôi rất hài lòng."
Nhãn: Tích cực
Lý do: Khen sản phẩm và nhân viên, không nêu vấn đề cần xử lý.

Ví dụ 2:
Phản hồi: "Chất lượng sản phẩm thật đáng thất vọng, trải nghiệm không tốt."
Nhãn: Tiêu cực
Lý do: Thể hiện không hài lòng nhưng không yêu cầu hành động cụ thể.

Ví dụ 3:
Phản hồi: "Đơn hàng báo đã giao nhưng tôi chưa nhận được, nhờ cửa hàng kiểm tra giúp."
Nhãn: Yêu cầu hỗ trợ
Lý do: Có sự cố giao hàng và yêu cầu cửa hàng kiểm tra.

Phân loại danh sách sau thành bảng Markdown có các cột: STT | Phản hồi | Nhãn phân loại | Lý do. Sau bảng, viết phần so sánh ngắn gọn về kết quả Zero-shot và Few-shot.

1. "Sản phẩm đẹp, giao hàng nhanh, rất hài lòng."
2. "Tôi đã đặt hàng 5 ngày nhưng chưa nhận được."
3. "Tai nghe không kết nối được Bluetooth."
4. "Nhân viên tư vấn rất nhiệt tình."
5. "Tôi muốn hoàn tiền vì sản phẩm bị lỗi."
```

## 5. Kết quả phân loại

Cả hai prompt được áp dụng cùng quy ước nhãn ở trên. Với tập phản hồi cụ thể này, kết quả nhất quán như sau:

| STT | Phản hồi | Nhãn phân loại | Lý do |
|---:|---|---|---|
| 1 | Sản phẩm đẹp, giao hàng nhanh, rất hài lòng. | Tích cực | Khen sản phẩm và tốc độ giao hàng, đồng thời nói rõ là hài lòng. |
| 2 | Tôi đã đặt hàng 5 ngày nhưng chưa nhận được. | Yêu cầu hỗ trợ | Có vấn đề giao hàng chưa được giải quyết, cần kiểm tra hoặc giao đơn. |
| 3 | Tai nghe không kết nối được Bluetooth. | Yêu cầu hỗ trợ | Nêu lỗi kỹ thuật cụ thể của sản phẩm cần được khắc phục. |
| 4 | Nhân viên tư vấn rất nhiệt tình. | Tích cực | Khen chất lượng tư vấn, không nêu vấn đề cần xử lý. |
| 5 | Tôi muốn hoàn tiền vì sản phẩm bị lỗi. | Yêu cầu hỗ trợ | Khách hàng yêu cầu hoàn tiền để giải quyết sản phẩm bị lỗi. |

## 6. So sánh Zero-shot và Few-shot

- **Độ chính xác trên bộ dữ liệu này:** Hai prompt cho cùng kết quả cả 5/5 phản hồi khi sử dụng cùng định nghĩa nhãn và thứ tự ưu tiên.
- **Tính nhất quán:** Zero-shot ngắn gọn và có thể hoạt động tốt với hướng dẫn rõ. Tuy vậy, nhãn “Tiêu cực” và “Yêu cầu hỗ trợ” dễ bị nhầm ở các trường hợp phàn nàn về đơn hàng hoặc lỗi sản phẩm.
- **Ưu điểm Few-shot:** Ba ví dụ chỉ ra ranh giới giữa khen ngợi, phàn nàn chung và sự cố cần xử lý, nên cách gán nhãn có căn cứ và lặp lại ổn định hơn.
- **Kết luận:** Với dữ liệu thực tế có nhiều cách diễn đạt, chọn Few-shot làm prompt vận hành; duy trì quy tắc ưu tiên “Yêu cầu hỗ trợ” khi có vấn đề cụ thể cần giải quyết.
