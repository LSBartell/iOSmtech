//  🏔️ MTECH Code Challenge SF28: "Find a Value in an Array"
//  Concept: Practice looking up data in an array; create functions which accept different types of parameters (aka Function Overloading); (Optional) Learn about Generics from the instructor

//  Instructions:
    //  You will be given an array a and a value x. All you need to do is check whether the provided array contains the value.
    //  The type of a and x can be String OR Int.
    //  Return true if the array contains the value, false if not.
    //  Take note of the wording of this problem. I should be able to pass in either an array of strings or an array of Ints and it will work the same.

//  Notes:
    //  If you're stuck, look up function overloading.

//  Examples:
    //  Input: array: [3, 4, 5, 8, 9], x: 3
    //  Output: true

    //  Input: array: ["hi", "hello", "howdy"], x: "sup"
    //  Output: false

//  ⌺ Black Diamond Challenge:
    //  Create another function. Accomplish the same goal using generics instead of function overloading.


func valueInArray(array: Array<Int>, value: Int) -> Bool {
    if array.contains(value) {
        return true
    } else {
        return false
    }
}

func valueInArray(array: Array<String>, value: String) -> Bool {
    if array.contains(value) {
        return true
    } else {
        return false
    }
}

func blackDiamond<T: Equatable>(array: Array<T>, value: T) -> Bool {
    if array.contains(value) {
        return true
    } else {
        return false
    }
}

import Foundation
