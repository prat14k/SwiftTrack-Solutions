//: Playground - noun: a place where people can play

import Foundation


final class PrimeNumbers {
    
    static func printfirstPrimeNumber(_ count: Int){
        
        var firstNPrimesCounter = count
        
        if count <= 0 {
            return
        }
        
        // As 2 is a prime number
        print(2)
        firstNPrimesCounter -= 1
        if count == 1 {
            return
        }
        
        var currentVal = 3
        while firstNPrimesCounter > 0 {
            
            let checkingValue = (currentVal/2)
            
            var isPrime = true
            if checkingValue >= 2 {
                for i in 2...checkingValue {
                    if currentVal % i == 0 {
                        isPrime = false
                        break
                    }
                }
            }
            
            if isPrime {
                print(currentVal)
                firstNPrimesCounter -= 1
            }
            currentVal += 1
        }
        
    }
    
    
    private init() { }
}



PrimeNumbers.printfirstPrimeNumber(7)
