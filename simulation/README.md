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
first write. See the [measured readback voltages](../verification/hspice/readback.csv).

## SNM in Custom Compiler

1. Open `ram8t_cell_test/schematic` in the `ram8t_custom` library. In the
   Schematic Editor, choose **Tools > SAE**. In SAE, use **Setup > Design**
   to select `ram8t_cell_test/config` and **Setup > Simulator** to select HSPICE.
2. In **Setup > Model Files**, add the installed
   `PDK/hspice/reference_models.inc` and `simulation/ram8t_cell_test_ic_lay.sp`.
   Set `temp` to 25 in the **Variables** pane. Under **Setup > Analyses**,
   enable `tran` with start 0, step 10 ps and stop 20 ns.
3. In **Setup > Include Files**, add
   [`simulation/snm_include.sp`](snm_include.sp) as type **Options**. The file
   supplies the `.dc` sweep and all three `.measure dc` statements.
4. Enable **Import Measures** at the bottom of **Outputs** and choose
   **Simulation > Netlist and Run**. Read `hold_snm_mv`, `read_snm_mv` and
   `write_snm_mv` in the **Value** column. HSPICE also writes these to
   `hspice.ms0` in the SAE results directory.

The shell commands at the top of this page run `ram8t_cell_postlayout.sp`,
which already includes `snm_include.sp`. Read
`out/ram8t_cell_postlayout.ms0` or see the
[saved measurements](../verification/hspice/bitcell-snm.ms0).

The DC sweep runs at 1.0 V in 1 mV steps. Hold and read both keep WWL low
and WBL, WBLB and RBL high. RWL is low for hold and high for read. The write-0
measurement uses WWL high, RWL low, WBL low and WBLB high. The reported value
is the side length of the square in the remaining butterfly lobe.
