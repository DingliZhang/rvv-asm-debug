# Vset
# 
	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
    vsetvli t0, x0, e64
    vid.v v0
	vfcvt.f.x.v v1, v0
	vfcvt.x.f.v v2, v1
    vsetvli t0, x0, e32, mf2
	vfncvt.f.f.w v1, v1  # Narrow   double -> float    SEW = 2*SEW op SEW, sew == dst
	vsetvli t0, x0, e32
	vid.v v3
	vfcvt.x.f.v v3,v1

	vsetvli t0, x0, e32, mf2
	vid.v v1
	# vfwcvt.f.x.v v10, v1
	vfcvt.f.x.v v10, v1
	vfwcvt.f.f.v v10, v10  # Widening float  -> double   2*SEW = SEW op SEW, sew == src
    
	vsetvli t0, x0, e32
    vid.v v1
    vfwcvt.f.x.v v28,v29

	vsetvli t0, x0, e64
    vid.v v0
	vfcvt.f.x.v v1,v0

    vsetivli t0, 4, e16
	vmxor.mm v0,v0,v0
   


    vsetvli t0, x0, e8
	vid.v v1
	vxor.vi v0,v0,-1
#   byte to short
	vsetvli t0, x0, e16
	vsext.vf2 v2, v1  # dst = src is illegal
#   byte to int
	vsetvli t0, x0, e32
	vsext.vf4 v0, v1  # dst = src is illegal
#   byte to long
	vsetvli t0, x0, e64
	vsext.vf8 v0, v1  # dst = src is illegal
#	vmxnor.mm v0, v0,v0
#   vadd.vx v2, v0 , x0
#	vmxnor.mm v3, v3,v3
#	vmsne.vx v3, v2 , x0

	
#	vncvt.x.x.w v0, v1
#   vncvt.x.x.w v1, v1

#   clear high part
    vxor.vv v3, v3, v3

	vsetvli t0, x0, e8, m4 # short to byte
    vadd.vv v12, v8, v4
    
	li t1, 0x100000000000001
	vsetvli t0, x0, e32
	vmv.v.x v5, t1
	#vnsrl.wx v1, v1, x0
#	vmand.mm v2, v1, v2

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
