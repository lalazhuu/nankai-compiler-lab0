; ModuleID = 'bubble_sort_large_base.ll'
source_filename = "bubble_sort_large_base.ll"
target triple = "riscv64"

@data_array = common global [50001 x i32] zeroinitializer, align 4

declare i32 @getarray(i32*) local_unnamed_addr

; Function Attrs: nofree norecurse nosync nounwind
define void @bubble_sort(i32* nocapture %0, i32 %1) local_unnamed_addr #0 {
entry:
  %2 = add nsw i32 %1, -1
  %3 = icmp sgt i32 %1, 1
  br i1 %3, label %inner_loop_cond.preheader, label %outer_loop_end

inner_loop_cond.preheader:                        ; preds = %entry, %inner_loop_end
  %.013 = phi i32 [ %16, %inner_loop_end ], [ 0, %entry ]
  %4 = sub nsw i32 %2, %.013
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %inner_loop_body.preheader, label %inner_loop_end

inner_loop_body.preheader:                        ; preds = %inner_loop_cond.preheader
  %.pre = load i32, i32* %0, align 4
  br label %inner_loop_body

inner_loop_body:                                  ; preds = %inner_loop_body.preheader, %if_end
  %6 = phi i32 [ %14, %if_end ], [ %.pre, %inner_loop_body.preheader ]
  %.0812 = phi i32 [ %7, %if_end ], [ 0, %inner_loop_body.preheader ]
  %7 = add nuw nsw i32 %.0812, 1
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds i32, i32* %0, i64 %8
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %6, %10
  br i1 %11, label %if_then, label %if_end

if_then:                                          ; preds = %inner_loop_body
  %12 = zext i32 %.0812 to i64
  %13 = getelementptr inbounds i32, i32* %0, i64 %12
  store i32 %10, i32* %13, align 4
  store i32 %6, i32* %9, align 4
  br label %if_end

if_end:                                           ; preds = %if_then, %inner_loop_body
  %14 = phi i32 [ %6, %if_then ], [ %10, %inner_loop_body ]
  %15 = icmp slt i32 %7, %4
  br i1 %15, label %inner_loop_body, label %inner_loop_end

inner_loop_end:                                   ; preds = %if_end, %inner_loop_cond.preheader
  %16 = add nuw nsw i32 %.013, 1
  %17 = icmp sgt i32 %2, %16
  br i1 %17, label %inner_loop_cond.preheader, label %outer_loop_end

outer_loop_end:                                   ; preds = %inner_loop_end, %entry
  ret void
}

define i32 @main() local_unnamed_addr {
entry:
  %0 = tail call i32 @getarray(i32* getelementptr inbounds ([50001 x i32], [50001 x i32]* @data_array, i64 0, i64 0))
  %1 = add nsw i32 %0, -1
  %2 = icmp sgt i32 %0, 1
  br i1 %2, label %inner_loop_cond.preheader.i, label %bubble_sort.exit

inner_loop_cond.preheader.i:                      ; preds = %entry, %inner_loop_end.i
  %.013.i = phi i32 [ %15, %inner_loop_end.i ], [ 0, %entry ]
  %3 = sub nsw i32 %1, %.013.i
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %inner_loop_body.preheader.i, label %inner_loop_end.i

inner_loop_body.preheader.i:                      ; preds = %inner_loop_cond.preheader.i
  %.pre.i = load i32, i32* getelementptr inbounds ([50001 x i32], [50001 x i32]* @data_array, i64 0, i64 0), align 4
  br label %inner_loop_body.i

inner_loop_body.i:                                ; preds = %if_end.i, %inner_loop_body.preheader.i
  %5 = phi i32 [ %13, %if_end.i ], [ %.pre.i, %inner_loop_body.preheader.i ]
  %.0812.i = phi i32 [ %6, %if_end.i ], [ 0, %inner_loop_body.preheader.i ]
  %6 = add nuw nsw i32 %.0812.i, 1
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds [50001 x i32], [50001 x i32]* @data_array, i64 0, i64 %7
  %9 = load i32, i32* %8, align 4
  %10 = icmp sgt i32 %5, %9
  br i1 %10, label %if_then.i, label %if_end.i

if_then.i:                                        ; preds = %inner_loop_body.i
  %11 = zext i32 %.0812.i to i64
  %12 = getelementptr inbounds [50001 x i32], [50001 x i32]* @data_array, i64 0, i64 %11
  store i32 %9, i32* %12, align 4
  store i32 %5, i32* %8, align 4
  br label %if_end.i

if_end.i:                                         ; preds = %if_then.i, %inner_loop_body.i
  %13 = phi i32 [ %5, %if_then.i ], [ %9, %inner_loop_body.i ]
  %14 = icmp slt i32 %6, %3
  br i1 %14, label %inner_loop_body.i, label %inner_loop_end.i

inner_loop_end.i:                                 ; preds = %if_end.i, %inner_loop_cond.preheader.i
  %15 = add nuw nsw i32 %.013.i, 1
  %16 = icmp sgt i32 %1, %15
  br i1 %16, label %inner_loop_cond.preheader.i, label %bubble_sort.exit

bubble_sort.exit:                                 ; preds = %inner_loop_end.i, %entry
  ret i32 0
}

attributes #0 = { nofree norecurse nosync nounwind }
