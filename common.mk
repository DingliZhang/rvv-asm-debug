RISCV = /home/dingli/toolchain-rvv/riscv64

CROSS_COMPILE = ${RISCV}/bin/riscv64-unknown-linux-gnu-
CFLAGS =  -nostdlib -fno-builtin -march=rv64gcv -g -Wall

QEMU = /home/dingli/qemu-7.2.0-riscv64/bin/qemu-riscv64
QFLAGS = -cpu rv64,v=true,vlen=256,vext_spec=v1.0 -L ${RISCV}/sysroot

GDB = ${CROSS_COMPILE}gdb
CC = ${CROSS_COMPILE}gcc
OBJCOPY = ${CROSS_COMPILE}objcopy
OBJDUMP = ${CROSS_COMPILE}objdump