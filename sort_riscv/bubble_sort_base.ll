; === bubble_sort_opt.ll (最终修正版：调整块顺序并重新编号) ===
target triple = "riscv64"
@data_array = common global [50001 x i32] zeroinitializer, align 4
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)

; ============================================================================
; bubble_sort 函数定义
; ============================================================================
define void @bubble_sort(i32* %0, i32 %1) {
entry:
  br label %outer_loop_cond

outer_loop_cond:
  %2 = phi i32 [ 0, %entry ], [ %15, %inner_loop_end ] ; i
  %3 = sub nsw i32 %1, 1
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %outer_loop_body, label %outer_loop_end

outer_loop_body:
  br label %inner_loop_cond

inner_loop_cond:
  %5 = phi i32 [ 0, %outer_loop_body ], [ %14, %if_end ] ; j
  %6 = sub nsw i32 %3, %2
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %inner_loop_body, label %inner_loop_end

inner_loop_body:
  %8 = getelementptr inbounds i32, i32* %0, i32 %5
  %9 = load i32, i32* %8, align 4
  %10 = add nsw i32 %5, 1
  %11 = getelementptr inbounds i32, i32* %0, i32 %10
  %12 = load i32, i32* %11, align 4
  %13 = icmp sgt i32 %9, %12
  br i1 %13, label %if_then, label %if_end

if_then:
  store i32 %12, i32* %8, align 4
  store i32 %9, i32* %11, align 4
  br label %if_end

if_end:
  %14 = add nsw i32 %5, 1 ; j = j + 1
  br label %inner_loop_cond

inner_loop_end:
  %15 = add nsw i32 %2, 1 ; i = i + 1
  br label %outer_loop_cond

outer_loop_end:
  ret void
}

; ============================================================================
; main 函数定义 (此函数无误，保持不变)
; ============================================================================
define i32 @main() {
entry:
  %0 = alloca i32, align 4
  %1 = getelementptr inbounds [50001 x i32], [50001 x i32]* @data_array, i64 0, i64 0
  %2 = call i32 @getarray(i32* %1)
  store i32 %2, i32* %0, align 4
  %3 = load i32, i32* %0, align 4
  call void @bubble_sort(i32* %1, i32 %3)

  ret i32 0
}