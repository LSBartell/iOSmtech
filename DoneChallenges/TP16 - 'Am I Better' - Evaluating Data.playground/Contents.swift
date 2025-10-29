//  🏔️ MTECH Code Challenge TP16: "Am I Better?"
//  Concept: Practice evaluating data from an array

//  Instructions:
    //  There was a test in your class and you passed it. Congratulations!
    //  But you're an ambitious person. You want to know if you're better than the average student in your class.
    //  Create a function that accepts two parameters as input, your score and an array of your peers' scores, and returns true if you're better than them, or false if you're worse.

// Notes:
    //  Your points are not included in the array of your class's points. For calculating the average point you may add your points to the given array.

//  Examples:
    //  Input: myScore: 100, classScores: [80,39,90,88,68,78,39,99]
    //  Output: true

//  ⌺ Black Diamond Challenge:
    //  Create another function. This one should instead accept a dictionary with String keys and Int values. The strings represent the names of each of your classmates, and the integers are their scores. Return an array of the names of every classmate that you scored better than.

import Foundation

func amIBetter(myScore: Int, classScores: [Int]) -> Bool {
    var mutableClassScores = classScores
    mutableClassScores.append(myScore)
    let average = ((mutableClassScores.reduce(0, +)) / mutableClassScores.count)
    if myScore > average {
        return true
    } else {
        return false
    }
}

print(amIBetter(myScore: 100, classScores: [80,39,90,88,68,78,39,99]))
print(amIBetter(myScore: 20, classScores: [80,39,90,88,68,78,39,99]))
