; ModuleID = '/home/greg/multisite_test_detection_algorithms/xilnx_design/SingleSiteDetection/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@recentVBools_sum = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentVBools_head_i = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentVBools_len = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentABools_sum = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentABools_head_i = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentABools_len = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentdatapoints_sum = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentdatapoints_head_i = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentdatapoints_len = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@AstimDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@VstimDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@vthresh = internal unnamed_addr global i32 161, align 4 ; [#uses=2 type=i32*]
@athresh = internal unnamed_addr global i32 72, align 4 ; [#uses=2 type=i32*]
@aflip = internal unnamed_addr global i32 1, align 4 ; [#uses=2 type=i32*]
@vflip = internal unnamed_addr global i32 -1, align 4 ; [#uses=2 type=i32*]
@AbeatDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@VbeatDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@VbeatFallDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@llvm_global_ctors_0 = appending global [0 x i32] zeroinitializer ; [#uses=0 type=[0 x i32]*]
@llvm_global_ctors_1 = appending global [0 x void ()*] zeroinitializer ; [#uses=0 type=[0 x void ()*]*]
@str = internal constant [15 x i8] c"singleDecision\00" ; [#uses=1 type=[15 x i8]*]
@recentdatapoints_data = internal unnamed_addr global [20 x i16] zeroinitializer ; [#uses=3 type=[20 x i16]*]
@recentVBools_data = internal unnamed_addr global [11 x i1] zeroinitializer ; [#uses=2 type=[11 x i1]*]
@last_sample_is_V = internal unnamed_addr global i1 false ; [#uses=3 type=i1*]
@recentABools_data = internal unnamed_addr global [30 x i1] zeroinitializer ; [#uses=2 type=[30 x i1]*]
@last_sample_is_A = internal unnamed_addr global i1 false ; [#uses=3 type=i1*]

; [#uses=0]
define void @singleDecision(i16 signext %A_stim_reset, i16 signext %V_stim_reset, i16 signext %set_thresh, i32 %v_thresh, i32 %a_thresh, i32 %a_flip, i32 %v_flip, i16* %datapoint, i16* %out, i16* %stim) nounwind uwtable {
._crit_edge:
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %A_stim_reset) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %V_stim_reset) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %set_thresh) nounwind, !map !17
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %v_thresh) nounwind, !map !21
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %a_thresh) nounwind, !map !25
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %a_flip) nounwind, !map !29
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %v_flip) nounwind, !map !33
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %datapoint) nounwind, !map !37
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %out) nounwind, !map !43
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %stim) nounwind, !map !47
  call void (...)* @_ssdm_op_SpecTopModule([15 x i8]* @str) nounwind
  %v_flip_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %v_flip) nounwind ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %v_flip_read}, i64 0, metadata !51), !dbg !61 ; [debug line = 22:123] [debug variable = v_flip]
  %a_flip_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %a_flip) nounwind ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %a_flip_read}, i64 0, metadata !62), !dbg !63 ; [debug line = 22:111] [debug variable = a_flip]
  %a_thresh_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %a_thresh) nounwind ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %a_thresh_read}, i64 0, metadata !64), !dbg !65 ; [debug line = 22:97] [debug variable = a_thresh]
  %v_thresh_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %v_thresh) nounwind ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %v_thresh_read}, i64 0, metadata !66), !dbg !67 ; [debug line = 22:83] [debug variable = v_thresh]
  %set_thresh_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %set_thresh) nounwind ; [#uses=1 type=i16]
  call void @llvm.dbg.value(metadata !{i16 %set_thresh_read}, i64 0, metadata !68), !dbg !69 ; [debug line = 22:67] [debug variable = set_thresh]
  %V_stim_reset_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %V_stim_reset) nounwind ; [#uses=1 type=i16]
  call void @llvm.dbg.value(metadata !{i16 %V_stim_reset_read}, i64 0, metadata !70), !dbg !71 ; [debug line = 22:47] [debug variable = V_stim_reset]
  %A_stim_reset_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %A_stim_reset) nounwind ; [#uses=1 type=i16]
  call void @llvm.dbg.value(metadata !{i16 %A_stim_reset_read}, i64 0, metadata !72), !dbg !73 ; [debug line = 22:27] [debug variable = A_stim_reset]
  call void @llvm.dbg.value(metadata !{i16 %A_stim_reset}, i64 0, metadata !72), !dbg !73 ; [debug line = 22:27] [debug variable = A_stim_reset]
  call void @llvm.dbg.value(metadata !{i16 %V_stim_reset}, i64 0, metadata !70), !dbg !71 ; [debug line = 22:47] [debug variable = V_stim_reset]
  call void @llvm.dbg.value(metadata !{i16 %set_thresh}, i64 0, metadata !68), !dbg !69 ; [debug line = 22:67] [debug variable = set_thresh]
  call void @llvm.dbg.value(metadata !{i32 %v_thresh}, i64 0, metadata !66), !dbg !67 ; [debug line = 22:83] [debug variable = v_thresh]
  call void @llvm.dbg.value(metadata !{i32 %a_thresh}, i64 0, metadata !64), !dbg !65 ; [debug line = 22:97] [debug variable = a_thresh]
  call void @llvm.dbg.value(metadata !{i32 %a_flip}, i64 0, metadata !62), !dbg !63 ; [debug line = 22:111] [debug variable = a_flip]
  call void @llvm.dbg.value(metadata !{i32 %v_flip}, i64 0, metadata !51), !dbg !61 ; [debug line = 22:123] [debug variable = v_flip]
  call void @llvm.dbg.value(metadata !{i16* %datapoint}, i64 0, metadata !74), !dbg !75 ; [debug line = 22:139] [debug variable = datapoint]
  call void @llvm.dbg.value(metadata !{i16* %out}, i64 0, metadata !76), !dbg !77 ; [debug line = 22:158] [debug variable = out]
  call void @llvm.dbg.value(metadata !{i16* %stim}, i64 0, metadata !78), !dbg !79 ; [debug line = 22:171] [debug variable = stim]
  %tmp = icmp eq i16 %A_stim_reset_read, 0, !dbg !80 ; [#uses=1 type=i1] [debug line = 24:2]
  %AstimDelay_load = load i32* @AstimDelay, align 4, !dbg !82 ; [#uses=1 type=i32] [debug line = 43:2]
  %tmp_1 = icmp eq i16 %V_stim_reset_read, 0, !dbg !83 ; [#uses=1 type=i1] [debug line = 27:2]
  %VstimDelay_load = load i32* @VstimDelay, align 4, !dbg !84 ; [#uses=1 type=i32] [debug line = 44:2]
  %tmp_2 = icmp eq i16 %set_thresh_read, 0, !dbg !85 ; [#uses=1 type=i1] [debug line = 30:2]
  br i1 %tmp_2, label %._crit_edge12_ifconv, label %0, !dbg !85 ; [debug line = 30:2]

; <label>:0                                       ; preds = %._crit_edge
  store i32 %v_thresh_read, i32* @vthresh, align 4, !dbg !86 ; [debug line = 32:6]
  store i32 %a_thresh_read, i32* @athresh, align 4, !dbg !88 ; [debug line = 33:6]
  store i32 %a_flip_read, i32* @aflip, align 4, !dbg !89 ; [debug line = 34:6]
  store i32 %v_flip_read, i32* @vflip, align 4, !dbg !90 ; [debug line = 35:6]
  br label %._crit_edge12_ifconv, !dbg !91        ; [debug line = 36:2]

._crit_edge12_ifconv:                             ; preds = %0, %._crit_edge
  %datapoint_read = call i16 @_ssdm_op_Read.ap_auto.i16P(i16* %datapoint) nounwind, !dbg !92 ; [#uses=2 type=i16] [debug line = 38:2]
  %val_assign = sext i16 %datapoint_read to i32, !dbg !92 ; [#uses=1 type=i32] [debug line = 38:2]
  call void @llvm.dbg.value(metadata !{i32 %val_assign}, i64 0, metadata !93) nounwind, !dbg !120 ; [debug line = 12:14@38:2] [debug variable = val]
  %recentdatapoints_len_load = load i32* @recentdatapoints_len, align 4, !dbg !121 ; [#uses=2 type=i32] [debug line = 13:3@38:2]
  %tmp_i = icmp eq i32 %recentdatapoints_len_load, 20, !dbg !121 ; [#uses=2 type=i1] [debug line = 13:3@38:2]
  %recentdatapoints_head_i_load = load i32* @recentdatapoints_head_i, align 4, !dbg !123 ; [#uses=2 type=i32] [debug line = 14:4@38:2]
  %recentdatapoints_sum_load = load i32* @recentdatapoints_sum, align 4, !dbg !123 ; [#uses=2 type=i32] [debug line = 14:4@38:2]
  %tmp_i_4 = sext i32 %recentdatapoints_head_i_load to i64, !dbg !123 ; [#uses=1 type=i64] [debug line = 14:4@38:2]
  %recentdatapoints_data_addr = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_i_4, !dbg !123 ; [#uses=2 type=i16*] [debug line = 14:4@38:2]
  %recentdatapoints_data_load = load i16* %recentdatapoints_data_addr, align 2 ; [#uses=1 type=i16]
  %extLd = sext i16 %recentdatapoints_data_load to i32 ; [#uses=1 type=i32]
  %tmp_33_i = sub nsw i32 %recentdatapoints_sum_load, %extLd, !dbg !123 ; [#uses=1 type=i32] [debug line = 14:4@38:2]
  %recentdatapoints_sum_loc_i = select i1 %tmp_i, i32 %tmp_33_i, i32 %recentdatapoints_sum_load ; [#uses=1 type=i32]
  store i16 %datapoint_read, i16* %recentdatapoints_data_addr, align 2, !dbg !125 ; [debug line = 17:3@38:2]
  %tmp_35_i = add nsw i32 %recentdatapoints_sum_loc_i, %val_assign, !dbg !126 ; [#uses=1 type=i32] [debug line = 18:3@38:2]
  %recentdatapoints_len_load_op = add i32 %recentdatapoints_len_load, 1, !dbg !127 ; [#uses=1 type=i32] [debug line = 19:3@38:2]
  %tmp_36_i = select i1 %tmp_i, i32 20, i32 %recentdatapoints_len_load_op, !dbg !127 ; [#uses=3 type=i32] [debug line = 19:3@38:2]
  %tmp_37_i = add nsw i32 %recentdatapoints_head_i_load, 1, !dbg !128 ; [#uses=2 type=i32] [debug line = 20:3@38:2]
  %tmp_38_i = icmp eq i32 %tmp_37_i, 20, !dbg !129 ; [#uses=1 type=i1] [debug line = 21:3@38:2]
  %p_tmp_i = select i1 %tmp_38_i, i32 0, i32 %tmp_37_i, !dbg !129 ; [#uses=4 type=i32] [debug line = 21:3@38:2]
  store i32 %p_tmp_i, i32* @recentdatapoints_head_i, align 4, !dbg !128 ; [debug line = 20:3@38:2]
  store i32 %tmp_35_i, i32* @recentdatapoints_sum, align 4, !dbg !123 ; [debug line = 14:4@38:2]
  store i32 %tmp_36_i, i32* @recentdatapoints_len, align 4, !dbg !130 ; [debug line = 15:4@38:2]
  %AbeatDelay_load = load i32* @AbeatDelay, align 4, !dbg !131 ; [#uses=1 type=i32] [debug line = 40:2]
  %tmp_4 = add nsw i32 %AbeatDelay_load, 1, !dbg !131 ; [#uses=3 type=i32] [debug line = 40:2]
  %VbeatDelay_load = load i32* @VbeatDelay, align 4, !dbg !132 ; [#uses=1 type=i32] [debug line = 41:2]
  %tmp_5 = add nsw i32 %VbeatDelay_load, 1, !dbg !132 ; [#uses=3 type=i32] [debug line = 41:2]
  %VbeatFallDelay_load = load i32* @VbeatFallDelay, align 4, !dbg !133 ; [#uses=1 type=i32] [debug line = 42:2]
  %tmp_6 = add nsw i32 %VbeatFallDelay_load, 1, !dbg !133 ; [#uses=3 type=i32] [debug line = 42:2]
  %AstimDelay_load_op = add i32 %AstimDelay_load, 1, !dbg !82 ; [#uses=1 type=i32] [debug line = 43:2]
  %tmp_7 = select i1 %tmp, i32 %AstimDelay_load_op, i32 1, !dbg !82 ; [#uses=2 type=i32] [debug line = 43:2]
  %VstimDelay_load_op = add i32 %VstimDelay_load, 1, !dbg !84 ; [#uses=1 type=i32] [debug line = 44:2]
  %tmp_8 = select i1 %tmp_1, i32 %VstimDelay_load_op, i32 1, !dbg !84 ; [#uses=2 type=i32] [debug line = 44:2]
  %tmp_i9 = icmp eq i32 %tmp_36_i, 0, !dbg !134   ; [#uses=1 type=i1] [debug line = 26:3@47:19]
  %i = add nsw i32 %p_tmp_i, -1, !dbg !138        ; [#uses=2 type=i32] [debug line = 28:21@47:19]
  call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !139) nounwind, !dbg !138 ; [debug line = 28:21@47:19] [debug variable = i]
  %tmp_12 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i, i32 31), !dbg !140 ; [#uses=1 type=i1] [debug line = 29:3@47:19]
  %i_1 = add nsw i32 %p_tmp_i, 19, !dbg !141      ; [#uses=1 type=i32] [debug line = 30:4@47:19]
  call void @llvm.dbg.value(metadata !{i32 %i_1}, i64 0, metadata !139) nounwind, !dbg !141 ; [debug line = 30:4@47:19] [debug variable = i]
  %p_i = select i1 %tmp_12, i32 %i_1, i32 %i, !dbg !140 ; [#uses=1 type=i32] [debug line = 29:3@47:19]
  %tmp_39_i = sext i32 %p_i to i64, !dbg !142     ; [#uses=1 type=i64] [debug line = 31:3@47:19]
  %recentdatapoints_data_addr_1 = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_39_i, !dbg !142 ; [#uses=1 type=i16*] [debug line = 31:3@47:19]
  %recentdatapoints_data_load_1 = load i16* %recentdatapoints_data_addr_1, align 2 ; [#uses=1 type=i16]
  %datapointV = select i1 %tmp_i9, i16 0, i16 %recentdatapoints_data_load_1, !dbg !137 ; [#uses=1 type=i16] [debug line = 47:19]
  %datapointV_cast = sext i16 %datapointV to i32, !dbg !137 ; [#uses=1 type=i32] [debug line = 47:19]
  call void @llvm.dbg.value(metadata !{i16 %datapointV}, i64 0, metadata !143), !dbg !137 ; [debug line = 47:19] [debug variable = datapointV]
  %sum = load i32* @recentVBools_sum, align 4, !dbg !144 ; [#uses=3 type=i32] [debug line = 49:28]
  call void @llvm.dbg.value(metadata !{i32 %sum}, i64 0, metadata !145), !dbg !144 ; [debug line = 49:28] [debug variable = sum]
  %vflip_load = load i32* @vflip, align 4, !dbg !146 ; [#uses=1 type=i32] [debug line = 50:2]
  %tmp_9 = mul nsw i32 %vflip_load, %datapointV_cast, !dbg !146 ; [#uses=1 type=i32] [debug line = 50:2]
  %vthresh_load = load i32* @vthresh, align 4, !dbg !146 ; [#uses=1 type=i32] [debug line = 50:2]
  %tmp_s = icmp sgt i32 %tmp_9, %vthresh_load, !dbg !146 ; [#uses=2 type=i1] [debug line = 50:2]
  %val_assign_1 = zext i1 %tmp_s to i32, !dbg !146 ; [#uses=1 type=i32] [debug line = 50:2]
  call void @llvm.dbg.value(metadata !{i32 %val_assign_1}, i64 0, metadata !147) nounwind, !dbg !172 ; [debug line = 12:14@50:2] [debug variable = val]
  %recentVBools_len_load = load i32* @recentVBools_len, align 4, !dbg !173 ; [#uses=2 type=i32] [debug line = 13:3@50:2]
  %tmp_i1 = icmp eq i32 %recentVBools_len_load, 11, !dbg !173 ; [#uses=2 type=i1] [debug line = 13:3@50:2]
  %recentVBools_head_i_load = load i32* @recentVBools_head_i, align 4, !dbg !175 ; [#uses=2 type=i32] [debug line = 14:4@50:2]
  %tmp_i2 = sext i32 %recentVBools_head_i_load to i64, !dbg !175 ; [#uses=1 type=i64] [debug line = 14:4@50:2]
  %recentVBools_data_addr = getelementptr [11 x i1]* @recentVBools_data, i64 0, i64 %tmp_i2, !dbg !175 ; [#uses=2 type=i1*] [debug line = 14:4@50:2]
  %recentVBools_data_load = load i1* %recentVBools_data_addr, align 1 ; [#uses=1 type=i1]
  %extLd1 = zext i1 %recentVBools_data_load to i32 ; [#uses=1 type=i32]
  %tmp_40_i = sub nsw i32 %sum, %extLd1, !dbg !175 ; [#uses=1 type=i32] [debug line = 14:4@50:2]
  %recentVBools_sum_loc_i = select i1 %tmp_i1, i32 %tmp_40_i, i32 %sum ; [#uses=1 type=i32]
  store i1 %tmp_s, i1* %recentVBools_data_addr, align 1, !dbg !177 ; [debug line = 17:3@50:2]
  %tmp_42_i = add nsw i32 %recentVBools_sum_loc_i, %val_assign_1, !dbg !178 ; [#uses=1 type=i32] [debug line = 18:3@50:2]
  %recentVBools_len_load_op = add i32 %recentVBools_len_load, 1, !dbg !179 ; [#uses=1 type=i32] [debug line = 19:3@50:2]
  %tmp_43_i = select i1 %tmp_i1, i32 11, i32 %recentVBools_len_load_op, !dbg !179 ; [#uses=2 type=i32] [debug line = 19:3@50:2]
  %tmp_44_i = add nsw i32 %recentVBools_head_i_load, 1, !dbg !180 ; [#uses=2 type=i32] [debug line = 20:3@50:2]
  %tmp_45_i = icmp eq i32 %tmp_44_i, 11, !dbg !181 ; [#uses=1 type=i1] [debug line = 21:3@50:2]
  %p_tmp_i1 = select i1 %tmp_45_i, i32 0, i32 %tmp_44_i, !dbg !181 ; [#uses=3 type=i32] [debug line = 21:3@50:2]
  store i32 %p_tmp_i1, i32* @recentVBools_head_i, align 4, !dbg !180 ; [debug line = 20:3@50:2]
  store i32 %tmp_42_i, i32* @recentVBools_sum, align 4, !dbg !175 ; [debug line = 14:4@50:2]
  store i32 %tmp_43_i, i32* @recentVBools_len, align 4, !dbg !182 ; [debug line = 15:4@50:2]
  %i_2 = add nsw i32 %p_tmp_i1, -1, !dbg !183     ; [#uses=2 type=i32] [debug line = 28:21@51:9]
  call void @llvm.dbg.value(metadata !{i32 %i_2}, i64 0, metadata !187) nounwind, !dbg !183 ; [debug line = 28:21@51:9] [debug variable = i]
  %tmp_25 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_2, i32 31), !dbg !188 ; [#uses=1 type=i1] [debug line = 29:3@51:9]
  %i_3 = add nsw i32 %p_tmp_i1, 10, !dbg !189     ; [#uses=1 type=i32] [debug line = 30:4@51:9]
  call void @llvm.dbg.value(metadata !{i32 %i_3}, i64 0, metadata !187) nounwind, !dbg !189 ; [debug line = 30:4@51:9] [debug variable = i]
  %p_i1 = select i1 %tmp_25, i32 %i_3, i32 %i_2, !dbg !188 ; [#uses=1 type=i32] [debug line = 29:3@51:9]
  %tmp_46_i = sext i32 %p_i1 to i64, !dbg !190    ; [#uses=1 type=i64] [debug line = 31:3@51:9]
  %recentVBools_data_addr_1 = getelementptr [11 x i1]* @recentVBools_data, i64 0, i64 %tmp_46_i, !dbg !190 ; [#uses=1 type=i1*] [debug line = 31:3@51:9]
  %recentVBools_data_load_1 = load i1* %recentVBools_data_addr_1, align 1 ; [#uses=1 type=i1]
  %not_tmp_i2 = icmp ne i32 %tmp_43_i, 0          ; [#uses=1 type=i1]
  %p_0_i = and i1 %recentVBools_data_load_1, %not_tmp_i2 ; [#uses=1 type=i1]
  %p_0_i_cast = zext i1 %p_0_i to i32             ; [#uses=1 type=i32]
  %sum_1 = add nsw i32 %p_0_i_cast, %sum, !dbg !186 ; [#uses=1 type=i32] [debug line = 51:9]
  call void @llvm.dbg.value(metadata !{i32 %sum_1}, i64 0, metadata !145), !dbg !186 ; [debug line = 51:9] [debug variable = sum]
  %tmp_3 = icmp sgt i32 %sum_1, 5, !dbg !191      ; [#uses=1 type=i1] [debug line = 53:2]
  store i32 %tmp_8, i32* @VstimDelay, align 4, !dbg !192 ; [debug line = 28:3]
  store i32 %tmp_7, i32* @AstimDelay, align 4, !dbg !193 ; [debug line = 25:3]
  %last_sample_is_V_load = load i1* @last_sample_is_V, align 1 ; [#uses=4 type=i1]
  br i1 %tmp_3, label %1, label %3, !dbg !191     ; [debug line = 53:2]

; <label>:1                                       ; preds = %._crit_edge12_ifconv
  br i1 %last_sample_is_V_load, label %._crit_edge13_ifconv, label %2, !dbg !194 ; [debug line = 55:3]

; <label>:2                                       ; preds = %1
  store i1 true, i1* @last_sample_is_V, align 1, !dbg !196 ; [debug line = 58:4]
  br label %._crit_edge13_ifconv, !dbg !198       ; [debug line = 59:3]

; <label>:3                                       ; preds = %._crit_edge12_ifconv
  br i1 %last_sample_is_V_load, label %4, label %._crit_edge13_ifconv, !dbg !199 ; [debug line = 61:7]

; <label>:4                                       ; preds = %3
  store i1 false, i1* @last_sample_is_V, align 1, !dbg !200 ; [debug line = 64:3]
  br label %._crit_edge13_ifconv, !dbg !202       ; [debug line = 65:2]

._crit_edge13_ifconv:                             ; preds = %4, %3, %2, %1
  %VbeatDelay_new_1 = phi i32 [ 0, %2 ], [ %tmp_5, %1 ], [ %tmp_5, %4 ], [ %tmp_5, %3 ] ; [#uses=4 type=i32]
  %VbeatFallDelay_new_1 = phi i32 [ %tmp_6, %2 ], [ %tmp_6, %1 ], [ 0, %4 ], [ %tmp_6, %3 ] ; [#uses=2 type=i32]
  %last_sample_is_V_loc_2 = phi i1 [ true, %2 ], [ %last_sample_is_V_load, %1 ], [ false, %4 ], [ %last_sample_is_V_load, %3 ] ; [#uses=1 type=i1]
  %tmp_i3 = icmp eq i32 %tmp_36_i, 20, !dbg !203  ; [#uses=1 type=i1] [debug line = 46:3@68:19]
  %tmp_i4 = sext i32 %p_tmp_i to i64, !dbg !207   ; [#uses=1 type=i64] [debug line = 47:4@68:19]
  %recentdatapoints_data_addr_2 = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_i4, !dbg !207 ; [#uses=1 type=i16*] [debug line = 47:4@68:19]
  %recentdatapoints_data_load_2 = load i16* %recentdatapoints_data_addr_2, align 2 ; [#uses=1 type=i16]
  %datapointA = select i1 %tmp_i3, i16 %recentdatapoints_data_load_2, i16 0, !dbg !206 ; [#uses=1 type=i16] [debug line = 68:19]
  %datapointA_cast = sext i16 %datapointA to i32, !dbg !206 ; [#uses=1 type=i32] [debug line = 68:19]
  call void @llvm.dbg.value(metadata !{i16 %datapointA}, i64 0, metadata !208), !dbg !206 ; [debug line = 68:19] [debug variable = datapointA]
  %sum_2 = load i32* @recentABools_sum, align 4, !dbg !209 ; [#uses=3 type=i32] [debug line = 69:2]
  call void @llvm.dbg.value(metadata !{i32 %sum_2}, i64 0, metadata !145), !dbg !209 ; [debug line = 69:2] [debug variable = sum]
  %aflip_load = load i32* @aflip, align 4, !dbg !210 ; [#uses=1 type=i32] [debug line = 71:2]
  %tmp_10 = mul nsw i32 %aflip_load, %datapointA_cast, !dbg !210 ; [#uses=1 type=i32] [debug line = 71:2]
  %athresh_load = load i32* @athresh, align 4, !dbg !210 ; [#uses=1 type=i32] [debug line = 71:2]
  %tmp_11 = icmp sgt i32 %tmp_10, %athresh_load, !dbg !210 ; [#uses=2 type=i1] [debug line = 71:2]
  %val_assign_2 = zext i1 %tmp_11 to i32, !dbg !210 ; [#uses=1 type=i32] [debug line = 71:2]
  call void @llvm.dbg.value(metadata !{i32 %val_assign_2}, i64 0, metadata !211) nounwind, !dbg !236 ; [debug line = 12:14@71:2] [debug variable = val]
  %recentABools_len_load = load i32* @recentABools_len, align 4, !dbg !237 ; [#uses=2 type=i32] [debug line = 13:3@71:2]
  %tmp_i4_5 = icmp eq i32 %recentABools_len_load, 30, !dbg !237 ; [#uses=2 type=i1] [debug line = 13:3@71:2]
  %recentABools_head_i_load = load i32* @recentABools_head_i, align 4, !dbg !239 ; [#uses=2 type=i32] [debug line = 14:4@71:2]
  %tmp_i5 = sext i32 %recentABools_head_i_load to i64, !dbg !239 ; [#uses=1 type=i64] [debug line = 14:4@71:2]
  %recentABools_data_addr = getelementptr [30 x i1]* @recentABools_data, i64 0, i64 %tmp_i5, !dbg !239 ; [#uses=2 type=i1*] [debug line = 14:4@71:2]
  %recentABools_data_load = load i1* %recentABools_data_addr, align 1 ; [#uses=1 type=i1]
  %extLd2 = zext i1 %recentABools_data_load to i32 ; [#uses=1 type=i32]
  %tmp_47_i = sub nsw i32 %sum_2, %extLd2, !dbg !239 ; [#uses=1 type=i32] [debug line = 14:4@71:2]
  %recentABools_sum_loc_i = select i1 %tmp_i4_5, i32 %tmp_47_i, i32 %sum_2 ; [#uses=1 type=i32]
  store i1 %tmp_11, i1* %recentABools_data_addr, align 1, !dbg !241 ; [debug line = 17:3@71:2]
  %tmp_49_i = add nsw i32 %recentABools_sum_loc_i, %val_assign_2, !dbg !242 ; [#uses=1 type=i32] [debug line = 18:3@71:2]
  %recentABools_len_load_op = add i32 %recentABools_len_load, 1, !dbg !243 ; [#uses=1 type=i32] [debug line = 19:3@71:2]
  %tmp_50_i = select i1 %tmp_i4_5, i32 30, i32 %recentABools_len_load_op, !dbg !243 ; [#uses=2 type=i32] [debug line = 19:3@71:2]
  %tmp_51_i = add nsw i32 %recentABools_head_i_load, 1, !dbg !244 ; [#uses=2 type=i32] [debug line = 20:3@71:2]
  %tmp_52_i = icmp eq i32 %tmp_51_i, 30, !dbg !245 ; [#uses=1 type=i1] [debug line = 21:3@71:2]
  %p_tmp_i2 = select i1 %tmp_52_i, i32 0, i32 %tmp_51_i, !dbg !245 ; [#uses=3 type=i32] [debug line = 21:3@71:2]
  store i32 %p_tmp_i2, i32* @recentABools_head_i, align 4, !dbg !244 ; [debug line = 20:3@71:2]
  store i32 %tmp_49_i, i32* @recentABools_sum, align 4, !dbg !239 ; [debug line = 14:4@71:2]
  store i32 %tmp_50_i, i32* @recentABools_len, align 4, !dbg !246 ; [debug line = 15:4@71:2]
  %i_4 = add nsw i32 %p_tmp_i2, -1, !dbg !247     ; [#uses=2 type=i32] [debug line = 28:21@72:9]
  call void @llvm.dbg.value(metadata !{i32 %i_4}, i64 0, metadata !251) nounwind, !dbg !247 ; [debug line = 28:21@72:9] [debug variable = i]
  %tmp_26 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_4, i32 31), !dbg !252 ; [#uses=1 type=i1] [debug line = 29:3@72:9]
  %i_5 = add nsw i32 %p_tmp_i2, 29, !dbg !253     ; [#uses=1 type=i32] [debug line = 30:4@72:9]
  call void @llvm.dbg.value(metadata !{i32 %i_5}, i64 0, metadata !251) nounwind, !dbg !253 ; [debug line = 30:4@72:9] [debug variable = i]
  %p_i2 = select i1 %tmp_26, i32 %i_5, i32 %i_4, !dbg !252 ; [#uses=1 type=i32] [debug line = 29:3@72:9]
  %tmp_53_i = sext i32 %p_i2 to i64, !dbg !254    ; [#uses=1 type=i64] [debug line = 31:3@72:9]
  %recentABools_data_addr_1 = getelementptr [30 x i1]* @recentABools_data, i64 0, i64 %tmp_53_i, !dbg !254 ; [#uses=1 type=i1*] [debug line = 31:3@72:9]
  %recentABools_data_load_1 = load i1* %recentABools_data_addr_1, align 1 ; [#uses=1 type=i1]
  %not_tmp_i5 = icmp ne i32 %tmp_50_i, 0          ; [#uses=1 type=i1]
  %p_0_i2 = and i1 %recentABools_data_load_1, %not_tmp_i5 ; [#uses=1 type=i1]
  %p_0_i2_cast = zext i1 %p_0_i2 to i32           ; [#uses=1 type=i32]
  %sum_3 = add nsw i32 %p_0_i2_cast, %sum_2, !dbg !250 ; [#uses=1 type=i32] [debug line = 72:9]
  call void @llvm.dbg.value(metadata !{i32 %sum_3}, i64 0, metadata !145), !dbg !250 ; [debug line = 72:9] [debug variable = sum]
  %tmp_27 = call i28 @_ssdm_op_PartSelect.i28.i32.i32.i32(i32 %sum_3, i32 4, i32 31), !dbg !255 ; [#uses=1 type=i28] [debug line = 74:2]
  %icmp = icmp sgt i28 %tmp_27, 0, !dbg !255      ; [#uses=1 type=i1] [debug line = 74:2]
  store i32 %VbeatFallDelay_new_1, i32* @VbeatFallDelay, align 4, !dbg !133 ; [debug line = 42:2]
  store i32 %VbeatDelay_new_1, i32* @VbeatDelay, align 4, !dbg !132 ; [debug line = 41:2]
  %last_sample_is_A_load = load i1* @last_sample_is_A, align 1 ; [#uses=4 type=i1]
  %tmp_13 = icmp sgt i32 %VbeatDelay_new_1, %VbeatFallDelay_new_1, !dbg !255 ; [#uses=1 type=i1] [debug line = 74:2]
  %or_cond2 = and i1 %icmp, %tmp_13, !dbg !255    ; [#uses=1 type=i1] [debug line = 74:2]
  br i1 %or_cond2, label %5, label %._crit_edge15, !dbg !255 ; [debug line = 74:2]

; <label>:5                                       ; preds = %._crit_edge13_ifconv
  br i1 %last_sample_is_A_load, label %._crit_edge17_ifconv, label %6, !dbg !256 ; [debug line = 76:3]

; <label>:6                                       ; preds = %5
  store i1 true, i1* @last_sample_is_A, align 1, !dbg !258 ; [debug line = 79:4]
  br label %._crit_edge17_ifconv, !dbg !260       ; [debug line = 80:3]

._crit_edge15:                                    ; preds = %._crit_edge13_ifconv
  br i1 %last_sample_is_A_load, label %7, label %._crit_edge17_ifconv, !dbg !261 ; [debug line = 83:7]

; <label>:7                                       ; preds = %._crit_edge15
  store i1 false, i1* @last_sample_is_A, align 1, !dbg !262 ; [debug line = 84:3]
  br label %._crit_edge17_ifconv, !dbg !262       ; [debug line = 84:3]

._crit_edge17_ifconv:                             ; preds = %7, %._crit_edge15, %6, %5
  %AbeatDelay_new = phi i32 [ 0, %6 ], [ %tmp_4, %5 ], [ %tmp_4, %._crit_edge15 ], [ %tmp_4, %7 ] ; [#uses=5 type=i32]
  %tmp_14 = phi i1 [ true, %6 ], [ %last_sample_is_A_load, %5 ], [ %last_sample_is_A_load, %._crit_edge15 ], [ false, %7 ] ; [#uses=1 type=i1]
  %tmp_15 = icmp ne i32 %VbeatDelay_new_1, 0, !dbg !263 ; [#uses=1 type=i1] [debug line = 86:2]
  %tmp_16 = xor i1 %last_sample_is_V_loc_2, true, !dbg !263 ; [#uses=1 type=i1] [debug line = 86:2]
  %or_cond = or i1 %tmp_15, %tmp_16, !dbg !263    ; [#uses=1 type=i1] [debug line = 86:2]
  store i32 %AbeatDelay_new, i32* @AbeatDelay, align 4, !dbg !131 ; [debug line = 40:2]
  %tmp_17 = icmp ne i32 %AbeatDelay_new, 0, !dbg !264 ; [#uses=1 type=i1] [debug line = 90:10]
  %tmp_18 = xor i1 %tmp_14, true, !dbg !264       ; [#uses=1 type=i1] [debug line = 90:10]
  %or_cond4 = or i1 %tmp_17, %tmp_18, !dbg !264   ; [#uses=1 type=i1] [debug line = 90:10]
  %storemerge = select i1 %or_cond4, i6 0, i6 -31, !dbg !264 ; [#uses=1 type=i6] [debug line = 90:10]
  %storemerge1 = select i1 %or_cond, i6 %storemerge, i6 -10 ; [#uses=1 type=i6]
  %storemerge1_cast1 = sext i6 %storemerge1 to i7 ; [#uses=1 type=i7]
  %storemerge1_cast = zext i7 %storemerge1_cast1 to i16 ; [#uses=1 type=i16]
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %out, i16 %storemerge1_cast) nounwind, !dbg !265 ; [debug line = 88:3]
  %tmp_19 = icmp sgt i32 %AbeatDelay_new, 1000, !dbg !267 ; [#uses=1 type=i1] [debug line = 98:2]
  %tmp_20 = icmp sgt i32 %tmp_7, 30, !dbg !267    ; [#uses=1 type=i1] [debug line = 98:2]
  %or_cond8 = and i1 %tmp_19, %tmp_20, !dbg !267  ; [#uses=1 type=i1] [debug line = 98:2]
  %tmp_21 = icmp sgt i32 %VbeatDelay_new_1, %AbeatDelay_new, !dbg !268 ; [#uses=1 type=i1] [debug line = 108:2]
  %tmp_22 = icmp sgt i32 %AbeatDelay_new, 900, !dbg !268 ; [#uses=1 type=i1] [debug line = 108:2]
  %tmp_23 = icmp sgt i32 %tmp_8, 11, !dbg !268    ; [#uses=1 type=i1] [debug line = 108:2]
  %tmp1 = and i1 %tmp_22, %tmp_23, !dbg !268      ; [#uses=1 type=i1] [debug line = 108:2]
  %or_cond1 = and i1 %tmp1, %tmp_21, !dbg !268    ; [#uses=2 type=i1] [debug line = 108:2]
  %p_s = select i1 %or_cond1, i6 -10, i6 -31, !dbg !268 ; [#uses=1 type=i6] [debug line = 108:2]
  %tmp_24 = or i1 %or_cond1, %or_cond8, !dbg !268 ; [#uses=1 type=i1] [debug line = 108:2]
  %stim_new_1 = select i1 %tmp_24, i6 %p_s, i6 0, !dbg !268 ; [#uses=1 type=i6] [debug line = 108:2]
  %stim_new_1_cast1 = sext i6 %stim_new_1 to i7, !dbg !268 ; [#uses=1 type=i7] [debug line = 108:2]
  %stim_new_1_cast = zext i7 %stim_new_1_cast1 to i16, !dbg !268 ; [#uses=1 type=i16] [debug line = 108:2]
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %stim, i16 %stim_new_1_cast) nounwind, !dbg !269 ; [debug line = 97:2]
  ret void, !dbg !270                             ; [debug line = 117:1]
}

; [#uses=32]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=10]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=3]
define weak i16 @_ssdm_op_Read.ap_auto.i16(i16) {
entry:
  ret i16 %0
}

; [#uses=4]
define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

; [#uses=1]
define weak i16 @_ssdm_op_Read.ap_auto.i16P(i16*) {
entry:
  %empty = load i16* %0                           ; [#uses=1 type=i16]
  ret i16 %empty
}

; [#uses=2]
define weak void @_ssdm_op_Write.ap_auto.i16P(i16*, i16) {
entry:
  store i16 %1, i16* %0
  ret void
}

; [#uses=3]
define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1                          ; [#uses=1 type=i32]
  %empty_6 = and i32 %0, %empty                   ; [#uses=1 type=i32]
  %empty_7 = icmp ne i32 %empty_6, 0              ; [#uses=1 type=i1]
  ret i1 %empty_7
}

; [#uses=1]
define weak i28 @_ssdm_op_PartSelect.i28.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_8 = trunc i32 %empty to i28              ; [#uses=1 type=i28]
  ret i28 %empty_8
}

; [#uses=1]
declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [0 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !""}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 -1, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 15, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"A_stim_reset", metadata !11, metadata !"short"}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 0, i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 15, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"V_stim_reset", metadata !11, metadata !"short"}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 15, metadata !19}
!19 = metadata !{metadata !20}
!20 = metadata !{metadata !"set_thresh", metadata !11, metadata !"short"}
!21 = metadata !{metadata !22}
!22 = metadata !{i32 0, i32 31, metadata !23}
!23 = metadata !{metadata !24}
!24 = metadata !{metadata !"v_thresh", metadata !11, metadata !"int"}
!25 = metadata !{metadata !26}
!26 = metadata !{i32 0, i32 31, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"a_thresh", metadata !11, metadata !"int"}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 31, metadata !31}
!31 = metadata !{metadata !32}
!32 = metadata !{metadata !"a_flip", metadata !11, metadata !"int"}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 31, metadata !35}
!35 = metadata !{metadata !36}
!36 = metadata !{metadata !"v_flip", metadata !11, metadata !"int"}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 0, i32 15, metadata !39}
!39 = metadata !{metadata !40}
!40 = metadata !{metadata !"datapoint", metadata !41, metadata !"short"}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 0, i32 0, i32 1}
!43 = metadata !{metadata !44}
!44 = metadata !{i32 0, i32 15, metadata !45}
!45 = metadata !{metadata !46}
!46 = metadata !{metadata !"out", metadata !41, metadata !"short"}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 0, i32 15, metadata !49}
!49 = metadata !{metadata !50}
!50 = metadata !{metadata !"stim", metadata !41, metadata !"short"}
!51 = metadata !{i32 786689, metadata !52, metadata !"v_flip", metadata !53, i32 117440534, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!52 = metadata !{i32 786478, i32 0, metadata !53, metadata !"singleDecision", metadata !"singleDecision", metadata !"_Z14singleDecisionsssiiiiPsS_S_", metadata !53, i32 22, metadata !54, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i16, i16, i16, i32, i32, i32, i32, i16*, i16*, i16*)* @singleDecision, null, null, metadata !59, i32 23} ; [ DW_TAG_subprogram ]
!53 = metadata !{i32 786473, metadata !"singleChannelDecision.cpp", metadata !"/home/greg/multisite_test_detection_algorithms/xilnx_design", null} ; [ DW_TAG_file_type ]
!54 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !55, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!55 = metadata !{null, metadata !56, metadata !56, metadata !56, metadata !57, metadata !57, metadata !57, metadata !57, metadata !58, metadata !58, metadata !58}
!56 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!57 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!58 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !56} ; [ DW_TAG_pointer_type ]
!59 = metadata !{metadata !60}
!60 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!61 = metadata !{i32 22, i32 123, metadata !52, null}
!62 = metadata !{i32 786689, metadata !52, metadata !"a_flip", metadata !53, i32 100663318, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!63 = metadata !{i32 22, i32 111, metadata !52, null}
!64 = metadata !{i32 786689, metadata !52, metadata !"a_thresh", metadata !53, i32 83886102, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!65 = metadata !{i32 22, i32 97, metadata !52, null}
!66 = metadata !{i32 786689, metadata !52, metadata !"v_thresh", metadata !53, i32 67108886, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!67 = metadata !{i32 22, i32 83, metadata !52, null}
!68 = metadata !{i32 786689, metadata !52, metadata !"set_thresh", metadata !53, i32 50331670, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!69 = metadata !{i32 22, i32 67, metadata !52, null}
!70 = metadata !{i32 786689, metadata !52, metadata !"V_stim_reset", metadata !53, i32 33554454, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!71 = metadata !{i32 22, i32 47, metadata !52, null}
!72 = metadata !{i32 786689, metadata !52, metadata !"A_stim_reset", metadata !53, i32 16777238, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!73 = metadata !{i32 22, i32 27, metadata !52, null}
!74 = metadata !{i32 786689, metadata !52, metadata !"datapoint", metadata !53, i32 134217750, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!75 = metadata !{i32 22, i32 139, metadata !52, null}
!76 = metadata !{i32 786689, metadata !52, metadata !"out", metadata !53, i32 150994966, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!77 = metadata !{i32 22, i32 158, metadata !52, null}
!78 = metadata !{i32 786689, metadata !52, metadata !"stim", metadata !53, i32 167772182, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!79 = metadata !{i32 22, i32 171, metadata !52, null}
!80 = metadata !{i32 24, i32 2, metadata !81, null}
!81 = metadata !{i32 786443, metadata !52, i32 23, i32 1, metadata !53, i32 0} ; [ DW_TAG_lexical_block ]
!82 = metadata !{i32 43, i32 2, metadata !81, null}
!83 = metadata !{i32 27, i32 2, metadata !81, null}
!84 = metadata !{i32 44, i32 2, metadata !81, null}
!85 = metadata !{i32 30, i32 2, metadata !81, null}
!86 = metadata !{i32 32, i32 6, metadata !87, null}
!87 = metadata !{i32 786443, metadata !81, i32 31, i32 2, metadata !53, i32 1} ; [ DW_TAG_lexical_block ]
!88 = metadata !{i32 33, i32 6, metadata !87, null}
!89 = metadata !{i32 34, i32 6, metadata !87, null}
!90 = metadata !{i32 35, i32 6, metadata !87, null}
!91 = metadata !{i32 36, i32 2, metadata !87, null}
!92 = metadata !{i32 38, i32 2, metadata !81, null}
!93 = metadata !{i32 786689, metadata !94, metadata !"val", metadata !95, i32 33554444, metadata !57, i32 0, metadata !92} ; [ DW_TAG_arg_variable ]
!94 = metadata !{i32 786478, i32 0, null, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi20EE4pushEi", metadata !95, i32 12, metadata !96, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !111, metadata !59, i32 12} ; [ DW_TAG_subprogram ]
!95 = metadata !{i32 786473, metadata !"./circularBuffer.h", metadata !"/home/greg/multisite_test_detection_algorithms/xilnx_design", null} ; [ DW_TAG_file_type ]
!96 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !97, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!97 = metadata !{null, metadata !98, metadata !57}
!98 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !99} ; [ DW_TAG_pointer_type ]
!99 = metadata !{i32 786434, null, metadata !"CircularBuffer<int, 20>", metadata !95, i32 3, i64 736, i64 32, i32 0, i32 0, null, metadata !100, i32 0, null, metadata !117} ; [ DW_TAG_class_type ]
!100 = metadata !{metadata !101, metadata !102, metadata !106, metadata !107, metadata !108, metadata !111, metadata !112, metadata !115, metadata !116}
!101 = metadata !{i32 786445, metadata !99, metadata !"sum", metadata !95, i32 4, i64 32, i64 32, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!102 = metadata !{i32 786445, metadata !99, metadata !"data", metadata !95, i32 5, i64 640, i64 32, i64 32, i32 0, metadata !103} ; [ DW_TAG_member ]
!103 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 640, i64 32, i32 0, i32 0, metadata !57, metadata !104, i32 0, i32 0} ; [ DW_TAG_array_type ]
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786465, i64 0, i64 19}      ; [ DW_TAG_subrange_type ]
!106 = metadata !{i32 786445, metadata !99, metadata !"head_i", metadata !95, i32 6, i64 32, i64 32, i64 672, i32 0, metadata !57} ; [ DW_TAG_member ]
!107 = metadata !{i32 786445, metadata !99, metadata !"len", metadata !95, i32 7, i64 32, i64 32, i64 704, i32 0, metadata !57} ; [ DW_TAG_member ]
!108 = metadata !{i32 786478, i32 0, metadata !99, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"", metadata !95, i32 8, metadata !109, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 8} ; [ DW_TAG_subprogram ]
!109 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !110, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!110 = metadata !{null, metadata !98}
!111 = metadata !{i32 786478, i32 0, metadata !99, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi20EE4pushEi", metadata !95, i32 12, metadata !96, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 12} ; [ DW_TAG_subprogram ]
!112 = metadata !{i32 786478, i32 0, metadata !99, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi20EE4headEv", metadata !95, i32 25, metadata !113, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 25} ; [ DW_TAG_subprogram ]
!113 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !114, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!114 = metadata !{metadata !57, metadata !98}
!115 = metadata !{i32 786478, i32 0, metadata !99, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi20EE4tailEv", metadata !95, i32 34, metadata !113, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 34} ; [ DW_TAG_subprogram ]
!116 = metadata !{i32 786478, i32 0, metadata !99, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi20EE5ftailEv", metadata !95, i32 45, metadata !113, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 45} ; [ DW_TAG_subprogram ]
!117 = metadata !{metadata !118, metadata !119}
!118 = metadata !{i32 786479, null, metadata !"T", metadata !57, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!119 = metadata !{i32 786480, null, metadata !"maxsize", metadata !57, i64 20, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!120 = metadata !{i32 12, i32 14, metadata !94, metadata !92}
!121 = metadata !{i32 13, i32 3, metadata !122, metadata !92}
!122 = metadata !{i32 786443, metadata !94, i32 12, i32 19, metadata !95, i32 21} ; [ DW_TAG_lexical_block ]
!123 = metadata !{i32 14, i32 4, metadata !124, metadata !92}
!124 = metadata !{i32 786443, metadata !122, i32 13, i32 23, metadata !95, i32 22} ; [ DW_TAG_lexical_block ]
!125 = metadata !{i32 17, i32 3, metadata !122, metadata !92}
!126 = metadata !{i32 18, i32 3, metadata !122, metadata !92}
!127 = metadata !{i32 19, i32 3, metadata !122, metadata !92}
!128 = metadata !{i32 20, i32 3, metadata !122, metadata !92}
!129 = metadata !{i32 21, i32 3, metadata !122, metadata !92}
!130 = metadata !{i32 15, i32 4, metadata !124, metadata !92}
!131 = metadata !{i32 40, i32 2, metadata !81, null}
!132 = metadata !{i32 41, i32 2, metadata !81, null}
!133 = metadata !{i32 42, i32 2, metadata !81, null}
!134 = metadata !{i32 26, i32 3, metadata !135, metadata !137}
!135 = metadata !{i32 786443, metadata !136, i32 25, i32 11, metadata !95, i32 20} ; [ DW_TAG_lexical_block ]
!136 = metadata !{i32 786478, i32 0, null, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi20EE4headEv", metadata !95, i32 25, metadata !113, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !112, metadata !59, i32 25} ; [ DW_TAG_subprogram ]
!137 = metadata !{i32 47, i32 19, metadata !81, null}
!138 = metadata !{i32 28, i32 21, metadata !135, metadata !137}
!139 = metadata !{i32 786688, metadata !135, metadata !"i", metadata !95, i32 28, metadata !57, i32 0, metadata !137} ; [ DW_TAG_auto_variable ]
!140 = metadata !{i32 29, i32 3, metadata !135, metadata !137}
!141 = metadata !{i32 30, i32 4, metadata !135, metadata !137}
!142 = metadata !{i32 31, i32 3, metadata !135, metadata !137}
!143 = metadata !{i32 786688, metadata !81, metadata !"datapointV", metadata !53, i32 47, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!144 = metadata !{i32 49, i32 28, metadata !81, null}
!145 = metadata !{i32 786688, metadata !81, metadata !"sum", metadata !53, i32 49, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!146 = metadata !{i32 50, i32 2, metadata !81, null}
!147 = metadata !{i32 786689, metadata !148, metadata !"val", metadata !95, i32 33554444, metadata !57, i32 0, metadata !146} ; [ DW_TAG_arg_variable ]
!148 = metadata !{i32 786478, i32 0, null, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi11EE4pushEi", metadata !95, i32 12, metadata !149, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !164, metadata !59, i32 12} ; [ DW_TAG_subprogram ]
!149 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !150, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!150 = metadata !{null, metadata !151, metadata !57}
!151 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !152} ; [ DW_TAG_pointer_type ]
!152 = metadata !{i32 786434, null, metadata !"CircularBuffer<int, 11>", metadata !95, i32 3, i64 448, i64 32, i32 0, i32 0, null, metadata !153, i32 0, null, metadata !170} ; [ DW_TAG_class_type ]
!153 = metadata !{metadata !154, metadata !155, metadata !159, metadata !160, metadata !161, metadata !164, metadata !165, metadata !168, metadata !169}
!154 = metadata !{i32 786445, metadata !152, metadata !"sum", metadata !95, i32 4, i64 32, i64 32, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!155 = metadata !{i32 786445, metadata !152, metadata !"data", metadata !95, i32 5, i64 352, i64 32, i64 32, i32 0, metadata !156} ; [ DW_TAG_member ]
!156 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 352, i64 32, i32 0, i32 0, metadata !57, metadata !157, i32 0, i32 0} ; [ DW_TAG_array_type ]
!157 = metadata !{metadata !158}
!158 = metadata !{i32 786465, i64 0, i64 10}      ; [ DW_TAG_subrange_type ]
!159 = metadata !{i32 786445, metadata !152, metadata !"head_i", metadata !95, i32 6, i64 32, i64 32, i64 384, i32 0, metadata !57} ; [ DW_TAG_member ]
!160 = metadata !{i32 786445, metadata !152, metadata !"len", metadata !95, i32 7, i64 32, i64 32, i64 416, i32 0, metadata !57} ; [ DW_TAG_member ]
!161 = metadata !{i32 786478, i32 0, metadata !152, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"", metadata !95, i32 8, metadata !162, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 8} ; [ DW_TAG_subprogram ]
!162 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !163, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!163 = metadata !{null, metadata !151}
!164 = metadata !{i32 786478, i32 0, metadata !152, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi11EE4pushEi", metadata !95, i32 12, metadata !149, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 12} ; [ DW_TAG_subprogram ]
!165 = metadata !{i32 786478, i32 0, metadata !152, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi11EE4headEv", metadata !95, i32 25, metadata !166, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 25} ; [ DW_TAG_subprogram ]
!166 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !167, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!167 = metadata !{metadata !57, metadata !151}
!168 = metadata !{i32 786478, i32 0, metadata !152, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi11EE4tailEv", metadata !95, i32 34, metadata !166, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 34} ; [ DW_TAG_subprogram ]
!169 = metadata !{i32 786478, i32 0, metadata !152, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi11EE5ftailEv", metadata !95, i32 45, metadata !166, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 45} ; [ DW_TAG_subprogram ]
!170 = metadata !{metadata !118, metadata !171}
!171 = metadata !{i32 786480, null, metadata !"maxsize", metadata !57, i64 11, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!172 = metadata !{i32 12, i32 14, metadata !148, metadata !146}
!173 = metadata !{i32 13, i32 3, metadata !174, metadata !146}
!174 = metadata !{i32 786443, metadata !148, i32 12, i32 19, metadata !95, i32 18} ; [ DW_TAG_lexical_block ]
!175 = metadata !{i32 14, i32 4, metadata !176, metadata !146}
!176 = metadata !{i32 786443, metadata !174, i32 13, i32 23, metadata !95, i32 19} ; [ DW_TAG_lexical_block ]
!177 = metadata !{i32 17, i32 3, metadata !174, metadata !146}
!178 = metadata !{i32 18, i32 3, metadata !174, metadata !146}
!179 = metadata !{i32 19, i32 3, metadata !174, metadata !146}
!180 = metadata !{i32 20, i32 3, metadata !174, metadata !146}
!181 = metadata !{i32 21, i32 3, metadata !174, metadata !146}
!182 = metadata !{i32 15, i32 4, metadata !176, metadata !146}
!183 = metadata !{i32 28, i32 21, metadata !184, metadata !186}
!184 = metadata !{i32 786443, metadata !185, i32 25, i32 11, metadata !95, i32 17} ; [ DW_TAG_lexical_block ]
!185 = metadata !{i32 786478, i32 0, null, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi11EE4headEv", metadata !95, i32 25, metadata !166, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !165, metadata !59, i32 25} ; [ DW_TAG_subprogram ]
!186 = metadata !{i32 51, i32 9, metadata !81, null}
!187 = metadata !{i32 786688, metadata !184, metadata !"i", metadata !95, i32 28, metadata !57, i32 0, metadata !186} ; [ DW_TAG_auto_variable ]
!188 = metadata !{i32 29, i32 3, metadata !184, metadata !186}
!189 = metadata !{i32 30, i32 4, metadata !184, metadata !186}
!190 = metadata !{i32 31, i32 3, metadata !184, metadata !186}
!191 = metadata !{i32 53, i32 2, metadata !81, null}
!192 = metadata !{i32 28, i32 3, metadata !81, null}
!193 = metadata !{i32 25, i32 3, metadata !81, null}
!194 = metadata !{i32 55, i32 3, metadata !195, null}
!195 = metadata !{i32 786443, metadata !81, i32 54, i32 2, metadata !53, i32 2} ; [ DW_TAG_lexical_block ]
!196 = metadata !{i32 58, i32 4, metadata !197, null}
!197 = metadata !{i32 786443, metadata !195, i32 56, i32 3, metadata !53, i32 3} ; [ DW_TAG_lexical_block ]
!198 = metadata !{i32 59, i32 3, metadata !197, null}
!199 = metadata !{i32 61, i32 7, metadata !81, null}
!200 = metadata !{i32 64, i32 3, metadata !201, null}
!201 = metadata !{i32 786443, metadata !81, i32 62, i32 2, metadata !53, i32 4} ; [ DW_TAG_lexical_block ]
!202 = metadata !{i32 65, i32 2, metadata !201, null}
!203 = metadata !{i32 46, i32 3, metadata !204, metadata !206}
!204 = metadata !{i32 786443, metadata !205, i32 45, i32 12, metadata !95, i32 16} ; [ DW_TAG_lexical_block ]
!205 = metadata !{i32 786478, i32 0, null, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi20EE5ftailEv", metadata !95, i32 45, metadata !113, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !116, metadata !59, i32 45} ; [ DW_TAG_subprogram ]
!206 = metadata !{i32 68, i32 19, metadata !81, null}
!207 = metadata !{i32 47, i32 4, metadata !204, metadata !206}
!208 = metadata !{i32 786688, metadata !81, metadata !"datapointA", metadata !53, i32 68, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!209 = metadata !{i32 69, i32 2, metadata !81, null}
!210 = metadata !{i32 71, i32 2, metadata !81, null}
!211 = metadata !{i32 786689, metadata !212, metadata !"val", metadata !95, i32 33554444, metadata !57, i32 0, metadata !210} ; [ DW_TAG_arg_variable ]
!212 = metadata !{i32 786478, i32 0, null, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi30EE4pushEi", metadata !95, i32 12, metadata !213, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !228, metadata !59, i32 12} ; [ DW_TAG_subprogram ]
!213 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !214, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!214 = metadata !{null, metadata !215, metadata !57}
!215 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !216} ; [ DW_TAG_pointer_type ]
!216 = metadata !{i32 786434, null, metadata !"CircularBuffer<int, 30>", metadata !95, i32 3, i64 1056, i64 32, i32 0, i32 0, null, metadata !217, i32 0, null, metadata !234} ; [ DW_TAG_class_type ]
!217 = metadata !{metadata !218, metadata !219, metadata !223, metadata !224, metadata !225, metadata !228, metadata !229, metadata !232, metadata !233}
!218 = metadata !{i32 786445, metadata !216, metadata !"sum", metadata !95, i32 4, i64 32, i64 32, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!219 = metadata !{i32 786445, metadata !216, metadata !"data", metadata !95, i32 5, i64 960, i64 32, i64 32, i32 0, metadata !220} ; [ DW_TAG_member ]
!220 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 960, i64 32, i32 0, i32 0, metadata !57, metadata !221, i32 0, i32 0} ; [ DW_TAG_array_type ]
!221 = metadata !{metadata !222}
!222 = metadata !{i32 786465, i64 0, i64 29}      ; [ DW_TAG_subrange_type ]
!223 = metadata !{i32 786445, metadata !216, metadata !"head_i", metadata !95, i32 6, i64 32, i64 32, i64 992, i32 0, metadata !57} ; [ DW_TAG_member ]
!224 = metadata !{i32 786445, metadata !216, metadata !"len", metadata !95, i32 7, i64 32, i64 32, i64 1024, i32 0, metadata !57} ; [ DW_TAG_member ]
!225 = metadata !{i32 786478, i32 0, metadata !216, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"", metadata !95, i32 8, metadata !226, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 8} ; [ DW_TAG_subprogram ]
!226 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !227, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!227 = metadata !{null, metadata !215}
!228 = metadata !{i32 786478, i32 0, metadata !216, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi30EE4pushEi", metadata !95, i32 12, metadata !213, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 12} ; [ DW_TAG_subprogram ]
!229 = metadata !{i32 786478, i32 0, metadata !216, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi30EE4headEv", metadata !95, i32 25, metadata !230, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 25} ; [ DW_TAG_subprogram ]
!230 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !231, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!231 = metadata !{metadata !57, metadata !215}
!232 = metadata !{i32 786478, i32 0, metadata !216, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi30EE4tailEv", metadata !95, i32 34, metadata !230, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 34} ; [ DW_TAG_subprogram ]
!233 = metadata !{i32 786478, i32 0, metadata !216, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi30EE5ftailEv", metadata !95, i32 45, metadata !230, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !59, i32 45} ; [ DW_TAG_subprogram ]
!234 = metadata !{metadata !118, metadata !235}
!235 = metadata !{i32 786480, null, metadata !"maxsize", metadata !57, i64 30, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!236 = metadata !{i32 12, i32 14, metadata !212, metadata !210}
!237 = metadata !{i32 13, i32 3, metadata !238, metadata !210}
!238 = metadata !{i32 786443, metadata !212, i32 12, i32 19, metadata !95, i32 14} ; [ DW_TAG_lexical_block ]
!239 = metadata !{i32 14, i32 4, metadata !240, metadata !210}
!240 = metadata !{i32 786443, metadata !238, i32 13, i32 23, metadata !95, i32 15} ; [ DW_TAG_lexical_block ]
!241 = metadata !{i32 17, i32 3, metadata !238, metadata !210}
!242 = metadata !{i32 18, i32 3, metadata !238, metadata !210}
!243 = metadata !{i32 19, i32 3, metadata !238, metadata !210}
!244 = metadata !{i32 20, i32 3, metadata !238, metadata !210}
!245 = metadata !{i32 21, i32 3, metadata !238, metadata !210}
!246 = metadata !{i32 15, i32 4, metadata !240, metadata !210}
!247 = metadata !{i32 28, i32 21, metadata !248, metadata !250}
!248 = metadata !{i32 786443, metadata !249, i32 25, i32 11, metadata !95, i32 13} ; [ DW_TAG_lexical_block ]
!249 = metadata !{i32 786478, i32 0, null, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi30EE4headEv", metadata !95, i32 25, metadata !230, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !229, metadata !59, i32 25} ; [ DW_TAG_subprogram ]
!250 = metadata !{i32 72, i32 9, metadata !81, null}
!251 = metadata !{i32 786688, metadata !248, metadata !"i", metadata !95, i32 28, metadata !57, i32 0, metadata !250} ; [ DW_TAG_auto_variable ]
!252 = metadata !{i32 29, i32 3, metadata !248, metadata !250}
!253 = metadata !{i32 30, i32 4, metadata !248, metadata !250}
!254 = metadata !{i32 31, i32 3, metadata !248, metadata !250}
!255 = metadata !{i32 74, i32 2, metadata !81, null}
!256 = metadata !{i32 76, i32 3, metadata !257, null}
!257 = metadata !{i32 786443, metadata !81, i32 75, i32 2, metadata !53, i32 5} ; [ DW_TAG_lexical_block ]
!258 = metadata !{i32 79, i32 4, metadata !259, null}
!259 = metadata !{i32 786443, metadata !257, i32 77, i32 3, metadata !53, i32 6} ; [ DW_TAG_lexical_block ]
!260 = metadata !{i32 80, i32 3, metadata !259, null}
!261 = metadata !{i32 83, i32 7, metadata !81, null}
!262 = metadata !{i32 84, i32 3, metadata !81, null}
!263 = metadata !{i32 86, i32 2, metadata !81, null}
!264 = metadata !{i32 90, i32 10, metadata !81, null}
!265 = metadata !{i32 88, i32 3, metadata !266, null}
!266 = metadata !{i32 786443, metadata !81, i32 87, i32 2, metadata !53, i32 7} ; [ DW_TAG_lexical_block ]
!267 = metadata !{i32 98, i32 2, metadata !81, null}
!268 = metadata !{i32 108, i32 2, metadata !81, null}
!269 = metadata !{i32 97, i32 2, metadata !81, null}
!270 = metadata !{i32 117, i32 1, metadata !81, null}
