# Vset
# 
	.text			# Define beginning of text section
	.global	_start		# Define entry _start
# vlen256 e32 lane8  mask:8bit
_start:

# 	vsetvli t0,x0,e8
# 	vid.v v1
#     vid.v v2
# 	li x1, 170
# 	vmv.v.x v0, x1
# 	vsetivli t0,4,e8
#    vadd.vv v3, v1,v2,v0.t
 ##   vsetvli t0,x0,e8
#	vid.v v1
#   vmsgtu.vi v0, v1,7
#	vrsub.vi v1,v1,0
#    vsra.vi v2, v1, 9
#vsll.vi v2, v1, 9

vsetvli t0,x0,e32
vid.v v1
li x10,1
vsrl.vx v2,v1,x10


stop:
	j stop			# Infinite loop to stop execution
