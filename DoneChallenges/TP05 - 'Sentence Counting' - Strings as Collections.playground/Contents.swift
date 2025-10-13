//  🏔️ MTECH Code Challenge TP05: "Sentence Counting"
//  Concept: Practice how to think programatically about straightforward language tasks

//  Instructions:
    //  Given a string, return the number of sentences found in the string.

//  Examples:
    //  Input: "Alas, poor Yorick! I knew him, Horatio: a fellow of infinite jest, of most excellent fancy: he hath borne me on his back a thousand times; and now, how abhorred in my imagination it is! my gorge rims at it."
    //  Output: 3

//  Bonus challenge:
    //  Ensure that abbreviations ("Mr.", "e.g.") don't end a sentence.
    //  Handle sentences that end with multiple punctuation marks ("!?", "...")
    //  Return an array with the sentences ordered by length.

import Foundation

func countSentences(_ sentence: String) -> Int {
    let punctuation = [".", "!", "?"]
    var punctuationCount = 0
    for character in sentence {
        if punctuation.contains(String(character)) {
            punctuationCount += 1
        }
    }
    return punctuationCount
}

let myString = "Alas, poor Yorick! I knew him, Horatio: a fellow of infinite jest, of most excellent fancy: he hath borne me on his back a thousand times; and now, how abhorred in my imagination it is! my gorge rims at it."

print(countSentences(myString))

//func blackDiamond(_ sentence: String) -> Int {
//    var sentenceArray = sentence.components(separatedBy: " ")
//    let punctuation = [".", "!", "?"]
//    for word in sentenceArray {
//        if word.first != word.capitalized.first
//    }
//    return 0
//}
