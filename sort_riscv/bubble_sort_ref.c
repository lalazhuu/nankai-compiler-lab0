// bubble_sort_ref.c
// 用于生成高度优化的 RISC-V 汇编参考

// SysY 运行时库函数的外部声明
// 我们需要告诉C编译器这些函数存在，但不需要头文件
extern int getarray(int a[]);
extern void putarray(int n, int a[]);

// 全局数组
int data_array[50000];

void bubble_sort(int arr[], int len) {
    int i = 0;
    int j = 0;
    int temp = 0;
    
    i = 0;
    while (i < len - 1) {
        j = 0;
        while (j < len - 1 - i) {
            if (arr[j] > arr[j + 1]) {
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
            j = j + 1;
        }
        i = i + 1;
    }
}

int main() {
    int n = 0;
    n = getarray(data_array);
    bubble_sort(data_array, n);
    // 我们在基准测试中不需要输出，所以这里注释掉
    // putarray(n, data_array);
    return 0;
}