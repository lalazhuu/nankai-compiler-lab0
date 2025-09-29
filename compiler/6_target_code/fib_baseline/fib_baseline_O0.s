	.file	"fib_baseline.cpp"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB1957:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	zero,-20(s0)
	li	a5,1
	sw	a5,-24(s0)
	li	a5,1
	sw	a5,-28(s0)
	addi	a5,s0,-36
	mv	a1,a5
	lui	a5,%hi(_ZSt3cin)
	addi	a0,a5,%lo(_ZSt3cin)
	call	_ZNSirsERi
	lw	a5,-20(s0)
	mv	a1,a5
	lui	a5,%hi(_ZSt4cout)
	addi	a0,a5,%lo(_ZSt4cout)
	call	_ZNSolsEi
	mv	a4,a0
	lui	a5,%hi(_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
	addi	a1,a5,%lo(_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
	mv	a0,a4
	call	_ZNSolsEPFRSoS_E
	lw	a5,-24(s0)
	mv	a1,a5
	lui	a5,%hi(_ZSt4cout)
	addi	a0,a5,%lo(_ZSt4cout)
	call	_ZNSolsEi
	mv	a4,a0
	lui	a5,%hi(_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
	addi	a1,a5,%lo(_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
	mv	a0,a4
	call	_ZNSolsEPFRSoS_E
	j	.L2
.L3:
	lw	a5,-24(s0)
	sw	a5,-32(s0)
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-20(s0)
	addw	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-32(s0)
	sw	a5,-20(s0)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	mv	a1,a5
	lui	a5,%hi(_ZSt4cout)
	addi	a0,a5,%lo(_ZSt4cout)
	call	_ZNSolsEi
	mv	a4,a0
	lui	a5,%hi(_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
	addi	a1,a5,%lo(_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
	mv	a0,a4
	call	_ZNSolsEPFRSoS_E
.L2:
	lw	a5,-36(s0)
	lw	a4,-28(s0)
	sext.w	a4,a4
	blt	a4,a5,.L3
	li	a5,0
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1957:
	.size	main, .-main
	.ident	"GCC: (g1b306039ac4) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
