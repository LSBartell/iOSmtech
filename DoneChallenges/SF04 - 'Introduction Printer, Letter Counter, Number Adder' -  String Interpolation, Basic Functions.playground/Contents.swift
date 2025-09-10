//  🏔️ MTECH Code Challenge SF04: "Introduction Printer, Letter Counter, Number Adder"
//  Concept: Practice using string interpolation and basic functions

//  Instructions:
    //  Under each step below, write the required code.

import Foundation

//  1) Change the values below to your own name and age.
let name = "Logan"
let age = 27

//  2) Print a string introducing the user using the "name" and "age" variables. Use string interpolation
print("My name is \(name) and i am \(age) years old.")

//  3) Create a function that takes in a word as a String. The function will return the number of letters in the string as an Int.
func letterCount(word: String) -> Int {
    return word.count
}
let house = letterCount(word: "house")
print(house)
//  4) Create a function that takes in two Ints. The function will return the two Ints added together.
func adding(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

//  ⌺ Black Diamond Challenge:
    //  Create a function that prints the results of each step all at once.
func addingPrint(number1: Int, number2: Int) {
    print("\(number1) and \(number2) added together is \(number1 + number2)")
}

// Testing question 4
let numbersAddded = adding(number1: 5, number2: 8)
print(numbersAddded)

// Test Black Diamond
addingPrint(number1: 36, number2: 21)

