export module math;     // 一个文件对应一个模块

// 内部可见性：在 module math 内部，math.xxx.yyy 的子模块/符号在名字解析阶段总是可见（因为它们属于同一个 module tree）。
// 外部可见性：在 module foo 中 import math 之后，foo 只能访问 math 的“公开表面”：
// math 自己公开导出的符号（函数/常量/类型）
// 以及 math 显式导出的子模块（比如 export module math.xxx;），并且递归地只有被导出的子模块链路才可见
// math 可以 export import other; 把别的模块挂到自己的公开表面（re-export），外部通过 math.other... 访问
// 实现上就是：每个模块维护两张符号表：private（给自身/子模块用）和 public（给外部用）。export 只影响 public 表。
// import math 只把 math.public 挂到当前作用域下的一个名字 math，而不是把整棵树“拍扁”到当前命名空间。

// 导出任何被export的符号

// 不写的变量参数 当作auto处理
export add(a: int,b) -> int
{
    return a + b;
}

// Type 相当于 一个泛型参数 约束为typename级别(也就是无)
// 如果需要引用该泛型参数的类型，可以给其赋予一个名字
// 不写的返回类型 也当作auto处理
export mul(x,y)
{
    ret = x * y;
    return ret;
}

// 泛型参数在名字的后面用<>指出，对泛型名字的类型声明语义为约束(concept)
export del<T, U: Integer>(x: T,y: U)
{
    return x / y;
}