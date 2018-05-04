//: Playground - noun: a place where people can play

import Foundation

class CustomerAccount {
    
    static private var accountHoldersIncrementer: Int = 0
    
    var name : String
    var accountNumber : Int
    
    private var balance: Double = 1_000
    
    init(_ name: String) {
        self.name = name
        self.accountNumber = CustomerAccount.accountHoldersIncrementer
        
        CustomerAccount.accountHoldersIncrementer += 1
    }
    
    var description : String {
        return "\(name) with Account Number: \(accountNumber) has balance of \(balance)"
    }
    
    func getBalance() -> Double {
        return balance
    }
}


extension CustomerAccount {
    
    func deposit(_ value: Double) -> Bool {
        if value < 0 {
            return false
        }
        
        balance = balance + value
        return true
    }
    
    func withdraw(_ amount: Double) -> Bool {
        if balance < amount {
            return false
        }
        
        balance = balance - value
    }
}





