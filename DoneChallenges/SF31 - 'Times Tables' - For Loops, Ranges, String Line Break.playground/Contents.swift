//  🏔️ MTECH Code Challenge SF31: "Times Tables"
//  Concept: Practice using for loops and string interpolation

//  Instructions:
    //  Create a function that prints a multiplication table for any integer.
    //  The table should show its multiples from 1-10.

//  Notes:
    //  You can use "\n" in a string to insert a line break, the equivalent of hitting "return."

//  Examples:
    //  Input: 5
    //  Output:
        //  1 * 5 = 5
        //  2 * 5 = 10
        //  3 * 5 = 15
        //  4 * 5 = 20
        //  5 * 5 = 25
        //  6 * 5 = 30
        //  7 * 5 = 35
        //  8 * 5 = 40
        //  9 * 5 = 45
        //  10 * 5 = 50

//  ⌺ Black Diamond Challenge:
    //  Make another function with the same goal, but which accepts an array of integers as a parameter and prints the tables for each integer in the array.

import Foundation

func multiplicationTable(for interger: Int) {
    var counter = 0
    var table = ""
    for _ in 1...10 {
        counter += 1
        table.append("\(counter) * \(interger) = \(counter * interger) \n")
    }
    print(table)
}

multiplicationTable(for: 5)

func blackDiamond(for array: [Int]) {
    var table = ""
    for number in array {
        var counter = 0
        for _ in 1...10 {
            counter += 1
            table.append("\(counter) * \(number) = \(counter * number) \n")
        }
    }
    print(table)
}

var array = [2, 4, 6, 8]
blackDiamond(for: array)
