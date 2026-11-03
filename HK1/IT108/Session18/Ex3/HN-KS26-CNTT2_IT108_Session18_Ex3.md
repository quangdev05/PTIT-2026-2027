# Bài 3

## 1. Phân tích

```text
┌──────────── Margin ────────────┐
│ ┌────────── Border ──────────┐ │
│ │ ┌────── Padding ─────────┐ │ │
│ │ │       Content          │ │ │
│ │ └────────────────────────┘ │ │
│ └────────────────────────────┘ │
└────────────────────────────────┘
```

## 2. Triển khai

```css`.tracking-layout { display: grid; grid-template-columns: minmax(0, 1fr) minmax(0, 1fr); gap: 16px; }
.tracking-panel { box-sizing: border-box; min-width: 0; max-width: 100%; }

```

## 3. Kiểm thử

Trong Computed mở nguồn khai báo để tìm quy tắc thắng cascade; kiểm tra !important, inline style, media query, display, position. Absolute/fixed được bố trí chủ yếu bằng top/right/bottom/left; trong flex/grid khoảng cách có thể do gap/alignment. Tắt từng khai báo trong Styles để xác định. Browser Engine không tự ghi đè margin tùy ý; thường là cascade hoặc cơ chế layout.
```
