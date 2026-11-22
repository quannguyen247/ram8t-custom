*  Generated for: HSPICE
*  Design library name: ram8t_custom
*  Design cell name: ram8t_full_test
*  Design view name: schematic



.option PARHIER = LOCAL
.option PORT_VOLTAGE_SCALE_TO_2X = 1

.option ARTIST=2 PSF=2
.temp 25
.include 'reference_models.inc'
*Custom Compiler Version N-2017.12-SP1-2
*Sun Nov 22 00:39:11 2026

.GLOBAL gnd! vdd!
********************************************************************************
* Library          : ram8t_custom
* Cell             : inv
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt inv in out
m0 out in gnd! gnd! N w=0.36u l=0.36u nf=1 m=1 ad=79.2f as=79.2f pd=0.8u ps=0.8u
+  nrd=0.6111111111 nrs=0.6111111111 sa=0.22u sb=0.22u sd=0
m1 out in vdd! vdd! P w=1.035u l=0.36u nf=1 m=1 ad=0.2277p as=0.2277p pd=1.475u
+ ps=1.475u nrd=0.2125603865 nrs=0.2125603865 sa=0.22u sb=0.22u sd=0
.ends inv

********************************************************************************
* Library          : ram8t_custom
* Cell             : read_sense
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt read_sense dout preb rbl
mpre rbl preb vdd! vdd! P w=1.035u l=0.36u nf=1 m=1 ad=0.2277p as=0.2277p pd=1.475u
+  ps=1.475u nrd=0.2125603865 nrs=0.2125603865 sa=0.22u sb=0.22u sd=0
xis2 net7 dout inv
xis1 rbl net7 inv
.ends read_sense

********************************************************************************
* Library          : lab3
* Cell             : nand2
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt nand2 a b out
m1 out b net18 gnd! N w=0.36u l=0.36u nf=1 m=1 ad=79.2f as=79.2f pd=0.8u ps=0.8u
+  nrd=0.6111111111 nrs=0.6111111111 sa=0.22u sb=0.22u sd=0
m0 net18 a gnd! gnd! N w=0.36u l=0.36u nf=1 m=1 ad=79.2f as=79.2f pd=0.8u ps=0.8u
+  nrd=0.6111111111 nrs=0.6111111111 sa=0.22u sb=0.22u sd=0
m3 out b vdd! vdd! P w=1.035u l=0.36u nf=1 m=1 ad=0.2277p as=0.2277p pd=1.475u
+ ps=1.475u nrd=0.2125603865 nrs=0.2125603865 sa=0.22u sb=0.22u sd=0
m2 out a vdd! vdd! P w=1.035u l=0.36u nf=1 m=1 ad=0.2277p as=0.2277p pd=1.475u
+ ps=1.475u nrd=0.2125603865 nrs=0.2125603865 sa=0.22u sb=0.22u sd=0
.ends nand2

********************************************************************************
* Library          : ram8t_custom
* Cell             : row_decoder
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt row_decoder a re rwl0 rwl1 we wwl0 wwl1
xn3 re a net20 nand2
xn2 re ab net15 nand2
xn1 we a net10 nand2
xn0 we ab net5 nand2
xi0 a ab inv
xi4 net20 rwl1 inv
xi3 net15 rwl0 inv
xi2 net10 wwl1 inv
xi1 net5 wwl0 inv
.ends row_decoder

********************************************************************************
* Library          : ram8t_custom
* Cell             : write_driver
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt write_driver din wbl wblb
xi1 wblb wbl inv
xi0 din wblb inv
.ends write_driver

********************************************************************************
* Library          : ram8t_custom
* Cell             : ram8t_cell
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt ram8t_cell rbl rwl wbl wblb wwl
mpd1 q qb gnd! gnd! N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u
+ nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpd2 qb q gnd! gnd! N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u
+ nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpg1 wbl wwl q gnd! N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u
+ nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpg2 qb wwl wblb gnd! N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u
+ nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mra2 rbl rwl net5 gnd! N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u
+ nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mra1 net5 qb gnd! gnd! N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u
+ nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpu1 q qb vdd! vdd! P w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u
+ nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpu2 qb q vdd! vdd! P w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u
+ nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
.ends ram8t_cell

********************************************************************************
* Library          : ram8t_custom
* Cell             : ram8t_array2x2
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt ram8t_array2x2 rbl0 rbl1 rwl0 rwl1 wbl0 wbl1 wblb0 wblb1 wwl0 wwl1
xi0 rbl0 rwl0 wbl0 wblb0 wwl0 ram8t_cell
xi1 rbl1 rwl0 wbl1 wblb1 wwl0 ram8t_cell
xi2 rbl0 rwl1 wbl0 wblb0 wwl1 ram8t_cell
xi3 rbl1 rwl1 wbl1 wblb1 wwl1 ram8t_cell
.ends ram8t_array2x2

********************************************************************************
* Library          : ram8t_custom
* Cell             : ram8t_full
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt ram8t_full a din0 din1 dout0 dout1 preb re we
xrs0 dout0 preb rbl0 read_sense
xrs1 dout1 preb rbl1 read_sense
xdec a re rwl0 rwl1 we wwl0 wwl1 row_decoder
xwd0 din0 wbl0 wblb0 write_driver
xwd1 din1 wbl1 wblb1 write_driver
xarr rbl0 rbl1 rwl0 rwl1 wbl0 wbl1 wblb0 wblb1 wwl0 wwl1 ram8t_array2x2
.ends ram8t_full

********************************************************************************
* Library          : ram8t_custom
* Cell             : ram8t_full_test
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
v0 vdd! gnd! dc=1.2
vdin1 din1 gnd! dc=0 pulse ( 1.2 0 0 100p 100p 9.9n 20n )
vdin0 din0 gnd! dc=0 pulse ( 0 1.2 0 100p 100p 9.9n 20n )
vpreb preb gnd! dc=0 pulse ( 0 1.2 5.5n 100p 100p 3n 10n )
vre re gnd! dc=0 pulse ( 0 1.2 6n 100p 100p 2n 10n )
vwe we gnd! dc=0 pulse ( 0 1.2 1n 100p 100p 2n 10n )
va a gnd! dc=0 pulse ( 0 1.2 10n 100p 100p 9.9n 20n )
xdut a din0 din1 dout0 dout1 preb re we ram8t_full
c1 dout1 gnd! c=10f
c0 dout0 gnd! c=10f









.tran 10p 20n start=0
.option opfile=1 split_dp=1
.option probe=1
.probe tran v(*) level=1
.probe tran v(a) v(din0) v(din1) v(dout0) v(dout1) v(preb) v(re) v(we)




.measure tran sample_1 find v(dout0) at=7.5n
.measure tran sample_2 find v(dout1) at=7.5n
.measure tran sample_3 find v(dout0) at=17.5n
.measure tran sample_4 find v(dout1) at=17.5n
.end
