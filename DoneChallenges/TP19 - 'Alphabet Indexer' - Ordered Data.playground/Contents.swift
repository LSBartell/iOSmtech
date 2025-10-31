//  🏔️ MTECH Code Challenge TP19: "Alphabet Indexer"
//  Concept: Practice storing and evaluating a custom dataset

//  Instructions:
    //  When provided with a letter, return its position in the English alphabet.
    //  Your code should either throw an error, return nil, or fail to compile if something other than a single letter is provided.

//  Examples:
    //  Input: "a"
    //  Output: 1

//  Notes:
    //  Your code should be case insensitive.

//  ⌺ Black Diamond Challenge:
    //  Extend the functionality to handle strings with multiple characters. For such strings, return the sum of the positions of all the letters in the string. If any non-letter characters are present, throw an error, return nil, or fail to compile.
    //  Rewrite your function to not rely on using a literal array for the alphabet. (In other words, the alphabet itself should not appear in your function.)

import Foundation

enum StringError: Error {
    case notALetter, doesNotContainSingularLetter
}

func alphabetIndex(letter: String) throws -> Int {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    guard letter.lowercased().count == 1 else { throw StringError.doesNotContainSingularLetter }
    guard alphabet.contains(letter.lowercased()) else { throw StringError.notALetter }
    let index = alphabet.firstIndex(of: Character(letter.lowercased()))!
    return (alphabet.distance(from: alphabet.startIndex, to: index) + 1)
}

do {
    try print(alphabetIndex(letter: "b"))
} catch {
    print(error)
}

do {
    try print(alphabetIndex(letter: "."))
} catch {
    print(error)
}

do {
    try print(alphabetIndex(letter: "word"))
} catch {
    print(error)
}

