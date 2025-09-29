# bubble_sort_no_output.s
# 功能: 实现冒泡排序算法，仅读取和排序，不输出结果，用于性能基准测试。

# --- 数据段 ---
.section .bss
.align 3                # 8字节对齐
.globl data_array       # 声明为全局符号
data_array:
    .space 200000       # 为50000个int分配空间

# --- 代码段 ---
.section .text
.globl main

# --- main 函数 ---
# 功能: 读取数据, 调用排序
main:
    # --- 函数序言 ---
    addi sp, sp, -16    # 分配16字节栈帧，为 ra 和 n 预留空间。
    sd   ra, 8(sp)      # 保存返回地址，将 ra 寄存器（64位）的值存入栈上 sp+8 的位置。

    # --- n = getarray(data_array) ---
    lla  a0, data_array # 参数1: 数组地址，将全局数组 data_array 的地址加载到 a0 寄存器。
    call getarray       # 调用getarray, 返回值 n 在 a0 中
    sd   a0, 0(sp)      # 将 getarray 的返回值 n (在a0中) 存入栈上 sp+0 的位置。

    # --- bubble_sort(data_array, n) ---
    lla  a0, data_array # 参数1: 数组地址，再次加载 data_array 的地址到 a0，准备传给 bubble_sort。
    ld   a1, 0(sp)      # 参数2: 从栈上 sp+0 的位置加载 n 的值到 a1 寄存器。
    call bubble_sort

    # --- [已移除] putarray(n, data_array) ---
    # ld   a0, 0(sp)
    # lla  a1, data_array
    # call putarray

    # --- return 0 ---
    li   a0, 0          # 设置返回值为 0

    # --- 函数尾声 ---
    ld   ra, 8(sp)      # 恢复返回地址，从栈上 sp+8 将之前保存的 ra 值加载回 ra 寄存器。
    addi sp, sp, 16     # 释放栈帧，将栈指针 sp 恢复原位
    ret                 # 返回，跳转到 ra 寄存器中的地址，结束 main 函数。

# --- bubble_sort 函数 ---
.globl bubble_sort
bubble_sort:
    # --- 函数序言 ---
    addi sp, sp, -48    # 分配栈帧
    sd   ra, 40(sp)     # 把ra的值入栈，返回地址
    sd   s0, 32(sp)     # 把s0的值入栈，arr地址
    sd   s1, 24(sp)     # 把s1的值入栈，len
    sd   s2, 16(sp)     # 把s2的值入栈，数组下标i
    sd   s3, 8(sp)      # 把s3的值入栈，数组下标j

    # 将参数移动到 s 寄存器
    mv   s0, a0         # 将传入的arr地址存入s0
    mv   s1, a1         # 将传入的len存入s1

    # i = 0
    li   s2, 0          # 将下标i初始化为0

.L_outer_loop_start:
    # while (i < len - 1)
    addi t0, s1, -1     # 计算边界: t0 = len - 1
    bge  s2, t0, .L_outer_loop_end

    #   j = 0
    li   s3, 0          # 将下标j初始化为0

.L_inner_loop_start:
    #   while (j < len - 1 - i)
    sub  t1, t0, s2     # 计算内循环边界: t1 = (len - 1) - i
    bge  s3, t1, .L_inner_loop_end

    #     if (arr[j] > arr[j + 1])
    slli t2, s3, 2      # 地址计算1: t2 = j * 4 (字节偏移)
    add  t2, s0, t2     # 地址计算2: t2 = base_addr + j * 4 (得到 arr[j] 的地址)
    addi t3, s3, 1      # 地址计算3: t3 = j + 1
    slli t3, t3, 2      # 地址计算4: t3 = (j + 1) * 4
    add  t3, s0, t3     # 地址计算5: t3 = base_addr + (j + 1) * 4 (得到 arr[j+1] 的地址)
    lw   t4, 0(t2)      # 加载 arr[j]: 从内存加载 arr[j] 的值到 t4
    lw   t5, 0(t3)      # 加载 arr[j+1]: 从内存加载 arr[j+1] 的值到 t5

    ble  t4, t5, .L_skip_swap

    #       交换
    sw   t5, 0(t2)      # 存储1 (交换): 将 arr[j+1] 的值写入 arr[j] 的内存位置
    sw   t4, 0(t3)      # 存储2 (交换): 将 arr[j] 的值写入 arr[j+1] 的内存位置

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
    ld   ra, 40(sp)
    ld   s0, 32(sp)
    ld   s1, 24(sp)
    ld   s2, 16(sp)
    ld   s3, 8(sp)
    addi sp, sp, 48
    ret
