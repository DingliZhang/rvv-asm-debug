# Vset
# 
	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	la x5, _pinfinity		        # array[0] = _pinfinity
    fld fs0, 0(x5)
    #cpop x10, x11
	la x5, _ninfinity		        # array[0] = _ninfinity
    fld fs1, 0(x5)

	la x5, _qnan		        # array[0] = _qnan
    fld fs2, 0(x5)
	vsetvli t0,x0,e64
    vfmv.v.f v1, fs2
	vfsgnjx.vv v2,v1,v1
    
	li x10, 5
	fcvt.d.l fs1, x10

	vsetvli t0,x0,e64
    vfmv.v.f v4, fs0

	feq.d x10, fs0,fs0
#		vfsqrt.v v4,v4
    fmin.d fs3,fs2,fs1
    fadd.d fs0,fs0,fs0

	vid.v v1
	vfcvt.f.x.v v1, v1
	vmv.v.i v2,1
	vmv.v.i v3,1
    li x6 ,3
	fcvt.d.l fs1, x6
    vfmv.s.f v4, fs1
	fadd.d fs2, fs1, fs0

#	vmfeq.vv v0, v1, v1        # Only set where A is not NaN.
 #   vmfeq.vv v5, v4, v4        # Only set where B is not NaN.
 #   vmand.mm v0, v0, v5        # Only set where A and B are ordered,

#	vmflt.vv v2, v1, v4
 #	   vfmin.vv  v2, v1, v4
    vfclass.v v5,v4
    vfredusum.vs v6, v4, v0
    vfadd.vv v2, v4 ,v4
    vmfne.vv v0, v4 ,v4
	csrrw x0, fcsr, x0
	#, v0.t  #  so only set flags on ordered values.
	vmflt.vv v3, v4, v1
	csrrw x0, fcsr, x0
	vmfeq.vv v2, v1, v4
	csrrw x0, fcsr, x0
	vmfne.vv v3, v4, v1
	csrrw x0, fcsr, x0
stop:
	j stop			# Infinite loop to stop execution

## Quiet
#_array:	
#	.int 0xff800000
#	.int 0xffffffff

## signalling NaN
#_array:	
#	.int 0x00000001
#	.int 0x7FF00000
#	.int 0x00000001
#	.int 0x7FF00000
 #  .double 0x7FF0000000000001


## Positive infinity
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