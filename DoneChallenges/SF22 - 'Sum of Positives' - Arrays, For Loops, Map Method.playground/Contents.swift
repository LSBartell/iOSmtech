//  🏔️ MTECH Code Challenge SF22: "Sum of Positives"
//  Concept: Practice iterating through an array using For Loops; instructor will introduce or review the map method as well

//  Instructions:
    // Create a function that takes an array of numbers, and returns the sum of all of the positives ones.

//  Notes:
    //  If there is nothing to sum, output 0.

//  Examples:
    //  Input: [1,-4,7,12]
    //  Math: 1 + 7 + 12 = 20
    //  Output: 20

//  ⌺ Black Diamond Challenge:
    //  Create a second function that instead returns two arrays, separating the positive and the negative numbers in the array. You can return it as an ([Int], [Int]) tuple, or as a custom structure holding both arrays.

func sumOfPositive(_ array: [Int]) -> Int {
    var sum = 0
    for number in array {
        if number > 0 {
            sum += number
        }
    }
    return sum
}

let myArray = [3, -5, 4, -6, 9]
let answer = sumOfPositive(myArray)
print(answer)

func blackDiamond(_ array: [Int]) -> ([Int], [Int]) {
    var positiveArray: [Int] = []
    var negativeArray: [Int] = []
    
    for number in array {
        if number >= 0 {
            positiveArray.append(number)
        } else {
            negativeArray.append(number)
        }
    }
    return (positiveArray, negativeArray)
}

let blackDiamondAnswer = blackDiamond(myArray)
print(blackDiamondAnswer)
import Foundation
