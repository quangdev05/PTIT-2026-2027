# Bài 10 - Tính chi phí API và thiết kế Enterprise API Gateway

## Phần 1. Bảng tính chi phí

### 1. Số token cho mỗi tin

| Thành phần      | Số từ/tin | Hệ số BPE tiếng Việt | Token/tin |              Đơn giá GPT-4o |
| --------------- | --------: | -------------------: | --------: | --------------------------: |
| Input prompt    |       200 |         2,5 token/từ |       500 |  2,50 USD / 1.000.000 token |
| Output response |       100 |         2,5 token/từ |       250 | 10,00 USD / 1.000.000 token |
| **Tổng**        |   **300** |                    — |   **750** |                           — |

### 2. Tổng cho chiến dịch 50.000 tin

| Thành phần | Token/tin |     Số tin |     Tổng token | Phép tính chi phí |        Chi phí |
| ---------- | --------: | ---------: | -------------: | ----------------- | -------------: |
| Input      |       500 |     50.000 |     25.000.000 | 25 × 2,50 USD     |      62,50 USD |
| Output     |       250 |     50.000 |     12.500.000 | 12,5 × 10,00 USD  |     125,00 USD |
| **Tổng**   |   **750** | **50.000** | **37.500.000** | 62,50 + 125,00    | **187,50 USD** |

Quy đổi tỷ giá 25.000 VNĐ/USD:

**187,50 × 25.000 = 4.687.500 VNĐ.**

Đây là chi phí suy ra từ số từ trung bình và hệ số BPE giả định. Token thực tế cần lấy từ usage/billing của API; tổng chưa tính thuế, retry, lời nhắc hệ thống, lịch sử hội thoại hoặc chi phí hạ tầng khác nếu phát sinh.

### 3. Marketing đã tính thiếu bao nhiêu?

Ước tính thô của Marketing: 15 triệu từ × 2,50 USD / 1 triệu = **37,50 USD**. Cách tính này bỏ qua hệ số BPE 2,5 và áp một đơn giá như nhau cho input lẫn output, trong khi output có đơn giá cao hơn.

| So sánh                                |        USD |           VNĐ |
| -------------------------------------- | ---------: | ------------: |
| Chi phí tính đúng theo giả định đề bài |     187,50 |     4.687.500 |
| Ước tính thô của Marketing             |      37,50 |       937.500 |
| **Số tiền tính thiếu**                 | **150,00** | **3.750.000** |

Chi phí dự kiến thực tế bằng **5 lần** con số ước tính thô (cao hơn 400% so với ước tính). Ngân sách cần dự phòng dựa trên usage thực tế và giới hạn chi tiêu cho từng chiến dịch.

## Phần 2. Hạ tầng Enterprise API Gateway

### Sơ đồ luồng

```text
CRM / Hệ thống chiến dịch
        │ OAuth2 / mTLS; workload identity
        ▼
Enterprise API Gateway
  ├─ Xác thực ứng dụng, phân quyền và quản lý khóa
  ├─ Kiểm tra schema, giới hạn tốc độ, quota và ngân sách
  ├─ Phát hiện PII → che/mã hóa/token hóa trước khi gửi
  ├─ Ghi audit log đã giảm thiểu dữ liệu nhạy cảm
  └─ Chọn model/endpoint theo chính sách
        │ TLS; private endpoint khi khả dụng
        ▼
Azure OpenAI / Private LLM theo cấu hình doanh nghiệp
        │ phản hồi
        ▼
Gateway khử token PII nếu cần → kiểm tra đầu ra → ứng dụng nhận kết quả
```

### Vì sao không dùng ChatGPT Plus cá nhân và Web Scraping tự động?

- Tài khoản cá nhân/Web UI không phải giao diện tích hợp dịch vụ có kiểm soát cho hệ thống gửi hàng loạt. Cách tự động hóa trình duyệt khó quản lý khóa, quyền truy cập, quota, nhật ký, retry và vòng đời tài khoản; có thể trái điều khoản dịch vụ áp dụng.
- Nội dung tin nhắn có thể chứa PII. Đưa dữ liệu đó vào công cụ không được tổ chức phê duyệt khiến doanh nghiệp khó chứng minh dữ liệu đi đâu, ai truy cập, lưu bao lâu và có được dùng để cải thiện dịch vụ hay không.
- Gateway tạo một điểm kiểm soát tập trung: xác thực máy-máy, least privilege, giới hạn tốc độ/chi phí, DLP/che PII, audit, chính sách lưu trữ và chặn yêu cầu không hợp lệ.

### Zero Data Retention (ZDR) và lựa chọn dịch vụ

ZDR là yêu cầu dữ liệu đầu vào/đầu ra không được giữ lại sau xử lý, ngoại trừ những ngoại lệ được hợp đồng/chính sách nêu rõ. Cần chọn gói API doanh nghiệp và cấu hình đã được nhà cung cấp phê duyệt cho yêu cầu này; xác minh phạm vi endpoint, vùng xử lý, abuse-monitoring, log, backup, thời gian lưu, mục đích sử dụng dữ liệu và điều kiện xóa trong tài liệu hợp đồng/chính sách hiện hành. Không nên mặc định mọi dịch vụ Azure OpenAI hoặc mọi cấu hình Private LLM tự động bảo đảm ZDR.

Với dữ liệu nhạy cảm cao, có thể triển khai mô hình riêng trong môi trường cô lập, kiểm soát mạng và khóa mã hóa. Dù chọn dịch vụ nào, cần giảm thiểu dữ liệu gửi đi, ẩn danh/token hóa PII, xác định thời hạn lưu log và kiểm tra nhà cung cấp trước khi đưa vào vận hành.

### Chính sách vận hành đề xuất

1. Chỉ backend được cấp workload identity gọi Gateway; không nhúng API key vào trình duyệt hoặc mã nguồn phía client.
2. Chỉ gửi trường dữ liệu thật sự cần; thay tên/số điện thoại bằng token, lưu bảng ánh xạ ở hệ thống nội bộ có phân quyền.
3. Đặt quota theo chiến dịch, cảnh báo khi gần ngân sách và ngắt tự động khi vượt trần.
4. Không ghi prompt/response chứa PII vào log; ghi mã giao dịch, model, lượng token và kết quả kiểm tra chính sách.
5. Mã hóa khi truyền/lưu, phân quyền tối thiểu, luân chuyển khóa và rà soát truy cập định kỳ.
6. Kiểm thử với dữ liệu giả, đánh giá đầu ra và quy trình xử lý sự cố trước khi gửi tin thật.
