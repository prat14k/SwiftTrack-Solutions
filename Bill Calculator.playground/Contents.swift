//: Playground - noun: a place where people can play

import Foundation


enum CartItemErrors: Error {
    case negativeItemsCountPassed(String)
    case countValueGreaterThanQuantity(String)
}


struct TaxConstants {
    static let SALES_TAX_PERCENT: Double = 0.1
    static let IMPORT_TAX_PERCENT: Double = 0.05
}

class Category {
    
    let name: String
    var isTaxExempted: Bool
    
    init(name: String, isTaxExempted: Bool) {
        self.name = name
        self.isTaxExempted = isTaxExempted
    }
    
//    func updateTaxExemption(status: Bool) {
//        // Any Checks to be performed
//        isTaxExempted = status
//    }

}


class Product {
    
    let name: String
    let isImported: Bool
    private(set) var price: Double
    let category: Category
    let id = UUID()    // This will be an auto-incremented integer value recieved from the server
    
    init?(name: String, price: Double, isImported: Bool , category: Category) {
        
        guard !name.isEmpty && price >= 0  else { return nil }
        
        self.name = name
        self.price = price
        self.isImported = isImported
        self.category = category
        
    }
    
    
    func update(price: Double) {
        // Any Checks to be performed
        guard price > 0   else  {  return  }
        self.price = price
    }
}



class CartItem {
    
    let product: Product
    private(set) var quantity: Int
    
    private init(product: Product, quantity: Int = 1) {
        self.product = product
        self.quantity = quantity
    }
    
    var productID: UUID {   return product.id   }
    var isTaxExempted: Bool {   return product.category.isTaxExempted   }
    var isImported: Bool {   return product.isImported   }
    var productPrice: Double {   return product.price   }
    
    var importTax: Double {
        if isImported {
            return (productPrice * TaxConstants.IMPORT_TAX_PERCENT)   // 5% import tax
        }
        return 0.0
    }
    
    var salesTax: Double {
        if !(isTaxExempted) {
            return (productPrice * TaxConstants.SALES_TAX_PERCENT)   // 10% sales tax
        }
        return 0.0
    }
    
    var totalImposedTax: Double {  return (importTax + salesTax) * Double(quantity)  }
    
    var descriptiveInfo: String {   return "\(product.name)  |  \(String(format: "%.2f", productPrice))  |  \(quantity)  |  \(String(format: "%.2f", totalImposedTax))"   }
}



extension CartItem {
    
    public static func create(product: Product, quantity: Int = 1) throws -> CartItem {
        guard quantity > 0  else { throw CartItemErrors.negativeItemsCountPassed("The number of \(product.name) \(product.category.name.lowercased())'s to be added should be greater than 0") }
        return CartItem(product: product, quantity: quantity)
    }
    
    @discardableResult
    func update(count: Int = 1) throws -> Bool {
        guard count > 0  else { throw CartItemErrors.negativeItemsCountPassed("The number of \(product.name) \(product.category.name.lowercased())'s to be added should be greater than 0") }
        quantity = quantity + count
        return true
    }
    
    @discardableResult
    func remove(count: Int = 1) throws -> Int {
        guard count > 0  else { throw CartItemErrors.negativeItemsCountPassed("The number of \(product.name) \(product.category.name.lowercased())'s to be removed should be greater than 0") }
        guard quantity >= count  else { throw CartItemErrors.countValueGreaterThanQuantity("The number of \(product.name) \(product.category.name.lowercased())'s to be removed should be less than the current quantity(i.e. \(quantity))") }
        quantity = quantity - count
        return quantity
    }
    
}



class Cart {
    
    private var cartItems = [UUID:CartItem]()   // For storing the cartItems
    
    private init() { }
    
    public static let cart = Cart()
    
}

extension Cart {
    
    func isInCart(id: UUID) -> Bool{
        return cartItems[id] != nil
    }
    
}

extension Cart {
    
    @discardableResult
    func add(product: Product, count: Int = 1) throws -> Bool {
        let id = product.id
        if isInCart(id: id) {
            return try cartItems[id]!.update(count: count)
        } else {
            cartItems[id] = try CartItem.create(product: product, quantity: count)
            return true
        }
    }
    
    func remove(product: Product, count: Int = 1) throws {
        let id = product.id
        if isInCart(id: id) {
            if try cartItems[id]!.remove(count: count) < 1 {
                cartItems.removeValue(forKey: id)
            }
        }
    }
    
}


extension Cart {
    
    func calculateBill() {
        print("\nFinal Bill Reciept:- \n")
        
        var finalBill: Double = 0.0
        
        for (_, item) in cartItems {
            finalBill += item.productPrice + item.totalImposedTax
            print(item.descriptiveInfo)
        }
        
        print("\nTOTAL :-   \(Int(finalBill)) units")
    }
    
    
}



// Testing Code

let bookCategory = Category(name: "Book", isTaxExempted: true)
let medicineCategory = Category(name: "Medicine", isTaxExempted: true)
let foodCategory = Category(name: "Food", isTaxExempted: true)
let clothesCategory = Category(name: "Clothes", isTaxExempted: false)
let gadgetsCategory = Category(name: "Gadgets", isTaxExempted: false)

/// Can be used checks here to know whether it is not nil. Just unwrapping it for now.
let book1 = Product(name: "b1", price: 433.1, isImported: true, category: bookCategory)!
let medicine1 = Product(name: "m1", price: 553.1, isImported: true, category: medicineCategory)!
let medicine2 = Product(name: "m2", price: 1323.1, isImported: false, category: medicineCategory)!
let food1 = Product(name: "f1", price: 9323.1211, isImported: true, category: foodCategory)!
let food2 = Product(name: "f2", price: 232.12, isImported: false, category: foodCategory)!
let food3 = Product(name: "f3", price: 233.1, isImported: true, category: foodCategory)!
let clothes1 = Product(name: "c1", price: 323.1, isImported: true, category: clothesCategory)!
let gadgets1 = Product(name: "g1", price: 223.1, isImported: true, category: gadgetsCategory)!
let gadgets2 = Product(name: "g2", price: 323.1, isImported: false, category: gadgetsCategory)!
let gadgets3 = Product(name: "g3", price: 223.1, isImported: true, category: gadgetsCategory)!


do {
    try Cart.cart.add(product: book1, count: 3)
}
catch CartItemErrors.negativeItemsCountPassed(let errorDescription) {
    print(errorDescription)
}
catch CartItemErrors.countValueGreaterThanQuantity(let errorDescription) {
    print(errorDescription)
}


 try? Cart.cart.add(product: medicine1)
 try? Cart.cart.add(product: book1)
 try? Cart.cart.add(product: medicine2)
 try? Cart.cart.add(product: food2)
 try? Cart.cart.add(product: food2, count: -43)
 try? Cart.cart.add(product: food1)
 try? Cart.cart.add(product: food3)
 try? Cart.cart.add(product: clothes1)
 try? Cart.cart.add(product: gadgets3)
 try? Cart.cart.add(product: gadgets1)


do {
    try Cart.cart.remove(product: book1, count: 4)
}
catch CartItemErrors.negativeItemsCountPassed(let errorDescription) {
    print(errorDescription)
}
catch CartItemErrors.countValueGreaterThanQuantity(let errorDescription) {
    print(errorDescription)
}


Cart.cart.calculateBill()
