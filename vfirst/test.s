# Vset
# 
	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
 	vsetvli t0,x0,e8
 	vid.v v0
	vsetivli t0,7,e8
	vfirst.m x10, v0

stop:
	j stop			# Infinite loop to stop execution
