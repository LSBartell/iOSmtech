//  🏔️ MTECH Code Challenge ND06: "String-Longer"
//  Concept: Practice manipulating Strings in unique ways and outputting the result

//  Instructions:
    //  Create a function that takes and returns a String.
    //  Given any input string, return a string in which each character (case-sensitive) is repeated once.

//  Examples:
    //  Input: "String"
    //  Output: "SSttrriinngg"
    
    //  Input: "...1234!"
    //  Output: "......11223344!!"

//  ⌺ Black Diamond Challenge:
    //  Extend the function to accept an additional parameter n (an integer) that specifies the number of times each character should be repeated.
    //  If n is not provided, it should default to 2 (i.e., each character is repeated once).
    //  Additionally, create a second function that reverses the resulting string from the first function (e.g. "SSttrriinngg" becomes "ggnniirrttSS").

import Foundation

func stringLonger(string stringInput: String, repeat repeatInput: Int?) -> String {
    var repeater = repeatInput ?? 2
    var answer = ""
    for character in stringInput {
        for _ in 1...repeater {
            answer.append(character)
        }
    }
   return answer
}


func stringLongerReversed(string stringInput: String, repeat repeatInput: Int?) -> String {
    String(stringLonger(string: stringInput, repeat: repeatInput).reversed())
}

print(stringLonger(string: "...1234!", repeat: nil))
print(stringLonger(string: "...1234!", repeat: 4))
print(stringLongerReversed(string: "...1234!", repeat: 3))
