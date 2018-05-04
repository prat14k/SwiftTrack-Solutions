//: Playground - noun: a place where people can play

import Foundation


class Vinsol {
    
    var editableStoredProperty = "Any value" // Stored Property, Editable
    
    let nonEditableStoredProperty : Int // Non-Editable Stored Property
    
    
    var computedProperty : Double {     // Computed Property
        get {
            return Double(arc4random())
        }
        set(newData) {
            editableStoredProperty = "\(newData)"
        }
    }
    
    // Custom Initializers
    init(){
        nonEditableStoredProperty = 3
    }
    
    init(nonEditableProperty: Int) {
        nonEditableStoredProperty = nonEditableProperty
    }
    
    // Instance Methods
    func prettyPrint() {
        print("\(nonEditableStoredProperty) \(computedProperty)")
    }
    
}


// Object Initialization
var object = Vinsol(nonEditableProperty: 232)

// Call to variables
object.computedProperty = 3323
print(object.computedProperty)


// Call To functions
object.prettyPrint()
