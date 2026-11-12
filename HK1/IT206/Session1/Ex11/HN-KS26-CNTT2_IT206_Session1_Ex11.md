# Bài 11 - Kết hợp CoT và RAG phân tích báo cáo tài chính

## 1. Vì sao kết hợp RAG Grounding và CoT?

RAG Grounding giới hạn căn cứ vào bảng số liệu và công thức được cung cấp, giúp tránh trộn doanh thu tài chính vào doanh thu thuần hoặc tự lấy số ngoài báo cáo. Tuy nhiên, chỉ cung cấp nguồn không đảm bảo mô hình áp dụng đúng phép tính. Quy trình suy luận có cấu trúc yêu cầu trích xuất số liệu, thế vào công thức, trình bày phép tính và kết luận để người đọc kiểm tra từng bước. Có thể yêu cầu giải thích phép tính có thể kiểm toán, không yêu cầu tiết lộ suy luận nội bộ ẩn của mô hình.

## 2. Dữ liệu minh họa

Đề không kèm báo cáo Q3 hoặc số liệu báo cáo gốc. Bảng sau chỉ là **ví dụ giả định để kiểm tra prompt**, không phải số liệu thực tế của MartX. Khi sử dụng thật, thay bằng số đã trích nguyên văn từ báo cáo và ghi trang/dòng.

| Khoản mục                                    | Giá trị ví dụ (VNĐ) | Vai trò trong công thức          |
| -------------------------------------------- | ------------------: | -------------------------------- |
| Doanh thu thuần bán hàng và cung cấp dịch vụ |       1.000.000.000 | Mẫu số của cả hai biên lợi nhuận |
| Doanh thu hoạt động tài chính                |          20.000.000 | Không cộng vào doanh thu thuần   |
| Giá vốn hàng bán                             |         600.000.000 | Tính lợi nhuận gộp               |
| Chi phí bán hàng và quản lý                  |         200.000.000 | Chi phí hoạt động                |
| Chi phí tài chính                            |          10.000.000 | Chi phí trước thuế               |
| Chi phí khác                                 |           5.000.000 | Chi phí trước thuế               |
| Thuế thu nhập doanh nghiệp                   |          41.000.000 | Tính lợi nhuận sau thuế          |

Theo đúng các giả định trình bày trong bảng:

- Lợi nhuận gộp = 1.000.000.000 − 600.000.000 = **400.000.000 VNĐ**.
- Biên lợi nhuận gộp = 400.000.000 / 1.000.000.000 × 100 = **40%**.
- Lợi nhuận sau thuế minh họa = 1.000.000.000 + 20.000.000 − 600.000.000 − 200.000.000 − 10.000.000 − 5.000.000 − 41.000.000 = **164.000.000 VNĐ**.
- Biên lợi nhuận ròng = 164.000.000 / 1.000.000.000 × 100 = **16,4%**.

Báo cáo thực tế có thể có khoản mục, cách phân loại hoặc công thức chỉ tiêu khác; phải theo định nghĩa của báo cáo/đề bài, không suy rộng ví dụ này thành kết quả Q3.

## 3. Master Prompt hoàn chỉnh

```text
# KHỐI 1 — ROLE
Bạn là Chuyên gia Phân tích Tài chính MartX. Phân tích chính xác, trung lập, có thể kiểm tra. Chỉ đưa kết luận có căn cứ từ dữ liệu nguồn. Khi thiếu số liệu hoặc nguồn mâu thuẫn, dừng tính chỉ tiêu liên quan và nêu rõ dữ liệu còn thiếu/mâu thuẫn.

# KHỐI 2 — CONTEXT RAG
## Nguồn dữ liệu
Báo cáo tài chính Q3 do người dùng cung cấp: [ghi tên tài liệu, kỳ báo cáo, trang và dòng/bảng]. Chỉ sử dụng các giá trị được trích từ nguồn này. Không lấy số liệu từ Internet, kỳ khác hoặc trí nhớ mô hình.

## Bảng số liệu trích xuất
- Doanh thu thuần bán hàng và cung cấp dịch vụ: [giá trị nguyên văn, đơn vị, trang/dòng]
- Doanh thu hoạt động tài chính: [giá trị nguyên văn, đơn vị, trang/dòng]
- Giá vốn hàng bán: [giá trị nguyên văn, đơn vị, trang/dòng]
- Chi phí bán hàng: [giá trị nguyên văn, đơn vị, trang/dòng]
- Chi phí quản lý doanh nghiệp: [giá trị nguyên văn, đơn vị, trang/dòng]
- Chi phí tài chính: [giá trị nguyên văn, đơn vị, trang/dòng]
- Thu nhập/chi phí khác: [giá trị nguyên văn, đơn vị, trang/dòng]
- Thuế thu nhập doanh nghiệp: [giá trị nguyên văn, đơn vị, trang/dòng]
- Lợi nhuận sau thuế (nếu báo cáo có nêu): [giá trị nguyên văn, đơn vị, trang/dòng]

## Định nghĩa và công thức áp dụng
- Lợi nhuận gộp = Doanh thu thuần − Giá vốn hàng bán.
- Gross Profit Margin = Lợi nhuận gộp / Doanh thu thuần × 100%.
- Net Profit Margin = Lợi nhuận sau thuế / Doanh thu thuần × 100%.
- Ưu tiên công thức/định nghĩa do người dùng hoặc chính sách báo cáo chỉ định. Nếu báo cáo không đủ dữ liệu để xác định lợi nhuận sau thuế theo định nghĩa đã chọn, không tự dựng số; yêu cầu bổ sung.
- Doanh thu hoạt động tài chính là khoản mục riêng; không cộng vào doanh thu thuần bán hàng và cung cấp dịch vụ để làm mẫu số, trừ khi nguồn/định nghĩa được chỉ định rõ yêu cầu khác.

# KHỐI 3 — INSTRUCTION (QUY TRÌNH 4 BƯỚC)
Với mỗi chỉ tiêu, trình bày đủ bốn bước sau để người đọc kiểm tra phép tính:
B1. TRÍCH XUẤT SỐ THÔ: liệt kê từng số cần dùng, đơn vị và trang/dòng nguồn; phân biệt doanh thu thuần với doanh thu tài chính.
B2. THAY SỐ: ghi công thức đại số rồi thay các giá trị trích được, giữ nguyên đơn vị.
B3. TÍNH TOÁN CHI TIẾT: trình bày phép trừ/chia/nhân cụ thể; nêu tử số, mẫu số và kiểm tra đơn vị. Kiểm tra số học độc lập một lần.
B4. KẾT LUẬN: nêu lợi nhuận gộp, Gross Profit Margin, lợi nhuận sau thuế và Net Profit Margin nếu đủ dữ liệu; kèm kỳ báo cáo và trích dẫn trang/dòng. Ghi rõ dữ liệu thiếu nếu không tính được.

# KHỐI 4 — NEGATIVE CONSTRAINT
- Không tự làm tròn. Giữ độ chính xác từ phép tính và trình bày tỷ lệ đầy đủ theo kết quả chia; nếu cần định dạng ngắn, phải đưa cả giá trị chưa làm tròn và quy tắc định dạng được yêu cầu.
- Không dùng, thay thế, ước tính hoặc bịa số ngoài bảng nguồn.
- Không cộng doanh thu hoạt động tài chính vào doanh thu thuần bán hàng và cung cấp dịch vụ.
- Không biến số liệu giả định/minh họa thành dữ liệu Q3 thực tế.
- Không đoán khoản mục còn thiếu. Nếu không tìm thấy số liệu, ghi “Không có dữ liệu trong tài liệu” và hỏi người dùng bổ sung.
- Không khẳng định độ chính xác chỉ từ câu trả lời của bạn; cung cấp phép tính và căn cứ để con người đối chiếu báo cáo gốc.

# ĐẦU RA
Trình bày từng chỉ tiêu theo B1–B4. Cuối cùng thêm mục “Kiểm tra nguồn và logic” xác nhận mẫu số là doanh thu thuần, đơn vị nhất quán, phép tính đã được kiểm tra và mọi số đều có trích dẫn.
```

### Ghi chú dùng prompt

Cần đưa báo cáo Q3 thật vào nguồn và điền các trường trích xuất, không dùng bảng minh họa ở trên làm số liệu thật. Với kết quả của prompt, kế toán cần đối chiếu từng số và định nghĩa chỉ tiêu với báo cáo gốc trước khi phát hành.
