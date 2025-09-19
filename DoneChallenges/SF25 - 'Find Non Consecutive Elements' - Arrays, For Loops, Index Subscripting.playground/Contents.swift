//  🏔️ MTECH Code Challenge SF16: "Find Non-Consecutive Elements"
//  Concept: Practice using subscripts to find a spcific value in an array; sort through complex logic to solve a problem

//  Instructions:
    //  Create a function that accepts an array and returns an optional Integer.
    //  Your task is to find the first element of an array that is not consecutive.
    //  By "not consecutive," we mean not exactly 1 larger than the previous element of the array.
    //  If the whole array is consecutive, then return nil.

//  Restrictions:
    //  The array will always have at least 2 elements and all elements will be numbers.
    //  The numbers will also all be unique and in ascending order.
    //  The numbers could be positive or negative and the first non-consecutive could be either too!

//  Examples:
    //  Input: [1,2,3,4,6,7,8]
        //  1 then 2 then 3 then 4 are all consecutive but 6 is not, so that's the first non-consecutive number.
    //  Output: 6

//  ⌺ Black Diamond Challenge:
    //  Create another function. This time, when a non-consecutive number is found, end the previous array and start a new one. Return an array of arrays of Integers where all the arrays of Integers now only have consecutive numbers.
        //  Input: [1,2,3,5,6,7,9,10,11]
        //  Output: [[1,2,3], [5,6,7], [9,10,11]]

func findNonconsecutive(_ input: Array<Int>) -> Int? {
    var indexCount = 2
    var returnNumber: Int?
    for number in input.index(after: 1)...input.endIndex {
        if number - 1 != input.index(indexCount, offsetBy: -1) {
            returnNumber = number
            break
        } else {
            indexCount += 1
        }
    }
    return returnNumber
}

let myArray = [1, 2, 3, 4, 6, 7, 8]

import Foundation
