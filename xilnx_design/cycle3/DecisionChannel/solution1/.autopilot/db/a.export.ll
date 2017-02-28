; ModuleID = '/home/greg/everything/xilnx_design/cycle3/DecisionChannel/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@vflip = internal unnamed_addr global i8 0, align 1
@v_thresh = internal unnamed_addr global i32 0, align 4
@recentdatapoints_sum = internal unnamed_addr global i32 0
@recentdatapoints_len = internal unnamed_addr global i32 0
@recentdatapoints_head_i = internal unnamed_addr global i32 0
@recentdatapoints_data = internal unnamed_addr global [20 x i16] zeroinitializer
@recentVBools_sum = internal unnamed_addr global i32 0
@recentVBools_len = internal unnamed_addr global i32 0
@recentVBools_head_i = internal unnamed_addr global i32 0
@recentVBools_data = internal unnamed_addr global [30 x i1] zeroinitializer
@recentABools_sum = internal unnamed_addr global i32 0
@recentABools_len = internal unnamed_addr global i32 0
@recentABools_head_i = internal unnamed_addr global i32 0
@recentABools_data = internal unnamed_addr global [30 x i1] zeroinitializer
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@last_sample_is_V_V = internal unnamed_addr global i1 false
@last_sample_is_A_V = internal unnamed_addr global i1 false
@aflip = internal unnamed_addr global i8 0, align 1
@a_thresh = internal unnamed_addr global i32 0, align 4
@VstimDelay = internal unnamed_addr global i32 0, align 4
@VbeatFallDelay = internal unnamed_addr global i32 0, align 4
@VbeatDelay = internal unnamed_addr global i32 0, align 4
@VCaptureThresh = internal unnamed_addr global i32 8, align 4
@Decision_str = internal unnamed_addr constant [9 x i8] c"Decision\00"
@AstimDelay = internal unnamed_addr global i32 0, align 4
@AbeatDelay = internal unnamed_addr global i32 0, align 4
@ACaptureThresh = internal unnamed_addr global i32 26, align 4
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i8 @_ssdm_op_Read.s_axilite.i8(i8) {
entry:
  ret i8 %0
}

define weak i32 @_ssdm_op_Read.s_axilite.i32(i32) {
entry:
  ret i32 %0
}

define weak i16 @_ssdm_op_Read.s_axilite.i16(i16) {
entry:
  ret i16 %0
}

define weak i1 @_ssdm_op_Read.s_axilite.i1(i1) {
entry:
  ret i1 %0
}

define weak i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_4 = trunc i32 %empty to i31
  ret i31 %empty_4
}

define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1
  %empty_5 = and i32 %0, %empty
  %empty_6 = icmp ne i32 %empty_5, 0
  ret i1 %empty_6
}

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

define i16 @Decision(i1 %reset_A_V, i1 %reset_V_V, i1 %reset_params_V, i32 %athresh, i32 %vthresh, i8 signext %a_flip, i8 signext %v_flip, i32 %a_length, i32 %v_length, i16 signext %data) {
codeRepl:
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %reset_A_V), !map !29
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %reset_V_V), !map !35
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %reset_params_V), !map !39
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %athresh), !map !43
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %vthresh), !map !47
  call void (...)* @_ssdm_op_SpecBitsMap(i8 %a_flip), !map !51
  call void (...)* @_ssdm_op_SpecBitsMap(i8 %v_flip), !map !55
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %a_length), !map !59
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %v_length), !map !63
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %data), !map !67
  call void (...)* @_ssdm_op_SpecBitsMap(i16 0) nounwind, !map !71
  call void (...)* @_ssdm_op_SpecTopModule([9 x i8]* @Decision_str) nounwind
  %data_read = call i16 @_ssdm_op_Read.s_axilite.i16(i16 %data)
  %v_length_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %v_length)
  %a_length_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %a_length)
  %v_flip_read = call i8 @_ssdm_op_Read.s_axilite.i8(i8 %v_flip)
  %a_flip_read = call i8 @_ssdm_op_Read.s_axilite.i8(i8 %a_flip)
  %vthresh_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %vthresh)
  %athresh_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %athresh)
  %reset_params_V_read = call i1 @_ssdm_op_Read.s_axilite.i1(i1 %reset_params_V)
  %reset_V_V_read = call i1 @_ssdm_op_Read.s_axilite.i1(i1 %reset_V_V)
  %reset_A_V_read = call i1 @_ssdm_op_Read.s_axilite.i1(i1 %reset_A_V)
  call void (...)* @_ssdm_op_SpecInterface(i1 %reset_V_V, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i1 %reset_A_V, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i1 %reset_params_V, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %athresh, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %vthresh, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i8 %a_flip, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i8 %v_flip, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %a_length, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %v_length, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  %val_assign = sext i16 %data_read to i32
  call void (...)* @_ssdm_op_SpecInterface(i16 %data, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  %AstimDelay_load = load i32* @AstimDelay, align 4
  %VstimDelay_load = load i32* @VstimDelay, align 4
  %ACaptureThresh_load = load i32* @ACaptureThresh, align 4
  %VCaptureThresh_load = load i32* @VCaptureThresh, align 4
  br i1 %reset_params_V_read, label %0, label %._crit_edge47_ifconv

; <label>:0                                       ; preds = %codeRepl
  store i32 %vthresh_read, i32* @v_thresh, align 4
  store i32 %athresh_read, i32* @a_thresh, align 4
  store i8 %a_flip_read, i8* @aflip, align 1
  store i8 %v_flip_read, i8* @vflip, align 1
  store i32 %a_length_read, i32* @ACaptureThresh, align 4
  store i32 %v_length_read, i32* @VCaptureThresh, align 4
  br label %._crit_edge47_ifconv

._crit_edge47_ifconv:                             ; preds = %0, %codeRepl
  %ACaptureThresh_loc = phi i32 [ %a_length_read, %0 ], [ %ACaptureThresh_load, %codeRepl ]
  %VCaptureThresh_loc = phi i32 [ %v_length_read, %0 ], [ %VCaptureThresh_load, %codeRepl ]
  %recentdatapoints_len_load = load i32* @recentdatapoints_len, align 4
  %tmp_i = icmp eq i32 %recentdatapoints_len_load, 20
  %recentdatapoints_head_i_load = load i32* @recentdatapoints_head_i, align 4
  %recentdatapoints_sum_load = load i32* @recentdatapoints_sum, align 4
  %tmp_i_7 = sext i32 %recentdatapoints_head_i_load to i64
  %recentdatapoints_data_addr = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_i_7
  %recentdatapoints_data_load = load i16* %recentdatapoints_data_addr, align 2
  %extLd = sext i16 %recentdatapoints_data_load to i32
  %tmp_34_i = sub nsw i32 %recentdatapoints_sum_load, %extLd
  %recentdatapoints_sum_loc_i = select i1 %tmp_i, i32 %tmp_34_i, i32 %recentdatapoints_sum_load
  store i16 %data_read, i16* %recentdatapoints_data_addr, align 2
  %tmp_36_i = add nsw i32 %recentdatapoints_sum_loc_i, %val_assign
  %recentdatapoints_len_load_op = add i32 %recentdatapoints_len_load, 1
  %tmp_37_i = select i1 %tmp_i, i32 20, i32 %recentdatapoints_len_load_op
  store i32 %tmp_37_i, i32* @recentdatapoints_len, align 4
  %tmp_38_i = add nsw i32 %recentdatapoints_head_i_load, 1
  %tmp_39_i = icmp eq i32 %tmp_38_i, 20
  %p_tmp_i = select i1 %tmp_39_i, i32 0, i32 %tmp_38_i
  store i32 %p_tmp_i, i32* @recentdatapoints_head_i, align 4
  store i32 %tmp_36_i, i32* @recentdatapoints_sum, align 4
  %AbeatDelay_load = load i32* @AbeatDelay, align 4
  %tmp_3 = add nsw i32 %AbeatDelay_load, 1
  %VbeatDelay_load = load i32* @VbeatDelay, align 4
  %tmp_4 = add nsw i32 %VbeatDelay_load, 1
  %VbeatFallDelay_load = load i32* @VbeatFallDelay, align 4
  %tmp_5 = add nsw i32 %VbeatFallDelay_load, 1
  %AstimDelay_load_op = add i32 %AstimDelay_load, 1
  %tmp_6 = select i1 %reset_A_V_read, i32 1, i32 %AstimDelay_load_op
  %VstimDelay_load_op = add i32 %VstimDelay_load, 1
  %tmp_7 = select i1 %reset_V_V_read, i32 1, i32 %VstimDelay_load_op
  %tmp_i1 = icmp eq i32 %tmp_37_i, 0
  %i = add nsw i32 %p_tmp_i, -1
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i, i32 31)
  %i_1 = add nsw i32 %p_tmp_i, 19
  %p_i = select i1 %tmp, i32 %i_1, i32 %i
  %tmp_40_i = sext i32 %p_i to i64
  %recentdatapoints_data_addr_1 = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_40_i
  %recentdatapoints_data_load_1 = load i16* %recentdatapoints_data_addr_1, align 2
  %datapointV = select i1 %tmp_i1, i16 0, i16 %recentdatapoints_data_load_1
  %datapointV_cast = sext i16 %datapointV to i17
  %vflip_load = load i8* @vflip, align 1
  %tmp_9 = icmp eq i8 %vflip_load, -1
  %datapointV_1 = sub i17 0, %datapointV_cast
  %p_s = select i1 %tmp_9, i17 %datapointV_1, i17 %datapointV_cast
  %p_cast = sext i17 %p_s to i32
  %v_thresh_load = load i32* @v_thresh, align 4
  %tmp_s = icmp sgt i32 %p_cast, %v_thresh_load
  %val_assign_1 = zext i1 %tmp_s to i32
  %recentVBools_sum_load = load i32* @recentVBools_sum, align 4
  %recentVBools_head_i_load = load i32* @recentVBools_head_i, align 4
  %recentVBools_len_load = load i32* @recentVBools_len, align 4
  %tmp_i2 = icmp eq i32 %recentVBools_len_load, 30
  %tmp_i2_8 = sext i32 %recentVBools_head_i_load to i64
  %recentVBools_data_addr = getelementptr [30 x i1]* @recentVBools_data, i64 0, i64 %tmp_i2_8
  %recentVBools_data_load = load i1* %recentVBools_data_addr, align 1
  %extLd1 = zext i1 %recentVBools_data_load to i32
  %tmp_28_i = sub nsw i32 %recentVBools_sum_load, %extLd1
  %CircularBuffer_int_30_sum_i = select i1 %tmp_i2, i32 %tmp_28_i, i32 %recentVBools_sum_load
  store i1 %tmp_s, i1* %recentVBools_data_addr, align 1
  %CircularBuffer_sum_read_assign = add nsw i32 %CircularBuffer_int_30_sum_i, %val_assign_1
  %CircularBuffer_len_read_assign = add i32 %recentVBools_len_load, 1
  %CircularBuffer_len_read_assign_1 = select i1 %tmp_i2, i32 30, i32 %CircularBuffer_len_read_assign
  %tmp_32_i = add nsw i32 %recentVBools_head_i_load, 1
  %tmp_33_i = icmp eq i32 %tmp_32_i, 30
  %CircularBuffer_head_i_read_ass = select i1 %tmp_33_i, i32 0, i32 %tmp_32_i
  store i32 %CircularBuffer_head_i_read_ass, i32* @recentVBools_head_i, align 4
  %tmp_8 = icmp sgt i32 %CircularBuffer_len_read_assign_1, %VCaptureThresh_loc
  store i32 %tmp_7, i32* @VstimDelay, align 4
  store i32 %tmp_6, i32* @AstimDelay, align 4
  br i1 %tmp_8, label %1, label %._crit_edge48

; <label>:1                                       ; preds = %._crit_edge47_ifconv
  %i_2 = sub nsw i32 %CircularBuffer_head_i_read_ass, %CircularBuffer_len_read_assign_1
  %tmp_25 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_2, i32 31)
  %i_3 = add nsw i32 %i_2, 30
  %i_4 = select i1 %tmp_25, i32 %i_3, i32 %i_2
  %tmp_27_i_i = sext i32 %i_4 to i64
  %recentVBools_data_addr_1 = getelementptr [30 x i1]* @recentVBools_data, i64 0, i64 %tmp_27_i_i
  %recentVBools_data_load_1 = load i1* %recentVBools_data_addr_1, align 1
  %not_tmp_i_i = icmp ne i32 %CircularBuffer_len_read_assign_1, 0
  %toReturn_4 = and i1 %recentVBools_data_load_1, %not_tmp_i_i
  %toReturn_i_cast = zext i1 %toReturn_4 to i32
  %CircularBuffer_sum_write_assig = sub nsw i32 %CircularBuffer_sum_read_assign, %toReturn_i_cast
  %CircularBuffer_len_write_assig = add nsw i32 %CircularBuffer_len_read_assign_1, -1
  %i_5 = sub nsw i32 %CircularBuffer_head_i_read_ass, %CircularBuffer_len_write_assig
  %tmp_26 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_5, i32 31)
  %i_6 = add nsw i32 %i_5, 30
  %i_7 = select i1 %tmp_26, i32 %i_6, i32 %i_5
  %tmp_27_i_i1 = sext i32 %i_7 to i64
  %recentVBools_data_addr_2 = getelementptr [30 x i1]* @recentVBools_data, i64 0, i64 %tmp_27_i_i1
  %recentVBools_data_load_2 = load i1* %recentVBools_data_addr_2, align 1
  %not_tmp_i_i6 = icmp ne i32 %CircularBuffer_len_write_assig, 0
  %toReturn_5 = and i1 %recentVBools_data_load_2, %not_tmp_i_i6
  %toReturn_i14_cast = zext i1 %toReturn_5 to i32
  %CircularBuffer_sum_write_assig_1 = sub nsw i32 %CircularBuffer_sum_write_assig, %toReturn_i14_cast
  %CircularBuffer_len_write_assig_1 = add nsw i32 %CircularBuffer_len_read_assign_1, -2
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %1, %._crit_edge47_ifconv
  %sum = phi i32 [ %CircularBuffer_sum_write_assig_1, %1 ], [ %CircularBuffer_sum_read_assign, %._crit_edge47_ifconv ]
  %recentVBools_len_new = phi i32 [ %CircularBuffer_len_write_assig_1, %1 ], [ %CircularBuffer_len_read_assign_1, %._crit_edge47_ifconv ]
  %tmp_1 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %VCaptureThresh_loc, i32 1, i32 31)
  %tmp_2 = sext i31 %tmp_1 to i32
  %tmp_10 = icmp sgt i32 %sum, %tmp_2
  store i32 %recentVBools_len_new, i32* @recentVBools_len, align 4
  store i32 %sum, i32* @recentVBools_sum, align 4
  %last_sample_is_V_V_load = load i1* @last_sample_is_V_V, align 1
  br i1 %tmp_10, label %2, label %4

; <label>:2                                       ; preds = %._crit_edge48
  br i1 %last_sample_is_V_V_load, label %._crit_edge49_ifconv, label %3

; <label>:3                                       ; preds = %2
  store i1 true, i1* @last_sample_is_V_V, align 1
  br label %._crit_edge49_ifconv

; <label>:4                                       ; preds = %._crit_edge48
  br i1 %last_sample_is_V_V_load, label %5, label %._crit_edge49_ifconv

; <label>:5                                       ; preds = %4
  store i1 false, i1* @last_sample_is_V_V, align 1
  br label %._crit_edge49_ifconv

._crit_edge49_ifconv:                             ; preds = %5, %4, %3, %2
  %VbeatDelay_new_1 = phi i32 [ %tmp_4, %2 ], [ 0, %3 ], [ %tmp_4, %5 ], [ %tmp_4, %4 ]
  %VbeatFallDelay_new_1 = phi i32 [ %tmp_5, %2 ], [ %tmp_5, %3 ], [ 0, %5 ], [ %tmp_5, %4 ]
  %last_sample_is_V_V_loc_2 = phi i1 [ %last_sample_is_V_V_load, %2 ], [ true, %3 ], [ false, %5 ], [ %last_sample_is_V_V_load, %4 ]
  %tmp_i3 = icmp eq i32 %tmp_37_i, 20
  %tmp_i3_9 = sext i32 %p_tmp_i to i64
  %recentdatapoints_data_addr_2 = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_i3_9
  %recentdatapoints_data_load_2 = load i16* %recentdatapoints_data_addr_2, align 2
  %datapointA = select i1 %tmp_i3, i16 %recentdatapoints_data_load_2, i16 0
  %datapointA_cast = sext i16 %datapointA to i17
  %aflip_load = load i8* @aflip, align 1
  %tmp_11 = icmp eq i8 %aflip_load, -1
  %datapointA_1 = sub i17 0, %datapointA_cast
  %p_1 = select i1 %tmp_11, i17 %datapointA_1, i17 %datapointA_cast
  %p_1_cast = sext i17 %p_1 to i32
  %a_thresh_load = load i32* @a_thresh, align 4
  %tmp_12 = icmp sgt i32 %p_1_cast, %a_thresh_load
  %val_assign_2 = zext i1 %tmp_12 to i32
  %recentABools_sum_load = load i32* @recentABools_sum, align 4
  %recentABools_head_i_load = load i32* @recentABools_head_i, align 4
  %recentABools_len_load = load i32* @recentABools_len, align 4
  %tmp_i4 = icmp eq i32 %recentABools_len_load, 30
  %tmp_i4_10 = sext i32 %recentABools_head_i_load to i64
  %recentABools_data_addr = getelementptr [30 x i1]* @recentABools_data, i64 0, i64 %tmp_i4_10
  %recentABools_data_load = load i1* %recentABools_data_addr, align 1
  %extLd2 = zext i1 %recentABools_data_load to i32
  %tmp_28_i1 = sub nsw i32 %recentABools_sum_load, %extLd2
  %CircularBuffer_int_30_sum_i1 = select i1 %tmp_i4, i32 %tmp_28_i1, i32 %recentABools_sum_load
  store i1 %tmp_12, i1* %recentABools_data_addr, align 1
  %CircularBuffer_sum_read_assign_1 = add nsw i32 %CircularBuffer_int_30_sum_i1, %val_assign_2
  %CircularBuffer_len_read_assign_2 = add i32 %recentABools_len_load, 1
  %CircularBuffer_len_read_assign_3 = select i1 %tmp_i4, i32 30, i32 %CircularBuffer_len_read_assign_2
  %tmp_32_i1 = add nsw i32 %recentABools_head_i_load, 1
  %tmp_33_i1 = icmp eq i32 %tmp_32_i1, 30
  %CircularBuffer_head_i_read_ass_1 = select i1 %tmp_33_i1, i32 0, i32 %tmp_32_i1
  store i32 %CircularBuffer_head_i_read_ass_1, i32* @recentABools_head_i, align 4
  %tmp_13 = icmp sgt i32 %CircularBuffer_len_read_assign_3, %ACaptureThresh_loc
  store i32 %VbeatFallDelay_new_1, i32* @VbeatFallDelay, align 4
  store i32 %VbeatDelay_new_1, i32* @VbeatDelay, align 4
  br i1 %tmp_13, label %6, label %._crit_edge51

; <label>:6                                       ; preds = %._crit_edge49_ifconv
  %i_8 = sub nsw i32 %CircularBuffer_head_i_read_ass_1, %CircularBuffer_len_read_assign_3
  %tmp_27 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_8, i32 31)
  %i_9 = add nsw i32 %i_8, 30
  %i_10 = select i1 %tmp_27, i32 %i_9, i32 %i_8
  %tmp_27_i_i2 = sext i32 %i_10 to i64
  %recentABools_data_addr_1 = getelementptr [30 x i1]* @recentABools_data, i64 0, i64 %tmp_27_i_i2
  %recentABools_data_load_1 = load i1* %recentABools_data_addr_1, align 1
  %not_tmp_i_i1 = icmp ne i32 %CircularBuffer_len_read_assign_3, 0
  %toReturn_6 = and i1 %recentABools_data_load_1, %not_tmp_i_i1
  %toReturn_i27_cast = zext i1 %toReturn_6 to i32
  %CircularBuffer_sum_write_assig_2 = sub nsw i32 %CircularBuffer_sum_read_assign_1, %toReturn_i27_cast
  %CircularBuffer_len_write_assig_2 = add nsw i32 %CircularBuffer_len_read_assign_3, -1
  %i_11 = sub nsw i32 %CircularBuffer_head_i_read_ass_1, %CircularBuffer_len_write_assig_2
  %tmp_28 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_11, i32 31)
  %i_12 = add nsw i32 %i_11, 30
  %i_13 = select i1 %tmp_28, i32 %i_12, i32 %i_11
  %tmp_27_i_i3 = sext i32 %i_13 to i64
  %recentABools_data_addr_2 = getelementptr [30 x i1]* @recentABools_data, i64 0, i64 %tmp_27_i_i3
  %recentABools_data_load_2 = load i1* %recentABools_data_addr_2, align 1
  %not_tmp_i_i2 = icmp ne i32 %CircularBuffer_len_write_assig_2, 0
  %toReturn_7 = and i1 %recentABools_data_load_2, %not_tmp_i_i2
  %toReturn_i40_cast = zext i1 %toReturn_7 to i32
  %CircularBuffer_sum_write_assig_3 = sub nsw i32 %CircularBuffer_sum_write_assig_2, %toReturn_i40_cast
  %CircularBuffer_len_write_assig_3 = add nsw i32 %CircularBuffer_len_read_assign_3, -2
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %6, %._crit_edge49_ifconv
  %sum_1 = phi i32 [ %CircularBuffer_sum_write_assig_3, %6 ], [ %CircularBuffer_sum_read_assign_1, %._crit_edge49_ifconv ]
  %recentABools_len_new = phi i32 [ %CircularBuffer_len_write_assig_3, %6 ], [ %CircularBuffer_len_read_assign_3, %._crit_edge49_ifconv ]
  %tmp_14 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %ACaptureThresh_loc, i32 1, i32 31)
  %tmp_15 = sext i31 %tmp_14 to i32
  %tmp_16 = icmp sgt i32 %sum_1, %tmp_15
  store i32 %recentABools_len_new, i32* @recentABools_len, align 4
  store i32 %sum_1, i32* @recentABools_sum, align 4
  %last_sample_is_A_V_load = load i1* @last_sample_is_A_V, align 1
  %tmp_17 = icmp sgt i32 %VbeatDelay_new_1, %VbeatFallDelay_new_1
  %or_cond1 = and i1 %tmp_16, %tmp_17
  br i1 %or_cond1, label %7, label %._crit_edge52

; <label>:7                                       ; preds = %._crit_edge51
  br i1 %last_sample_is_A_V_load, label %._crit_edge54_ifconv, label %8

; <label>:8                                       ; preds = %7
  store i1 true, i1* @last_sample_is_A_V, align 1
  br label %._crit_edge54_ifconv

._crit_edge52:                                    ; preds = %._crit_edge51
  br i1 %last_sample_is_A_V_load, label %9, label %._crit_edge54_ifconv

; <label>:9                                       ; preds = %._crit_edge52
  store i1 false, i1* @last_sample_is_A_V, align 1
  br label %._crit_edge54_ifconv

._crit_edge54_ifconv:                             ; preds = %9, %._crit_edge52, %8, %7
  %AbeatDelay_new = phi i32 [ %tmp_3, %7 ], [ 0, %8 ], [ %tmp_3, %9 ], [ %tmp_3, %._crit_edge52 ]
  %tmp_18 = phi i1 [ %last_sample_is_A_V_load, %7 ], [ true, %8 ], [ false, %9 ], [ %last_sample_is_A_V_load, %._crit_edge52 ]
  store i32 %AbeatDelay_new, i32* @AbeatDelay, align 4
  %tmp_20_not = icmp ne i32 %VbeatDelay_new_1, 0
  %last_sample_is_V_V_loc_2_not = xor i1 %last_sample_is_V_V_loc_2, true
  %brmerge = or i1 %tmp_20_not, %last_sample_is_V_V_loc_2_not
  %tmp_19 = icmp eq i32 %AbeatDelay_new, 0
  %p_2 = select i1 %tmp_18, i13 -4096, i13 0
  %sel_tmp = and i1 %brmerge, %tmp_19
  %sel_tmp1 = select i1 %sel_tmp, i13 %p_2, i13 0
  %tmp_20_not_not = xor i1 %tmp_20_not, true
  %sel_tmp2 = and i1 %last_sample_is_V_V_loc_2, %tmp_20_not_not
  %toReturn_1 = select i1 %sel_tmp2, i13 240, i13 %sel_tmp1
  %tmp_20 = icmp sgt i32 %AbeatDelay_new, 1000
  %tmp_21 = icmp sgt i32 %tmp_6, %ACaptureThresh_loc
  %toReturn = or i13 %toReturn_1, 3840
  %p_toReturn_1 = select i1 %tmp_21, i13 %toReturn, i13 %toReturn_1
  %toReturn_2 = select i1 %tmp_20, i13 %p_toReturn_1, i13 %toReturn_1
  %tmp_22 = icmp sgt i32 %VbeatDelay_new_1, %AbeatDelay_new
  %tmp_23 = icmp sgt i32 %AbeatDelay_new, 900
  %or_cond = and i1 %tmp_22, %tmp_23
  %tmp_24 = icmp sgt i32 %tmp_7, %VCaptureThresh_loc
  %toReturn_3 = or i13 %toReturn_2, 15
  %p_toReturn_2 = select i1 %tmp_24, i13 %toReturn_3, i13 %toReturn_2
  %UnifiedRetVal = select i1 %or_cond, i13 %p_toReturn_2, i13 %toReturn_2
  %UnifiedRetVal_cast = sext i13 %UnifiedRetVal to i16
  ret i16 %UnifiedRetVal_cast
}

!opencl.kernels = !{!0, !7, !13, !7, !7, !7, !19, !7, !19, !7, !7, !7, !19, !19, !7, !7, !7, !7}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!22}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"dbool", metadata !"dbool", metadata !"dbool", metadata !"int", metadata !"int", metadata !"char", metadata !"char", metadata !"uint", metadata !"uint", metadata !"short"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"reset_A", metadata !"reset_V", metadata !"reset_params", metadata !"athresh", metadata !"vthresh", metadata !"a_flip", metadata !"v_flip", metadata !"a_length", metadata !"v_length", metadata !"data"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space"}
!9 = metadata !{metadata !"kernel_arg_access_qual"}
!10 = metadata !{metadata !"kernel_arg_type"}
!11 = metadata !{metadata !"kernel_arg_type_qual"}
!12 = metadata !{metadata !"kernel_arg_name"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!19 = metadata !{null, metadata !14, metadata !15, metadata !20, metadata !17, metadata !21, metadata !6}
!20 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!21 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!22 = metadata !{metadata !23, [1 x i32]* @llvm_global_ctors_0}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 0, i32 31, metadata !25}
!25 = metadata !{metadata !26}
!26 = metadata !{metadata !"llvm.global_ctors.0", metadata !27, metadata !"", i32 0, i32 31}
!27 = metadata !{metadata !28}
!28 = metadata !{i32 0, i32 0, i32 1}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 0, metadata !31}
!31 = metadata !{metadata !32}
!32 = metadata !{metadata !"reset_A.V", metadata !33, metadata !"uint1", i32 0, i32 0}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 0, i32 0}
!35 = metadata !{metadata !36}
!36 = metadata !{i32 0, i32 0, metadata !37}
!37 = metadata !{metadata !38}
!38 = metadata !{metadata !"reset_V.V", metadata !33, metadata !"uint1", i32 0, i32 0}
!39 = metadata !{metadata !40}
!40 = metadata !{i32 0, i32 0, metadata !41}
!41 = metadata !{metadata !42}
!42 = metadata !{metadata !"reset_params.V", metadata !33, metadata !"uint1", i32 0, i32 0}
!43 = metadata !{metadata !44}
!44 = metadata !{i32 0, i32 31, metadata !45}
!45 = metadata !{metadata !46}
!46 = metadata !{metadata !"athresh", metadata !33, metadata !"int", i32 0, i32 31}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 0, i32 31, metadata !49}
!49 = metadata !{metadata !50}
!50 = metadata !{metadata !"vthresh", metadata !33, metadata !"int", i32 0, i32 31}
!51 = metadata !{metadata !52}
!52 = metadata !{i32 0, i32 7, metadata !53}
!53 = metadata !{metadata !54}
!54 = metadata !{metadata !"a_flip", metadata !33, metadata !"char", i32 0, i32 7}
!55 = metadata !{metadata !56}
!56 = metadata !{i32 0, i32 7, metadata !57}
!57 = metadata !{metadata !58}
!58 = metadata !{metadata !"v_flip", metadata !33, metadata !"char", i32 0, i32 7}
!59 = metadata !{metadata !60}
!60 = metadata !{i32 0, i32 31, metadata !61}
!61 = metadata !{metadata !62}
!62 = metadata !{metadata !"a_length", metadata !33, metadata !"unsigned int", i32 0, i32 31}
!63 = metadata !{metadata !64}
!64 = metadata !{i32 0, i32 31, metadata !65}
!65 = metadata !{metadata !66}
!66 = metadata !{metadata !"v_length", metadata !33, metadata !"unsigned int", i32 0, i32 31}
!67 = metadata !{metadata !68}
!68 = metadata !{i32 0, i32 15, metadata !69}
!69 = metadata !{metadata !70}
!70 = metadata !{metadata !"data", metadata !33, metadata !"short", i32 0, i32 15}
!71 = metadata !{metadata !72}
!72 = metadata !{i32 0, i32 15, metadata !73}
!73 = metadata !{metadata !74}
!74 = metadata !{metadata !"return", metadata !75, metadata !"short", i32 0, i32 15}
!75 = metadata !{metadata !76}
!76 = metadata !{i32 0, i32 1, i32 0}
