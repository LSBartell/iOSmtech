//  🏔️ MTECH Code Challenge TP27: "In the Ballpark" ⚾️
//  Concept: Evaluate data with custom parameters

//  Instructions:
    //  Create a function called ballparkCompare that accepts 3 integers: a, b, and an optional margin. It should return an integer.
    //  The function should identify whether a is lower than, close to, or higher than b.
    //  We will consider "a" in the ballpark of "b" if the distance between a and b is less than the margin value.
        //  When a is close to b, return 0.
        //  When a is less than b, return -1.
        //  When a is greater than b, return 1.

//  Notes:
    //  If margin is not given or is less than 0, treat it as zero.

//  Examples:
    //  Input: (a: 103, b: 880, margin: 300)
    //  Output: -1

    //  Input: (a: 39, b: 10, margin: 50)
    //  Output: 0

//  ⌺ Black Diamond Challenge:
    //  Enhance the ballparkCompare function to accept two additional optional parameter called "rounding" and "roundValue".
    //  The "rounding" parameter should be an enum with cases for "up", "down", and "nearest".
    //  If "rounding" is provided, the function should round the values of a and b before comparing them, according to the rounding rule specified
    //  Round the numbers to the nearest multiple of the roundValue (i.e., if roundValue is 30, then 77 would round to 90)
    //  Ensure that the function still considers the margin when comparing the rounded values.

import Foundation

func inTheBallpark(a: Int, b: Int, margin: Int?) -> Int {
    var distance = 0
    var mutableA = a
    var mutableB = b
    if a < 0 && b < 0 {
        mutableA.negate()
        mutableB.negate()
        if mutableA > mutableB {
            distance = mutableA - mutableB
        } else {
            distance = mutableB - mutableA
        }
    } else if a < 0 {
        mutableA.negate()
        distance = mutableA + mutableB
    } else if b < 0 {
        mutableB.negate()
        distance = mutableA + mutableB
    } else {
        if a > b {
            distance = mutableA - mutableB
        } else {
            distance = mutableB - mutableA
        }
    }
    
    if let margin {
        if margin <= 0 {
            return 0
        } else if distance < margin {
            return 0
        } else if a > b {
            return 1
        } else {
            return -1
        }
    }
    return 0
}


print(inTheBallpark(a: 103, b: 880, margin: 300))
print(inTheBallpark(a: 39, b: 10, margin: 50))
print(inTheBallpark(a: -150, b: -200, margin: 20))
