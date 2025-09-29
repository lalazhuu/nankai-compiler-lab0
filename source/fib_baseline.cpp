// fib_baseline.cpp
// 原始的斐波那契代码，带 cin 和循环内 cout。
// 作为所有对比的基准。

#include <iostream>

int main() {
    // 初始化
    int a = 0, b = 1, i = 1, t,n;

    // 从用户获取项数
    std::cin >> n;

    // 打印前两项
    std::cout << a << std::endl;
    std::cout << b << std::endl;

    // 在循环中计算并打印每一项
    while (i < n) {
        t = b;
        b = a + b;
        a = t;
        i = i + 1;
        std::cout << b << std::endl; // I/O操作在循环内部
    }

    return 0;
}