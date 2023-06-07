# Vset
# 
	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:

#    BasicType bt = Matcher::vector_element_basic_type(this);
#    Assembler::SEW sew = Assembler::elemtype_to_sew(bt);
#    __ rvv_vsetvli(bt, Matcher::vector_length_in_bytes(this));
#    __ vmv_v_x(as_VectorRegister($dst$$reg), as_Register($src1$$reg));
#    __ vid_v(as_VectorRegister($tmp1$$reg));
#    __ li(as_Register($tmp2$$reg), (int)($src2$$constant));
#    __ vmacc_vx(as_VectorRegister($dst$$reg), as_Register($tmp2$$reg), as_VectorRegister($tmp1$$reg));

 	vsetvli t0, x0, e8   
    vid.v v2
#		vsra.vi v2, v2 , 2
	vsetvli t0, x0, e8
#	vmor.mm v0, v1, v2
    vcpop.m x10, v2
	vsetivli t0, 16, e8   
    vcpop.m x10, v2
	vcompress.vm v0, v2, v1
	vfirst.m x10, v0
	vsetivli t0, 1, e8
    vslidedown.vi v2,v2,3 

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
