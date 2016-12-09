; ModuleID = '/home/greg/multisite_test_detection_algorithms/xilnx_design/SingleSiteDetection/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@recentVBools.sum = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentVBools.head_i = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentVBools.len = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentABools.sum = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentABools.head_i = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentABools.len = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentdatapoints.sum = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentdatapoints.head_i = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@recentdatapoints.len = internal unnamed_addr global i32 0 ; [#uses=2 type=i32*]
@AstimDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@VstimDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@vthresh = internal unnamed_addr global i32 161, align 4 ; [#uses=2 type=i32*]
@athresh = internal unnamed_addr global i32 72, align 4 ; [#uses=2 type=i32*]
@aflip = internal unnamed_addr global i32 1, align 4 ; [#uses=2 type=i32*]
@vflip = internal unnamed_addr global i32 -1, align 4 ; [#uses=2 type=i32*]
@AbeatDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@VbeatDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@VbeatFallDelay = internal unnamed_addr global i32 0, align 4 ; [#uses=2 type=i32*]
@llvm.global_ctors.0 = appending global [0 x i32] zeroinitializer ; [#uses=0 type=[0 x i32]*]
@llvm.global_ctors.1 = appending global [0 x void ()*] zeroinitializer ; [#uses=0 type=[0 x void ()*]*]
@str = internal constant [15 x i8] c"singleDecision\00" ; [#uses=1 type=[15 x i8]*]
@recentdatapoints.data = internal unnamed_addr global [20 x i16] zeroinitializer ; [#uses=3 type=[20 x i16]*]
@recentVBools.data = internal unnamed_addr global [11 x i1] zeroinitializer ; [#uses=2 type=[11 x i1]*]
@last_sample_is_V = internal unnamed_addr global i1 false ; [#uses=3 type=i1*]
@recentABools.data = internal unnamed_addr global [30 x i1] zeroinitializer ; [#uses=2 type=[30 x i1]*]
@last_sample_is_A = internal unnamed_addr global i1 false ; [#uses=3 type=i1*]

; [#uses=0]
define void @singleDecision(i16 signext %A_stim_reset, i16 signext %V_stim_reset, i16 signext %set_thresh, i32 %v_thresh, i32 %a_thresh, i32 %a_flip, i32 %v_flip, i16* %datapoint, i16* %out, i16* %stim) nounwind uwtable {
._crit_edge:
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %A_stim_reset) nounwind, !map !137
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %V_stim_reset) nounwind, !map !143
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %set_thresh) nounwind, !map !147
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %v_thresh) nounwind, !map !151
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %a_thresh) nounwind, !map !155
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %a_flip) nounwind, !map !159
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %v_flip) nounwind, !map !163
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %datapoint) nounwind, !map !167
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %out) nounwind, !map !173
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %stim) nounwind, !map !177
  call void (...)* @_ssdm_op_SpecTopModule([15 x i8]* @str) nounwind
  call void @llvm.dbg.value(metadata !{i16 %A_stim_reset}, i64 0, metadata !181), !dbg !187 ; [debug line = 22:27] [debug variable = A_stim_reset]
  call void @llvm.dbg.value(metadata !{i16 %V_stim_reset}, i64 0, metadata !188), !dbg !189 ; [debug line = 22:47] [debug variable = V_stim_reset]
  call void @llvm.dbg.value(metadata !{i16 %set_thresh}, i64 0, metadata !190), !dbg !191 ; [debug line = 22:67] [debug variable = set_thresh]
  call void @llvm.dbg.value(metadata !{i32 %v_thresh}, i64 0, metadata !192), !dbg !193 ; [debug line = 22:83] [debug variable = v_thresh]
  call void @llvm.dbg.value(metadata !{i32 %a_thresh}, i64 0, metadata !194), !dbg !195 ; [debug line = 22:97] [debug variable = a_thresh]
  call void @llvm.dbg.value(metadata !{i32 %a_flip}, i64 0, metadata !196), !dbg !197 ; [debug line = 22:111] [debug variable = a_flip]
  call void @llvm.dbg.value(metadata !{i32 %v_flip}, i64 0, metadata !198), !dbg !199 ; [debug line = 22:123] [debug variable = v_flip]
  call void @llvm.dbg.value(metadata !{i16* %datapoint}, i64 0, metadata !200), !dbg !201 ; [debug line = 22:139] [debug variable = datapoint]
  call void @llvm.dbg.value(metadata !{i16* %out}, i64 0, metadata !202), !dbg !203 ; [debug line = 22:158] [debug variable = out]
  call void @llvm.dbg.value(metadata !{i16* %stim}, i64 0, metadata !204), !dbg !205 ; [debug line = 22:171] [debug variable = stim]
  %tmp = icmp eq i16 %A_stim_reset, 0, !dbg !206  ; [#uses=1 type=i1] [debug line = 24:2]
  %AstimDelay.load = load i32* @AstimDelay, align 4, !dbg !208 ; [#uses=1 type=i32] [debug line = 43:2]
  %tmp.1 = icmp eq i16 %V_stim_reset, 0, !dbg !209 ; [#uses=1 type=i1] [debug line = 27:2]
  %VstimDelay.load = load i32* @VstimDelay, align 4, !dbg !210 ; [#uses=1 type=i32] [debug line = 44:2]
  %tmp.2 = icmp eq i16 %set_thresh, 0, !dbg !211  ; [#uses=1 type=i1] [debug line = 30:2]
  br i1 %tmp.2, label %._crit_edge12_ifconv, label %0, !dbg !211 ; [debug line = 30:2]

; <label>:0                                       ; preds = %._crit_edge
  store i32 %v_thresh, i32* @vthresh, align 4, !dbg !212 ; [debug line = 32:6]
  store i32 %a_thresh, i32* @athresh, align 4, !dbg !214 ; [debug line = 33:6]
  store i32 %a_flip, i32* @aflip, align 4, !dbg !215 ; [debug line = 34:6]
  store i32 %v_flip, i32* @vflip, align 4, !dbg !216 ; [debug line = 35:6]
  br label %._crit_edge12_ifconv, !dbg !217       ; [debug line = 36:2]

._crit_edge12_ifconv:                             ; preds = %0, %._crit_edge
  %datapoint.load = load i16* %datapoint, align 2, !dbg !218 ; [#uses=2 type=i16] [debug line = 38:2]
  %val.assign = sext i16 %datapoint.load to i32, !dbg !218 ; [#uses=1 type=i32] [debug line = 38:2]
  call void @llvm.dbg.value(metadata !{i32 %val.assign}, i64 0, metadata !219) nounwind, !dbg !221 ; [debug line = 12:14@38:2] [debug variable = val]
  %recentdatapoints.len.load = load i32* @recentdatapoints.len, align 4, !dbg !222 ; [#uses=2 type=i32] [debug line = 13:3@38:2]
  %tmp.i = icmp eq i32 %recentdatapoints.len.load, 20, !dbg !222 ; [#uses=2 type=i1] [debug line = 13:3@38:2]
  %recentdatapoints.head_i.load = load i32* @recentdatapoints.head_i, align 4, !dbg !224 ; [#uses=2 type=i32] [debug line = 14:4@38:2]
  %recentdatapoints.sum.load = load i32* @recentdatapoints.sum, align 4, !dbg !224 ; [#uses=2 type=i32] [debug line = 14:4@38:2]
  %tmp..i = sext i32 %recentdatapoints.head_i.load to i64, !dbg !224 ; [#uses=1 type=i64] [debug line = 14:4@38:2]
  %recentdatapoints.data.addr = getelementptr [20 x i16]* @recentdatapoints.data, i64 0, i64 %tmp..i, !dbg !224 ; [#uses=2 type=i16*] [debug line = 14:4@38:2]
  %recentdatapoints.data.load = load i16* %recentdatapoints.data.addr, align 2 ; [#uses=1 type=i16]
  %extLd = sext i16 %recentdatapoints.data.load to i32 ; [#uses=1 type=i32]
  %tmp.33.i = sub nsw i32 %recentdatapoints.sum.load, %extLd, !dbg !224 ; [#uses=1 type=i32] [debug line = 14:4@38:2]
  %recentdatapoints.sum.loc.i = select i1 %tmp.i, i32 %tmp.33.i, i32 %recentdatapoints.sum.load ; [#uses=1 type=i32]
  store i16 %datapoint.load, i16* %recentdatapoints.data.addr, align 2, !dbg !226 ; [debug line = 17:3@38:2]
  %tmp.35.i = add nsw i32 %recentdatapoints.sum.loc.i, %val.assign, !dbg !227 ; [#uses=1 type=i32] [debug line = 18:3@38:2]
  %recentdatapoints.len.load.op = add i32 %recentdatapoints.len.load, 1, !dbg !228 ; [#uses=1 type=i32] [debug line = 19:3@38:2]
  %tmp.36.i = select i1 %tmp.i, i32 20, i32 %recentdatapoints.len.load.op, !dbg !228 ; [#uses=3 type=i32] [debug line = 19:3@38:2]
  %tmp.37.i = add nsw i32 %recentdatapoints.head_i.load, 1, !dbg !229 ; [#uses=2 type=i32] [debug line = 20:3@38:2]
  %tmp.38.i = icmp eq i32 %tmp.37.i, 20, !dbg !230 ; [#uses=1 type=i1] [debug line = 21:3@38:2]
  %.tmp..i = select i1 %tmp.38.i, i32 0, i32 %tmp.37.i, !dbg !230 ; [#uses=4 type=i32] [debug line = 21:3@38:2]
  store i32 %.tmp..i, i32* @recentdatapoints.head_i, align 4, !dbg !229 ; [debug line = 20:3@38:2]
  store i32 %tmp.35.i, i32* @recentdatapoints.sum, align 4, !dbg !224 ; [debug line = 14:4@38:2]
  store i32 %tmp.36.i, i32* @recentdatapoints.len, align 4, !dbg !231 ; [debug line = 15:4@38:2]
  %AbeatDelay.load = load i32* @AbeatDelay, align 4, !dbg !232 ; [#uses=1 type=i32] [debug line = 40:2]
  %tmp.4 = add nsw i32 %AbeatDelay.load, 1, !dbg !232 ; [#uses=3 type=i32] [debug line = 40:2]
  %VbeatDelay.load = load i32* @VbeatDelay, align 4, !dbg !233 ; [#uses=1 type=i32] [debug line = 41:2]
  %tmp.5 = add nsw i32 %VbeatDelay.load, 1, !dbg !233 ; [#uses=3 type=i32] [debug line = 41:2]
  %VbeatFallDelay.load = load i32* @VbeatFallDelay, align 4, !dbg !234 ; [#uses=1 type=i32] [debug line = 42:2]
  %tmp.6 = add nsw i32 %VbeatFallDelay.load, 1, !dbg !234 ; [#uses=3 type=i32] [debug line = 42:2]
  %AstimDelay.load.op = add i32 %AstimDelay.load, 1, !dbg !208 ; [#uses=1 type=i32] [debug line = 43:2]
  %tmp.7 = select i1 %tmp, i32 %AstimDelay.load.op, i32 1, !dbg !208 ; [#uses=2 type=i32] [debug line = 43:2]
  %VstimDelay.load.op = add i32 %VstimDelay.load, 1, !dbg !210 ; [#uses=1 type=i32] [debug line = 44:2]
  %tmp.8 = select i1 %tmp.1, i32 %VstimDelay.load.op, i32 1, !dbg !210 ; [#uses=2 type=i32] [debug line = 44:2]
  %tmp.i9 = icmp eq i32 %tmp.36.i, 0, !dbg !235   ; [#uses=1 type=i1] [debug line = 26:3@47:19]
  %i = add nsw i32 %.tmp..i, -1, !dbg !239        ; [#uses=2 type=i32] [debug line = 28:21@47:19]
  call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !240) nounwind, !dbg !239 ; [debug line = 28:21@47:19] [debug variable = i]
  %tmp..i1 = icmp slt i32 %i, 0, !dbg !241        ; [#uses=1 type=i1] [debug line = 29:3@47:19]
  %i.1 = add nsw i32 %.tmp..i, 19, !dbg !242      ; [#uses=1 type=i32] [debug line = 30:4@47:19]
  call void @llvm.dbg.value(metadata !{i32 %i.1}, i64 0, metadata !240) nounwind, !dbg !242 ; [debug line = 30:4@47:19] [debug variable = i]
  %..i = select i1 %tmp..i1, i32 %i.1, i32 %i, !dbg !241 ; [#uses=1 type=i32] [debug line = 29:3@47:19]
  %tmp.39.i = sext i32 %..i to i64, !dbg !243     ; [#uses=1 type=i64] [debug line = 31:3@47:19]
  %recentdatapoints.data.addr.1 = getelementptr [20 x i16]* @recentdatapoints.data, i64 0, i64 %tmp.39.i, !dbg !243 ; [#uses=1 type=i16*] [debug line = 31:3@47:19]
  %recentdatapoints.data.load.1 = load i16* %recentdatapoints.data.addr.1, align 2 ; [#uses=1 type=i16]
  %datapointV = select i1 %tmp.i9, i16 0, i16 %recentdatapoints.data.load.1, !dbg !238 ; [#uses=1 type=i16] [debug line = 47:19]
  %datapointV.cast = sext i16 %datapointV to i32, !dbg !238 ; [#uses=1 type=i32] [debug line = 47:19]
  call void @llvm.dbg.value(metadata !{i16 %datapointV}, i64 0, metadata !244), !dbg !238 ; [debug line = 47:19] [debug variable = datapointV]
  %sum = load i32* @recentVBools.sum, align 4, !dbg !245 ; [#uses=3 type=i32] [debug line = 49:28]
  call void @llvm.dbg.value(metadata !{i32 %sum}, i64 0, metadata !246), !dbg !245 ; [debug line = 49:28] [debug variable = sum]
  %vflip.load = load i32* @vflip, align 4, !dbg !247 ; [#uses=1 type=i32] [debug line = 50:2]
  %tmp.9 = mul nsw i32 %vflip.load, %datapointV.cast, !dbg !247 ; [#uses=1 type=i32] [debug line = 50:2]
  %vthresh.load = load i32* @vthresh, align 4, !dbg !247 ; [#uses=1 type=i32] [debug line = 50:2]
  %tmp. = icmp sgt i32 %tmp.9, %vthresh.load, !dbg !247 ; [#uses=2 type=i1] [debug line = 50:2]
  %val.assign.1 = zext i1 %tmp. to i32, !dbg !247 ; [#uses=1 type=i32] [debug line = 50:2]
  call void @llvm.dbg.value(metadata !{i32 %val.assign.1}, i64 0, metadata !248) nounwind, !dbg !250 ; [debug line = 12:14@50:2] [debug variable = val]
  %recentVBools.len.load = load i32* @recentVBools.len, align 4, !dbg !251 ; [#uses=2 type=i32] [debug line = 13:3@50:2]
  %tmp.i1 = icmp eq i32 %recentVBools.len.load, 11, !dbg !251 ; [#uses=2 type=i1] [debug line = 13:3@50:2]
  %recentVBools.head_i.load = load i32* @recentVBools.head_i, align 4, !dbg !253 ; [#uses=2 type=i32] [debug line = 14:4@50:2]
  %tmp..i2 = sext i32 %recentVBools.head_i.load to i64, !dbg !253 ; [#uses=1 type=i64] [debug line = 14:4@50:2]
  %recentVBools.data.addr = getelementptr [11 x i1]* @recentVBools.data, i64 0, i64 %tmp..i2, !dbg !253 ; [#uses=2 type=i1*] [debug line = 14:4@50:2]
  %recentVBools.data.load = load i1* %recentVBools.data.addr, align 1 ; [#uses=1 type=i1]
  %extLd1 = zext i1 %recentVBools.data.load to i32 ; [#uses=1 type=i32]
  %tmp.40.i = sub nsw i32 %sum, %extLd1, !dbg !253 ; [#uses=1 type=i32] [debug line = 14:4@50:2]
  %recentVBools.sum.loc.i = select i1 %tmp.i1, i32 %tmp.40.i, i32 %sum ; [#uses=1 type=i32]
  store i1 %tmp., i1* %recentVBools.data.addr, align 1, !dbg !255 ; [debug line = 17:3@50:2]
  %tmp.42.i = add nsw i32 %recentVBools.sum.loc.i, %val.assign.1, !dbg !256 ; [#uses=1 type=i32] [debug line = 18:3@50:2]
  %recentVBools.len.load.op = add i32 %recentVBools.len.load, 1, !dbg !257 ; [#uses=1 type=i32] [debug line = 19:3@50:2]
  %tmp.43.i = select i1 %tmp.i1, i32 11, i32 %recentVBools.len.load.op, !dbg !257 ; [#uses=2 type=i32] [debug line = 19:3@50:2]
  %tmp.44.i = add nsw i32 %recentVBools.head_i.load, 1, !dbg !258 ; [#uses=2 type=i32] [debug line = 20:3@50:2]
  %tmp.45.i = icmp eq i32 %tmp.44.i, 11, !dbg !259 ; [#uses=1 type=i1] [debug line = 21:3@50:2]
  %.tmp..i1 = select i1 %tmp.45.i, i32 0, i32 %tmp.44.i, !dbg !259 ; [#uses=3 type=i32] [debug line = 21:3@50:2]
  store i32 %.tmp..i1, i32* @recentVBools.head_i, align 4, !dbg !258 ; [debug line = 20:3@50:2]
  store i32 %tmp.42.i, i32* @recentVBools.sum, align 4, !dbg !253 ; [debug line = 14:4@50:2]
  store i32 %tmp.43.i, i32* @recentVBools.len, align 4, !dbg !260 ; [debug line = 15:4@50:2]
  %i.2 = add nsw i32 %.tmp..i1, -1, !dbg !261     ; [#uses=2 type=i32] [debug line = 28:21@51:9]
  call void @llvm.dbg.value(metadata !{i32 %i.2}, i64 0, metadata !265) nounwind, !dbg !261 ; [debug line = 28:21@51:9] [debug variable = i]
  %tmp..i3 = icmp slt i32 %i.2, 0, !dbg !266      ; [#uses=1 type=i1] [debug line = 29:3@51:9]
  %i.3 = add nsw i32 %.tmp..i1, 10, !dbg !267     ; [#uses=1 type=i32] [debug line = 30:4@51:9]
  call void @llvm.dbg.value(metadata !{i32 %i.3}, i64 0, metadata !265) nounwind, !dbg !267 ; [debug line = 30:4@51:9] [debug variable = i]
  %..i1 = select i1 %tmp..i3, i32 %i.3, i32 %i.2, !dbg !266 ; [#uses=1 type=i32] [debug line = 29:3@51:9]
  %tmp.46.i = sext i32 %..i1 to i64, !dbg !268    ; [#uses=1 type=i64] [debug line = 31:3@51:9]
  %recentVBools.data.addr.1 = getelementptr [11 x i1]* @recentVBools.data, i64 0, i64 %tmp.46.i, !dbg !268 ; [#uses=1 type=i1*] [debug line = 31:3@51:9]
  %recentVBools.data.load.1 = load i1* %recentVBools.data.addr.1, align 1 ; [#uses=1 type=i1]
  %not.tmp.i2 = icmp ne i32 %tmp.43.i, 0          ; [#uses=1 type=i1]
  %.0.i = and i1 %recentVBools.data.load.1, %not.tmp.i2 ; [#uses=1 type=i1]
  %.0.i.cast = zext i1 %.0.i to i32               ; [#uses=1 type=i32]
  %sum.1 = add nsw i32 %.0.i.cast, %sum, !dbg !264 ; [#uses=1 type=i32] [debug line = 51:9]
  call void @llvm.dbg.value(metadata !{i32 %sum.1}, i64 0, metadata !246), !dbg !264 ; [debug line = 51:9] [debug variable = sum]
  %tmp.3 = icmp sgt i32 %sum.1, 5, !dbg !269      ; [#uses=1 type=i1] [debug line = 53:2]
  store i32 %tmp.8, i32* @VstimDelay, align 4, !dbg !270 ; [debug line = 28:3]
  store i32 %tmp.7, i32* @AstimDelay, align 4, !dbg !271 ; [debug line = 25:3]
  %last_sample_is_V.load = load i1* @last_sample_is_V, align 1 ; [#uses=4 type=i1]
  br i1 %tmp.3, label %1, label %3, !dbg !269     ; [debug line = 53:2]

; <label>:1                                       ; preds = %._crit_edge12_ifconv
  br i1 %last_sample_is_V.load, label %._crit_edge13_ifconv, label %2, !dbg !272 ; [debug line = 55:3]

; <label>:2                                       ; preds = %1
  store i1 true, i1* @last_sample_is_V, align 1, !dbg !274 ; [debug line = 58:4]
  br label %._crit_edge13_ifconv, !dbg !276       ; [debug line = 59:3]

; <label>:3                                       ; preds = %._crit_edge12_ifconv
  br i1 %last_sample_is_V.load, label %4, label %._crit_edge13_ifconv, !dbg !277 ; [debug line = 61:7]

; <label>:4                                       ; preds = %3
  store i1 false, i1* @last_sample_is_V, align 1, !dbg !278 ; [debug line = 64:3]
  br label %._crit_edge13_ifconv, !dbg !280       ; [debug line = 65:2]

._crit_edge13_ifconv:                             ; preds = %4, %3, %2, %1
  %VbeatDelay.new.1 = phi i32 [ 0, %2 ], [ %tmp.5, %1 ], [ %tmp.5, %4 ], [ %tmp.5, %3 ] ; [#uses=4 type=i32]
  %VbeatFallDelay.new.1 = phi i32 [ %tmp.6, %2 ], [ %tmp.6, %1 ], [ 0, %4 ], [ %tmp.6, %3 ] ; [#uses=2 type=i32]
  %last_sample_is_V.loc.2 = phi i1 [ true, %2 ], [ %last_sample_is_V.load, %1 ], [ false, %4 ], [ %last_sample_is_V.load, %3 ] ; [#uses=1 type=i1]
  %tmp.i3 = icmp eq i32 %tmp.36.i, 20, !dbg !281  ; [#uses=1 type=i1] [debug line = 46:3@68:19]
  %tmp..i4 = sext i32 %.tmp..i to i64, !dbg !285  ; [#uses=1 type=i64] [debug line = 47:4@68:19]
  %recentdatapoints.data.addr.2 = getelementptr [20 x i16]* @recentdatapoints.data, i64 0, i64 %tmp..i4, !dbg !285 ; [#uses=1 type=i16*] [debug line = 47:4@68:19]
  %recentdatapoints.data.load.2 = load i16* %recentdatapoints.data.addr.2, align 2 ; [#uses=1 type=i16]
  %datapointA = select i1 %tmp.i3, i16 %recentdatapoints.data.load.2, i16 0, !dbg !284 ; [#uses=1 type=i16] [debug line = 68:19]
  %datapointA.cast = sext i16 %datapointA to i32, !dbg !284 ; [#uses=1 type=i32] [debug line = 68:19]
  call void @llvm.dbg.value(metadata !{i16 %datapointA}, i64 0, metadata !286), !dbg !284 ; [debug line = 68:19] [debug variable = datapointA]
  %sum.2 = load i32* @recentABools.sum, align 4, !dbg !287 ; [#uses=3 type=i32] [debug line = 69:2]
  call void @llvm.dbg.value(metadata !{i32 %sum.2}, i64 0, metadata !246), !dbg !287 ; [debug line = 69:2] [debug variable = sum]
  %aflip.load = load i32* @aflip, align 4, !dbg !288 ; [#uses=1 type=i32] [debug line = 71:2]
  %tmp.10 = mul nsw i32 %aflip.load, %datapointA.cast, !dbg !288 ; [#uses=1 type=i32] [debug line = 71:2]
  %athresh.load = load i32* @athresh, align 4, !dbg !288 ; [#uses=1 type=i32] [debug line = 71:2]
  %tmp.11 = icmp sgt i32 %tmp.10, %athresh.load, !dbg !288 ; [#uses=2 type=i1] [debug line = 71:2]
  %val.assign.2 = zext i1 %tmp.11 to i32, !dbg !288 ; [#uses=1 type=i32] [debug line = 71:2]
  call void @llvm.dbg.value(metadata !{i32 %val.assign.2}, i64 0, metadata !289) nounwind, !dbg !291 ; [debug line = 12:14@71:2] [debug variable = val]
  %recentABools.len.load = load i32* @recentABools.len, align 4, !dbg !292 ; [#uses=2 type=i32] [debug line = 13:3@71:2]
  %tmp.i4 = icmp eq i32 %recentABools.len.load, 30, !dbg !292 ; [#uses=2 type=i1] [debug line = 13:3@71:2]
  %recentABools.head_i.load = load i32* @recentABools.head_i, align 4, !dbg !294 ; [#uses=2 type=i32] [debug line = 14:4@71:2]
  %tmp..i5 = sext i32 %recentABools.head_i.load to i64, !dbg !294 ; [#uses=1 type=i64] [debug line = 14:4@71:2]
  %recentABools.data.addr = getelementptr [30 x i1]* @recentABools.data, i64 0, i64 %tmp..i5, !dbg !294 ; [#uses=2 type=i1*] [debug line = 14:4@71:2]
  %recentABools.data.load = load i1* %recentABools.data.addr, align 1 ; [#uses=1 type=i1]
  %extLd2 = zext i1 %recentABools.data.load to i32 ; [#uses=1 type=i32]
  %tmp.47.i = sub nsw i32 %sum.2, %extLd2, !dbg !294 ; [#uses=1 type=i32] [debug line = 14:4@71:2]
  %recentABools.sum.loc.i = select i1 %tmp.i4, i32 %tmp.47.i, i32 %sum.2 ; [#uses=1 type=i32]
  store i1 %tmp.11, i1* %recentABools.data.addr, align 1, !dbg !296 ; [debug line = 17:3@71:2]
  %tmp.49.i = add nsw i32 %recentABools.sum.loc.i, %val.assign.2, !dbg !297 ; [#uses=1 type=i32] [debug line = 18:3@71:2]
  %recentABools.len.load.op = add i32 %recentABools.len.load, 1, !dbg !298 ; [#uses=1 type=i32] [debug line = 19:3@71:2]
  %tmp.50.i = select i1 %tmp.i4, i32 30, i32 %recentABools.len.load.op, !dbg !298 ; [#uses=2 type=i32] [debug line = 19:3@71:2]
  %tmp.51.i = add nsw i32 %recentABools.head_i.load, 1, !dbg !299 ; [#uses=2 type=i32] [debug line = 20:3@71:2]
  %tmp.52.i = icmp eq i32 %tmp.51.i, 30, !dbg !300 ; [#uses=1 type=i1] [debug line = 21:3@71:2]
  %.tmp..i2 = select i1 %tmp.52.i, i32 0, i32 %tmp.51.i, !dbg !300 ; [#uses=3 type=i32] [debug line = 21:3@71:2]
  store i32 %.tmp..i2, i32* @recentABools.head_i, align 4, !dbg !299 ; [debug line = 20:3@71:2]
  store i32 %tmp.49.i, i32* @recentABools.sum, align 4, !dbg !294 ; [debug line = 14:4@71:2]
  store i32 %tmp.50.i, i32* @recentABools.len, align 4, !dbg !301 ; [debug line = 15:4@71:2]
  %i.4 = add nsw i32 %.tmp..i2, -1, !dbg !302     ; [#uses=2 type=i32] [debug line = 28:21@72:9]
  call void @llvm.dbg.value(metadata !{i32 %i.4}, i64 0, metadata !306) nounwind, !dbg !302 ; [debug line = 28:21@72:9] [debug variable = i]
  %tmp..i6 = icmp slt i32 %i.4, 0, !dbg !307      ; [#uses=1 type=i1] [debug line = 29:3@72:9]
  %i.5 = add nsw i32 %.tmp..i2, 29, !dbg !308     ; [#uses=1 type=i32] [debug line = 30:4@72:9]
  call void @llvm.dbg.value(metadata !{i32 %i.5}, i64 0, metadata !306) nounwind, !dbg !308 ; [debug line = 30:4@72:9] [debug variable = i]
  %..i2 = select i1 %tmp..i6, i32 %i.5, i32 %i.4, !dbg !307 ; [#uses=1 type=i32] [debug line = 29:3@72:9]
  %tmp.53.i = sext i32 %..i2 to i64, !dbg !309    ; [#uses=1 type=i64] [debug line = 31:3@72:9]
  %recentABools.data.addr.1 = getelementptr [30 x i1]* @recentABools.data, i64 0, i64 %tmp.53.i, !dbg !309 ; [#uses=1 type=i1*] [debug line = 31:3@72:9]
  %recentABools.data.load.1 = load i1* %recentABools.data.addr.1, align 1 ; [#uses=1 type=i1]
  %not.tmp.i5 = icmp ne i32 %tmp.50.i, 0          ; [#uses=1 type=i1]
  %.0.i2 = and i1 %recentABools.data.load.1, %not.tmp.i5 ; [#uses=1 type=i1]
  %.0.i2.cast = zext i1 %.0.i2 to i32             ; [#uses=1 type=i32]
  %sum.3 = add nsw i32 %.0.i2.cast, %sum.2, !dbg !305 ; [#uses=1 type=i32] [debug line = 72:9]
  call void @llvm.dbg.value(metadata !{i32 %sum.3}, i64 0, metadata !246), !dbg !305 ; [debug line = 72:9] [debug variable = sum]
  %tmp.12 = icmp sgt i32 %sum.3, 15, !dbg !310    ; [#uses=1 type=i1] [debug line = 74:2]
  store i32 %VbeatFallDelay.new.1, i32* @VbeatFallDelay, align 4, !dbg !234 ; [debug line = 42:2]
  store i32 %VbeatDelay.new.1, i32* @VbeatDelay, align 4, !dbg !233 ; [debug line = 41:2]
  %last_sample_is_A.load = load i1* @last_sample_is_A, align 1 ; [#uses=4 type=i1]
  %tmp.13 = icmp sgt i32 %VbeatDelay.new.1, %VbeatFallDelay.new.1, !dbg !310 ; [#uses=1 type=i1] [debug line = 74:2]
  %or.cond2 = and i1 %tmp.12, %tmp.13, !dbg !310  ; [#uses=1 type=i1] [debug line = 74:2]
  br i1 %or.cond2, label %5, label %._crit_edge15, !dbg !310 ; [debug line = 74:2]

; <label>:5                                       ; preds = %._crit_edge13_ifconv
  br i1 %last_sample_is_A.load, label %._crit_edge17_ifconv, label %6, !dbg !311 ; [debug line = 76:3]

; <label>:6                                       ; preds = %5
  store i1 true, i1* @last_sample_is_A, align 1, !dbg !313 ; [debug line = 79:4]
  br label %._crit_edge17_ifconv, !dbg !315       ; [debug line = 80:3]

._crit_edge15:                                    ; preds = %._crit_edge13_ifconv
  br i1 %last_sample_is_A.load, label %7, label %._crit_edge17_ifconv, !dbg !316 ; [debug line = 83:7]

; <label>:7                                       ; preds = %._crit_edge15
  store i1 false, i1* @last_sample_is_A, align 1, !dbg !317 ; [debug line = 84:3]
  br label %._crit_edge17_ifconv, !dbg !317       ; [debug line = 84:3]

._crit_edge17_ifconv:                             ; preds = %7, %._crit_edge15, %6, %5
  %AbeatDelay.new = phi i32 [ 0, %6 ], [ %tmp.4, %5 ], [ %tmp.4, %._crit_edge15 ], [ %tmp.4, %7 ] ; [#uses=5 type=i32]
  %tmp.14 = phi i1 [ true, %6 ], [ %last_sample_is_A.load, %5 ], [ %last_sample_is_A.load, %._crit_edge15 ], [ false, %7 ] ; [#uses=1 type=i1]
  %tmp.15 = icmp ne i32 %VbeatDelay.new.1, 0, !dbg !318 ; [#uses=1 type=i1] [debug line = 86:2]
  %tmp.16 = xor i1 %last_sample_is_V.loc.2, true, !dbg !318 ; [#uses=1 type=i1] [debug line = 86:2]
  %or.cond = or i1 %tmp.15, %tmp.16, !dbg !318    ; [#uses=1 type=i1] [debug line = 86:2]
  store i32 %AbeatDelay.new, i32* @AbeatDelay, align 4, !dbg !232 ; [debug line = 40:2]
  %tmp.17 = icmp ne i32 %AbeatDelay.new, 0, !dbg !319 ; [#uses=1 type=i1] [debug line = 90:10]
  %tmp.18 = xor i1 %tmp.14, true, !dbg !319       ; [#uses=1 type=i1] [debug line = 90:10]
  %or.cond4 = or i1 %tmp.17, %tmp.18, !dbg !319   ; [#uses=1 type=i1] [debug line = 90:10]
  %storemerge = select i1 %or.cond4, i6 0, i6 -31, !dbg !319 ; [#uses=1 type=i6] [debug line = 90:10]
  %storemerge1 = select i1 %or.cond, i6 %storemerge, i6 -10 ; [#uses=1 type=i6]
  %storemerge1.cast1 = sext i6 %storemerge1 to i7 ; [#uses=1 type=i7]
  %storemerge1.cast = zext i7 %storemerge1.cast1 to i16 ; [#uses=1 type=i16]
  store i16 %storemerge1.cast, i16* %out, align 2, !dbg !320 ; [debug line = 88:3]
  %tmp.19 = icmp sgt i32 %AbeatDelay.new, 1000, !dbg !322 ; [#uses=1 type=i1] [debug line = 98:2]
  %tmp.20 = icmp sgt i32 %tmp.7, 30, !dbg !322    ; [#uses=1 type=i1] [debug line = 98:2]
  %or.cond8 = and i1 %tmp.19, %tmp.20, !dbg !322  ; [#uses=1 type=i1] [debug line = 98:2]
  %tmp.21 = icmp sgt i32 %VbeatDelay.new.1, %AbeatDelay.new, !dbg !323 ; [#uses=1 type=i1] [debug line = 108:2]
  %tmp.22 = icmp sgt i32 %AbeatDelay.new, 900, !dbg !323 ; [#uses=1 type=i1] [debug line = 108:2]
  %tmp.23 = icmp sgt i32 %tmp.8, 11, !dbg !323    ; [#uses=1 type=i1] [debug line = 108:2]
  %tmp1 = and i1 %tmp.22, %tmp.23, !dbg !323      ; [#uses=1 type=i1] [debug line = 108:2]
  %or.cond1 = and i1 %tmp1, %tmp.21, !dbg !323    ; [#uses=2 type=i1] [debug line = 108:2]
  %. = select i1 %or.cond1, i6 -10, i6 -31, !dbg !323 ; [#uses=1 type=i6] [debug line = 108:2]
  %tmp.24 = or i1 %or.cond1, %or.cond8, !dbg !323 ; [#uses=1 type=i1] [debug line = 108:2]
  %stim.new.1 = select i1 %tmp.24, i6 %., i6 0, !dbg !323 ; [#uses=1 type=i6] [debug line = 108:2]
  %stim.new.1.cast1 = sext i6 %stim.new.1 to i7, !dbg !323 ; [#uses=1 type=i7] [debug line = 108:2]
  %stim.new.1.cast = zext i7 %stim.new.1.cast1 to i16, !dbg !323 ; [#uses=1 type=i16] [debug line = 108:2]
  store i16 %stim.new.1.cast, i16* %stim, align 2, !dbg !324 ; [debug line = 97:2]
  ret void, !dbg !325                             ; [debug line = 117:1]
}

; [#uses=25]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=10]
declare void @_ssdm_op_SpecBitsMap(...)

!llvm.map.gv = !{!0}
!llvm.dbg.cu = !{!7}

!0 = metadata !{metadata !1, [0 x i32]* @llvm.global_ctors.0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !""}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 -1, i32 1}
!7 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/greg/multisite_test_detection_algorithms/xilnx_design/SingleSiteDetection/solution1/.autopilot/db/singleChannelDecision.pragma.2.cpp", metadata !"/home/greg/multisite_test_detection_algorithms/xilnx_design", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, null, null, null, metadata !8} ; [ DW_TAG_compile_unit ]
!8 = metadata !{metadata !9}
!9 = metadata !{metadata !10, metadata !13, metadata !14, metadata !15, metadata !45, metadata !71, metadata !97, metadata !98, metadata !101, metadata !104, metadata !107, metadata !110, metadata !113, metadata !114, metadata !117, metadata !118, metadata !119, metadata !120, metadata !121, metadata !124, metadata !125, metadata !128, metadata !131, metadata !132, metadata !133, metadata !134, metadata !135, metadata !136}
!10 = metadata !{i32 786484, i32 0, null, metadata !"aflip", metadata !"aflip", metadata !"_ZL5aflip", metadata !11, i32 8, metadata !12, i32 1, i32 1, i32* @aflip} ; [ DW_TAG_variable ]
!11 = metadata !{i32 786473, metadata !"singleChannelDecision.cpp", metadata !"/home/greg/multisite_test_detection_algorithms/xilnx_design", null} ; [ DW_TAG_file_type ]
!12 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!13 = metadata !{i32 786484, i32 0, null, metadata !"VbeatFallDelay", metadata !"VbeatFallDelay", metadata !"_ZL14VbeatFallDelay", metadata !11, i32 11, metadata !12, i32 1, i32 1, i32* @VbeatFallDelay} ; [ DW_TAG_variable ]
!14 = metadata !{i32 786484, i32 0, null, metadata !"VstimDelay", metadata !"VstimDelay", metadata !"_ZL10VstimDelay", metadata !11, i32 13, metadata !12, i32 1, i32 1, i32* @VstimDelay} ; [ DW_TAG_variable ]
!15 = metadata !{i32 790546, i32 0, null, metadata !"recentdatapoints.head_i", metadata !"recentdatapoints.head_i", metadata !"recentdatapoints.head_i", metadata !11, i32 20, metadata !16, i32 1, i32 1, i32* @recentdatapoints.head_i} ; [ DW_TAG_variable_field ]
!16 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 20>", metadata !17, i32 3, i64 32, i64 32, i32 0, i32 0, null, metadata !18, i32 0, null, metadata !42} ; [ DW_TAG_class_field_type ]
!17 = metadata !{i32 786473, metadata !"./circularBuffer.h", metadata !"/home/greg/multisite_test_detection_algorithms/xilnx_design", null} ; [ DW_TAG_file_type ]
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786445, metadata !20, metadata !"head_i", metadata !17, i32 6, i64 32, i64 32, i64 672, i32 0, metadata !12} ; [ DW_TAG_member ]
!20 = metadata !{i32 786434, null, metadata !"CircularBuffer<int, 20>", metadata !17, i32 3, i64 736, i64 32, i32 0, i32 0, null, metadata !21, i32 0, null, metadata !42} ; [ DW_TAG_class_type ]
!21 = metadata !{metadata !22, metadata !23, metadata !19, metadata !27, metadata !28, metadata !34, metadata !37, metadata !40, metadata !41}
!22 = metadata !{i32 786445, metadata !20, metadata !"sum", metadata !17, i32 4, i64 32, i64 32, i64 0, i32 0, metadata !12} ; [ DW_TAG_member ]
!23 = metadata !{i32 786445, metadata !20, metadata !"data", metadata !17, i32 5, i64 640, i64 32, i64 32, i32 0, metadata !24} ; [ DW_TAG_member ]
!24 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 640, i64 32, i32 0, i32 0, metadata !12, metadata !25, i32 0, i32 0} ; [ DW_TAG_array_type ]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ]
!27 = metadata !{i32 786445, metadata !20, metadata !"len", metadata !17, i32 7, i64 32, i64 32, i64 704, i32 0, metadata !12} ; [ DW_TAG_member ]
!28 = metadata !{i32 786478, i32 0, metadata !20, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"", metadata !17, i32 8, metadata !29, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 8} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{null, metadata !31}
!31 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !20} ; [ DW_TAG_pointer_type ]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!34 = metadata !{i32 786478, i32 0, metadata !20, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi20EE4pushEi", metadata !17, i32 12, metadata !35, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 12} ; [ DW_TAG_subprogram ]
!35 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!36 = metadata !{null, metadata !31, metadata !12}
!37 = metadata !{i32 786478, i32 0, metadata !20, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi20EE4headEv", metadata !17, i32 25, metadata !38, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 25} ; [ DW_TAG_subprogram ]
!38 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!39 = metadata !{metadata !12, metadata !31}
!40 = metadata !{i32 786478, i32 0, metadata !20, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi20EE4tailEv", metadata !17, i32 34, metadata !38, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 34} ; [ DW_TAG_subprogram ]
!41 = metadata !{i32 786478, i32 0, metadata !20, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi20EE5ftailEv", metadata !17, i32 45, metadata !38, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 45} ; [ DW_TAG_subprogram ]
!42 = metadata !{metadata !43, metadata !44}
!43 = metadata !{i32 786479, null, metadata !"T", metadata !12, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!44 = metadata !{i32 786480, null, metadata !"maxsize", metadata !12, i64 20, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!45 = metadata !{i32 790546, i32 0, null, metadata !"recentVBools.sum", metadata !"recentVBools.sum", metadata !"recentVBools.sum", metadata !11, i32 16, metadata !46, i32 1, i32 1, i32* @recentVBools.sum} ; [ DW_TAG_variable_field ]
!46 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 11>", metadata !17, i32 3, i64 32, i64 32, i32 0, i32 0, null, metadata !47, i32 0, null, metadata !69} ; [ DW_TAG_class_field_type ]
!47 = metadata !{metadata !48}
!48 = metadata !{i32 786445, metadata !49, metadata !"sum", metadata !17, i32 4, i64 32, i64 32, i64 0, i32 0, metadata !12} ; [ DW_TAG_member ]
!49 = metadata !{i32 786434, null, metadata !"CircularBuffer<int, 11>", metadata !17, i32 3, i64 448, i64 32, i32 0, i32 0, null, metadata !50, i32 0, null, metadata !69} ; [ DW_TAG_class_type ]
!50 = metadata !{metadata !48, metadata !51, metadata !55, metadata !56, metadata !57, metadata !61, metadata !64, metadata !67, metadata !68}
!51 = metadata !{i32 786445, metadata !49, metadata !"data", metadata !17, i32 5, i64 352, i64 32, i64 32, i32 0, metadata !52} ; [ DW_TAG_member ]
!52 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 352, i64 32, i32 0, i32 0, metadata !12, metadata !53, i32 0, i32 0} ; [ DW_TAG_array_type ]
!53 = metadata !{metadata !54}
!54 = metadata !{i32 786465, i64 0, i64 10}       ; [ DW_TAG_subrange_type ]
!55 = metadata !{i32 786445, metadata !49, metadata !"head_i", metadata !17, i32 6, i64 32, i64 32, i64 384, i32 0, metadata !12} ; [ DW_TAG_member ]
!56 = metadata !{i32 786445, metadata !49, metadata !"len", metadata !17, i32 7, i64 32, i64 32, i64 416, i32 0, metadata !12} ; [ DW_TAG_member ]
!57 = metadata !{i32 786478, i32 0, metadata !49, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"", metadata !17, i32 8, metadata !58, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 8} ; [ DW_TAG_subprogram ]
!58 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!59 = metadata !{null, metadata !60}
!60 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !49} ; [ DW_TAG_pointer_type ]
!61 = metadata !{i32 786478, i32 0, metadata !49, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi11EE4pushEi", metadata !17, i32 12, metadata !62, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 12} ; [ DW_TAG_subprogram ]
!62 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!63 = metadata !{null, metadata !60, metadata !12}
!64 = metadata !{i32 786478, i32 0, metadata !49, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi11EE4headEv", metadata !17, i32 25, metadata !65, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 25} ; [ DW_TAG_subprogram ]
!65 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!66 = metadata !{metadata !12, metadata !60}
!67 = metadata !{i32 786478, i32 0, metadata !49, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi11EE4tailEv", metadata !17, i32 34, metadata !65, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 34} ; [ DW_TAG_subprogram ]
!68 = metadata !{i32 786478, i32 0, metadata !49, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi11EE5ftailEv", metadata !17, i32 45, metadata !65, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 45} ; [ DW_TAG_subprogram ]
!69 = metadata !{metadata !43, metadata !70}
!70 = metadata !{i32 786480, null, metadata !"maxsize", metadata !12, i64 11, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!71 = metadata !{i32 790546, i32 0, null, metadata !"recentABools.sum", metadata !"recentABools.sum", metadata !"recentABools.sum", metadata !11, i32 17, metadata !72, i32 1, i32 1, i32* @recentABools.sum} ; [ DW_TAG_variable_field ]
!72 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 30>", metadata !17, i32 3, i64 32, i64 32, i32 0, i32 0, null, metadata !73, i32 0, null, metadata !95} ; [ DW_TAG_class_field_type ]
!73 = metadata !{metadata !74}
!74 = metadata !{i32 786445, metadata !75, metadata !"sum", metadata !17, i32 4, i64 32, i64 32, i64 0, i32 0, metadata !12} ; [ DW_TAG_member ]
!75 = metadata !{i32 786434, null, metadata !"CircularBuffer<int, 30>", metadata !17, i32 3, i64 1056, i64 32, i32 0, i32 0, null, metadata !76, i32 0, null, metadata !95} ; [ DW_TAG_class_type ]
!76 = metadata !{metadata !74, metadata !77, metadata !81, metadata !82, metadata !83, metadata !87, metadata !90, metadata !93, metadata !94}
!77 = metadata !{i32 786445, metadata !75, metadata !"data", metadata !17, i32 5, i64 960, i64 32, i64 32, i32 0, metadata !78} ; [ DW_TAG_member ]
!78 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 960, i64 32, i32 0, i32 0, metadata !12, metadata !79, i32 0, i32 0} ; [ DW_TAG_array_type ]
!79 = metadata !{metadata !80}
!80 = metadata !{i32 786465, i64 0, i64 29}       ; [ DW_TAG_subrange_type ]
!81 = metadata !{i32 786445, metadata !75, metadata !"head_i", metadata !17, i32 6, i64 32, i64 32, i64 992, i32 0, metadata !12} ; [ DW_TAG_member ]
!82 = metadata !{i32 786445, metadata !75, metadata !"len", metadata !17, i32 7, i64 32, i64 32, i64 1024, i32 0, metadata !12} ; [ DW_TAG_member ]
!83 = metadata !{i32 786478, i32 0, metadata !75, metadata !"CircularBuffer", metadata !"CircularBuffer", metadata !"", metadata !17, i32 8, metadata !84, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 8} ; [ DW_TAG_subprogram ]
!84 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !85, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!85 = metadata !{null, metadata !86}
!86 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !75} ; [ DW_TAG_pointer_type ]
!87 = metadata !{i32 786478, i32 0, metadata !75, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi30EE4pushEi", metadata !17, i32 12, metadata !88, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 12} ; [ DW_TAG_subprogram ]
!88 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !89, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!89 = metadata !{null, metadata !86, metadata !12}
!90 = metadata !{i32 786478, i32 0, metadata !75, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi30EE4headEv", metadata !17, i32 25, metadata !91, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 25} ; [ DW_TAG_subprogram ]
!91 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !92, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!92 = metadata !{metadata !12, metadata !86}
!93 = metadata !{i32 786478, i32 0, metadata !75, metadata !"tail", metadata !"tail", metadata !"_ZN14CircularBufferIiLi30EE4tailEv", metadata !17, i32 34, metadata !91, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 34} ; [ DW_TAG_subprogram ]
!94 = metadata !{i32 786478, i32 0, metadata !75, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi30EE5ftailEv", metadata !17, i32 45, metadata !91, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !32, i32 45} ; [ DW_TAG_subprogram ]
!95 = metadata !{metadata !43, metadata !96}
!96 = metadata !{i32 786480, null, metadata !"maxsize", metadata !12, i64 30, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!97 = metadata !{i32 786484, i32 0, null, metadata !"AstimDelay", metadata !"AstimDelay", metadata !"_ZL10AstimDelay", metadata !11, i32 12, metadata !12, i32 1, i32 1, i32* @AstimDelay} ; [ DW_TAG_variable ]
!98 = metadata !{i32 790546, i32 0, null, metadata !"recentdatapoints.sum", metadata !"recentdatapoints.sum", metadata !"recentdatapoints.sum", metadata !11, i32 20, metadata !99, i32 1, i32 1, i32* @recentdatapoints.sum} ; [ DW_TAG_variable_field ]
!99 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 20>", metadata !17, i32 3, i64 32, i64 32, i32 0, i32 0, null, metadata !100, i32 0, null, metadata !42} ; [ DW_TAG_class_field_type ]
!100 = metadata !{metadata !22}
!101 = metadata !{i32 790546, i32 0, null, metadata !"recentdatapoints.len", metadata !"recentdatapoints.len", metadata !"recentdatapoints.len", metadata !11, i32 20, metadata !102, i32 1, i32 1, i32* @recentdatapoints.len} ; [ DW_TAG_variable_field ]
!102 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 20>", metadata !17, i32 3, i64 32, i64 32, i32 0, i32 0, null, metadata !103, i32 0, null, metadata !42} ; [ DW_TAG_class_field_type ]
!103 = metadata !{metadata !27}
!104 = metadata !{i32 790546, i32 0, null, metadata !"recentVBools.len", metadata !"recentVBools.len", metadata !"recentVBools.len", metadata !11, i32 16, metadata !105, i32 1, i32 1, i32* @recentVBools.len} ; [ DW_TAG_variable_field ]
!105 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 11>", metadata !17, i32 3, i64 32, i64 32, i32 0, i32 0, null, metadata !106, i32 0, null, metadata !69} ; [ DW_TAG_class_field_type ]
!106 = metadata !{metadata !56}
!107 = metadata !{i32 790546, i32 0, null, metadata !"recentdatapoints.data", metadata !"recentdatapoints.data", metadata !"recentdatapoints.data", metadata !11, i32 20, metadata !108, i32 1, i32 1, [20 x i16]* @recentdatapoints.data} ; [ DW_TAG_variable_field ]
!108 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 20>", metadata !17, i32 3, i64 640, i64 32, i32 0, i32 0, null, metadata !109, i32 0, null, metadata !42} ; [ DW_TAG_class_field_type ]
!109 = metadata !{metadata !23}
!110 = metadata !{i32 790546, i32 0, null, metadata !"recentVBools.data", metadata !"recentVBools.data", metadata !"recentVBools.data", metadata !11, i32 16, metadata !111, i32 1, i32 1, [11 x i1]* @recentVBools.data} ; [ DW_TAG_variable_field ]
!111 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 11>", metadata !17, i32 3, i64 352, i64 32, i32 0, i32 0, null, metadata !112, i32 0, null, metadata !69} ; [ DW_TAG_class_field_type ]
!112 = metadata !{metadata !51}
!113 = metadata !{i32 786484, i32 0, null, metadata !"last_sample_is_V", metadata !"last_sample_is_V", metadata !"last_sample_is_V", metadata !11, i32 18, metadata !12, i32 1, i32 1, i1* @last_sample_is_V} ; [ DW_TAG_variable ]
!114 = metadata !{i32 790546, i32 0, null, metadata !"recentABools.data", metadata !"recentABools.data", metadata !"recentABools.data", metadata !11, i32 17, metadata !115, i32 1, i32 1, [30 x i1]* @recentABools.data} ; [ DW_TAG_variable_field ]
!115 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 30>", metadata !17, i32 3, i64 960, i64 32, i32 0, i32 0, null, metadata !116, i32 0, null, metadata !95} ; [ DW_TAG_class_field_type ]
!116 = metadata !{metadata !77}
!117 = metadata !{i32 786484, i32 0, null, metadata !"last_sample_is_A", metadata !"last_sample_is_A", metadata !"last_sample_is_A", metadata !11, i32 19, metadata !12, i32 1, i32 1, i1* @last_sample_is_A} ; [ DW_TAG_variable ]
!118 = metadata !{i32 786484, i32 0, null, metadata !"vflip", metadata !"vflip", metadata !"_ZL5vflip", metadata !11, i32 7, metadata !12, i32 1, i32 1, i32* @vflip} ; [ DW_TAG_variable ]
!119 = metadata !{i32 786484, i32 0, null, metadata !"vthresh", metadata !"vthresh", metadata !"_ZL7vthresh", metadata !11, i32 5, metadata !12, i32 1, i32 1, i32* @vthresh} ; [ DW_TAG_variable ]
!120 = metadata !{i32 786484, i32 0, null, metadata !"AbeatDelay", metadata !"AbeatDelay", metadata !"_ZL10AbeatDelay", metadata !11, i32 9, metadata !12, i32 1, i32 1, i32* @AbeatDelay} ; [ DW_TAG_variable ]
!121 = metadata !{i32 790546, i32 0, null, metadata !"recentABools.len", metadata !"recentABools.len", metadata !"recentABools.len", metadata !11, i32 17, metadata !122, i32 1, i32 1, i32* @recentABools.len} ; [ DW_TAG_variable_field ]
!122 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 30>", metadata !17, i32 3, i64 32, i64 32, i32 0, i32 0, null, metadata !123, i32 0, null, metadata !95} ; [ DW_TAG_class_field_type ]
!123 = metadata !{metadata !82}
!124 = metadata !{i32 786484, i32 0, null, metadata !"VbeatDelay", metadata !"VbeatDelay", metadata !"_ZL10VbeatDelay", metadata !11, i32 10, metadata !12, i32 1, i32 1, i32* @VbeatDelay} ; [ DW_TAG_variable ]
!125 = metadata !{i32 790546, i32 0, null, metadata !"recentVBools.head_i", metadata !"recentVBools.head_i", metadata !"recentVBools.head_i", metadata !11, i32 16, metadata !126, i32 1, i32 1, i32* @recentVBools.head_i} ; [ DW_TAG_variable_field ]
!126 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 11>", metadata !17, i32 3, i64 32, i64 32, i32 0, i32 0, null, metadata !127, i32 0, null, metadata !69} ; [ DW_TAG_class_field_type ]
!127 = metadata !{metadata !55}
!128 = metadata !{i32 790546, i32 0, null, metadata !"recentABools.head_i", metadata !"recentABools.head_i", metadata !"recentABools.head_i", metadata !11, i32 17, metadata !129, i32 1, i32 1, i32* @recentABools.head_i} ; [ DW_TAG_variable_field ]
!129 = metadata !{i32 786438, null, metadata !"CircularBuffer<int, 30>", metadata !17, i32 3, i64 32, i64 32, i32 0, i32 0, null, metadata !130, i32 0, null, metadata !95} ; [ DW_TAG_class_field_type ]
!130 = metadata !{metadata !81}
!131 = metadata !{i32 786484, i32 0, null, metadata !"athresh", metadata !"athresh", metadata !"_ZL7athresh", metadata !11, i32 6, metadata !12, i32 1, i32 1, i32* @athresh} ; [ DW_TAG_variable ]
!132 = metadata !{i32 786484, i32 0, null, metadata !"recentVBools", metadata !"recentVBools", metadata !"_ZL12recentVBools", metadata !11, i32 16, metadata !49, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!133 = metadata !{i32 786484, i32 0, null, metadata !"recentABools", metadata !"recentABools", metadata !"_ZL12recentABools", metadata !11, i32 17, metadata !75, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!134 = metadata !{i32 786484, i32 0, null, metadata !"recentdatapoints", metadata !"recentdatapoints", metadata !"_ZL16recentdatapoints", metadata !11, i32 20, metadata !20, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!135 = metadata !{i32 786484, i32 0, null, metadata !"VCaptureThresh", metadata !"VCaptureThresh", metadata !"_ZL14VCaptureThresh", metadata !11, i32 15, metadata !12, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!136 = metadata !{i32 786484, i32 0, null, metadata !"ACaptureThresh", metadata !"ACaptureThresh", metadata !"_ZL14ACaptureThresh", metadata !11, i32 14, metadata !12, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!137 = metadata !{metadata !138}
!138 = metadata !{i32 0, i32 15, metadata !139}
!139 = metadata !{metadata !140}
!140 = metadata !{metadata !"A_stim_reset", metadata !141, metadata !"short"}
!141 = metadata !{metadata !142}
!142 = metadata !{i32 0, i32 0, i32 0}
!143 = metadata !{metadata !144}
!144 = metadata !{i32 0, i32 15, metadata !145}
!145 = metadata !{metadata !146}
!146 = metadata !{metadata !"V_stim_reset", metadata !141, metadata !"short"}
!147 = metadata !{metadata !148}
!148 = metadata !{i32 0, i32 15, metadata !149}
!149 = metadata !{metadata !150}
!150 = metadata !{metadata !"set_thresh", metadata !141, metadata !"short"}
!151 = metadata !{metadata !152}
!152 = metadata !{i32 0, i32 31, metadata !153}
!153 = metadata !{metadata !154}
!154 = metadata !{metadata !"v_thresh", metadata !141, metadata !"int"}
!155 = metadata !{metadata !156}
!156 = metadata !{i32 0, i32 31, metadata !157}
!157 = metadata !{metadata !158}
!158 = metadata !{metadata !"a_thresh", metadata !141, metadata !"int"}
!159 = metadata !{metadata !160}
!160 = metadata !{i32 0, i32 31, metadata !161}
!161 = metadata !{metadata !162}
!162 = metadata !{metadata !"a_flip", metadata !141, metadata !"int"}
!163 = metadata !{metadata !164}
!164 = metadata !{i32 0, i32 31, metadata !165}
!165 = metadata !{metadata !166}
!166 = metadata !{metadata !"v_flip", metadata !141, metadata !"int"}
!167 = metadata !{metadata !168}
!168 = metadata !{i32 0, i32 15, metadata !169}
!169 = metadata !{metadata !170}
!170 = metadata !{metadata !"datapoint", metadata !171, metadata !"short"}
!171 = metadata !{metadata !172}
!172 = metadata !{i32 0, i32 0, i32 1}
!173 = metadata !{metadata !174}
!174 = metadata !{i32 0, i32 15, metadata !175}
!175 = metadata !{metadata !176}
!176 = metadata !{metadata !"out", metadata !171, metadata !"short"}
!177 = metadata !{metadata !178}
!178 = metadata !{i32 0, i32 15, metadata !179}
!179 = metadata !{metadata !180}
!180 = metadata !{metadata !"stim", metadata !171, metadata !"short"}
!181 = metadata !{i32 786689, metadata !182, metadata !"A_stim_reset", metadata !11, i32 16777238, metadata !185, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!182 = metadata !{i32 786478, i32 0, metadata !11, metadata !"singleDecision", metadata !"singleDecision", metadata !"_Z14singleDecisionsssiiiiPsS_S_", metadata !11, i32 22, metadata !183, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i16, i16, i16, i32, i32, i32, i32, i16*, i16*, i16*)* @singleDecision, null, null, metadata !32, i32 23} ; [ DW_TAG_subprogram ]
!183 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !184, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!184 = metadata !{null, metadata !185, metadata !185, metadata !185, metadata !12, metadata !12, metadata !12, metadata !12, metadata !186, metadata !186, metadata !186}
!185 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!186 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !185} ; [ DW_TAG_pointer_type ]
!187 = metadata !{i32 22, i32 27, metadata !182, null}
!188 = metadata !{i32 786689, metadata !182, metadata !"V_stim_reset", metadata !11, i32 33554454, metadata !185, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!189 = metadata !{i32 22, i32 47, metadata !182, null}
!190 = metadata !{i32 786689, metadata !182, metadata !"set_thresh", metadata !11, i32 50331670, metadata !185, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!191 = metadata !{i32 22, i32 67, metadata !182, null}
!192 = metadata !{i32 786689, metadata !182, metadata !"v_thresh", metadata !11, i32 67108886, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!193 = metadata !{i32 22, i32 83, metadata !182, null}
!194 = metadata !{i32 786689, metadata !182, metadata !"a_thresh", metadata !11, i32 83886102, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!195 = metadata !{i32 22, i32 97, metadata !182, null}
!196 = metadata !{i32 786689, metadata !182, metadata !"a_flip", metadata !11, i32 100663318, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!197 = metadata !{i32 22, i32 111, metadata !182, null}
!198 = metadata !{i32 786689, metadata !182, metadata !"v_flip", metadata !11, i32 117440534, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!199 = metadata !{i32 22, i32 123, metadata !182, null}
!200 = metadata !{i32 786689, metadata !182, metadata !"datapoint", metadata !11, i32 134217750, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!201 = metadata !{i32 22, i32 139, metadata !182, null}
!202 = metadata !{i32 786689, metadata !182, metadata !"out", metadata !11, i32 150994966, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!203 = metadata !{i32 22, i32 158, metadata !182, null}
!204 = metadata !{i32 786689, metadata !182, metadata !"stim", metadata !11, i32 167772182, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!205 = metadata !{i32 22, i32 171, metadata !182, null}
!206 = metadata !{i32 24, i32 2, metadata !207, null}
!207 = metadata !{i32 786443, metadata !182, i32 23, i32 1, metadata !11, i32 0} ; [ DW_TAG_lexical_block ]
!208 = metadata !{i32 43, i32 2, metadata !207, null}
!209 = metadata !{i32 27, i32 2, metadata !207, null}
!210 = metadata !{i32 44, i32 2, metadata !207, null}
!211 = metadata !{i32 30, i32 2, metadata !207, null}
!212 = metadata !{i32 32, i32 6, metadata !213, null}
!213 = metadata !{i32 786443, metadata !207, i32 31, i32 2, metadata !11, i32 1} ; [ DW_TAG_lexical_block ]
!214 = metadata !{i32 33, i32 6, metadata !213, null}
!215 = metadata !{i32 34, i32 6, metadata !213, null}
!216 = metadata !{i32 35, i32 6, metadata !213, null}
!217 = metadata !{i32 36, i32 2, metadata !213, null}
!218 = metadata !{i32 38, i32 2, metadata !207, null}
!219 = metadata !{i32 786689, metadata !220, metadata !"val", metadata !17, i32 33554444, metadata !12, i32 0, metadata !218} ; [ DW_TAG_arg_variable ]
!220 = metadata !{i32 786478, i32 0, null, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi20EE4pushEi", metadata !17, i32 12, metadata !35, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !34, metadata !32, i32 12} ; [ DW_TAG_subprogram ]
!221 = metadata !{i32 12, i32 14, metadata !220, metadata !218}
!222 = metadata !{i32 13, i32 3, metadata !223, metadata !218}
!223 = metadata !{i32 786443, metadata !220, i32 12, i32 19, metadata !17, i32 21} ; [ DW_TAG_lexical_block ]
!224 = metadata !{i32 14, i32 4, metadata !225, metadata !218}
!225 = metadata !{i32 786443, metadata !223, i32 13, i32 23, metadata !17, i32 22} ; [ DW_TAG_lexical_block ]
!226 = metadata !{i32 17, i32 3, metadata !223, metadata !218}
!227 = metadata !{i32 18, i32 3, metadata !223, metadata !218}
!228 = metadata !{i32 19, i32 3, metadata !223, metadata !218}
!229 = metadata !{i32 20, i32 3, metadata !223, metadata !218}
!230 = metadata !{i32 21, i32 3, metadata !223, metadata !218}
!231 = metadata !{i32 15, i32 4, metadata !225, metadata !218}
!232 = metadata !{i32 40, i32 2, metadata !207, null}
!233 = metadata !{i32 41, i32 2, metadata !207, null}
!234 = metadata !{i32 42, i32 2, metadata !207, null}
!235 = metadata !{i32 26, i32 3, metadata !236, metadata !238}
!236 = metadata !{i32 786443, metadata !237, i32 25, i32 11, metadata !17, i32 20} ; [ DW_TAG_lexical_block ]
!237 = metadata !{i32 786478, i32 0, null, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi20EE4headEv", metadata !17, i32 25, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !37, metadata !32, i32 25} ; [ DW_TAG_subprogram ]
!238 = metadata !{i32 47, i32 19, metadata !207, null}
!239 = metadata !{i32 28, i32 21, metadata !236, metadata !238}
!240 = metadata !{i32 786688, metadata !236, metadata !"i", metadata !17, i32 28, metadata !12, i32 0, metadata !238} ; [ DW_TAG_auto_variable ]
!241 = metadata !{i32 29, i32 3, metadata !236, metadata !238}
!242 = metadata !{i32 30, i32 4, metadata !236, metadata !238}
!243 = metadata !{i32 31, i32 3, metadata !236, metadata !238}
!244 = metadata !{i32 786688, metadata !207, metadata !"datapointV", metadata !11, i32 47, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!245 = metadata !{i32 49, i32 28, metadata !207, null}
!246 = metadata !{i32 786688, metadata !207, metadata !"sum", metadata !11, i32 49, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!247 = metadata !{i32 50, i32 2, metadata !207, null}
!248 = metadata !{i32 786689, metadata !249, metadata !"val", metadata !17, i32 33554444, metadata !12, i32 0, metadata !247} ; [ DW_TAG_arg_variable ]
!249 = metadata !{i32 786478, i32 0, null, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi11EE4pushEi", metadata !17, i32 12, metadata !62, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !61, metadata !32, i32 12} ; [ DW_TAG_subprogram ]
!250 = metadata !{i32 12, i32 14, metadata !249, metadata !247}
!251 = metadata !{i32 13, i32 3, metadata !252, metadata !247}
!252 = metadata !{i32 786443, metadata !249, i32 12, i32 19, metadata !17, i32 18} ; [ DW_TAG_lexical_block ]
!253 = metadata !{i32 14, i32 4, metadata !254, metadata !247}
!254 = metadata !{i32 786443, metadata !252, i32 13, i32 23, metadata !17, i32 19} ; [ DW_TAG_lexical_block ]
!255 = metadata !{i32 17, i32 3, metadata !252, metadata !247}
!256 = metadata !{i32 18, i32 3, metadata !252, metadata !247}
!257 = metadata !{i32 19, i32 3, metadata !252, metadata !247}
!258 = metadata !{i32 20, i32 3, metadata !252, metadata !247}
!259 = metadata !{i32 21, i32 3, metadata !252, metadata !247}
!260 = metadata !{i32 15, i32 4, metadata !254, metadata !247}
!261 = metadata !{i32 28, i32 21, metadata !262, metadata !264}
!262 = metadata !{i32 786443, metadata !263, i32 25, i32 11, metadata !17, i32 17} ; [ DW_TAG_lexical_block ]
!263 = metadata !{i32 786478, i32 0, null, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi11EE4headEv", metadata !17, i32 25, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !64, metadata !32, i32 25} ; [ DW_TAG_subprogram ]
!264 = metadata !{i32 51, i32 9, metadata !207, null}
!265 = metadata !{i32 786688, metadata !262, metadata !"i", metadata !17, i32 28, metadata !12, i32 0, metadata !264} ; [ DW_TAG_auto_variable ]
!266 = metadata !{i32 29, i32 3, metadata !262, metadata !264}
!267 = metadata !{i32 30, i32 4, metadata !262, metadata !264}
!268 = metadata !{i32 31, i32 3, metadata !262, metadata !264}
!269 = metadata !{i32 53, i32 2, metadata !207, null}
!270 = metadata !{i32 28, i32 3, metadata !207, null}
!271 = metadata !{i32 25, i32 3, metadata !207, null}
!272 = metadata !{i32 55, i32 3, metadata !273, null}
!273 = metadata !{i32 786443, metadata !207, i32 54, i32 2, metadata !11, i32 2} ; [ DW_TAG_lexical_block ]
!274 = metadata !{i32 58, i32 4, metadata !275, null}
!275 = metadata !{i32 786443, metadata !273, i32 56, i32 3, metadata !11, i32 3} ; [ DW_TAG_lexical_block ]
!276 = metadata !{i32 59, i32 3, metadata !275, null}
!277 = metadata !{i32 61, i32 7, metadata !207, null}
!278 = metadata !{i32 64, i32 3, metadata !279, null}
!279 = metadata !{i32 786443, metadata !207, i32 62, i32 2, metadata !11, i32 4} ; [ DW_TAG_lexical_block ]
!280 = metadata !{i32 65, i32 2, metadata !279, null}
!281 = metadata !{i32 46, i32 3, metadata !282, metadata !284}
!282 = metadata !{i32 786443, metadata !283, i32 45, i32 12, metadata !17, i32 16} ; [ DW_TAG_lexical_block ]
!283 = metadata !{i32 786478, i32 0, null, metadata !"ftail", metadata !"ftail", metadata !"_ZN14CircularBufferIiLi20EE5ftailEv", metadata !17, i32 45, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !41, metadata !32, i32 45} ; [ DW_TAG_subprogram ]
!284 = metadata !{i32 68, i32 19, metadata !207, null}
!285 = metadata !{i32 47, i32 4, metadata !282, metadata !284}
!286 = metadata !{i32 786688, metadata !207, metadata !"datapointA", metadata !11, i32 68, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!287 = metadata !{i32 69, i32 2, metadata !207, null}
!288 = metadata !{i32 71, i32 2, metadata !207, null}
!289 = metadata !{i32 786689, metadata !290, metadata !"val", metadata !17, i32 33554444, metadata !12, i32 0, metadata !288} ; [ DW_TAG_arg_variable ]
!290 = metadata !{i32 786478, i32 0, null, metadata !"push", metadata !"push", metadata !"_ZN14CircularBufferIiLi30EE4pushEi", metadata !17, i32 12, metadata !88, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !87, metadata !32, i32 12} ; [ DW_TAG_subprogram ]
!291 = metadata !{i32 12, i32 14, metadata !290, metadata !288}
!292 = metadata !{i32 13, i32 3, metadata !293, metadata !288}
!293 = metadata !{i32 786443, metadata !290, i32 12, i32 19, metadata !17, i32 14} ; [ DW_TAG_lexical_block ]
!294 = metadata !{i32 14, i32 4, metadata !295, metadata !288}
!295 = metadata !{i32 786443, metadata !293, i32 13, i32 23, metadata !17, i32 15} ; [ DW_TAG_lexical_block ]
!296 = metadata !{i32 17, i32 3, metadata !293, metadata !288}
!297 = metadata !{i32 18, i32 3, metadata !293, metadata !288}
!298 = metadata !{i32 19, i32 3, metadata !293, metadata !288}
!299 = metadata !{i32 20, i32 3, metadata !293, metadata !288}
!300 = metadata !{i32 21, i32 3, metadata !293, metadata !288}
!301 = metadata !{i32 15, i32 4, metadata !295, metadata !288}
!302 = metadata !{i32 28, i32 21, metadata !303, metadata !305}
!303 = metadata !{i32 786443, metadata !304, i32 25, i32 11, metadata !17, i32 13} ; [ DW_TAG_lexical_block ]
!304 = metadata !{i32 786478, i32 0, null, metadata !"head", metadata !"head", metadata !"_ZN14CircularBufferIiLi30EE4headEv", metadata !17, i32 25, metadata !91, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !90, metadata !32, i32 25} ; [ DW_TAG_subprogram ]
!305 = metadata !{i32 72, i32 9, metadata !207, null}
!306 = metadata !{i32 786688, metadata !303, metadata !"i", metadata !17, i32 28, metadata !12, i32 0, metadata !305} ; [ DW_TAG_auto_variable ]
!307 = metadata !{i32 29, i32 3, metadata !303, metadata !305}
!308 = metadata !{i32 30, i32 4, metadata !303, metadata !305}
!309 = metadata !{i32 31, i32 3, metadata !303, metadata !305}
!310 = metadata !{i32 74, i32 2, metadata !207, null}
!311 = metadata !{i32 76, i32 3, metadata !312, null}
!312 = metadata !{i32 786443, metadata !207, i32 75, i32 2, metadata !11, i32 5} ; [ DW_TAG_lexical_block ]
!313 = metadata !{i32 79, i32 4, metadata !314, null}
!314 = metadata !{i32 786443, metadata !312, i32 77, i32 3, metadata !11, i32 6} ; [ DW_TAG_lexical_block ]
!315 = metadata !{i32 80, i32 3, metadata !314, null}
!316 = metadata !{i32 83, i32 7, metadata !207, null}
!317 = metadata !{i32 84, i32 3, metadata !207, null}
!318 = metadata !{i32 86, i32 2, metadata !207, null}
!319 = metadata !{i32 90, i32 10, metadata !207, null}
!320 = metadata !{i32 88, i32 3, metadata !321, null}
!321 = metadata !{i32 786443, metadata !207, i32 87, i32 2, metadata !11, i32 7} ; [ DW_TAG_lexical_block ]
!322 = metadata !{i32 98, i32 2, metadata !207, null}
!323 = metadata !{i32 108, i32 2, metadata !207, null}
!324 = metadata !{i32 97, i32 2, metadata !207, null}
!325 = metadata !{i32 117, i32 1, metadata !207, null}
