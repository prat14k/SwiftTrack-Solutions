//: Playground - noun: a place where people can play

import Foundation


final class PrimeNumbers {
    
    static func printfirstPrimeNumber(_ count: Int){
        
        var firstNPrimesCounter = count
        
        if count <= 0 {
            return
        }
        
        var primeNumbers = [Int]()
        
        // As 2 is a prime number
        print(2)
        primeNumbers.append(2)
        
        firstNPrimesCounter -= 1
        if count == 1 {
            return
        }
        
        
        var currentVal = 3
        while firstNPrimesCounter > 0 {
            
            var isPrime = true
            
            for i in primeNumbers {
                if currentVal % i == 0 {
                    isPrime = false
                    break
                }
            }
            
            if isPrime {
                print(currentVal)
                primeNumbers.append(currentVal)
                firstNPrimesCounter -= 1
            }
            currentVal += 1
        }
        
    }
    
    
    private init() { }
}


// Will create problems after 10000
PrimeNumbers.printfirstPrimeNumber(10)
