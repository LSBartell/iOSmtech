//  🏔️ MTECH Code Challenge TP28: "Telephone Pole Calculator"
//  Concept: Practice working with geometry in Swift code

//  Instructions:
    //  There are telephone poles along the side of a road. The distance between the poles is the same and the width of the poles is the same. Your function accepts three arguments:
        //  Number of poles (> 1);
        //  Distance between poles (10 - 30 meters);
        //  Diameter of the poles (10 - 50 centimeters)
    //  Calculate the distance between the center of the first and the center of the last telephone pole.

//  Notes:
    //  For the purpose of this challenge, assume the poles are perfectly round.

//  Examples:
    //  Input: (numOfPillars: 5, distance: 25, radius: 10)
    //  Output: 10,040

//  ⌺ Black Diamond Challenge:
    //  On the opposite side of the street are another set of telephone poles, of the same number, same radius, and same distances. Create a second function that returns the distance between the first pole on one side of the road and the last pole on the other.

import Foundation

func poleCalculatorInMeters(numOfPillars: Int, distanceInMeters: Int, diameterInCm: Int) -> Double {
    var totalCm = diameterInCm + ((numOfPillars - 2) * diameterInCm)
    var totalMeters = (numOfPillars - 1) * distanceInMeters
    return Double(totalCm / 100) + Double(totalMeters)
}

print(poleCalculatorInMeters(numOfPillars: 5, distanceInMeters: 25, diameterInCm: 10))

func poleCalculatorInCm(numberOfPillars: Int, distanceInMeters: Int, diameterInCm: Int) -> Int {
    (diameterInCm + ((numberOfPillars - 2) * diameterInCm)) + ((numberOfPillars - 1) * (distanceInMeters * 100))
}

print(poleCalculatorInCm(numberOfPillars: 5, distanceInMeters: 25, diameterInCm: 10))
