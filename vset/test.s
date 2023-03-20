# Vset
# 
	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
#	vsetivli t0, 10, e16
#	csrr t1, vtype
#	csrr t2, vl
#	vsetivli t0, 12, e8
#	vsetvl t0, t2, t1
#	vmseq.vv v29,v5,v6,v0.t
    
	# 256 / 8 = 32 bit mask
#	vmv.v.i v1,1
#	vmv.v.i v2,1
#	vsetivli t0, 9, e8
#	vmv1r.v v0 , v2
    vsetvli t0, x0, e8
	vid.v v1
#   byte to short
	vsetvli t0, x0, e16
	vsext.vf2 v0, v1  # dst = src is illegal
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
	vsetvli t0, x0, e8, mf2 # short to byte
    vncvt.x.x.w v3, v0
    
	li t1, 0x100000000000001
	vsetvli t0, x0, e32
	vmv.v.x v5, t1
	#vnsrl.wx v1, v1, x0
#	vmand.mm v2, v1, v2

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
