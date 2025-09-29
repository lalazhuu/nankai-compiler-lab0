# bubble_sort.s
# 功能: 实现冒泡排序算法

# --- 数据段 ---
.section .bss
.align 3                # 8字节对齐
.globl data_array       # 声明为全局符号
data_array:
    .space 200000          # 为100个int分配空间 (100 * 4 bytes)

# --- 代码段 ---
.section .text
.globl main

# --- main 函数 ---
# 功能: 读取数据, 调用排序, 打印结果
main:
    # --- 函数序言 ---
    addi sp, sp, -16    # 分配16字节栈帧
    sd   ra, 8(sp)      # 保存返回地址

    # --- n = getarray(data_array) ---
    lla  a0, data_array # 参数1: 数组地址
    call getarray       # 调用getarray, 返回值 n 在 a0 中
    sd   a0, 0(sp)      # 将 n 保存到栈上

    # --- bubble_sort(data_array, n) ---
    lla  a0, data_array # 参数1: 数组地址
    ld   a1, 0(sp)      # 参数2: 从栈加载 n
    call bubble_sort

    # --- putarray(n, data_array) ---
    ld   a0, 0(sp)      # 参数1: 从栈加载 n
    lla  a1, data_array # 参数2: 数组地址
    call putarray

    # --- return 0 ---
    li   a0, 0          # 设置返回值为 0

    # --- 函数尾声 ---
    ld   ra, 8(sp)      # 恢复返回地址
    addi sp, sp, 16     # 释放栈帧
    ret                 # 返回

# --- bubble_sort 函数 ---
# 参数: a0 = arr[] (地址), a1 = len (整数)
# 使用的 s 寄存器: s0=arr, s1=len, s2=i, s3=j
.globl bubble_sort
bubble_sort:
    # --- 函数序言 ---
    addi sp, sp, -48    # 分配48字节栈帧
    sd   ra, 40(sp)     # 保存 ra
    sd   s0, 32(sp)     # 保存 s0
    sd   s1, 24(sp)     # 保存 s1
    sd   s2, 16(sp)     # 保存 s2
    sd   s3, 8(sp)      # 保存 s3

    # 将参数移动到 s 寄存器
    mv   s0, a0         # s0 = arr base address
    mv   s1, a1         # s1 = len

    # i = 0
    li   s2, 0          # s2 = i = 0

.L_outer_loop_start:
    # while (i < len - 1)
    addi t0, s1, -1     # t0 = len - 1 (外层循环边界)
    bge  s2, t0, .L_outer_loop_end # if (i >= len - 1) goto end

    #   j = 0
    li   s3, 0          # s3 = j = 0

.L_inner_loop_start:
    #   while (j < len - 1 - i)
    # --- 修正点 ---
    # 使用 t1 作为内层循环的边界，避免破坏 t0
    sub  t1, t0, s2     # t1 = (len - 1) - i 
    bge  s3, t1, .L_inner_loop_end # if (j >= len - 1 - i) goto end

    #     if (arr[j] > arr[j + 1])
    #     计算 arr[j] 的地址
    slli t2, s3, 2      # t2 = j * 4 (byte offset)
    add  t2, s0, t2     # t2 = addr(arr[j])
    #     计算 arr[j+1] 的地址
    addi t3, s3, 1      # t3 = j + 1
    slli t3, t3, 2      # t3 = (j + 1) * 4
    add  t3, s0, t3     # t3 = addr(arr[j+1])
    #     加载值
    lw   t4, 0(t2)      # t4 = arr[j]
    lw   t5, 0(t3)      # t5 = arr[j+1]

    ble  t4, t5, .L_skip_swap # if (arr[j] <= arr[j+1]) skip

    #       交换
    sw   t5, 0(t2)      # arr[j] = arr[j+1]
    sw   t4, 0(t3)      # arr[j+1] = arr[j]

.L_skip_swap:
    #     j = j + 1
    addi s3, s3, 1
    j    .L_inner_loop_start

.L_inner_loop_end:
    #   i = i + 1
    addi s2, s2, 1
    j    .L_outer_loop_start

.L_outer_loop_end:
    # --- 函数尾声 ---
    ld   ra, 40(sp)     # 恢复 ra
    ld   s0, 32(sp)     # 恢复 s0
    ld   s1, 24(sp)     # 恢复 s1
    ld   s2, 16(sp)     # 恢复 s2
    ld   s3, 8(sp)      # 恢复 s3
    addi sp, sp, 48     # 释放栈帧
    ret                 # 返回
