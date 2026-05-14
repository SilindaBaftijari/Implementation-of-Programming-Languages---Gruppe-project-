	.text	0x00400000
	la	x3, d.heap
	jal	f.main
	jal	p.stop
# User functions
# Function write_int
f.write_int:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_1_,x10
	mv	x18, x10
# was:	mv	_tmp_3_, _param_x_1_
# 	mv	_write_intres_2_,_tmp_3_
	mv	x10, x18
# was:	mv	x10, _write_intres_2_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _write_intres_2_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function write_int_arr
f.write_int_arr:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
# 	mv	_param_x_4_,x10
# 	mv	_arr_7_,_param_x_4_
	lw	x18, 0(x10)
# was:	lw	_size_6_, 0(_arr_7_)
	mv	x19, x3
# was:	mv	_write_int_arrres_5_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_14_, _size_6_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_14_, _tmp_14_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_14_
	sw	x18, 0(x19)
# was:	sw	_size_6_, 0(_write_int_arrres_5_)
	addi	x20, x19, 4
# was:	addi	_addrg_10_, _write_int_arrres_5_, 4
	mv	x21, x0
# was:	mv	_i_11_, x0
	addi	x22, x10, 4
# was:	addi	_elem_8_, _arr_7_, 4
l.loop_beg_12_:
	bge	x21, x18, l.loop_end_13_
# was:	bge	_i_11_, _size_6_, l.loop_end_13_
	lw	x10, 0(x22)
# was:	lw	_res_9_, 0(_elem_8_)
	addi	x22, x22, 4
# was:	addi	_elem_8_, _elem_8_, 4
# 	mv	x10,_res_9_
	jal	f.write_int
# was:	jal	f.write_int, x10
# 	mv	_res_9_,x10
	sw	x10, 0(x20)
# was:	sw	_res_9_, 0(_addrg_10_)
	addi	x20, x20, 4
# was:	addi	_addrg_10_, _addrg_10_, 4
	addi	x21, x21, 1
# was:	addi	_i_11_, _i_11_, 1
	j	l.loop_beg_12_
l.loop_end_13_:
	mv	x10, x19
# was:	mv	x10, _write_int_arrres_5_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function isMul16
f.isMul16:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_15_,x10
# 	mv	_div_L_21_,_param_a_15_
	li	x11, 16
# was:	li	_div_R_22_, 16
	beq	x11, x0, l.div_err_24_
# was:	beq	_div_R_22_, x0, l.div_err_24_
l.div_safe_23_:
	div	x12, x10, x11
# was:	div	_times_L_19_, _div_L_21_, _div_R_22_
	j	l.div_end_25_
l.div_err_24_:
	li	x10, 6
# was:	li	x10, 6
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.div_end_25_:
	li	x11, 16
# was:	li	_times_R_20_, 16
	mul	x11, x12, x11
# was:	mul	_eq_L_17_, _times_L_19_, _times_R_20_
	mv	x12, x10
# was:	mv	_eq_R_18_, _param_a_15_
	li	x10, 0
# was:	li	_isMul16res_16_, 0
	bne	x11, x12, l.false_26_
# was:	bne	_eq_L_17_, _eq_R_18_, l.false_26_
	li	x10, 1
# was:	li	_isMul16res_16_, 1
l.false_26_:
# 	mv	x10,_isMul16res_16_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x24, -32(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -32
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_28_,x10
	mv	x11, x10
# was:	mv	_size_38_, _let_n_28_
	bge	x11, x0, l.safe_39_
# was:	bge	_size_38_, x0, l.safe_39_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_39_:
	mv	x10, x3
# was:	mv	_filt_arr_30_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_44_, _size_38_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_44_, _tmp_44_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_44_
	sw	x11, 0(x10)
# was:	sw	_size_38_, 0(_filt_arr_30_)
	addi	x13, x10, 4
# was:	addi	_addr_40_, _filt_arr_30_, 4
	mv	x12, x0
# was:	mv	_i_41_, x0
l.loop_beg_42_:
	bge	x12, x11, l.loop_end_43_
# was:	bge	_i_41_, _size_38_, l.loop_end_43_
	sw	x12, 0(x13)
# was:	sw	_i_41_, 0(_addr_40_)
	addi	x13, x13, 4
# was:	addi	_addr_40_, _addr_40_, 4
	addi	x12, x12, 1
# was:	addi	_i_41_, _i_41_, 1
	j	l.loop_beg_42_
l.loop_end_43_:
	lw	x13, 0(x10)
# was:	lw	_filt_size_31_, 0(_filt_arr_30_)
	mv	x14, x3
# was:	mv	_let_x_29_, x3
	slli	x11, x13, 2
# was:	slli	_tmp_59_, _filt_size_31_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_59_, _tmp_59_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_59_
	sw	x13, 0(x14)
# was:	sw	_filt_size_31_, 0(_let_x_29_)
	addi	x11, x10, 4
# was:	addi	_filt_in_elem_32_, _filt_arr_30_, 4
	addi	x12, x14, 4
# was:	addi	_filt_out_elem_33_, _let_x_29_, 4
	mv	x15, x0
# was:	mv	_filt_i_35_, x0
	mv	x10, x0
# was:	mv	_filt_out_i_36_, x0
l.filt_loop_beg_45_:
	bge	x15, x13, l.filt_loop_end_46_
# was:	bge	_filt_i_35_, _filt_size_31_, l.filt_loop_end_46_
	lw	x18, 0(x11)
# was:	lw	_filt_elem_val_37_, 0(_filt_in_elem_32_)
# 	mv	_eq_L_49_,_filt_elem_val_37_
	mv	x17, x18
# was:	mv	_div_L_53_, _filt_elem_val_37_
	li	x16, 2
# was:	li	_div_R_54_, 2
	beq	x16, x0, l.div_err_56_
# was:	beq	_div_R_54_, x0, l.div_err_56_
l.div_safe_55_:
	div	x17, x17, x16
# was:	div	_times_L_51_, _div_L_53_, _div_R_54_
	j	l.div_end_57_
l.div_err_56_:
	li	x10, 44
# was:	li	x10, 44
	la	x11, m.DivZero
# was:	la	x11, m.DivZero
	j	p.RuntimeError
l.div_end_57_:
	li	x16, 2
# was:	li	_times_R_52_, 2
	mul	x17, x17, x16
# was:	mul	_eq_R_50_, _times_L_51_, _times_R_52_
	li	x16, 0
# was:	li	_fun_arg_res_48_, 0
	bne	x18, x17, l.false_58_
# was:	bne	_eq_L_49_, _eq_R_50_, l.false_58_
	li	x16, 1
# was:	li	_fun_arg_res_48_, 1
l.false_58_:
# 	mv	_filt_pred_res_34_,_fun_arg_res_48_
	beq	x16, x0, l.filt_skip_store_47_
# was:	beq	_filt_pred_res_34_, x0, l.filt_skip_store_47_
	sw	x18, 0(x12)
# was:	sw	_filt_elem_val_37_, 0(_filt_out_elem_33_)
	addi	x12, x12, 4
# was:	addi	_filt_out_elem_33_, _filt_out_elem_33_, 4
	addi	x10, x10, 1
# was:	addi	_filt_out_i_36_, _filt_out_i_36_, 1
l.filt_skip_store_47_:
	addi	x11, x11, 4
# was:	addi	_filt_in_elem_32_, _filt_in_elem_32_, 4
	addi	x15, x15, 1
# was:	addi	_filt_i_35_, _filt_i_35_, 1
	j	l.filt_loop_beg_45_
l.filt_loop_end_46_:
	sw	x10, 0(x14)
# was:	sw	_filt_out_i_36_, 0(_let_x_29_)
# 	mv	_arr_62_,_let_x_29_
	lw	x12, 0(x14)
# was:	lw	_size_61_, 0(_arr_62_)
	mv	x11, x3
# was:	mv	_let_y_60_, x3
	slli	x10, x12, 2
# was:	slli	_tmp_72_, _size_61_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_72_, _tmp_72_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_72_
	sw	x12, 0(x11)
# was:	sw	_size_61_, 0(_let_y_60_)
	addi	x10, x11, 4
# was:	addi	_addrg_65_, _let_y_60_, 4
	mv	x13, x0
# was:	mv	_i_66_, x0
	addi	x14, x14, 4
# was:	addi	_elem_63_, _arr_62_, 4
l.loop_beg_67_:
	bge	x13, x12, l.loop_end_68_
# was:	bge	_i_66_, _size_61_, l.loop_end_68_
	lw	x15, 0(x14)
# was:	lw	_res_64_, 0(_elem_63_)
	addi	x14, x14, 4
# was:	addi	_elem_63_, _elem_63_, 4
# 	mv	_times_L_70_,_res_64_
	mv	x16, x15
# was:	mv	_times_R_71_, _res_64_
	mul	x15, x15, x16
# was:	mul	_fun_arg_res_69_, _times_L_70_, _times_R_71_
# 	mv	_res_64_,_fun_arg_res_69_
	sw	x15, 0(x10)
# was:	sw	_res_64_, 0(_addrg_65_)
	addi	x10, x10, 4
# was:	addi	_addrg_65_, _addrg_65_, 4
	addi	x13, x13, 1
# was:	addi	_i_66_, _i_66_, 1
	j	l.loop_beg_67_
l.loop_end_68_:
# 	mv	_filt_arr_74_,_let_y_60_
	lw	x19, 0(x11)
# was:	lw	_filt_size_75_, 0(_filt_arr_74_)
	mv	x18, x3
# was:	mv	_let_z_73_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_85_, _filt_size_75_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_85_, _tmp_85_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_85_
	sw	x19, 0(x18)
# was:	sw	_filt_size_75_, 0(_let_z_73_)
	addi	x22, x11, 4
# was:	addi	_filt_in_elem_76_, _filt_arr_74_, 4
	addi	x20, x18, 4
# was:	addi	_filt_out_elem_77_, _let_z_73_, 4
	mv	x21, x0
# was:	mv	_filt_i_79_, x0
	mv	x23, x0
# was:	mv	_filt_out_i_80_, x0
l.filt_loop_beg_82_:
	bge	x21, x19, l.filt_loop_end_83_
# was:	bge	_filt_i_79_, _filt_size_75_, l.filt_loop_end_83_
	lw	x24, 0(x22)
# was:	lw	_filt_elem_val_81_, 0(_filt_in_elem_76_)
	mv	x10, x24
# was:	mv	x10, _filt_elem_val_81_
	jal	f.isMul16
# was:	jal	f.isMul16, x10
# 	mv	_filt_pred_res_78_,x10
	beq	x10, x0, l.filt_skip_store_84_
# was:	beq	_filt_pred_res_78_, x0, l.filt_skip_store_84_
	sw	x24, 0(x20)
# was:	sw	_filt_elem_val_81_, 0(_filt_out_elem_77_)
	addi	x20, x20, 4
# was:	addi	_filt_out_elem_77_, _filt_out_elem_77_, 4
	addi	x23, x23, 1
# was:	addi	_filt_out_i_80_, _filt_out_i_80_, 1
l.filt_skip_store_84_:
	addi	x22, x22, 4
# was:	addi	_filt_in_elem_76_, _filt_in_elem_76_, 4
	addi	x21, x21, 1
# was:	addi	_filt_i_79_, _filt_i_79_, 1
	j	l.filt_loop_beg_82_
l.filt_loop_end_83_:
	sw	x23, 0(x18)
# was:	sw	_filt_out_i_80_, 0(_let_z_73_)
	mv	x10, x18
# was:	mv	_arg_86_, _let_z_73_
# 	mv	x10,_arg_86_
	jal	f.write_int_arr
# was:	jal	f.write_int_arr, x10
# 	mv	_mainres_27_,x10
# 	mv	x10,_mainres_27_
	addi	x2, x2, 32
	lw	x24, -32(x2)
	lw	x23, -28(x2)
	lw	x22, -24(x2)
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