//: Playground - noun: a place where people can play

//https://www.youtube.com/playlist?list=PLfOZCUzRoPfKeOS_pwpiqbdviGcCOcTYb

/*:
 
 ## Failable initializers
 
 Initializers for class, structure, or enumeration for which the initialization can fail.
 
 struct Animal {
 let species: String
 init?(species: String) {
 if species.isEmpty { return nil }
 self.species = species
 }
 }
 
 ### Propogating failable initializers
 Failable initializers can call other initializers, either from superclass or the same class. This can be helpul to handle potential threat states.
 
 ### Overriding a Failable Initializer
 A failable initializer can be overriden by either the failable initializer, or a non-failable initializer of the subclass. But a non-failable init cannot be overriden by a failable init.
 
 class Document {
 var name: String?
 // this initializer creates a document with a nil name value
 init() {}
 // this initializer creates a document with a nonempty name value
 init?(name: String) {
 if name.isEmpty { return nil }
 self.name = name
 }
 }
 class AutomaticallyNamedDocument: Document {
 override init() {
 super.init()
 self.name = "[Untitled]"
 }
 override init(name: String) {
 super.init()
 if name.isEmpty {
 self.name = "[Untitled]"
 } else {
 self.name = name
 }
 }
 }
 
 */

/*
 
 
 ## Inheriting initializers:
 
 Classes can inherit inits only in certain conditions:-
 * If a subclass is not having any designated init, all the designated init will get inherited.
 * If a subclass is having all the super class designated inits(either via inheritance or manual overriding), all the convinience inits will get inherited.
 
 Note: If we provide implementation of a superclass designated init, we are then overriding the superclass implementation. But if we are providing implementation of a superclass convenience init, then it be replacing the implementation of that init.
 
 class Food {
 var name: String
 init(name: String) {
 self.name = name
 }
 convenience init() {
 self.init(name: "[Unnamed]")
 }
 }
 
 class RecipeIngredient: Food {
 var quantity: Int
 init(name: String, quantity: Int) {
 self.quantity = quantity
 super.init(name: name)
 }
 override convenience init(name: String) {
 self.init(name: name, quantity: 1)
 }
 }
 
 class ShoppingListItem: RecipeIngredient {
 var purchased = false
 var description: String {
 var output = "\(quantity) x \(name)"
 output += purchased ? " ✔" : " ✘"
 return output
 }
 }
 
 */

//import UIKit

//var str = "Hello, playground"
//
//var arr:Set = [2.4,32,1]
//
//arr.remove(1)
//arr.insert(2.3)
//
//print(arr.sort())



//var i = 0
//print("Ds")
//
//scope1 : while i < 50 {
//    print(i)
//    scope2: switch i {
//        
//    case (0...10):
//        print("Very small")
//        break scope1
//        //        fallthrough
//    case 10...20:
//        print("smalli")
//    default:
//        break
//    }
//    
//    
//    
//    i += 3
//    print(i)
//}


//print(str, separator: "*", terminator: "$")
//
//
//enum en1 : Int {
//    case a,b,c,d
//}
//
//
//let e = en1(rawValue: 1)

//
//class a {
//    var d : Int {
//        get {
//            print("as")
//            return 3
//        }
//        set(sd) {
//            print("assd")
//        }
//    }
//}
//
//
//var o = a()
//

//
//class s {
//    lazy var d = 9 {
//        didSet {
//            
//        }
//    }
//}


//class parent {
//    var desc : String {
//        get {
//            return "parent"
//        }
//        set {
//            print(newValue)
//        }
//    }
//}
//
//class child: parent {
//    override var desc : String {
//        return "sdfdf"
//    }
//}



//class a {
////    let k : String
//    init(){
//        print("d")
////        k="@2"
//    }
//}
//
//class b : a {
//    override init(){
////        k = "sdfsdf"
//        print("Asd")
//    }
//}
//
//
//let ss = b()
//


//struct d {
//    var s : String?
//    var ss : String?
//}



//class SomeClass {
//    required init() {
//        print("sdfsdfdsf")
//    }
//}
//
//
//class SomeSubclass: SomeClass {
//    required init() {
//        print("asdsadnsad ")
//    }
//}
//
//
//let f = SomeSubclass()





//class SomeClass {
//    
//}
//
//
//class SomeSubClass: SomeClass {
//    
//}
//
//
//let f = SomeSubClass()
//
//
//print(f is SomeClass)

//
//class dClass {
//    var val = 23
//}
//
//
////###### Doubt ######//
//struct NormalStructure {
//    var name : String = "asdsad"
//    var classVar = dClass()
//}
//
//var instance1 = NormalStructure()
//var instance2 = instance1
//
//print(instance1.classVar.val)
//print(instance2.classVar.val)
//
//instance1.classVar.val = 3
//instance1.name = "ak"
//
//print(instance1.classVar.val)
//print(instance2.classVar.val)
//
//
//print(instance1.name)
//print(instance2.name)
//



//
//class cl1 {
//    public class cl2 {
//        var s : String = "sfdsfds"
//    }
//    var dd : String = "dsfdsf"
//}
//
//
//private let obj1 = cl1.cl2()


//protocol p1 {
//    var mem : String { get set }
//}
//
//
//struct cl1: p1 {
//    var mem : String
//}



