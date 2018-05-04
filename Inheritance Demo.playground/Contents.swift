//: Playground - noun: a place where people can play

import UIKit


class Vehicle {
    
    let name : String
    private var price : Int
    
    init(vehicleName: String, price: Int) {
        name = vehicleName
        self.price = price
    }
    
    //Accessor function
    func getVehiclePrice() -> Int {
        return price
    }
    
    // Mutator Method
    func changeVehiclePrice(newPrice : Int) {
        price = newPrice
    }
    
    var description : String {
        get {
            return "The \(name) is currently available in showrooms for the price \(price) units."
        }
    }
}


class Bike : Vehicle {
    
    private let dealer : String
    
    init(dealerName: String, vehicleName: String, price: Int) {
        dealer = dealerName
        super.init(vehicleName: vehicleName, price: price)
    }
    
    override var description: String {
        get {
            return "The \(name) is currently available at \(dealer)'s showrooms for the price \(getVehiclePrice()) units."
        }
    }
    
    
    //Accessor function
    func getDealerName() -> String {
        return dealer
    }
    
}



var kawasaki = Bike(dealerName: "Suzuki", vehicleName: "Kawasaki", price: 1_00_000)

print(kawasaki.description)

kawasaki.changeVehiclePrice(newPrice: 1_50_000)

print(kawasaki.description)



