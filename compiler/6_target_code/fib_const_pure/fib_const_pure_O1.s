	.file	"fib_const_pure.cpp"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB1959:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	li	a4,9
	li	a5,1
	li	a3,0
.L2:
	mv	a2,a5
	addw	a1,a3,a5
	mv	a5,a1
	addiw	a4,a4,-1
	mv	a3,a2
	bne	a4,zero,.L2
	lui	a0,%hi(_ZSt4cout)
	addi	a0,a0,%lo(_ZSt4cout)
	call	_ZNSolsEi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	li	a0,0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1959:
	.size	main, .-main
	.ident	"GCC: (g1b306039ac4) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
