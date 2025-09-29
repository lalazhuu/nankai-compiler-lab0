# bubble_sort_rescheduled.s
# 版本: v4 - 手动指令重排版
# 优化: 尝试将指针递增指令提前，以填补内存加载延迟。

# --- (数据段和 main 函数与之前完全相同) ---
.section .bss
.align 3                
.globl data_array       
data_array:
    .space 200000       
.section .text
.globl main
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

# --- bubble_sort 函数 (手动指令重排版) ---
.globl bubble_sort
bubble_sort:
    li   a4, 1
    ble  a1, a4, .L_final_end
    addi a3, a1, -1     
    slli a3, a3, 2      
    add  a3, a0, a3     
    mv   a2, a0         

.L_outer_loop_start:
    mv   a2, a0         

.L_inner_loop_start:
    bgeu a2, a3, .L_inner_loop_end

    # --- 指令重排 ---
    lw   a4, 0(a2)      # 加载 *p_j
    lw   a5, 4(a2)      # 加载 *(p_j + 4)

    # **关键！** 将指针移动指令提前到这里！
    # 这条指令不依赖 lw 的结果，可以和内存访问并行执行。
    addi a2, a2, 4      # p_j++ (提前执行)

    # 现在，CPU在等待 lw 完成时，可以先去执行上面的 addi 指令。
    ble  a4, a5, .L_skip_swap

    # 交换。注意，现在需要用 p_j 的旧值来存储。
    # p_j 的旧值可以通过 (a2 - 4) 得到。
    sw   a5, -4(a2)     # 存入 *(p_j_new - 4)，即 *p_j_old
    sw   a4, 0(a2)      # 存入 *p_j_new，即 *(p_j_old + 4)

.L_skip_swap:
    j    .L_inner_loop_start

.L_inner_loop_end:
    addi a3, a3, -4
    bgtu a3, a0, .L_outer_loop_start

.L_final_end:
    ret
    