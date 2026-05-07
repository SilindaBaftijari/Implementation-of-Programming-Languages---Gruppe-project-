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
# Function add
f.add:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_31_,x10
# 	mv	_param_y_32_,x11
# 	mv	_plus_L_34_,_param_x_31_
# 	mv	_plus_R_35_,_param_y_32_
	add	x10, x10, x11
# was:	add	_addres_33_, _plus_L_34_, _plus_R_35_
# 	mv	x10,_addres_33_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -28
	jal	p.getint
# was:	jal	p.getint, 
	mv	x19, x10
# was:	mv	_let_n_37_, x10
	li	x10, 0
# was:	li	_lt_L_42_, 0
# 	mv	_lt_R_43_,_let_n_37_
	slt	x10, x10, x19
# was:	slt	_cond_41_, _lt_L_42_, _lt_R_43_
	bne	x10, x0, l.then_38_
# was:	bne	_cond_41_, x0, l.then_38_
	j	l.else_39_
l.then_38_:
# 	mv	_size_49_,_let_n_37_
	bge	x19, x0, l.safe_50_
# was:	bge	_size_49_, x0, l.safe_50_
	li	x10, 16
# was:	li	x10, 16
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_50_:
	mv	x10, x3
# was:	mv	_arr_46_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_55_, _size_49_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_55_, _tmp_55_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_55_
	sw	x19, 0(x10)
# was:	sw	_size_49_, 0(_arr_46_)
	addi	x11, x10, 4
# was:	addi	_addr_51_, _arr_46_, 4
	mv	x12, x0
# was:	mv	_i_52_, x0
l.loop_beg_53_:
	bge	x12, x19, l.loop_end_54_
# was:	bge	_i_52_, _size_49_, l.loop_end_54_
	sw	x12, 0(x11)
# was:	sw	_i_52_, 0(_addr_51_)
	addi	x11, x11, 4
# was:	addi	_addr_51_, _addr_51_, 4
	addi	x12, x12, 1
# was:	addi	_i_52_, _i_52_, 1
	j	l.loop_beg_53_
l.loop_end_54_:
	lw	x20, 0(x10)
# was:	lw	_size_45_, 0(_arr_46_)
	mv	x18, x3
# was:	mv	_let_arr_44_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_60_, _size_45_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_60_, _tmp_60_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_60_
	sw	x20, 0(x18)
# was:	sw	_size_45_, 0(_let_arr_44_)
	addi	x22, x18, 4
# was:	addi	_addrg_56_, _let_arr_44_, 4
	mv	x21, x0
# was:	mv	_i_57_, x0
	addi	x23, x10, 4
# was:	addi	_elem_47_, _arr_46_, 4
l.loop_beg_58_:
	bge	x21, x20, l.loop_end_59_
# was:	bge	_i_57_, _size_45_, l.loop_end_59_
	lw	x10, 0(x23)
# was:	lw	_res_48_, 0(_elem_47_)
	addi	x23, x23, 4
# was:	addi	_elem_47_, _elem_47_, 4
# 	mv	x10,_res_48_
	jal	f.readInt
# was:	jal	f.readInt, x10
# 	mv	_res_48_,x10
	sw	x10, 0(x22)
# was:	sw	_res_48_, 0(_addrg_56_)
	addi	x22, x22, 4
# was:	addi	_addrg_56_, _addrg_56_, 4
	addi	x21, x21, 1
# was:	addi	_i_57_, _i_57_, 1
	j	l.loop_beg_58_
l.loop_end_59_:
# 	mv	_size_66_,_let_n_37_
	bge	x19, x0, l.safe_67_
# was:	bge	_size_66_, x0, l.safe_67_
	li	x10, 21
# was:	li	x10, 21
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_67_:
	mv	x14, x3
# was:	mv	_arr_63_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_72_, _size_66_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_72_, _tmp_72_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_72_
	sw	x19, 0(x14)
# was:	sw	_size_66_, 0(_arr_63_)
	addi	x10, x14, 4
# was:	addi	_addr_68_, _arr_63_, 4
	mv	x11, x0
# was:	mv	_i_69_, x0
l.loop_beg_70_:
	bge	x11, x19, l.loop_end_71_
# was:	bge	_i_69_, _size_66_, l.loop_end_71_
	sw	x11, 0(x10)
# was:	sw	_i_69_, 0(_addr_68_)
	addi	x10, x10, 4
# was:	addi	_addr_68_, _addr_68_, 4
	addi	x11, x11, 1
# was:	addi	_i_69_, _i_69_, 1
	j	l.loop_beg_70_
l.loop_end_71_:
	lw	x10, 0(x14)
# was:	lw	_size_62_, 0(_arr_63_)
	mv	x11, x3
# was:	mv	_let_diffs_61_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_113_, _size_62_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_113_, _tmp_113_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_113_
	sw	x10, 0(x11)
# was:	sw	_size_62_, 0(_let_diffs_61_)
	addi	x12, x11, 4
# was:	addi	_addrg_73_, _let_diffs_61_, 4
	mv	x13, x0
# was:	mv	_i_74_, x0
	addi	x14, x14, 4
# was:	addi	_elem_64_, _arr_63_, 4
l.loop_beg_75_:
	bge	x13, x10, l.loop_end_76_
# was:	bge	_i_74_, _size_62_, l.loop_end_76_
	lw	x15, 0(x14)
# was:	lw	_res_65_, 0(_elem_64_)
	addi	x14, x14, 4
# was:	addi	_elem_64_, _elem_64_, 4
# 	mv	_eq_L_82_,_res_65_
	li	x17, 0
# was:	li	_eq_R_83_, 0
	li	x16, 0
# was:	li	_cond_81_, 0
	bne	x15, x17, l.false_84_
# was:	bne	_eq_L_82_, _eq_R_83_, l.false_84_
	li	x16, 1
# was:	li	_cond_81_, 1
l.false_84_:
	bne	x16, x0, l.then_78_
# was:	bne	_cond_81_, x0, l.then_78_
	j	l.else_79_
l.then_78_:
	li	x17, 0
# was:	li	_arr_ind_87_, 0
	addi	x15, x18, 4
# was:	addi	_arr_data_88_, _let_arr_44_, 4
	bge	x17, x0, l.nonneg_91_
# was:	bge	_arr_ind_87_, x0, l.nonneg_91_
l.error_90_:
	li	x10, 19
# was:	li	x10, 19
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_91_:
	lw	x16, 0(x18)
# was:	lw	_size_89_, 0(_let_arr_44_)
	bge	x17, x16, l.error_90_
# was:	bge	_arr_ind_87_, _size_89_, l.error_90_
	slli	x17, x17, 2
# was:	slli	_arr_ind_87_, _arr_ind_87_, 2
	add	x15, x15, x17
# was:	add	_arr_data_88_, _arr_data_88_, _arr_ind_87_
	lw	x17, 0(x15)
# was:	lw	_minus_L_85_, 0(_arr_data_88_)
# 	mv	_minus_L_93_,_let_n_37_
	li	x15, 1
# was:	li	_minus_R_94_, 1
	sub	x16, x19, x15
# was:	sub	_arr_ind_92_, _minus_L_93_, _minus_R_94_
	addi	x20, x18, 4
# was:	addi	_arr_data_95_, _let_arr_44_, 4
	bge	x16, x0, l.nonneg_98_
# was:	bge	_arr_ind_92_, x0, l.nonneg_98_
l.error_97_:
	li	x10, 19
# was:	li	x10, 19
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_98_:
	lw	x15, 0(x18)
# was:	lw	_size_96_, 0(_let_arr_44_)
	bge	x16, x15, l.error_97_
# was:	bge	_arr_ind_92_, _size_96_, l.error_97_
	slli	x16, x16, 2
# was:	slli	_arr_ind_92_, _arr_ind_92_, 2
	add	x20, x20, x16
# was:	add	_arr_data_95_, _arr_data_95_, _arr_ind_92_
	lw	x15, 0(x20)
# was:	lw	_minus_R_86_, 0(_arr_data_95_)
	sub	x15, x17, x15
# was:	sub	_fun_arg_res_77_, _minus_L_85_, _minus_R_86_
	j	l.endif_80_
l.else_79_:
	mv	x16, x15
# was:	mv	_arr_ind_101_, _res_65_
	addi	x17, x18, 4
# was:	addi	_arr_data_102_, _let_arr_44_, 4
	bge	x16, x0, l.nonneg_105_
# was:	bge	_arr_ind_101_, x0, l.nonneg_105_
l.error_104_:
	li	x10, 20
# was:	li	x10, 20
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_105_:
	lw	x20, 0(x18)
# was:	lw	_size_103_, 0(_let_arr_44_)
	bge	x16, x20, l.error_104_
# was:	bge	_arr_ind_101_, _size_103_, l.error_104_
	slli	x16, x16, 2
# was:	slli	_arr_ind_101_, _arr_ind_101_, 2
	add	x17, x17, x16
# was:	add	_arr_data_102_, _arr_data_102_, _arr_ind_101_
	lw	x17, 0(x17)
# was:	lw	_minus_L_99_, 0(_arr_data_102_)
	mv	x16, x15
# was:	mv	_minus_L_107_, _res_65_
	li	x15, 1
# was:	li	_minus_R_108_, 1
	sub	x15, x16, x15
# was:	sub	_arr_ind_106_, _minus_L_107_, _minus_R_108_
	addi	x16, x18, 4
# was:	addi	_arr_data_109_, _let_arr_44_, 4
	bge	x15, x0, l.nonneg_112_
# was:	bge	_arr_ind_106_, x0, l.nonneg_112_
l.error_111_:
	li	x10, 20
# was:	li	x10, 20
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_112_:
	lw	x20, 0(x18)
# was:	lw	_size_110_, 0(_let_arr_44_)
	bge	x15, x20, l.error_111_
# was:	bge	_arr_ind_106_, _size_110_, l.error_111_
	slli	x15, x15, 2
# was:	slli	_arr_ind_106_, _arr_ind_106_, 2
	add	x16, x16, x15
# was:	add	_arr_data_109_, _arr_data_109_, _arr_ind_106_
	lw	x15, 0(x16)
# was:	lw	_minus_R_100_, 0(_arr_data_109_)
	sub	x15, x17, x15
# was:	sub	_fun_arg_res_77_, _minus_L_99_, _minus_R_100_
l.endif_80_:
# 	mv	_res_65_,_fun_arg_res_77_
	sw	x15, 0(x12)
# was:	sw	_res_65_, 0(_addrg_73_)
	addi	x12, x12, 4
# was:	addi	_addrg_73_, _addrg_73_, 4
	addi	x13, x13, 1
# was:	addi	_i_74_, _i_74_, 1
	j	l.loop_beg_75_
l.loop_end_76_:
# 	mv	_arr_116_,_let_diffs_61_
	lw	x19, 0(x11)
# was:	lw	_size_115_, 0(_arr_116_)
	mv	x18, x3
# was:	mv	_let_squares_114_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_126_, _size_115_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_126_, _tmp_126_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_126_
	sw	x19, 0(x18)
# was:	sw	_size_115_, 0(_let_squares_114_)
	addi	x21, x18, 4
# was:	addi	_addrg_119_, _let_squares_114_, 4
	mv	x20, x0
# was:	mv	_i_120_, x0
	addi	x22, x11, 4
# was:	addi	_elem_117_, _arr_116_, 4
l.loop_beg_121_:
	bge	x20, x19, l.loop_end_122_
# was:	bge	_i_120_, _size_115_, l.loop_end_122_
	lw	x10, 0(x22)
# was:	lw	_res_118_, 0(_elem_117_)
	addi	x22, x22, 4
# was:	addi	_elem_117_, _elem_117_, 4
# 	mv	_arg_124_,_res_118_
	mv	x11, x10
# was:	mv	_arg_125_, _res_118_
# 	mv	x10,_arg_124_
# 	mv	x11,_arg_125_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_fun_arg_res_123_,x10
# 	mv	_res_118_,_fun_arg_res_123_
	sw	x10, 0(x21)
# was:	sw	_res_118_, 0(_addrg_119_)
	addi	x21, x21, 4
# was:	addi	_addrg_119_, _addrg_119_, 4
	addi	x20, x20, 1
# was:	addi	_i_120_, _i_120_, 1
	j	l.loop_beg_121_
l.loop_end_122_:
	mv	x19, x18
# was:	mv	_arr_128_, _let_squares_114_
	lw	x18, 0(x19)
# was:	lw	_size_129_, 0(_arr_128_)
	li	x10, 0
# was:	li	_let_result_127_, 0
	addi	x19, x19, 4
# was:	addi	_arr_128_, _arr_128_, 4
	mv	x20, x0
# was:	mv	_ind_var_130_, x0
l.loop_beg_132_:
	bge	x20, x18, l.loop_end_133_
# was:	bge	_ind_var_130_, _size_129_, l.loop_end_133_
	lw	x11, 0(x19)
# was:	lw	_tmp_131_, 0(_arr_128_)
	addi	x19, x19, 4
# was:	addi	_arr_128_, _arr_128_, 4
# 	mv	x10,_let_result_127_
# 	mv	x11,_tmp_131_
	jal	f.add
# was:	jal	f.add, x10 x11
# 	mv	_let_result_127_,x10
	addi	x20, x20, 1
# was:	addi	_ind_var_130_, _ind_var_130_, 1
	j	l.loop_beg_132_
l.loop_end_133_:
# 	mv	_mainres_36_,_let_result_127_
	j	l.endif_40_
l.else_39_:
	la	x10, s.Incorre_136_
# was:	la	_tmp_135_, s.Incorre_136_
# s.Incorre_136_: string "Incorrect Input!"
# 	mv	_let_ignored_134_,_tmp_135_
# 	mv	x10,_tmp_135_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 0
# was:	li	_mainres_36_, 0
l.endif_40_:
# 	mv	x10,_mainres_36_
	addi	x2, x2, 28
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
s.Incorre_136_:
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