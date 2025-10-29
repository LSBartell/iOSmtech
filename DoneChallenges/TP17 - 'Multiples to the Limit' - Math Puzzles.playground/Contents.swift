//  🏔️ MTECH Code Challenge TP17: "Multiples to the Limit"
//  Concept: Practice translating mathematical functions into Swift code

//  Instructions:
    //  Create a function that takes two integers, integer and limit, and returns an array of the first integer's multiples, up to the limit.

//  Notes:
    //  If limit is a multiple of integer, it should be included.
    //  Only positive integers will be passed into the function, with limit always being higher than the base integer.

//  Examples:
    //  Input: 2, 10
    //  Output: [2, 4, 6, 8, 10]

    //  Input: 3, 11
    //  Output: [3, 6, 9]

//  ⌺ Black Diamond Challenge:
    //  Try writing the function in only one line of code.
    //  Make it so that your function only accepts positive integers and a limit higher than the base. Return nil or throw an error if not.

import Foundation

func multiples(of input: Int, to limit: Int) -> [Int]? {
    guard input > 0 && limit > input else { return nil }
    let arraySize = limit / input
    var answerArray: [Int] = []
    for number in 1...arraySize {
        answerArray.append(number * input)
    }
    return answerArray
}

if let array = multiples(of: 2, to: 10) {
    print(array)
}
if let array = multiples(of: 3, to: 11) {
    print(array)
}
if let array = multiples(of: -7, to: 30) {
    print(array)
}
if let array = multiples(of: 4, to: 4) {
    print(array)
}

