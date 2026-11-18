# [Bài thực hành 1] Lập kế hoạch tài chính cá nhân bằng Chain-of-Thought

---

## 1. PROMPT HOÀN CHỈNH

```text
# VAI TRÒ
Bạn là chuyên gia tư vấn tài chính cá nhân, làm việc cẩn thận, chính xác về số học và luôn trình bày minh bạch từng phép tính.

# BỐI CẢNH
Tôi có thu nhập biến động mỗi tháng và đang có một số khoản nợ. Tôi cần một kế hoạch ngân sách hàng tháng để tối ưu dòng tiền, trả nợ đúng hạn và tiết kiệm tối thiểu 20%.

# DỮ LIỆU ĐẦU VÀO (chỉ sử dụng dữ liệu này, không tự thêm số liệu)
- Thu nhập 3 tháng gần nhất (VNĐ): Tháng 1 = [A1]; Tháng 2 = [A2]; Tháng 3 = [A3]
- Thuế/bảo hiểm bị khấu trừ hàng tháng: [T]
- Chi phí cố định bắt buộc (liệt kê từng khoản): [khoản 1 = số tiền]; [khoản 2 = số tiền]; ...
- Các khoản nợ (tên - số tiền trả tối thiểu mỗi tháng - ngày đến hạn): [...]
- Mục tiêu tiết kiệm: tối thiểu 20% thu nhập sau thuế mỗi tháng

# NHIỆM VỤ
Lập kế hoạch tài chính cho 1 tháng.

# CHỈ THỊ SUY LUẬN
Hãy suy nghĩ từng bước một và tính toán chi tiết trước khi đưa ra quyết định.
Thực hiện đúng 4 bước sau, theo thứ tự, không bỏ bước, không gộp bước:

Bước 1 - Tổng thu nhập khả dụng:
  1a. Thu nhập cơ sở = giá trị NHỎ NHẤT trong 3 tháng (nêu rõ so sánh 3 số).
  1b. Thu nhập sau thuế = thu nhập cơ sở − thuế/bảo hiểm.
  1c. Khả dụng sau chi phí cố định = thu nhập sau thuế − tổng chi phí cố định (cộng từng khoản trước).
Bước 2 - Trả nợ tối thiểu: cộng các khoản nợ tối thiểu, trừ khỏi số dư ở 1c. Nếu số dư < 0, DỪNG và báo "không khả thi" kèm số tiền thiếu.
Bước 3 - Trích tiết kiệm: tiết kiệm = 20% × thu nhập SAU THUẾ (ở 1b). Trừ khỏi số dư sau Bước 2. Nếu số dư < 0, DỪNG và báo thiếu bao nhiêu.
Bước 4 - Chia phần còn lại theo quy tắc 50/30/20 cải tiến:
  - 50% → chi tiêu thiết yếu linh hoạt (ăn uống, đi lại phát sinh, y tế…)
  - 30% → chi tiêu mong muốn (giải trí, mua sắm…)
  - 20% → quỹ dự phòng / trả nợ thêm

# QUY TẮC TÍNH TOÁN (BẮT BUỘC)
- Hiển thị ĐẦY ĐỦ mọi phép cộng, trừ, nhân, chia trung gian dạng "a ± b = kết quả". Không nhảy cóc ra kết quả.
- Số tiền làm tròn đến đồng; tỷ lệ % làm tròn 2 chữ số thập phân.
- Sau Bước 4, tự kiểm tra: (a) tổng tất cả hạng mục = thu nhập cơ sở; (b) tổng tỷ lệ % = 100,00%. Nếu lệch, tính lại và sửa trước khi xuất kết quả.
- Không dùng code, không dùng Python/Pydantic; chỉ suy luận bằng văn bản.
- Không bịa thêm khoản chi hoặc số liệu ngoài dữ liệu đầu vào.

# ĐỊNH DẠNG ĐẦU RA
## PHẦN 1: NHẬT KÝ SUY LUẬN LOGIC (Reasoning Steps)
Trình bày Bước 1 → Bước 4, mỗi bước ghi: công thức, phép tính chi tiết, số liệu trung gian.
## PHẦN 2: BẢNG PHÂN BỔ NGÂN SÁCH CUỐI CÙNG
Bảng Markdown đúng 4 cột: | Hạng mục | Số tiền | Tỷ lệ % | Ghi chú |
(Tỷ lệ % = số tiền ÷ thu nhập cơ sở trước thuế). Dòng cuối: TỔNG CỘNG = thu nhập cơ sở, 100,00%.
## PHẦN 3: KIỂM TRA CUỐI
Ghi kết quả 2 phép kiểm tra (a) và (b).
```

---

## 2. DỮ LIỆU MẪU ĐỂ CHẠY THỬ

| Mục                       | Giá trị                                                                |
| ------------------------- | ---------------------------------------------------------------------- |
| Thu nhập 3 tháng gần nhất | T1 = 19.500.000; T2 = 18.000.000; T3 = 21.000.000                      |
| Thuế/bảo hiểm khấu trừ    | 1.800.000                                                              |
| Chi phí cố định           | Thuê nhà 4.000.000; Điện-nước-internet 800.000; Đi lại cố định 700.000 |
| Nợ                        | Thẻ tín dụng tối thiểu 500.000; Vay tiêu dùng 1.200.000                |
| Mục tiêu tiết kiệm        | ≥ 20% thu nhập sau thuế                                                |

---

## 3. KẾT QUẢ CHẠY MẪU (đã kiểm tra lại số học)

### PHẦN 1: NHẬT KÝ SUY LUẬN LOGIC

**Bước 1 - Tổng thu nhập khả dụng**

- 1a. So sánh 19.500.000; 18.000.000; 21.000.000 → nhỏ nhất = **18.000.000** (thu nhập cơ sở).
- 1b. Thu nhập sau thuế = 18.000.000 − 1.800.000 = **16.200.000**.
- 1c. Tổng chi phí cố định = 4.000.000 + 800.000 + 700.000 = **5.500.000**.
  Khả dụng = 16.200.000 − 5.500.000 = **10.700.000**.

**Bước 2 - Trả nợ tối thiểu**

- Tổng nợ tối thiểu = 500.000 + 1.200.000 = **1.700.000**.
- Số dư = 10.700.000 − 1.700.000 = **9.000.000** (≥ 0 → khả thi).

**Bước 3 - Trích tiết kiệm**

- Tiết kiệm = 20% × 16.200.000 = 16.200.000 × 0,2 = **3.240.000**.
- Số dư = 9.000.000 − 3.240.000 = **5.760.000** (≥ 0 → khả thi).

**Bước 4 - Chia 50/30/20 cải tiến trên 5.760.000**

- Thiết yếu linh hoạt: 5.760.000 × 50% = **2.880.000**
- Mong muốn: 5.760.000 × 30% = **1.728.000**
- Dự phòng / trả nợ thêm: 5.760.000 × 20% = **1.152.000**
- Kiểm tra: 2.880.000 + 1.728.000 + 1.152.000 = 5.760.000 ✔

### PHẦN 2: BẢNG PHÂN BỔ NGÂN SÁCH CUỐI CÙNG (thu nhập cơ sở 18.000.000 đ)

| Hạng mục                     |    Số tiền (đ) |     Tỷ lệ % | Ghi chú                                                      |
| ---------------------------- | -------------: | ----------: | ------------------------------------------------------------ |
| Thuế / bảo hiểm khấu trừ     |      1.800.000 |      10,00% | 1.800.000 ÷ 18.000.000                                       |
| Chi phí cố định bắt buộc     |      5.500.000 |      30,56% | Thuê nhà, điện-nước-internet, đi lại cố định                 |
| Trả nợ tối thiểu             |      1.700.000 |       9,44% | Thẻ tín dụng 500.000 + vay tiêu dùng 1.200.000; trả đúng hạn |
| Tiết kiệm cam kết            |      3.240.000 |      18,00% | = 20% thu nhập sau thuế (16.200.000)                         |
| Chi tiêu thiết yếu linh hoạt |      2.880.000 |      16,00% | 50% phần còn lại                                             |
| Chi tiêu mong muốn           |      1.728.000 |       9,60% | 30% phần còn lại                                             |
| Quỹ dự phòng / trả nợ thêm   |      1.152.000 |       6,40% | 20% phần còn lại                                             |
| **TỔNG CỘNG**                | **18.000.000** | **100,00%** | Khớp thu nhập cơ sở                                          |

### PHẦN 3: KIỂM TRA CUỐI

- (a) 1.800.000 + 5.500.000 + 1.700.000 + 3.240.000 + 2.880.000 + 1.728.000 + 1.152.000 = **18.000.000** ✔
- (b) 10,00 + 30,56 + 9,44 + 18,00 + 16,00 + 9,60 + 6,40 = **100,00%** ✔
- Tiết kiệm cam kết = 3.240.000 đúng bằng 20% thu nhập sau thuế → đạt mục tiêu tối thiểu.
