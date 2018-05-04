//: Playground - noun: a place where people can play

import Foundation

typealias IncrementClosureType = (_ x: Int) -> Int

func makeIncrementer(_ incrementAmount: Int) -> IncrementClosureType {
    
    return { (x) -> Int in
        return x + incrementAmount
    }
    
}

let tenIncrementer = makeIncrementer(10)

print(tenIncrementer(10))
print(tenIncrementer(3))