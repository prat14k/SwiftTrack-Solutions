//: Playground - noun: a place where people can play

import Foundation


class Category {
    
    let name: String
    private(set) var isTaxExempted: Bool
    

    init(name: String, isTaxExempted: Bool) {
        self.name = name
        self.isTaxExempted = isTaxExempted
    }
    
    
    func changeTaxExemption(status: Bool) {
        // Any Checks to be performed
        isTaxExempted = status
    }
    
}


class Product {
    
    let name: String
    let isImported: Bool
    private(set) var price: Double
    let category: Category
    private let uuid = UUID()
    
    
    init(name: String, price: Double, isImported: Bool , category: Category) {
        self.name = name
        self.price = price >= 0 ? price : 0 // Can be make compulsory for non-negative price via failable inits
        self.isImported = isImported
        self.category = category
    }
    
    var description: String {
        return "\(name)  |  \(String(format: "%.2f", price))"
    }
    
    // Wanted it to not be accessible directly
    func productCode() -> UUID {
        return uuid
    }
    
    func changePrice(_ price: Double) {
        // Any Checks to be performed
        if price < 0 {
            return
        }
        self.price = price
    }
}



class ShoppingCart {
    
    private var productsCart = [UUID:Product]()   // For storing the products uniquely
    private var productsQuantity = [UUID:Int]()   // For storing the number of products each
    
    private init() { }
    
    public static let cart = ShoppingCart()
}

extension ShoppingCart {
    
    func add(product: Product) {
        let uuidCode = product.productCode()
        if productsCart[uuidCode] != nil {
            productsQuantity[uuidCode] = productsQuantity[uuidCode]! + 1
        }
        else {
            productsCart[uuidCode] = product
            productsQuantity[uuidCode] = 1
        }
    }
    
    func remove(product: Product) {
        let uuidCode = product.productCode()
        if productsCart[uuidCode] != nil {
            productsQuantity[uuidCode] = productsQuantity[uuidCode]! - 1
            if productsQuantity[uuidCode]! == 0 {
                productsQuantity.removeValue(forKey: uuidCode)
                productsCart.removeValue(forKey: uuidCode)
            }
        }
    }
    
}


extension ShoppingCart {
    
    func calculatedBill() {
        
        print("Final Bill Reciept:- \n\n")
        
        var finalBill: Double = 0.0
        
        for (uuidCode, product) in productsCart {
            if let quantity = productsQuantity[uuidCode], quantity > 0 {
                var taxPerItem: Double = 0.0
                if !(product.category.isTaxExempted) {
                    taxPerItem += product.price * 0.1   // 10% import tax
                }
                if product.isImported {
                    taxPerItem += product.price * 0.05   // 5% import tax
                }
                
                let totalTax = taxPerItem * Double(quantity)
                
                print("\(product.description)  |  \(quantity)  |  \(String(format: "%.2f", totalTax))")
                
                finalBill += totalTax + product.price
            }
        }
        
        print("TOTAL :-   \(Int(finalBill)) units")
    }
    
}


let bookCategory = Category(name: "Book", isTaxExempted: true)
let medicineCategory = Category(name: "Medicine", isTaxExempted: true)
let foodCategory = Category(name: "Food", isTaxExempted: true)
let clothesCategory = Category(name: "Clothes", isTaxExempted: false)
let gadgetsCategory = Category(name: "Gadgets", isTaxExempted: false)





let book1 = Product(name: "b1", price: 433.1, isImported: true, category: bookCategory)
let medicine1 = Product(name: "m1", price: 553.1, isImported: true, category: medicineCategory)
let medicine2 = Product(name: "m2", price: 1323.1, isImported: false, category: medicineCategory)
let food1 = Product(name: "f1", price: 9323.1211, isImported: true, category: foodCategory)
let food2 = Product(name: "f2", price: 232.12, isImported: false, category: foodCategory)
let food3 = Product(name: "f3", price: 233.1, isImported: true, category: foodCategory)
let clothes1 = Product(name: "c1", price: 323.1, isImported: true, category: clothesCategory)
let gadgets1 = Product(name: "g1", price: 223.1, isImported: true, category: gadgetsCategory)
let gadgets2 = Product(name: "g2", price: 323.1, isImported: false, category: gadgetsCategory)
let gadgets3 = Product(name: "g3", price: 223.1, isImported: true, category: gadgetsCategory)


ShoppingCart.cart.add(product: book1)
ShoppingCart.cart.add(product: medicine1)
ShoppingCart.cart.add(product: book1)
ShoppingCart.cart.add(product: medicine2)
ShoppingCart.cart.add(product: food2)
ShoppingCart.cart.add(product: food2)
ShoppingCart.cart.add(product: food1)
ShoppingCart.cart.add(product: food3)
ShoppingCart.cart.add(product: clothes1)
ShoppingCart.cart.add(product: gadgets3)
ShoppingCart.cart.add(product: gadgets1)


ShoppingCart.cart.remove(product: book1)

ShoppingCart.cart.calculatedBill()



