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
  %.013 = phi i32 [ %15, %inner_loop_end ], [ 0, %entry ]
  %4 = sub nsw i32 %2, %.013
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %inner_loop_body, label %inner_loop_end

inner_loop_body:                                  ; preds = %inner_loop_cond.preheader, %if_end
  %.0812 = phi i32 [ %9, %if_end ], [ 0, %inner_loop_cond.preheader ]
  %6 = zext i32 %.0812 to i64
  %7 = getelementptr inbounds i32, i32* %0, i64 %6
  %8 = load i32, i32* %7, align 4
  %9 = add nuw nsw i32 %.0812, 1
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds i32, i32* %0, i64 %10
  %12 = load i32, i32* %11, align 4
  %13 = icmp sgt i32 %8, %12
  br i1 %13, label %if_then, label %if_end

if_then:                                          ; preds = %inner_loop_body
  store i32 %12, i32* %7, align 4
  store i32 %8, i32* %11, align 4
  br label %if_end

if_end:                                           ; preds = %if_then, %inner_loop_body
  %14 = icmp slt i32 %9, %4
  br i1 %14, label %inner_loop_body, label %inner_loop_end

inner_loop_end:                                   ; preds = %if_end, %inner_loop_cond.preheader
  %15 = add nuw nsw i32 %.013, 1
  %16 = icmp sgt i32 %2, %15
  br i1 %16, label %inner_loop_cond.preheader, label %outer_loop_end

outer_loop_end:                                   ; preds = %inner_loop_end, %entry
  ret void
}

define i32 @main() local_unnamed_addr {
entry:
  %0 = call i32 @getarray(i32* getelementptr inbounds ([50001 x i32], [50001 x i32]* @data_array, i64 0, i64 0))
  %1 = add nsw i32 %0, -1
  %2 = icmp sgt i32 %0, 1
  br i1 %2, label %inner_loop_cond.preheader.i, label %bubble_sort.exit

inner_loop_cond.preheader.i:                      ; preds = %entry, %inner_loop_end.i
  %.013.i = phi i32 [ %14, %inner_loop_end.i ], [ 0, %entry ]
  %3 = sub nsw i32 %1, %.013.i
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %inner_loop_body.i, label %inner_loop_end.i

inner_loop_body.i:                                ; preds = %inner_loop_cond.preheader.i, %if_end.i
  %.0812.i = phi i32 [ %8, %if_end.i ], [ 0, %inner_loop_cond.preheader.i ]
  %5 = zext i32 %.0812.i to i64
  %6 = getelementptr inbounds [50001 x i32], [50001 x i32]* @data_array, i64 0, i64 %5
  %7 = load i32, i32* %6, align 4
  %8 = add nuw nsw i32 %.0812.i, 1
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds [50001 x i32], [50001 x i32]* @data_array, i64 0, i64 %9
  %11 = load i32, i32* %10, align 4
  %12 = icmp sgt i32 %7, %11
  br i1 %12, label %if_then.i, label %if_end.i

if_then.i:                                        ; preds = %inner_loop_body.i
  store i32 %11, i32* %6, align 4
  store i32 %7, i32* %10, align 4
  br label %if_end.i

if_end.i:                                         ; preds = %if_then.i, %inner_loop_body.i
  %13 = icmp slt i32 %8, %3
  br i1 %13, label %inner_loop_body.i, label %inner_loop_end.i

inner_loop_end.i:                                 ; preds = %if_end.i, %inner_loop_cond.preheader.i
  %14 = add nuw nsw i32 %.013.i, 1
  %15 = icmp sgt i32 %1, %14
  br i1 %15, label %inner_loop_cond.preheader.i, label %bubble_sort.exit

bubble_sort.exit:                                 ; preds = %inner_loop_end.i, %entry
  ret i32 0
}

attributes #0 = { nofree norecurse nosync nounwind }
