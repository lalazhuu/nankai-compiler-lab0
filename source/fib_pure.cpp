// fib_pure.cpp
// 将 cout 从循环内移到循环外，创建一个“纯净”的计算循环。
// 用于对比观察有无副作用时，循环优化的差异。

#include <iostream>

int main() {
    int a = 0, b = 1, i = 1, t,n;

    // 从用户获取项数
    std::cin >> n;
    
    // 循环中只进行计算，没有任何I/O
    while (i < n) {
        t = b;
        b = a + b;
        a = t;
        i = i + 1;
    }

    // 所有计算完成后，只打印最终结果
    std::cout << b << std::endl;

    return 0;
}