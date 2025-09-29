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
.LFB1959:
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	a1,sp,12
	lui	a0,%hi(_ZSt3cin)
	addi	a0,a0,%lo(_ZSt3cin)
	call	_ZNSirsERi
	li	a1,0
	lui	s0,%hi(_ZSt4cout)
	addi	a0,s0,%lo(_ZSt4cout)
	call	_ZNSolsEi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	li	a1,1
	addi	a0,s0,%lo(_ZSt4cout)
	call	_ZNSolsEi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	lw	a4,12(sp)
	li	a5,1
	ble	a4,a5,.L2
	sd	s1,56(sp)
	sd	s2,48(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	sd	s6,16(sp)
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	mv	s3,a5
	mv	s2,a5
	li	a1,0
	addi	s5,s0,%lo(_ZSt4cout)
	li	s6,10
	j	.L6
.L10:
	call	_ZSt16__throw_bad_castv
.L4:
	mv	a0,s1
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	ld	a5,0(s1)
	ld	a5,48(a5)
	mv	a1,s6
	mv	a0,s1
	jalr	a5
	mv	a1,a0
.L5:
	mv	a0,s0
	call	_ZNSo3putEc
	call	_ZNSo5flushEv
	mv	a1,s4
	lw	a5,12(sp)
	ble	a5,s3,.L9
.L6:
	mv	s4,s2
	addw	a1,s2,a1
	mv	s2,a1
	addiw	s3,s3,1
	mv	a0,s5
	call	_ZNSolsEi
	mv	s0,a0
	ld	a5,0(a0)
	ld	a5,-24(a5)
	add	a5,a0,a5
	ld	s1,240(a5)
	beq	s1,zero,.L10
	lbu	a5,56(s1)
	beq	a5,zero,.L4
	lbu	a1,67(s1)
	j	.L5
.L9:
	ld	s1,56(sp)
	.cfi_restore 9
	ld	s2,48(sp)
	.cfi_restore 18
	ld	s3,40(sp)
	.cfi_restore 19
	ld	s4,32(sp)
	.cfi_restore 20
	ld	s5,24(sp)
	.cfi_restore 21
	ld	s6,16(sp)
	.cfi_restore 22
.L2:
	li	a0,0
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1959:
	.size	main, .-main
	.ident	"GCC: (g1b306039ac4) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
