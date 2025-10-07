//  🏔️ MTECH Code Challenge TP01: "Reverse Alphabetical"
//  Concept: Practice manipulating arrays; learn basic built-in Swift methods that you'll use every day

//  Instructions:
    //  Alphabetically reverse sort an array of strings.

//  Examples:
    //  Input: ["Bob", "Jill", "Sally"], Output: ["Sally", "Jill", "Bob"]
    //  Input: ["Vern", "Gidget", "Zeb"], Output: ["Zeb", "Vern", "Gidget"]

//  ⌺ Black Diamond Challenge:
    //  Create another function. This time, sort every word's letters reverse alphabetically, then sort all words in the array. You do not need to retain the case of the characters.
    //  Input: ["Bob", "Jill", "Sally"]
    //  Output: ["llji", "obb", "yslla"]

import Foundation

func reverseAlphabetical(array: [String]) -> [String] {
    var mutableArray = array
    
    mutableArray = mutableArray.sorted { $0 > $1 }
    return mutableArray
}

let myArray = ["Bob", "Jill", "Sally"]

print(reverseAlphabetical(array: myArray))

func blackDiamond(array: [String]) -> [String] {
    var mutableArray = array
    var newArray: [String] = []
    for string in mutableArray {
        var newString: String
        newString = String(string.sorted { $0 > $1 })
        newArray.append(newString)
    }
    
    newArray = newArray.sorted { $0 < $1 }
    return newArray
}

print(blackDiamond(array: myArray))
