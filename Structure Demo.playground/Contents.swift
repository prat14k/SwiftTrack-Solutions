//: Playground - noun: a place where people can play

import Foundation


struct Vinsol {
    
    var editableStoredProperty = 2  // Stored Property, Editable
    
    let nonEditableStoredProperty : String // Non-Editable Stored Property
    
    
    var computedProperty : Double {     // Computed Property
        get {
            return Double(editableStoredProperty)
        }
        set(newData) {
            editableStoredProperty = Int(newData)
        }
    }
    
    // Custom Initializers
    init() {
        nonEditableStoredProperty = "dummy text"
    }
    
    init(nonEditableProperty: String) {
        nonEditableStoredProperty = nonEditableProperty
    }
    
    // Instance Methods
    func prettyPrint() {
        print("\(nonEditableStoredProperty) \(computedProperty)")
    }
    
}


// Object Initialization
var object = Vinsol(nonEditableProperty: "custom inits")
var copyObject = object

// Call to variables
object.computedProperty = 3323
print(object.computedProperty)


// Call To functions
object.prettyPrint()
copyObject.prettyPrint()



