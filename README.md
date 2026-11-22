# SRAM 8T 2×2

Đồ án CE226 của Nguyen Dong Quan. Mạch SRAM full-custom dùng PDK `reference90RF` (90 nm), tổ chức thành hai từ, mỗi từ hai bit. Thư viện OpenAccess có schematic, symbol và layout của bitcell, mảng 2×2, mạch ngoại vi và macro `ram8t_full`.

![Layout ram8t_full](docs/images/ram8t-full-layout.png)

## Đọc và ghi

Bitcell gồm latch 6T và hai NMOS dành riêng cho đường đọc. Khi ghi, `WE` và địa chỉ `A` chọn một đường `WWL`. Hai write driver đưa `DIN0` và `DIN1` lên các cặp `WBL/WBLB`.

Trước khi đọc, đặt `PREB = 0` để nạp cả hai `RBL` lên VDD. Đưa `PREB` lên 1 rồi bật `RE` để chọn `RWL` theo địa chỉ. Bit lưu 0 làm `RBL` xả xuống GND. Bit lưu 1 giữ `RBL` ở mức cao. Hai tầng inverter trong `read_sense` đưa mức logic đó ra `DOUT`. Testbench cấp `A`, `WE`, `RE` và `PREB` từ bên ngoài.

## Mở dự án

Clone repo, đặt bộ PDK đã cài tại `PDK/reference90RF` hoặc sửa đường dẫn trong `lib.defs`. Mở Custom Compiler từ thư mục repo. Trong Library Manager, chọn `ram8t_custom/ram8t_full` để xem mạch hoàn chỉnh hoặc `ram8t_full_test/schematic` để xem chu kỳ ghi và đọc. View `config` của testbench chọn view `starrc` cho DUT. Decoder dùng cell NAND2 ở `lab3/nand2` đi kèm repo.

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

Hercules báo DRC sạch và phép so khớp LVS đạt trên bitcell, mảng 2×2 và macro. Báo cáo trích layout của riêng mảng 2×2 có một `ERR_TEXT_OPEN`. StarRC cũng ghi các mục báo chập khi trích RC cho bitcell và macro. [Báo cáo kiểm tra](verification/README.md).

Testbench HSPICE chạy chu kỳ 20 ns. Bitcell lần lượt đọc lại 1 và 0 ở 0.8 V, với tải RBL 10 fF. Macro ghi `10` vào hàng 0 và `01` vào hàng 1 ở 1.2 V, rồi đọc lại đúng hai từ với tải 10 fF trên mỗi DOUT. Cả hai testbench có deck schematic và deck trích RC. [Dạng sóng macro sau trích RC](docs/images/ram8t-full-postlayout.png).

Ở 1.0 V và 25 °C, phép quét DC cho Hold SNM 307.197 mV và Read SNM 307.199 mV. Số 435.000 mV là cạnh vuông của thùy còn lại khi ép ghi 0. Mạch đo dùng các transistor dựng riêng theo sizing của bitcell và chạy cùng deck transient, với các nút riêng biệt với netlist StarRC. [Thiết lập phép đo](simulation/README.md).

## Tài liệu tham khảo

- *A Novel 8T Cell-Based Subthreshold Static RAM for Ultra-Low Power Platform Applications*. [DOI](https://doi.org/10.3390/electronics9060928)
- *Ultra8T: A sub-threshold 8T SRAM with leakage detection*. [DOI](https://doi.org/10.1016/j.vlsi.2024.102233)
- *Design, Implementation and Analysis of 8T SRAM Cell in Memory Array*. [DOI](https://doi.org/10.14419/ijet.v7i3.1.16808)
- *Performance Analysis of Differential and Single Ended SRAM Cells in Low Power Smart System Applications*. [DOI](https://doi.org/10.2991/978-94-6463-716-8_67)

## Giấy phép

Mã và thiết kế của đồ án dùng [Apache License 2.0](LICENSE). Để chạy lại, cần bộ công cụ Synopsys và PDK `reference90RF` từ môi trường lab.
