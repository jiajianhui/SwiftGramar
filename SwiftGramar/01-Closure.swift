//
//  01-Closure.swift
//  SwiftGramar
//
//  Created by 贾建辉 on 2023/12/11.
//

import SwiftUI

struct _1_Closure: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//常规函数
func Compare(first: Int, second: Int) -> Bool {
    return first > second
}

//闭包写法1
//省略函数名、新增in语法、花括号前移；闭包类型也是函数类型
let closure = {(first: Int, second: Int) -> Bool in
    return first > second
}

//example——自定义排序
var demoNumber = [2, 90, 22, 100]
let result1 = demoNumber.sorted(by: closure)  //将闭包所在的变量作为.sorted的参数


//写法2——直接将闭包（closure）放入参数部分
let result2 = demoNumber.sorted(by: { (first: Int, second: Int) -> Bool in
    return first > second
} )


//写法3——尾部闭包写法（对于有闭包作为参数的函数，若最后一个参数Argument为闭包，可以省略括号及参数标签by）
let result3 = demoNumber.sorted { (first: Int, second: Int) -> Bool in
    return first > second
}


//写法4——在上面的基础上继续精简，因.sort函数已被定义为(Int, Int) -> Bool的闭包类型，因此闭包作为参数时，参数类型及返回类型都可省略
let result4 = demoNumber.sorted { (first, second) in
    return first > second
}


//写法5——当函数的代码块只有1行时，可以省略关键词return、参数部分的括号也可以省略
let result5 = demoNumber.sorted { first, second in first > second }


//写法6——短参数写法，当参数名称意义不大时，可省略，使用Swift提供的一些默认参数名，$0代表第一个参数，$1代表第二个参数，以此类推；在使用短参数写法时，in也可以省略
let result6 = demoNumber.sorted { $0 > $1 }
