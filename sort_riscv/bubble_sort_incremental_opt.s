# bubble_sort_final_opt.s
# 功能: 实现冒泡排序算法。
# 版本: v3 - 终极手动优化版
# 核心精神: 汲取GCC -O2的完全指针化和递减循环边界思想，但保持人类可读的结构。

# --- 数据段 ---
.section .bss
.align 3                
.globl data_array       
data_array:
    .space 200000       

# --- 代码段 ---
.section .text
.globl main

# --- main 函数 ---
# (此部分保持原样)
main:
    addi sp, sp, -16    
    sd   ra, 8(sp)      
    lla  a0, data_array 
    call getarray       
    sd   a0, 0(sp)      
    lla  a0, data_array 
    ld   a1, 0(sp)      
    call bubble_sort
    li   a0, 0          
    ld   ra, 8(sp)      
    addi sp, sp, 16     
    ret                 

# --- bubble_sort 函数 (终极手动优化版) ---
# 寄存器规划:
#   a0: arr 地址 (传入)
#   a1: len (传入)
#   a2: 内层循环的当前指针 (p_j)
#   a3: 内层循环的结束指针 (end_ptr_inner)
#   a4, a5: 用于加载和交换的临时寄存器
.globl bubble_sort
bubble_sort:
    # --- 边界情况优化 (从GCC学来) ---
    li   a4, 1
    ble  a1, a4, .L_final_end # if (len <= 1), 直接返回

    # --- 1. 计算初始的内层循环结束指针 ---
    # end_ptr_inner = arr + (len - 1) * 4
    addi a3, a1, -1     # a3 = len - 1
    slli a3, a3, 2      # a3 = (len - 1) * 4
    add  a3, a0, a3     # a3 = arr + (len - 1) * 4

.L_outer_loop_start:
    # --- 2. 初始化内层循环的当前指针 ---
    # p_j = arr
    mv   a2, a0         # a2 = p_j

.L_inner_loop_start:
    # --- 3. 内层循环判断: while (p_j < end_ptr_inner) ---
    bgeu a2, a3, .L_inner_loop_end # 使用无符号比较地址

    #     if (*p_j > *(p_j + 4))
    lw   a4, 0(a2)      # a4 = *p_j
    lw   a5, 4(a2)      # a5 = *(p_j + 4)

    ble  a4, a5, .L_skip_swap

    #       交换
    sw   a5, 0(a2)      # *p_j = a5
    sw   a4, 4(a2)      # *(p_j + 4) = a4

.L_skip_swap:
    #     移动指针到下一个元素
    addi a2, a2, 4      # p_j++
    j    .L_inner_loop_start

.L_inner_loop_end:
    # --- 4. 外层循环的体现: 递减内层循环的结束指针 ---
    # end_ptr_inner = end_ptr_inner - 4
    addi a3, a3, -4
    
    # --- 5. 外层循环判断: while (end_ptr_inner > arr) ---
    bgtu a3, a0, .L_outer_loop_start # 只要结束指针还在数组内，就继续

.L_final_end:
    ret                 # 完美收官
    