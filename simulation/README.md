# Mô phỏng HSPICE

Các deck được xuất từ Custom Compiler N-2017.12-SP1-2 và chạy bằng HSPICE N-2017.12-SP2. Đường dẫn `.include` dùng tên file cục bộ để có thể chạy ngoài VM. Các lệnh `.measure tran` lấy mẫu đầu ra tại 7.5 ns và 17.5 ns trong hai cửa sổ đọc.

Từ thư mục gốc của repo, chạy với file model của PDK đang dùng trong lab.

```sh
cd simulation
ln -s /path/to/PDK/hspice/reference_models.inc .
mkdir -p out

for deck in ram8t_*schematic.sp ram8t_*postlayout.sp; do
    hspice -i "$deck" -o "out/${deck%.sp}" || break
done
```

Mở `out/*.lis` để đọc các phép đo, hoặc mở `out/*.tr0` trong WaveView. [Bảng giá trị đọc lại](../verification/hspice/readback.csv).

| Deck | Nguồn và tải | Dữ liệu đọc |
| --- | --- | --- |
| `ram8t_cell_schematic.sp`, `ram8t_cell_postlayout.sp` | 0.8 V, 10 fF trên RBL | RBL đọc 1 ở 7.5 ns và 0 ở 17.5 ns |
| `ram8t_full_schematic.sp`, `ram8t_full_postlayout.sp` | 1.2 V, 10 fF trên mỗi DOUT | DOUT0/DOUT1 đọc `10` ở 7.5 ns và `01` ở 17.5 ns |

Các phép transient chạy ở 25 °C trong 20 ns. Hai file `ram8t_cell_test_ic_*.sp` đặt trạng thái ban đầu để xung ghi 1 đầu tiên làm latch đổi trạng thái.

## Phép đo SNM

`ram8t_cell_postlayout.sp` gọi thêm `snm_include.sp`. Phần này dựng các mạch DC ở 1.0 V từ transistor có cùng sizing với bitcell. Nút đo DC tách riêng khỏi instance StarRC, nên bảng SNM mô tả mạch DC theo model transistor. `hold_snm_mv` và `read_snm_mv` lấy cạnh vuông theo đường butterfly ở hai cấu hình wordline. `write_snm_mv` đo cạnh vuông của thùy còn lại khi `WWL = 1`, `WBL = 0` và `WBLB = 1`. Giá trị này phụ thuộc quy ước đo. [Kết quả HSPICE](../verification/hspice/bitcell-snm.ms0).
