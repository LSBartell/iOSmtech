//  🏔️ MTECH Code Challenge ND05: "Name Swap"
//  Concept: Practice manipulating the contents of strings algorithmically

//  Instructions:
    //  Write a function that takes a String as input and returns another String.
    //  The input string will be a first and last name. Return a string with the names swapped, last name first, first name last.

//  Example:
    //  Input: "john McClane"
    //  Output: "McClane john"

//  Notes:
    //  You can assume the input will always be a single pair of names, first and last.

//  ⌺ Black Diamond Challenge:
    //  Write another function that accepts a full name as input (first, middle, last) and returns a string in the format, "lastName, firstName middleInitial." Include the comma, abbreviate the middle initial to one letter and add a period.

import Foundation

func nameSwap(_ input: String) -> String {
    var firstName = ""
    var lastname = ""
    var middleName = ""
    var firstSpace = false
    var secondSpace = false
    
    for character in input {
        if firstSpace == false && character == " " {
            firstSpace = true
        } else if firstSpace == true && character == " " {
            secondSpace = true
        }
        if character != " " {
            if firstSpace == false {
                firstName.append(character)
            } else if secondSpace == false {
                middleName.append(character)
            } else {
                lastname.append(character)
            }
        }
    }
    return "\(lastname), \(firstName) \(middleName.first, default: " ")."
}

print(nameSwap("Jack Dude Jackson"))
