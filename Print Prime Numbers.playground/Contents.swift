//: Playground - noun: a place where people can play

import Foundation

class PrimeNumberPrinter {
    
    private var maxCount: Int
    private var primesCollection = [Int]()
    
    private func sievePrimes() {
        
        let sqRootVal = Int(sqrt(Double(maxCount)))
        
        var isPrimesBoolCollection: [Bool] = Array(repeating: true, count: maxCount+1)
        
        primesCollection.removeAll()
        
        // As 2 is a prime number
        isPrimesBoolCollection[2] = true
        primesCollection.append(2)
        
        unPrimeMultiples(of: 2, cachedPrimeCollection: &isPrimesBoolCollection)
        
        for num in stride(from: 3, through:sqRootVal, by: 2) {
            if isPrimesBoolCollection[num] {
                primesCollection.append(num)
                
                unPrimeMultiples(of: num, cachedPrimeCollection: &isPrimesBoolCollection)
            }
        }
        
    }
    
    
    private func unPrimeMultiples(of num: Int, cachedPrimeCollection: inout [Bool]) {
        for i in stride(from: num*num, through:maxCount, by: num) {
            cachedPrimeCollection[i] = false
        }
    }
    
    
    init(maxLimit: Int) {
        maxCount = maxLimit
        sievePrimes()
    }
    
}

extension PrimeNumberPrinter {
    func printPrimeNumbers(count: Int) {
        
        var count = count
        printLoop: for primeVal in primesCollection {
            if count <= 0 {
                break printLoop
            }
            print(primeVal)
            count -= 1
        }
        print("")
    }
}



let primePrinter = PrimeNumberPrinter(maxLimit: 10000000)

primePrinter.printPrimeNumbers(count: 4)

primePrinter.printPrimeNumbers(count: 14)


