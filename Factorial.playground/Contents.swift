//: Playground - noun: a place where people can play

import Foundation


public enum FactorialErrors : String, Error {
    case NegativeValuePassed = "Negative Value Cannot be passed for factorial calculation"
    case MaxLimitCrossed = "Factorial Calculation Max Limit Crossed"
}


class Factorials {
    
    // Max Factorial Limit Allowed
    static let MAX_LIMIT = 170
    
    private static var cachedFactorials : [Double] = {
        var array: [Double] = Array(repeating: -1, count: MAX_LIMIT+1)
        array[0] = 1 // 0 Factorial
        array[1] = 1 // 1 Factorial
        array[2] = 2 // 2 Factorial
        array[3] = 6 // 3 Factorial
        array[4] = 24 // 4 Factorial
        array[5] = 120 // 5 Factorial
        
        return array
    }()
    
    private static func calculateFactorial(_ value: Int) -> Double{
        if cachedFactorials[value] != -1 {
            return cachedFactorials[value]
        }
        
        cachedFactorials[value] = (calculateFactorial(value - 1) * Double(value))
        
        return cachedFactorials[value]
    }
    
}

extension Factorials {
    static func factorialFor(_ value: Int) throws -> String {
        if value < 0 {
            throw FactorialErrors.NegativeValuePassed
        }
        else if value > 170 {
            throw FactorialErrors.MaxLimitCrossed
        }
        
        if cachedFactorials[value] != -1 {
            return String(format: "%.0f", cachedFactorials[value])
        }
        
        return String(format: "%.0f", calculateFactorial(value))
    }
}



do {
    print(try Factorials.factorialFor(6))
    print(try Factorials.factorialFor(21))
    print(try Factorials.factorialFor(10))
}
catch  {
    if let error = error as? FactorialErrors {
        print(error.rawValue)
    }
}
