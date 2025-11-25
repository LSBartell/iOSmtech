//  🏔️ MTECH Code Challenge ND08: "Between Two Ints" 2️⃣↔️🔟
//  Concept: Practice using for loops to generate a dataset with custom parameters

//  Instructions:
    //  Create a function that takes two Integers, a and b, as input, and returns an array of Ints.
    //  The function should return an array of all integers from a to b, inclusive.

//  Notes:
    //  If a is greater than b, list all integers from b to a.

//  Examples:
    //  Input: 2, 10
    //  Output: [2, 3, 4, 5, 6, 7, 8, 9, 10]

//  ⌺ Black Diamond Challenge:
    //  Add a third parameter, c. Only return integers in the array that are divisible by c.
    //  Input: 2, 10, 3
    //  Output: [3, 6, 9]

import Foundation

func intsArray(Int1: Int, Int2: Int) -> [Int] {
    var addInt = Int1
    var answer: [Int] = []
    for _ in Int1...Int2 {
        answer.append(addInt)
        addInt += 1
    }
    return answer
}

func betweenTwoInts(Int1: Int, Int2: Int, divisableBy: Int) -> [Int] {
    var numberArray: [Int] = []
    var answer: [Int] = []
    if Int1 > Int2 {
        numberArray = intsArray(Int1: Int2, Int2: Int1)
    } else {
        numberArray = intsArray(Int1: Int1, Int2: Int2)
    }
    for number in numberArray {
        if number % divisableBy == 0 {
            answer.append(number)
        }
    }
    return answer
}

print(betweenTwoInts(Int1: 2, Int2: 10, divisableBy: 3))
