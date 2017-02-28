; ModuleID = '/home/greg/everything/xilnx_design/cycle3/DecisionChannel/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@vflip = internal unnamed_addr global i8 0, align 1 ; [#uses=2 type=i8*]
@v_thresh = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@recentdatapoints_sum = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentdatapoints_len = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentdatapoints_head_i = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentdatapoints_data = internal unnamed_addr global [20 x i16] zeroinitializer ; [#uses=3 type=[20 x i16]*]
@recentVBools_sum = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentVBools_len = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentVBools_head_i = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentVBools_data = internal unnamed_addr global [30 x i1] zeroinitializer ; [#uses=3 type=[30 x i1]*]
@recentABools_sum = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentABools_len = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentABools_head_i = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentABools_data = internal unnamed_addr global [30 x i1] zeroinitializer ; [#uses=3 type=[30 x i1]*]
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a] ; [#uses=0 type=[1 x void ()*]*]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535] ; [#uses=0 type=[1 x i32]*]
@last_sample_is_V_V = internal unnamed_addr global i1 false ; [#uses=3 type=i1*]
@last_sample_is_A_V = internal unnamed_addr global i1 false ; [#uses=3 type=i1*]
@aflip = internal unnamed_addr global i8 0, align 1 ; [#uses=2 type=i8*]
@a_thresh = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@VstimDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@VbeatFallDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@VbeatDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@VCaptureThresh = internal unnamed_addr global i32 8, align 4 ; [#uses=2 type=i32*]
@Decision_str = internal unnamed_addr constant [9 x i8] c"Decision\00" ; [#uses=1 type=[9 x i8]*]
@AstimDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@AbeatDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@ACaptureThresh = internal unnamed_addr global i32 26, align 4 ; [#uses=2 type=i32*]
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=44 type=[1 x i8]*]
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1 ; [#uses=11 type=[10 x i8]*]

; [#uses=1]
declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

; [#uses=77]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=11]
define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

; [#uses=11]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=2]
define weak i8 @_ssdm_op_Read.s_axilite.i8(i8) {
entry:
  ret i8 %0
}

; [#uses=4]
define weak i32 @_ssdm_op_Read.s_axilite.i32(i32) {
entry:
  ret i32 %0
}

; [#uses=1]
define weak i16 @_ssdm_op_Read.s_axilite.i16(i16) {
entry:
  ret i16 %0
}

; [#uses=3]
define weak i1 @_ssdm_op_Read.s_axilite.i1(i1) {
entry:
  ret i1 %0
}

; [#uses=2]
define weak i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_4 = trunc i32 %empty to i31              ; [#uses=1 type=i31]
  ret i31 %empty_4
}

; [#uses=5]
define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1                          ; [#uses=1 type=i32]
  %empty_5 = and i32 %0, %empty                   ; [#uses=1 type=i32]
  %empty_6 = icmp ne i32 %empty_5, 0              ; [#uses=1 type=i1]
  ret i1 %empty_6
}

; [#uses=1]
declare void @_GLOBAL__I_a() nounwind section ".text.startup"

; [#uses=0]
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
  %data_read = call i16 @_ssdm_op_Read.s_axilite.i16(i16 %data) ; [#uses=2 type=i16]
  call void @llvm.dbg.value(metadata !{i16 %data_read}, i64 0, metadata !77), !dbg !456 ; [debug line = 6:170] [debug variable = data]
  %v_length_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %v_length) ; [#uses=2 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %v_length_read}, i64 0, metadata !457), !dbg !458 ; [debug line = 6:154] [debug variable = v_length]
  %a_length_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %a_length) ; [#uses=2 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %a_length_read}, i64 0, metadata !459), !dbg !460 ; [debug line = 6:131] [debug variable = a_length]
  %v_flip_read = call i8 @_ssdm_op_Read.s_axilite.i8(i8 %v_flip) ; [#uses=1 type=i8]
  call void @llvm.dbg.value(metadata !{i8 %v_flip_read}, i64 0, metadata !461), !dbg !462 ; [debug line = 6:110] [debug variable = v_flip]
  %a_flip_read = call i8 @_ssdm_op_Read.s_axilite.i8(i8 %a_flip) ; [#uses=1 type=i8]
  call void @llvm.dbg.value(metadata !{i8 %a_flip_read}, i64 0, metadata !463), !dbg !464 ; [debug line = 6:97] [debug variable = a_flip]
  %vthresh_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %vthresh) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %vthresh_read}, i64 0, metadata !465), !dbg !466 ; [debug line = 6:83] [debug variable = vthresh]
  %athresh_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %athresh) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %athresh_read}, i64 0, metadata !467), !dbg !468 ; [debug line = 6:70] [debug variable = athresh]
  %reset_params_V_read = call i1 @_ssdm_op_Read.s_axilite.i1(i1 %reset_params_V) ; [#uses=1 type=i1]
  %reset_V_V_read = call i1 @_ssdm_op_Read.s_axilite.i1(i1 %reset_V_V) ; [#uses=1 type=i1]
  %reset_A_V_read = call i1 @_ssdm_op_Read.s_axilite.i1(i1 %reset_A_V) ; [#uses=1 type=i1]
  call void @llvm.dbg.value(metadata !{i32 %athresh}, i64 0, metadata !467), !dbg !468 ; [debug line = 6:70] [debug variable = athresh]
  call void @llvm.dbg.value(metadata !{i32 %vthresh}, i64 0, metadata !465), !dbg !466 ; [debug line = 6:83] [debug variable = vthresh]
  call void @llvm.dbg.value(metadata !{i8 %a_flip}, i64 0, metadata !463), !dbg !464 ; [debug line = 6:97] [debug variable = a_flip]
  call void @llvm.dbg.value(metadata !{i8 %v_flip}, i64 0, metadata !461), !dbg !462 ; [debug line = 6:110] [debug variable = v_flip]
  call void @llvm.dbg.value(metadata !{i32 %a_length}, i64 0, metadata !459), !dbg !460 ; [debug line = 6:131] [debug variable = a_length]
  call void @llvm.dbg.value(metadata !{i32 %v_length}, i64 0, metadata !457), !dbg !458 ; [debug line = 6:154] [debug variable = v_length]
  call void @llvm.dbg.value(metadata !{i16 %data}, i64 0, metadata !77), !dbg !456 ; [debug line = 6:170] [debug variable = data]
  call void (...)* @_ssdm_op_SpecInterface(i1 %reset_V_V, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind, !dbg !469 ; [debug line = 8:1]
  call void (...)* @_ssdm_op_SpecInterface(i1 %reset_A_V, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind, !dbg !471 ; [debug line = 9:1]
  call void (...)* @_ssdm_op_SpecInterface(i1 %reset_params_V, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind, !dbg !472 ; [debug line = 10:1]
  call void (...)* @_ssdm_op_SpecInterface(i32 %athresh, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind, !dbg !473 ; [debug line = 11:1]
  call void (...)* @_ssdm_op_SpecInterface(i32 %vthresh, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind, !dbg !474 ; [debug line = 12:1]
  call void (...)* @_ssdm_op_SpecInterface(i8 %a_flip, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind, !dbg !475 ; [debug line = 13:1]
  call void (...)* @_ssdm_op_SpecInterface(i8 %v_flip, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind, !dbg !476 ; [debug line = 14:1]
  call void (...)* @_ssdm_op_SpecInterface(i32 %a_length, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind, !dbg !477 ; [debug line = 15:1]
  call void (...)* @_ssdm_op_SpecInterface(i32 %v_length, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind, !dbg !478 ; [debug line = 16:1]
  %val_assign = sext i16 %data_read to i32, !dbg !479 ; [#uses=1 type=i32] [debug line = 17:1]
  call void (...)* @_ssdm_op_SpecInterface(i16 %data, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind, !dbg !479 ; [debug line = 17:1]
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind, !dbg !480 ; [debug line = 18:1]
  %AstimDelay_load = load i32* @AstimDelay, align 4, !dbg !481 ; [#uses=1 type=i32] [debug line = 65:2]
  %VstimDelay_load = load i32* @VstimDelay, align 4, !dbg !482 ; [#uses=1 type=i32] [debug line = 66:2]
  %ACaptureThresh_load = load i32* @ACaptureThresh, align 4, !dbg !483 ; [#uses=1 type=i32] [debug line = 110:2]
  %VCaptureThresh_load = load i32* @VCaptureThresh, align 4, !dbg !484 ; [#uses=1 type=i32] [debug line = 79:2]
  br i1 %reset_params_V_read, label %0, label %._crit_edge47_ifconv, !dbg !485 ; [debug line = 50:5]

; <label>:0                                       ; preds = %codeRepl
  store i32 %vthresh_read, i32* @v_thresh, align 4, !dbg !486 ; [debug line = 52:3]
  store i32 %athresh_read, i32* @a_thresh, align 4, !dbg !488 ; [debug line = 53:3]
  store i8 %a_flip_read, i8* @aflip, align 1, !dbg !489 ; [debug line = 54:3]
  store i8 %v_flip_read, i8* @vflip, align 1, !dbg !490 ; [debug line = 55:3]
  store i32 %a_length_read, i32* @ACaptureThresh, align 4, !dbg !491 ; [debug line = 56:3]
  store i32 %v_length_read, i32* @VCaptureThresh, align 4, !dbg !492 ; [debug line = 57:3]
  br label %._crit_edge47_ifconv, !dbg !493       ; [debug line = 58:2]

._crit_edge47_ifconv:                             ; preds = %0, %codeRepl
  %ACaptureThresh_loc = phi i32 [ %a_length_read, %0 ], [ %ACaptureThresh_load, %codeRepl ] ; [#uses=3 type=i32]
  %VCaptureThresh_loc = phi i32 [ %v_length_read, %0 ], [ %VCaptureThresh_load, %codeRepl ] ; [#uses=3 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %val_assign}, i64 0, metadata !494) nounwind, !dbg !523 ; [debug line = 13:14@61:2] [debug variable = val]
  %recentdatapoints_len_load = load i32* @recentdatapoints_len, align 4, !dbg !524 ; [#uses=2 type=i32] [debug line = 14:3@61:2]
  %tmp_i = icmp eq i32 %recentdatapoints_len_load, 20, !dbg !524 ; [#uses=2 type=i1] [debug line = 14:3@61:2]
  %recentdatapoints_head_i_load = load i32* @recentdatapoints_head_i, align 4, !dbg !526 ; [#uses=2 type=i32] [debug line = 15:4@61:2]
  %recentdatapoints_sum_load = load i32* @recentdatapoints_sum, align 4, !dbg !526 ; [#uses=2 type=i32] [debug line = 15:4@61:2]
  %tmp_i_7 = sext i32 %recentdatapoints_head_i_load to i64, !dbg !526 ; [#uses=1 type=i64] [debug line = 15:4@61:2]
  %recentdatapoints_data_addr = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_i_7, !dbg !526 ; [#uses=2 type=i16*] [debug line = 15:4@61:2]
  %recentdatapoints_data_load = load i16* %recentdatapoints_data_addr, align 2 ; [#uses=1 type=i16]
  %extLd = sext i16 %recentdatapoints_data_load to i32 ; [#uses=1 type=i32]
  %tmp_34_i = sub nsw i32 %recentdatapoints_sum_load, %extLd, !dbg !526 ; [#uses=1 type=i32] [debug line = 15:4@61:2]
  %recentdatapoints_sum_loc_i = select i1 %tmp_i, i32 %tmp_34_i, i32 %recentdatapoints_sum_load ; [#uses=1 type=i32]
  store i16 %data_read, i16* %recentdatapoints_data_addr, align 2, !dbg !528 ; [debug line = 18:3@61:2]
  %tmp_36_i = add nsw i32 %recentdatapoints_sum_loc_i, %val_assign, !dbg !529 ; [#uses=1 type=i32] [debug line = 19:3@61:2]
  %recentdatapoints_len_load_op = add i32 %recentdatapoints_len_load, 1, !dbg !530 ; [#uses=1 type=i32] [debug line = 20:3@61:2]
  %tmp_37_i = select i1 %tmp_i, i32 20, i32 %recentdatapoints_len_load_op, !dbg !530 ; [#uses=3 type=i32] [debug line = 20:3@61:2]
  store i32 %tmp_37_i, i32* @recentdatapoints_len, align 4, !dbg !530 ; [debug line = 20:3@61:2]
  %tmp_38_i = add nsw i32 %recentdatapoints_head_i_load, 1, !dbg !531 ; [#uses=2 type=i32] [debug line = 21:3@61:2]
  %tmp_39_i = icmp eq i32 %tmp_38_i, 20, !dbg !532 ; [#uses=1 type=i1] [debug line = 22:3@61:2]
  %p_tmp_i = select i1 %tmp_39_i, i32 0, i32 %tmp_38_i, !dbg !532 ; [#uses=4 type=i32] [debug line = 22:3@61:2]
  store i32 %p_tmp_i, i32* @recentdatapoints_head_i, align 4, !dbg !531 ; [debug line = 21:3@61:2]
  store i32 %tmp_36_i, i32* @recentdatapoints_sum, align 4, !dbg !526 ; [debug line = 15:4@61:2]
  %AbeatDelay_load = load i32* @AbeatDelay, align 4, !dbg !533 ; [#uses=1 type=i32] [debug line = 62:2]
  %tmp_3 = add nsw i32 %AbeatDelay_load, 1, !dbg !533 ; [#uses=3 type=i32] [debug line = 62:2]
  %VbeatDelay_load = load i32* @VbeatDelay, align 4, !dbg !534 ; [#uses=1 type=i32] [debug line = 63:2]
  %tmp_4 = add nsw i32 %VbeatDelay_load, 1, !dbg !534 ; [#uses=3 type=i32] [debug line = 63:2]
  %VbeatFallDelay_load = load i32* @VbeatFallDelay, align 4, !dbg !535 ; [#uses=1 type=i32] [debug line = 64:2]
  %tmp_5 = add nsw i32 %VbeatFallDelay_load, 1, !dbg !535 ; [#uses=3 type=i32] [debug line = 64:2]
  %AstimDelay_load_op = add i32 %AstimDelay_load, 1, !dbg !481 ; [#uses=1 type=i32] [debug line = 65:2]
  %tmp_6 = select i1 %reset_A_V_read, i32 1, i32 %AstimDelay_load_op, !dbg !481 ; [#uses=2 type=i32] [debug line = 65:2]
  %VstimDelay_load_op = add i32 %VstimDelay_load, 1, !dbg !482 ; [#uses=1 type=i32] [debug line = 66:2]
  %tmp_7 = select i1 %reset_V_V_read, i32 1, i32 %VstimDelay_load_op, !dbg !482 ; [#uses=2 type=i32] [debug line = 66:2]
  %tmp_i1 = icmp eq i32 %tmp_37_i, 0, !dbg !536   ; [#uses=1 type=i1] [debug line = 33:3@71:19]
  %i = add nsw i32 %p_tmp_i, -1, !dbg !540        ; [#uses=2 type=i32] [debug line = 35:21@71:19]
  call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !541) nounwind, !dbg !540 ; [debug line = 35:21@71:19] [debug variable = i]
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i, i32 31), !dbg !542 ; [#uses=1 type=i1] [debug line = 36:3@71:19]
  %i_1 = add nsw i32 %p_tmp_i, 19, !dbg !543      ; [#uses=1 type=i32] [debug line = 37:4@71:19]
  call void @llvm.dbg.value(metadata !{i32 %i_1}, i64 0, metadata !541) nounwind, !dbg !543 ; [debug line = 37:4@71:19] [debug variable = i]
  %p_i = select i1 %tmp, i32 %i_1, i32 %i, !dbg !542 ; [#uses=1 type=i32] [debug line = 36:3@71:19]
  %tmp_40_i = sext i32 %p_i to i64, !dbg !544     ; [#uses=1 type=i64] [debug line = 38:3@71:19]
  %recentdatapoints_data_addr_1 = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_40_i, !dbg !544 ; [#uses=1 type=i16*] [debug line = 38:3@71:19]
  %recentdatapoints_data_load_1 = load i16* %recentdatapoints_data_addr_1, align 2 ; [#uses=1 type=i16]
  %datapointV = select i1 %tmp_i1, i16 0, i16 %recentdatapoints_data_load_1, !dbg !539 ; [#uses=1 type=i16] [debug line = 71:19]
  %datapointV_cast = sext i16 %datapointV to i17, !dbg !539 ; [#uses=2 type=i17] [debug line = 71:19]
  call void @llvm.dbg.value(metadata !{i16 %datapointV}, i64 0, metadata !545), !dbg !539 ; [debug line = 71:19] [debug variable = datapointV]
  %vflip_load = load i8* @vflip, align 1, !dbg !546 ; [#uses=1 type=i8] [debug line = 73:2]
  %tmp_9 = icmp eq i8 %vflip_load, -1, !dbg !546  ; [#uses=1 type=i1] [debug line = 73:2]
  %datapointV_1 = sub i17 0, %datapointV_cast, !dbg !547 ; [#uses=1 type=i17] [debug line = 74:3]
  call void @llvm.dbg.value(metadata !{i17 %datapointV_1}, i64 0, metadata !545), !dbg !547 ; [debug line = 74:3] [debug variable = datapointV]
  %p_s = select i1 %tmp_9, i17 %datapointV_1, i17 %datapointV_cast, !dbg !546 ; [#uses=1 type=i17] [debug line = 73:2]
  %p_cast = sext i17 %p_s to i32, !dbg !546       ; [#uses=1 type=i32] [debug line = 73:2]
  %v_thresh_load = load i32* @v_thresh, align 4, !dbg !548 ; [#uses=1 type=i32] [debug line = 77:2]
  %tmp_s = icmp sgt i32 %p_cast, %v_thresh_load, !dbg !548 ; [#uses=2 type=i1] [debug line = 77:2]
  %val_assign_1 = zext i1 %tmp_s to i32, !dbg !548 ; [#uses=1 type=i32] [debug line = 77:2]
  %recentVBools_sum_load = load i32* @recentVBools_sum, align 4, !dbg !548 ; [#uses=2 type=i32] [debug line = 77:2]
  %recentVBools_head_i_load = load i32* @recentVBools_head_i, align 4, !dbg !548 ; [#uses=2 type=i32] [debug line = 77:2]
  %recentVBools_len_load = load i32* @recentVBools_len, align 4, !dbg !548 ; [#uses=2 type=i32] [debug line = 77:2]
  call void @llvm.dbg.value(metadata !{i32 %recentVBools_sum_load}, i64 0, metadata !549), !dbg !580 ; [debug line = 13:7@77:2] [debug variable = CircularBuffer<int, 30>.sum]
  call void @llvm.dbg.value(metadata !{i32 %recentVBools_head_i_load}, i64 0, metadata !581), !dbg !580 ; [debug line = 13:7@77:2] [debug variable = CircularBuffer<int, 30>.head_i]
  call void @llvm.dbg.value(metadata !{i32 %recentVBools_len_load}, i64 0, metadata !585), !dbg !580 ; [debug line = 13:7@77:2] [debug variable = CircularBuffer<int, 30>.len]
  call void @llvm.dbg.value(metadata !{i32 %val_assign_1}, i64 0, metadata !589), !dbg !590 ; [debug line = 13:14@77:2] [debug variable = val]
  %tmp_i2 = icmp eq i32 %recentVBools_len_load, 30, !dbg !591 ; [#uses=2 type=i1] [debug line = 14:3@77:2]
  %tmp_i2_8 = sext i32 %recentVBools_head_i_load to i64, !dbg !593 ; [#uses=1 type=i64] [debug line = 15:4@77:2]
  %recentVBools_data_addr = getelementptr [30 x i1]* @recentVBools_data, i64 0, i64 %tmp_i2_8, !dbg !593 ; [#uses=2 type=i1*] [debug line = 15:4@77:2]
  %recentVBools_data_load = load i1* %recentVBools_data_addr, align 1 ; [#uses=1 type=i1]
  %extLd1 = zext i1 %recentVBools_data_load to i32 ; [#uses=1 type=i32]
  %tmp_28_i = sub nsw i32 %recentVBools_sum_load, %extLd1, !dbg !593 ; [#uses=1 type=i32] [debug line = 15:4@77:2]
  %CircularBuffer_int_30_sum_i = select i1 %tmp_i2, i32 %tmp_28_i, i32 %recentVBools_sum_load ; [#uses=1 type=i32]
  store i1 %tmp_s, i1* %recentVBools_data_addr, align 1, !dbg !595 ; [debug line = 18:3@77:2]
  %CircularBuffer_sum_read_assign = add nsw i32 %CircularBuffer_int_30_sum_i, %val_assign_1, !dbg !596 ; [#uses=2 type=i32] [debug line = 19:3@77:2]
  %CircularBuffer_len_read_assign = add i32 %recentVBools_len_load, 1, !dbg !597 ; [#uses=1 type=i32] [debug line = 20:3@77:2]
  %CircularBuffer_len_read_assign_1 = select i1 %tmp_i2, i32 30, i32 %CircularBuffer_len_read_assign, !dbg !597 ; [#uses=6 type=i32] [debug line = 20:3@77:2]
  %tmp_32_i = add nsw i32 %recentVBools_head_i_load, 1, !dbg !598 ; [#uses=2 type=i32] [debug line = 21:3@77:2]
  %tmp_33_i = icmp eq i32 %tmp_32_i, 30, !dbg !599 ; [#uses=1 type=i1] [debug line = 22:3@77:2]
  %CircularBuffer_head_i_read_ass = select i1 %tmp_33_i, i32 0, i32 %tmp_32_i, !dbg !599 ; [#uses=3 type=i32] [debug line = 22:3@77:2]
  store i32 %CircularBuffer_head_i_read_ass, i32* @recentVBools_head_i, align 4, !dbg !548 ; [debug line = 77:2]
  %tmp_8 = icmp sgt i32 %CircularBuffer_len_read_assign_1, %VCaptureThresh_loc, !dbg !484 ; [#uses=1 type=i1] [debug line = 79:2]
  store i32 %tmp_7, i32* @VstimDelay, align 4, !dbg !600 ; [debug line = 47:3]
  store i32 %tmp_6, i32* @AstimDelay, align 4, !dbg !602 ; [debug line = 42:3]
  br i1 %tmp_8, label %1, label %._crit_edge48, !dbg !484 ; [debug line = 79:2]

; <label>:1                                       ; preds = %._crit_edge47_ifconv
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_sum_read_assign}, i64 0, metadata !604), !dbg !609 ; [debug line = 25:4@81:3] [debug variable = CircularBuffer<int, 30>.sum]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_head_i_read_ass}, i64 0, metadata !610), !dbg !609 ; [debug line = 25:4@81:3] [debug variable = CircularBuffer<int, 30>.head_i]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_read_assign_1}, i64 0, metadata !611), !dbg !609 ; [debug line = 25:4@81:3] [debug variable = CircularBuffer<int, 30>.len]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_head_i_read_ass}, i64 0, metadata !612), !dbg !617 ; [debug line = 41:4@26:16@81:3] [debug variable = CircularBuffer<int, 30>.head_i]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_read_assign_1}, i64 0, metadata !618), !dbg !617 ; [debug line = 41:4@26:16@81:3] [debug variable = CircularBuffer<int, 30>.len]
  %i_2 = sub nsw i32 %CircularBuffer_head_i_read_ass, %CircularBuffer_len_read_assign_1, !dbg !619 ; [#uses=3 type=i32] [debug line = 44:23@26:16@81:3]
  call void @llvm.dbg.value(metadata !{i32 %i_2}, i64 0, metadata !621), !dbg !619 ; [debug line = 44:23@26:16@81:3] [debug variable = i]
  %tmp_25 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_2, i32 31), !dbg !622 ; [#uses=1 type=i1] [debug line = 45:3@26:16@81:3]
  %i_3 = add nsw i32 %i_2, 30, !dbg !623          ; [#uses=1 type=i32] [debug line = 46:4@26:16@81:3]
  call void @llvm.dbg.value(metadata !{i32 %i_3}, i64 0, metadata !621), !dbg !623 ; [debug line = 46:4@26:16@81:3] [debug variable = i]
  %i_4 = select i1 %tmp_25, i32 %i_3, i32 %i_2, !dbg !622 ; [#uses=1 type=i32] [debug line = 45:3@26:16@81:3]
  call void @llvm.dbg.value(metadata !{i32 %i_4}, i64 0, metadata !621), !dbg !622 ; [debug line = 45:3@26:16@81:3] [debug variable = i]
  %tmp_27_i_i = sext i32 %i_4 to i64, !dbg !624   ; [#uses=1 type=i64] [debug line = 47:3@26:16@81:3]
  %recentVBools_data_addr_1 = getelementptr [30 x i1]* @recentVBools_data, i64 0, i64 %tmp_27_i_i, !dbg !624 ; [#uses=1 type=i1*] [debug line = 47:3@26:16@81:3]
  %recentVBools_data_load_1 = load i1* %recentVBools_data_addr_1, align 1 ; [#uses=1 type=i1]
  %not_tmp_i_i = icmp ne i32 %CircularBuffer_len_read_assign_1, 0, !dbg !615 ; [#uses=1 type=i1] [debug line = 26:16@81:3]
  %toReturn_4 = and i1 %recentVBools_data_load_1, %not_tmp_i_i, !dbg !615 ; [#uses=1 type=i1] [debug line = 26:16@81:3]
  %toReturn_i_cast = zext i1 %toReturn_4 to i32, !dbg !615 ; [#uses=1 type=i32] [debug line = 26:16@81:3]
  call void @llvm.dbg.value(metadata !{i1 %toReturn_4}, i64 0, metadata !625), !dbg !615 ; [debug line = 26:16@81:3] [debug variable = toReturn]
  %CircularBuffer_sum_write_assig = sub nsw i32 %CircularBuffer_sum_read_assign, %toReturn_i_cast, !dbg !626 ; [#uses=1 type=i32] [debug line = 27:3@81:3]
  %CircularBuffer_len_write_assig = add nsw i32 %CircularBuffer_len_read_assign_1, -1, !dbg !627 ; [#uses=2 type=i32] [debug line = 28:3@81:3]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_sum_write_assig}, i64 0, metadata !628), !dbg !609 ; [debug line = 25:4@81:3] [debug variable = CircularBuffer<int, 30>.sum]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_write_assig}, i64 0, metadata !629), !dbg !609 ; [debug line = 25:4@81:3] [debug variable = CircularBuffer<int, 30>.len]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_sum_write_assig}, i64 0, metadata !630), !dbg !632 ; [debug line = 25:4@82:3] [debug variable = CircularBuffer<int, 30>.sum]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_head_i_read_ass}, i64 0, metadata !633), !dbg !632 ; [debug line = 25:4@82:3] [debug variable = CircularBuffer<int, 30>.head_i]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_write_assig}, i64 0, metadata !634), !dbg !632 ; [debug line = 25:4@82:3] [debug variable = CircularBuffer<int, 30>.len]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_head_i_read_ass}, i64 0, metadata !635), !dbg !637 ; [debug line = 41:4@26:16@82:3] [debug variable = CircularBuffer<int, 30>.head_i]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_write_assig}, i64 0, metadata !638), !dbg !637 ; [debug line = 41:4@26:16@82:3] [debug variable = CircularBuffer<int, 30>.len]
  %i_5 = sub nsw i32 %CircularBuffer_head_i_read_ass, %CircularBuffer_len_write_assig, !dbg !639 ; [#uses=3 type=i32] [debug line = 44:23@26:16@82:3]
  call void @llvm.dbg.value(metadata !{i32 %i_5}, i64 0, metadata !640), !dbg !639 ; [debug line = 44:23@26:16@82:3] [debug variable = i]
  %tmp_26 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_5, i32 31), !dbg !641 ; [#uses=1 type=i1] [debug line = 45:3@26:16@82:3]
  %i_6 = add nsw i32 %i_5, 30, !dbg !642          ; [#uses=1 type=i32] [debug line = 46:4@26:16@82:3]
  call void @llvm.dbg.value(metadata !{i32 %i_6}, i64 0, metadata !640), !dbg !642 ; [debug line = 46:4@26:16@82:3] [debug variable = i]
  %i_7 = select i1 %tmp_26, i32 %i_6, i32 %i_5, !dbg !641 ; [#uses=1 type=i32] [debug line = 45:3@26:16@82:3]
  call void @llvm.dbg.value(metadata !{i32 %i_7}, i64 0, metadata !640), !dbg !641 ; [debug line = 45:3@26:16@82:3] [debug variable = i]
  %tmp_27_i_i1 = sext i32 %i_7 to i64, !dbg !643  ; [#uses=1 type=i64] [debug line = 47:3@26:16@82:3]
  %recentVBools_data_addr_2 = getelementptr [30 x i1]* @recentVBools_data, i64 0, i64 %tmp_27_i_i1, !dbg !643 ; [#uses=1 type=i1*] [debug line = 47:3@26:16@82:3]
  %recentVBools_data_load_2 = load i1* %recentVBools_data_addr_2, align 1 ; [#uses=1 type=i1]
  %not_tmp_i_i6 = icmp ne i32 %CircularBuffer_len_write_assig, 0, !dbg !636 ; [#uses=1 type=i1] [debug line = 26:16@82:3]
  %toReturn_5 = and i1 %recentVBools_data_load_2, %not_tmp_i_i6, !dbg !636 ; [#uses=1 type=i1] [debug line = 26:16@82:3]
  %toReturn_i14_cast = zext i1 %toReturn_5 to i32, !dbg !636 ; [#uses=1 type=i32] [debug line = 26:16@82:3]
  call void @llvm.dbg.value(metadata !{i1 %toReturn_5}, i64 0, metadata !644), !dbg !636 ; [debug line = 26:16@82:3] [debug variable = toReturn]
  %CircularBuffer_sum_write_assig_1 = sub nsw i32 %CircularBuffer_sum_write_assig, %toReturn_i14_cast, !dbg !645 ; [#uses=1 type=i32] [debug line = 27:3@82:3]
  %CircularBuffer_len_write_assig_1 = add nsw i32 %CircularBuffer_len_read_assign_1, -2, !dbg !646 ; [#uses=1 type=i32] [debug line = 28:3@82:3]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_sum_write_assig_1}, i64 0, metadata !647), !dbg !632 ; [debug line = 25:4@82:3] [debug variable = CircularBuffer<int, 30>.sum]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_write_assig_1}, i64 0, metadata !648), !dbg !632 ; [debug line = 25:4@82:3] [debug variable = CircularBuffer<int, 30>.len]
  br label %._crit_edge48, !dbg !649              ; [debug line = 83:2]

._crit_edge48:                                    ; preds = %1, %._crit_edge47_ifconv
  %sum = phi i32 [ %CircularBuffer_sum_write_assig_1, %1 ], [ %CircularBuffer_sum_read_assign, %._crit_edge47_ifconv ] ; [#uses=2 type=i32]
  %recentVBools_len_new = phi i32 [ %CircularBuffer_len_write_assig_1, %1 ], [ %CircularBuffer_len_read_assign_1, %._crit_edge47_ifconv ] ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %sum}, i64 0, metadata !650), !dbg !651 ; [debug line = 86:28] [debug variable = sum]
  %tmp_1 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %VCaptureThresh_loc, i32 1, i32 31), !dbg !652 ; [#uses=1 type=i31] [debug line = 88:2]
  %tmp_2 = sext i31 %tmp_1 to i32, !dbg !652      ; [#uses=1 type=i32] [debug line = 88:2]
  %tmp_10 = icmp sgt i32 %sum, %tmp_2, !dbg !652  ; [#uses=1 type=i1] [debug line = 88:2]
  store i32 %recentVBools_len_new, i32* @recentVBools_len, align 4, !dbg !548 ; [debug line = 77:2]
  store i32 %sum, i32* @recentVBools_sum, align 4, !dbg !548 ; [debug line = 77:2]
  %last_sample_is_V_V_load = load i1* @last_sample_is_V_V, align 1, !dbg !653 ; [#uses=4 type=i1] [debug line = 1871:9@90:6]
  br i1 %tmp_10, label %2, label %4, !dbg !652    ; [debug line = 88:2]

; <label>:2                                       ; preds = %._crit_edge48
  br i1 %last_sample_is_V_V_load, label %._crit_edge49_ifconv, label %3, !dbg !656 ; [debug line = 90:6]

; <label>:3                                       ; preds = %2
  store i1 true, i1* @last_sample_is_V_V, align 1, !dbg !658 ; [debug line = 277:10@93:4]
  br label %._crit_edge49_ifconv, !dbg !663       ; [debug line = 94:3]

; <label>:4                                       ; preds = %._crit_edge48
  br i1 %last_sample_is_V_V_load, label %5, label %._crit_edge49_ifconv, !dbg !664 ; [debug line = 96:10]

; <label>:5                                       ; preds = %4
  store i1 false, i1* @last_sample_is_V_V, align 1, !dbg !665 ; [debug line = 277:10@99:3]
  br label %._crit_edge49_ifconv, !dbg !668       ; [debug line = 100:2]

._crit_edge49_ifconv:                             ; preds = %5, %4, %3, %2
  %VbeatDelay_new_1 = phi i32 [ %tmp_4, %2 ], [ 0, %3 ], [ %tmp_4, %5 ], [ %tmp_4, %4 ] ; [#uses=4 type=i32]
  %VbeatFallDelay_new_1 = phi i32 [ %tmp_5, %2 ], [ %tmp_5, %3 ], [ 0, %5 ], [ %tmp_5, %4 ] ; [#uses=2 type=i32]
  %last_sample_is_V_V_loc_2 = phi i1 [ %last_sample_is_V_V_load, %2 ], [ true, %3 ], [ false, %5 ], [ %last_sample_is_V_V_load, %4 ] ; [#uses=2 type=i1]
  %tmp_i3 = icmp eq i32 %tmp_37_i, 20, !dbg !669  ; [#uses=1 type=i1] [debug line = 53:3@103:19]
  %tmp_i3_9 = sext i32 %p_tmp_i to i64, !dbg !673 ; [#uses=1 type=i64] [debug line = 54:4@103:19]
  %recentdatapoints_data_addr_2 = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_i3_9, !dbg !673 ; [#uses=1 type=i16*] [debug line = 54:4@103:19]
  %recentdatapoints_data_load_2 = load i16* %recentdatapoints_data_addr_2, align 2 ; [#uses=1 type=i16]
  %datapointA = select i1 %tmp_i3, i16 %recentdatapoints_data_load_2, i16 0, !dbg !672 ; [#uses=1 type=i16] [debug line = 103:19]
  %datapointA_cast = sext i16 %datapointA to i17, !dbg !672 ; [#uses=2 type=i17] [debug line = 103:19]
  call void @llvm.dbg.value(metadata !{i16 %datapointA}, i64 0, metadata !674), !dbg !672 ; [debug line = 103:19] [debug variable = datapointA]
  %aflip_load = load i8* @aflip, align 1, !dbg !675 ; [#uses=1 type=i8] [debug line = 105:2]
  %tmp_11 = icmp eq i8 %aflip_load, -1, !dbg !675 ; [#uses=1 type=i1] [debug line = 105:2]
  %datapointA_1 = sub i17 0, %datapointA_cast, !dbg !676 ; [#uses=1 type=i17] [debug line = 106:3]
  call void @llvm.dbg.value(metadata !{i17 %datapointA_1}, i64 0, metadata !674), !dbg !676 ; [debug line = 106:3] [debug variable = datapointA]
  %p_1 = select i1 %tmp_11, i17 %datapointA_1, i17 %datapointA_cast, !dbg !675 ; [#uses=1 type=i17] [debug line = 105:2]
  %p_1_cast = sext i17 %p_1 to i32, !dbg !675     ; [#uses=1 type=i32] [debug line = 105:2]
  %a_thresh_load = load i32* @a_thresh, align 4, !dbg !677 ; [#uses=1 type=i32] [debug line = 108:2]
  %tmp_12 = icmp sgt i32 %p_1_cast, %a_thresh_load, !dbg !677 ; [#uses=2 type=i1] [debug line = 108:2]
  %val_assign_2 = zext i1 %tmp_12 to i32, !dbg !677 ; [#uses=1 type=i32] [debug line = 108:2]
  %recentABools_sum_load = load i32* @recentABools_sum, align 4, !dbg !677 ; [#uses=2 type=i32] [debug line = 108:2]
  %recentABools_head_i_load = load i32* @recentABools_head_i, align 4, !dbg !677 ; [#uses=2 type=i32] [debug line = 108:2]
  %recentABools_len_load = load i32* @recentABools_len, align 4, !dbg !677 ; [#uses=2 type=i32] [debug line = 108:2]
  call void @llvm.dbg.value(metadata !{i32 %recentABools_sum_load}, i64 0, metadata !678), !dbg !679 ; [debug line = 13:7@108:2] [debug variable = CircularBuffer<int, 30>.sum]
  call void @llvm.dbg.value(metadata !{i32 %recentABools_head_i_load}, i64 0, metadata !680), !dbg !679 ; [debug line = 13:7@108:2] [debug variable = CircularBuffer<int, 30>.head_i]
  call void @llvm.dbg.value(metadata !{i32 %recentABools_len_load}, i64 0, metadata !681), !dbg !679 ; [debug line = 13:7@108:2] [debug variable = CircularBuffer<int, 30>.len]
  call void @llvm.dbg.value(metadata !{i32 %val_assign_2}, i64 0, metadata !682), !dbg !683 ; [debug line = 13:14@108:2] [debug variable = val]
  %tmp_i4 = icmp eq i32 %recentABools_len_load, 30, !dbg !684 ; [#uses=2 type=i1] [debug line = 14:3@108:2]
  %tmp_i4_10 = sext i32 %recentABools_head_i_load to i64, !dbg !685 ; [#uses=1 type=i64] [debug line = 15:4@108:2]
  %recentABools_data_addr = getelementptr [30 x i1]* @recentABools_data, i64 0, i64 %tmp_i4_10, !dbg !685 ; [#uses=2 type=i1*] [debug line = 15:4@108:2]
  %recentABools_data_load = load i1* %recentABools_data_addr, align 1 ; [#uses=1 type=i1]
  %extLd2 = zext i1 %recentABools_data_load to i32 ; [#uses=1 type=i32]
  %tmp_28_i1 = sub nsw i32 %recentABools_sum_load, %extLd2, !dbg !685 ; [#uses=1 type=i32] [debug line = 15:4@108:2]
  %CircularBuffer_int_30_sum_i1 = select i1 %tmp_i4, i32 %tmp_28_i1, i32 %recentABools_sum_load ; [#uses=1 type=i32]
  store i1 %tmp_12, i1* %recentABools_data_addr, align 1, !dbg !686 ; [debug line = 18:3@108:2]
  %CircularBuffer_sum_read_assign_1 = add nsw i32 %CircularBuffer_int_30_sum_i1, %val_assign_2, !dbg !687 ; [#uses=2 type=i32] [debug line = 19:3@108:2]
  %CircularBuffer_len_read_assign_2 = add i32 %recentABools_len_load, 1, !dbg !688 ; [#uses=1 type=i32] [debug line = 20:3@108:2]
  %CircularBuffer_len_read_assign_3 = select i1 %tmp_i4, i32 30, i32 %CircularBuffer_len_read_assign_2, !dbg !688 ; [#uses=6 type=i32] [debug line = 20:3@108:2]
  %tmp_32_i1 = add nsw i32 %recentABools_head_i_load, 1, !dbg !689 ; [#uses=2 type=i32] [debug line = 21:3@108:2]
  %tmp_33_i1 = icmp eq i32 %tmp_32_i1, 30, !dbg !690 ; [#uses=1 type=i1] [debug line = 22:3@108:2]
  %CircularBuffer_head_i_read_ass_1 = select i1 %tmp_33_i1, i32 0, i32 %tmp_32_i1, !dbg !690 ; [#uses=3 type=i32] [debug line = 22:3@108:2]
  store i32 %CircularBuffer_head_i_read_ass_1, i32* @recentABools_head_i, align 4, !dbg !677 ; [debug line = 108:2]
  %tmp_13 = icmp sgt i32 %CircularBuffer_len_read_assign_3, %ACaptureThresh_loc, !dbg !483 ; [#uses=1 type=i1] [debug line = 110:2]
  store i32 %VbeatFallDelay_new_1, i32* @VbeatFallDelay, align 4, !dbg !535 ; [debug line = 64:2]
  store i32 %VbeatDelay_new_1, i32* @VbeatDelay, align 4, !dbg !534 ; [debug line = 63:2]
  br i1 %tmp_13, label %6, label %._crit_edge51, !dbg !483 ; [debug line = 110:2]

; <label>:6                                       ; preds = %._crit_edge49_ifconv
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_sum_read_assign_1}, i64 0, metadata !691), !dbg !694 ; [debug line = 25:4@112:3] [debug variable = CircularBuffer<int, 30>.sum]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_head_i_read_ass_1}, i64 0, metadata !695), !dbg !694 ; [debug line = 25:4@112:3] [debug variable = CircularBuffer<int, 30>.head_i]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_read_assign_3}, i64 0, metadata !696), !dbg !694 ; [debug line = 25:4@112:3] [debug variable = CircularBuffer<int, 30>.len]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_head_i_read_ass_1}, i64 0, metadata !697), !dbg !699 ; [debug line = 41:4@26:16@112:3] [debug variable = CircularBuffer<int, 30>.head_i]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_read_assign_3}, i64 0, metadata !700), !dbg !699 ; [debug line = 41:4@26:16@112:3] [debug variable = CircularBuffer<int, 30>.len]
  %i_8 = sub nsw i32 %CircularBuffer_head_i_read_ass_1, %CircularBuffer_len_read_assign_3, !dbg !701 ; [#uses=3 type=i32] [debug line = 44:23@26:16@112:3]
  call void @llvm.dbg.value(metadata !{i32 %i_8}, i64 0, metadata !702), !dbg !701 ; [debug line = 44:23@26:16@112:3] [debug variable = i]
  %tmp_27 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_8, i32 31), !dbg !703 ; [#uses=1 type=i1] [debug line = 45:3@26:16@112:3]
  %i_9 = add nsw i32 %i_8, 30, !dbg !704          ; [#uses=1 type=i32] [debug line = 46:4@26:16@112:3]
  call void @llvm.dbg.value(metadata !{i32 %i_9}, i64 0, metadata !702), !dbg !704 ; [debug line = 46:4@26:16@112:3] [debug variable = i]
  %i_10 = select i1 %tmp_27, i32 %i_9, i32 %i_8, !dbg !703 ; [#uses=1 type=i32] [debug line = 45:3@26:16@112:3]
  call void @llvm.dbg.value(metadata !{i32 %i_10}, i64 0, metadata !702), !dbg !703 ; [debug line = 45:3@26:16@112:3] [debug variable = i]
  %tmp_27_i_i2 = sext i32 %i_10 to i64, !dbg !705 ; [#uses=1 type=i64] [debug line = 47:3@26:16@112:3]
  %recentABools_data_addr_1 = getelementptr [30 x i1]* @recentABools_data, i64 0, i64 %tmp_27_i_i2, !dbg !705 ; [#uses=1 type=i1*] [debug line = 47:3@26:16@112:3]
  %recentABools_data_load_1 = load i1* %recentABools_data_addr_1, align 1 ; [#uses=1 type=i1]
  %not_tmp_i_i1 = icmp ne i32 %CircularBuffer_len_read_assign_3, 0, !dbg !698 ; [#uses=1 type=i1] [debug line = 26:16@112:3]
  %toReturn_6 = and i1 %recentABools_data_load_1, %not_tmp_i_i1, !dbg !698 ; [#uses=1 type=i1] [debug line = 26:16@112:3]
  %toReturn_i27_cast = zext i1 %toReturn_6 to i32, !dbg !698 ; [#uses=1 type=i32] [debug line = 26:16@112:3]
  call void @llvm.dbg.value(metadata !{i1 %toReturn_6}, i64 0, metadata !706), !dbg !698 ; [debug line = 26:16@112:3] [debug variable = toReturn]
  %CircularBuffer_sum_write_assig_2 = sub nsw i32 %CircularBuffer_sum_read_assign_1, %toReturn_i27_cast, !dbg !707 ; [#uses=1 type=i32] [debug line = 27:3@112:3]
  %CircularBuffer_len_write_assig_2 = add nsw i32 %CircularBuffer_len_read_assign_3, -1, !dbg !708 ; [#uses=2 type=i32] [debug line = 28:3@112:3]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_sum_write_assig_2}, i64 0, metadata !709), !dbg !694 ; [debug line = 25:4@112:3] [debug variable = CircularBuffer<int, 30>.sum]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_write_assig_2}, i64 0, metadata !710), !dbg !694 ; [debug line = 25:4@112:3] [debug variable = CircularBuffer<int, 30>.len]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_sum_write_assig_2}, i64 0, metadata !711), !dbg !713 ; [debug line = 25:4@113:3] [debug variable = CircularBuffer<int, 30>.sum]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_head_i_read_ass_1}, i64 0, metadata !714), !dbg !713 ; [debug line = 25:4@113:3] [debug variable = CircularBuffer<int, 30>.head_i]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_write_assig_2}, i64 0, metadata !715), !dbg !713 ; [debug line = 25:4@113:3] [debug variable = CircularBuffer<int, 30>.len]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_head_i_read_ass_1}, i64 0, metadata !716), !dbg !718 ; [debug line = 41:4@26:16@113:3] [debug variable = CircularBuffer<int, 30>.head_i]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_write_assig_2}, i64 0, metadata !719), !dbg !718 ; [debug line = 41:4@26:16@113:3] [debug variable = CircularBuffer<int, 30>.len]
  %i_11 = sub nsw i32 %CircularBuffer_head_i_read_ass_1, %CircularBuffer_len_write_assig_2, !dbg !720 ; [#uses=3 type=i32] [debug line = 44:23@26:16@113:3]
  call void @llvm.dbg.value(metadata !{i32 %i_11}, i64 0, metadata !721), !dbg !720 ; [debug line = 44:23@26:16@113:3] [debug variable = i]
  %tmp_28 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_11, i32 31), !dbg !722 ; [#uses=1 type=i1] [debug line = 45:3@26:16@113:3]
  %i_12 = add nsw i32 %i_11, 30, !dbg !723        ; [#uses=1 type=i32] [debug line = 46:4@26:16@113:3]
  call void @llvm.dbg.value(metadata !{i32 %i_12}, i64 0, metadata !721), !dbg !723 ; [debug line = 46:4@26:16@113:3] [debug variable = i]
  %i_13 = select i1 %tmp_28, i32 %i_12, i32 %i_11, !dbg !722 ; [#uses=1 type=i32] [debug line = 45:3@26:16@113:3]
  call void @llvm.dbg.value(metadata !{i32 %i_13}, i64 0, metadata !721), !dbg !722 ; [debug line = 45:3@26:16@113:3] [debug variable = i]
  %tmp_27_i_i3 = sext i32 %i_13 to i64, !dbg !724 ; [#uses=1 type=i64] [debug line = 47:3@26:16@113:3]
  %recentABools_data_addr_2 = getelementptr [30 x i1]* @recentABools_data, i64 0, i64 %tmp_27_i_i3, !dbg !724 ; [#uses=1 type=i1*] [debug line = 47:3@26:16@113:3]
  %recentABools_data_load_2 = load i1* %recentABools_data_addr_2, align 1 ; [#uses=1 type=i1]
  %not_tmp_i_i2 = icmp ne i32 %CircularBuffer_len_write_assig_2, 0, !dbg !717 ; [#uses=1 type=i1] [debug line = 26:16@113:3]
  %toReturn_7 = and i1 %recentABools_data_load_2, %not_tmp_i_i2, !dbg !717 ; [#uses=1 type=i1] [debug line = 26:16@113:3]
  %toReturn_i40_cast = zext i1 %toReturn_7 to i32, !dbg !717 ; [#uses=1 type=i32] [debug line = 26:16@113:3]
  call void @llvm.dbg.value(metadata !{i1 %toReturn_7}, i64 0, metadata !725), !dbg !717 ; [debug line = 26:16@113:3] [debug variable = toReturn]
  %CircularBuffer_sum_write_assig_3 = sub nsw i32 %CircularBuffer_sum_write_assig_2, %toReturn_i40_cast, !dbg !726 ; [#uses=1 type=i32] [debug line = 27:3@113:3]
  %CircularBuffer_len_write_assig_3 = add nsw i32 %CircularBuffer_len_read_assign_3, -2, !dbg !727 ; [#uses=1 type=i32] [debug line = 28:3@113:3]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_sum_write_assig_3}, i64 0, metadata !728), !dbg !713 ; [debug line = 25:4@113:3] [debug variable = CircularBuffer<int, 30>.sum]
  call void @llvm.dbg.value(metadata !{i32 %CircularBuffer_len_write_assig_3}, i64 0, metadata !729), !dbg !713 ; [debug line = 25:4@113:3] [debug variable = CircularBuffer<int, 30>.len]
  br label %._crit_edge51, !dbg !730              ; [debug line = 114:2]

._crit_edge51:                                    ; preds = %6, %._crit_edge49_ifconv
  %sum_1 = phi i32 [ %CircularBuffer_sum_write_assig_3, %6 ], [ %CircularBuffer_sum_read_assign_1, %._crit_edge49_ifconv ] ; [#uses=2 type=i32]
  %recentABools_len_new = phi i32 [ %CircularBuffer_len_write_assig_3, %6 ], [ %CircularBuffer_len_read_assign_3, %._crit_edge49_ifconv ] ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %sum_1}, i64 0, metadata !650), !dbg !731 ; [debug line = 116:2] [debug variable = sum]
  %tmp_14 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %ACaptureThresh_loc, i32 1, i32 31), !dbg !732 ; [#uses=1 type=i31] [debug line = 118:2]
  %tmp_15 = sext i31 %tmp_14 to i32, !dbg !732    ; [#uses=1 type=i32] [debug line = 118:2]
  %tmp_16 = icmp sgt i32 %sum_1, %tmp_15, !dbg !732 ; [#uses=1 type=i1] [debug line = 118:2]
  store i32 %recentABools_len_new, i32* @recentABools_len, align 4, !dbg !677 ; [debug line = 108:2]
  store i32 %sum_1, i32* @recentABools_sum, align 4, !dbg !677 ; [debug line = 108:2]
  %last_sample_is_A_V_load = load i1* @last_sample_is_A_V, align 1, !dbg !733 ; [#uses=4 type=i1] [debug line = 1871:9@120:6]
  %tmp_17 = icmp sgt i32 %VbeatDelay_new_1, %VbeatFallDelay_new_1, !dbg !732 ; [#uses=1 type=i1] [debug line = 118:2]
  %or_cond1 = and i1 %tmp_16, %tmp_17, !dbg !732  ; [#uses=1 type=i1] [debug line = 118:2]
  br i1 %or_cond1, label %7, label %._crit_edge52, !dbg !732 ; [debug line = 118:2]

; <label>:7                                       ; preds = %._crit_edge51
  br i1 %last_sample_is_A_V_load, label %._crit_edge54_ifconv, label %8, !dbg !734 ; [debug line = 120:6]

; <label>:8                                       ; preds = %7
  store i1 true, i1* @last_sample_is_A_V, align 1, !dbg !736 ; [debug line = 277:10@123:4]
  br label %._crit_edge54_ifconv, !dbg !739       ; [debug line = 124:3]

._crit_edge52:                                    ; preds = %._crit_edge51
  br i1 %last_sample_is_A_V_load, label %9, label %._crit_edge54_ifconv, !dbg !740 ; [debug line = 127:10]

; <label>:9                                       ; preds = %._crit_edge52
  store i1 false, i1* @last_sample_is_A_V, align 1, !dbg !741 ; [debug line = 277:10@129:3]
  br label %._crit_edge54_ifconv, !dbg !744       ; [debug line = 130:2]

._crit_edge54_ifconv:                             ; preds = %9, %._crit_edge52, %8, %7
  %AbeatDelay_new = phi i32 [ %tmp_3, %7 ], [ 0, %8 ], [ %tmp_3, %9 ], [ %tmp_3, %._crit_edge52 ] ; [#uses=5 type=i32]
  %tmp_18 = phi i1 [ %last_sample_is_A_V_load, %7 ], [ true, %8 ], [ false, %9 ], [ %last_sample_is_A_V_load, %._crit_edge52 ] ; [#uses=1 type=i1]
  store i32 %AbeatDelay_new, i32* @AbeatDelay, align 4, !dbg !533 ; [debug line = 62:2]
  %tmp_20_not = icmp ne i32 %VbeatDelay_new_1, 0, !dbg !745 ; [#uses=2 type=i1] [debug line = 136:2]
  %last_sample_is_V_V_loc_2_not = xor i1 %last_sample_is_V_V_loc_2, true, !dbg !745 ; [#uses=1 type=i1] [debug line = 136:2]
  %brmerge = or i1 %tmp_20_not, %last_sample_is_V_V_loc_2_not, !dbg !745 ; [#uses=1 type=i1] [debug line = 136:2]
  %tmp_19 = icmp eq i32 %AbeatDelay_new, 0, !dbg !746 ; [#uses=1 type=i1] [debug line = 140:7]
  %p_2 = select i1 %tmp_18, i13 -4096, i13 0, !dbg !747 ; [#uses=1 type=i13] [debug line = 140:30]
  %sel_tmp = and i1 %brmerge, %tmp_19             ; [#uses=1 type=i1]
  %sel_tmp1 = select i1 %sel_tmp, i13 %p_2, i13 0 ; [#uses=1 type=i13]
  %tmp_20_not_not = xor i1 %tmp_20_not, true, !dbg !745 ; [#uses=1 type=i1] [debug line = 136:2]
  %sel_tmp2 = and i1 %last_sample_is_V_V_loc_2, %tmp_20_not_not, !dbg !745 ; [#uses=1 type=i1] [debug line = 136:2]
  %toReturn_1 = select i1 %sel_tmp2, i13 240, i13 %sel_tmp1 ; [#uses=3 type=i13]
  %tmp_20 = icmp sgt i32 %AbeatDelay_new, 1000, !dbg !748 ; [#uses=1 type=i1] [debug line = 145:2]
  %tmp_21 = icmp sgt i32 %tmp_6, %ACaptureThresh_loc, !dbg !748 ; [#uses=1 type=i1] [debug line = 145:2]
  %toReturn = or i13 %toReturn_1, 3840, !dbg !749 ; [#uses=1 type=i13] [debug line = 147:3]
  call void @llvm.dbg.value(metadata !{i13 %toReturn}, i64 0, metadata !751), !dbg !749 ; [debug line = 147:3] [debug variable = toReturn]
  %p_toReturn_1 = select i1 %tmp_21, i13 %toReturn, i13 %toReturn_1, !dbg !748 ; [#uses=1 type=i13] [debug line = 145:2]
  %toReturn_2 = select i1 %tmp_20, i13 %p_toReturn_1, i13 %toReturn_1 ; [#uses=3 type=i13]
  %tmp_22 = icmp sgt i32 %VbeatDelay_new_1, %AbeatDelay_new, !dbg !752 ; [#uses=1 type=i1] [debug line = 151:2]
  %tmp_23 = icmp sgt i32 %AbeatDelay_new, 900, !dbg !752 ; [#uses=1 type=i1] [debug line = 151:2]
  %or_cond = and i1 %tmp_22, %tmp_23, !dbg !752   ; [#uses=1 type=i1] [debug line = 151:2]
  %tmp_24 = icmp sgt i32 %tmp_7, %VCaptureThresh_loc, !dbg !752 ; [#uses=1 type=i1] [debug line = 151:2]
  %toReturn_3 = or i13 %toReturn_2, 15, !dbg !753 ; [#uses=1 type=i13] [debug line = 153:3]
  call void @llvm.dbg.value(metadata !{i13 %toReturn_3}, i64 0, metadata !751), !dbg !753 ; [debug line = 153:3] [debug variable = toReturn]
  %p_toReturn_2 = select i1 %tmp_24, i13 %toReturn_3, i13 %toReturn_2, !dbg !752 ; [#uses=1 type=i13] [debug line = 151:2]
  %UnifiedRetVal = select i1 %or_cond, i13 %p_toReturn_2, i13 %toReturn_2 ; [#uses=1 type=i13]
  %UnifiedRetVal_cast = sext i13 %UnifiedRetVal to i16 ; [#uses=1 type=i16]
  ret i16 %UnifiedRetVal_cast, !dbg !755          ; [debug line = 155:2]
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
!77 = metadata !{i32 786689, metadata !78, metadata !"data", metadata !79, i32 167772166, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!78 = metadata !{i32 786478, i32 0, metadata !79, metadata !"Decision", metadata !"Decision", metadata !"_Z8Decision7ap_uintILi1EES0_S0_iiccjjs", metadata !79, i32 6, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !101, i32 7} ; [ DW_TAG_subprogram ]
!79 = metadata !{i32 786473, metadata !"src/hls/channel.cpp", metadata !"/home/greg/everything/xilnx_design/cycle3", null} ; [ DW_TAG_file_type ]
!80 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !81, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!81 = metadata !{metadata !82, metadata !83, metadata !83, metadata !83, metadata !110, metadata !110, metadata !187, metadata !187, metadata !155, metadata !155, metadata !82}
!82 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!83 = metadata !{i32 786454, null, metadata !"dbool", metadata !79, i32 3, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_typedef ]
!84 = metadata !{i32 786434, null, metadata !"ap_uint<1>", metadata !85, i32 180, i64 8, i64 8, i32 0, i32 0, null, metadata !86, i32 0, null, metadata !455} ; [ DW_TAG_class_type ]
!85 = metadata !{i32 786473, metadata !"/opt/Xilinx/Vivado_HLS/2016.2/common/technology/autopilot/ap_int.h", metadata !"/home/greg/everything/xilnx_design/cycle3", null} ; [ DW_TAG_file_type ]
!86 = metadata !{metadata !87, metadata !375, metadata !379, metadata !385, metadata !391, metadata !394, metadata !397, metadata !400, metadata !403, metadata !406, metadata !409, metadata !412, metadata !415, metadata !418, metadata !421, metadata !424, metadata !427, metadata !430, metadata !433, metadata !436, metadata !439, metadata !443, metadata !446, metadata !450, metadata !453, metadata !454}
!87 = metadata !{i32 786460, metadata !84, null, metadata !85, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_inheritance ]
!88 = metadata !{i32 786434, null, metadata !"ap_int_base<1, false, true>", metadata !89, i32 1397, i64 8, i64 8, i32 0, i32 0, null, metadata !90, i32 0, null, metadata !372} ; [ DW_TAG_class_type ]
!89 = metadata !{i32 786473, metadata !"/opt/Xilinx/Vivado_HLS/2016.2/common/technology/autopilot/ap_int_syn.h", metadata !"/home/greg/everything/xilnx_design/cycle3", null} ; [ DW_TAG_file_type ]
!90 = metadata !{metadata !91, metadata !113, metadata !117, metadata !125, metadata !131, metadata !134, metadata !138, metadata !142, metadata !145, metadata !149, metadata !152, metadata !156, metadata !160, metadata !164, metadata !169, metadata !174, metadata !178, metadata !182, metadata !188, metadata !191, metadata !195, metadata !198, metadata !201, metadata !202, metadata !206, metadata !209, metadata !212, metadata !215, metadata !218, metadata !221, metadata !224, metadata !227, metadata !230, metadata !233, metadata !236, metadata !239, metadata !247, metadata !250, metadata !253, metadata !256, metadata !259, metadata !262, metadata !265, metadata !268, metadata !271, metadata !274, metadata !277, metadata !280, metadata !283, metadata !284, metadata !288, metadata !291, metadata !292, metadata !293, metadata !294, metadata !295, metadata !296, metadata !299, metadata !300, metadata !303, metadata !304, metadata !305, metadata !306, metadata !307, metadata !308, metadata !311, metadata !312, metadata !313, metadata !316, metadata !317, metadata !320, metadata !321, metadata !325, metadata !329, metadata !330, metadata !333, metadata !334, metadata !338, metadata !339, metadata !340, metadata !341, metadata !344, metadata !345, metadata !346, metadata !347, metadata !348, metadata !349, metadata !350, metadata !351, metadata !352, metadata !353, metadata !354, metadata !355, metadata !365, metadata !368, metadata !371}
!91 = metadata !{i32 786460, metadata !88, null, metadata !89, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !92} ; [ DW_TAG_inheritance ]
!92 = metadata !{i32 786434, null, metadata !"ssdm_int<1 + 1024 * 0, false>", metadata !93, i32 3, i64 8, i64 8, i32 0, i32 0, null, metadata !94, i32 0, null, metadata !108} ; [ DW_TAG_class_type ]
!93 = metadata !{i32 786473, metadata !"/opt/Xilinx/Vivado_HLS/2016.2/common/technology/autopilot/etc/autopilot_dt.def", metadata !"/home/greg/everything/xilnx_design/cycle3", null} ; [ DW_TAG_file_type ]
!94 = metadata !{metadata !95, metadata !97, metadata !103}
!95 = metadata !{i32 786445, metadata !92, metadata !"V", metadata !93, i32 3, i64 1, i64 1, i64 0, i32 0, metadata !96} ; [ DW_TAG_member ]
!96 = metadata !{i32 786468, null, metadata !"uint1", null, i32 0, i64 1, i64 1, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!97 = metadata !{i32 786478, i32 0, metadata !92, metadata !"ssdm_int", metadata !"ssdm_int", metadata !"", metadata !93, i32 3, metadata !98, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 3} ; [ DW_TAG_subprogram ]
!98 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!99 = metadata !{null, metadata !100}
!100 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !92} ; [ DW_TAG_pointer_type ]
!101 = metadata !{metadata !102}
!102 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!103 = metadata !{i32 786478, i32 0, metadata !92, metadata !"ssdm_int", metadata !"ssdm_int", metadata !"", metadata !93, i32 3, metadata !104, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !101, i32 3} ; [ DW_TAG_subprogram ]
!104 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !105, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!105 = metadata !{null, metadata !100, metadata !106}
!106 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !107} ; [ DW_TAG_reference_type ]
!107 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !92} ; [ DW_TAG_const_type ]
!108 = metadata !{metadata !109, metadata !111}
!109 = metadata !{i32 786480, null, metadata !"_AP_N", metadata !110, i64 1, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!110 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!111 = metadata !{i32 786480, null, metadata !"_AP_S", metadata !112, i64 0, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!112 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!113 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1438, metadata !114, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1438} ; [ DW_TAG_subprogram ]
!114 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !115, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!115 = metadata !{null, metadata !116}
!116 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !88} ; [ DW_TAG_pointer_type ]
!117 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base<1, false>", metadata !"ap_int_base<1, false>", metadata !"", metadata !89, i32 1450, metadata !118, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, metadata !122, i32 0, metadata !101, i32 1450} ; [ DW_TAG_subprogram ]
!118 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !119, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!119 = metadata !{null, metadata !116, metadata !120}
!120 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !121} ; [ DW_TAG_reference_type ]
!121 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_const_type ]
!122 = metadata !{metadata !123, metadata !124}
!123 = metadata !{i32 786480, null, metadata !"_AP_W2", metadata !110, i64 1, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!124 = metadata !{i32 786480, null, metadata !"_AP_S2", metadata !112, i64 0, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!125 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base<1, false>", metadata !"ap_int_base<1, false>", metadata !"", metadata !89, i32 1453, metadata !126, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, metadata !122, i32 0, metadata !101, i32 1453} ; [ DW_TAG_subprogram ]
!126 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !127, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!127 = metadata !{null, metadata !116, metadata !128}
!128 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !129} ; [ DW_TAG_reference_type ]
!129 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !130} ; [ DW_TAG_const_type ]
!130 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_volatile_type ]
!131 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1460, metadata !132, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1460} ; [ DW_TAG_subprogram ]
!132 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !133, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!133 = metadata !{null, metadata !116, metadata !112}
!134 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1461, metadata !135, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1461} ; [ DW_TAG_subprogram ]
!135 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !136, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!136 = metadata !{null, metadata !116, metadata !137}
!137 = metadata !{i32 786468, null, metadata !"signed char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!138 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1462, metadata !139, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1462} ; [ DW_TAG_subprogram ]
!139 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !140, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!140 = metadata !{null, metadata !116, metadata !141}
!141 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!142 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1463, metadata !143, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1463} ; [ DW_TAG_subprogram ]
!143 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !144, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!144 = metadata !{null, metadata !116, metadata !82}
!145 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1464, metadata !146, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1464} ; [ DW_TAG_subprogram ]
!146 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !147, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!147 = metadata !{null, metadata !116, metadata !148}
!148 = metadata !{i32 786468, null, metadata !"unsigned short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!149 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1465, metadata !150, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1465} ; [ DW_TAG_subprogram ]
!150 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !151, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!151 = metadata !{null, metadata !116, metadata !110}
!152 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1466, metadata !153, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1466} ; [ DW_TAG_subprogram ]
!153 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !154, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!154 = metadata !{null, metadata !116, metadata !155}
!155 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!156 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1467, metadata !157, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1467} ; [ DW_TAG_subprogram ]
!157 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !158, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!158 = metadata !{null, metadata !116, metadata !159}
!159 = metadata !{i32 786468, null, metadata !"long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!160 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1468, metadata !161, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1468} ; [ DW_TAG_subprogram ]
!161 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !162, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!162 = metadata !{null, metadata !116, metadata !163}
!163 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!164 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1469, metadata !165, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1469} ; [ DW_TAG_subprogram ]
!165 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !166, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!166 = metadata !{null, metadata !116, metadata !167}
!167 = metadata !{i32 786454, null, metadata !"ap_slong", metadata !89, i32 111, i64 0, i64 0, i64 0, i32 0, metadata !168} ; [ DW_TAG_typedef ]
!168 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!169 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1470, metadata !170, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1470} ; [ DW_TAG_subprogram ]
!170 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !171, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!171 = metadata !{null, metadata !116, metadata !172}
!172 = metadata !{i32 786454, null, metadata !"ap_ulong", metadata !89, i32 110, i64 0, i64 0, i64 0, i32 0, metadata !173} ; [ DW_TAG_typedef ]
!173 = metadata !{i32 786468, null, metadata !"long long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!174 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1471, metadata !175, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1471} ; [ DW_TAG_subprogram ]
!175 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !176, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!176 = metadata !{null, metadata !116, metadata !177}
!177 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!178 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1472, metadata !179, i1 false, i1 false, i32 0, i32 0, null, i32 384, i1 false, null, null, i32 0, metadata !101, i32 1472} ; [ DW_TAG_subprogram ]
!179 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !180, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!180 = metadata !{null, metadata !116, metadata !181}
!181 = metadata !{i32 786468, null, metadata !"double", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!182 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1499, metadata !183, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1499} ; [ DW_TAG_subprogram ]
!183 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !184, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!184 = metadata !{null, metadata !116, metadata !185}
!185 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !186} ; [ DW_TAG_pointer_type ]
!186 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !187} ; [ DW_TAG_const_type ]
!187 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!188 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1506, metadata !189, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1506} ; [ DW_TAG_subprogram ]
!189 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !190, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!190 = metadata !{null, metadata !116, metadata !185, metadata !137}
!191 = metadata !{i32 786478, i32 0, metadata !88, metadata !"read", metadata !"read", metadata !"_ZNV11ap_int_baseILi1ELb0ELb1EE4readEv", metadata !89, i32 1527, metadata !192, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1527} ; [ DW_TAG_subprogram ]
!192 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !193, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!193 = metadata !{metadata !88, metadata !194}
!194 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !130} ; [ DW_TAG_pointer_type ]
!195 = metadata !{i32 786478, i32 0, metadata !88, metadata !"write", metadata !"write", metadata !"_ZNV11ap_int_baseILi1ELb0ELb1EE5writeERKS0_", metadata !89, i32 1533, metadata !196, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1533} ; [ DW_TAG_subprogram ]
!196 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !197, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!197 = metadata !{null, metadata !194, metadata !120}
!198 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZNV11ap_int_baseILi1ELb0ELb1EEaSERVKS0_", metadata !89, i32 1545, metadata !199, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1545} ; [ DW_TAG_subprogram ]
!199 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !200, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!200 = metadata !{null, metadata !194, metadata !128}
!201 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZNV11ap_int_baseILi1ELb0ELb1EEaSERKS0_", metadata !89, i32 1554, metadata !196, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1554} ; [ DW_TAG_subprogram ]
!202 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEaSERVKS0_", metadata !89, i32 1577, metadata !203, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1577} ; [ DW_TAG_subprogram ]
!203 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !204, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!204 = metadata !{metadata !205, metadata !116, metadata !128}
!205 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_reference_type ]
!206 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEaSERKS0_", metadata !89, i32 1582, metadata !207, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1582} ; [ DW_TAG_subprogram ]
!207 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !208, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!208 = metadata !{metadata !205, metadata !116, metadata !120}
!209 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEaSEPKc", metadata !89, i32 1586, metadata !210, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1586} ; [ DW_TAG_subprogram ]
!210 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !211, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!211 = metadata !{metadata !205, metadata !116, metadata !185}
!212 = metadata !{i32 786478, i32 0, metadata !88, metadata !"set", metadata !"set", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE3setEPKca", metadata !89, i32 1594, metadata !213, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1594} ; [ DW_TAG_subprogram ]
!213 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !214, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!214 = metadata !{metadata !205, metadata !116, metadata !185, metadata !137}
!215 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEaSEa", metadata !89, i32 1608, metadata !216, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1608} ; [ DW_TAG_subprogram ]
!216 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !217, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!217 = metadata !{metadata !205, metadata !116, metadata !137}
!218 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEaSEh", metadata !89, i32 1609, metadata !219, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1609} ; [ DW_TAG_subprogram ]
!219 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !220, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!220 = metadata !{metadata !205, metadata !116, metadata !141}
!221 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEaSEs", metadata !89, i32 1610, metadata !222, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1610} ; [ DW_TAG_subprogram ]
!222 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !223, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!223 = metadata !{metadata !205, metadata !116, metadata !82}
!224 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEaSEt", metadata !89, i32 1611, metadata !225, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1611} ; [ DW_TAG_subprogram ]
!225 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !226, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!226 = metadata !{metadata !205, metadata !116, metadata !148}
!227 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEaSEi", metadata !89, i32 1612, metadata !228, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1612} ; [ DW_TAG_subprogram ]
!228 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !229, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!229 = metadata !{metadata !205, metadata !116, metadata !110}
!230 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEaSEj", metadata !89, i32 1613, metadata !231, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1613} ; [ DW_TAG_subprogram ]
!231 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !232, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!232 = metadata !{metadata !205, metadata !116, metadata !155}
!233 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEaSEx", metadata !89, i32 1614, metadata !234, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1614} ; [ DW_TAG_subprogram ]
!234 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !235, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!235 = metadata !{metadata !205, metadata !116, metadata !167}
!236 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator=", metadata !"operator=", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEaSEy", metadata !89, i32 1615, metadata !237, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1615} ; [ DW_TAG_subprogram ]
!237 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !238, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!238 = metadata !{metadata !205, metadata !116, metadata !172}
!239 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator unsigned char", metadata !"operator unsigned char", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EEcvhEv", metadata !89, i32 1653, metadata !240, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1653} ; [ DW_TAG_subprogram ]
!240 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !241, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!241 = metadata !{metadata !242, metadata !246}
!242 = metadata !{i32 786454, metadata !88, metadata !"RetType", metadata !89, i32 1402, i64 0, i64 0, i64 0, i32 0, metadata !243} ; [ DW_TAG_typedef ]
!243 = metadata !{i32 786454, metadata !244, metadata !"Type", metadata !89, i32 1370, i64 0, i64 0, i64 0, i32 0, metadata !141} ; [ DW_TAG_typedef ]
!244 = metadata !{i32 786434, null, metadata !"retval<1, false>", metadata !89, i32 1369, i64 8, i64 8, i32 0, i32 0, null, metadata !245, i32 0, null, metadata !108} ; [ DW_TAG_class_type ]
!245 = metadata !{i32 0}
!246 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !121} ; [ DW_TAG_pointer_type ]
!247 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_bool", metadata !"to_bool", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE7to_boolEv", metadata !89, i32 1659, metadata !248, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1659} ; [ DW_TAG_subprogram ]
!248 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !249, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!249 = metadata !{metadata !112, metadata !246}
!250 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_uchar", metadata !"to_uchar", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE8to_ucharEv", metadata !89, i32 1660, metadata !251, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1660} ; [ DW_TAG_subprogram ]
!251 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !252, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!252 = metadata !{metadata !141, metadata !246}
!253 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_char", metadata !"to_char", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE7to_charEv", metadata !89, i32 1661, metadata !254, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1661} ; [ DW_TAG_subprogram ]
!254 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !255, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!255 = metadata !{metadata !137, metadata !246}
!256 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_ushort", metadata !"to_ushort", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE9to_ushortEv", metadata !89, i32 1662, metadata !257, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1662} ; [ DW_TAG_subprogram ]
!257 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !258, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!258 = metadata !{metadata !148, metadata !246}
!259 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_short", metadata !"to_short", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE8to_shortEv", metadata !89, i32 1663, metadata !260, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1663} ; [ DW_TAG_subprogram ]
!260 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !261, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!261 = metadata !{metadata !82, metadata !246}
!262 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_int", metadata !"to_int", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE6to_intEv", metadata !89, i32 1664, metadata !263, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1664} ; [ DW_TAG_subprogram ]
!263 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !264, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!264 = metadata !{metadata !110, metadata !246}
!265 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_uint", metadata !"to_uint", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE7to_uintEv", metadata !89, i32 1665, metadata !266, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1665} ; [ DW_TAG_subprogram ]
!266 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !267, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!267 = metadata !{metadata !155, metadata !246}
!268 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_long", metadata !"to_long", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE7to_longEv", metadata !89, i32 1666, metadata !269, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1666} ; [ DW_TAG_subprogram ]
!269 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !270, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!270 = metadata !{metadata !159, metadata !246}
!271 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_ulong", metadata !"to_ulong", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE8to_ulongEv", metadata !89, i32 1667, metadata !272, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1667} ; [ DW_TAG_subprogram ]
!272 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !273, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!273 = metadata !{metadata !163, metadata !246}
!274 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_int64", metadata !"to_int64", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE8to_int64Ev", metadata !89, i32 1668, metadata !275, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1668} ; [ DW_TAG_subprogram ]
!275 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !276, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!276 = metadata !{metadata !167, metadata !246}
!277 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_uint64", metadata !"to_uint64", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE9to_uint64Ev", metadata !89, i32 1669, metadata !278, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1669} ; [ DW_TAG_subprogram ]
!278 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !279, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!279 = metadata !{metadata !172, metadata !246}
!280 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_double", metadata !"to_double", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE9to_doubleEv", metadata !89, i32 1670, metadata !281, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1670} ; [ DW_TAG_subprogram ]
!281 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !282, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!282 = metadata !{metadata !181, metadata !246}
!283 = metadata !{i32 786478, i32 0, metadata !88, metadata !"length", metadata !"length", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE6lengthEv", metadata !89, i32 1684, metadata !263, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1684} ; [ DW_TAG_subprogram ]
!284 = metadata !{i32 786478, i32 0, metadata !88, metadata !"length", metadata !"length", metadata !"_ZNVK11ap_int_baseILi1ELb0ELb1EE6lengthEv", metadata !89, i32 1685, metadata !285, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1685} ; [ DW_TAG_subprogram ]
!285 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !286, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!286 = metadata !{metadata !110, metadata !287}
!287 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !129} ; [ DW_TAG_pointer_type ]
!288 = metadata !{i32 786478, i32 0, metadata !88, metadata !"reverse", metadata !"reverse", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE7reverseEv", metadata !89, i32 1690, metadata !289, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1690} ; [ DW_TAG_subprogram ]
!289 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !290, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!290 = metadata !{metadata !205, metadata !116}
!291 = metadata !{i32 786478, i32 0, metadata !88, metadata !"iszero", metadata !"iszero", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE6iszeroEv", metadata !89, i32 1696, metadata !248, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1696} ; [ DW_TAG_subprogram ]
!292 = metadata !{i32 786478, i32 0, metadata !88, metadata !"is_zero", metadata !"is_zero", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE7is_zeroEv", metadata !89, i32 1701, metadata !248, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1701} ; [ DW_TAG_subprogram ]
!293 = metadata !{i32 786478, i32 0, metadata !88, metadata !"sign", metadata !"sign", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE4signEv", metadata !89, i32 1706, metadata !248, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1706} ; [ DW_TAG_subprogram ]
!294 = metadata !{i32 786478, i32 0, metadata !88, metadata !"clear", metadata !"clear", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE5clearEi", metadata !89, i32 1714, metadata !150, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1714} ; [ DW_TAG_subprogram ]
!295 = metadata !{i32 786478, i32 0, metadata !88, metadata !"invert", metadata !"invert", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE6invertEi", metadata !89, i32 1720, metadata !150, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1720} ; [ DW_TAG_subprogram ]
!296 = metadata !{i32 786478, i32 0, metadata !88, metadata !"test", metadata !"test", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE4testEi", metadata !89, i32 1728, metadata !297, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1728} ; [ DW_TAG_subprogram ]
!297 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !298, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!298 = metadata !{metadata !112, metadata !246, metadata !110}
!299 = metadata !{i32 786478, i32 0, metadata !88, metadata !"set", metadata !"set", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE3setEi", metadata !89, i32 1734, metadata !150, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1734} ; [ DW_TAG_subprogram ]
!300 = metadata !{i32 786478, i32 0, metadata !88, metadata !"set", metadata !"set", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE3setEib", metadata !89, i32 1740, metadata !301, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1740} ; [ DW_TAG_subprogram ]
!301 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !302, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!302 = metadata !{null, metadata !116, metadata !110, metadata !112}
!303 = metadata !{i32 786478, i32 0, metadata !88, metadata !"lrotate", metadata !"lrotate", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE7lrotateEi", metadata !89, i32 1747, metadata !150, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1747} ; [ DW_TAG_subprogram ]
!304 = metadata !{i32 786478, i32 0, metadata !88, metadata !"rrotate", metadata !"rrotate", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE7rrotateEi", metadata !89, i32 1756, metadata !150, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1756} ; [ DW_TAG_subprogram ]
!305 = metadata !{i32 786478, i32 0, metadata !88, metadata !"set_bit", metadata !"set_bit", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE7set_bitEib", metadata !89, i32 1764, metadata !301, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1764} ; [ DW_TAG_subprogram ]
!306 = metadata !{i32 786478, i32 0, metadata !88, metadata !"get_bit", metadata !"get_bit", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE7get_bitEi", metadata !89, i32 1769, metadata !297, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1769} ; [ DW_TAG_subprogram ]
!307 = metadata !{i32 786478, i32 0, metadata !88, metadata !"b_not", metadata !"b_not", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE5b_notEv", metadata !89, i32 1774, metadata !114, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1774} ; [ DW_TAG_subprogram ]
!308 = metadata !{i32 786478, i32 0, metadata !88, metadata !"countLeadingZeros", metadata !"countLeadingZeros", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE17countLeadingZerosEv", metadata !89, i32 1781, metadata !309, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1781} ; [ DW_TAG_subprogram ]
!309 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !310, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!310 = metadata !{metadata !110, metadata !116}
!311 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator++", metadata !"operator++", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEppEv", metadata !89, i32 1838, metadata !289, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1838} ; [ DW_TAG_subprogram ]
!312 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator--", metadata !"operator--", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEmmEv", metadata !89, i32 1842, metadata !289, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1842} ; [ DW_TAG_subprogram ]
!313 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator++", metadata !"operator++", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEppEi", metadata !89, i32 1850, metadata !314, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1850} ; [ DW_TAG_subprogram ]
!314 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !315, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!315 = metadata !{metadata !121, metadata !116, metadata !110}
!316 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator--", metadata !"operator--", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEmmEi", metadata !89, i32 1855, metadata !314, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1855} ; [ DW_TAG_subprogram ]
!317 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator+", metadata !"operator+", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EEpsEv", metadata !89, i32 1864, metadata !318, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1864} ; [ DW_TAG_subprogram ]
!318 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !319, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!319 = metadata !{metadata !88, metadata !246}
!320 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator!", metadata !"operator!", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EEntEv", metadata !89, i32 1870, metadata !248, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1870} ; [ DW_TAG_subprogram ]
!321 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator-", metadata !"operator-", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EEngEv", metadata !89, i32 1875, metadata !322, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 1875} ; [ DW_TAG_subprogram ]
!322 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !323, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!323 = metadata !{metadata !324, metadata !246}
!324 = metadata !{i32 786434, null, metadata !"ap_int_base<2, true, true>", metadata !89, i32 650, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_class_type ]
!325 = metadata !{i32 786478, i32 0, metadata !88, metadata !"range", metadata !"range", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE5rangeEii", metadata !89, i32 2005, metadata !326, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2005} ; [ DW_TAG_subprogram ]
!326 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !327, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!327 = metadata !{metadata !328, metadata !116, metadata !110, metadata !110}
!328 = metadata !{i32 786434, null, metadata !"ap_range_ref<1, false>", metadata !89, i32 923, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_class_type ]
!329 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator()", metadata !"operator()", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEclEii", metadata !89, i32 2011, metadata !326, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2011} ; [ DW_TAG_subprogram ]
!330 = metadata !{i32 786478, i32 0, metadata !88, metadata !"range", metadata !"range", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE5rangeEii", metadata !89, i32 2017, metadata !331, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2017} ; [ DW_TAG_subprogram ]
!331 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !332, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!332 = metadata !{metadata !328, metadata !246, metadata !110, metadata !110}
!333 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator()", metadata !"operator()", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EEclEii", metadata !89, i32 2023, metadata !331, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2023} ; [ DW_TAG_subprogram ]
!334 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator[]", metadata !"operator[]", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EEixEi", metadata !89, i32 2042, metadata !335, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2042} ; [ DW_TAG_subprogram ]
!335 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !336, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!336 = metadata !{metadata !337, metadata !116, metadata !110}
!337 = metadata !{i32 786434, null, metadata !"ap_bit_ref<1, false>", metadata !89, i32 1193, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_class_type ]
!338 = metadata !{i32 786478, i32 0, metadata !88, metadata !"operator[]", metadata !"operator[]", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EEixEi", metadata !89, i32 2056, metadata !297, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2056} ; [ DW_TAG_subprogram ]
!339 = metadata !{i32 786478, i32 0, metadata !88, metadata !"bit", metadata !"bit", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE3bitEi", metadata !89, i32 2070, metadata !335, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2070} ; [ DW_TAG_subprogram ]
!340 = metadata !{i32 786478, i32 0, metadata !88, metadata !"bit", metadata !"bit", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE3bitEi", metadata !89, i32 2084, metadata !297, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2084} ; [ DW_TAG_subprogram ]
!341 = metadata !{i32 786478, i32 0, metadata !88, metadata !"and_reduce", metadata !"and_reduce", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE10and_reduceEv", metadata !89, i32 2264, metadata !342, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2264} ; [ DW_TAG_subprogram ]
!342 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !343, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!343 = metadata !{metadata !112, metadata !116}
!344 = metadata !{i32 786478, i32 0, metadata !88, metadata !"nand_reduce", metadata !"nand_reduce", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE11nand_reduceEv", metadata !89, i32 2267, metadata !342, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2267} ; [ DW_TAG_subprogram ]
!345 = metadata !{i32 786478, i32 0, metadata !88, metadata !"or_reduce", metadata !"or_reduce", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE9or_reduceEv", metadata !89, i32 2270, metadata !342, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2270} ; [ DW_TAG_subprogram ]
!346 = metadata !{i32 786478, i32 0, metadata !88, metadata !"nor_reduce", metadata !"nor_reduce", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE10nor_reduceEv", metadata !89, i32 2273, metadata !342, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2273} ; [ DW_TAG_subprogram ]
!347 = metadata !{i32 786478, i32 0, metadata !88, metadata !"xor_reduce", metadata !"xor_reduce", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE10xor_reduceEv", metadata !89, i32 2276, metadata !342, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2276} ; [ DW_TAG_subprogram ]
!348 = metadata !{i32 786478, i32 0, metadata !88, metadata !"xnor_reduce", metadata !"xnor_reduce", metadata !"_ZN11ap_int_baseILi1ELb0ELb1EE11xnor_reduceEv", metadata !89, i32 2279, metadata !342, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2279} ; [ DW_TAG_subprogram ]
!349 = metadata !{i32 786478, i32 0, metadata !88, metadata !"and_reduce", metadata !"and_reduce", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE10and_reduceEv", metadata !89, i32 2283, metadata !248, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2283} ; [ DW_TAG_subprogram ]
!350 = metadata !{i32 786478, i32 0, metadata !88, metadata !"nand_reduce", metadata !"nand_reduce", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE11nand_reduceEv", metadata !89, i32 2286, metadata !248, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2286} ; [ DW_TAG_subprogram ]
!351 = metadata !{i32 786478, i32 0, metadata !88, metadata !"or_reduce", metadata !"or_reduce", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE9or_reduceEv", metadata !89, i32 2289, metadata !248, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2289} ; [ DW_TAG_subprogram ]
!352 = metadata !{i32 786478, i32 0, metadata !88, metadata !"nor_reduce", metadata !"nor_reduce", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE10nor_reduceEv", metadata !89, i32 2292, metadata !248, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2292} ; [ DW_TAG_subprogram ]
!353 = metadata !{i32 786478, i32 0, metadata !88, metadata !"xor_reduce", metadata !"xor_reduce", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE10xor_reduceEv", metadata !89, i32 2295, metadata !248, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2295} ; [ DW_TAG_subprogram ]
!354 = metadata !{i32 786478, i32 0, metadata !88, metadata !"xnor_reduce", metadata !"xnor_reduce", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE11xnor_reduceEv", metadata !89, i32 2298, metadata !248, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2298} ; [ DW_TAG_subprogram ]
!355 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_string", metadata !"to_string", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE9to_stringEPci8BaseModeb", metadata !89, i32 2305, metadata !356, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2305} ; [ DW_TAG_subprogram ]
!356 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !357, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!357 = metadata !{null, metadata !246, metadata !358, metadata !110, metadata !359, metadata !112}
!358 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !187} ; [ DW_TAG_pointer_type ]
!359 = metadata !{i32 786436, null, metadata !"BaseMode", metadata !89, i32 602, i64 5, i64 8, i32 0, i32 0, null, metadata !360, i32 0, i32 0} ; [ DW_TAG_enumeration_type ]
!360 = metadata !{metadata !361, metadata !362, metadata !363, metadata !364}
!361 = metadata !{i32 786472, metadata !"SC_BIN", i64 2} ; [ DW_TAG_enumerator ]
!362 = metadata !{i32 786472, metadata !"SC_OCT", i64 8} ; [ DW_TAG_enumerator ]
!363 = metadata !{i32 786472, metadata !"SC_DEC", i64 10} ; [ DW_TAG_enumerator ]
!364 = metadata !{i32 786472, metadata !"SC_HEX", i64 16} ; [ DW_TAG_enumerator ]
!365 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_string", metadata !"to_string", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE9to_stringE8BaseModeb", metadata !89, i32 2332, metadata !366, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2332} ; [ DW_TAG_subprogram ]
!366 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !367, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!367 = metadata !{metadata !358, metadata !246, metadata !359, metadata !112}
!368 = metadata !{i32 786478, i32 0, metadata !88, metadata !"to_string", metadata !"to_string", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EE9to_stringEab", metadata !89, i32 2336, metadata !369, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 2336} ; [ DW_TAG_subprogram ]
!369 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !370, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!370 = metadata !{metadata !358, metadata !246, metadata !137, metadata !112}
!371 = metadata !{i32 786478, i32 0, metadata !88, metadata !"ap_int_base", metadata !"ap_int_base", metadata !"", metadata !89, i32 1397, metadata !118, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !101, i32 1397} ; [ DW_TAG_subprogram ]
!372 = metadata !{metadata !373, metadata !111, metadata !374}
!373 = metadata !{i32 786480, null, metadata !"_AP_W", metadata !110, i64 1, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!374 = metadata !{i32 786480, null, metadata !"_AP_C", metadata !112, i64 1, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!375 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 183, metadata !376, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 183} ; [ DW_TAG_subprogram ]
!376 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !377, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!377 = metadata !{null, metadata !378}
!378 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !84} ; [ DW_TAG_pointer_type ]
!379 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint<1>", metadata !"ap_uint<1>", metadata !"", metadata !85, i32 185, metadata !380, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, metadata !384, i32 0, metadata !101, i32 185} ; [ DW_TAG_subprogram ]
!380 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !381, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!381 = metadata !{null, metadata !378, metadata !382}
!382 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !383} ; [ DW_TAG_reference_type ]
!383 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_const_type ]
!384 = metadata !{metadata !123}
!385 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint<1>", metadata !"ap_uint<1>", metadata !"", metadata !85, i32 191, metadata !386, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, metadata !384, i32 0, metadata !101, i32 191} ; [ DW_TAG_subprogram ]
!386 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !387, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!387 = metadata !{null, metadata !378, metadata !388}
!388 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !389} ; [ DW_TAG_reference_type ]
!389 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !390} ; [ DW_TAG_const_type ]
!390 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_volatile_type ]
!391 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint<1, false>", metadata !"ap_uint<1, false>", metadata !"", metadata !85, i32 226, metadata !392, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, metadata !122, i32 0, metadata !101, i32 226} ; [ DW_TAG_subprogram ]
!392 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !393, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!393 = metadata !{null, metadata !378, metadata !120}
!394 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 245, metadata !395, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 245} ; [ DW_TAG_subprogram ]
!395 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !396, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!396 = metadata !{null, metadata !378, metadata !112}
!397 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 246, metadata !398, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 246} ; [ DW_TAG_subprogram ]
!398 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !399, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!399 = metadata !{null, metadata !378, metadata !137}
!400 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 247, metadata !401, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 247} ; [ DW_TAG_subprogram ]
!401 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !402, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!402 = metadata !{null, metadata !378, metadata !141}
!403 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 248, metadata !404, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 248} ; [ DW_TAG_subprogram ]
!404 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !405, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!405 = metadata !{null, metadata !378, metadata !82}
!406 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 249, metadata !407, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 249} ; [ DW_TAG_subprogram ]
!407 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !408, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!408 = metadata !{null, metadata !378, metadata !148}
!409 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 250, metadata !410, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 250} ; [ DW_TAG_subprogram ]
!410 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !411, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!411 = metadata !{null, metadata !378, metadata !110}
!412 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 251, metadata !413, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 251} ; [ DW_TAG_subprogram ]
!413 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !414, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!414 = metadata !{null, metadata !378, metadata !155}
!415 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 252, metadata !416, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 252} ; [ DW_TAG_subprogram ]
!416 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !417, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!417 = metadata !{null, metadata !378, metadata !159}
!418 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 253, metadata !419, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 253} ; [ DW_TAG_subprogram ]
!419 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !420, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!420 = metadata !{null, metadata !378, metadata !163}
!421 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 254, metadata !422, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 254} ; [ DW_TAG_subprogram ]
!422 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !423, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!423 = metadata !{null, metadata !378, metadata !173}
!424 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 255, metadata !425, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 255} ; [ DW_TAG_subprogram ]
!425 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !426, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!426 = metadata !{null, metadata !378, metadata !168}
!427 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 256, metadata !428, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 256} ; [ DW_TAG_subprogram ]
!428 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !429, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!429 = metadata !{null, metadata !378, metadata !177}
!430 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 257, metadata !431, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 257} ; [ DW_TAG_subprogram ]
!431 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !432, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!432 = metadata !{null, metadata !378, metadata !181}
!433 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 259, metadata !434, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 259} ; [ DW_TAG_subprogram ]
!434 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !435, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!435 = metadata !{null, metadata !378, metadata !185}
!436 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 260, metadata !437, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 260} ; [ DW_TAG_subprogram ]
!437 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !438, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!438 = metadata !{null, metadata !378, metadata !185, metadata !137}
!439 = metadata !{i32 786478, i32 0, metadata !84, metadata !"operator=", metadata !"operator=", metadata !"_ZNV7ap_uintILi1EEaSERKS0_", metadata !85, i32 263, metadata !440, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 263} ; [ DW_TAG_subprogram ]
!440 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !441, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!441 = metadata !{null, metadata !442, metadata !382}
!442 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !390} ; [ DW_TAG_pointer_type ]
!443 = metadata !{i32 786478, i32 0, metadata !84, metadata !"operator=", metadata !"operator=", metadata !"_ZNV7ap_uintILi1EEaSERVKS0_", metadata !85, i32 267, metadata !444, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 267} ; [ DW_TAG_subprogram ]
!444 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !445, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!445 = metadata !{null, metadata !442, metadata !388}
!446 = metadata !{i32 786478, i32 0, metadata !84, metadata !"operator=", metadata !"operator=", metadata !"_ZN7ap_uintILi1EEaSERVKS0_", metadata !85, i32 271, metadata !447, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 271} ; [ DW_TAG_subprogram ]
!447 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !448, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!448 = metadata !{metadata !449, metadata !378, metadata !388}
!449 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_reference_type ]
!450 = metadata !{i32 786478, i32 0, metadata !84, metadata !"operator=", metadata !"operator=", metadata !"_ZN7ap_uintILi1EEaSERKS0_", metadata !85, i32 276, metadata !451, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 276} ; [ DW_TAG_subprogram ]
!451 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !452, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!452 = metadata !{metadata !449, metadata !378, metadata !382}
!453 = metadata !{i32 786478, i32 0, metadata !84, metadata !"ap_uint", metadata !"ap_uint", metadata !"", metadata !85, i32 180, metadata !380, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !101, i32 180} ; [ DW_TAG_subprogram ]
!454 = metadata !{i32 786478, i32 0, metadata !84, metadata !"~ap_uint", metadata !"~ap_uint", metadata !"", metadata !85, i32 180, metadata !376, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !101, i32 180} ; [ DW_TAG_subprogram ]
!455 = metadata !{metadata !373}
!456 = metadata !{i32 6, i32 170, metadata !78, null}
!457 = metadata !{i32 786689, metadata !78, metadata !"v_length", metadata !79, i32 150994950, metadata !155, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!458 = metadata !{i32 6, i32 154, metadata !78, null}
!459 = metadata !{i32 786689, metadata !78, metadata !"a_length", metadata !79, i32 134217734, metadata !155, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!460 = metadata !{i32 6, i32 131, metadata !78, null}
!461 = metadata !{i32 786689, metadata !78, metadata !"v_flip", metadata !79, i32 117440518, metadata !187, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!462 = metadata !{i32 6, i32 110, metadata !78, null}
!463 = metadata !{i32 786689, metadata !78, metadata !"a_flip", metadata !79, i32 100663302, metadata !187, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!464 = metadata !{i32 6, i32 97, metadata !78, null}
!465 = metadata !{i32 786689, metadata !78, metadata !"vthresh", metadata !79, i32 83886086, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!466 = metadata !{i32 6, i32 83, metadata !78, null}
!467 = metadata !{i32 786689, metadata !78, metadata !"athresh", metadata !79, i32 67108870, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!468 = metadata !{i32 6, i32 70, metadata !78, null}
!469 = metadata !{i32 8, i32 1, metadata !470, null}
!470 = metadata !{i32 786443, metadata !78, i32 7, i32 1, metadata !79, i32 0} ; [ DW_TAG_lexical_block ]
!471 = metadata !{i32 9, i32 1, metadata !470, null}
!472 = metadata !{i32 10, i32 1, metadata !470, null}
!473 = metadata !{i32 11, i32 1, metadata !470, null}
!474 = metadata !{i32 12, i32 1, metadata !470, null}
!475 = metadata !{i32 13, i32 1, metadata !470, null}
!476 = metadata !{i32 14, i32 1, metadata !470, null}
!477 = metadata !{i32 15, i32 1, metadata !470, null}
!478 = metadata !{i32 16, i32 1, metadata !470, null}
!479 = metadata !{i32 17, i32 1, metadata !470, null}
!480 = metadata !{i32 18, i32 1, metadata !470, null}
!481 = metadata !{i32 65, i32 2, metadata !470, null}
!482 = metadata !{i32 66, i32 2, metadata !470, null}
!483 = metadata !{i32 110, i32 2, metadata !470, null}
!484 = metadata !{i32 79, i32 2, metadata !470, null}
!485 = metadata !{i32 50, i32 5, metadata !470, null}
!486 = metadata !{i32 52, i32 3, metadata !487, null}
!487 = metadata !{i32 786443, metadata !470, i32 51, i32 2, metadata !79, i32 3} ; [ DW_TAG_lexical_block ]
!488 = metadata !{i32 53, i32 3, metadata !487, null}
!489 = metadata !{i32 54, i32 3, metadata !487, null}
!490 = metadata !{i32 55, i32 3, metadata !487, null}
!491 = metadata !{i32 56, i32 3, metadata !487, null}
!492 = metadata !{i32 57, i32 3, metadata !487, null}
!493 = metadata !{i32 58, i32 2, metadata !487, null}
!494 = metadata !{i32 786689, metadata !495, metadata !"val", metadata !496, i32 33554445, metadata !110, i32 0, metadata !522} ; [ DW_TAG_arg_variable ]
!495 = metadata !{i32 786478, i32 0, null, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi20EE4pushEi", metadata !496, i32 13, metadata !497, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !512, metadata !101, i32 13} ; [ DW_TAG_subprogram ]
!496 = metadata !{i32 786473, metadata !"src/hls/circularBuffer.h", metadata !"/home/greg/everything/xilnx_design/cycle3", null} ; [ DW_TAG_file_type ]
!497 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !498, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!498 = metadata !{null, metadata !499, metadata !110}
!499 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !500} ; [ DW_TAG_pointer_type ]
!500 = metadata !{i32 786434, null, metadata !"CircularBuffer<int, 20>", metadata !496, i32 4, i64 736, i64 32, i32 0, i32 0, null, metadata !501, i32 0, null, metadata !519} ; [ DW_TAG_class_type ]
!501 = metadata !{metadata !502, metadata !503, metadata !507, metadata !508, metadata !509, metadata !512, metadata !513, metadata !516, metadata !517, metadata !518}
!502 = metadata !{i32 786445, metadata !500, metadata !"sum", metadata !496, i32 5, i64 32, i64 32, i64 0, i32 0, metadata !110} ; [ DW_TAG_member ]
!503 = metadata !{i32 786445, metadata !500, metadata !"data", metadata !496, i32 6, i64 640, i64 32, i64 32, i32 0, metadata !504} ; [ DW_TAG_member ]
!504 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 640, i64 32, i32 0, i32 0, metadata !110, metadata !505, i32 0, i32 0} ; [ DW_TAG_array_type ]
!505 = metadata !{metadata !506}
!506 = metadata !{i32 786465, i64 0, i64 19}      ; [ DW_TAG_subrange_type ]
!507 = metadata !{i32 786445, metadata !500, metadata !"head_i", metadata !496, i32 7, i64 32, i64 32, i64 672, i32 0, metadata !110} ; [ DW_TAG_member ]
!508 = metadata !{i32 786445, metadata !500, metadata !"len", metadata !496, i32 8, i64 32, i64 32, i64 704, i32 0, metadata !110} ; [ DW_TAG_member ]
!509 = metadata !{i32 786478, i32 0, metadata !500, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"", metadata !496, i32 9, metadata !510, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 9} ; [ DW_TAG_subprogram ]
!510 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !511, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!511 = metadata !{null, metadata !499}
!512 = metadata !{i32 786478, i32 0, metadata !500, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi20EE4pushEi", metadata !496, i32 13, metadata !497, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 13} ; [ DW_TAG_subprogram ]
!513 = metadata !{i32 786478, i32 0, metadata !500, metadata !"pop", metadata !"pop", metadata !"_ZN14CircularBufferIiLi20EE3popEv", metadata !496, i32 25, metadata !514, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 25} ; [ DW_TAG_subprogram ]
!514 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !515, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!515 = metadata !{metadata !110, metadata !499}
!516 = metadata !{i32 786478, i32 0, metadata !500, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi20EE4headEv", metadata !496, i32 32, metadata !514, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 32} ; [ DW_TAG_subprogram ]
!517 = metadata !{i32 786478, i32 0, metadata !500, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi20EE4tailEv", metadata !496, i32 41, metadata !514, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 41} ; [ DW_TAG_subprogram ]
!518 = metadata !{i32 786478, i32 0, metadata !500, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi20EE5ftailEv", metadata !496, i32 52, metadata !514, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 52} ; [ DW_TAG_subprogram ]
!519 = metadata !{metadata !520, metadata !521}
!520 = metadata !{i32 786479, null, metadata !"T", metadata !110, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!521 = metadata !{i32 786480, null, metadata !"maxsize", metadata !110, i64 20, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!522 = metadata !{i32 61, i32 2, metadata !470, null}
!523 = metadata !{i32 13, i32 14, metadata !495, metadata !522}
!524 = metadata !{i32 14, i32 3, metadata !525, metadata !522}
!525 = metadata !{i32 786443, metadata !495, i32 13, i32 19, metadata !496, i32 24} ; [ DW_TAG_lexical_block ]
!526 = metadata !{i32 15, i32 4, metadata !527, metadata !522}
!527 = metadata !{i32 786443, metadata !525, i32 14, i32 23, metadata !496, i32 25} ; [ DW_TAG_lexical_block ]
!528 = metadata !{i32 18, i32 3, metadata !525, metadata !522}
!529 = metadata !{i32 19, i32 3, metadata !525, metadata !522}
!530 = metadata !{i32 20, i32 3, metadata !525, metadata !522}
!531 = metadata !{i32 21, i32 3, metadata !525, metadata !522}
!532 = metadata !{i32 22, i32 3, metadata !525, metadata !522}
!533 = metadata !{i32 62, i32 2, metadata !470, null}
!534 = metadata !{i32 63, i32 2, metadata !470, null}
!535 = metadata !{i32 64, i32 2, metadata !470, null}
!536 = metadata !{i32 33, i32 3, metadata !537, metadata !539}
!537 = metadata !{i32 786443, metadata !538, i32 32, i32 11, metadata !496, i32 23} ; [ DW_TAG_lexical_block ]
!538 = metadata !{i32 786478, i32 0, null, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi20EE4headEv", metadata !496, i32 32, metadata !514, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !516, metadata !101, i32 32} ; [ DW_TAG_subprogram ]
!539 = metadata !{i32 71, i32 19, metadata !470, null}
!540 = metadata !{i32 35, i32 21, metadata !537, metadata !539}
!541 = metadata !{i32 786688, metadata !537, metadata !"i", metadata !496, i32 35, metadata !110, i32 0, metadata !539} ; [ DW_TAG_auto_variable ]
!542 = metadata !{i32 36, i32 3, metadata !537, metadata !539}
!543 = metadata !{i32 37, i32 4, metadata !537, metadata !539}
!544 = metadata !{i32 38, i32 3, metadata !537, metadata !539}
!545 = metadata !{i32 786688, metadata !470, metadata !"datapointV", metadata !79, i32 71, metadata !110, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!546 = metadata !{i32 73, i32 2, metadata !470, null}
!547 = metadata !{i32 74, i32 3, metadata !470, null}
!548 = metadata !{i32 77, i32 2, metadata !470, null}
!549 = metadata !{i32 790533, metadata !550, metadata !"CircularBuffer<int, 30>.sum", null, i32 13, metadata !577, i32 0, metadata !548} ; [ DW_TAG_arg_variable_field_ro ]
!550 = metadata !{i32 786689, metadata !551, metadata !"this", metadata !496, i32 16777229, metadata !576, i32 64, i32 0} ; [ DW_TAG_arg_variable ]
!551 = metadata !{i32 786478, i32 0, null, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi30EE4pushEi", metadata !496, i32 13, metadata !552, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !567, metadata !101, i32 13} ; [ DW_TAG_subprogram ]
!552 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !553, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!553 = metadata !{null, metadata !554, metadata !110}
!554 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !555} ; [ DW_TAG_pointer_type ]
!555 = metadata !{i32 786434, null, metadata !"CircularBuffer<int, 30>", metadata !496, i32 4, i64 1056, i64 32, i32 0, i32 0, null, metadata !556, i32 0, null, metadata !574} ; [ DW_TAG_class_type ]
!556 = metadata !{metadata !557, metadata !558, metadata !562, metadata !563, metadata !564, metadata !567, metadata !568, metadata !571, metadata !572, metadata !573}
!557 = metadata !{i32 786445, metadata !555, metadata !"sum", metadata !496, i32 5, i64 32, i64 32, i64 0, i32 0, metadata !110} ; [ DW_TAG_member ]
!558 = metadata !{i32 786445, metadata !555, metadata !"data", metadata !496, i32 6, i64 960, i64 32, i64 32, i32 0, metadata !559} ; [ DW_TAG_member ]
!559 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 960, i64 32, i32 0, i32 0, metadata !110, metadata !560, i32 0, i32 0} ; [ DW_TAG_array_type ]
!560 = metadata !{metadata !561}
!561 = metadata !{i32 786465, i64 0, i64 29}      ; [ DW_TAG_subrange_type ]
!562 = metadata !{i32 786445, metadata !555, metadata !"head_i", metadata !496, i32 7, i64 32, i64 32, i64 992, i32 0, metadata !110} ; [ DW_TAG_member ]
!563 = metadata !{i32 786445, metadata !555, metadata !"len", metadata !496, i32 8, i64 32, i64 32, i64 1024, i32 0, metadata !110} ; [ DW_TAG_member ]
!564 = metadata !{i32 786478, i32 0, metadata !555, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"", metadata !496, i32 9, metadata !565, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 9} ; [ DW_TAG_subprogram ]
!565 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !566, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!566 = metadata !{null, metadata !554}
!567 = metadata !{i32 786478, i32 0, metadata !555, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi30EE4pushEi", metadata !496, i32 13, metadata !552, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 13} ; [ DW_TAG_subprogram ]
!568 = metadata !{i32 786478, i32 0, metadata !555, metadata !"pop", metadata !"pop", metadata !"_ZN14CircularBufferIiLi30EE3popEv", metadata !496, i32 25, metadata !569, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 25} ; [ DW_TAG_subprogram ]
!569 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !570, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!570 = metadata !{metadata !110, metadata !554}
!571 = metadata !{i32 786478, i32 0, metadata !555, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi30EE4headEv", metadata !496, i32 32, metadata !569, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 32} ; [ DW_TAG_subprogram ]
!572 = metadata !{i32 786478, i32 0, metadata !555, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi30EE4tailEv", metadata !496, i32 41, metadata !569, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 41} ; [ DW_TAG_subprogram ]
!573 = metadata !{i32 786478, i32 0, metadata !555, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi30EE5ftailEv", metadata !496, i32 52, metadata !569, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !101, i32 52} ; [ DW_TAG_subprogram ]
!574 = metadata !{metadata !520, metadata !575}
!575 = metadata !{i32 786480, null, metadata !"maxsize", metadata !110, i64 30, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!576 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !555} ; [ DW_TAG_pointer_type ]
!577 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !578} ; [ DW_TAG_pointer_type ]
!578 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 30>", metadata !496, i32 4, i64 32, i64 32, i32 0, i32 0, null, metadata !579, i32 0, null, metadata !574} ; [ DW_TAG_class_field_type ]
!579 = metadata !{metadata !557}
!580 = metadata !{i32 13, i32 7, metadata !551, metadata !548}
!581 = metadata !{i32 790533, metadata !550, metadata !"CircularBuffer<int, 30>.head_i", null, i32 13, metadata !582, i32 0, metadata !548} ; [ DW_TAG_arg_variable_field_ro ]
!582 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !583} ; [ DW_TAG_pointer_type ]
!583 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 30>", metadata !496, i32 4, i64 32, i64 32, i32 0, i32 0, null, metadata !584, i32 0, null, metadata !574} ; [ DW_TAG_class_field_type ]
!584 = metadata !{metadata !562}
!585 = metadata !{i32 790533, metadata !550, metadata !"CircularBuffer<int, 30>.len", null, i32 13, metadata !586, i32 0, metadata !548} ; [ DW_TAG_arg_variable_field_ro ]
!586 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !587} ; [ DW_TAG_pointer_type ]
!587 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 30>", metadata !496, i32 4, i64 32, i64 32, i32 0, i32 0, null, metadata !588, i32 0, null, metadata !574} ; [ DW_TAG_class_field_type ]
!588 = metadata !{metadata !563}
!589 = metadata !{i32 786689, metadata !551, metadata !"val", metadata !496, i32 33554445, metadata !110, i32 0, metadata !548} ; [ DW_TAG_arg_variable ]
!590 = metadata !{i32 13, i32 14, metadata !551, metadata !548}
!591 = metadata !{i32 14, i32 3, metadata !592, metadata !548}
!592 = metadata !{i32 786443, metadata !551, i32 13, i32 19, metadata !496, i32 21} ; [ DW_TAG_lexical_block ]
!593 = metadata !{i32 15, i32 4, metadata !594, metadata !548}
!594 = metadata !{i32 786443, metadata !592, i32 14, i32 23, metadata !496, i32 22} ; [ DW_TAG_lexical_block ]
!595 = metadata !{i32 18, i32 3, metadata !592, metadata !548}
!596 = metadata !{i32 19, i32 3, metadata !592, metadata !548}
!597 = metadata !{i32 20, i32 3, metadata !592, metadata !548}
!598 = metadata !{i32 21, i32 3, metadata !592, metadata !548}
!599 = metadata !{i32 22, i32 3, metadata !592, metadata !548}
!600 = metadata !{i32 47, i32 3, metadata !601, null}
!601 = metadata !{i32 786443, metadata !470, i32 46, i32 2, metadata !79, i32 2} ; [ DW_TAG_lexical_block ]
!602 = metadata !{i32 42, i32 3, metadata !603, null}
!603 = metadata !{i32 786443, metadata !470, i32 41, i32 2, metadata !79, i32 1} ; [ DW_TAG_lexical_block ]
!604 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.sum", null, i32 25, metadata !577, i32 0, metadata !607} ; [ DW_TAG_arg_variable_field_ro ]
!605 = metadata !{i32 786689, metadata !606, metadata !"this", metadata !496, i32 16777241, metadata !576, i32 64, i32 0} ; [ DW_TAG_arg_variable ]
!606 = metadata !{i32 786478, i32 0, null, metadata !"pop", metadata !"pop", metadata !"_ZN14CircularBufferIiLi30EE3popEv", metadata !496, i32 25, metadata !569, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !568, metadata !101, i32 25} ; [ DW_TAG_subprogram ]
!607 = metadata !{i32 81, i32 3, metadata !608, null}
!608 = metadata !{i32 786443, metadata !470, i32 80, i32 2, metadata !79, i32 4} ; [ DW_TAG_lexical_block ]
!609 = metadata !{i32 25, i32 4, metadata !606, metadata !607}
!610 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.head_i", null, i32 25, metadata !582, i32 0, metadata !607} ; [ DW_TAG_arg_variable_field_ro ]
!611 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.len", null, i32 25, metadata !586, i32 0, metadata !607} ; [ DW_TAG_arg_variable_field_ro ]
!612 = metadata !{i32 790533, metadata !613, metadata !"CircularBuffer<int, 30>.head_i", null, i32 41, metadata !582, i32 0, metadata !615} ; [ DW_TAG_arg_variable_field_ro ]
!613 = metadata !{i32 786689, metadata !614, metadata !"this", metadata !496, i32 16777257, metadata !576, i32 64, i32 0} ; [ DW_TAG_arg_variable ]
!614 = metadata !{i32 786478, i32 0, null, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi30EE4tailEv", metadata !496, i32 41, metadata !569, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !572, metadata !101, i32 41} ; [ DW_TAG_subprogram ]
!615 = metadata !{i32 26, i32 16, metadata !616, metadata !607}
!616 = metadata !{i32 786443, metadata !606, i32 25, i32 10, metadata !496, i32 19} ; [ DW_TAG_lexical_block ]
!617 = metadata !{i32 41, i32 4, metadata !614, metadata !615}
!618 = metadata !{i32 790533, metadata !613, metadata !"CircularBuffer<int, 30>.len", null, i32 41, metadata !586, i32 0, metadata !615} ; [ DW_TAG_arg_variable_field_ro ]
!619 = metadata !{i32 44, i32 23, metadata !620, metadata !615}
!620 = metadata !{i32 786443, metadata !614, i32 41, i32 11, metadata !496, i32 20} ; [ DW_TAG_lexical_block ]
!621 = metadata !{i32 786688, metadata !620, metadata !"i", metadata !496, i32 44, metadata !110, i32 0, metadata !615} ; [ DW_TAG_auto_variable ]
!622 = metadata !{i32 45, i32 3, metadata !620, metadata !615}
!623 = metadata !{i32 46, i32 4, metadata !620, metadata !615}
!624 = metadata !{i32 47, i32 3, metadata !620, metadata !615}
!625 = metadata !{i32 786688, metadata !616, metadata !"toReturn", metadata !496, i32 26, metadata !110, i32 0, metadata !607} ; [ DW_TAG_auto_variable ]
!626 = metadata !{i32 27, i32 3, metadata !616, metadata !607}
!627 = metadata !{i32 28, i32 3, metadata !616, metadata !607}
!628 = metadata !{i32 790535, metadata !605, metadata !"CircularBuffer<int, 30>.sum", null, i32 25, metadata !577, i32 0, metadata !607} ; [ DW_TAG_arg_variable_field_wo ]
!629 = metadata !{i32 790535, metadata !605, metadata !"CircularBuffer<int, 30>.len", null, i32 25, metadata !586, i32 0, metadata !607} ; [ DW_TAG_arg_variable_field_wo ]
!630 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.sum", null, i32 25, metadata !577, i32 0, metadata !631} ; [ DW_TAG_arg_variable_field_ro ]
!631 = metadata !{i32 82, i32 3, metadata !608, null}
!632 = metadata !{i32 25, i32 4, metadata !606, metadata !631}
!633 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.head_i", null, i32 25, metadata !582, i32 0, metadata !631} ; [ DW_TAG_arg_variable_field_ro ]
!634 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.len", null, i32 25, metadata !586, i32 0, metadata !631} ; [ DW_TAG_arg_variable_field_ro ]
!635 = metadata !{i32 790533, metadata !613, metadata !"CircularBuffer<int, 30>.head_i", null, i32 41, metadata !582, i32 0, metadata !636} ; [ DW_TAG_arg_variable_field_ro ]
!636 = metadata !{i32 26, i32 16, metadata !616, metadata !631}
!637 = metadata !{i32 41, i32 4, metadata !614, metadata !636}
!638 = metadata !{i32 790533, metadata !613, metadata !"CircularBuffer<int, 30>.len", null, i32 41, metadata !586, i32 0, metadata !636} ; [ DW_TAG_arg_variable_field_ro ]
!639 = metadata !{i32 44, i32 23, metadata !620, metadata !636}
!640 = metadata !{i32 786688, metadata !620, metadata !"i", metadata !496, i32 44, metadata !110, i32 0, metadata !636} ; [ DW_TAG_auto_variable ]
!641 = metadata !{i32 45, i32 3, metadata !620, metadata !636}
!642 = metadata !{i32 46, i32 4, metadata !620, metadata !636}
!643 = metadata !{i32 47, i32 3, metadata !620, metadata !636}
!644 = metadata !{i32 786688, metadata !616, metadata !"toReturn", metadata !496, i32 26, metadata !110, i32 0, metadata !631} ; [ DW_TAG_auto_variable ]
!645 = metadata !{i32 27, i32 3, metadata !616, metadata !631}
!646 = metadata !{i32 28, i32 3, metadata !616, metadata !631}
!647 = metadata !{i32 790535, metadata !605, metadata !"CircularBuffer<int, 30>.sum", null, i32 25, metadata !577, i32 0, metadata !631} ; [ DW_TAG_arg_variable_field_wo ]
!648 = metadata !{i32 790535, metadata !605, metadata !"CircularBuffer<int, 30>.len", null, i32 25, metadata !586, i32 0, metadata !631} ; [ DW_TAG_arg_variable_field_wo ]
!649 = metadata !{i32 83, i32 2, metadata !608, null}
!650 = metadata !{i32 786688, metadata !470, metadata !"sum", metadata !79, i32 86, metadata !110, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!651 = metadata !{i32 86, i32 28, metadata !470, null}
!652 = metadata !{i32 88, i32 2, metadata !470, null}
!653 = metadata !{i32 1871, i32 9, metadata !654, metadata !656}
!654 = metadata !{i32 786443, metadata !655, i32 1870, i32 68, metadata !89, i32 18} ; [ DW_TAG_lexical_block ]
!655 = metadata !{i32 786478, i32 0, null, metadata !"operator!", metadata !"operator!", metadata !"_ZNK11ap_int_baseILi1ELb0ELb1EEntEv", metadata !89, i32 1870, metadata !248, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !320, metadata !101, i32 1870} ; [ DW_TAG_subprogram ]
!656 = metadata !{i32 90, i32 6, metadata !657, null}
!657 = metadata !{i32 786443, metadata !470, i32 89, i32 2, metadata !79, i32 5} ; [ DW_TAG_lexical_block ]
!658 = metadata !{i32 277, i32 10, metadata !659, metadata !661}
!659 = metadata !{i32 786443, metadata !660, i32 276, i32 92, metadata !85, i32 17} ; [ DW_TAG_lexical_block ]
!660 = metadata !{i32 786478, i32 0, null, metadata !"operator=", metadata !"operator=", metadata !"_ZN7ap_uintILi1EEaSERKS0_", metadata !85, i32 276, metadata !451, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !450, metadata !101, i32 276} ; [ DW_TAG_subprogram ]
!661 = metadata !{i32 93, i32 4, metadata !662, null}
!662 = metadata !{i32 786443, metadata !657, i32 91, i32 3, metadata !79, i32 6} ; [ DW_TAG_lexical_block ]
!663 = metadata !{i32 94, i32 3, metadata !662, null}
!664 = metadata !{i32 96, i32 10, metadata !470, null}
!665 = metadata !{i32 277, i32 10, metadata !659, metadata !666}
!666 = metadata !{i32 99, i32 3, metadata !667, null}
!667 = metadata !{i32 786443, metadata !470, i32 97, i32 2, metadata !79, i32 7} ; [ DW_TAG_lexical_block ]
!668 = metadata !{i32 100, i32 2, metadata !667, null}
!669 = metadata !{i32 53, i32 3, metadata !670, metadata !672}
!670 = metadata !{i32 786443, metadata !671, i32 52, i32 12, metadata !496, i32 16} ; [ DW_TAG_lexical_block ]
!671 = metadata !{i32 786478, i32 0, null, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi20EE5ftailEv", metadata !496, i32 52, metadata !514, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !518, metadata !101, i32 52} ; [ DW_TAG_subprogram ]
!672 = metadata !{i32 103, i32 19, metadata !470, null}
!673 = metadata !{i32 54, i32 4, metadata !670, metadata !672}
!674 = metadata !{i32 786688, metadata !470, metadata !"datapointA", metadata !79, i32 103, metadata !110, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!675 = metadata !{i32 105, i32 2, metadata !470, null}
!676 = metadata !{i32 106, i32 3, metadata !470, null}
!677 = metadata !{i32 108, i32 2, metadata !470, null}
!678 = metadata !{i32 790533, metadata !550, metadata !"CircularBuffer<int, 30>.sum", null, i32 13, metadata !577, i32 0, metadata !677} ; [ DW_TAG_arg_variable_field_ro ]
!679 = metadata !{i32 13, i32 7, metadata !551, metadata !677}
!680 = metadata !{i32 790533, metadata !550, metadata !"CircularBuffer<int, 30>.head_i", null, i32 13, metadata !582, i32 0, metadata !677} ; [ DW_TAG_arg_variable_field_ro ]
!681 = metadata !{i32 790533, metadata !550, metadata !"CircularBuffer<int, 30>.len", null, i32 13, metadata !586, i32 0, metadata !677} ; [ DW_TAG_arg_variable_field_ro ]
!682 = metadata !{i32 786689, metadata !551, metadata !"val", metadata !496, i32 33554445, metadata !110, i32 0, metadata !677} ; [ DW_TAG_arg_variable ]
!683 = metadata !{i32 13, i32 14, metadata !551, metadata !677}
!684 = metadata !{i32 14, i32 3, metadata !592, metadata !677}
!685 = metadata !{i32 15, i32 4, metadata !594, metadata !677}
!686 = metadata !{i32 18, i32 3, metadata !592, metadata !677}
!687 = metadata !{i32 19, i32 3, metadata !592, metadata !677}
!688 = metadata !{i32 20, i32 3, metadata !592, metadata !677}
!689 = metadata !{i32 21, i32 3, metadata !592, metadata !677}
!690 = metadata !{i32 22, i32 3, metadata !592, metadata !677}
!691 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.sum", null, i32 25, metadata !577, i32 0, metadata !692} ; [ DW_TAG_arg_variable_field_ro ]
!692 = metadata !{i32 112, i32 3, metadata !693, null}
!693 = metadata !{i32 786443, metadata !470, i32 111, i32 2, metadata !79, i32 8} ; [ DW_TAG_lexical_block ]
!694 = metadata !{i32 25, i32 4, metadata !606, metadata !692}
!695 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.head_i", null, i32 25, metadata !582, i32 0, metadata !692} ; [ DW_TAG_arg_variable_field_ro ]
!696 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.len", null, i32 25, metadata !586, i32 0, metadata !692} ; [ DW_TAG_arg_variable_field_ro ]
!697 = metadata !{i32 790533, metadata !613, metadata !"CircularBuffer<int, 30>.head_i", null, i32 41, metadata !582, i32 0, metadata !698} ; [ DW_TAG_arg_variable_field_ro ]
!698 = metadata !{i32 26, i32 16, metadata !616, metadata !692}
!699 = metadata !{i32 41, i32 4, metadata !614, metadata !698}
!700 = metadata !{i32 790533, metadata !613, metadata !"CircularBuffer<int, 30>.len", null, i32 41, metadata !586, i32 0, metadata !698} ; [ DW_TAG_arg_variable_field_ro ]
!701 = metadata !{i32 44, i32 23, metadata !620, metadata !698}
!702 = metadata !{i32 786688, metadata !620, metadata !"i", metadata !496, i32 44, metadata !110, i32 0, metadata !698} ; [ DW_TAG_auto_variable ]
!703 = metadata !{i32 45, i32 3, metadata !620, metadata !698}
!704 = metadata !{i32 46, i32 4, metadata !620, metadata !698}
!705 = metadata !{i32 47, i32 3, metadata !620, metadata !698}
!706 = metadata !{i32 786688, metadata !616, metadata !"toReturn", metadata !496, i32 26, metadata !110, i32 0, metadata !692} ; [ DW_TAG_auto_variable ]
!707 = metadata !{i32 27, i32 3, metadata !616, metadata !692}
!708 = metadata !{i32 28, i32 3, metadata !616, metadata !692}
!709 = metadata !{i32 790535, metadata !605, metadata !"CircularBuffer<int, 30>.sum", null, i32 25, metadata !577, i32 0, metadata !692} ; [ DW_TAG_arg_variable_field_wo ]
!710 = metadata !{i32 790535, metadata !605, metadata !"CircularBuffer<int, 30>.len", null, i32 25, metadata !586, i32 0, metadata !692} ; [ DW_TAG_arg_variable_field_wo ]
!711 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.sum", null, i32 25, metadata !577, i32 0, metadata !712} ; [ DW_TAG_arg_variable_field_ro ]
!712 = metadata !{i32 113, i32 3, metadata !693, null}
!713 = metadata !{i32 25, i32 4, metadata !606, metadata !712}
!714 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.head_i", null, i32 25, metadata !582, i32 0, metadata !712} ; [ DW_TAG_arg_variable_field_ro ]
!715 = metadata !{i32 790533, metadata !605, metadata !"CircularBuffer<int, 30>.len", null, i32 25, metadata !586, i32 0, metadata !712} ; [ DW_TAG_arg_variable_field_ro ]
!716 = metadata !{i32 790533, metadata !613, metadata !"CircularBuffer<int, 30>.head_i", null, i32 41, metadata !582, i32 0, metadata !717} ; [ DW_TAG_arg_variable_field_ro ]
!717 = metadata !{i32 26, i32 16, metadata !616, metadata !712}
!718 = metadata !{i32 41, i32 4, metadata !614, metadata !717}
!719 = metadata !{i32 790533, metadata !613, metadata !"CircularBuffer<int, 30>.len", null, i32 41, metadata !586, i32 0, metadata !717} ; [ DW_TAG_arg_variable_field_ro ]
!720 = metadata !{i32 44, i32 23, metadata !620, metadata !717}
!721 = metadata !{i32 786688, metadata !620, metadata !"i", metadata !496, i32 44, metadata !110, i32 0, metadata !717} ; [ DW_TAG_auto_variable ]
!722 = metadata !{i32 45, i32 3, metadata !620, metadata !717}
!723 = metadata !{i32 46, i32 4, metadata !620, metadata !717}
!724 = metadata !{i32 47, i32 3, metadata !620, metadata !717}
!725 = metadata !{i32 786688, metadata !616, metadata !"toReturn", metadata !496, i32 26, metadata !110, i32 0, metadata !712} ; [ DW_TAG_auto_variable ]
!726 = metadata !{i32 27, i32 3, metadata !616, metadata !712}
!727 = metadata !{i32 28, i32 3, metadata !616, metadata !712}
!728 = metadata !{i32 790535, metadata !605, metadata !"CircularBuffer<int, 30>.sum", null, i32 25, metadata !577, i32 0, metadata !712} ; [ DW_TAG_arg_variable_field_wo ]
!729 = metadata !{i32 790535, metadata !605, metadata !"CircularBuffer<int, 30>.len", null, i32 25, metadata !586, i32 0, metadata !712} ; [ DW_TAG_arg_variable_field_wo ]
!730 = metadata !{i32 114, i32 2, metadata !693, null}
!731 = metadata !{i32 116, i32 2, metadata !470, null}
!732 = metadata !{i32 118, i32 2, metadata !470, null}
!733 = metadata !{i32 1871, i32 9, metadata !654, metadata !734}
!734 = metadata !{i32 120, i32 6, metadata !735, null}
!735 = metadata !{i32 786443, metadata !470, i32 119, i32 2, metadata !79, i32 9} ; [ DW_TAG_lexical_block ]
!736 = metadata !{i32 277, i32 10, metadata !659, metadata !737}
!737 = metadata !{i32 123, i32 4, metadata !738, null}
!738 = metadata !{i32 786443, metadata !735, i32 121, i32 3, metadata !79, i32 10} ; [ DW_TAG_lexical_block ]
!739 = metadata !{i32 124, i32 3, metadata !738, null}
!740 = metadata !{i32 127, i32 10, metadata !470, null}
!741 = metadata !{i32 277, i32 10, metadata !659, metadata !742}
!742 = metadata !{i32 129, i32 3, metadata !743, null}
!743 = metadata !{i32 786443, metadata !470, i32 128, i32 2, metadata !79, i32 11} ; [ DW_TAG_lexical_block ]
!744 = metadata !{i32 130, i32 2, metadata !743, null}
!745 = metadata !{i32 136, i32 2, metadata !470, null}
!746 = metadata !{i32 140, i32 7, metadata !470, null}
!747 = metadata !{i32 140, i32 30, metadata !470, null}
!748 = metadata !{i32 145, i32 2, metadata !470, null}
!749 = metadata !{i32 147, i32 3, metadata !750, null}
!750 = metadata !{i32 786443, metadata !470, i32 146, i32 2, metadata !79, i32 14} ; [ DW_TAG_lexical_block ]
!751 = metadata !{i32 786688, metadata !470, metadata !"toReturn", metadata !79, i32 38, metadata !82, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!752 = metadata !{i32 151, i32 2, metadata !470, null}
!753 = metadata !{i32 153, i32 3, metadata !754, null}
!754 = metadata !{i32 786443, metadata !470, i32 152, i32 2, metadata !79, i32 15} ; [ DW_TAG_lexical_block ]
!755 = metadata !{i32 155, i32 2, metadata !470, null}
