//  🏔️ MTECH Code Challenge ND12: "ShortLongShort"
//  Concept: Practice concatenating strings based on unique criteria

//  Instructions:
    //  Create a function that takes two strings, "a" and "b", as input, and returns a string.
    //  Your function should combine the input strings in the form short+long+short, with the shorter string on the outside and the longer string on the inside.

//  Notes:
    //  The strings will not be the same length, but they may be empty (zero length).

//  Examples:
    //  Input: "hey", "howdy"
    //  Output: "heyhowdyhey"
    
    //  Input: "after", "time"
    //  Output: "timeaftertime"

//  ⌺ Black Diamond Challenge:
    //  Create a function that can split back apart the shortlongshort strings, returning them in a Tuple of type (String, String)

import Foundation

func shortLongshort(a: String, b: String) -> String {
    var short = ""
    var long = ""
    if a.count > b.count {
        long = a
        short = b
    } else {
        long = b
        short = a
    }
    return "\(short + long + short)"
}

print(shortLongshort(a: "Hey", b: "Howdy"))
