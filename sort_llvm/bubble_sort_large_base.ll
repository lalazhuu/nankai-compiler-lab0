; ============================================================================
; 模块级定义 (Module-Level Definitions)
; ============================================================================

; 目标架构，与我们的编译命令 -march=rv64gc 保持一致
target triple = "riscv64"

; ============================================================================
; 全局变量定义 (Global Variable Definitions)
; ============================================================================

; 全局数组定义，保持不变
@data_array = common global [50001 x i32] zeroinitializer, align 4

; ============================================================================
; 外部函数声明 (External Function Declarations from SysY Library)
; ============================================================================

; 外部函数声明，保持不变
declare i32 @getarray(i32*)

; ============================================================================
; bubble_sort 函数定义 (使用数字寄存器)
; 参数 %0 对应 arr (i32*), %1 对应 len (i32)
; ============================================================================
define void @bubble_sort(i32* %0, i32 %1) {
entry:
  ; 在栈上为局部变量 i, j, temp 分配空间
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4

  ; --- 外部循环初始化 (i = 0) ---
  store i32 0, i32* %2, align 4
  br label %outer_loop_cond

outer_loop_cond:
  ; --- 外部循环条件检查 (while i < len - 1) ---
  %5 = load i32, i32* %2, align 4
  %6 = sub nsw i32 %1, 1
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %outer_loop_body, label %outer_loop_end

outer_loop_body:
  ; --- 内部循环初始化 (j = 0) ---
  store i32 0, i32* %3, align 4
  br label %inner_loop_cond

inner_loop_cond:
  ; --- 内部循环条件检查 (while j < len - 1 - i) ---
  %8 = load i32, i32* %3, align 4
  %9 = load i32, i32* %2, align 4
  %10 = sub nsw i32 %1, 1
  %11 = sub nsw i32 %10, %9
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %inner_loop_body, label %inner_loop_end

inner_loop_body:
  ; --- IF 条件检查 (if arr[j] > arr[j + 1]) ---
  %13 = load i32, i32* %3, align 4
  %14 = getelementptr inbounds i32, i32* %0, i32 %13
  %15 = load i32, i32* %14, align 4
  %16 = load i32, i32* %3, align 4
  %17 = add nsw i32 %16, 1
  %18 = getelementptr inbounds i32, i32* %0, i32 %17
  %19 = load i32, i32* %18, align 4
  %20 = icmp sgt i32 %15, %19
  br i1 %20, label %if_then, label %if_end

if_then:
  ; --- 交换逻辑 ---
  store i32 %15, i32* %4, align 4
  store i32 %19, i32* %14, align 4
  %21 = load i32, i32* %4, align 4
  store i32 %21, i32* %18, align 4
  br label %if_end

if_end:
  ; --- 内部循环增量 (j = j + 1) ---
  %22 = load i32, i32* %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %3, align 4
  br label %inner_loop_cond

inner_loop_end:
  ; --- 外部循环增量 (i = i + 1) ---
  %24 = load i32, i32* %2, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %2, align 4
  br label %outer_loop_cond

outer_loop_end:
  ret void
}

; ============================================================================
; main 函数定义 (使用数字寄存器)
; ============================================================================
define i32 @main() {
entry:
  ; 在栈上为局部变量 n 分配空间
  %0 = alloca i32, align 4

  ; 获取数组第一个元素的地址
  %1 = getelementptr inbounds [50001 x i32], [50001 x i32]* @data_array, i64 0, i64 0

  ; 调用 getarray, 传入指向第一个元素的指针
  %2 = call i32 @getarray(i32* %1)
  store i32 %2, i32* %0, align 4

  ; 调用 bubble_sort
  %3 = load i32, i32* %0, align 4
  call void @bubble_sort(i32* %1, i32 %3)

  
  
  ; 返回 0
  ret i32 0
}