; ModuleID = '/home/greg/multisite_test_detection_algorithms/xilnx_design/SingleSiteDetection/solution1/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.CircularBuffer.2 = type { i32, [11 x i32], i32, i32 }
%struct.CircularBuffer.0.3 = type { i32, [30 x i32], i32, i32 }
%struct.CircularBuffer.1.4 = type { i32, [20 x i32], i32, i32 }

@recentVBools = internal global %struct.CircularBuffer.2 zeroinitializer, align 4 ; [#uses=8 type=%struct.CircularBuffer.2*]
@recentABools = internal global %struct.CircularBuffer.0.3 zeroinitializer, align 4 ; [#uses=8 type=%struct.CircularBuffer.0.3*]
@recentdatapoints = internal global %struct.CircularBuffer.1.4 zeroinitializer, align 4 ; [#uses=10 type=%struct.CircularBuffer.1.4*]
@AstimDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=4 type=i32*]
@VstimDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=4 type=i32*]
@vthresh = internal unnamed_addr global i32 161, align 4 ; [#uses=2 type=i32*]
@athresh = internal unnamed_addr global i32 72, align 4 ; [#uses=2 type=i32*]
@aflip = internal unnamed_addr global i32 1, align 4 ; [#uses=2 type=i32*]
@vflip = internal unnamed_addr global i32 -1, align 4 ; [#uses=2 type=i32*]
@AbeatDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=6 type=i32*]
@VbeatDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=6 type=i32*]
@VbeatFallDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=4 type=i32*]
@last_sample_is_V = internal unnamed_addr global i32 0, align 4 ; [#uses=5 type=i32*]
@last_sample_is_A = internal unnamed_addr global i32 0, align 4 ; [#uses=4 type=i32*]
@llvm.global_ctors = appending global [0 x { i32, void ()* }] zeroinitializer ; [#uses=0 type=[0 x { i32, void ()* }]*]
@str = internal constant [15 x i8] c"singleDecision\00" ; [#uses=1 type=[15 x i8]*]

; [#uses=0]
define void @singleDecision(i16 signext %A_stim_reset, i16 signext %V_stim_reset, i16 signext %set_thresh, i32 %v_thresh, i32 %a_thresh, i32 %a_flip, i32 %v_flip, i16* %datapoint, i16* %out, i16* %stim) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecTopModule([15 x i8]* @str) nounwind
  call void @llvm.dbg.value(metadata !{i16 %A_stim_reset}, i64 0, metadata !116), !dbg !117 ; [debug line = 22:27] [debug variable = A_stim_reset]
  call void @llvm.dbg.value(metadata !{i16 %V_stim_reset}, i64 0, metadata !118), !dbg !119 ; [debug line = 22:47] [debug variable = V_stim_reset]
  call void @llvm.dbg.value(metadata !{i16 %set_thresh}, i64 0, metadata !120), !dbg !121 ; [debug line = 22:67] [debug variable = set_thresh]
  call void @llvm.dbg.value(metadata !{i32 %v_thresh}, i64 0, metadata !122), !dbg !123 ; [debug line = 22:83] [debug variable = v_thresh]
  call void @llvm.dbg.value(metadata !{i32 %a_thresh}, i64 0, metadata !124), !dbg !125 ; [debug line = 22:97] [debug variable = a_thresh]
  call void @llvm.dbg.value(metadata !{i32 %a_flip}, i64 0, metadata !126), !dbg !127 ; [debug line = 22:111] [debug variable = a_flip]
  call void @llvm.dbg.value(metadata !{i32 %v_flip}, i64 0, metadata !128), !dbg !129 ; [debug line = 22:123] [debug variable = v_flip]
  call void @llvm.dbg.value(metadata !{i16* %datapoint}, i64 0, metadata !130), !dbg !131 ; [debug line = 22:139] [debug variable = datapoint]
  call void @llvm.dbg.value(metadata !{i16* %out}, i64 0, metadata !132), !dbg !133 ; [debug line = 22:158] [debug variable = out]
  call void @llvm.dbg.value(metadata !{i16* %stim}, i64 0, metadata !134), !dbg !135 ; [debug line = 22:171] [debug variable = stim]
  %tmp = icmp eq i16 %A_stim_reset, 0, !dbg !136  ; [#uses=1 type=i1] [debug line = 24:2]
  br i1 %tmp, label %._crit_edge, label %1, !dbg !136 ; [debug line = 24:2]

; <label>:1                                       ; preds = %0
  store i32 0, i32* @AstimDelay, align 4, !dbg !138 ; [debug line = 25:3]
  br label %._crit_edge, !dbg !138                ; [debug line = 25:3]

._crit_edge:                                      ; preds = %1, %0
  %tmp.1 = icmp eq i16 %V_stim_reset, 0, !dbg !139 ; [#uses=1 type=i1] [debug line = 27:2]
  br i1 %tmp.1, label %._crit_edge11, label %2, !dbg !139 ; [debug line = 27:2]

; <label>:2                                       ; preds = %._crit_edge
  store i32 0, i32* @VstimDelay, align 4, !dbg !140 ; [debug line = 28:3]
  br label %._crit_edge11, !dbg !140              ; [debug line = 28:3]

._crit_edge11:                                    ; preds = %2, %._crit_edge
  %tmp.2 = icmp eq i16 %set_thresh, 0, !dbg !141  ; [#uses=1 type=i1] [debug line = 30:2]
  br i1 %tmp.2, label %._crit_edge12, label %3, !dbg !141 ; [debug line = 30:2]

; <label>:3                                       ; preds = %._crit_edge11
  store i32 %v_thresh, i32* @vthresh, align 4, !dbg !142 ; [debug line = 32:6]
  store i32 %a_thresh, i32* @athresh, align 4, !dbg !144 ; [debug line = 33:6]
  store i32 %a_flip, i32* @aflip, align 4, !dbg !145 ; [debug line = 34:6]
  store i32 %v_flip, i32* @vflip, align 4, !dbg !146 ; [debug line = 35:6]
  br label %._crit_edge12, !dbg !147              ; [debug line = 36:2]

._crit_edge12:                                    ; preds = %3, %._crit_edge11
  %datapoint.load = load i16* %datapoint, align 2, !dbg !148 ; [#uses=1 type=i16] [debug line = 38:2]
  %tmp.3 = sext i16 %datapoint.load to i32, !dbg !148 ; [#uses=1 type=i32] [debug line = 38:2]
  call fastcc void @"CircularBuffer<int, 20>::push"(%struct.CircularBuffer.1.4* @recentdatapoints, i32 %tmp.3), !dbg !148 ; [debug line = 38:2]
  %AbeatDelay.load = load i32* @AbeatDelay, align 4, !dbg !149 ; [#uses=1 type=i32] [debug line = 40:2]
  %tmp.4 = add nsw i32 %AbeatDelay.load, 1, !dbg !149 ; [#uses=1 type=i32] [debug line = 40:2]
  store i32 %tmp.4, i32* @AbeatDelay, align 4, !dbg !149 ; [debug line = 40:2]
  %VbeatDelay.load = load i32* @VbeatDelay, align 4, !dbg !150 ; [#uses=1 type=i32] [debug line = 41:2]
  %tmp.5 = add nsw i32 %VbeatDelay.load, 1, !dbg !150 ; [#uses=1 type=i32] [debug line = 41:2]
  store i32 %tmp.5, i32* @VbeatDelay, align 4, !dbg !150 ; [debug line = 41:2]
  %VbeatFallDelay.load = load i32* @VbeatFallDelay, align 4, !dbg !151 ; [#uses=1 type=i32] [debug line = 42:2]
  %tmp.6 = add nsw i32 %VbeatFallDelay.load, 1, !dbg !151 ; [#uses=1 type=i32] [debug line = 42:2]
  store i32 %tmp.6, i32* @VbeatFallDelay, align 4, !dbg !151 ; [debug line = 42:2]
  %AstimDelay.load = load i32* @AstimDelay, align 4, !dbg !152 ; [#uses=1 type=i32] [debug line = 43:2]
  %tmp.7 = add nsw i32 %AstimDelay.load, 1, !dbg !152 ; [#uses=1 type=i32] [debug line = 43:2]
  store i32 %tmp.7, i32* @AstimDelay, align 4, !dbg !152 ; [debug line = 43:2]
  %VstimDelay.load = load i32* @VstimDelay, align 4, !dbg !153 ; [#uses=1 type=i32] [debug line = 44:2]
  %tmp.8 = add nsw i32 %VstimDelay.load, 1, !dbg !153 ; [#uses=1 type=i32] [debug line = 44:2]
  store i32 %tmp.8, i32* @VstimDelay, align 4, !dbg !153 ; [debug line = 44:2]
  %datapointV = call fastcc i32 @"CircularBuffer<int, 20>::head"(%struct.CircularBuffer.1.4* @recentdatapoints), !dbg !154 ; [#uses=1 type=i32] [debug line = 47:19]
  call void @llvm.dbg.value(metadata !{i32 %datapointV}, i64 0, metadata !155), !dbg !154 ; [debug line = 47:19] [debug variable = datapointV]
  %sum = load i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 0), align 4, !dbg !156 ; [#uses=2 type=i32] [debug line = 49:28]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %sum) nounwind
  call void @llvm.dbg.value(metadata !{i32 %sum}, i64 0, metadata !157), !dbg !156 ; [debug line = 49:28] [debug variable = sum]
  %vflip.load = load i32* @vflip, align 4, !dbg !158 ; [#uses=1 type=i32] [debug line = 50:2]
  %tmp.9 = mul nsw i32 %vflip.load, %datapointV, !dbg !158 ; [#uses=1 type=i32] [debug line = 50:2]
  %vthresh.load = load i32* @vthresh, align 4, !dbg !158 ; [#uses=1 type=i32] [debug line = 50:2]
  %tmp.10 = icmp sgt i32 %tmp.9, %vthresh.load, !dbg !158 ; [#uses=1 type=i1] [debug line = 50:2]
  %tmp.11 = zext i1 %tmp.10 to i32, !dbg !158     ; [#uses=1 type=i32] [debug line = 50:2]
  call fastcc void @"CircularBuffer<int, 11>::push"(%struct.CircularBuffer.2* @recentVBools, i32 %tmp.11), !dbg !158 ; [debug line = 50:2]
  %tmp.12 = call fastcc i32 @"CircularBuffer<int, 11>::head"(%struct.CircularBuffer.2* @recentVBools), !dbg !159 ; [#uses=1 type=i32] [debug line = 51:9]
  %sum.1 = add nsw i32 %tmp.12, %sum, !dbg !159   ; [#uses=1 type=i32] [debug line = 51:9]
  call void @llvm.dbg.value(metadata !{i32 %sum.1}, i64 0, metadata !157), !dbg !159 ; [debug line = 51:9] [debug variable = sum]
  %tmp.14 = icmp sgt i32 %sum.1, 5, !dbg !160     ; [#uses=1 type=i1] [debug line = 53:2]
  br i1 %tmp.14, label %4, label %6, !dbg !160    ; [debug line = 53:2]

; <label>:4                                       ; preds = %._crit_edge12
  %last_sample_is_V.load = load i32* @last_sample_is_V, align 4, !dbg !161 ; [#uses=1 type=i32] [debug line = 55:3]
  %tmp.15 = icmp eq i32 %last_sample_is_V.load, 0, !dbg !161 ; [#uses=1 type=i1] [debug line = 55:3]
  br i1 %tmp.15, label %5, label %._crit_edge13, !dbg !161 ; [debug line = 55:3]

; <label>:5                                       ; preds = %4
  store i32 0, i32* @VbeatDelay, align 4, !dbg !163 ; [debug line = 57:4]
  store i32 1, i32* @last_sample_is_V, align 4, !dbg !165 ; [debug line = 58:4]
  br label %._crit_edge13, !dbg !166              ; [debug line = 59:3]

._crit_edge13:                                    ; preds = %5, %4
  br label %8, !dbg !167                          ; [debug line = 60:2]

; <label>:6                                       ; preds = %._crit_edge12
  %last_sample_is_V.load.1 = load i32* @last_sample_is_V, align 4, !dbg !168 ; [#uses=1 type=i32] [debug line = 61:7]
  %tmp.16 = icmp eq i32 %last_sample_is_V.load.1, 0, !dbg !168 ; [#uses=1 type=i1] [debug line = 61:7]
  br i1 %tmp.16, label %._crit_edge14, label %7, !dbg !168 ; [debug line = 61:7]

; <label>:7                                       ; preds = %6
  store i32 0, i32* @VbeatFallDelay, align 4, !dbg !169 ; [debug line = 63:3]
  store i32 0, i32* @last_sample_is_V, align 4, !dbg !171 ; [debug line = 64:3]
  br label %._crit_edge14, !dbg !172              ; [debug line = 65:2]

._crit_edge14:                                    ; preds = %7, %6
  br label %8

; <label>:8                                       ; preds = %._crit_edge14, %._crit_edge13
  %datapointA = call fastcc i32 @"CircularBuffer<int, 20>::ftail"(%struct.CircularBuffer.1.4* @recentdatapoints), !dbg !173 ; [#uses=1 type=i32] [debug line = 68:19]
  call void @llvm.dbg.value(metadata !{i32 %datapointA}, i64 0, metadata !174), !dbg !173 ; [debug line = 68:19] [debug variable = datapointA]
  %sum.2 = load i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 0), align 4, !dbg !175 ; [#uses=2 type=i32] [debug line = 69:2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %sum.2) nounwind
  call void @llvm.dbg.value(metadata !{i32 %sum.2}, i64 0, metadata !157), !dbg !175 ; [debug line = 69:2] [debug variable = sum]
  %aflip.load = load i32* @aflip, align 4, !dbg !176 ; [#uses=1 type=i32] [debug line = 71:2]
  %tmp.17 = mul nsw i32 %aflip.load, %datapointA, !dbg !176 ; [#uses=1 type=i32] [debug line = 71:2]
  %athresh.load = load i32* @athresh, align 4, !dbg !176 ; [#uses=1 type=i32] [debug line = 71:2]
  %tmp.18 = icmp sgt i32 %tmp.17, %athresh.load, !dbg !176 ; [#uses=1 type=i1] [debug line = 71:2]
  %tmp.19 = zext i1 %tmp.18 to i32, !dbg !176     ; [#uses=1 type=i32] [debug line = 71:2]
  call fastcc void @"CircularBuffer<int, 30>::push"(%struct.CircularBuffer.0.3* @recentABools, i32 %tmp.19), !dbg !176 ; [debug line = 71:2]
  %tmp.20 = call fastcc i32 @"CircularBuffer<int, 30>::head"(%struct.CircularBuffer.0.3* @recentABools), !dbg !177 ; [#uses=1 type=i32] [debug line = 72:9]
  %sum.3 = add nsw i32 %tmp.20, %sum.2, !dbg !177 ; [#uses=1 type=i32] [debug line = 72:9]
  call void @llvm.dbg.value(metadata !{i32 %sum.3}, i64 0, metadata !157), !dbg !177 ; [debug line = 72:9] [debug variable = sum]
  %tmp.22 = icmp sgt i32 %sum.3, 15, !dbg !178    ; [#uses=1 type=i1] [debug line = 74:2]
  br i1 %tmp.22, label %9, label %._crit_edge15, !dbg !178 ; [debug line = 74:2]

; <label>:9                                       ; preds = %8
  %VbeatDelay.load.1 = load i32* @VbeatDelay, align 4, !dbg !178 ; [#uses=1 type=i32] [debug line = 74:2]
  %VbeatFallDelay.load.1 = load i32* @VbeatFallDelay, align 4, !dbg !178 ; [#uses=1 type=i32] [debug line = 74:2]
  %tmp.23 = icmp sgt i32 %VbeatDelay.load.1, %VbeatFallDelay.load.1, !dbg !178 ; [#uses=1 type=i1] [debug line = 74:2]
  br i1 %tmp.23, label %10, label %._crit_edge15, !dbg !178 ; [debug line = 74:2]

; <label>:10                                      ; preds = %9
  %last_sample_is_A.load.1 = load i32* @last_sample_is_A, align 4, !dbg !179 ; [#uses=2 type=i32] [debug line = 76:3]
  %tmp.25 = icmp eq i32 %last_sample_is_A.load.1, 0, !dbg !179 ; [#uses=1 type=i1] [debug line = 76:3]
  br i1 %tmp.25, label %11, label %._crit_edge17, !dbg !179 ; [debug line = 76:3]

; <label>:11                                      ; preds = %10
  store i32 0, i32* @AbeatDelay, align 4, !dbg !181 ; [debug line = 78:4]
  store i32 1, i32* @last_sample_is_A, align 4, !dbg !183 ; [debug line = 79:4]
  br label %._crit_edge17, !dbg !184              ; [debug line = 80:3]

._crit_edge15:                                    ; preds = %9, %8
  %last_sample_is_A.load = load i32* @last_sample_is_A, align 4, !dbg !185 ; [#uses=2 type=i32] [debug line = 83:7]
  %tmp.24 = icmp eq i32 %last_sample_is_A.load, 0, !dbg !185 ; [#uses=1 type=i1] [debug line = 83:7]
  br i1 %tmp.24, label %._crit_edge17, label %12, !dbg !185 ; [debug line = 83:7]

; <label>:12                                      ; preds = %._crit_edge15
  store i32 0, i32* @last_sample_is_A, align 4, !dbg !186 ; [debug line = 84:3]
  br label %._crit_edge17, !dbg !186              ; [debug line = 84:3]

._crit_edge17:                                    ; preds = %12, %._crit_edge15, %11, %10
  %tmp.26 = phi i32 [ 1, %11 ], [ %last_sample_is_A.load.1, %10 ], [ 0, %12 ], [ %last_sample_is_A.load, %._crit_edge15 ] ; [#uses=1 type=i32]
  %VbeatDelay.load.2 = load i32* @VbeatDelay, align 4, !dbg !187 ; [#uses=1 type=i32] [debug line = 86:2]
  %tmp.27 = icmp ne i32 %VbeatDelay.load.2, 0, !dbg !187 ; [#uses=1 type=i1] [debug line = 86:2]
  %last_sample_is_V.load.2 = load i32* @last_sample_is_V, align 4, !dbg !187 ; [#uses=1 type=i32] [debug line = 86:2]
  %tmp.28 = icmp eq i32 %last_sample_is_V.load.2, 0, !dbg !187 ; [#uses=1 type=i1] [debug line = 86:2]
  %or.cond = or i1 %tmp.27, %tmp.28, !dbg !187    ; [#uses=1 type=i1] [debug line = 86:2]
  br i1 %or.cond, label %13, label %._crit_edge19, !dbg !187 ; [debug line = 86:2]

; <label>:13                                      ; preds = %._crit_edge17
  %AbeatDelay.load.1 = load i32* @AbeatDelay, align 4, !dbg !188 ; [#uses=1 type=i32] [debug line = 90:10]
  %tmp.29 = icmp ne i32 %AbeatDelay.load.1, 0, !dbg !188 ; [#uses=1 type=i1] [debug line = 90:10]
  %tmp.30 = icmp eq i32 %tmp.26, 0, !dbg !188     ; [#uses=1 type=i1] [debug line = 90:10]
  %or.cond4 = or i1 %tmp.29, %tmp.30, !dbg !188   ; [#uses=1 type=i1] [debug line = 90:10]
  %storemerge = select i1 %or.cond4, i16 0, i16 97, !dbg !188 ; [#uses=1 type=i16] [debug line = 90:10]
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %13, %._crit_edge17
  %storemerge1 = phi i16 [ %storemerge, %13 ], [ 118, %._crit_edge17 ] ; [#uses=1 type=i16]
  store i16 %storemerge1, i16* %out, align 2, !dbg !189 ; [debug line = 88:3]
  store i16 0, i16* %stim, align 2, !dbg !191     ; [debug line = 97:2]
  %AbeatDelay.load.2 = load i32* @AbeatDelay, align 4, !dbg !192 ; [#uses=1 type=i32] [debug line = 98:2]
  %tmp.31 = icmp sgt i32 %AbeatDelay.load.2, 1000, !dbg !192 ; [#uses=1 type=i1] [debug line = 98:2]
  %AstimDelay.load.1 = load i32* @AstimDelay, align 4, !dbg !192 ; [#uses=1 type=i32] [debug line = 98:2]
  %tmp.32 = icmp sgt i32 %AstimDelay.load.1, 30, !dbg !192 ; [#uses=1 type=i1] [debug line = 98:2]
  %or.cond8 = and i1 %tmp.31, %tmp.32, !dbg !192  ; [#uses=1 type=i1] [debug line = 98:2]
  br i1 %or.cond8, label %14, label %._crit_edge20, !dbg !192 ; [debug line = 98:2]

; <label>:14                                      ; preds = %._crit_edge19
  store i16 97, i16* %stim, align 2, !dbg !193    ; [debug line = 105:3]
  br label %._crit_edge20, !dbg !195              ; [debug line = 106:2]

._crit_edge20:                                    ; preds = %14, %._crit_edge19
  %VbeatDelay.load.3 = load i32* @VbeatDelay, align 4, !dbg !196 ; [#uses=1 type=i32] [debug line = 108:2]
  %AbeatDelay.load.3 = load i32* @AbeatDelay, align 4, !dbg !196 ; [#uses=2 type=i32] [debug line = 108:2]
  %tmp.33 = icmp sgt i32 %VbeatDelay.load.3, %AbeatDelay.load.3, !dbg !196 ; [#uses=1 type=i1] [debug line = 108:2]
  %tmp.34 = icmp sgt i32 %AbeatDelay.load.3, 900, !dbg !196 ; [#uses=1 type=i1] [debug line = 108:2]
  %or.cond6 = and i1 %tmp.33, %tmp.34, !dbg !196  ; [#uses=1 type=i1] [debug line = 108:2]
  %VstimDelay.load.1 = load i32* @VstimDelay, align 4, !dbg !196 ; [#uses=1 type=i32] [debug line = 108:2]
  %tmp.35 = icmp sgt i32 %VstimDelay.load.1, 11, !dbg !196 ; [#uses=1 type=i1] [debug line = 108:2]
  %or.cond1 = and i1 %or.cond6, %tmp.35, !dbg !196 ; [#uses=1 type=i1] [debug line = 108:2]
  br i1 %or.cond1, label %15, label %._crit_edge21, !dbg !196 ; [debug line = 108:2]

; <label>:15                                      ; preds = %._crit_edge20
  store i16 118, i16* %stim, align 2, !dbg !197   ; [debug line = 115:3]
  br label %._crit_edge21, !dbg !199              ; [debug line = 116:3]

._crit_edge21:                                    ; preds = %15, %._crit_edge20
  ret void, !dbg !200                             ; [debug line = 117:1]
}

; [#uses=1]
define internal fastcc void @"CircularBuffer<int, 20>::push"(%struct.CircularBuffer.1.4* %this, i32 %val) nounwind uwtable align 2 {
  call void @llvm.dbg.value(metadata !{i32 %val}, i64 0, metadata !201), !dbg !202 ; [debug line = 12:14] [debug variable = val]
  %recentdatapoints.load = load i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 3), align 4, !dbg !203 ; [#uses=2 type=i32] [debug line = 13:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load) nounwind
  %tmp = icmp eq i32 %recentdatapoints.load, 20, !dbg !203 ; [#uses=1 type=i1] [debug line = 13:3]
  br i1 %tmp, label %1, label %._crit_edge, !dbg !203 ; [debug line = 13:3]

; <label>:1                                       ; preds = %0
  %recentdatapoints.load.1 = load i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 2), align 4, !dbg !205 ; [#uses=2 type=i32] [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load.1) nounwind
  %tmp.36 = sext i32 %recentdatapoints.load.1 to i64, !dbg !205 ; [#uses=1 type=i64] [debug line = 14:4]
  %recentdatapoints.addr = getelementptr inbounds %struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 1, i64 %tmp.36, !dbg !205 ; [#uses=1 type=i32*] [debug line = 14:4]
  %recentdatapoints.load.2 = load i32* %recentdatapoints.addr, align 4, !dbg !205 ; [#uses=2 type=i32] [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load.2) nounwind
  %recentdatapoints.load.3 = load i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 0), align 4, !dbg !205 ; [#uses=2 type=i32] [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load.3) nounwind
  %tmp.37 = sub nsw i32 %recentdatapoints.load.3, %recentdatapoints.load.2, !dbg !205 ; [#uses=1 type=i32] [debug line = 14:4]
  store i32 %tmp.37, i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 0), align 4, !dbg !205 ; [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 20) nounwind
  store i32 19, i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 3), align 4, !dbg !207 ; [debug line = 15:4]
  br label %._crit_edge, !dbg !208                ; [debug line = 16:3]

._crit_edge:                                      ; preds = %1, %0
  %recentdatapoints.load.4 = load i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 2), align 4, !dbg !209 ; [#uses=2 type=i32] [debug line = 17:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load.4) nounwind
  %tmp.38 = sext i32 %recentdatapoints.load.4 to i64, !dbg !209 ; [#uses=1 type=i64] [debug line = 17:3]
  %recentdatapoints.addr.1 = getelementptr inbounds %struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 1, i64 %tmp.38, !dbg !209 ; [#uses=1 type=i32*] [debug line = 17:3]
  store i32 %val, i32* %recentdatapoints.addr.1, align 4, !dbg !209 ; [debug line = 17:3]
  %recentdatapoints.load.5 = load i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 0), align 4, !dbg !210 ; [#uses=2 type=i32] [debug line = 18:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load.5) nounwind
  %tmp.39 = add nsw i32 %recentdatapoints.load.5, %val, !dbg !210 ; [#uses=1 type=i32] [debug line = 18:3]
  store i32 %tmp.39, i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 0), align 4, !dbg !210 ; [debug line = 18:3]
  %recentdatapoints.load.6 = load i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 3), align 4, !dbg !211 ; [#uses=2 type=i32] [debug line = 19:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load.6) nounwind
  %tmp.40 = add nsw i32 %recentdatapoints.load.6, 1, !dbg !211 ; [#uses=1 type=i32] [debug line = 19:3]
  store i32 %tmp.40, i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 3), align 4, !dbg !211 ; [debug line = 19:3]
  %recentdatapoints.load.7 = load i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 2), align 4, !dbg !212 ; [#uses=2 type=i32] [debug line = 20:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load.7) nounwind
  %tmp.41 = add nsw i32 %recentdatapoints.load.7, 1, !dbg !212 ; [#uses=3 type=i32] [debug line = 20:3]
  store i32 %tmp.41, i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 2), align 4, !dbg !212 ; [debug line = 20:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmp.41) nounwind
  %tmp.42 = icmp eq i32 %tmp.41, 20, !dbg !213    ; [#uses=1 type=i1] [debug line = 21:3]
  br i1 %tmp.42, label %2, label %._crit_edge1, !dbg !213 ; [debug line = 21:3]

; <label>:2                                       ; preds = %._crit_edge
  store i32 0, i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 2), align 4, !dbg !214 ; [debug line = 22:4]
  br label %._crit_edge1, !dbg !214               ; [debug line = 22:4]

._crit_edge1:                                     ; preds = %2, %._crit_edge
  ret void, !dbg !215                             ; [debug line = 23:2]
}

; [#uses=1]
define internal fastcc i32 @"CircularBuffer<int, 20>::head"(%struct.CircularBuffer.1.4* %this) nounwind uwtable align 2 {
  %recentdatapoints.load = load i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 3), align 4, !dbg !216 ; [#uses=2 type=i32] [debug line = 26:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load) nounwind
  %tmp = icmp eq i32 %recentdatapoints.load, 0, !dbg !216 ; [#uses=1 type=i1] [debug line = 26:3]
  br i1 %tmp, label %._crit_edge, label %1, !dbg !216 ; [debug line = 26:3]

; <label>:1                                       ; preds = %0
  %recentdatapoints.load.8 = load i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 2), align 4, !dbg !218 ; [#uses=3 type=i32] [debug line = 28:21]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load.8) nounwind
  %i = add nsw i32 %recentdatapoints.load.8, -1, !dbg !218 ; [#uses=2 type=i32] [debug line = 28:21]
  call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !219), !dbg !218 ; [debug line = 28:21] [debug variable = i]
  %tmp.44 = icmp slt i32 %i, 0, !dbg !220         ; [#uses=1 type=i1] [debug line = 29:3]
  %i.1 = add nsw i32 %recentdatapoints.load.8, 19, !dbg !221 ; [#uses=1 type=i32] [debug line = 30:4]
  call void @llvm.dbg.value(metadata !{i32 %i.1}, i64 0, metadata !219), !dbg !221 ; [debug line = 30:4] [debug variable = i]
  %. = select i1 %tmp.44, i32 %i.1, i32 %i, !dbg !220 ; [#uses=1 type=i32] [debug line = 29:3]
  %tmp.46 = sext i32 %. to i64, !dbg !222         ; [#uses=1 type=i64] [debug line = 31:3]
  %recentdatapoints.addr = getelementptr inbounds %struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 1, i64 %tmp.46, !dbg !222 ; [#uses=1 type=i32*] [debug line = 31:3]
  %recentdatapoints.load.9 = load i32* %recentdatapoints.addr, align 4, !dbg !222 ; [#uses=2 type=i32] [debug line = 31:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load.9) nounwind
  br label %._crit_edge, !dbg !222                ; [debug line = 31:3]

._crit_edge:                                      ; preds = %1, %0
  %.0 = phi i32 [ %recentdatapoints.load.9, %1 ], [ 0, %0 ] ; [#uses=1 type=i32]
  ret i32 %.0, !dbg !223                          ; [debug line = 32:2]
}

; [#uses=1]
define internal fastcc void @"CircularBuffer<int, 11>::push"(%struct.CircularBuffer.2* %this, i32 %val) nounwind uwtable align 2 {
  call void @llvm.dbg.value(metadata !{i32 %val}, i64 0, metadata !224), !dbg !225 ; [debug line = 12:14] [debug variable = val]
  %recentVBools.load = load i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 3), align 4, !dbg !226 ; [#uses=2 type=i32] [debug line = 13:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentVBools.load) nounwind
  %tmp = icmp eq i32 %recentVBools.load, 11, !dbg !226 ; [#uses=1 type=i1] [debug line = 13:3]
  br i1 %tmp, label %1, label %._crit_edge, !dbg !226 ; [debug line = 13:3]

; <label>:1                                       ; preds = %0
  %recentVBools.load.1 = load i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 2), align 4, !dbg !228 ; [#uses=2 type=i32] [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentVBools.load.1) nounwind
  %tmp.47 = sext i32 %recentVBools.load.1 to i64, !dbg !228 ; [#uses=1 type=i64] [debug line = 14:4]
  %recentVBools.addr = getelementptr inbounds %struct.CircularBuffer.2* @recentVBools, i64 0, i32 1, i64 %tmp.47, !dbg !228 ; [#uses=1 type=i32*] [debug line = 14:4]
  %recentVBools.load.2 = load i32* %recentVBools.addr, align 4, !dbg !228 ; [#uses=2 type=i32] [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentVBools.load.2) nounwind
  %recentVBools.load.3 = load i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 0), align 4, !dbg !228 ; [#uses=2 type=i32] [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentVBools.load.3) nounwind
  %tmp.48 = sub nsw i32 %recentVBools.load.3, %recentVBools.load.2, !dbg !228 ; [#uses=1 type=i32] [debug line = 14:4]
  store i32 %tmp.48, i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 0), align 4, !dbg !228 ; [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 11) nounwind
  store i32 10, i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 3), align 4, !dbg !230 ; [debug line = 15:4]
  br label %._crit_edge, !dbg !231                ; [debug line = 16:3]

._crit_edge:                                      ; preds = %1, %0
  %recentVBools.load.4 = load i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 2), align 4, !dbg !232 ; [#uses=2 type=i32] [debug line = 17:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentVBools.load.4) nounwind
  %tmp.49 = sext i32 %recentVBools.load.4 to i64, !dbg !232 ; [#uses=1 type=i64] [debug line = 17:3]
  %recentVBools.addr.1 = getelementptr inbounds %struct.CircularBuffer.2* @recentVBools, i64 0, i32 1, i64 %tmp.49, !dbg !232 ; [#uses=1 type=i32*] [debug line = 17:3]
  store i32 %val, i32* %recentVBools.addr.1, align 4, !dbg !232 ; [debug line = 17:3]
  %recentVBools.load.5 = load i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 0), align 4, !dbg !233 ; [#uses=2 type=i32] [debug line = 18:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentVBools.load.5) nounwind
  %tmp.50 = add nsw i32 %recentVBools.load.5, %val, !dbg !233 ; [#uses=1 type=i32] [debug line = 18:3]
  store i32 %tmp.50, i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 0), align 4, !dbg !233 ; [debug line = 18:3]
  %recentVBools.load.6 = load i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 3), align 4, !dbg !234 ; [#uses=2 type=i32] [debug line = 19:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentVBools.load.6) nounwind
  %tmp.51 = add nsw i32 %recentVBools.load.6, 1, !dbg !234 ; [#uses=1 type=i32] [debug line = 19:3]
  store i32 %tmp.51, i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 3), align 4, !dbg !234 ; [debug line = 19:3]
  %recentVBools.load.7 = load i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 2), align 4, !dbg !235 ; [#uses=2 type=i32] [debug line = 20:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentVBools.load.7) nounwind
  %tmp.52 = add nsw i32 %recentVBools.load.7, 1, !dbg !235 ; [#uses=3 type=i32] [debug line = 20:3]
  store i32 %tmp.52, i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 2), align 4, !dbg !235 ; [debug line = 20:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmp.52) nounwind
  %tmp.53 = icmp eq i32 %tmp.52, 11, !dbg !236    ; [#uses=1 type=i1] [debug line = 21:3]
  br i1 %tmp.53, label %2, label %._crit_edge1, !dbg !236 ; [debug line = 21:3]

; <label>:2                                       ; preds = %._crit_edge
  store i32 0, i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 2), align 4, !dbg !237 ; [debug line = 22:4]
  br label %._crit_edge1, !dbg !237               ; [debug line = 22:4]

._crit_edge1:                                     ; preds = %2, %._crit_edge
  ret void, !dbg !238                             ; [debug line = 23:2]
}

; [#uses=1]
define internal fastcc i32 @"CircularBuffer<int, 11>::head"(%struct.CircularBuffer.2* %this) nounwind uwtable align 2 {
  %recentVBools.load = load i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 3), align 4, !dbg !239 ; [#uses=2 type=i32] [debug line = 26:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentVBools.load) nounwind
  %tmp = icmp eq i32 %recentVBools.load, 0, !dbg !239 ; [#uses=1 type=i1] [debug line = 26:3]
  br i1 %tmp, label %._crit_edge, label %1, !dbg !239 ; [debug line = 26:3]

; <label>:1                                       ; preds = %0
  %recentVBools.load.8 = load i32* getelementptr inbounds (%struct.CircularBuffer.2* @recentVBools, i64 0, i32 2), align 4, !dbg !241 ; [#uses=3 type=i32] [debug line = 28:21]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentVBools.load.8) nounwind
  %i = add nsw i32 %recentVBools.load.8, -1, !dbg !241 ; [#uses=2 type=i32] [debug line = 28:21]
  call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !242), !dbg !241 ; [debug line = 28:21] [debug variable = i]
  %tmp.55 = icmp slt i32 %i, 0, !dbg !243         ; [#uses=1 type=i1] [debug line = 29:3]
  %i.2 = add nsw i32 %recentVBools.load.8, 10, !dbg !244 ; [#uses=1 type=i32] [debug line = 30:4]
  call void @llvm.dbg.value(metadata !{i32 %i.2}, i64 0, metadata !242), !dbg !244 ; [debug line = 30:4] [debug variable = i]
  %. = select i1 %tmp.55, i32 %i.2, i32 %i, !dbg !243 ; [#uses=1 type=i32] [debug line = 29:3]
  %tmp.57 = sext i32 %. to i64, !dbg !245         ; [#uses=1 type=i64] [debug line = 31:3]
  %recentVBools.addr = getelementptr inbounds %struct.CircularBuffer.2* @recentVBools, i64 0, i32 1, i64 %tmp.57, !dbg !245 ; [#uses=1 type=i32*] [debug line = 31:3]
  %recentVBools.load.9 = load i32* %recentVBools.addr, align 4, !dbg !245 ; [#uses=2 type=i32] [debug line = 31:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentVBools.load.9) nounwind
  br label %._crit_edge, !dbg !245                ; [debug line = 31:3]

._crit_edge:                                      ; preds = %1, %0
  %.0 = phi i32 [ %recentVBools.load.9, %1 ], [ 0, %0 ] ; [#uses=1 type=i32]
  ret i32 %.0, !dbg !246                          ; [debug line = 32:2]
}

; [#uses=1]
define internal fastcc i32 @"CircularBuffer<int, 20>::ftail"(%struct.CircularBuffer.1.4* %this) nounwind uwtable align 2 {
  %recentdatapoints.load = load i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 3), align 4, !dbg !247 ; [#uses=2 type=i32] [debug line = 46:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load) nounwind
  %tmp = icmp eq i32 %recentdatapoints.load, 20, !dbg !247 ; [#uses=1 type=i1] [debug line = 46:3]
  br i1 %tmp, label %1, label %._crit_edge, !dbg !247 ; [debug line = 46:3]

; <label>:1                                       ; preds = %0
  %recentdatapoints.load.10 = load i32* getelementptr inbounds (%struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 2), align 4, !dbg !249 ; [#uses=2 type=i32] [debug line = 47:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load.10) nounwind
  %tmp.58 = sext i32 %recentdatapoints.load.10 to i64, !dbg !249 ; [#uses=1 type=i64] [debug line = 47:4]
  %recentdatapoints.addr = getelementptr inbounds %struct.CircularBuffer.1.4* @recentdatapoints, i64 0, i32 1, i64 %tmp.58, !dbg !249 ; [#uses=1 type=i32*] [debug line = 47:4]
  %recentdatapoints.load.11 = load i32* %recentdatapoints.addr, align 4, !dbg !249 ; [#uses=2 type=i32] [debug line = 47:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentdatapoints.load.11) nounwind
  br label %._crit_edge, !dbg !249                ; [debug line = 47:4]

._crit_edge:                                      ; preds = %1, %0
  %.0 = phi i32 [ %recentdatapoints.load.11, %1 ], [ 0, %0 ] ; [#uses=1 type=i32]
  ret i32 %.0, !dbg !250                          ; [debug line = 50:2]
}

; [#uses=1]
define internal fastcc void @"CircularBuffer<int, 30>::push"(%struct.CircularBuffer.0.3* %this, i32 %val) nounwind uwtable align 2 {
  call void @llvm.dbg.value(metadata !{i32 %val}, i64 0, metadata !251), !dbg !252 ; [debug line = 12:14] [debug variable = val]
  %recentABools.load = load i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 3), align 4, !dbg !253 ; [#uses=2 type=i32] [debug line = 13:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentABools.load) nounwind
  %tmp = icmp eq i32 %recentABools.load, 30, !dbg !253 ; [#uses=1 type=i1] [debug line = 13:3]
  br i1 %tmp, label %1, label %._crit_edge, !dbg !253 ; [debug line = 13:3]

; <label>:1                                       ; preds = %0
  %recentABools.load.1 = load i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 2), align 4, !dbg !255 ; [#uses=2 type=i32] [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentABools.load.1) nounwind
  %tmp.59 = sext i32 %recentABools.load.1 to i64, !dbg !255 ; [#uses=1 type=i64] [debug line = 14:4]
  %recentABools.addr = getelementptr inbounds %struct.CircularBuffer.0.3* @recentABools, i64 0, i32 1, i64 %tmp.59, !dbg !255 ; [#uses=1 type=i32*] [debug line = 14:4]
  %recentABools.load.2 = load i32* %recentABools.addr, align 4, !dbg !255 ; [#uses=2 type=i32] [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentABools.load.2) nounwind
  %recentABools.load.3 = load i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 0), align 4, !dbg !255 ; [#uses=2 type=i32] [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentABools.load.3) nounwind
  %tmp.60 = sub nsw i32 %recentABools.load.3, %recentABools.load.2, !dbg !255 ; [#uses=1 type=i32] [debug line = 14:4]
  store i32 %tmp.60, i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 0), align 4, !dbg !255 ; [debug line = 14:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 30) nounwind
  store i32 29, i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 3), align 4, !dbg !257 ; [debug line = 15:4]
  br label %._crit_edge, !dbg !258                ; [debug line = 16:3]

._crit_edge:                                      ; preds = %1, %0
  %recentABools.load.4 = load i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 2), align 4, !dbg !259 ; [#uses=2 type=i32] [debug line = 17:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentABools.load.4) nounwind
  %tmp.61 = sext i32 %recentABools.load.4 to i64, !dbg !259 ; [#uses=1 type=i64] [debug line = 17:3]
  %recentABools.addr.1 = getelementptr inbounds %struct.CircularBuffer.0.3* @recentABools, i64 0, i32 1, i64 %tmp.61, !dbg !259 ; [#uses=1 type=i32*] [debug line = 17:3]
  store i32 %val, i32* %recentABools.addr.1, align 4, !dbg !259 ; [debug line = 17:3]
  %recentABools.load.5 = load i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 0), align 4, !dbg !260 ; [#uses=2 type=i32] [debug line = 18:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentABools.load.5) nounwind
  %tmp.62 = add nsw i32 %recentABools.load.5, %val, !dbg !260 ; [#uses=1 type=i32] [debug line = 18:3]
  store i32 %tmp.62, i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 0), align 4, !dbg !260 ; [debug line = 18:3]
  %recentABools.load.6 = load i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 3), align 4, !dbg !261 ; [#uses=2 type=i32] [debug line = 19:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentABools.load.6) nounwind
  %tmp.63 = add nsw i32 %recentABools.load.6, 1, !dbg !261 ; [#uses=1 type=i32] [debug line = 19:3]
  store i32 %tmp.63, i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 3), align 4, !dbg !261 ; [debug line = 19:3]
  %recentABools.load.7 = load i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 2), align 4, !dbg !262 ; [#uses=2 type=i32] [debug line = 20:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentABools.load.7) nounwind
  %tmp.64 = add nsw i32 %recentABools.load.7, 1, !dbg !262 ; [#uses=3 type=i32] [debug line = 20:3]
  store i32 %tmp.64, i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 2), align 4, !dbg !262 ; [debug line = 20:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmp.64) nounwind
  %tmp.65 = icmp eq i32 %tmp.64, 30, !dbg !263    ; [#uses=1 type=i1] [debug line = 21:3]
  br i1 %tmp.65, label %2, label %._crit_edge1, !dbg !263 ; [debug line = 21:3]

; <label>:2                                       ; preds = %._crit_edge
  store i32 0, i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 2), align 4, !dbg !264 ; [debug line = 22:4]
  br label %._crit_edge1, !dbg !264               ; [debug line = 22:4]

._crit_edge1:                                     ; preds = %2, %._crit_edge
  ret void, !dbg !265                             ; [debug line = 23:2]
}

; [#uses=1]
define internal fastcc i32 @"CircularBuffer<int, 30>::head"(%struct.CircularBuffer.0.3* %this) nounwind uwtable align 2 {
  %recentABools.load = load i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 3), align 4, !dbg !266 ; [#uses=2 type=i32] [debug line = 26:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentABools.load) nounwind
  %tmp = icmp eq i32 %recentABools.load, 0, !dbg !266 ; [#uses=1 type=i1] [debug line = 26:3]
  br i1 %tmp, label %._crit_edge, label %1, !dbg !266 ; [debug line = 26:3]

; <label>:1                                       ; preds = %0
  %recentABools.load.8 = load i32* getelementptr inbounds (%struct.CircularBuffer.0.3* @recentABools, i64 0, i32 2), align 4, !dbg !268 ; [#uses=3 type=i32] [debug line = 28:21]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentABools.load.8) nounwind
  %i = add nsw i32 %recentABools.load.8, -1, !dbg !268 ; [#uses=2 type=i32] [debug line = 28:21]
  call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !269), !dbg !268 ; [debug line = 28:21] [debug variable = i]
  %tmp.67 = icmp slt i32 %i, 0, !dbg !270         ; [#uses=1 type=i1] [debug line = 29:3]
  %i.3 = add nsw i32 %recentABools.load.8, 29, !dbg !271 ; [#uses=1 type=i32] [debug line = 30:4]
  call void @llvm.dbg.value(metadata !{i32 %i.3}, i64 0, metadata !269), !dbg !271 ; [debug line = 30:4] [debug variable = i]
  %. = select i1 %tmp.67, i32 %i.3, i32 %i, !dbg !270 ; [#uses=1 type=i32] [debug line = 29:3]
  %tmp.69 = sext i32 %. to i64, !dbg !272         ; [#uses=1 type=i64] [debug line = 31:3]
  %recentABools.addr = getelementptr inbounds %struct.CircularBuffer.0.3* @recentABools, i64 0, i32 1, i64 %tmp.69, !dbg !272 ; [#uses=1 type=i32*] [debug line = 31:3]
  %recentABools.load.9 = load i32* %recentABools.addr, align 4, !dbg !272 ; [#uses=2 type=i32] [debug line = 31:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %recentABools.load.9) nounwind
  br label %._crit_edge, !dbg !272                ; [debug line = 31:3]

._crit_edge:                                      ; preds = %1, %0
  %.0 = phi i32 [ %recentABools.load.9, %1 ], [ 0, %0 ] ; [#uses=1 type=i32]
  ret i32 %.0, !dbg !273                          ; [debug line = 32:2]
}

; [#uses=25]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=44]
declare void @_ssdm_SpecKeepArrayLoad(...)

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=0]
declare i32 @_ssdm_op_SpecLoopBegin(...)

; [#uses=0]
declare i32 @_ssdm_op_SpecRegionBegin(...)

; [#uses=0]
declare i32 @_ssdm_op_SpecRegionEnd(...)

; [#uses=0]
declare i32 @_ssdm_op_SpecRegionEnd.restore(...)

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/greg/multisite_test_detection_algorithms/xilnx_design/SingleSiteDetection/solution1/.autopilot/db/singleChannelDecision.pragma.2.cpp", metadata !"/home/greg/multisite_test_detection_algorithms/xilnx_design", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !98} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !14, metadata !40, metadata !41, metadata !65, metadata !89, metadata !90, metadata !91, metadata !92, metadata !93, metadata !94, metadata !95, metadata !96, metadata !97}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"singleDecision", metadata !"singleDecision", metadata !"_Z14singleDecisionsssiiiiPsS_S_", metadata !6, i32 22, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i16, i16, i16, i32, i32, i32, i32, i16*, i16*, i16*)* @singleDecision, null, null, metadata !12, i32 23} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"singleChannelDecision.cpp", metadata !"/home/greg/multisite_test_detection_algorithms/xilnx_design", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !9, metadata !10, metadata !10, metadata !10, metadata !10, metadata !11, metadata !11, metadata !11}
!9 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!14 = metadata !{i32 786478, i32 0, null, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi30EE4headEv", metadata !15, i32 25, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.CircularBuffer.0.3*)* @"CircularBuffer<int, 30>::head", null, metadata !34, metadata !12, i32 25} ; [ DW_TAG_subprogram ]
!15 = metadata !{i32 786473, metadata !"./circularBuffer.h", metadata !"/home/greg/multisite_test_detection_algorithms/xilnx_design", null} ; [ DW_TAG_file_type ]
!16 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!17 = metadata !{metadata !10, metadata !18}
!18 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !19} ; [ DW_TAG_pointer_type ]
!19 = metadata !{i32 786434, null, metadata !"CircularBuffer<int, 30>", metadata !15, i32 3, i64 1056, i64 32, i32 0, i32 0, null, metadata !20, i32 0, null, metadata !37} ; [ DW_TAG_class_type ]
!20 = metadata !{metadata !21, metadata !22, metadata !26, metadata !27, metadata !28, metadata !31, metadata !34, metadata !35, metadata !36}
!21 = metadata !{i32 786445, metadata !19, metadata !"sum", metadata !15, i32 4, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ]
!22 = metadata !{i32 786445, metadata !19, metadata !"data", metadata !15, i32 5, i64 960, i64 32, i64 32, i32 0, metadata !23} ; [ DW_TAG_member ]
!23 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 960, i64 32, i32 0, i32 0, metadata !10, metadata !24, i32 0, i32 0} ; [ DW_TAG_array_type ]
!24 = metadata !{metadata !25}
!25 = metadata !{i32 786465, i64 0, i64 29}       ; [ DW_TAG_subrange_type ]
!26 = metadata !{i32 786445, metadata !19, metadata !"head_i", metadata !15, i32 6, i64 32, i64 32, i64 992, i32 0, metadata !10} ; [ DW_TAG_member ]
!27 = metadata !{i32 786445, metadata !19, metadata !"len", metadata !15, i32 7, i64 32, i64 32, i64 1024, i32 0, metadata !10} ; [ DW_TAG_member ]
!28 = metadata !{i32 786478, i32 0, metadata !19, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"", metadata !15, i32 8, metadata !29, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 8} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{null, metadata !18}
!31 = metadata !{i32 786478, i32 0, metadata !19, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi30EE4pushEi", metadata !15, i32 12, metadata !32, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 12} ; [ DW_TAG_subprogram ]
!32 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!33 = metadata !{null, metadata !18, metadata !10}
!34 = metadata !{i32 786478, i32 0, metadata !19, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi30EE4headEv", metadata !15, i32 25, metadata !16, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 25} ; [ DW_TAG_subprogram ]
!35 = metadata !{i32 786478, i32 0, metadata !19, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi30EE4tailEv", metadata !15, i32 34, metadata !16, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 34} ; [ DW_TAG_subprogram ]
!36 = metadata !{i32 786478, i32 0, metadata !19, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi30EE5ftailEv", metadata !15, i32 45, metadata !16, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 45} ; [ DW_TAG_subprogram ]
!37 = metadata !{metadata !38, metadata !39}
!38 = metadata !{i32 786479, null, metadata !"T", metadata !10, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!39 = metadata !{i32 786480, null, metadata !"maxsize", metadata !10, i64 30, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!40 = metadata !{i32 786478, i32 0, null, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi30EE4pushEi", metadata !15, i32 12, metadata !32, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.CircularBuffer.0.3*, i32)* @"CircularBuffer<int, 30>::push", null, metadata !31, metadata !12, i32 12} ; [ DW_TAG_subprogram ]
!41 = metadata !{i32 786478, i32 0, null, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi20EE5ftailEv", metadata !15, i32 45, metadata !42, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.CircularBuffer.1.4*)* @"CircularBuffer<int, 20>::ftail", null, metadata !62, metadata !12, i32 45} ; [ DW_TAG_subprogram ]
!42 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!43 = metadata !{metadata !10, metadata !44}
!44 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !45} ; [ DW_TAG_pointer_type ]
!45 = metadata !{i32 786434, null, metadata !"CircularBuffer<int, 20>", metadata !15, i32 3, i64 736, i64 32, i32 0, i32 0, null, metadata !46, i32 0, null, metadata !63} ; [ DW_TAG_class_type ]
!46 = metadata !{metadata !47, metadata !48, metadata !52, metadata !53, metadata !54, metadata !57, metadata !60, metadata !61, metadata !62}
!47 = metadata !{i32 786445, metadata !45, metadata !"sum", metadata !15, i32 4, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ]
!48 = metadata !{i32 786445, metadata !45, metadata !"data", metadata !15, i32 5, i64 640, i64 32, i64 32, i32 0, metadata !49} ; [ DW_TAG_member ]
!49 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 640, i64 32, i32 0, i32 0, metadata !10, metadata !50, i32 0, i32 0} ; [ DW_TAG_array_type ]
!50 = metadata !{metadata !51}
!51 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ]
!52 = metadata !{i32 786445, metadata !45, metadata !"head_i", metadata !15, i32 6, i64 32, i64 32, i64 672, i32 0, metadata !10} ; [ DW_TAG_member ]
!53 = metadata !{i32 786445, metadata !45, metadata !"len", metadata !15, i32 7, i64 32, i64 32, i64 704, i32 0, metadata !10} ; [ DW_TAG_member ]
!54 = metadata !{i32 786478, i32 0, metadata !45, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"", metadata !15, i32 8, metadata !55, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 8} ; [ DW_TAG_subprogram ]
!55 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !56, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!56 = metadata !{null, metadata !44}
!57 = metadata !{i32 786478, i32 0, metadata !45, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi20EE4pushEi", metadata !15, i32 12, metadata !58, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 12} ; [ DW_TAG_subprogram ]
!58 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!59 = metadata !{null, metadata !44, metadata !10}
!60 = metadata !{i32 786478, i32 0, metadata !45, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi20EE4headEv", metadata !15, i32 25, metadata !42, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 25} ; [ DW_TAG_subprogram ]
!61 = metadata !{i32 786478, i32 0, metadata !45, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi20EE4tailEv", metadata !15, i32 34, metadata !42, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 34} ; [ DW_TAG_subprogram ]
!62 = metadata !{i32 786478, i32 0, metadata !45, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi20EE5ftailEv", metadata !15, i32 45, metadata !42, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 45} ; [ DW_TAG_subprogram ]
!63 = metadata !{metadata !38, metadata !64}
!64 = metadata !{i32 786480, null, metadata !"maxsize", metadata !10, i64 20, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!65 = metadata !{i32 786478, i32 0, null, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi11EE4headEv", metadata !15, i32 25, metadata !66, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.CircularBuffer.2*)* @"CircularBuffer<int, 11>::head", null, metadata !84, metadata !12, i32 25} ; [ DW_TAG_subprogram ]
!66 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !67, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!67 = metadata !{metadata !10, metadata !68}
!68 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !69} ; [ DW_TAG_pointer_type ]
!69 = metadata !{i32 786434, null, metadata !"CircularBuffer<int, 11>", metadata !15, i32 3, i64 448, i64 32, i32 0, i32 0, null, metadata !70, i32 0, null, metadata !87} ; [ DW_TAG_class_type ]
!70 = metadata !{metadata !71, metadata !72, metadata !76, metadata !77, metadata !78, metadata !81, metadata !84, metadata !85, metadata !86}
!71 = metadata !{i32 786445, metadata !69, metadata !"sum", metadata !15, i32 4, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ]
!72 = metadata !{i32 786445, metadata !69, metadata !"data", metadata !15, i32 5, i64 352, i64 32, i64 32, i32 0, metadata !73} ; [ DW_TAG_member ]
!73 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 352, i64 32, i32 0, i32 0, metadata !10, metadata !74, i32 0, i32 0} ; [ DW_TAG_array_type ]
!74 = metadata !{metadata !75}
!75 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ]
!76 = metadata !{i32 786445, metadata !69, metadata !"head_i", metadata !15, i32 6, i64 32, i64 32, i64 384, i32 0, metadata !10} ; [ DW_TAG_member ]
!77 = metadata !{i32 786445, metadata !69, metadata !"len", metadata !15, i32 7, i64 32, i64 32, i64 416, i32 0, metadata !10} ; [ DW_TAG_member ]
!78 = metadata !{i32 786478, i32 0, metadata !69, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"", metadata !15, i32 8, metadata !79, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 8} ; [ DW_TAG_subprogram ]
!79 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!80 = metadata !{null, metadata !68}
!81 = metadata !{i32 786478, i32 0, metadata !69, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi11EE4pushEi", metadata !15, i32 12, metadata !82, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 12} ; [ DW_TAG_subprogram ]
!82 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !83, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!83 = metadata !{null, metadata !68, metadata !10}
!84 = metadata !{i32 786478, i32 0, metadata !69, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi11EE4headEv", metadata !15, i32 25, metadata !66, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 25} ; [ DW_TAG_subprogram ]
!85 = metadata !{i32 786478, i32 0, metadata !69, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi11EE4tailEv", metadata !15, i32 34, metadata !66, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 34} ; [ DW_TAG_subprogram ]
!86 = metadata !{i32 786478, i32 0, metadata !69, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi11EE5ftailEv", metadata !15, i32 45, metadata !66, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 45} ; [ DW_TAG_subprogram ]
!87 = metadata !{metadata !38, metadata !88}
!88 = metadata !{i32 786480, null, metadata !"maxsize", metadata !10, i64 11, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!89 = metadata !{i32 786478, i32 0, null, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi11EE4pushEi", metadata !15, i32 12, metadata !82, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.CircularBuffer.2*, i32)* @"CircularBuffer<int, 11>::push", null, metadata !81, metadata !12, i32 12} ; [ DW_TAG_subprogram ]
!90 = metadata !{i32 786478, i32 0, null, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi20EE4headEv", metadata !15, i32 25, metadata !42, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.CircularBuffer.1.4*)* @"CircularBuffer<int, 20>::head", null, metadata !60, metadata !12, i32 25} ; [ DW_TAG_subprogram ]
!91 = metadata !{i32 786478, i32 0, null, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi20EE4pushEi", metadata !15, i32 12, metadata !58, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.CircularBuffer.1.4*, i32)* @"CircularBuffer<int, 20>::push", null, metadata !57, metadata !12, i32 12} ; [ DW_TAG_subprogram ]
!92 = metadata !{i32 786478, i32 0, null, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"_ZN14CircularBufferIiLi20EEC1Ev", metadata !15, i32 8, metadata !55, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !54, metadata !12, i32 9} ; [ DW_TAG_subprogram ]
!93 = metadata !{i32 786478, i32 0, null, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"_ZN14CircularBufferIiLi20EEC2Ev", metadata !15, i32 8, metadata !55, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !54, metadata !12, i32 9} ; [ DW_TAG_subprogram ]
!94 = metadata !{i32 786478, i32 0, null, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"_ZN14CircularBufferIiLi30EEC1Ev", metadata !15, i32 8, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !28, metadata !12, i32 9} ; [ DW_TAG_subprogram ]
!95 = metadata !{i32 786478, i32 0, null, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"_ZN14CircularBufferIiLi30EEC2Ev", metadata !15, i32 8, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !28, metadata !12, i32 9} ; [ DW_TAG_subprogram ]
!96 = metadata !{i32 786478, i32 0, null, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"_ZN14CircularBufferIiLi11EEC1Ev", metadata !15, i32 8, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !78, metadata !12, i32 9} ; [ DW_TAG_subprogram ]
!97 = metadata !{i32 786478, i32 0, null, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"_ZN14CircularBufferIiLi11EEC2Ev", metadata !15, i32 8, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !78, metadata !12, i32 9} ; [ DW_TAG_subprogram ]
!98 = metadata !{metadata !99}
!99 = metadata !{metadata !100, metadata !101, metadata !102, metadata !103, metadata !104, metadata !105, metadata !106, metadata !107, metadata !108, metadata !109, metadata !110, metadata !111, metadata !112, metadata !113, metadata !114, metadata !115}
!100 = metadata !{i32 786484, i32 0, null, metadata !"recentVBools", metadata !"recentVBools", metadata !"_ZL12recentVBools", metadata !6, i32 16, metadata !69, i32 1, i32 1, %struct.CircularBuffer.2* @recentVBools} ; [ DW_TAG_variable ]
!101 = metadata !{i32 786484, i32 0, null, metadata !"recentABools", metadata !"recentABools", metadata !"_ZL12recentABools", metadata !6, i32 17, metadata !19, i32 1, i32 1, %struct.CircularBuffer.0.3* @recentABools} ; [ DW_TAG_variable ]
!102 = metadata !{i32 786484, i32 0, null, metadata !"recentdatapoints", metadata !"recentdatapoints", metadata !"_ZL16recentdatapoints", metadata !6, i32 20, metadata !45, i32 1, i32 1, %struct.CircularBuffer.1.4* @recentdatapoints} ; [ DW_TAG_variable ]
!103 = metadata !{i32 786484, i32 0, null, metadata !"VCaptureThresh", metadata !"VCaptureThresh", metadata !"_ZL14VCaptureThresh", metadata !6, i32 15, metadata !10, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!104 = metadata !{i32 786484, i32 0, null, metadata !"ACaptureThresh", metadata !"ACaptureThresh", metadata !"_ZL14ACaptureThresh", metadata !6, i32 14, metadata !10, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!105 = metadata !{i32 786484, i32 0, null, metadata !"last_sample_is_A", metadata !"last_sample_is_A", metadata !"_ZL16last_sample_is_A", metadata !6, i32 19, metadata !10, i32 1, i32 1, i32* @last_sample_is_A} ; [ DW_TAG_variable ]
!106 = metadata !{i32 786484, i32 0, null, metadata !"last_sample_is_V", metadata !"last_sample_is_V", metadata !"_ZL16last_sample_is_V", metadata !6, i32 18, metadata !10, i32 1, i32 1, i32* @last_sample_is_V} ; [ DW_TAG_variable ]
!107 = metadata !{i32 786484, i32 0, null, metadata !"VbeatFallDelay", metadata !"VbeatFallDelay", metadata !"_ZL14VbeatFallDelay", metadata !6, i32 11, metadata !10, i32 1, i32 1, i32* @VbeatFallDelay} ; [ DW_TAG_variable ]
!108 = metadata !{i32 786484, i32 0, null, metadata !"VbeatDelay", metadata !"VbeatDelay", metadata !"_ZL10VbeatDelay", metadata !6, i32 10, metadata !10, i32 1, i32 1, i32* @VbeatDelay} ; [ DW_TAG_variable ]
!109 = metadata !{i32 786484, i32 0, null, metadata !"AbeatDelay", metadata !"AbeatDelay", metadata !"_ZL10AbeatDelay", metadata !6, i32 9, metadata !10, i32 1, i32 1, i32* @AbeatDelay} ; [ DW_TAG_variable ]
!110 = metadata !{i32 786484, i32 0, null, metadata !"vflip", metadata !"vflip", metadata !"_ZL5vflip", metadata !6, i32 7, metadata !10, i32 1, i32 1, i32* @vflip} ; [ DW_TAG_variable ]
!111 = metadata !{i32 786484, i32 0, null, metadata !"aflip", metadata !"aflip", metadata !"_ZL5aflip", metadata !6, i32 8, metadata !10, i32 1, i32 1, i32* @aflip} ; [ DW_TAG_variable ]
!112 = metadata !{i32 786484, i32 0, null, metadata !"athresh", metadata !"athresh", metadata !"_ZL7athresh", metadata !6, i32 6, metadata !10, i32 1, i32 1, i32* @athresh} ; [ DW_TAG_variable ]
!113 = metadata !{i32 786484, i32 0, null, metadata !"vthresh", metadata !"vthresh", metadata !"_ZL7vthresh", metadata !6, i32 5, metadata !10, i32 1, i32 1, i32* @vthresh} ; [ DW_TAG_variable ]
!114 = metadata !{i32 786484, i32 0, null, metadata !"VstimDelay", metadata !"VstimDelay", metadata !"_ZL10VstimDelay", metadata !6, i32 13, metadata !10, i32 1, i32 1, i32* @VstimDelay} ; [ DW_TAG_variable ]
!115 = metadata !{i32 786484, i32 0, null, metadata !"AstimDelay", metadata !"AstimDelay", metadata !"_ZL10AstimDelay", metadata !6, i32 12, metadata !10, i32 1, i32 1, i32* @AstimDelay} ; [ DW_TAG_variable ]
!116 = metadata !{i32 786689, metadata !5, metadata !"A_stim_reset", metadata !6, i32 16777238, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!117 = metadata !{i32 22, i32 27, metadata !5, null}
!118 = metadata !{i32 786689, metadata !5, metadata !"V_stim_reset", metadata !6, i32 33554454, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!119 = metadata !{i32 22, i32 47, metadata !5, null}
!120 = metadata !{i32 786689, metadata !5, metadata !"set_thresh", metadata !6, i32 50331670, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!121 = metadata !{i32 22, i32 67, metadata !5, null}
!122 = metadata !{i32 786689, metadata !5, metadata !"v_thresh", metadata !6, i32 67108886, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!123 = metadata !{i32 22, i32 83, metadata !5, null}
!124 = metadata !{i32 786689, metadata !5, metadata !"a_thresh", metadata !6, i32 83886102, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!125 = metadata !{i32 22, i32 97, metadata !5, null}
!126 = metadata !{i32 786689, metadata !5, metadata !"a_flip", metadata !6, i32 100663318, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!127 = metadata !{i32 22, i32 111, metadata !5, null}
!128 = metadata !{i32 786689, metadata !5, metadata !"v_flip", metadata !6, i32 117440534, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!129 = metadata !{i32 22, i32 123, metadata !5, null}
!130 = metadata !{i32 786689, metadata !5, metadata !"datapoint", metadata !6, i32 134217750, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!131 = metadata !{i32 22, i32 139, metadata !5, null}
!132 = metadata !{i32 786689, metadata !5, metadata !"out", metadata !6, i32 150994966, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!133 = metadata !{i32 22, i32 158, metadata !5, null}
!134 = metadata !{i32 786689, metadata !5, metadata !"stim", metadata !6, i32 167772182, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!135 = metadata !{i32 22, i32 171, metadata !5, null}
!136 = metadata !{i32 24, i32 2, metadata !137, null}
!137 = metadata !{i32 786443, metadata !5, i32 23, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!138 = metadata !{i32 25, i32 3, metadata !137, null}
!139 = metadata !{i32 27, i32 2, metadata !137, null}
!140 = metadata !{i32 28, i32 3, metadata !137, null}
!141 = metadata !{i32 30, i32 2, metadata !137, null}
!142 = metadata !{i32 32, i32 6, metadata !143, null}
!143 = metadata !{i32 786443, metadata !137, i32 31, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!144 = metadata !{i32 33, i32 6, metadata !143, null}
!145 = metadata !{i32 34, i32 6, metadata !143, null}
!146 = metadata !{i32 35, i32 6, metadata !143, null}
!147 = metadata !{i32 36, i32 2, metadata !143, null}
!148 = metadata !{i32 38, i32 2, metadata !137, null}
!149 = metadata !{i32 40, i32 2, metadata !137, null}
!150 = metadata !{i32 41, i32 2, metadata !137, null}
!151 = metadata !{i32 42, i32 2, metadata !137, null}
!152 = metadata !{i32 43, i32 2, metadata !137, null}
!153 = metadata !{i32 44, i32 2, metadata !137, null}
!154 = metadata !{i32 47, i32 19, metadata !137, null}
!155 = metadata !{i32 786688, metadata !137, metadata !"datapointV", metadata !6, i32 47, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!156 = metadata !{i32 49, i32 28, metadata !137, null}
!157 = metadata !{i32 786688, metadata !137, metadata !"sum", metadata !6, i32 49, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!158 = metadata !{i32 50, i32 2, metadata !137, null}
!159 = metadata !{i32 51, i32 9, metadata !137, null}
!160 = metadata !{i32 53, i32 2, metadata !137, null}
!161 = metadata !{i32 55, i32 3, metadata !162, null}
!162 = metadata !{i32 786443, metadata !137, i32 54, i32 2, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!163 = metadata !{i32 57, i32 4, metadata !164, null}
!164 = metadata !{i32 786443, metadata !162, i32 56, i32 3, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!165 = metadata !{i32 58, i32 4, metadata !164, null}
!166 = metadata !{i32 59, i32 3, metadata !164, null}
!167 = metadata !{i32 60, i32 2, metadata !162, null}
!168 = metadata !{i32 61, i32 7, metadata !137, null}
!169 = metadata !{i32 63, i32 3, metadata !170, null}
!170 = metadata !{i32 786443, metadata !137, i32 62, i32 2, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!171 = metadata !{i32 64, i32 3, metadata !170, null}
!172 = metadata !{i32 65, i32 2, metadata !170, null}
!173 = metadata !{i32 68, i32 19, metadata !137, null}
!174 = metadata !{i32 786688, metadata !137, metadata !"datapointA", metadata !6, i32 68, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!175 = metadata !{i32 69, i32 2, metadata !137, null}
!176 = metadata !{i32 71, i32 2, metadata !137, null}
!177 = metadata !{i32 72, i32 9, metadata !137, null}
!178 = metadata !{i32 74, i32 2, metadata !137, null}
!179 = metadata !{i32 76, i32 3, metadata !180, null}
!180 = metadata !{i32 786443, metadata !137, i32 75, i32 2, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!181 = metadata !{i32 78, i32 4, metadata !182, null}
!182 = metadata !{i32 786443, metadata !180, i32 77, i32 3, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!183 = metadata !{i32 79, i32 4, metadata !182, null}
!184 = metadata !{i32 80, i32 3, metadata !182, null}
!185 = metadata !{i32 83, i32 7, metadata !137, null}
!186 = metadata !{i32 84, i32 3, metadata !137, null}
!187 = metadata !{i32 86, i32 2, metadata !137, null}
!188 = metadata !{i32 90, i32 10, metadata !137, null}
!189 = metadata !{i32 88, i32 3, metadata !190, null}
!190 = metadata !{i32 786443, metadata !137, i32 87, i32 2, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!191 = metadata !{i32 97, i32 2, metadata !137, null}
!192 = metadata !{i32 98, i32 2, metadata !137, null}
!193 = metadata !{i32 105, i32 3, metadata !194, null}
!194 = metadata !{i32 786443, metadata !137, i32 99, i32 2, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!195 = metadata !{i32 106, i32 2, metadata !194, null}
!196 = metadata !{i32 108, i32 2, metadata !137, null}
!197 = metadata !{i32 115, i32 3, metadata !198, null}
!198 = metadata !{i32 786443, metadata !137, i32 109, i32 2, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!199 = metadata !{i32 116, i32 3, metadata !198, null}
!200 = metadata !{i32 117, i32 1, metadata !137, null}
!201 = metadata !{i32 786689, metadata !91, metadata !"val", metadata !15, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!202 = metadata !{i32 12, i32 14, metadata !91, null}
!203 = metadata !{i32 13, i32 3, metadata !204, null}
!204 = metadata !{i32 786443, metadata !91, i32 12, i32 19, metadata !15, i32 21} ; [ DW_TAG_lexical_block ]
!205 = metadata !{i32 14, i32 4, metadata !206, null}
!206 = metadata !{i32 786443, metadata !204, i32 13, i32 23, metadata !15, i32 22} ; [ DW_TAG_lexical_block ]
!207 = metadata !{i32 15, i32 4, metadata !206, null}
!208 = metadata !{i32 16, i32 3, metadata !206, null}
!209 = metadata !{i32 17, i32 3, metadata !204, null}
!210 = metadata !{i32 18, i32 3, metadata !204, null}
!211 = metadata !{i32 19, i32 3, metadata !204, null}
!212 = metadata !{i32 20, i32 3, metadata !204, null}
!213 = metadata !{i32 21, i32 3, metadata !204, null}
!214 = metadata !{i32 22, i32 4, metadata !204, null}
!215 = metadata !{i32 23, i32 2, metadata !204, null}
!216 = metadata !{i32 26, i32 3, metadata !217, null}
!217 = metadata !{i32 786443, metadata !90, i32 25, i32 11, metadata !15, i32 20} ; [ DW_TAG_lexical_block ]
!218 = metadata !{i32 28, i32 21, metadata !217, null}
!219 = metadata !{i32 786688, metadata !217, metadata !"i", metadata !15, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!220 = metadata !{i32 29, i32 3, metadata !217, null}
!221 = metadata !{i32 30, i32 4, metadata !217, null}
!222 = metadata !{i32 31, i32 3, metadata !217, null}
!223 = metadata !{i32 32, i32 2, metadata !217, null}
!224 = metadata !{i32 786689, metadata !89, metadata !"val", metadata !15, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!225 = metadata !{i32 12, i32 14, metadata !89, null}
!226 = metadata !{i32 13, i32 3, metadata !227, null}
!227 = metadata !{i32 786443, metadata !89, i32 12, i32 19, metadata !15, i32 18} ; [ DW_TAG_lexical_block ]
!228 = metadata !{i32 14, i32 4, metadata !229, null}
!229 = metadata !{i32 786443, metadata !227, i32 13, i32 23, metadata !15, i32 19} ; [ DW_TAG_lexical_block ]
!230 = metadata !{i32 15, i32 4, metadata !229, null}
!231 = metadata !{i32 16, i32 3, metadata !229, null}
!232 = metadata !{i32 17, i32 3, metadata !227, null}
!233 = metadata !{i32 18, i32 3, metadata !227, null}
!234 = metadata !{i32 19, i32 3, metadata !227, null}
!235 = metadata !{i32 20, i32 3, metadata !227, null}
!236 = metadata !{i32 21, i32 3, metadata !227, null}
!237 = metadata !{i32 22, i32 4, metadata !227, null}
!238 = metadata !{i32 23, i32 2, metadata !227, null}
!239 = metadata !{i32 26, i32 3, metadata !240, null}
!240 = metadata !{i32 786443, metadata !65, i32 25, i32 11, metadata !15, i32 17} ; [ DW_TAG_lexical_block ]
!241 = metadata !{i32 28, i32 21, metadata !240, null}
!242 = metadata !{i32 786688, metadata !240, metadata !"i", metadata !15, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!243 = metadata !{i32 29, i32 3, metadata !240, null}
!244 = metadata !{i32 30, i32 4, metadata !240, null}
!245 = metadata !{i32 31, i32 3, metadata !240, null}
!246 = metadata !{i32 32, i32 2, metadata !240, null}
!247 = metadata !{i32 46, i32 3, metadata !248, null}
!248 = metadata !{i32 786443, metadata !41, i32 45, i32 12, metadata !15, i32 16} ; [ DW_TAG_lexical_block ]
!249 = metadata !{i32 47, i32 4, metadata !248, null}
!250 = metadata !{i32 50, i32 2, metadata !248, null}
!251 = metadata !{i32 786689, metadata !40, metadata !"val", metadata !15, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!252 = metadata !{i32 12, i32 14, metadata !40, null}
!253 = metadata !{i32 13, i32 3, metadata !254, null}
!254 = metadata !{i32 786443, metadata !40, i32 12, i32 19, metadata !15, i32 14} ; [ DW_TAG_lexical_block ]
!255 = metadata !{i32 14, i32 4, metadata !256, null}
!256 = metadata !{i32 786443, metadata !254, i32 13, i32 23, metadata !15, i32 15} ; [ DW_TAG_lexical_block ]
!257 = metadata !{i32 15, i32 4, metadata !256, null}
!258 = metadata !{i32 16, i32 3, metadata !256, null}
!259 = metadata !{i32 17, i32 3, metadata !254, null}
!260 = metadata !{i32 18, i32 3, metadata !254, null}
!261 = metadata !{i32 19, i32 3, metadata !254, null}
!262 = metadata !{i32 20, i32 3, metadata !254, null}
!263 = metadata !{i32 21, i32 3, metadata !254, null}
!264 = metadata !{i32 22, i32 4, metadata !254, null}
!265 = metadata !{i32 23, i32 2, metadata !254, null}
!266 = metadata !{i32 26, i32 3, metadata !267, null}
!267 = metadata !{i32 786443, metadata !14, i32 25, i32 11, metadata !15, i32 13} ; [ DW_TAG_lexical_block ]
!268 = metadata !{i32 28, i32 21, metadata !267, null}
!269 = metadata !{i32 786688, metadata !267, metadata !"i", metadata !15, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!270 = metadata !{i32 29, i32 3, metadata !267, null}
!271 = metadata !{i32 30, i32 4, metadata !267, null}
!272 = metadata !{i32 31, i32 3, metadata !267, null}
!273 = metadata !{i32 32, i32 2, metadata !267, null}
