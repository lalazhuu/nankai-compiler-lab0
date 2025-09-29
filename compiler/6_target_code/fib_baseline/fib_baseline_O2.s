	.file	"fib_baseline.cpp"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align	1
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1709:
	.cfi_startproc
	mv	a0,a1
	ret
	.cfi_endproc
.LFE1709:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.align	1
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB2500:
	.cfi_startproc
	ld	a4,0(a0)
	mv	a5,a0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	ld	a4,-24(a4)
	sd	ra,24(sp)
	.cfi_offset 1, -8
	add	a4,a0,a4
	ld	a0,240(a4)
	beq	a0,zero,.L9
	lbu	a4,56(a0)
	beq	a4,zero,.L5
	lbu	a1,67(a0)
.L6:
	mv	a0,a5
	call	_ZNSo3putEc
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_ZNSo5flushEv
.L5:
	.cfi_restore_state
	sd	a5,8(sp)
	sd	a0,0(sp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	ld	a0,0(sp)
	lui	a4,%hi(_ZNKSt5ctypeIcE8do_widenEc)
	addi	a4,a4,%lo(_ZNKSt5ctypeIcE8do_widenEc)
	ld	a3,0(a0)
	ld	a5,8(sp)
	li	a1,10
	ld	a3,48(a3)
	beq	a3,a4,.L6
	sd	a5,0(sp)
	jalr	a3
	ld	a5,0(sp)
	mv	a1,a0
	j	.L6
.L9:
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE2500:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB1959:
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	lui	a0,%hi(_ZSt3cin)
	addi	a1,sp,12
	addi	a0,a0,%lo(_ZSt3cin)
	sd	ra,72(sp)
	sd	s3,40(sp)
	sd	s5,24(sp)
	.cfi_offset 1, -8
	.cfi_offset 19, -40
	.cfi_offset 21, -56
	call	_ZNSirsERi
	lui	s5,%hi(_ZSt4cout)
	li	a1,0
	addi	a0,s5,%lo(_ZSt4cout)
	call	_ZNSolsEi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	li	a1,1
	addi	a0,s5,%lo(_ZSt4cout)
	call	_ZNSolsEi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	lw	a5,12(sp)
	li	s3,1
	ble	a5,s3,.L11
	sd	s6,16(sp)
	.cfi_offset 22, -64
	lui	s6,%hi(_ZNKSt5ctypeIcE8do_widenEc)
	sd	s1,56(sp)
	sd	s0,64(sp)
	sd	s2,48(sp)
	sd	s4,32(sp)
	.cfi_offset 9, -24
	.cfi_offset 8, -16
	.cfi_offset 18, -32
	.cfi_offset 20, -48
	addi	s5,s5,%lo(_ZSt4cout)
	mv	s1,s3
	addi	s6,s6,%lo(_ZNKSt5ctypeIcE8do_widenEc)
	li	a5,0
	j	.L15
.L21:
	lbu	a1,67(s0)
.L14:
	mv	a0,s2
	call	_ZNSo3putEc
	call	_ZNSo5flushEv
	lw	a4,12(sp)
	mv	a5,s4
	ble	a4,s3,.L19
.L15:
	mv	s4,s1
	addw	s1,s1,a5
	mv	a1,s1
	mv	a0,s5
	call	_ZNSolsEi
	ld	a5,0(a0)
	addiw	s3,s3,1
	mv	s2,a0
	ld	a5,-24(a5)
	add	a5,a0,a5
	ld	s0,240(a5)
	beq	s0,zero,.L20
	lbu	a5,56(s0)
	bne	a5,zero,.L21
	mv	a0,s0
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	ld	a5,0(s0)
	li	a1,10
	ld	a5,48(a5)
	beq	a5,s6,.L14
	mv	a0,s0
	jalr	a5
	mv	a1,a0
	mv	a0,s2
	call	_ZNSo3putEc
	call	_ZNSo5flushEv
	lw	a4,12(sp)
	mv	a5,s4
	bgt	a4,s3,.L15
.L19:
	ld	s0,64(sp)
	.cfi_restore 8
	ld	s1,56(sp)
	.cfi_restore 9
	ld	s2,48(sp)
	.cfi_restore 18
	ld	s4,32(sp)
	.cfi_restore 20
	ld	s6,16(sp)
	.cfi_restore 22
.L11:
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s3,40(sp)
	.cfi_restore 19
	ld	s5,24(sp)
	.cfi_restore 21
	li	a0,0
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.L20:
	.cfi_def_cfa_offset 80
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE1959:
	.size	main, .-main
	.ident	"GCC: (g1b306039ac4) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
