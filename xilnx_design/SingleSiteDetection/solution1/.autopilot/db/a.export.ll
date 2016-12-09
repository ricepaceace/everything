; ModuleID = '/home/greg/multisite_test_detection_algorithms/xilnx_design/SingleSiteDetection/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@recentVBools_sum = internal unnamed_addr global i32 0
@recentVBools_head_i = internal unnamed_addr global i32 0
@recentVBools_len = internal unnamed_addr global i32 0
@recentABools_sum = internal unnamed_addr global i32 0
@recentABools_head_i = internal unnamed_addr global i32 0
@recentABools_len = internal unnamed_addr global i32 0
@recentdatapoints_sum = internal unnamed_addr global i32 0
@recentdatapoints_head_i = internal unnamed_addr global i32 0
@recentdatapoints_len = internal unnamed_addr global i32 0
@AstimDelay = internal unnamed_addr global i32 0, align 4
@VstimDelay = internal unnamed_addr global i32 0, align 4
@vthresh = internal unnamed_addr global i32 161, align 4
@athresh = internal unnamed_addr global i32 72, align 4
@aflip = internal unnamed_addr global i32 1, align 4
@vflip = internal unnamed_addr global i32 -1, align 4
@AbeatDelay = internal unnamed_addr global i32 0, align 4
@VbeatDelay = internal unnamed_addr global i32 0, align 4
@VbeatFallDelay = internal unnamed_addr global i32 0, align 4
@llvm_global_ctors_0 = appending global [0 x i32] zeroinitializer
@llvm_global_ctors_1 = appending global [0 x void ()*] zeroinitializer
@str = internal constant [15 x i8] c"singleDecision\00"
@recentdatapoints_data = internal unnamed_addr global [20 x i16] zeroinitializer
@recentVBools_data = internal unnamed_addr global [11 x i1] zeroinitializer
@last_sample_is_V = internal unnamed_addr global i1 false
@recentABools_data = internal unnamed_addr global [30 x i1] zeroinitializer
@last_sample_is_A = internal unnamed_addr global i1 false

define void @singleDecision(i16 signext %A_stim_reset, i16 signext %V_stim_reset, i16 signext %set_thresh, i32 %v_thresh, i32 %a_thresh, i32 %a_flip, i32 %v_flip, i16* %datapoint, i16* %out_r, i16* %stim) nounwind uwtable {
._crit_edge:
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %A_stim_reset) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %V_stim_reset) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %set_thresh) nounwind, !map !17
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %v_thresh) nounwind, !map !21
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %a_thresh) nounwind, !map !25
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %a_flip) nounwind, !map !29
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %v_flip) nounwind, !map !33
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %datapoint) nounwind, !map !37
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %out_r) nounwind, !map !43
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %stim) nounwind, !map !47
  call void (...)* @_ssdm_op_SpecTopModule([15 x i8]* @str) nounwind
  %v_flip_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %v_flip) nounwind
  %a_flip_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %a_flip) nounwind
  %a_thresh_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %a_thresh) nounwind
  %v_thresh_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %v_thresh) nounwind
  %set_thresh_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %set_thresh) nounwind
  %V_stim_reset_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %V_stim_reset) nounwind
  %A_stim_reset_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %A_stim_reset) nounwind
  %tmp = icmp eq i16 %A_stim_reset_read, 0
  %AstimDelay_load = load i32* @AstimDelay, align 4
  %tmp_1 = icmp eq i16 %V_stim_reset_read, 0
  %VstimDelay_load = load i32* @VstimDelay, align 4
  %tmp_2 = icmp eq i16 %set_thresh_read, 0
  br i1 %tmp_2, label %._crit_edge12_ifconv, label %0

; <label>:0                                       ; preds = %._crit_edge
  store i32 %v_thresh_read, i32* @vthresh, align 4
  store i32 %a_thresh_read, i32* @athresh, align 4
  store i32 %a_flip_read, i32* @aflip, align 4
  store i32 %v_flip_read, i32* @vflip, align 4
  br label %._crit_edge12_ifconv

._crit_edge12_ifconv:                             ; preds = %0, %._crit_edge
  %datapoint_read = call i16 @_ssdm_op_Read.ap_auto.i16P(i16* %datapoint) nounwind
  %val_assign = sext i16 %datapoint_read to i32
  %recentdatapoints_len_load = load i32* @recentdatapoints_len, align 4
  %tmp_i = icmp eq i32 %recentdatapoints_len_load, 20
  %recentdatapoints_head_i_load = load i32* @recentdatapoints_head_i, align 4
  %recentdatapoints_sum_load = load i32* @recentdatapoints_sum, align 4
  %tmp_i_4 = sext i32 %recentdatapoints_head_i_load to i64
  %recentdatapoints_data_addr = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_i_4
  %recentdatapoints_data_load = load i16* %recentdatapoints_data_addr, align 2
  %extLd = sext i16 %recentdatapoints_data_load to i32
  %tmp_33_i = sub nsw i32 %recentdatapoints_sum_load, %extLd
  %recentdatapoints_sum_loc_i = select i1 %tmp_i, i32 %tmp_33_i, i32 %recentdatapoints_sum_load
  store i16 %datapoint_read, i16* %recentdatapoints_data_addr, align 2
  %tmp_35_i = add nsw i32 %recentdatapoints_sum_loc_i, %val_assign
  %recentdatapoints_len_load_op = add i32 %recentdatapoints_len_load, 1
  %tmp_36_i = select i1 %tmp_i, i32 20, i32 %recentdatapoints_len_load_op
  %tmp_37_i = add nsw i32 %recentdatapoints_head_i_load, 1
  %tmp_38_i = icmp eq i32 %tmp_37_i, 20
  %p_tmp_i = select i1 %tmp_38_i, i32 0, i32 %tmp_37_i
  store i32 %p_tmp_i, i32* @recentdatapoints_head_i, align 4
  store i32 %tmp_35_i, i32* @recentdatapoints_sum, align 4
  store i32 %tmp_36_i, i32* @recentdatapoints_len, align 4
  %AbeatDelay_load = load i32* @AbeatDelay, align 4
  %tmp_4 = add nsw i32 %AbeatDelay_load, 1
  %VbeatDelay_load = load i32* @VbeatDelay, align 4
  %tmp_5 = add nsw i32 %VbeatDelay_load, 1
  %VbeatFallDelay_load = load i32* @VbeatFallDelay, align 4
  %tmp_6 = add nsw i32 %VbeatFallDelay_load, 1
  %AstimDelay_load_op = add i32 %AstimDelay_load, 1
  %tmp_7 = select i1 %tmp, i32 %AstimDelay_load_op, i32 1
  %VstimDelay_load_op = add i32 %VstimDelay_load, 1
  %tmp_8 = select i1 %tmp_1, i32 %VstimDelay_load_op, i32 1
  %tmp_i9 = icmp eq i32 %tmp_36_i, 0
  %i = add nsw i32 %p_tmp_i, -1
  %tmp_12 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i, i32 31)
  %i_1 = add nsw i32 %p_tmp_i, 19
  %p_i = select i1 %tmp_12, i32 %i_1, i32 %i
  %tmp_39_i = sext i32 %p_i to i64
  %recentdatapoints_data_addr_1 = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_39_i
  %recentdatapoints_data_load_1 = load i16* %recentdatapoints_data_addr_1, align 2
  %datapointV = select i1 %tmp_i9, i16 0, i16 %recentdatapoints_data_load_1
  %datapointV_cast = sext i16 %datapointV to i32
  %sum = load i32* @recentVBools_sum, align 4
  %vflip_load = load i32* @vflip, align 4
  %tmp_9 = mul nsw i32 %vflip_load, %datapointV_cast
  %vthresh_load = load i32* @vthresh, align 4
  %tmp_s = icmp sgt i32 %tmp_9, %vthresh_load
  %val_assign_1 = zext i1 %tmp_s to i32
  %recentVBools_len_load = load i32* @recentVBools_len, align 4
  %tmp_i1 = icmp eq i32 %recentVBools_len_load, 11
  %recentVBools_head_i_load = load i32* @recentVBools_head_i, align 4
  %tmp_i2 = sext i32 %recentVBools_head_i_load to i64
  %recentVBools_data_addr = getelementptr [11 x i1]* @recentVBools_data, i64 0, i64 %tmp_i2
  %recentVBools_data_load = load i1* %recentVBools_data_addr, align 1
  %extLd1 = zext i1 %recentVBools_data_load to i32
  %tmp_40_i = sub nsw i32 %sum, %extLd1
  %recentVBools_sum_loc_i = select i1 %tmp_i1, i32 %tmp_40_i, i32 %sum
  store i1 %tmp_s, i1* %recentVBools_data_addr, align 1
  %tmp_42_i = add nsw i32 %recentVBools_sum_loc_i, %val_assign_1
  %recentVBools_len_load_op = add i32 %recentVBools_len_load, 1
  %tmp_43_i = select i1 %tmp_i1, i32 11, i32 %recentVBools_len_load_op
  %tmp_44_i = add nsw i32 %recentVBools_head_i_load, 1
  %tmp_45_i = icmp eq i32 %tmp_44_i, 11
  %p_tmp_i1 = select i1 %tmp_45_i, i32 0, i32 %tmp_44_i
  store i32 %p_tmp_i1, i32* @recentVBools_head_i, align 4
  store i32 %tmp_42_i, i32* @recentVBools_sum, align 4
  store i32 %tmp_43_i, i32* @recentVBools_len, align 4
  %i_2 = add nsw i32 %p_tmp_i1, -1
  %tmp_25 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_2, i32 31)
  %i_3 = add nsw i32 %p_tmp_i1, 10
  %p_i1 = select i1 %tmp_25, i32 %i_3, i32 %i_2
  %tmp_46_i = sext i32 %p_i1 to i64
  %recentVBools_data_addr_1 = getelementptr [11 x i1]* @recentVBools_data, i64 0, i64 %tmp_46_i
  %recentVBools_data_load_1 = load i1* %recentVBools_data_addr_1, align 1
  %not_tmp_i2 = icmp ne i32 %tmp_43_i, 0
  %p_0_i = and i1 %recentVBools_data_load_1, %not_tmp_i2
  %p_0_i_cast = zext i1 %p_0_i to i32
  %sum_1 = add nsw i32 %p_0_i_cast, %sum
  %tmp_3 = icmp sgt i32 %sum_1, 5
  store i32 %tmp_8, i32* @VstimDelay, align 4
  store i32 %tmp_7, i32* @AstimDelay, align 4
  %last_sample_is_V_load = load i1* @last_sample_is_V, align 1
  br i1 %tmp_3, label %1, label %3

; <label>:1                                       ; preds = %._crit_edge12_ifconv
  br i1 %last_sample_is_V_load, label %._crit_edge13_ifconv, label %2

; <label>:2                                       ; preds = %1
  store i1 true, i1* @last_sample_is_V, align 1
  br label %._crit_edge13_ifconv

; <label>:3                                       ; preds = %._crit_edge12_ifconv
  br i1 %last_sample_is_V_load, label %4, label %._crit_edge13_ifconv

; <label>:4                                       ; preds = %3
  store i1 false, i1* @last_sample_is_V, align 1
  br label %._crit_edge13_ifconv

._crit_edge13_ifconv:                             ; preds = %4, %3, %2, %1
  %VbeatDelay_new_1 = phi i32 [ 0, %2 ], [ %tmp_5, %1 ], [ %tmp_5, %4 ], [ %tmp_5, %3 ]
  %VbeatFallDelay_new_1 = phi i32 [ %tmp_6, %2 ], [ %tmp_6, %1 ], [ 0, %4 ], [ %tmp_6, %3 ]
  %last_sample_is_V_loc_2 = phi i1 [ true, %2 ], [ %last_sample_is_V_load, %1 ], [ false, %4 ], [ %last_sample_is_V_load, %3 ]
  %tmp_i3 = icmp eq i32 %tmp_36_i, 20
  %tmp_i4 = sext i32 %p_tmp_i to i64
  %recentdatapoints_data_addr_2 = getelementptr [20 x i16]* @recentdatapoints_data, i64 0, i64 %tmp_i4
  %recentdatapoints_data_load_2 = load i16* %recentdatapoints_data_addr_2, align 2
  %datapointA = select i1 %tmp_i3, i16 %recentdatapoints_data_load_2, i16 0
  %datapointA_cast = sext i16 %datapointA to i32
  %sum_2 = load i32* @recentABools_sum, align 4
  %aflip_load = load i32* @aflip, align 4
  %tmp_10 = mul nsw i32 %aflip_load, %datapointA_cast
  %athresh_load = load i32* @athresh, align 4
  %tmp_11 = icmp sgt i32 %tmp_10, %athresh_load
  %val_assign_2 = zext i1 %tmp_11 to i32
  %recentABools_len_load = load i32* @recentABools_len, align 4
  %tmp_i4_5 = icmp eq i32 %recentABools_len_load, 30
  %recentABools_head_i_load = load i32* @recentABools_head_i, align 4
  %tmp_i5 = sext i32 %recentABools_head_i_load to i64
  %recentABools_data_addr = getelementptr [30 x i1]* @recentABools_data, i64 0, i64 %tmp_i5
  %recentABools_data_load = load i1* %recentABools_data_addr, align 1
  %extLd2 = zext i1 %recentABools_data_load to i32
  %tmp_47_i = sub nsw i32 %sum_2, %extLd2
  %recentABools_sum_loc_i = select i1 %tmp_i4_5, i32 %tmp_47_i, i32 %sum_2
  store i1 %tmp_11, i1* %recentABools_data_addr, align 1
  %tmp_49_i = add nsw i32 %recentABools_sum_loc_i, %val_assign_2
  %recentABools_len_load_op = add i32 %recentABools_len_load, 1
  %tmp_50_i = select i1 %tmp_i4_5, i32 30, i32 %recentABools_len_load_op
  %tmp_51_i = add nsw i32 %recentABools_head_i_load, 1
  %tmp_52_i = icmp eq i32 %tmp_51_i, 30
  %p_tmp_i2 = select i1 %tmp_52_i, i32 0, i32 %tmp_51_i
  store i32 %p_tmp_i2, i32* @recentABools_head_i, align 4
  store i32 %tmp_49_i, i32* @recentABools_sum, align 4
  store i32 %tmp_50_i, i32* @recentABools_len, align 4
  %i_4 = add nsw i32 %p_tmp_i2, -1
  %tmp_26 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %i_4, i32 31)
  %i_5 = add nsw i32 %p_tmp_i2, 29
  %p_i2 = select i1 %tmp_26, i32 %i_5, i32 %i_4
  %tmp_53_i = sext i32 %p_i2 to i64
  %recentABools_data_addr_1 = getelementptr [30 x i1]* @recentABools_data, i64 0, i64 %tmp_53_i
  %recentABools_data_load_1 = load i1* %recentABools_data_addr_1, align 1
  %not_tmp_i5 = icmp ne i32 %tmp_50_i, 0
  %p_0_i2 = and i1 %recentABools_data_load_1, %not_tmp_i5
  %p_0_i2_cast = zext i1 %p_0_i2 to i32
  %sum_3 = add nsw i32 %p_0_i2_cast, %sum_2
  %tmp_27 = call i28 @_ssdm_op_PartSelect.i28.i32.i32.i32(i32 %sum_3, i32 4, i32 31)
  %icmp = icmp sgt i28 %tmp_27, 0
  store i32 %VbeatFallDelay_new_1, i32* @VbeatFallDelay, align 4
  store i32 %VbeatDelay_new_1, i32* @VbeatDelay, align 4
  %last_sample_is_A_load = load i1* @last_sample_is_A, align 1
  %tmp_13 = icmp sgt i32 %VbeatDelay_new_1, %VbeatFallDelay_new_1
  %or_cond2 = and i1 %icmp, %tmp_13
  br i1 %or_cond2, label %5, label %._crit_edge15

; <label>:5                                       ; preds = %._crit_edge13_ifconv
  br i1 %last_sample_is_A_load, label %._crit_edge17_ifconv, label %6

; <label>:6                                       ; preds = %5
  store i1 true, i1* @last_sample_is_A, align 1
  br label %._crit_edge17_ifconv

._crit_edge15:                                    ; preds = %._crit_edge13_ifconv
  br i1 %last_sample_is_A_load, label %7, label %._crit_edge17_ifconv

; <label>:7                                       ; preds = %._crit_edge15
  store i1 false, i1* @last_sample_is_A, align 1
  br label %._crit_edge17_ifconv

._crit_edge17_ifconv:                             ; preds = %7, %._crit_edge15, %6, %5
  %AbeatDelay_new = phi i32 [ 0, %6 ], [ %tmp_4, %5 ], [ %tmp_4, %._crit_edge15 ], [ %tmp_4, %7 ]
  %tmp_14 = phi i1 [ true, %6 ], [ %last_sample_is_A_load, %5 ], [ %last_sample_is_A_load, %._crit_edge15 ], [ false, %7 ]
  %tmp_15 = icmp ne i32 %VbeatDelay_new_1, 0
  %tmp_16 = xor i1 %last_sample_is_V_loc_2, true
  %or_cond = or i1 %tmp_15, %tmp_16
  store i32 %AbeatDelay_new, i32* @AbeatDelay, align 4
  %tmp_17 = icmp ne i32 %AbeatDelay_new, 0
  %tmp_18 = xor i1 %tmp_14, true
  %or_cond4 = or i1 %tmp_17, %tmp_18
  %storemerge = select i1 %or_cond4, i6 0, i6 -31
  %storemerge1 = select i1 %or_cond, i6 %storemerge, i6 -10
  %storemerge1_cast1 = sext i6 %storemerge1 to i7
  %storemerge1_cast = zext i7 %storemerge1_cast1 to i16
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %out_r, i16 %storemerge1_cast) nounwind
  %tmp_19 = icmp sgt i32 %AbeatDelay_new, 1000
  %tmp_20 = icmp sgt i32 %tmp_7, 30
  %or_cond8 = and i1 %tmp_19, %tmp_20
  %tmp_21 = icmp sgt i32 %VbeatDelay_new_1, %AbeatDelay_new
  %tmp_22 = icmp sgt i32 %AbeatDelay_new, 900
  %tmp_23 = icmp sgt i32 %tmp_8, 11
  %tmp1 = and i1 %tmp_22, %tmp_23
  %or_cond1 = and i1 %tmp1, %tmp_21
  %p_s = select i1 %or_cond1, i6 -10, i6 -31
  %tmp_24 = or i1 %or_cond1, %or_cond8
  %stim_new_1 = select i1 %tmp_24, i6 %p_s, i6 0
  %stim_new_1_cast1 = sext i6 %stim_new_1 to i7
  %stim_new_1_cast = zext i7 %stim_new_1_cast1 to i16
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %stim, i16 %stim_new_1_cast) nounwind
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i16 @_ssdm_op_Read.ap_auto.i16(i16) {
entry:
  ret i16 %0
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i16 @_ssdm_op_Read.ap_auto.i16P(i16*) {
entry:
  %empty = load i16* %0
  ret i16 %empty
}

define weak void @_ssdm_op_Write.ap_auto.i16P(i16*, i16) {
entry:
  store i16 %1, i16* %0
  ret void
}

define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1
  %empty_6 = and i32 %0, %empty
  %empty_7 = icmp ne i32 %empty_6, 0
  ret i1 %empty_7
}

define weak i28 @_ssdm_op_PartSelect.i28.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_8 = trunc i32 %empty to i28
  ret i28 %empty_8
}

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
