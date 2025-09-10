/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let anyArray: [Any] = [1.5, 1.6, 10, "happy", "joe", true, false]
print(anyArray)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for type in anyArray {
    if let int = type as? Int {
        print("The integer has a value of \(int)")
    } else if let double = type as? Double {
        print("The double has a value of \(double)")
    } else if let string = type as? String {
        print("The string is \"\(string)\"")
    } else if let bool = type as? Bool {
        print("The boolean is \(bool)")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
let dictionaryAny: [String: Any] = ["one": 1, "True": true, "1.5": 1.5, "Happy": "10.3"]
print(dictionaryAny)
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for (_, value) in dictionaryAny {
    if let double = value as? Double {
        total += double
    } else if let integer = value as? Int {
        total += Double(integer)
    } else if value is String {
        total += 1
    } else if let bool = value as? Bool {
        if bool == true {
            total += 2
        } else if bool == false {
            total -= 3
        }
    }
}
print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0

for (_, value) in dictionaryAny {
    if let double = value as? Double {
        total2 += double
    } else if let integer = value as? Int {
        total2 += Double(integer)
    } else if let string = value as? String {
        if let stringDouble = Double(string) {
            total2 += stringDouble
        }
    }
}
print(total2)
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
