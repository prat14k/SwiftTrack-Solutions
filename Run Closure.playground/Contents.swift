//: Playground - noun: a place where people can play

import Foundation

typealias ClosureType = () -> ()

func logger(closure : ClosureType) {
    print("Running MyFunc")
    closure()
    print("MyFunc Done!")
}



logger {
    print("Function Execution in progress")
}