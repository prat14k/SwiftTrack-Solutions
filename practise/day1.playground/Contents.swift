//: Playground - noun: a place where people can play

import UIKit

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


//class A {
//    var c: String
//    init() {
//        c = "asdasd"
//    }
//}
//
//class B: A {
//    override var c: String
//}



//class A {
//    static func bf() {
//        print("sdf")
//    }
//}
//
//class B: A {
//    override static func bf() {
//
//    }
//}
//
////let d =
//B().fd()



//protocol hgh {
//    subscript(_: Int) -> String { get set }
//}
//
//
//class fgf: hgh {
//    subscript(val: Int) -> String {
//        get {
//            return "\(val)"
//        }
//        set {
//            newValue
//        }
//    }
//}
//
//fgf()[33] = "Sds"
//
//
//extension fgf {
//    static var ggg : String = "sdf"
//}
//
//print(fgf.ggg)









