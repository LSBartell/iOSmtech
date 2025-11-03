//  🏔️ MTECH Code Challenge TP20: "Sum Without Extremes"
//  Concept: Practice accessing and evaluating a set of data in an array that is not the entire array

//  Instructions:
    //  Sum all the numbers of a given array, except the highest and the lowest element (by value, not by index!).

//  Notes:
    //  If there are multiple instances of the highest and lowest element, omit only one of them from your sum.
    //  If there are too few elements (less than 3) in your array such that no values can be summed, return 0.

//  Examples:
    //  Input: [15,5,6,7,2,3,22,12,22]
    //  Math: 3 + 5 + 6 + 7 + 12 + 15 + 22 = 70 (omitting 2 and a single instance of 22)
    //  Output: 70

//  ⌺ Black Diamond Challenge:
    //  Make it so that your function can be called like this:
    //  let sum = [1,2,3,4,5].sumWithoutExtremes()

import Foundation


func sumWithoutExtremes(_ input: [Int]) -> Int {
    guard input.count > 2 else { return 0 }
    var mutableArray = input.sorted()
    mutableArray.removeFirst()
    mutableArray.removeLast()
    return mutableArray.reduce(0, { x, y in
        x + y
    })
}

print(sumWithoutExtremes([15,5,6,7,2,3,22,12,22]))
