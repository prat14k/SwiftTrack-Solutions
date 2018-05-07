//: Playground - noun: a place where people can play

import Foundation


class FibonacciSeries {
    
    private var firstNumber, secondNumber : Int
    
    init(firstNumber: Int, secondNumber: Int){
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        
        cacheSeries.append(firstNumber)
        cacheSeries.append(secondNumber)
    }
    
    var cacheSeries = [Int]()
    
    func nThFibonacciNumber(_ N: Int) -> Int{
        
        if N < 1 {
            assert(false)
        }
        
        
        if (N-1) < cacheSeries.count {
            return cacheSeries[N-1]
        }
        
        var previousValue : Int = secondNumber
        var valueBeforePreviousValue : Int = firstNumber
        var currentValue : Int = 0
        
        for _ in cacheSeries.count...N {
            currentValue = valueBeforePreviousValue + previousValue
            
            cacheSeries.append(currentValue)
            
            valueBeforePreviousValue = previousValue
            previousValue = currentValue
        }
        
        return currentValue
    }
    
}

let fibonacciSeriesObj = FibonacciSeries(firstNumber: 1, secondNumber: 1)


// Will create overflow problem when N > 90

print(fibonacciSeriesObj.nThFibonacciNumber(10))
print(fibonacciSeriesObj.nThFibonacciNumber(20))
print(fibonacciSeriesObj.nThFibonacciNumber(90))
