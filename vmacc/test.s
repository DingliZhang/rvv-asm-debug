# Vset
# 
	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:

    vsetvli t0, x0, e32
    vid.v v1
	li x10, 0x0000000100000001
	vmacc.vx v2, x10, v1
#	vmv.v.x v3, x10
    vmset.m v0
	vmerge.vxm v3, v3, x10 ,v0
stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
