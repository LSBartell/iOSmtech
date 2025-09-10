//  🏔️ MTECH Code Challenge SF24: "Subset of an Array"
//  Concept: Practice accessing a set of data in an array that is not the entire array; practice using index subscripting

//  Instructions:
    //  Create a function that takes an integer representing a year as input, and outputs the century it is in.

//  Notes:
    //  Remember, the first century spans from the year 1 up to and including the year 100, the second century - from the year 101 up to and including the year 200, etc.

//  Examples:
    //  Input: 1752, Output: 18
    //  Input: 1900, Output: 19
    //  Input: 1601, Output: 17
    //  Input: 2000, Output: 20

//  ⌺ Black Diamond Challenge:
    //  Output the century as an ordinal number in a String. That means 21 becomes 21st, 4 becomes 4th, etc.

func yearIsInCentury(year: Double) -> String {
    let input = year / 100.0
    let answer = ceil(input)
    let output = Int(answer)
    return "\(output)"
}

let test = yearIsInCentury(year: 1601)
print(test)

import Foundation
