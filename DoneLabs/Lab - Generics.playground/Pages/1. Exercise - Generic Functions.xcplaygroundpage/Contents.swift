/*:
## Exercise - Generic Functions
 
 The `duplicate` function below works only when working with Ints, but its body could work with any type. Rewrite the function to use a generic type `<T>` instead. Test your new function by calling it several times, using a String, an Int, and a Double.
 */

import Foundation

func duplicate<T>(_ int: T) -> (T, T) {
    return (int, int)
}

print(duplicate(4))
print(duplicate("hello"))
print(duplicate(2.5))
//:  The function below retrieves a random value from an array of Ints and then deletes that value. The `inout` keyword means that it modifies the array passed into it directly. This function could work with an array of any type, so long as the type conforms to Equatable. Rewrite the function to use a generic type `<U>` instead, constraining to Equatable types. Test your new function by calling it several times, using an array of Strings, of Ints, and of Doubles.

func pullRandomElement<U>(_ array: inout [U]) -> U? where U : Equatable {
    let randomElement = array.randomElement()
    
    guard let randomElement, let index = array.firstIndex(of: randomElement) else { return nil }
    array.remove(at: index)
    
    return randomElement
}
var array1 = [1, 2, 3, 4]
var array2 = ["string1", "string2"]
print(pullRandomElement(&array1)!)
print(pullRandomElement(&array2)!)
//:  The function below sorts an array, then returns a new array containing only the first and last Strings of the array after sorting. This function could work with an array of any type, so long as the type conforms to Comparable. Rewrite the function to use a generic type `<V>` instead, constraining to Comparable types. Test your new function by calling it several times, using an array of Strings, of Ints, and of Doubles.

func minMaxArray<V>(_ array: [V]) -> [V] where V : Comparable {
    var output: [V] = []
    
    let minElement = array.min()
    let maxElement = array.max()
    
    if let minElement {
        output.append(minElement)
    }
    
    if let maxElement {
        output.append(maxElement)
    }
    
    return output
}

print(minMaxArray([1,6,8,3,5]))
print(minMaxArray(["f", "g", "a"]))

/*:
page 1 of 4  |  [Next: Exercise - Generic Types](@next)
 */
