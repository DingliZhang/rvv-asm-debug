display/t $v0
display/t $v1
display/t $v2
display/t $v3
display/t $vtype

set disassemble-next-line on
b _start
target remote : 12345
