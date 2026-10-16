# 🚀 SMART-FARM: HỆ THỐNG IOT CHO TRANG TRẠI LAN

> **Smart-Farm** là giải pháp công nghệ nông nghiệp thông minh giúp người trồng Lan theo dõi môi trường tự động, cảnh báo sự cố kịp thời và tưới nước chính xác – _tiết kiệm 50% chi phí vận hành và tối ưu năng suất cây trồng_.

---

### 📖 1. GIỚI THIỆU & MÔ TẢ DỰ ÁN

Trong trồng hoa Lan, **độ ẩm và nhiệt độ** là hai yếu tố _sống còn_. Hệ thống **Smart-Farm** kết hợp giữa thiết bị phần cứng SoC (`ESP32` / `Raspberry Pi`) và phần mềm điện toán đám mây để:

- Giúp nông dân **xem thông số môi trường mọi lúc, mọi nơi** qua điện thoại.
- Tự động kích hoạt hệ thống phun sương khi trời quá nóng hoặc quá khô.
- Cảnh báo nguy cơ dịch bệnh thông qua phân tích chỉ số môi trường.

---

### 💻 2. HƯỚNG DẪN CÀI ĐẶT & KHỞI CHẠY (CODE BLOCK)

Kỹ sư hoặc người vận hành chạy các lệnh sau trên Terminal để cài đặt hệ thống:

```bash
# Bước 1: Khởi tạo và tải mã nguồn hệ thống Smart-Farm
smartfarm-cli init --project lan-greenhouse
cd lan-greenhouse

# Bước 2: Cài đặt các thư viện phụ thuộc
smartfarm-cli install-deps

# Bước 3: Khởi chạy dịch vụ theo dõi thời gian thực
smartfarm-cli start --zone="Khu_Lan_Ho_Diep" --interval=5
```

---

### ⚡ 3. CHU KỲ XỬ LÝ LỆNH CỦA CPU (FETCH - DECODE - EXECUTE)

Dưới đây là mô tả chi tiết cách vi xử lý (CPU/SoC) xử lý lệnh tưới Lan tự động:

> 🧠 **Cơ chế xử lý của CPU khi nhận lệnh tưới nước:**
>
> - **1. Fetch (Lấy lệnh):** CPU truy xuất và nạp mã lệnh `ACTIVATE_PUMP` từ bộ nhớ RAM vào thanh ghi lệnh (Instruction Register).
> - **2. Decode (Giải mã):** Khối điều khiển (Control Unit - CU) giải mã mã máy, nhận diện đây là lệnh xuất tín hiệu điều khiển ra chân `GPIO17`.
> - **3. Execute (Thực thi):** Khối logic xuất điện áp mốc `HIGH` (3.3V) tới chân `GPIO17`, đóng Rơ-le công suất và kích hoạt máy bơm tưới sương cho nhà Lan.

---

### 💡 4. MÔ HÌNH CHUYỂN HÓA DỮ LIỆU DIKW (DATA TO WISDOM)

Hệ thống Smart-Farm không chỉ thu thập số liệu mà còn chuyển hóa dữ liệu thành hành động thông minh theo mô hình **DIKW**:

```
       /       /   \     [WISDOM] Tự động bật máy bơm & khép mái che nắng
     /-----    /       \    [KNOWLEDGE] Hiểu nguy cơ sốc nhiệt khi Nhiệt độ > 30°C & Độ ẩm < 60%
   /---------  /           \   [INFORMATION] Biết Nhiệt độ = 32°C, Độ ẩm = 55% tại Khu A lúc 14h
 /-------------/               \  [DATA] Con số thô từ cảm biến: 32 và 55
-----------------
```

1. **Data (Dữ liệu thô):** Tín hiệu số `32` và `55` gửi từ cảm biến `DHT22`.
2. **Information (Thông tin):** Chuẩn hóa thành "Nhiệt độ = 32°C, Độ ẩm = 55% tại Khu A lúc 14:00".
3. **Knowledge (Tri thức):** Phân tích tri thức chuyên môn: "Hoa Lan Hồ Điệp gặp nhiệt độ > 30°C và độ ẩm < 60% quá 15 phút sẽ bị cháy lá và rụng hoa".
4. **Wisdom (Trí tuệ / Hành động):** Hệ thống tự động kích hoạt phun sương 5 phút, đóng mái che và gửi thông báo khẩn "⚠️ Nguy hiểm: Cảnh báo sốc nhiệt!" tới App điện thoại.

---

### 📋 5. TÍNH NĂNG & DẠNG TÍCH CHỌN (TASK LIST)

Dưới đây là tiến độ triển khai các tính năng cho trang trại Lan:

- [x] Đăng nhập ứng dụng bảo mật bằng tài khoản nông dân.
- [x] Hiển thị nhiệt độ, độ ẩm, ánh sáng theo thời gian thực (Mã màu: Xanh / Vàng / Đỏ).
- [x] Tự động gửi tin nhắn cảnh báo khi thông số vượt ngưỡng an toàn.
- [x] Cho phép bật/tắt máy bơm thủ công từ xa qua điện thoại.
- [ ] Xuất báo cáo lịch sử môi trường dạng file Excel và PDF hàng tháng.
- [ ] Tích hợp camera AI nhận diện sớm nấm mốc trên lá Lan.

---

### 📊 6. BẢNG THÔNG SỐ & MÃ MÀU TRẠNG THÁI (TABLE)

| Trạng thái        | Ngưỡng Nhiệt độ (°C) | Ngưỡng Độ ẩm (%) | Màu hiển thị trên App | Hành động hệ thống                      |
| :---------------- | :------------------- | :--------------- | :-------------------- | :-------------------------------------- |
| **Tốt (An toàn)** | 22°C – 28°C          | 65% – 80%        | 🟢 **Màu Xanh**       | Duy trì chế độ theo dõi bình thường     |
| **Cảnh báo**      | 28°C – 32°C          | 55% – 64%        | 🟡 **Màu Vàng**       | Gửi thông báo nhắc nhở nông dân         |
| **Nguy hiểm**     | > 32°C hoặc < 18°C   | < 55% hoặc > 85% | 🔴 **Màu Đỏ**         | **Bật máy bơm / quạt tự động khẩn cấp** |
