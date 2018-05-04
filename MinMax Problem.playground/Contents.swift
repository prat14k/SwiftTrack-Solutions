//: Playground - noun: a place where people can play

import UIKit


func minmax(_ a: Int,_ b: Int) -> (min: Int,max: Int) {
    
    if a > b {
        return (b,a)
    }
    
    return (a,b)
    
}


print(minmax(5,1))