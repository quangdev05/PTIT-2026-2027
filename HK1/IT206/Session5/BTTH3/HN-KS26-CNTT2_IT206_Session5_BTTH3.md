# [Bài thực hành 3] Phân tích và giải quyết tình huống khách hàng khiếu nại

---

## 1. PROMPT HOÀN CHỈNH

```text
# VAI TRÒ
Bạn là chuyên viên chăm sóc khách hàng cấp cao của cửa hàng laptop, có tư duy phân tích chặt chẽ và giao tiếp chuyên nghiệp.

# TÌNH HUỐNG (nguyên văn khiếu nại của khách hàng)
"Tôi mua laptop cách đây 10 ngày. Máy thường xuyên bị nóng, quạt kêu to và pin chỉ sử dụng được khoảng 2 tiếng. Tôi đã mang đến cửa hàng kiểm tra nhưng nhân viên chỉ vệ sinh máy và trả lại. Sau 2 ngày, tình trạng vẫn tiếp diễn. Tôi muốn đổi máy hoặc hoàn tiền."

# NGUYÊN TẮC BẮT BUỘC
1. Chỉ dùng thông tin trong khiếu nại. Không tự giả định chính sách đổi trả/bảo hành của cửa hàng (thời hạn, điều kiện, phí...). Mọi chỗ liên quan chính sách ghi "[cần đối chiếu chính sách của cửa hàng]".
2. Phân loại rõ mọi nội dung thành 3 nhóm và gắn nhãn:
   - [DỮ KIỆN]: điều khách hàng nêu rõ trong khiếu nại.
   - [GIẢ THUYẾT]: suy đoán có thể xảy ra, CHƯA được xác nhận; luôn nói rõ cần kiểm tra gì để xác nhận.
   - [CHƯA XÁC ĐỊNH]: thông tin còn thiếu.
3. Không đưa ra kết luận về nguyên nhân hoặc lỗi của bên nào khi chưa có căn cứ.

# CHỈ THỊ SUY LUẬN (Chain-of-Thought)
Hãy suy nghĩ từng bước một, theo đúng trình tự dưới đây, và trình bày rõ từng bước trước khi đưa ra đề xuất:

Bước 1 - Trích xuất dữ kiện: liệt kê toàn bộ dữ kiện [DỮ KIỆN] theo dòng thời gian.
Bước 2 - Xác định vấn đề: liệt kê các vấn đề khách hàng đang gặp (kỹ thuật, quy trình xử lý, yêu cầu của khách).
Bước 3 - Phân tích mức độ nghiêm trọng của từng vấn đề (Thấp/Trung bình/Cao) kèm LÝ DO dựa trên dữ kiện.
Bước 4 - Xác định thông tin còn thiếu [CHƯA XÁC ĐỊNH] cần xác minh; mỗi mục nêu: cần hỏi/kiểm tra ai, bằng cách nào, vì sao quan trọng.
Bước 5 - Nêu các [GIẢ THUYẾT] có thể có và cách kiểm chứng; không chọn giả thuyết nào làm kết luận.
Bước 6 - Đề xuất ĐÚNG 2 phương án giải quyết phù hợp; mỗi phương án nêu điều kiện áp dụng, ưu điểm, hạn chế.
Bước 7 - Soạn phản hồi chuyên nghiệp gửi khách hàng: đồng cảm, xin lỗi vì sự bất tiện (không thừa nhận lỗi khi chưa xác minh), tóm tắt vấn đề đã ghi nhận, nêu bước tiếp theo, không hứa hẹn đổi/hoàn tiền khi chưa đối chiếu chính sách.

# ĐỊNH DẠNG ĐẦU RA
## A. Báo cáo phân tích theo từng bước (Bước 1 → 7)
## B. Danh sách thông tin cần xác minh (bảng: STT | Thông tin | Cách xác minh | Lý do cần)
## C. Hai phương án xử lý (bảng: Phương án | Nội dung | Ưu điểm | Hạn chế | Điều kiện/Cần xác nhận)
## D. Thư phản hồi gửi khách hàng (dưới 200 từ)
```

---

## 2. KẾT QUẢ CHẠY MẪU

### A. Báo cáo phân tích theo từng bước

**Bước 1 - Dữ kiện (theo thời gian)**

1. [DỮ KIỆN] Khách mua laptop cách đây 10 ngày.
2. [DỮ KIỆN] Khách báo 3 hiện tượng: máy thường xuyên nóng; quạt kêu to; pin dùng khoảng 2 tiếng.
3. [DỮ KIỆN] Khách đã mang máy đến cửa hàng; nhân viên chỉ vệ sinh máy rồi trả lại.
4. [DỮ KIỆN] Sau 2 ngày, tình trạng vẫn tiếp diễn.
5. [DỮ KIỆN] Khách muốn đổi máy hoặc hoàn tiền.

**Bước 2 - Các vấn đề khách đang gặp**

- V1: Máy nóng thường xuyên.
- V2: Quạt kêu to.
- V3: Pin chỉ dùng khoảng 2 tiếng.
- V4: Lần xử lý đầu (vệ sinh máy) chưa giải quyết được hiện tượng.
- V5: Khách yêu cầu đổi máy/hoàn tiền (yêu cầu cần xử lý theo chính sách).

**Bước 3 - Mức độ nghiêm trọng**

| Vấn đề                        | Mức độ                          | Căn cứ từ dữ kiện                                                                                                                 |
| ----------------------------- | ------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| V1 Nóng                       | Cao                             | "Thường xuyên", xảy ra trên máy mới (10 ngày)                                                                                     |
| V2 Quạt ồn                    | Trung bình                      | Ảnh hưởng trải nghiệm; liên quan hiện tượng V1 nhưng chưa xác nhận                                                                |
| V3 Pin ~2 giờ                 | Trung bình                      | Có thể thấp hơn kỳ vọng, nhưng chưa có thông số chuẩn/tác vụ sử dụng để so sánh                                                   |
| V4 Xử lý lần 1 không hiệu quả | Cao                             | Sự cố tái diễn sau 2 ngày; ảnh hưởng niềm tin khách hàng                                                                          |
| V5 Yêu cầu đổi/hoàn           | Cao (về mặt quan hệ khách hàng) | Khách đã mang máy đi kiểm tra một lần, mong muốn giải pháp triệt để; khả năng đáp ứng **[cần đối chiếu chính sách của cửa hàng]** |

**Bước 4 - Thông tin còn thiếu** → xem mục B.

**Bước 5 - Giả thuyết (CHƯA kết luận)**

- [GIẢ THUYẾT] H1: Lỗi/khuyết tật phần cứng tản nhiệt hoặc linh kiện liên quan → kiểm chứng bằng chẩn đoán phần cứng, đo nhiệt độ khi tải.
- [GIẢ THUYẾT] H2: Phần mềm/tiến trình nền hoặc cài đặt nguồn khiến CPU hoạt động cao → kiểm tra Task Manager, cập nhật BIOS/driver, thiết lập nguồn.
- [GIẢ THUYẾT] H3: Điều kiện sử dụng (tác vụ nặng, môi trường, phụ kiện sạc) ảnh hưởng nhiệt độ và thời lượng pin → hỏi khách về cách dùng, so với thông số của hãng.
- [GIẢ THUYẾT] H4: Pin/mạch sạc có vấn đề → kiểm tra Battery Health/báo cáo pin.
- Lưu ý: các giả thuyết có thể xảy ra đồng thời; chưa có căn cứ chọn giả thuyết nào.

**Bước 6 - Hai phương án** → xem mục C.
**Bước 7 - Phản hồi khách hàng** → xem mục D.

### B. Danh sách thông tin cần xác minh

| STT | Thông tin [CHƯA XÁC ĐỊNH]                                                                | Cách xác minh                                   | Lý do cần                                       |
| --- | ---------------------------------------------------------------------------------------- | ----------------------------------------------- | ----------------------------------------------- |
| 1   | Chính sách đổi trả/hoàn tiền/bảo hành áp dụng cho sản phẩm và thời điểm mua (10 ngày)    | Đối chiếu hợp đồng/hoá đơn, quy định cửa hàng   | Quyết định phương án nào được phép đề xuất      |
| 2   | Model, cấu hình, thông số pin công bố của hãng                                           | Tra hoá đơn/phiếu bảo hành, serial              | So sánh thời lượng pin 2 giờ với thông số chuẩn |
| 3   | Biên bản/ghi chú của lần kiểm tra đầu tiên (đã làm những gì, có đo nhiệt/test pin không) | Hỏi nhân viên tiếp nhận, hệ thống phiếu dịch vụ | Biết lần xử lý trước đã kiểm tra những gì       |
| 4   | Nhiệt độ cụ thể, tác vụ khi máy nóng (chơi game, dựng video, hay tác vụ nhẹ)             | Hỏi khách, chạy test tại cửa hàng               | Phân biệt hiện tượng bất thường và tải nặng     |
| 5   | Pin ~2 giờ trong điều kiện nào (độ sáng, tác vụ, chế độ nguồn)                           | Hỏi khách; test pin theo kịch bản chuẩn         | Đánh giá pin có bất thường không                |
| 6   | Tình trạng ngoại quan/vật lý (rơi, va đập, vào nước), phụ kiện sạc đang dùng             | Kiểm tra trực tiếp khi khách mang máy           | Xác định phạm vi bảo hành/đổi trả               |
| 7   | Hoá đơn, thời điểm mua, tình trạng hộp/phụ kiện                                          | Yêu cầu khách cung cấp                          | Điều kiện áp dụng đổi/hoàn                      |

### C. Hai phương án xử lý

|                            | Phương án 1: Kiểm tra - khắc phục chuyên sâu có cam kết thời hạn                                                                 | Phương án 2: Đổi máy / hoàn tiền (nếu đủ điều kiện)                                                               |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| **Nội dung**               | Tiếp nhận lại máy, chẩn đoán đầy đủ (nhiệt độ, quạt, pin, phần mềm), thông báo kết quả và thời hạn xử lý; khắc phục theo kết quả | Đối chiếu chính sách; nếu đủ điều kiện thì đổi máy mới hoặc hoàn tiền theo quy định                               |
| **Ưu điểm**                | Xác định đúng nguyên nhân dựa trên dữ liệu; có thể giữ khách nếu khắc phục thành công; chi phí thường thấp hơn                   | Đáp ứng đúng mong muốn của khách; giải quyết triệt để nếu thuộc diện được áp dụng                                 |
| **Hạn chế**                | Khách đã bị xử lý một lần chưa hiệu quả nên có thể không hài lòng nếu kéo dài; cần nguồn lực kỹ thuật                            | Phụ thuộc chính sách (**cần xác nhận**); có thể phát sinh chi phí; chưa xác định nguyên nhân thì khó đánh giá lỗi |
| **Điều kiện/Cần xác nhận** | Mục 2, 3, 4, 5, 6 ở bảng B                                                                                                       | Mục 1, 6, 7 ở bảng B                                                                                              |

_(Có thể kết hợp: thực hiện kiểm tra chuyên sâu nhanh để có căn cứ cho việc chọn phương án 2 nếu kết quả cho thấy lỗi không khắc phục được; việc này vẫn phải theo chính sách.)_

### D. Thư phản hồi gửi khách hàng

> **Kính gửi Quý khách [Tên khách hàng],**
>
> Cảm ơn Quý khách đã phản hồi. Chúng tôi rất tiếc vì chiếc laptop mới mua gần đây của Quý khách xuất hiện tình trạng nóng máy, quạt kêu to và thời lượng pin ngắn, và việc mang máy đến cửa hàng chưa giúp khắc phục được vấn đề. Chúng tôi xin lỗi vì sự bất tiện này.
>
> Chúng tôi đã ghi nhận yêu cầu đổi máy hoặc hoàn tiền của Quý khách. Để xử lý chính xác và nhanh chóng, bộ phận của chúng tôi sẽ:
>
> 1. Kiểm tra chuyên sâu chiếc máy của Quý khách để xác định nguyên nhân;
> 2. Đối chiếu yêu cầu của Quý khách với chính sách áp dụng cho đơn hàng của mình.
>
> Quý khách vui lòng cung cấp giúp chúng tôi hoá đơn mua hàng, thời điểm và tác vụ thường dùng khi máy nóng, cùng cách Quý khách đo thời lượng pin. Chúng tôi sẽ phản hồi kết quả và phương án cụ thể trong thời gian sớm nhất sau khi nhận đủ thông tin.
>
> Trân trọng, **[Họ tên nhân viên] - Bộ phận Chăm sóc khách hàng - [Tên cửa hàng] - [SĐT/Email]**
