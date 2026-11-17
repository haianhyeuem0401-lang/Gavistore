# GaviStore Demo – GitHub Actions

## Có trong bản này
- Giao diện Home và Chức năng theo bản phác thảo.
- Hình nền King màu tím.
- Liên kết nhóm Telegram: https://t.me/sqbcheat
- Liên kết nhóm Zalo: https://zalo.me/g/m7chhkvpckgqpdls7fxc
- Liên hệ admin: @QBaoTweakxVft_King
- Cửa sổ thư mục dạng xổ xuống và lưới patch minh họa.
- Mở dashboard trong cửa sổ web của app.

## Lưu ý về đồng bộ patch
Danh sách thư mục và patch hiện vẫn là dữ liệu DEMO. Để app tự động lấy đúng thư mục/tên tệp do admin upload trên dashboard, website cần cung cấp một endpoint JSON/manifest công khai và cho phép app truy cập trực tiếp. Dashboard hiện bị máy chủ trả 403 cho truy cập tự động, vì vậy không thể suy ra cấu trúc API hay tự nhận biết các file mới chỉ từ URL dashboard.

## Build IPA unsigned bằng GitHub
1. Tạo repository GitHub và upload toàn bộ thư mục này, bao gồm `.github/workflows/build-unsigned-ipa.yml`.
2. Mở tab Actions.
3. Chọn workflow `Build GaviStore Demo (unsigned IPA)` rồi bấm Run workflow.
4. Khi workflow hoàn tất, tải artifact IPA ở cuối trang run.
5. IPA unsigned cần ký bằng công cụ/chứng chỉ phù hợp trước khi cài lên iPhone.
