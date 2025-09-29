	.file	"fib_pure.cpp"
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
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	addi	a1,sp,12
	lui	a0,%hi(_ZSt3cin)
	addi	a0,a0,%lo(_ZSt3cin)
	call	_ZNSirsERi
	lw	a2,12(sp)
	li	a5,1
	ble	a2,a5,.L4
	mv	a1,a5
	li	a4,0
.L3:
	mv	a3,a1
	addw	a1,a4,a1
	addiw	a5,a5,1
	mv	a4,a3
	bne	a5,a2,.L3
.L2:
	lui	a0,%hi(_ZSt4cout)
	addi	a0,a0,%lo(_ZSt4cout)
	call	_ZNSolsEi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	li	a0,0
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L4:
	.cfi_restore_state
	li	a1,1
	j	.L2
	.cfi_endproc
.LFE1959:
	.size	main, .-main
	.ident	"GCC: (g1b306039ac4) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
