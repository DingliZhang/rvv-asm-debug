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

 	vsetvli t0, x0, e32   
	li x10, 1
	vmv.v.x v1, x10
    vid.v v2
	li x11,2
	vmacc.vx v1,x11,v2
	vmseq.vx v1,v1,x0


stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
