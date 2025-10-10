//  🏔️ MTECH Code Challenge TP03: "Validating Phone Numbers"
//  Concept: Practice validating inputs to make sure they're what you're expecting; practice formatting text (you'll have to do this all the time!); practice using throwing functions to produce errors when something goes wrong

//  Instructions:
    // The API you're using needs a specific format for phone numbers: (xxx)-xxx-xxxx.
    // Write a throwing function that takes in a string and returns a formatted phone string, or throws if the string that was passed in is not a valid phone number.

//  Examples:
    //  Input: "5558675309"
    //  Output: "(555)-867-5309"

    //  Input: "phone number"
    //  Output: no output produced, error thrown and caught instead

//  ⌺ Black Diamond Challenge:
    //  Add a parameter to your function that allows you to select a country from an enum of supported phone number formats. Make it so your app successfully validates and formats phone numbers for three other countries.
    //  You can find phone number formats here: 🔗https://en.wikipedia.org/wiki/National_conventions_for_writing_telephone_numbers

import Foundation

enum NumberError: Error {
    typealias RawValue = String
    case invalid
}

func phoneNumber(_ input: String) -> String? {
    guard Int(input) != nil && input.count == 10 else {
        return nil
    }
    let areaCode = input.prefix(3)
    let middle = input.dropFirst(3).prefix(3)
    let end = input.suffix(4)
    return "(\(areaCode))-\(middle)-\(end)"
}
let phoneNumbers = "5558675309"

let answer = phoneNumber(phoneNumbers)

if let answer {
    print(answer)
} else {
    print("Invalid number")
}
