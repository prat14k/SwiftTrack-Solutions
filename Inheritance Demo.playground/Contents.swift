//: Playground - noun: a place where people can play

import Foundation


class Vehicle {
    
    let name : String
    private(set) var price : Double
    
    init(name: String, price: Double) {
        self.name = name.isEmpty ? "Vehicle" : name       // Can make compulsory for non Empty name by making it a failable initializer.
        self.price = (price > 0) ? price : 0        // Can make compulsory for non negative price by making it a failable initializer.
    }
    
    // Mutator Method
    func changeVehiclePrice(newPrice : Double) {
        if newPrice < 0 {
            return
        }
        // Extra Checks if needed
        
        price = newPrice
    }
    
    var description : String {  return "The \(name) is currently available in showrooms for the price \(price) units."  }
    
}


class Bike : Vehicle {
    
    let dealer : String
    
    init(dealer: String, name: String, price: Double) {
        self.dealer = dealer.isEmpty ? "Dealer" : dealer    // Can make compulsory for non Empty dealer by making it a failable initializer.
        super.init(name: name, price: price)
    }
    
    override var description: String {  return "The \(name) is currently available at \(dealer)'s showrooms for the price \(price) units."  }
    
}



var kawasaki = Bike(dealer: "Suzuki", name: "Kawasaki", price: 1_00_000)
print(kawasaki.description)
kawasaki.changeVehiclePrice(newPrice: 1_50_000)
print(kawasaki.description)



