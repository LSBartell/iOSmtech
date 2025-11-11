//  🏔️ MTECH Code Challenge TP26: "Can You Digit"
//  Concept: Practice using regular expressions

//  Instructions:
    //  Create a function take that takes a string as input and returns a boolean.
    //  Your function should return true if the input string is a single digit, and false if it is anything else.
    //  You must use a regular expression to determine this. (Don't use Character's isNumber() method.)

//  Examples:
    //  Input: "7"
    //  Output: true

    //  Input: "838"
    //  Output: false

    //  Input: "hi"
    //  Output: false

//  ⌺ Black Diamond Challenge:
    //  Extend the function to handle the following cases:
    //  1. Leading or trailing spaces: "  7  " should return true.
    //  2. Single digit with a positive or negative sign: "+7" and "-7" should return true.
    //  3. A digit within a string: "abc7xyz" should return true.

import Foundation

func singleDigit(_ input: String) -> Bool {
    let digits = "1234567890"
    var digitCount = 0
    for character in input {
        if digits.contains(character) {
            digitCount += 1
        }
    }
    if digitCount == 1 {
        return true
    } else {
        return false
    }
}


print(singleDigit("ajvked5jkva "))
print(singleDigit("-7"))
print(singleDigit("838"))
