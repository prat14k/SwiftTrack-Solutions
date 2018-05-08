//: Playground - noun: a place where people can play

import Foundation


let SALES_TAX_PERCENT: Double = 0.1
let IMPORT_TAX_PERCENT: Double = 0.05


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
    let id = UUID()    // This will be an auto-incremented integer value recieved from the server
    
    
    init(name: String, price: Double, isImported: Bool , category: Category) {
        self.name = name
        self.price = price >= 0 ? price : 0 // Can be make compulsory for non-negative price via failable inits
        self.isImported = isImported
        self.category = category
    }
    
    
    // Wanted it to not be accessible directly
    var ID : UUID  {   return id   }
    
    
    func changePrice(_ price: Double) {
        // Any Checks to be performed
        if price < 0 {
            return
        }
        self.price = price
    }
}



class CartItem {
    
    let product: Product
    private(set) var quantity: Int
    
    init(product: Product, quantity: Int = 1) {
        self.product = product
        self.quantity = max(quantity, 1)
    }
    
    var cartItemID : UUID {   return product.ID   }
    var isTaxExempted : Bool {   return product.category.isTaxExempted   }
    var isImported : Bool {   return product.isImported   }
    var price : Double {   return product.price   }
    
    var description: String {   return "\(product.name)  |  \(String(format: "%.2f", product.price))  |  \(quantity)"   }
}




extension CartItem {
    
    public static func createCartItem(product: Product, quantity: Int = 1) -> CartItem {
        return CartItem(product: product, quantity: quantity)
    }
    
    func addItems(count: Int = 1) {
        quantity = quantity + max(count, 0)
    }
    
    func removeItems(count: Int = 1) {
        if count < 0  ||  quantity < count {
            return
        }
        quantity = quantity - count
    }
    
}




class BillItems {
    
    private(set) var cartItem: CartItem
    private(set) var totalImposedTax: Double
    
    init(item: CartItem, totalImposedTax: Double) {
        self.cartItem = item
        self.totalImposedTax = max(totalImposedTax, 0)
    }
    
    var detailedInfo: String { return "\(cartItem.description)  |  \(String(format: "%.2f", totalImposedTax))" }
}




class Cart {
    
    private var cartItems = [UUID:CartItem]()   // For storing the cartItems
    
    private init() { }
    
    public static let cart = Cart()
    
}

extension Cart {
    
    func isItemInCart(id: UUID) -> Bool{
        if cartItems[id] != nil {
            return true
        }
        return false
    }
    
    private func checkItemHasQuantity(id: UUID) {
        if let cartItem = cartItems[id] {
            if cartItem.quantity < 1 {
                cartItems.removeValue(forKey: id)
            }
        }
    }
    
}

extension Cart {
    
    func add(product: Product, count: Int = 1) {
        let id = product.ID
        if isItemInCart(id: id) {
            cartItems[id]!.addItems(count: count)
        } else {
            cartItems[id] = CartItem.createCartItem(product: product, quantity: count)
        }
    }
    
    func remove(product: Product, count: Int = 1)  {
        let id = product.ID
        if isItemInCart(id: id) {
            cartItems[id]!.removeItems(count: count)
            checkItemHasQuantity(id: id)
        }
    }
    
}

extension Cart {
    
    func calculateImportTaxForItem(price: Double, isImported: Bool) -> Double {
        if isImported {
            return (price * IMPORT_TAX_PERCENT)   // 5% import tax
        }
        return 0.0
    }
    
    func calculateSalesTaxForItem(price: Double , isTaxExempted: Bool) -> Double {
        if !(isTaxExempted) {
            return (price * SALES_TAX_PERCENT)   // 10% sales tax
        }
        return 0.0
    }
    
    private func getBillItems() -> [BillItems]  {   // Can use this API for storing the billed items in db
        
        var billItems = [BillItems]()
        
        for (_ , cartItem) in cartItems {
            if cartItem.quantity > 0 {
                let salesTax = calculateSalesTaxForItem(price: cartItem.price, isTaxExempted: cartItem.isTaxExempted)
                let importTax = calculateImportTaxForItem(price: cartItem.price, isImported: cartItem.isImported)
                let totalTax = (salesTax + importTax) * Double(cartItem.quantity)
                
                billItems.append(BillItems(item: cartItem, totalImposedTax: totalTax))
            }
        }
        
        return billItems
    }
    
}

extension Cart {
    
    func calculateFinalBill() {
        print("Final Bill Reciept:- \n\n")
        
        let billedItems = getBillItems()
        
        var finalBill: Double = 0.0
        
        for item in billedItems {
            finalBill += item.cartItem.price + item.totalImposedTax
            print(item.detailedInfo)
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


Cart.cart.add(product: book1)
Cart.cart.add(product: medicine1)
Cart.cart.add(product: book1)
Cart.cart.add(product: medicine2)
Cart.cart.add(product: food2)
Cart.cart.add(product: food2)
Cart.cart.add(product: food1)
Cart.cart.add(product: food3)
Cart.cart.add(product: clothes1)
Cart.cart.add(product: gadgets3)
Cart.cart.add(product: gadgets1)


Cart.cart.remove(product: book1)

Cart.cart.calculateFinalBill()



