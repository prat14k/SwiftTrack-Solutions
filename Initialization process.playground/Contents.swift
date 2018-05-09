/*:
 # Initialization
 
 Initialization is the process of preparing an instance of a class, structure, or enumeration for use. This process involves setting an initial value for each stored property on that instance and performing any other setup or initialization that is required before the new instance is ready for use.
 
 * callout(Basic Syntax):
     init() {
     // perform some initialization here
     }

 
 Two ways to initialize stored properties :-
 - Default Values
 - Using Custom initializer
 - Using a closure with no parameters and with a value of same type returned from it.
 
 
 ## Default Initializers
 
Swift provides default initializers to class and structs whos all stored property have been provided default values.
 
For Structs, they automatically receive a memberwise initializer even if they do not define any of their own custom initializers.

 * callout(Basic Syntax):
    struct CGPoint {\
        var x: CGFloat = 0.0, y: CGFloat = 0.0\
        static open let zero = CGPoint()\
    }\
    var point = CGPoint(x: 10.0, y: 10.0)
 
 ## Initializer Delegation for Value Types
 Initializers can call other initializers to perform part of an instance’s initialization. This process, known as initializer delegation, avoids duplicating code across multiple initializers.
 
 The rules for how initializer delegation works, and for what forms of delegation are allowed, are different for value types and class types.
 
 ### Value Types:
 For value types, you use self.init to refer to other initializers from the same value type when writing your own custom initializers. You can call self.init only from within an initializer.
 
    struct Person {
        var name: String
        var isWorking: Bool = false
        var companyName: String?
        init(name: String) {
            self.name = name
        }
        init(name: String, companyName: String) {
            self.init(name: name)
            self.isWorking = true
            self.companyName = companyName
        }
    }
 
 
 ### Reference Types:
 All of a class’s stored properties—including any properties the class inherits from its superclass—must be assigned an initial value during initialization.
 Swift defines two kinds of initializers for class types to help ensure all stored properties receive an initial value. These are known as __designated initializers__ and __convenience initializers__.
 
*Designated Initializers*\
 Designated initializers are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.
 
 * callout(Syntax):
     init(parameters) {\
        //statements\
     }
 

 *Convenience Initializers*\
 Convenience initializers are secondary, supporting initializers for a class. You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values. You can also define a convenience initializer to create an instance of that class for a specific use case or input value type.
 
 * callout(Syntax):
    convenience init(parameters) {\
        //statements\
    }
 
 __Delegation for Class types__\
 To ensure that all the properties are initialized using the features like designated and convinience inits, there are 3 rules to follow for delegation among inits.
 
 *  Designated inits can only call superclass inits (that too only after they have initialized all stored properties introduced by them)
 *  Convenience inits can only call their own class inits (that too before using any unitialized stored properties)
 *  Any delegation flow starting from a convenience init must end on a designated init only.
 
 
 __Two Phase Initialization process__\
 Swift follows a two phase initialization process where first the class needs to initialize all the stored property and then customise once they are done initializing.
 Swift’s compiler performs four checks to ensure to make sure that the initialization is complete successfully for class types.
 
 * Before delegating up the class hierarchy, the designated init must initialize all of the stored properties introduced by its class.
 * Before assiging any value to the superclass porperty, it must first call its init, because it is compulsory to call the superclass init. If we wont call, the compiler will call the superclass init once the init is complete, thus overriding the current set value.
 * An initializer cannot call any instance methods, read the values of any instance properties, or refer to self as a value until after the first phase of initialization is complete.
 * A convenience initializer must delegate to another initializer before assigning a value to any property (including properties defined by the same class). If it doesn’t, it will be a compiler error because of the rule above.
 
 Points to be noted:\
    * When the initializer is called, the memory is allocated, but not initialized\
    * When the designated init confirms that all stored properties introduced by the class are initialized, the memory for these properties is initialized.\
    * The object or self is not available until all the properties are initialized, i.e. first phase is complete.\
 
 
 */


