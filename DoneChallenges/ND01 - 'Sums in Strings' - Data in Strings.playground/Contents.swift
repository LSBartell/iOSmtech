//  🏔️ MTECH Code Challenge ND01: "Sums in Strings"
//  Concept: Practice converting Strings to other types and evaluating data stored within them

//  Instructions:
    //  Create a function that takes a String as input and returns an Integer.
    //  Your task is to calculate the sum of the integers inside an input string.

//  Examples:
    //  Input: "The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog"
    //  Math: 30 + 20 + 10 + 0 + 1203 + 914 + 3 + 1349 + 102 + 4
    //  Output: 3635

//  ⌺ Black Diamond Challenge:
    //  Make another function. This one should also execute any mathematical operators contained in the string (+, -, /, * or x). If no operator separates two integers, add them by default. Thus, the string "13-3is10" would produce 20 (13 - 3 + 10).

import Foundation

func sumsInStings(_ input: String) -> Int {
    let numbers = "1234567890"
    var total = 0
    var addInt: String = ""
    var previousCharacter = ""
    
    for character in input {
        if numbers.contains(character) {
            addInt.append(character)
        } else if !numbers.contains(character) && numbers.contains(previousCharacter) {
            total += Int(addInt) ?? 0
            addInt = ""
        }
        previousCharacter = String(character)
    }
    return total
}

print(sumsInStings("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog"))


func blackDiamond(_ input: String) -> Int {
    let numbers = "1234567890"
    let operators = "+-/*"
    var total = 0
    var addInt: String = ""
    var previousCharacter = ""
    var currentOperator = "+"
    
    for character in input {
        if numbers.contains(character) {
            addInt.append(character)
        } else if operators.contains(character) {
            currentOperator = String(character)
        } else if !numbers.contains(character) && !operators.contains(character) && numbers.contains(previousCharacter) {
            switch currentOperator {
            case "+":
                total += Int(addInt) ?? 0
            case "-":
                total -= Int(addInt) ?? 0
            case "*":
                total *= Int(addInt) ?? 0
            default:
                total /= Int(addInt) ?? 0
            }
            addInt = ""
            currentOperator = "+"
        }
        previousCharacter = String(character)
    }
    return total
}

print(blackDiamond("13-3is10"))
