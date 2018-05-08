//: Playground - noun: a place where people can play
import Foundation



enum FibonacciErrors : String, Error {
    case wrongElementIndex = "Fibonacci Series Elements numbering starts from 1"
    case maxLimitCrossed = "Fibonacci Series Elements Max Limit Crossed"
}


class FibonacciSeries {
    
    private static let MAX_LIMIT = 90
    
    
    let firstNumber, secondNumber : Int
    
    init(firstNumber: Int, secondNumber: Int){
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        
        cacheSeries.append(firstNumber)
        cacheSeries.append(secondNumber)
    }
    
    var cacheSeries = [Int]()
    
}

extension FibonacciSeries {
    
    func nThFibonacciNumber(_ N: Int) throws -> Int{
        
        if N < 1 {
            throw FibonacciErrors.wrongElementIndex
        }
        if N > 90 {
            throw FibonacciErrors.maxLimitCrossed
        }
        
        if (N-1) < cacheSeries.count {
            return cacheSeries[N-1]
        }
        
        var previousValue : Int = cacheSeries[cacheSeries.count - 1]
        var valueBeforePreviousValue : Int = cacheSeries[cacheSeries.count - 2]
        var currentValue : Int = valueBeforePreviousValue + previousValue
        
        for _ in (cacheSeries.count+1)...N {
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
do {
    print(try fibonacciSeriesObj.nThFibonacciNumber(5))
    print(try fibonacciSeriesObj.nThFibonacciNumber(20))
    print(try fibonacciSeriesObj.nThFibonacciNumber(90))
}
catch {
    if let error = error as? FibonacciErrors {
        print(error.rawValue)
    }
}
