/*:
 ## Protocol oriented programming
 
 Object Oriented programming (OOP) has been there in use for decades now and has become the standard to build large software projects.
 Real World problems can be mapped using OOPs.
 
 It provides:- Encapsulation ,Abstraction ,Polymorphism ,Inheritance.
 
 The one of prime importance is Inheritance. Probably one of the main feature of OOP!
 
 
 
 ### Inheritance
 
 Inheritance is loved and extensively used by developers. It is very much used to make the code less complex and be able to help in mapping the real world problem.
 
 But still, careless use of Inheritance often leads you to scenarios, recovering from which might need you to remodel the whole program/project. For example, Multiple Inheritance, which leads to the **Diamond Problem**.
 
 As we know, many widely used programming languages like Java, Objc, even swift, doeasn't suport multiple inheritance, because of the Diamond problem.
 
              A
             / \
            B   C          // A Graphical Representation of the Diamond Problem
             \ /
              D
 
 
 
 
 _**Why would we need Multiple Inheritance ?**_
 
 Lets see an example.
 
 Lets build a hypothetical platform for Transport Vehicles. What do they all have in common?? .
 
 
    class Wheels {
        func startWheelsRolling(){
            fatalError()
        }
        func stopWheelsRolling(){
            fatalError()
        }
        // Other functionalities.
    }

    class Vehicle: Wheels {
        func start(){
            //implement start Rolling
        }
        func stop(){
            //implement stop Rolling
        }
        // Other functionalities.
    }

    class Car: Vehicle {
        //implement AirPlane
    }
*/

/*:
 
 
 Now all the vehicles can inherit wheel.
 Lets consider a Airplane or Jet Plane. As it can fly, lets add the capability to it too.
 
    class FlyableVehicles: Vehicle {
        func fly() {
            //implement fly
        }
        // Other Functionality
    }

    class Airplane: FlyableVehicles {
        //implement AirPlane
    }

    class JetPlane: FlyableVehicles {
        //implement JetPlane
    }


 Sorry, But i forgot to think about Helicopters and chopper. whats common, Landing Gear.

    class LandingGear {
        // implement functionalities.
    }

 
 But Chopper fly. If we inherit the Chopper class with __LandingGear__ and __FlyableVehicles__ , like this :-
 
     class Chopper: LandingGear,FlyableVehicles {
     //implement Chopper
     }
 
 is wrong as
 * You cannot have multiple inheritance (Programming Problem)
 * Chopper doesn't have wheels. (Business Problem)
 
 
 Also, what if the inheriting classes do not override the methods mentioned in wheels ? It is not a good approach to make compulsory for a subclass to provide definition.
 
 ////////////////////////////////////////// ////////////////////////////////////////// //////////////////////////////////////////
 
 
 There are other problems too. But lets focus on the solution- __*Protocol oriented Programming*__
 
 
 
 
 ### Protocol oriented Programming
 
 The main reason for above problem was we added Vehicle to the Wheel. With the use of protocols, we can separate both and conform to both in the Airplane class.
 
 
    protocol Wheels {
        func startWheelsRolling()
        func stopWheelsRolling()
        // Other requirements.
    }
    protocol LandingGear {
        // declare requirements.
    }

    protocol Vehicle {
        func start()
        func stop()
        // Other requirements.
    }
 
    protocol FlyableVehicles: Vehicle {
        func fly()
    }
 
 
    class Airplane: FlyableVehicles,Wheels {
        //implement AirPlane, and conform other requirements
    }
    class JetPlane: FlyableVehicles,Wheels {
        //implement JetPlane and conform other requirements
    }
 
    class Chopper: FlyableVehicles,LandingGear {
        //implement Chopper and conform other requirements
    }
 
 Also, it will make the conforming classes of the Wheel protocol to provide definition for the methods, removing the fatalerror() bad implementation.
 

 
 Also, using the *Protocol Extensions*, we can provide the base definitions for behaviours that are same for different conforming types, keeping the code clean.
 
 For Example, fly will be mostly same for different kinds of airplane. So,
 
    extension FlyableVehicles {
        func fly() {
            //implement fly
        }
    }

 
 This will be available to all the confirming types and can be used if same work is to be done.
 
 *
 *
 *

 ## Cons of POP

 So Protocol Oriented Programming solves multiple inheritance problem by declaring capability as protocol.
 Does that mean __Protocol Oriented Programming__ is better compared to __Object Oriented Programming__ ? Does __Protocols__ replaces traditional __Inheritance__ as apple claims ??

 One of the biggest advantage of Inheritance was __code reusability__. How can we even deny the comfort we all took by writing common functionality once in parent class and getting it free in all child classes!

 
 In case of swift, protocols can provide their default implementations to their methods. Classes which does not require any special implementation other than the default one need not provide any implementation of their own !!!
 
 But Swift protocols comes with default implementation which you can either as is form else simply discard and provide a complete brand new implementation! If discardes, no way to contact.

*/
