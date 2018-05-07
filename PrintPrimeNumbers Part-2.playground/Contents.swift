//: Playground - noun: a place where people can play

import Foundation



final class PrimeNumbers {
    
    static func printfirstPrimeNumber(_ count: Int) -> [Int] {
        
        var primeNumbers = [Int]()
        
        if count <= 0 {
            return primeNumbers
        }
        
        // As 2 is a prime number
        primeNumbers.append(2)
        
        var currentVal = 3
        while primeNumbers.count < count {
            
            var isPrime = true
            
            for i in primeNumbers {
                if currentVal % i == 0 {
                    isPrime = false
                    break
                }
            }
            
            if isPrime {
                primeNumbers.append(currentVal)
            }
            currentVal += 2
        }
        
        return primeNumbers
    }
    
    
    private init() { }
}



print(PrimeNumbers.printfirstPrimeNumber(1))
