display $v0
display $v1
display $v2
display $v3
display $vtype

set disassemble-next-line on
b _start
target remote : 12345
