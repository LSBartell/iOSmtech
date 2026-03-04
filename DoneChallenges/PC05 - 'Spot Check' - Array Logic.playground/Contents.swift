//  🏔️ MTECH Code Challenge PC05: "Spot Check"
//  Concept: Practice evaluating the data in an array with a unique set of logical requirements

//  Instructions:
    //  All the numbers in your program decide to have a party at a local Array. As each number arrives, they look for where in the array they should hang out.
    //  Odd numbers like to hang out with odd numbers. Even numbers like to hang out with even numbers. They won't like a spot to hang out unless at least one of their neighbors is the same parity (odd/even) as them.
    //  A spot is any place you could insert a new value between two numbers in an array. (Given an array of n integers in length, there are n-1 spots available.)

    //  For instance:
    
    //  [3, 4, 9, 10, 1]
        //  This array of 5 digits can also be thought of as...
    //  [3, __ , 4, __ , 9, __, 10, __, 1]
        //  ...an array with 4 spots.

    //  Given an array and an integer, calculate how many spots in the array the integer would like.

//  Examples:
    //  Input: [0, 4, 6, 8], 9
    //  Logic: 9 likes NONE of the following spots: [0, __, 4], [4, __ , 6], [6, __, 8] because all of his neighbors are even.
    //  Output: 0

    //  Input: [0, 4, 6, 8], 12
    //  Logic: 12 likes ALL of the spots because he will have an even neighbor at any of them.
    //  Output: 3

    //  Input: [4, 4, 4, 4, 5], 7
    //  Logic: 7 dislikes every spot except the last one at: [4, __, 5].
    //  Output: 1

//  ⌺ Black Diamond Challenge:
    //  7s are special now. They only like to hang out between one odd and one even number. Rewrite your code to take the case of 7s into account.
import Foundation

func spotCheck(array: [Int], number: Int) -> Int {
    var previousIsEven: Bool? = nil
    var oddSpots = 0
    var evenSpots = 0
    var sevenSpots = 0
    
    for arrayInt in array {
        if previousIsEven == true && arrayInt.isMultiple(of: 2) {
            evenSpots += 1
        } else if previousIsEven == false && !arrayInt.isMultiple(of: 2) {
            oddSpots += 1
        } else if previousIsEven == true && !arrayInt.isMultiple(of: 2) || previousIsEven == false && arrayInt.isMultiple(of: 2) {
            sevenSpots += 1
        }
        if arrayInt.isMultiple(of: 2) {
            previousIsEven = true
        } else {
            previousIsEven = false
        }
    }
    
    if number == 7 {
        return sevenSpots
    } else if number.isMultiple(of: 2) {
        return evenSpots
    } else {
        return oddSpots
    }
    
}

print(spotCheck(array: [0, 4, 6, 8], number: 9))
print(spotCheck(array: [0, 4, 6, 8], number: 12))
print(spotCheck(array: [4, 4, 4, 4, 5], number: 7))
