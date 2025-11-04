//  🏔️ MTECH Code Challenge TP21: "Will It Divide"
//  Concept: Practice translating simple math into Swift code

//  Instructions:
    //  Create a function that checks if a number n is divisible by two numbers x AND y. All inputs are positive, non-zero digits.

//  Examples:
    //  Input: n: 10, x: 2, y: 5
    //  Logic: 10 is divisible by 2 and 5
    //  Output: true

    //  Input: n: 27, x: 9, y 2
    //  Logic: 27 is not divisible by 2
    //  Output: false

//  ⌺ Black Diamond Challenge:
    //  Extend the function to accept an additional array parameter, 'divisors', which is an array of integers.
    //  The function should return true if the number n is divisible by *all* numbers in the 'divisors' array, and false if it is not divisible by any one of them.

import Foundation

func willItDivide(_ number: Int, divisibleBy firstDivider: Int, and secondDivider: Int) -> Bool {
    guard number % firstDivider == 0 else { return false }
    if number % secondDivider == 0 {
        return true
    } else {
        return false
    }
}


print(willItDivide(10, divisibleBy: 2, and: 5))
print(willItDivide(27, divisibleBy: 9, and: 2))


func blackDiamond(_ number: Int, divisibleBy array: [Int]) -> Bool {
    for divider in array {
        if number % divider != 0 {
            return false
        }
    }
    return true
}

print(blackDiamond(27, divisibleBy: [9, 2]))
print(blackDiamond(10, divisibleBy: [2, 5]))
