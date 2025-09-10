//  🏔️ MTECH Code Challenge SF10: "Name, Age, and Pi"
//  Concept: Practice looping over arrays

//  Instructions:
    //  Create a function that takes in an array of Int's as a parameter
    //  You will need to multiply each Int in the array by 5.
    //  The function will return the array of new Ints.

var intArray = [1, 2, 3, 4]

func multiplyArray(_ input: Array<Int>) -> Array<Int> {
    var newNumber: Int
    var newArray: [Int] = []
    for number in input {
       newNumber = number * 5
        newArray.append(newNumber)
    }

    return newArray
}

func blackDiamond(_ input: Array<Int>) -> Array<Int> {
    let newArray = input.map { $0 * 5 }
    return newArray
}

var answer = multiplyArray(intArray)
print(answer)

var blackDiamondTest = blackDiamond(intArray)
print(blackDiamondTest)
//  ⌺ Black Diamond Challenge:
    //  Create a second function for the same purpose. Return an array of Ints without using a for loop. (This will require a special method -- look it up!)

import Foundation
