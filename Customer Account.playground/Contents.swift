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
    
    @discardableResult
    func deposit(_ value: Double) -> Bool {
        if value < 0 {
            return false
        }
        
        balance = balance + value
        return true
    }
    
    @discardableResult
    func withdraw(_ amount: Double) -> Bool {
        if balance < amount {
            return false
        }
        
        balance = balance - amount
        return true
    }
}


let customer1 = CustomerAccount("c1")
print(customer1.description)
customer1.deposit(2010.34)
print(customer1.description)
customer1.withdraw(23.1)
print(customer1.description)

let customer2 = CustomerAccount("c2")
customer2.withdraw(123.21)
print(customer2.description)



