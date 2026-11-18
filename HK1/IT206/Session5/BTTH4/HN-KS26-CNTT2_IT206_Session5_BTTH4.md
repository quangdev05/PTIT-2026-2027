# [Bài thực hành 4] Phân tích kết quả học tập và đề xuất giải pháp cải thiện

---

## 1. PROMPT HOÀN CHỈNH

```text
# VAI TRÒ
Bạn là chuyên viên phân tích dữ liệu giáo dục, làm việc chính xác, chỉ dựa trên số liệu được cung cấp.

# DỮ LIỆU (nguồn duy nhất được phép sử dụng)
Điểm kiểm tra môn lập trình của 5 sinh viên trong 3 tuần (thang điểm 10):
| Sinh viên | Tuần 1 | Tuần 2 | Tuần 3 |
| An   | 8 | 7 | 5 |
| Bình | 7 | 6 | 4 |
| Chi  | 9 | 8 | 8 |
| Dũng | 6 | 5 | 3 |
| Hà   | 8 | 8 | 7 |

# TIÊU CHÍ "CÓ DẤU HIỆU SA SÚT" (do giảng viên quy định – áp dụng đúng, không tự đổi)
Sinh viên bị xếp vào nhóm "có dấu hiệu sa sút" khi đồng thời: (i) điểm giảm ở CẢ HAI lần chuyển tuần (T1→T2 và T2→T3); và (ii) tổng mức giảm T1→T3 ≥ 3 điểm.

# CHỈ THỊ SUY LUẬN (Chain-of-Thought)
Hãy suy nghĩ từng bước một. Thực hiện đúng trình tự: TÍNH TOÁN → SO SÁNH → NHẬN ĐỊNH → ĐỀ XUẤT.

Bước 1 – TÍNH TOÁN (hiển thị từng phép tính "a − b = kết quả"):
  - Mức tăng/giảm T1→T2, T2→T3, và tổng T1→T3 của từng sinh viên.
  - % thay đổi T1→T3 = (T3 − T1) ÷ T1 × 100.
  - Điểm trung bình 3 tuần của từng sinh viên; điểm trung bình cả lớp mỗi tuần.
Bước 2 – SO SÁNH: xếp hạng 5 sinh viên theo điểm mỗi tuần; so sánh điểm từng người với trung bình lớp; so sánh mức giảm giữa các sinh viên; so sánh khoảng cách điểm cao nhất – thấp nhất mỗi tuần.
Bước 3 – NHẬN ĐỊNH: áp dụng tiêu chí để xác định nhóm có dấu hiệu sa sút (nêu rõ từng sinh viên thoả/không thoả (i), (ii)); rút ra 3 nhận định quan trọng.
Bước 4 – ĐỀ XUẤT: đưa ra 3 giải pháp hỗ trợ học tập cụ thể, gắn từng giải pháp với nhận định/số liệu tương ứng.

# RÀNG BUỘC (BẮT BUỘC)
- Chỉ dùng dữ liệu trên; không thêm thông tin về sinh viên, nội dung bài kiểm tra, độ khó, chuyên cần…
- KHÔNG suy diễn nguyên nhân khiến điểm giảm. Nếu cần nhắc đến nguyên nhân, chỉ ghi "chưa xác định – cần giảng viên xác minh".
- Mỗi nhận định phải kèm số liệu chứng minh (số liệu cụ thể trong ngoặc).
- Tự kiểm tra lại các phép tính trước khi xuất kết quả.

# ĐỊNH DẠNG ĐẦU RA
1. Bảng phân tích kết quả 5 sinh viên (cột: Sinh viên | T1 | T2 | T3 | Δ T1→T2 | Δ T2→T3 | Δ T1→T3 | % thay đổi | TB 3 tuần | Kết luận theo tiêu chí).
2. Nhóm sinh viên có dấu hiệu sa sút (kèm căn cứ).
3. So sánh giữa các sinh viên (ngắn gọn, có số liệu).
4. Ba nhận định quan trọng từ dữ liệu.
5. Những vấn đề cần giảng viên xác minh thêm.
6. Ba giải pháp hỗ trợ học tập cụ thể.
```

---

## 2. KẾT QUẢ CHẠY MẪU (đã kiểm tra lại số học)

### Bước 1 – Tính toán

| Sinh viên | Tính Δ T1→T2 | Tính Δ T2→T3 | Tính Δ T1→T3 | % thay đổi T1→T3       | TB 3 tuần          |
| --------- | ------------ | ------------ | ------------ | ---------------------- | ------------------ |
| An        | 7 − 8 = −1   | 5 − 7 = −2   | 5 − 8 = −3   | −3 ÷ 8 × 100 = −37,5%  | (8+7+5) ÷ 3 = 6,67 |
| Bình      | 6 − 7 = −1   | 4 − 6 = −2   | 4 − 7 = −3   | −3 ÷ 7 × 100 = −42,86% | (7+6+4) ÷ 3 = 5,67 |
| Chi       | 8 − 9 = −1   | 8 − 8 = 0    | 8 − 9 = −1   | −1 ÷ 9 × 100 = −11,11% | (9+8+8) ÷ 3 = 8,33 |
| Dũng      | 5 − 6 = −1   | 3 − 5 = −2   | 3 − 6 = −3   | −3 ÷ 6 × 100 = −50,00% | (6+5+3) ÷ 3 = 4,67 |
| Hà        | 8 − 8 = 0    | 7 − 8 = −1   | 7 − 8 = −1   | −1 ÷ 8 × 100 = −12,50% | (8+8+7) ÷ 3 = 7,67 |

**Điểm trung bình cả lớp:**

- Tuần 1: (8+7+9+6+8) ÷ 5 = 38 ÷ 5 = **7,6**
- Tuần 2: (7+6+8+5+8) ÷ 5 = 34 ÷ 5 = **6,8**
- Tuần 3: (5+4+8+3+7) ÷ 5 = 27 ÷ 5 = **5,4**
- Thay đổi TB lớp: 6,8 − 7,6 = −0,8; 5,4 − 6,8 = −1,4; tổng 5,4 − 7,6 = **−2,2**.

### Bước 2 – So sánh

- **Xếp hạng Tuần 1:** Chi 9 > An = Hà 8 > Bình 7 > Dũng 6.
- **Xếp hạng Tuần 2:** Chi = Hà 8 > An 7 > Bình 6 > Dũng 5.
- **Xếp hạng Tuần 3:** Chi 8 > Hà 7 > An 5 > Bình 4 > Dũng 3.
- **So với TB lớp tuần 3 (5,4):** Chi (8) và Hà (7) trên trung bình; An (5), Bình (4), Dũng (3) dưới trung bình. Ở tuần 1, An (8) còn bằng Hà và cao hơn TB lớp (7,6).
- **Khoảng cách cao nhất – thấp nhất:** Tuần 1: 9 − 6 = 3; Tuần 2: 8 − 5 = 3; Tuần 3: 8 − 3 = 5 (khoảng cách tăng).
- **Mức giảm:** An, Bình, Dũng cùng giảm 3 điểm (T1→T3), Chi và Hà cùng giảm 1 điểm. Về tỷ lệ, Dũng giảm nhiều nhất (−50%), sau đó Bình (−42,86%), An (−37,5%).

### Bước 3 – Nhận định

**Áp dụng tiêu chí "có dấu hiệu sa sút":**

| Sinh viên | (i) Giảm cả 2 lần? | (ii) Tổng giảm ≥ 3? | Kết luận               |
| --------- | ------------------ | ------------------- | ---------------------- |
| An        | Có (−1, −2)        | Có (−3)             | **Có dấu hiệu sa sút** |
| Bình      | Có (−1, −2)        | Có (−3)             | **Có dấu hiệu sa sút** |
| Chi       | Không (−1, 0)      | Không (−1)          | Không                  |
| Dũng      | Có (−1, −2)        | Có (−3)             | **Có dấu hiệu sa sút** |
| Hà        | Không (0, −1)      | Không (−1)          | Không                  |

### Bảng phân tích kết quả 5 sinh viên (tổng hợp)

| Sinh viên  |  T1 |  T2 |  T3 | Δ T1→T2 | Δ T2→T3 | Δ T1→T3 | % thay đổi | TB 3 tuần | Kết luận           |
| ---------- | --: | --: | --: | ------: | ------: | ------: | ---------: | --------: | ------------------ |
| An         |   8 |   7 |   5 |      −1 |      −2 |      −3 |    −37,50% |      6,67 | Có dấu hiệu sa sút |
| Bình       |   7 |   6 |   4 |      −1 |      −2 |      −3 |    −42,86% |      5,67 | Có dấu hiệu sa sút |
| Chi        |   9 |   8 |   8 |      −1 |       0 |      −1 |    −11,11% |      8,33 | Không              |
| Dũng       |   6 |   5 |   3 |      −1 |      −2 |      −3 |    −50,00% |      4,67 | Có dấu hiệu sa sút |
| Hà         |   8 |   8 |   7 |       0 |      −1 |      −1 |    −12,50% |      7,67 | Không              |
| **TB lớp** | 7,6 | 6,8 | 5,4 |    −0,8 |    −1,4 |    −2,2 |            |           |                    |

### Nhóm có dấu hiệu sa sút: **An, Bình, Dũng**

Căn cứ: cả ba đều giảm điểm ở hai lần chuyển tuần liên tiếp và tổng giảm đúng 3 điểm; điểm tuần 3 của cả ba đều thấp hơn trung bình lớp (5,4).

### Ba nhận định quan trọng

1. **Điểm trung bình lớp giảm liên tục và tốc độ giảm tăng:** 7,6 → 6,8 → 5,4; mức giảm tuần 2→3 (−1,4) lớn hơn tuần 1→2 (−0,8).
2. **Ba sinh viên An, Bình, Dũng giảm "tăng tốc":** mỗi người giảm 1 điểm (T1→T2) rồi 2 điểm (T2→T3). Dũng thấp nhất cả 3 tuần (6, 5, 3) và có tỷ lệ giảm lớn nhất (−50%).
3. **Chênh lệch giữa nhóm giảm và nhóm ổn định đang nới rộng:** Chi (9, 8, 8) và Hà (8, 8, 7) chỉ giảm 1 điểm; khoảng cách cao nhất – thấp nhất tăng từ 3 điểm (tuần 1, 2) lên 5 điểm (tuần 3).

### Vấn đề cần giảng viên xác minh thêm _(không suy diễn nguyên nhân)_

- Ba bài kiểm tra có cùng thang điểm, dạng bài và mức độ khó/nội dung không?
- Điểm tuần 3 của An, Bình, Dũng thấp ở phần/nội dung nào của bài kiểm tra?
- Có dữ liệu về chuyên cần, nộp bài tập, hay hoạt động trên lớp của 3 sinh viên này không?
- Mức giảm của Chi và Hà có thuộc dao động bình thường theo kinh nghiệm của giảng viên không?
- Cần dữ liệu thêm từ tuần 4 trở đi để biết xu hướng giảm có tiếp tục hay không (hiện chỉ có 3 điểm dữ liệu/sinh viên).

### Bước 4 – Ba giải pháp hỗ trợ học tập cụ thể

1. **Buổi ôn tập nhóm nhỏ cho An, Bình, Dũng** (căn cứ: nhận định 2): giảng viên chữa lại bài kiểm tra tuần 3, rà theo từng câu để xác định nội dung điểm thấp; giao bài luyện tập ngắn đúng các nội dung đó.
2. **Gặp trao đổi 1:1 với từng sinh viên trong nhóm** (căn cứ: mục cần xác minh): thu thập thông tin trực tiếp từ sinh viên về khó khăn họ gặp, trước khi đưa ra kết luận về nguyên nhân.
3. **Theo dõi sát bằng bài kiểm tra ngắn hằng tuần + ghép cặp hỗ trợ** (căn cứ: nhận định 1, 3): kiểm tra ngắn (5–10 phút) vào tuần 4 để theo dõi xu hướng; mời sinh viên có kết quả ổn định (như Chi, Hà) hỗ trợ trao đổi bài theo tinh thần tự nguyện, và đặt mốc đánh giá lại sau 2 tuần.
