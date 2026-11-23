# Verification results

## Hercules

| Block | DRC | LVS comparison | LVS layout report |
| --- | --- | --- | --- |
| `ram8t_cell` | [CLEAN](hercules/ram8t_cell.drc.LAYOUT_ERRORS) | [PASS](hercules/ram8t_cell.lvs.LVS_ERRORS) | [CLEAN](hercules/ram8t_cell.lvs.LAYOUT_ERRORS) |
| `ram8t_array2x2` | [CLEAN](hercules/ram8t_array2x2.drc.LAYOUT_ERRORS) | [PASS](hercules/ram8t_array2x2.lvs.LVS_ERRORS) | [1 ERR_TEXT_OPEN](hercules/ram8t_array2x2.lvs.LAYOUT_ERRORS) |
| `read_sense` | [CLEAN](hercules/read_sense.drc.LAYOUT_ERRORS) | [PASS](hercules/read_sense.lvs.LVS_ERRORS) | [CLEAN](hercules/read_sense.lvs.LAYOUT_ERRORS) |
| `ram8t_full` | [CLEAN](hercules/ram8t_full.drc.LAYOUT_ERRORS) | [PASS](hercules/ram8t_full.lvs.LVS_ERRORS) | [CLEAN](hercules/ram8t_full.lvs.LAYOUT_ERRORS) |

The standalone array LVS report records one net joined by text labels during
layout extraction. The comparison passes. The area table uses the layout
rulers for the [bitcell](../docs/ram8t-cell-layout.png),
[array](../docs/ram8t-array-layout.png) and [macro](../docs/ram8t-full-layout.png).

## StarRC and HSPICE

StarRC reported 131 short entries for the [bitcell](starrc/ram8t_cell.shorts_all.sum)
and 977 for the [macro](starrc/ram8t_full.shorts_all.sum). Entries can repeat a
net pair across geometries or layers.

| RC netlist | No DC path | 1 connection | No Tran path | Floating bulk |
| --- | ---: | ---: | ---: | ---: |
| Bitcell | 26 | 70 | 11 | 8 |
| Macro | 256 | 490 | 190 | 76 |

HSPICE N-2017.12-SP2 passed all 12 readback samples across the schematic and
extracted decks. The checks use LOW ≤ 0.1 × VDD and HIGH ≥ 0.9 × VDD. The
extraction warnings limit quantitative use of the RC results. The readback
check covers the data and addresses driven by the 20 ns testbenches.
The [readback table](hspice/readback.csv) records each sampled voltage.
The [SNM results](hspice/bitcell-snm.ms0) come from the separate DC sweep in the
[simulation procedure](../simulation/README.md#snm-in-custom-compiler).
