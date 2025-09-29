import sys

# --- 可配置的参数 ---
# 你可以修改这个数字来生成不同规模的测试数据
# 500 对于 bubble sort 已经能产生明显的耗时了
NUM_ELEMENTS = 50000

# --- 脚本主逻辑 ---
# 第一行输出：要排序的元素总数
print(NUM_ELEMENTS)

# 接下来输出 N 到 1 的数字序列，用空格隔开
# 这构成了冒泡排序的最坏情况
numbers = [str(i) for i in range(NUM_ELEMENTS, 0, -1)]
print(" ".join(numbers))
