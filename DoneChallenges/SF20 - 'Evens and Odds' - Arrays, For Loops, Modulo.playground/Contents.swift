//  🏔️ MTECH Code Challenge SF11: "Evens and Odds"
//  Concept: Practice using for loops to iterate through an array; practice using the modulo operator to find evens and odds

//  Instructions:
//      1) Write a function that takes in an array of Int's
//          The function will not return anything
//      2) Loop through the array. If the number is even print "num: Even" If the number is odd print "num: Odd"
//      3) When printing, "num" should be replaced with the number

//  Examples:
//      Input:
//          [1,2,3]
//      Output:
//          "1: Odd"
//          "2: Even"
//          "3: Odd"

var myArray = [1, 2, 3, 4]

func evenOrOdd(_ numbers: [Int]) {
    for number in numbers {
        if number % 2 == 0 {
            print("\(number): Even")
        } else {
            print("\(number): Odd")
        }
    }
}

evenOrOdd(myArray)

//  ⌺ Black Diamond Challenge:
//    Add another function. This time, take a minimum and maximum Int, then print every number in that range.
//      Input:
//          (min: 10, max: 13)
//      Output:
//          "10: Even"
//          "11: Odd"
//          "12: Even"
//          "13: Odd"

func blackDiamond(min: Int, max: Int) {
    var minimum = min
    while minimum <= max {
        if minimum % 2 == 0 {
            print("\(minimum): Even")
        } else {
            print("\(minimum): Odd")
        }
        minimum += 1
    }
}

blackDiamond(min: 10, max: 14)
import Foundation
