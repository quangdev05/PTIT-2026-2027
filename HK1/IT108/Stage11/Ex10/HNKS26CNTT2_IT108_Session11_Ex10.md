# Bài 10: SO SÁNH HAI GIẢI PHÁP VIẾT TÀI LIỆU KẾ HOẠCH HỘI NGHỊ

## Phần 1. Phân tích và đề xuất

### 1. Phân tích yêu cầu bài toán (Input/Output)

**Đầu vào (Input):**

- Ban Thư ký có 8 thành viên cùng soạn thảo tài liệu _Kế hoạch Hội nghị 2026_.
- Tài liệu dài khoảng 40 trang, có mục lục tự động, các cấp tiêu đề H1/H2/H3 và nhiều bảng biểu.
- Nhóm cần cùng chỉnh sửa nhưng phải hạn chế tạo ra nhiều bản khác nhau của tài liệu.
- Tài liệu cuối cùng phải xuất được PDF hoặc định dạng phù hợp, giữ bố cục khi in giấy A4 để phát cho ban giám khảo.
- Có một thành viên không cài Microsoft Word và máy tính kết nối với máy in tại trường có Word.
- Giảng viên cần nhận được file hoặc đường dẫn có thể mở và đọc được.

**Đầu ra (Output) mong đợi:**

- Một bản tài liệu hoàn chỉnh, thống nhất nội dung và không bị lẫn nhiều phiên bản.
- Tiêu đề được phân cấp đúng bằng Heading 1, Heading 2, Heading 3; mục lục có thể tự động tạo và cập nhật.
- Bảng biểu dễ đọc, không bị tràn lề hoặc vỡ bố cục.
- Có bản PDF để kiểm tra và in A4, đồng thời có file hoặc đường dẫn để giảng viên xem.
- Các thành viên đều có cách tham gia chỉnh sửa phù hợp với thiết bị của mình.

### 2. Ưu điểm và nhược điểm của từng giải pháp

#### Giải pháp A: Microsoft Word (.docx) lưu trên OneDrive

**Ưu điểm:**

- Word có hệ thống Heading Styles và mục lục tự động, phù hợp với tài liệu dài nhiều cấp tiêu đề.
- Có Track Changes để theo dõi nội dung được sửa và xem xét các thay đổi.
- Word hỗ trợ nhiều tùy chọn định dạng trang, bảng biểu, lề và ngắt trang; thuận tiện cho việc hoàn thiện tài liệu trước khi in.
- Lưu một file chung trên OneDrive và cấp quyền chỉnh sửa giúp các thành viên làm việc trên cùng một bản, hạn chế nhầm lẫn phiên bản.
- Có thể xuất PDF để giữ bố cục khi in và gửi cho giảng viên.

**Nhược điểm:**

- Nếu thành viên không có quyền truy cập hoặc không sử dụng được Word Online, họ có thể gặp khó khăn khi chỉnh sửa. Việc không cài Word trên máy không nhất thiết là trở ngại nếu họ có thể dùng Word Online qua trình duyệt và được cấp quyền.
- Một số tính năng nâng cao có thể khác nhau giữa Word Online và ứng dụng Word cài trên máy.
- Việc cộng tác trực tuyến cần Internet. Nếu mỗi người tải một bản riêng về sửa rồi gửi lại, nhóm vẫn có nguy cơ bị trùng hoặc mất thay đổi.

#### Giải pháp B: Google Docs trên Google Drive

**Ưu điểm:**

- Các thành viên có thể cùng chỉnh sửa trong trình duyệt, không cần cài ứng dụng soạn thảo riêng.
- Chia sẻ quyền xem, nhận xét hoặc chỉnh sửa khá thuận tiện; lịch sử phiên bản giúp xem lại và khôi phục nội dung cũ khi cần.
- Có tiêu đề theo cấp, mục lục tự động, nhận xét, chế độ đề xuất chỉnh sửa và công cụ tạo bảng, đáp ứng phần lớn nhu cầu soạn thảo.
- Phù hợp khi nhóm có thiết bị và điều kiện sử dụng phần mềm khác nhau.
- Có thể xuất tài liệu ra định dạng .docx hoặc PDF để nộp và in.

**Nhược điểm:**

- Với tài liệu 40 trang có nhiều bảng biểu, việc tải sang .docx rồi mở bằng Word có thể làm thay đổi một số chi tiết như ngắt trang, độ rộng bảng hoặc khoảng cách dòng. Cần kiểm tra lại trước khi in.
- Chế độ đề xuất chỉnh sửa của Google Docs có cách hoạt động và giao diện khác Track Changes trong Word.
- Khi làm việc trực tuyến, các thành viên vẫn cần Internet. Nếu cấp quyền chia sẻ sai, người nhận có thể không mở hoặc chỉnh sửa được tài liệu.

## Phần 2. So sánh và lựa chọn

### 3. Bảng so sánh 5 tiêu chí

| Tiêu chí                        | Giải pháp A: Word + OneDrive                                                                                                                                           | Giải pháp B: Google Docs                                                                                                                               |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Cộng tác nhóm**               | ✅ Có thể cùng sửa một file trên OneDrive/Word Online và theo dõi thay đổi. Cần cấp quyền đúng và tránh sửa các bản tải riêng.                                         | ✅ Nhiều người cùng sửa qua trình duyệt; lịch sử phiên bản thuận tiện để xem lại hoặc khôi phục.                                                       |
| **Tính năng văn phòng**         | ✅ Heading Styles, Auto TOC, Track Changes và các tùy chọn trình bày bảng biểu khá đầy đủ.                                                                             | ⚠️ Có heading, mục lục, bảng và chế độ đề xuất, nhưng khi cần Track Changes theo quy trình của Word hoặc định dạng phức tạp có thể kém thuận tiện hơn. |
| **In ấn và xuất PDF**           | ✅ Thuận tiện để chỉnh bố cục trang, kiểm tra ngắt trang và xuất PDF trước khi in.                                                                                     | ⚠️ Có thể xuất PDF trực tiếp, nhưng nếu chuyển tiếp sang Word để in thì nên kiểm tra lại bố cục và mục lục.                                            |
| **Yêu cầu hạ tầng**             | ⚠️ Word Online dùng qua trình duyệt nên không nhất thiết phải cài Word, nhưng cần Internet và quyền truy cập phù hợp; ứng dụng Word trên máy có thể có thêm tính năng. | ✅ Không cần cài ứng dụng soạn thảo riêng, có thể làm trên trình duyệt; vẫn cần Internet để cộng tác trực tuyến.                                       |
| **Khả năng nộp cho giảng viên** | ✅ Có thể nộp file .docx, PDF hoặc đường dẫn OneDrive nếu giảng viên được cấp quyền.                                                                                   | ✅ Có thể nộp link Google Docs/Drive hoặc tải file .docx, PDF; phải bật đúng quyền chia sẻ.                                                            |

_Chú thích:_ ✅ = đáp ứng tốt; ⚠️ = đáp ứng được nhưng cần lưu ý; ❌ = không đáp ứng trong điều kiện đang xét. Không có tiêu chí nào bị đánh ❌ vì cả hai giải pháp đều có cách xử lý phù hợp.

### 4. Lựa chọn giải pháp

Theo em, cách hợp lý là **dùng Google Docs làm nơi soạn thảo chung, sau đó dùng Word trên máy tính kết nối với máy in để kiểm tra và hoàn thiện bản in**.

Lý do:

- Có 8 người cùng làm, trong đó có một thành viên không cài Word. Google Docs giúp thành viên này tham gia dễ dàng qua trình duyệt, không phải cài thêm phần mềm.
- Google Docs có lịch sử phiên bản nên nhóm có thể xem lại hoặc khôi phục khi nội dung bị sửa nhầm.
- Tài liệu cuối cùng cần in và có nhiều bảng biểu. Vì máy kết nối với máy in có Word, nhóm có thể tải bản .docx từ Google Docs, mở bằng Word để kiểm tra khổ giấy A4, lề, tiêu đề, mục lục, bảng biểu và ngắt trang, rồi xuất PDF để in.
- Cách làm này tận dụng ưu điểm cộng tác của Google Docs và khả năng kiểm tra định dạng khi in của Word.

Tuy nhiên, nhóm phải thống nhất một quy trình rõ ràng để tránh phát sinh hai bản chính. Trong giai đoạn soạn thảo, Google Docs là bản gốc duy nhất. Khi chốt nội dung, chỉ một người được phân công tải file sang Word để kiểm tra và tạo bản PDF cuối cùng. Sau khi chốt, nếu có thay đổi nội dung thì phải cập nhật lại bản gốc và xuất lại file, không sửa lung tung nhiều bản khác nhau.

#### Xử lý hai bẫy dữ liệu

**Bẫy 1: Một thành viên không cài Microsoft Word**

Nếu hiểu rằng thành viên này hoàn toàn không thể dùng Word thì đây là điểm bất lợi lớn của giải pháp A. Tuy nhiên, đề bài đã ghi rõ dùng Word Online, nên cần phân biệt việc _không cài ứng dụng Word trên máy_ với việc _không thể truy cập Word Online_. Nếu thành viên có trình duyệt, Internet và quyền truy cập phù hợp, họ vẫn có thể tham gia qua Word Online. Dù vậy, Google Docs vẫn là lựa chọn ít rào cản hơn nếu nhóm muốn mọi người làm việc qua trình duyệt mà không phụ thuộc vào hệ sinh thái Microsoft.

**Bẫy 2: Máy in của trường chỉ kết nối với máy tính có Word**

Nếu chọn Google Docs, quy trình in có thể thực hiện như sau:

1. Nhóm kiểm tra và chốt nội dung trên Google Docs.
2. Tải tài liệu về dưới dạng **Microsoft Word (.docx)**.
3. Chuyển file sang máy tính có Word và mở file để kiểm tra lại khổ A4, lề, mục lục, font chữ, bảng biểu và số trang.
4. Cập nhật mục lục nếu cần, sau đó xuất file thành **PDF** từ Word.
5. Mở bản PDF để xem lại lần cuối rồi in tại trường. Nếu máy in chỉ làm việc thuận tiện với Word, nhóm vẫn có thể in từ file .docx sau khi đã kiểm tra định dạng.

Như vậy, dùng Google Docs không có nghĩa là không in được. Nhóm chỉ cần thêm bước xuất file và kiểm tra trước khi in. Bước này quan trọng vì tài liệu dài 40 trang mà lỗi bố cục thì việc sửa sát giờ hội nghị sẽ rất phiền.

## Phần 3. Thiết kế và triển khai

### 5. Cấu trúc Heading cho “Tài liệu Kế hoạch Hội nghị 2026”

Khi làm trên Word hoặc Google Docs, cần áp dụng **Heading 1, Heading 2 và Heading 3** cho tiêu đề tương ứng, không chỉ bôi đậm hoặc tăng cỡ chữ thủ công. Nhờ vậy, mục lục có thể được tạo tự động và cập nhật khi nội dung thay đổi.

- **H1: 1. Tổng quan hội nghị**
  - **H2: 1.1. Thông tin chung**
    - **H3: 1.1.1. Thời gian và địa điểm tổ chức**
    - **H3: 1.1.2. Thành phần tham dự**
  - **H2: 1.2. Mục tiêu và phạm vi hội nghị**
    - **H3: 1.2.1. Mục tiêu chính**
    - **H3: 1.2.2. Kết quả dự kiến**

- **H1: 2. Nội dung và chương trình hội nghị**
  - **H2: 2.1. Nội dung làm việc**
    - **H3: 2.1.1. Các chủ đề báo cáo**
    - **H3: 2.1.2. Phần thảo luận và hỏi đáp**
  - **H2: 2.2. Lịch trình dự kiến**
    - **H3: 2.2.1. Các hoạt động trước giờ khai mạc**
    - **H3: 2.2.2. Chương trình trong hội nghị**

- **H1: 3. Nhân sự và phân công nhiệm vụ**
  - **H2: 3.1. Ban Thư ký**
    - **H3: 3.1.1. Tổng hợp nội dung và biên bản**
    - **H3: 3.1.2. Quản lý tài liệu và danh sách đại biểu**
  - **H2: 3.2. Các bộ phận hỗ trợ**
    - **H3: 3.2.1. Hậu cần và thiết bị**
    - **H3: 3.2.2. Đón tiếp và hướng dẫn đại biểu**

- **H1: 4. Cơ sở vật chất và kinh phí**
  - **H2: 4.1. Phòng họp và thiết bị**
    - **H3: 4.1.1. Bàn ghế, máy chiếu và âm thanh**
    - **H3: 4.1.2. Máy tính, đường truyền và thiết bị dự phòng**
  - **H2: 4.2. Dự toán kinh phí**
    - **H3: 4.2.1. Chi phí in ấn tài liệu**
    - **H3: 4.2.2. Chi phí hậu cần khác**

- **H1: 5. Công tác chuẩn bị, kiểm tra và xử lý rủi ro**
  - **H2: 5.1. Công việc trước ngày hội nghị**
    - **H3: 5.1.1. Kiểm tra nội dung và danh sách đại biểu**
    - **H3: 5.1.2. Kiểm tra bản in và thiết bị**
  - **H2: 5.2. Phương án dự phòng**
    - **H3: 5.2.1. Sự cố thiết bị hoặc đường truyền**
    - **H3: 5.2.2. Thiếu hoặc sai tài liệu in**

- **H1: 6. Phụ lục**
  - **H2: 6.1. Bảng phân công công việc**
  - **H2: 6.2. Bảng dự toán chi phí**
  - **H2: 6.3. Danh sách kiểm tra trước hội nghị**
