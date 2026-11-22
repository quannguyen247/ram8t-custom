# Verification results

## Hercules

| Block | DRC | LVS comparison | LVS layout report |
| --- | --- | --- | --- |
| `ram8t_cell` | [CLEAN](hercules/ram8t_cell.drc.LAYOUT_ERRORS) | [PASS](hercules/ram8t_cell.lvs.LVS_ERRORS) | [CLEAN](hercules/ram8t_cell.lvs.LAYOUT_ERRORS) |
| `ram8t_array2x2` | [CLEAN](hercules/ram8t_array2x2.drc.LAYOUT_ERRORS) | [PASS](hercules/ram8t_array2x2.lvs.LVS_ERRORS) | [1 ERR_TEXT_OPEN](hercules/ram8t_array2x2.lvs.LAYOUT_ERRORS) |
| `read_sense` | [CLEAN](hercules/read_sense.drc.LAYOUT_ERRORS) | [PASS](hercules/read_sense.lvs.LVS_ERRORS) | [CLEAN](hercules/read_sense.lvs.LAYOUT_ERRORS) |
| `ram8t_full` | [CLEAN](hercules/ram8t_full.drc.LAYOUT_ERRORS) | [PASS](hercules/ram8t_full.lvs.LVS_ERRORS) | [CLEAN](hercules/ram8t_full.lvs.LAYOUT_ERRORS) |

The standalone array LVS report records one net joined by text labels during
layout extraction. The comparison still passes. The area table in the main
README uses the layout rulers shown in the captures.
[Bitcell](../docs/ram8t-cell-layout.png) · [Array](../docs/ram8t-array-layout.png) · [Macro](../docs/ram8t-full-layout.png)

## StarRC and HSPICE

StarRC reported 131 short entries for the bitcell and 977 for the macro. Entries
can repeat a net pair across geometries or layers.
[Bitcell report](starrc/ram8t_cell.shorts_all.sum) · [Macro report](starrc/ram8t_full.shorts_all.sum)

| RC netlist | No DC path | 1 connection | No Tran path | Floating bulk |
| --- | ---: | ---: | ---: | ---: |
| Bitcell | 26 | 70 | 11 | 8 |
| Macro | 256 | 490 | 190 | 76 |

HSPICE N-2017.12-SP2 passed all 12 readback samples across the schematic and
extracted decks. The checks use LOW ≤ 0.1 × VDD and HIGH ≥ 0.9 × VDD. The
extraction warnings limit quantitative use of the RC results. The readback
check covers the data and addresses driven by the 20 ns testbenches.
[Readback voltages](hspice/readback.csv) · [SNM measurements](hspice/bitcell-snm.ms0) · [Simulation procedure](../simulation/README.md)
