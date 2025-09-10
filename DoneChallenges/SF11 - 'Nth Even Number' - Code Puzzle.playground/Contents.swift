//  🏔️ MTECH Code Challenge SF25: "Nth Even Number"
//  Concept: Use abstract thinking to solve an unintuitive coding puzzle

//  Instructions:
    //  Given input n, return the nth even number.

//  Notes:
    //  The input will never be 0.

//  Examples:
    // Input: 1, Output: 0 (the first even number is 0)
    // Input: 3, Output: 4 (the 3rd even number is 4 (0, 2, 4))
    // Input: 100, Output: 198
    // Input: 1298734, Output: 2597466

let input = 100
var counting = 0
var answer = -2
while counting < input {
    answer += 2
    counting += 1
}
print(answer)


//  ⌺ Black Diamond Challenge:
    //  Add a boolean parameter called "even". If true, return the nth even number; if false, return the nth odd number.

import Foundation
