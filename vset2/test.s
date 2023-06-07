# Vset
# 
	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
    
	vsetvli t0, x0, e32
	vid.v v0
	vid.v v3
	vmerge.vvm v1, v2, v3, v0
	# vslidedown.vi v3,v3,1
	# vxor.vv v3, v3, v3
	vsetvli t0, x0, e32 , mf2 # If no mf2, EMUL will * 2
	# vfwcvt.f.x.v v10, v1
	vfcvt.f.x.v v3 ,v3
	vfwcvt.f.f.v v2, v3  # Widening float  -> double  sew == src  src!= dst

	vsetvli t0, x0, e32 , mf2

	#vfcvt.x.f.v v1, v0

	vfncvt.f.f.w v3, v2  # narrow double  -> float  sew == dst
	vsetvli t0, x0, e16 , mf2
    vfncvt.f.f.w v3, v3  # narrow f  -> hf  sew == dst

	vmv1r.v v0, v3
	vsetvli t0, x0, e64
	vmv1r.v v1, v3
	#vfcvt.x.f.v v3, v2

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
