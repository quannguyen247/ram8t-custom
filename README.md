# SRAM 8T 2×2

Nguyen Dong Quan thiết kế mạch SRAM này cho đồ án CE226. Đây là mạch full-custom dùng PDK `reference90RF` (90 nm), lưu hai từ, mỗi từ hai bit. Thư viện OpenAccess có các view schematic, symbol và layout cho bitcell, mảng 2×2, mạch ngoại vi và macro `ram8t_full`.

![Layout ram8t_full](docs/images/ram8t-full-layout.png)

## Đọc và ghi

Bitcell gồm latch 6T và hai NMOS dành riêng cho đường đọc. Khi ghi, `WE` và địa chỉ `A` chọn một đường `WWL`. Hai write driver đưa `DIN0` và `DIN1` lên các cặp `WBL/WBLB`.

Trước khi đọc, đặt `PREB = 0` để nạp hai đường `RBL` lên VDD. Sau đó đưa `PREB` lên 1 và bật `RE` để chọn `RWL` của hàng cần đọc. Nếu bit đang lưu là 0, nhánh đọc kéo `RBL` xuống GND. Với bit 1, `RBL` giữ mức cao. Hai inverter mắc nối tiếp trong `read_sense` đệm tín hiệu ra `DOUT`. Testbench điều khiển `A`, `WE`, `RE` và `PREB` từ bên ngoài.

## Mở dự án

Sau khi clone repo, đặt PDK tại `PDK/reference90RF` hoặc trỏ `lib.defs` đến bộ PDK đã cài. Chạy Custom Compiler từ thư mục gốc của repo.

Trong Library Manager, mở `ram8t_custom/ram8t_full` để xem macro hoặc `ram8t_full_test/schematic` để xem testbench ghi và đọc. View `config` của testbench chọn view `starrc` cho DUT. Cổng NAND2 của decoder nằm ở `lab3/nand2`.

| Thư mục | Nội dung |
| --- | --- |
| [`ram8t_custom/`](ram8t_custom/) | Thư viện OpenAccess, gồm hai testbench Custom Compiler |
| [`lab3/`](lab3/) | Cổng NAND2 dùng trong bộ giải mã hàng |
| [`simulation/`](simulation/) | HSPICE deck cho bitcell và macro, mạch đo SNM và cách chạy |
| [`verification/`](verification/) | Kết quả Hercules, StarRC và HSPICE |
| [`docs/images/`](docs/images/) | Schematic, layout và dạng sóng của đồ án |

## Kết quả

| Khối | Kích thước (µm) | Diện tích (µm²) |
| --- | ---: | ---: |
| Bitcell 8T | 3.030 × 2.470 | 7.4841 |
| Mảng 2×2 | 6.060 × 5.010 | 30.3606 |
| Macro có ngoại vi | 14.455 × 14.480 | 209.3084 |

Bitcell, mảng 2×2 và macro đều qua DRC và so khớp LVS bằng Hercules. Khi trích layout riêng của mảng 2×2, Hercules báo một `ERR_TEXT_OPEN`. StarRC báo chập khi trích RC của bitcell và macro. [Báo cáo kiểm tra](verification/README.md).

Cả hai testbench HSPICE chạy 20 ns với hai deck, một từ schematic và một từ netlist trích RC. Bitcell ở 0.8 V đọc lại lần lượt 1 và 0, với tải 10 fF trên RBL. Ở 1.2 V, macro đọc lại đúng `10` từ hàng 0 và `01` từ hàng 1 sau khi ghi, với tải 10 fF trên mỗi DOUT. [Dạng sóng macro sau trích RC](docs/images/ram8t-full-postlayout.png).

Phép quét DC ở 1.0 V và 25 °C cho Hold SNM 307.197 mV và Read SNM 307.199 mV. Khi ép ghi 0, cạnh vuông của thùy còn lại là 435.000 mV. Mạch đo dùng transistor có cùng kích thước với transistor trong bitcell. Trong deck transient, mạch đo có bộ nút riêng, tách khỏi netlist StarRC. [Thiết lập phép đo](simulation/README.md).

## Tài liệu tham khảo

- *A Novel 8T Cell-Based Subthreshold Static RAM for Ultra-Low Power Platform Applications*. [DOI](https://doi.org/10.3390/electronics9060928)
- *Ultra8T: A sub-threshold 8T SRAM with leakage detection*. [DOI](https://doi.org/10.1016/j.vlsi.2024.102233)
- *Design, Implementation and Analysis of 8T SRAM Cell in Memory Array*. [DOI](https://doi.org/10.14419/ijet.v7i3.1.16808)
- *Performance Analysis of Differential and Single Ended SRAM Cells in Low Power Smart System Applications*. [DOI](https://doi.org/10.2991/978-94-6463-716-8_67)

## Giấy phép

Mã và thiết kế của đồ án dùng [Apache License 2.0](LICENSE). Để chạy lại, cần bộ công cụ Synopsys và PDK `reference90RF` từ môi trường lab.
