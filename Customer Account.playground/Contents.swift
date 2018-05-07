//: Playground - noun: a place where people can play

import Foundation

class CustomerAccount {
    
    static private var accountHoldersIncrementer: Int = 1
    
    private(set) var name : String
    let accountNumber : Int
    
    private(set) var balance: Double = 1_000
    
    init(_ name: String) {
        self.name = name.isEmpty ? "Customer" : name    // Can make compulsory for non Empty name by making it a failable initializer.
        self.accountNumber = CustomerAccount.accountHoldersIncrementer
        
        CustomerAccount.accountHoldersIncrementer += 1
    }
    
    var description : String {  return "\(name) with Account Number: \(accountNumber) has balance of \(balance)"    }
    
}


extension CustomerAccount {
    
    @discardableResult
    func deposit(_ amount: Double) -> Bool {
        if amount < 0 {
            return false
        }
        
        balance = balance + amount
        return true
    }
    
    
    @discardableResult
    func withdraw(_ amount: Double) -> Bool {
        if amount < 0 || balance < amount {
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



