* --- BEGIN ADDED SNM MEASUREMENT BLOCK (VDD = 1.0 V) ---
vsup_s vdd_s 0 dc=1.0
vzero_s zero_s 0 dc=0
vx_s vx_s 0 dc=0
* 1) Hold SNM @ 1.0V (WWL=0, RWL=0, WBL=WBLB=RBL=1.0V)
mpd2_h qb_h vx_s 0 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpu2_h qb_h vx_s vdd_s vdd_s P w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpg2_h qb_h zero_s vdd_s 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mra1_h n5_h qb_h 0 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mra2_h vdd_s zero_s n5_h 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpd1_h qa_h x2_h 0 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpu1_h qa_h x2_h vdd_s vdd_s P w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpg1_h vdd_s zero_s qa_h 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
e_fb_h x2_u_h 0 vol='10000*((v(qb_h)-v(vx_s))-(v(x2_u_h)-v(qa_h)))'
e_x2_h x2_h 0 vol='min(1.0, max(0.0, v(x2_u_h)))'
e_snm_h snm_h 0 vol='1000*(v(qb_h)-v(x2_h))'
* 2) Read SNM @ 1.0V (WWL=0, RWL=1.0V, WBL=WBLB=RBL=1.0V)
mpd2_r qb_r vx_s 0 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpu2_r qb_r vx_s vdd_s vdd_s P w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpg2_r qb_r zero_s vdd_s 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mra1_r n5_r qb_r 0 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mra2_r vdd_s vdd_s n5_r 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpd1_r qa_r x2_r 0 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpu1_r qa_r x2_r vdd_s vdd_s P w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpg1_r vdd_s zero_s qa_r 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
e_fb_r x2_u_r 0 vol='10000*((v(qb_r)-v(vx_s))-(v(x2_u_r)-v(qa_r)))'
e_x2_r x2_r 0 vol='min(1.0, max(0.0, v(x2_u_r)))'
e_snm_r snm_r 0 vol='1000*(v(qb_r)-v(x2_r))'
* 3) Write SNM @ 1.0V (WWL=1.0V, RWL=0, WBL=0, WBLB=1.0V)
mpd2_w qb_w vx_s 0 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpu2_w qb_w vx_s vdd_s vdd_s P w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpg2_w qb_w vdd_s vdd_s 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpd1_w qa_w x2_w 0 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpu1_w qa_w x2_w vdd_s vdd_s P w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
mpg1_w zero_s vdd_s qa_w 0 N w=0.2u l=0.1u nf=1 m=1 ad=44f as=44f pd=0.64u ps=0.64u nrd=1.1 nrs=1.1 sa=0.22u sb=0.22u sd=0
e_fb_w x2_u_w 0 vol='10000*((v(qb_w)-v(vx_s))-(v(x2_u_w)-v(qa_w)))'
e_x2_w x2_w 0 vol='min(1.0, max(0.0, v(x2_u_w)))'
e_snm_w snm_w 0 vol='1000*(v(qb_w)-v(x2_w))'
.dc vx_s 0 1.0 1m
.probe dc v(qb_r) v(qa_r) v(qb_w) v(qa_w)
.measure dc hold_snm_mv max v(snm_h)
.measure dc read_snm_mv max v(snm_r)
.measure dc write_snm_mv max v(snm_w)
* --- END ADDED SNM MEASUREMENT BLOCK ---
