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

    vsetvli t0, x0, e16, mf2
    vfncvt.f.f.w    v1,v1
    






    vsetivli t0, 8, e32
	vid.v v1
    vsetivli t0, 8, e16, mf2
    vncvt.x.x.w v1, v1
	vsetivli t0, 8, e8, mf2 # short to byte
    vncvt.x.x.w v1, v1


	vsetvli t0, x0, e8, mf2
	vid.v v0
    vmv1r.v v2, v1
	vmv.v.v v3, v1
	#vnsrl.wx v1, v1, x0
#	vmand.mm v2, v1, v2

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
