/*:
## Exercise - Forms of Try
 
 The throwing function below produces an error if the user attempts to divide by zero. Call the function using `try` in a `do`/`catch` statement, printing the error to the console. Test using valid and invalid inputs to see the result.
 */

 enum MathError: Error {
    case divideByZero
 }

func divide(_ numerator: Double, by denominator: Double) throws -> Double {
    guard denominator != 0 else { throw MathError.divideByZero }
    return numerator / denominator
}

do {
    let answer = try divide(4, by: 2)
    print(answer)
} catch {
    print(error)
}

do {
    let answer = try divide(3, by: 0)
    print(answer)
} catch {
    print(error)
}
 
//:  Now call the function using `try?`. Since errors are not handled when using `try?`, you do not need a `do`/`catch` statement. Test using valid and invalid inputs, printing the result.
try? print(divide(4, by: 2))
try? print(divide(4, by: 0))

//:  Finally, call the function using `try!` and test it with an invalid input. What happens if the input is invalid? Write a comment explaining your answer, then set a valid input.
try! print(divide(3, by: 1))
// the progrm crashes because we are forcing try on an error
/*:
[Previous](@previous)  |  page 2 of 4  |  [Next: Exercise - Associated Values](@next)
 */
