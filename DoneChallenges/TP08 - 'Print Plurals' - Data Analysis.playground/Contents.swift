//  🏔️ MTECH Code Challenge TP08: "Print Plurals"
//  Concept: Practice looping over an array of data and analyzing its contents

//  Instructions:
    //  Write a function that takes in an array of strings. Print all the plural strings that end in 's'

//  Notes:
    //  You do not need to worry about irregular plurals ("deer", "geese")
    //  You do not need to worry about other words that end in 's' ("class", "GPS")

//  Examples:
    //  Input: ["Apple", "Oranges", "Pineapple", "Bananas", "Grapes", "Raspberry"]
    //  Output:
        //  Oranges
        //  Bananas
        //  Grapes

//  ⌺ Black Diamond Challenge:
    //  Write an answer to the following question as a comment: What do you think it would involve to write a function that does identify irregular plurals and exclude words that happen to end in 's'? What would you have to do to accomplish that?
    //  Write another function that converts all singular strings in an array to plural, but does not add an 's' if they are already plural. (You still do not need to worry about irregular plurals.)
    //  Input: ["Apple", "Oranges", "Pineapple", "Bananas", "Grapes"]
    //  Output: Apples, Oranges, Pineapples, Bananas, Grapes

import Foundation

func plurals(in input: [String]) {
    for string in input {
        if string.last == "s" {
            print(string)
        } else {
            print("\(string)s")
        }
    }
}

var array = ["Apple", "Oranges", "Pineapple", "Bananas", "Grapes", "Raspberry"]

plurals(in: array)

// you might need to make an impossibly large array of words that end in s or are irregular plurals to check against in your array, or make your array only accept certain types of strings such as enums and only have to check against the possible inputs
