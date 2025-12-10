//  🏔️ MTECH Code Challenge ND11: "Case Comparison"
//  Concept: Practice creating extensions and comparing two variables with unique criteria

//  Instructions:
    //  Extend the Character type with a method that takes another Character as input and returns an Int as output.
    //  The method should check if the input character and the character the method is called on are the same case.
        //  If either of the characters is not a letter, return -1
        //  If both characters are the same case, return 1
        //  If both characters are letters, but not the same case, return 0

//  Examples:
    //  Input: Character("a").sameCaseAs(Character("b"))
    //  Output: 1

    //  Input: Character("C").sameCaseAs(Character("d"))
    //  Output: 0

    //  Input: Character("5").sameCaseAs(Character("f"))
    //  Output: -1

//  ⌺ Black Diamond Challenge:
    //  Make it so that your function does not rely on existing Character methods or properties (i.e., .isLowercase and .isUppercase).
    //  Use an enum as the return type instead of an Int.
    //  Add another method that will instead return the input character in the same case as self.

import Foundation

enum CharacterCaseComparison {
    case sameCase, differentCase, invalidCharacter
}

extension Character {
    func sameCaseAs(_ compareChar: Character) -> CharacterCaseComparison {
        let uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let lowercase = "abcdefghijklmnopqrstuvwxyz"
        guard uppercase.contains(self) || lowercase.contains(self) else { return CharacterCaseComparison.invalidCharacter }
        guard uppercase.contains(compareChar) || lowercase.contains(compareChar) else { return CharacterCaseComparison.invalidCharacter }
        if uppercase.contains(self) && uppercase.contains(compareChar) {
            return CharacterCaseComparison.sameCase
        } else if lowercase.contains(self) && lowercase.contains(compareChar) {
            return CharacterCaseComparison.sameCase
        } else {
            return CharacterCaseComparison.differentCase
        }
    }
    
    func makeSameCase(_ compareChar: Character) -> Character {
        let comparison = self.sameCaseAs(compareChar)
        switch comparison {
        case .differentCase:
            if compareChar.isUppercase {
                return Character(compareChar.lowercased())
            } else {
                return Character(compareChar.uppercased())
            }
        case .invalidCharacter, .sameCase:
            return compareChar
        }
    }
}

print(Character("a").sameCaseAs(Character("b")))
print(Character("C").sameCaseAs(Character("d")))
print(Character("5").sameCaseAs(Character("f")))

print(Character("C").makeSameCase(Character("b")))
