//  🏔️ MTECH Code Challenge TP13: "Finding Primes"
//  Concept: Solve common math problems in Swift

//  Instructions:
    //  Create a function that checks to see if a given Int is a prime number. Return true if it is. Return false if it is not.

//  Examples:
    //  Input: 7
    //  Output: True

    //  Input: 12
    //  Output: False

//  ⌺ Black Diamond Challenge:
    //  Create a function that generates a list of prime numbers up to a given Int.
    //  The function should return an array of Ints containing all the prime numbers up to and including the given number.

import Foundation

func isPrimeNumber(_ input: Int) -> Bool {
    guard input > 1 else { return false }
   return !(2..<input).contains(where: { input % $0 == 0 })
}

print(isPrimeNumber(7))
print(isPrimeNumber(12))

func blackDiamond(_ input: Int) -> [Int] {
    guard input > 1 else { return [] }
    var answer: [Int] = []
        for number in (2...input) {
            if isPrimeNumber(number) {
                answer.append(number)
            }
        }
    return answer
}

print(blackDiamond(25))
