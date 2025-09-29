	.file	"fib_pure.cpp"
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
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB1959:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	lui	a0,%hi(_ZSt3cin)
	addi	a1,sp,28
	addi	a0,a0,%lo(_ZSt3cin)
	sd	ra,40(sp)
	.cfi_offset 1, -8
	call	_ZNSirsERi
	lw	a2,28(sp)
	li	a5,1
	mv	a1,a5
	ble	a2,a5,.L4
	li	a4,0
.L5:
	mv	a3,a1
	addiw	a5,a5,1
	addw	a1,a4,a1
	mv	a4,a3
	bne	a5,a2,.L5
.L4:
	lui	a0,%hi(_ZSt4cout)
	addi	a0,a0,%lo(_ZSt4cout)
	call	_ZNSolsEi
	ld	a4,0(a0)
	mv	a5,a0
	ld	a4,-24(a4)
	add	a4,a0,a4
	ld	a0,240(a4)
	beq	a0,zero,.L13
	lbu	a4,56(a0)
	beq	a4,zero,.L7
	lbu	a1,67(a0)
.L8:
	mv	a0,a5
	call	_ZNSo3putEc
	call	_ZNSo5flushEv
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L7:
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
	beq	a3,a4,.L8
	sd	a5,0(sp)
	jalr	a3
	ld	a5,0(sp)
	mv	a1,a0
	j	.L8
.L13:
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE1959:
	.size	main, .-main
	.ident	"GCC: (g1b306039ac4) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
