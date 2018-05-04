//: Playground - noun: a place where people can play

import Foundation


class FibonacciSeries {
    
    private var firstNumber, secondNumber : Int
    
    init(firstNumber: Int, secondNumber: Int){
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }
    
    func printFibonacciSeries(firstN N: Int){
        
        if N < 1 {
            return
        }
        else {
            print(firstNumber)
            if N < 2 {
                return
            }
            else {
                print(secondNumber)
                if N == 2 {
                    return
                }
            }
        }
        
        var previousValue : Int = secondNumber
        var valueBeforePreviousValue : Int = firstNumber
        var currentValue : Int
        
        for _ in 1...N-2 {
            currentValue = valueBeforePreviousValue + previousValue
            print(currentValue)
            
            valueBeforePreviousValue = previousValue
            previousValue = currentValue
        }
    }
    
}


FibonacciSeries(firstNumber: 1, secondNumber: 1).printFibonacciSeries(firstN: 10)