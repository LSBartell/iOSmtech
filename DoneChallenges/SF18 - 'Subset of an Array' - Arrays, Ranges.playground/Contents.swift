//  🏔️ MTECH Code Challenge SF18: "Subset of an Array"
//  Concept: Practice accessing a set of data in an array that is not the entire array; practice using index subscripting

//  Instructions:
    //  Create a function take that takes an Array<Int> and an Int, n, and returns an Array<Int> containing the first up to n elements from the array.

//  Examples:
    //  Input: [15,5,6,7,2,3,45,12], 3
    //  Output: [15,5,6]

//  ⌺ Black Diamond Challenge:
    //  Create another function. This time, return the first and last n elements of the array. If the first and last n elements overlap (i.e., 3 first and 3 last in a 5 element array), return the whole array.

func firstInArray(_ input: [Int], returningfirst: Int) -> [Int] {
    var arrayCounter = 0
    var returnArray: [Int] = []
    for _ in 1...returningfirst {
        returnArray += [input[arrayCounter]]
        arrayCounter += 1
    }
    return returnArray
}

let myArray = [2, 4, 6, 8, 10, 15]


func blackDiamond(array: [Int], returning: Int) -> [Int] {
    var modifiedArray = array
    var returnArray: [Int] = []
    var firstArrayCounter = 0
    for _ in 1...returning {
        returnArray += [array[firstArrayCounter]]
        firstArrayCounter += 1
    }
    for _ in 1...returning {
        returnArray += [modifiedArray.removeLast()]
    }
   return if array.count > returnArray.count {
       returnArray
   } else {
       array
   }
    
}
let newArray = blackDiamond(array: myArray, returning: 5)
print(newArray)

import Foundation
