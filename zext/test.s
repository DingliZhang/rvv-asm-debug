# Vset
# 
	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
  li x10,100
  vsetvli t0, x10, e8, m2
  vid.v v6
  vsetvli t0, x0, e16, m4
  vzext.vf2 v4, v6
stop:
	j stop			# Infinite loop to stop execution

_ninfinity:	
	.int 0x00000000 
	.int 0xFFF00000

_pinfinity:	
	.int 0x00000000 
	.int 0x7FF00000

_qnan:	
	.int 0x00000000 
	.int 0x7FF80000

_snan:
	.int 0x00000001 
	.int 0x7FF00000