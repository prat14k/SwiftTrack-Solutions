//: Playground - noun: a place where people can play

import Foundation


func reverseElements<T>(_ array: [T]) -> [T] {
    
    var reversedArray = [T]()
    
    var currentPosition = array.count - 1
    
    while currentPosition >= 0 {
        reversedArray.append(array[currentPosition])
        currentPosition -= 1
    }
    
    return reversedArray
}


print(reverseElements([2,3,3232,45454,1]))
print(reverseElements(["asdasd","sad","ss"]))
print(reverseElements([]))