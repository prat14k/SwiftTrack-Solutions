//: Playground - noun: a place where people can play

import Foundation


extension Array where Element == Character {
    
    func printCharactersFrequencies() {
        
        var frequencyDict = [Character: Int]()
        
        for char in self {
            if frequencyDict[char] != nil {
                frequencyDict[char] = frequencyDict[char]! + 1
            }
            else {
                frequencyDict[char] = 1
            }
        }
        
        for char in self {
            if frequencyDict[char]! > 0 {
                print("\"\(char)\" => \(frequencyDict[char]!)")
                frequencyDict[char] = 0
            }
        }
        
        print("")
    }
    
}


extension String {
    
    func charactersFrequency() {
        
        var charactersArray = [Character]()
        
        for char in self {
            charactersArray.append(char)
        }
        
        charactersArray.printCharactersFrequencies()
        
    }
    
}


"vinsol".charactersFrequency()
"lvinsvol".charactersFrequency()
["v","i","n","s","o","l"].printCharactersFrequencies()