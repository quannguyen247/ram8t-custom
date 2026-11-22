*  Generated for: HSPICE
*  Design library name: ram8t_custom
*  Design cell name: ram8t_cell_test
*  Design view name: schematic



.option PARHIER = LOCAL
.option PORT_VOLTAGE_SCALE_TO_2X = 1

.option ARTIST=2 PSF=2
.temp 25
.include 'reference_models.inc'
.include 'ram8t_cell_test_ic_sch.sp'
*Custom Compiler Version N-2017.12-SP1-2
*Fri Nov 20 23:23:44 2026

.GLOBAL gnd! vdd!
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
* Cell             : ram8t_cell_test
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
c0 rbl gnd! c=10f
m0 rbl pre vdd! vdd! P w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u
+ nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
vpre pre gnd! dc=0 pulse ( 0 0.8 5.5n 100p 100p 3n 10n )
vwblb wblb gnd! dc=0 pulse ( 0.8 0 0 100p 100p 9.9n 20n )
vwbl wbl gnd! dc=0 pulse ( 0 0.8 0 100p 100p 9.9n 20n )
vwwl wwl gnd! dc=0 pulse ( 0 0.8 1n 100p 100p 2n 10n )
vrwl rwl gnd! dc=0 pulse ( 0 0.8 6n 100p 100p 2n 10n )
v0 vdd! gnd! dc=0.8
xi0 rbl rwl wbl wblb wwl ram8t_cell









.tran 10p 20n start=0
.option opfile=1 split_dp=1
.option probe=1
.probe tran v(*) level=1
.probe tran Q=v(xi0.q) v(xi0.q) QB=v(xi0.qb) v(xi0.qb) PRE=v(pre) v(pre)
+ RBL=v(rbl) v(rbl) RWL=v(rwl) v(rwl) WBL=v(wbl) v(wbl) WBLB=v(wblb) v(wblb)
+ WWL=v(wwl) v(wwl)




.measure tran sample_1 find v(rbl) at=7.5n
.measure tran sample_2 find v(rbl) at=17.5n
.end
