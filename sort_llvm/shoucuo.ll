; === shoucuo.ll (最终修正版：严格遵守SSA) ===
target triple = "riscv64"
@data_array = common global [50001 x i32] zeroinitializer, align 4
declare i32 @getarray(i32*)

define i32 @main() {
entry:
  %0 = alloca i32, align 4
  %1 = getelementptr inbounds [50001 x i32], [50001 x i32]* @data_array, i64 0, i64 0
  %2 = call i32 @getarray(i32* %1)
  store i32 %2, i32* %0, align 4
  %3 = load i32, i32* %0, align 4
  br label %outer_loop_cond

outer_loop_cond:
  %4 = phi i32 [ 0, %entry ], [ %17, %inner_loop_end ]
  %5 = sub nsw i32 %3, 1
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %outer_loop_body, label %final_ret

outer_loop_body:
  br label %inner_loop_cond

inner_loop_cond:
  %7 = phi i32 [ 0, %outer_loop_body ], [ %16, %if_end ]
  %8 = sub nsw i32 %5, %4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %inner_loop_body, label %inner_loop_end

inner_loop_body:
  %10 = getelementptr inbounds i32, i32* %1, i32 %7
  %11 = load i32, i32* %10, align 4
  %12 = add nsw i32 %7, 1
  %13 = getelementptr inbounds i32, i32* %1, i32 %12
  %14 = load i32, i32* %13, align 4
  %15 = icmp sgt i32 %11, %14
  br i1 %15, label %if_then, label %if_end

if_then:
  store i32 %14, i32* %10, align 4
  store i32 %11, i32* %13, align 4
  br label %if_end

if_end:
  ; j+1 的结果必须赋给一个新的寄存器 %16
  %16 = add nsw i32 %7, 1
  br label %inner_loop_cond

inner_loop_end:
  ; i+1 的结果必须赋给一个新的寄存器 %17
  %17 = add nsw i32 %4, 1
  br label %outer_loop_cond

final_ret:
  ret i32 0
}