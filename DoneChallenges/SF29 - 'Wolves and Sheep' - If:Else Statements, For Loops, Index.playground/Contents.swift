//  🏔️ MTECH Code Challenge SF29: "Wolves and Sheep"
//  Concept: Think through the logic of how to identify the position of an item in an array relative to the size of the array. It is not uncommon to need to think about how elements in an array are ordered relative to each other, so this skill will be useful in future development.

//  Instructions:
    //  Wolves have been reintroduced to Great Britain. You are a sheep farmer, and are now plagued by wolves which pretend to be sheep. Fortunately, you are good at spotting them.

    //  Warn the sheep in front of the wolf that it is about to be eaten. Remember that you are standing at the front of the queue which is at the end of the array:

    //  [sheep, sheep, sheep, sheep, sheep, wolf, sheep, sheep] (YOU ARE HERE AT THE FRONT OF THE QUEUE)
    //    7      6      5      4      3            2      1
    //  If the wolf is the closest animal to you, return "Pls go away and stop eating my sheep". Otherwise, return "Oi! Sheep number N! You are about to be eaten by a wolf!" where N is the sheep's position in the queue.

//  Notes:
    //  There will always be exactly one wolf in the array.

//  Examples:
    //  Input: ["sheep", "sheep", "sheep", "wolf", "sheep"]
    //  Output: "Oi! Sheep number 1! You are about to be eaten by a wolf!"

    //  Input: ["sheep", "sheep", "wolf"]
    //  Output: "Pls go away and stop eating my sheep"

//  ⌺ Black Diamond Challenge:
    //  Create another function. This time, return the first and last n elements of the array. If the first and last n elements overlap (i.e., 3 first and 3 last in a 5 element array), return the whole array.

func wolvesAndSheep(_ input: [String]) {
    let wolfSpot = input.firstIndex(of: "wolf")
    if input.last == "wolf" {
        print("Pls go away and stop eating my sheep")
    } else {
        if let wolfSpot {
            print("Oi! Sheep number \(input.count - 1 - wolfSpot)! You are about to be eaten by a wolf!")
        }
    }
}

let array = ["sheep", "wolf", "sheep", "sheep", "sheep"]
let array2 = ["sheep", "sheep", "wolf"]
let array3 = ["sheep", "sheep", "wolf", "sheep"]
wolvesAndSheep(array)
wolvesAndSheep(array2)
wolvesAndSheep(array3)

//func blackDiamond(array: [Any], elements: Int) -> [Any] {
//    if elements * 2 >= array.count {
//        return array
//    } else {
//        
//    }
//}
import Foundation
