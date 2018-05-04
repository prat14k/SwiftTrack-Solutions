//: Playground - noun: a place where people can play

import Foundation

func factorial(_ value: Int) -> Int{
    
    if value < 0 {
        assert(false)
    }
    else if value <= 1 {
        return 1
    }
    
    return (factorial(value - 1) * value)
}


print(factorial(4))
print(factorial(0))
print(factorial(1))
print(factorial(2))