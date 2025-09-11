//  🏔️ MTECH Code Challenge SF12: "Complete the Square"
//  Concept: Solve simple math problems while working with arrays and loops

//  Instructions:
//      Create a function called completeTheSquare.
//      The function will take an array of ints and will return a single int
//      The function should A) square each number in the array, and then B) add the total of all squared numbers together.

//  Examples:
//    Input:
//      [1, 2, 2]
//    Math:
//      [1^2, 2^2, 2^2]
//      1^2 + 2^2 + 2^2
//    Output:
//      9

//  ⌺ Black Diamond Challenge:
//      Add a new function with the same name but one more parameter, exponent. Raise each number in the array by the given exponent, then return the sum.

let myArray = [1, 3, 4, 5]

func completeTheSquare(array: [Int]) -> Int {
    var sum = 0
    for number in array {
        sum += number * number
    }
    return sum
}

let answer = completeTheSquare(array: myArray)
print(answer)

func blackDiamond(array: [Int], exponent: Int) -> Int {
    var sum = 0
    for number in array {
        sum += Int(pow(Double(number), Double(exponent)))
    }
    return sum
}

let answer2 = blackDiamond(array: myArray, exponent: 3)
print(answer2)
import Foundation
