# Kiểm tra thiết kế

## Hercules

| Khối | DRC | So khớp LVS | Báo cáo layout khi chạy LVS |
| --- | --- | --- | --- |
| `ram8t_cell` | [CLEAN](hercules/ram8t_cell.drc.LAYOUT_ERRORS) | [PASS](hercules/ram8t_cell.lvs.LVS_ERRORS) | [CLEAN](hercules/ram8t_cell.lvs.LAYOUT_ERRORS) |
| `ram8t_array2x2` | [CLEAN](hercules/ram8t_array2x2.drc.LAYOUT_ERRORS) | [PASS](hercules/ram8t_array2x2.lvs.LVS_ERRORS) | [1 ERR_TEXT_OPEN](hercules/ram8t_array2x2.lvs.LAYOUT_ERRORS) |
| `read_sense` | [CLEAN](hercules/read_sense.drc.LAYOUT_ERRORS) | [PASS](hercules/read_sense.lvs.LVS_ERRORS) | [CLEAN](hercules/read_sense.lvs.LAYOUT_ERRORS) |
| `ram8t_full` | [CLEAN](hercules/ram8t_full.drc.LAYOUT_ERRORS) | [PASS](hercules/ram8t_full.lvs.LVS_ERRORS) | [CLEAN](hercules/ram8t_full.lvs.LAYOUT_ERRORS) |

Các báo cáo lấy từ lần chạy Hercules đã lưu trên VM. `ERR_TEXT_OPEN` cho biết công cụ đã nối các phần của một net theo nhãn khi trích mảng. Kết quả so khớp LVS của mảng vẫn là PASS.

Diện tích trong README lấy theo kích thước đo bằng thước layout trong báo cáo đồ án. [Bitcell](../docs/images/ram8t-cell-layout.png) · [Mảng 2×2](../docs/images/ram8t-array-layout.png) · [Macro](../docs/images/ram8t-full-layout.png).

## StarRC và HSPICE

StarRC lưu 131 dòng báo chập cho bitcell và 977 dòng cho macro. Một cặp net có thể xuất hiện ở nhiều dòng hoặc lớp. [Bitcell](starrc/ram8t_cell.shorts_all.sum) · [Macro](starrc/ram8t_full.shorts_all.sum).

| Netlist RC | No DC path | 1 connection | No Tran path | Floating bulk |
| --- | ---: | ---: | ---: | ---: |
| Bitcell | 26 | 70 | 11 | 8 |
| Macro | 256 | 490 | 190 | 76 |

Bốn deck hoàn thành trong HSPICE N-2017.12-SP2. Tất cả 12 mẫu đọc đạt ở hai thời điểm kiểm tra. Quy ước đối chiếu là LOW ≤ 0.1 × VDD và HIGH ≥ 0.9 × VDD. Cảnh báo về kết nối và thân transistor giới hạn độ tin cậy của các phép đo định lượng trên netlist RC. Phạm vi kiểm tra ở đây là các mẫu đọc của testbench 20 ns. [Điện áp từng mẫu](hspice/readback.csv) · [Kết quả SNM](hspice/bitcell-snm.ms0) · [Cách chạy](../simulation/README.md).
