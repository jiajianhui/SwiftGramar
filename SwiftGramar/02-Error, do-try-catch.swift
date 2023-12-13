//
//  02-Error, do-try-catch.swift
//  SwiftGramar
//
//  Created by 贾建辉 on 2023/12/13.
//

import Foundation
import SwiftUI

struct Ssse: View {
    
    
    var body: some View {
        Text("1")
    }
    
    
    //验证密码是否满足长度函数
    //可能抛出错误，运行该函数时，使用do-try-catch
    //如果一个函数声明它会抛出错误，调用它时必须用try关键字。此外，如果一个函数声明它会抛出错误，它的返回值类型应该是Void或者一个可选类型，而非 Bool
    func validatePassword(_ password: String) throws -> Bool {
        if password.count < 6 {
            throw PasswordError.notLongEnough
        }
        return true
    }
    
    
    //创建密码错误
    enum PasswordError: Error {
        case notLongEnough
    }
    
    
    //01- try
    func check1() {
        do {
            let result = try validatePassword("9874")
            print("密码有效\(result)")
        } catch PasswordError.notLongEnough {  //捕获了 PasswordError.notLongEnough 错误
            print("密码至少需要6位")
        } catch {  //上面只捕获了 PasswordError.notLongEnough 错误，但是还有其他可能的错误未被捕获；添加一个通用的catch，必须捕获所有可能的错误
            print("发生未知错误")
        }
    }
    
    
    //02- tyr?
    func check2() {
        if let reuslt = try? validatePassword("1232") {  //如果函数报错，try?会返回nil
            print("密码有效\(reuslt)")
        } else {
            print("密码无效")
        }
    }
    
    
    //03- try!
    func check3() {
        try! validatePassword("1111111")  //强制运行函数，彻底忽视错误
    }
    
    
    
}



