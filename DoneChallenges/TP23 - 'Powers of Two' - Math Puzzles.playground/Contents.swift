//  🏔️ MTECH Code Challenge TP23: "Powers of Two"
//  Concept: Practice translating math into Swift code

//  Instructions:
    //  Create a function that takes a non-negative integer n as input, and returns a list of all the powers of 2 with the exponent ranging from 0 to n (inclusive).

//  Examples:
    //  Input: 2
    //  Math: 2^0, 2^1, 2^2
    //  Output: [1, 2, 4]

    //  Input: 5
    //  Math: 2^0, 2^1, 2^2, 2^3, 2^4, 2^5
    //  Output: [1, 2, 4, 8, 16, 32]

//  ⌺ Black Diamond Challenge:
    //  Create another function. This time, return all powers of N with the exponent ranging from 0 to n (inclusive).
    //  Input: 4, Output: [1, 4, 16, 64, 256]

import Foundation

enum PowersError: Error {
    case inputMustBePositive
}

func powersOf2(upTo input: Int) throws -> [Int] {
    guard input > 0 else { throw PowersError.inputMustBePositive }
    
    var answerArray: [Int] = [1]
    var multiplier = 1
    var count = input
    
    while count > 0 {
        multiplier *= 2
        answerArray.append(multiplier)
        count -= 1
    }
    return answerArray
}

func tryPowersOf2(upTo input: Int) {
    do {
        try print(powersOf2(upTo: input))
    } catch {
        print(error)
    }
}

tryPowersOf2(upTo: 5)
tryPowersOf2(upTo: 8)
tryPowersOf2(upTo: -4)


func blackDiamond(powersOfAndUpTo input: Int) throws -> [Int] {
    guard input > 0 else { throw PowersError.inputMustBePositive }
    
    var answerArray: [Int] = [1]
    var multiplier = 1
    var count = input
    
    while count > 0 {
        multiplier *= input
        answerArray.append(multiplier)
        count -= 1
    }
    return answerArray
}

func tryBlackDiamond(powersOfAndUpTo input: Int) {
    do {
        try print(blackDiamond(powersOfAndUpTo: input))
    } catch {
        print(error)
    }
}

tryBlackDiamond(powersOfAndUpTo: 4)
