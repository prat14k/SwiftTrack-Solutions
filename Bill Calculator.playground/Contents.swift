//: Playground - noun: a place where people can play

import Foundation


extension Array where Element: Equatable {
    @discardableResult
    mutating func delete(element: Element) -> Element? {
        guard let index = self.index(of: element)  else { return nil }
        return self.remove(at: index)
    }
}


enum CartItemError: Error {
    case negativeValueForQuantityPassed(String)
    case countValueGreaterThanQuantity(String)
}

enum CartError: Error {
    case negativeUpdateForQuantityPassed(String)
    case itemNotFound
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


extension CartItem: Equatable {
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        return lhs.productID == rhs.productID
    }
}


extension CartItem {
    
    public static func create(product: Product, quantity: Int = 1) throws -> CartItem {
        guard quantity > 0  else { throw CartItemError.negativeValueForQuantityPassed("The number of \(product.name) \(product.category.name.lowercased())'s to be added should be greater than 0") }
        return CartItem(product: product, quantity: quantity)
    }
    
    func updateTo(quantity: Int) {
        self.quantity = quantity
    }
    
}



class Cart {
    
    private var cartItems = [CartItem]()   // For storing the cartItems
    
    private init() { }
    
    public static let cart = Cart()
    
}

extension Cart {
    
    func findItem(id: UUID) -> CartItem?{
        return cartItems.first { $0.productID == id }
    }
    
    func indexForItem(id: UUID) -> Int?{
        return cartItems.enumerated().filter { $0.element.productID == id }.map({ $0.offset }).first
    }
    
}

extension Cart {
    
    func add(product: Product, count: Int = 1) throws {
        let id = product.id
        guard count > 0  else { throw CartError.negativeUpdateForQuantityPassed("The number of \(product.name) \(product.category.name.lowercased())'s to be added should be greater than 0") }
        
        if let item = findItem(id: id) {
            item.updateTo(quantity: (item.quantity + count))
        } else {
            cartItems.append(try CartItem.create(product: product, quantity: count))
        }
    }
    
    func remove(product: Product, count: Int = 1) throws {
        let id = product.id
        
        guard let item = findItem(id: id)  else { throw CartError.itemNotFound }
        guard count > 0  else { throw CartError.negativeUpdateForQuantityPassed("The number of \(product.name) \(product.category.name.lowercased())'s to be removed should be greater than 0") }
        guard item.quantity >= count  else { throw CartItemError.countValueGreaterThanQuantity("The number of \(product.name) \(product.category.name.lowercased())'s to be removed should be less than the current quantity(i.e. \(item.quantity))") }
        
        if item.quantity == count {
            cartItems.delete(element: item)
        } else {
            item.updateTo(quantity: item.quantity - count)
        }
        
    }
    
    func clear() {
        cartItems.removeAll()
    }
    
}


extension Cart {
    
    func calculateBill() {
        print("\nFinal Bill Reciept:- \n")
        
        var finalBill: Double = 0.0
        
        cartItems.forEach { (item) in
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
catch CartError.negativeUpdateForQuantityPassed(let errorDescription) {
    print(errorDescription)
}
catch CartItemError.countValueGreaterThanQuantity(let errorDescription) {
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
catch CartError.negativeUpdateForQuantityPassed(let errorDescription) {
    print(errorDescription)
}
catch CartItemError.countValueGreaterThanQuantity(let errorDescription) {
    print(errorDescription)
}
catch CartError.itemNotFound {
    print("The item is not been added to the cart.")
}


Cart.cart.calculateBill()
