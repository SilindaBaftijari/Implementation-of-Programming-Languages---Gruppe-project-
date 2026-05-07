	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function mul
f.mul:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_1_,x10
# 	mv	_param_y_2_,x11
# 	mv	_eq_L_8_,_param_x_1_
	li	x13, 0
# was:	li	_eq_R_9_, 0
	li	x12, 0
# was:	li	_cond_7_, 0
	bne	x10, x13, l.false_10_
# was:	bne	_eq_L_8_, _eq_R_9_, l.false_10_
	li	x12, 1
# was:	li	_cond_7_, 1
l.false_10_:
	bne	x12, x0, l.then_4_
# was:	bne	_cond_7_, x0, l.then_4_
	j	l.else_5_
l.then_4_:
	li	x10, 0
# was:	li	_mulres_3_, 0
	j	l.endif_6_
l.else_5_:
# 	mv	_lt_L_15_,_param_x_1_
	li	x12, 0
# was:	li	_lt_R_16_, 0
	slt	x12, x10, x12
# was:	slt	_cond_14_, _lt_L_15_, _lt_R_16_
	bne	x12, x0, l.then_11_
# was:	bne	_cond_14_, x0, l.then_11_
	j	l.else_12_
l.then_11_:
	li	x18, 0
# was:	li	_minus_L_17_, 0
	li	x12, 0
# was:	li	_minus_L_20_, 0
# 	mv	_minus_R_21_,_param_x_1_
	sub	x10, x12, x10
# was:	sub	_arg_19_, _minus_L_20_, _minus_R_21_
# 	mv	_arg_22_,_param_y_2_
# 	mv	x10,_arg_19_
# 	mv	x11,_arg_22_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_minus_R_18_,x10
	sub	x10, x18, x10
# was:	sub	_mulres_3_, _minus_L_17_, _minus_R_18_
	j	l.endif_13_
l.else_12_:
	mv	x18, x11
# was:	mv	_plus_L_23_, _param_y_2_
# 	mv	_minus_L_26_,_param_x_1_
	li	x12, 1
# was:	li	_minus_R_27_, 1
	sub	x10, x10, x12
# was:	sub	_arg_25_, _minus_L_26_, _minus_R_27_
# 	mv	_arg_28_,_param_y_2_
# 	mv	x10,_arg_25_
# 	mv	x11,_arg_28_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_24_,x10
	add	x10, x18, x10
# was:	add	_mulres_3_, _plus_L_23_, _plus_R_24_
l.endif_13_:
l.endif_6_:
# 	mv	x10,_mulres_3_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function readInt
f.readInt:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_d_29_,x10
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_readIntres_30_,x10
# 	mv	x10,_readIntres_30_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -20
	jal	p.getint
# was:	jal	p.getint, 
	mv	x12, x10
# was:	mv	_let_n_32_, x10
	li	x10, 0
# was:	li	_lt_L_37_, 0
# 	mv	_lt_R_38_,_let_n_32_
	slt	x10, x10, x12
# was:	slt	_cond_36_, _lt_L_37_, _lt_R_38_
	bne	x10, x0, l.then_33_
# was:	bne	_cond_36_, x0, l.then_33_
	j	l.else_34_
l.then_33_:
# 	mv	_size_44_,_let_n_32_
	bge	x12, x0, l.safe_45_
# was:	bge	_size_44_, x0, l.safe_45_
	li	x10, 14
# was:	li	x10, 14
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_45_:
	mv	x10, x3
# was:	mv	_arr_41_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_50_, _size_44_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_50_, _tmp_50_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_50_
	sw	x12, 0(x10)
# was:	sw	_size_44_, 0(_arr_41_)
	addi	x11, x10, 4
# was:	addi	_addr_46_, _arr_41_, 4
	mv	x13, x0
# was:	mv	_i_47_, x0
l.loop_beg_48_:
	bge	x13, x12, l.loop_end_49_
# was:	bge	_i_47_, _size_44_, l.loop_end_49_
	sw	x13, 0(x11)
# was:	sw	_i_47_, 0(_addr_46_)
	addi	x11, x11, 4
# was:	addi	_addr_46_, _addr_46_, 4
	addi	x13, x13, 1
# was:	addi	_i_47_, _i_47_, 1
	j	l.loop_beg_48_
l.loop_end_49_:
	lw	x18, 0(x10)
# was:	lw	_size_40_, 0(_arr_41_)
	mv	x11, x3
# was:	mv	_let_arr_39_, x3
	slli	x12, x18, 2
# was:	slli	_tmp_55_, _size_40_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_55_, _tmp_55_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_55_
	sw	x18, 0(x11)
# was:	sw	_size_40_, 0(_let_arr_39_)
	addi	x19, x11, 4
# was:	addi	_addrg_51_, _let_arr_39_, 4
	mv	x20, x0
# was:	mv	_i_52_, x0
	addi	x21, x10, 4
# was:	addi	_elem_42_, _arr_41_, 4
l.loop_beg_53_:
	bge	x20, x18, l.loop_end_54_
# was:	bge	_i_52_, _size_40_, l.loop_end_54_
	lw	x10, 0(x21)
# was:	lw	_res_43_, 0(_elem_42_)
	addi	x21, x21, 4
# was:	addi	_elem_42_, _elem_42_, 4
# 	mv	x10,_res_43_
	jal	f.readInt
# was:	jal	f.readInt, x10
# 	mv	_res_43_,x10
	sw	x10, 0(x19)
# was:	sw	_res_43_, 0(_addrg_51_)
	addi	x19, x19, 4
# was:	addi	_addrg_51_, _addrg_51_, 4
	addi	x20, x20, 1
# was:	addi	_i_52_, _i_52_, 1
	j	l.loop_beg_53_
l.loop_end_54_:
	li	x10, 0
# was:	li	_mainres_31_, 0
	j	l.endif_35_
l.else_34_:
	la	x10, s.Incorre_58_
# was:	la	_tmp_57_, s.Incorre_58_
# s.Incorre_58_: string "Incorrect Input!"
# 	mv	_let_x_56_,_tmp_57_
# 	mv	x10,_tmp_57_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 0
# was:	li	_mainres_31_, 0
l.endif_35_:
# 	mv	x10,_mainres_31_
	addi	x2, x2, 20
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Library functions in Fasto namespace
f.ord:
	mv	x10, x10
	jr	x1
f.chr:
	andi	x10, x10, 255
	jr	x1
# Internal procedures (for syscalls, etc.)
p.putint:
	li	x17, 1
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getint:
	li	x17, 5
	ecall
	jr	x1
p.putchar:
	li	x17, 11
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getchar:
	li	x17, 12
	ecall
	jr	x1
p.putstring:
	lw	x7, 0(x10)
	addi	x6, x10, 4
	add	x7, x6, x7
	li	x17, 11
l.ps_begin:
	bge	x6, x7, l.ps_done
	lbu	x10, 0(x6)
	ecall
	addi	x6, x6, 1
	j	l.ps_begin
l.ps_done:
	jr	x1
p.stop:
	li	x17, 93
	li	x10, 0
	ecall
p.RuntimeError:
	mv	x6, x10
	li	x17, 4
	la	x10, m.RunErr
	ecall
	li	x17, 1
	mv	x10, x6
	ecall
	li	x17, 4
	la	x10, m.colon_space
	ecall
	mv	x10, x11
	ecall
	la	x10, m.nl
	ecall
	jal	p.stop
	.data	
# Fixed strings for runtime I/O
m.RunErr:
	.asciz	"Runtime error at line "
m.colon_space:
	.asciz	": "
m.nl:
	.asciz	"\n"
m.space:
	.asciz	" "
# Message strings for specific errors
m.BadSize:
	.asciz	"negative array size"
m.BadIndex:
	.asciz	"array index out of bounds"
m.DivZero:
	.asciz	"division by zero"
# String literals (including lengths) from program
	.align	2
s.Incorre_58_:
	.word	16
	.ascii	"Incorrect Input!"
	.align	2
s.true:
	.word	5
	.ascii	"true "
	.align	2
s.false:
	.word	6
	.ascii	"false "
	.align	2
# Space for Fasto heap
d.heap:
	.space	100000