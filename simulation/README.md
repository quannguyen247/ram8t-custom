# HSPICE simulation

Run from the repository root with HSPICE on `PATH` and the `reference90RF` PDK
under `PDK/`. If the PDK is installed elsewhere, use its model path in the
`ln` command. The decks were exported from Custom Compiler N-2017.12-SP1-2
and verified with HSPICE N-2017.12-SP2.

```sh
(
    set -e
    cd simulation
    if [ ! -e reference_models.inc ]; then
        ln -sfn ../PDK/hspice/reference_models.inc reference_models.inc
    fi
    if [ ! -f reference_models.inc ] || [ ! -r reference_models.inc ]; then
        printf '%s\n' 'Set reference_models.inc to the installed PDK model file.' >&2
        exit 1
    fi
    mkdir -p out
    for deck in ram8t_*schematic.sp ram8t_*postlayout.sp; do
        hspice -i "$deck" -o "out/${deck%.sp}"
    done
)
```

Read the `.measure` results in `out/*.lis` or open `out/*.tr0` in WaveView.
Both benches run for 20 ns at 25 °C and sample outputs at 7.5 ns and 17.5 ns.

| Decks | Supply and load | Expected readback |
| --- | --- | --- |
| `ram8t_cell_schematic.sp`, `ram8t_cell_postlayout.sp` | 0.8 V, 10 fF on RBL | RBL reads 1, then 0 |
| `ram8t_full_schematic.sp`, `ram8t_full_postlayout.sp` | 1.2 V, 10 fF per DOUT | DOUT0/DOUT1 read `10`, then `01` |

The bitcell decks load `ram8t_cell_test_ic_sch.sp` or
`ram8t_cell_test_ic_lay.sp` to put the latch in the opposite state before the
first write. [Measured readback voltages](../verification/hspice/readback.csv)

## SNM

The bitcell post-layout deck also includes `snm_include.sp`. It runs a separate
DC sweep at 1.0 V using the bitcell's transistor sizes and independent nodes.
The SNM measurement circuit has no StarRC parasitic elements.

`hold_snm_mv` and `read_snm_mv` measure the butterfly square for their respective
wordline settings. `write_snm_mv` measures the square in the remaining lobe
while forcing a write of 0 with WWL high, WBL low, and WBLB high.
[HSPICE DC measurements](../verification/hspice/bitcell-snm.ms0)
