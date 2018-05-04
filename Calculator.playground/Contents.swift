//: Playground - noun: a place where people can play

import UIKit


class Calculator {
    
    typealias OperationClosureType = (Double, Double) -> Double
    
    enum OperationEnum : String{
        case add = "+"
        case subtract = "-"
        case multiply = "*"
        case divide = "/"
    
        func performOperation() -> OperationClosureType {
            
            var operationClosure : OperationClosureType
            
            switch self {
            case .add:
                operationClosure = { $0 + $1 }
            case .subtract:
                operationClosure = { $0 - $1 }
            case .multiply:
                operationClosure = { $0 * $1 }
            case .divide:
                operationClosure = { (operand1, operand2) -> Double in
                    if operand2 != 0 {
                        return operand1 / operand2
                    }
                    assert(false)
                }
            }
            
            return operationClosure
        }
    
    }
    
    class func executeOperation(operand1: Double, operand2: Double, operation: String) -> Double? {
        if let operationType = OperationEnum(rawValue: operation.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return executeOperation(operand1: operand1, operand2: operand2, operation: operationType)
        }
        return nil
    }
    
    class func executeOperation(operand1: Double, operand2: Double, operation: OperationEnum) -> Double {
        return operation.performOperation()(operand1, operand2)
    }
}



print(Calculator.executeOperation(operand1: 9, operand2: 3, operation: .add))


if let result = Calculator.executeOperation(operand1: 18, operand2: 3, operation: "/") {
    print(result)
}



