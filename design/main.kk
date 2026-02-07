// 不包含export module 语句的模块为匿名模块，不可导出任何符号，只可导入

// char byte short int long

import math;    // 导入add和mul两个符号

// 对于可导出符号的模块 允许导入再导出语句 export import math;

// 没有写出的返回类型 当作auto处理
simple_var_statement()
{
    const ten = 10;     // int
    const pi = 3.14;    // double
    const pi2 = float(3.14); // float
    // const的语义为不可变变量  TODO: 编译期计算先不考虑，让实现能简单一些

    let a = 3;
    let uninit_a = int();
    // 默认允许非初始化的变量，但使用是UB行为。 但提供关掉该方式的编译选项
}

main()      // main函数不写返回类型
{
    simple_array_and_tuple_state(); // main可以看到下方的array_and_tuple_state符号
}

simple_array_and_tuple_state()
{
    let arr = [int; 10]{}; // uninit array
    let brr = [int; 10]{ 0 }; // init array
    // 允许非初始化的数组
    // 使用未初始化的值应当直接作为编译报错处理
    let a = 2;
    let b = 4;
    let c = add(a,b);
    // let的语义为可变变量

    let tuple = (int,double,short,[int; 3]){}; // 未初始化元组
    let t2 = (int,[int; 3]){ 4,{ 1,2,3 } };

    // 允许类似CRTP的行为
    let t3 = (1,2,3,(1,2),[3,4,5]);
    let t4 = (int(2), 3, [int; 2]{ 1,2 });
    let a2 = [1,2,3];
    let a3 = [(1,2),(3,4),(5,6)];
    // 对于数组，类型统一提升到common(如果允许)

    // 可组合
}

branch_state() -> void // 声明无返回值
{
    // TODO
}