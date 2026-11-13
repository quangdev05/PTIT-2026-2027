# Bài 7: Email khủng hoảng giao chậm Black Friday theo CREATE

## 1. Sáu khối CREATE

| Khối | Thiết kế |
|---|---|
| **Character** | Trưởng nhóm Chăm sóc Khách hàng TechShop, đại diện doanh nghiệp và chịu trách nhiệm giải quyết sự cố. |
| **Request** | Soạn email cá nhân hóa cho khách có đơn linh kiện PC chậm 4–6 ngày; xin lỗi, giải thích sự cố kho, đưa lịch giao dự kiến đã xác minh, tặng voucher 15% và cung cấp kênh hỗ trợ. |
| **Examples** | “Chúng tôi hiểu việc chờ linh kiện ảnh hưởng đến kế hoạch lắp ráp của Anh/Chị. TechShop xin nhận trách nhiệm vì chưa giao hàng đúng thời hạn cam kết.” |
| **Adjustment** | Cầu thị, chuyên nghiệp, đồng cảm. Không đổ lỗi cho hãng vận chuyển, không giảm nhẹ sự cố, không hứa ngày chưa xác minh, không bịa thông tin cá nhân hay chính sách. |
| **Type of Output** | Email tiếng Việt có tiêu đề, lời chào, đúng 3 đoạn thân bài, cam kết, hotline và chữ ký. Dùng biến đầu vào để cá nhân hóa. |
| **Extras** | Voucher 15%; mã, hạn, điều kiện và hotline phải lấy từ dữ liệu đã xác nhận. Nếu thiếu, giữ placeholder và yêu cầu kiểm tra trước khi gửi. |

## 2. Master Prompt

```text
Bạn là Trưởng nhóm Chăm sóc Khách hàng của TechShop. Soạn email cá nhân hóa bằng tiếng Việt cho khách có đơn linh kiện PC (card màn hình, nguồn hoặc RAM) giao chậm 4–6 ngày trong đợt Black Friday.

BỐI CẢNH ĐÃ XÁC NHẬN
Hệ thống phân loại tự động tại kho TechShop bị quá tải. TechShop chịu trách nhiệm về trải nghiệm và việc không đáp ứng thời hạn đã cam kết. Không quy trách nhiệm cho đơn vị vận chuyển.

DỮ LIỆU
Tên khách: {{TEN_KHACH}}
Mã đơn: {{MA_DON}}
Mặt hàng: {{MAT_HANG}}
Ngày giao dự kiến đã được xác minh: {{NGAY_GIAO_DU_KIEN}}
Mã voucher giảm 15%: {{MA_VOUCHER}}
Hạn và điều kiện voucher đã xác nhận: {{DIEU_KIEN_VOUCHER}}
Hotline VIP chính thức: {{HOTLINE_VIP}}
Nhân viên phụ trách: {{TEN_NHAN_VIEN}}

YÊU CẦU
1. Xin lỗi chân thành và đồng cảm với ảnh hưởng của việc chậm linh kiện.
2. Nêu ngắn gọn, minh bạch nguyên nhân là kho TechShop quá tải ở hệ thống phân loại tự động; nhận trách nhiệm.
3. Nêu lịch giao dựa trên dữ liệu đã xác minh; không biến dự kiến thành bảo đảm tuyệt đối.
4. Tặng voucher 15% và nêu đúng mã, hạn, điều kiện nếu có.
5. Cung cấp hotline VIP để khách được hỗ trợ.

QUY TẮC
- Không bịa tên, mã đơn, mặt hàng, ngày, mã/hạn/điều kiện voucher, số hotline hay nhân viên.
- Trường thiếu phải giữ nguyên placeholder và thêm ghi chú ngoài email: "Cần xác minh trước khi gửi: ...". Không gửi email có placeholder cho khách.
- Không hứa suông, không đổ lỗi, không viết giọng quảng cáo.

ĐỊNH DẠNG
Tiêu đề rõ ràng; lời chào trang trọng; đúng 3 đoạn thân bài: (1) xin lỗi và ảnh hưởng, (2) nguyên nhân và lịch trình, (3) voucher và hỗ trợ. Sau đó là lời cam kết ngắn, hotline, lời kết và chữ ký. Viết súc tích, tự nhiên.
```

## 3. Email mẫu minh họa

*Thông tin dưới đây là giả lập để thử prompt, không phải chính sách hoặc cam kết thật của TechShop.*

**Tiêu đề:** TechShop xin lỗi về đơn DH-BF-2048 và cập nhật lịch giao

Kính gửi chị Nguyễn Minh Anh,

TechShop chân thành xin lỗi chị vì đơn DH-BF-2048 gồm RAM DDR5 đã chậm 5 ngày so với thời hạn thông báo. Chúng tôi hiểu việc thiếu linh kiện có thể làm gián đoạn kế hoạch lắp ráp máy của chị và rất tiếc vì trải nghiệm này.

Trong đợt Black Friday, hệ thống phân loại tự động tại kho TechShop bị quá tải khiến đơn hàng chưa được xử lý đúng tiến độ. Đây là trách nhiệm của TechShop. Theo dữ liệu minh họa đã xác minh, đơn dự kiến được giao trước ngày 06/12/2026; chúng tôi sẽ chủ động cập nhật nếu lịch thay đổi.

Để xin lỗi, TechShop gửi chị voucher giảm 15% cho đơn tiếp theo: **TS-THANKS15**, hạn dùng **31/01/2027** (điều kiện giả lập: phụ kiện PC). Nếu cần hỗ trợ gấp, chị có thể gọi hotline VIP **1900-000-000** (số minh họa).

Chúng tôi sẽ theo sát đơn đến khi giao và sẵn sàng hỗ trợ chị.

Trân trọng,  
Bộ phận Chăm sóc Khách hàng TechShop

*Thay toàn bộ dữ liệu giả lập bằng thông tin chính thức trước khi gửi.*
