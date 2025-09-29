// source/fib_const_pure.cpp
// 结合了常量输入和纯净循环的终极版本

#include <iostream>

int main() {
    const int n = 10; // 特性一：编译时常量
    
    int a = 0, b = 1, i = 1, t;

    // 特性二：纯计算循环，无副作用
    while (i < n) {
        t = b;
        b = a + b;
        a = t;
        i = i + 1;
    }

    // 只在最后打印最终结果
    std::cout << b << std::endl;

    return 0;
}