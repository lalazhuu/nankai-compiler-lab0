	.file	"bubble_sort_ref.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
	li	a5,1
	ble	a1,a5,.L1
	addiw	a5,a1,-2
	slli	a4,a1,2
	slli	a3,a5,32
	addi	a1,a0,-8
	srli	a5,a3,30
	add	a1,a1,a4
	addi	a2,a0,-4
	sub	a1,a1,a5
	add	a2,a2,a4
.L3:
	mv	a5,a0
.L5:
	lw	a4,0(a5)
	lw	a3,4(a5)
	ble	a4,a3,.L4
	sw	a3,0(a5)
	sw	a4,4(a5)
.L4:
	addi	a5,a5,4
	bne	a5,a2,.L5
	addi	a2,a2,-4
	bne	a2,a1,.L3
.L1:
	ret
	.size	bubble_sort, .-bubble_sort
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	s0,0(sp)
	lui	s0,%hi(data_array)
	addi	a0,s0,%lo(data_array)
	sd	ra,8(sp)
	call	getarray
	mv	a1,a0
	addi	a0,s0,%lo(data_array)
	call	bubble_sort
	ld	ra,8(sp)
	ld	s0,0(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.globl	data_array
	.bss
	.align	3
	.type	data_array, @object
	.size	data_array, 200000
data_array:
	.zero	200000
	.ident	"GCC: (g1b306039ac4) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
