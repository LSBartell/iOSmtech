import UIKit

//  🏔️ MTECH Code Challenge SF18: "Insertion Sort"
//  Concept: Continue learning about different sorting methods; practice manipulating data in an array

//  Instructions:
    //  Just like your previous code challenge, you are not allowed to use the .sort() method
    //  Create a function that takes in an array of Ints. Sort the array using an insertion sort
    //  A visualization of what an insertion sort is can be seen here: 🔗https://en.wikipedia.org/wiki/Insertion_sort#/media/File:Insertion-sort-example-300px.gif

//  Examples:
    //  Input: [-5, 4, 0, 64, 11]
    //  Output: [-5, 0, 4, 11, 64]

//  ⌺ Black Diamond Challenge:
    //  Read about Quicksort, one of the most commonly used and efficient algorithms for sorting, and is part of the basis for the .sort() method in Swift. 🔗https://en.wikipedia.org/wiki/Quicksort
    //  You do not need to read the whole page, but gain a basic understanding of the method--select a pivot point, sort items around it, then repeat in smaller sections.
    //  Take the following array of numbers and, using cut (command ⌘ + X) and paste (command ⌘ + V), sort them manually using a Quicksort algorithm. Use 10 as your pivot value.
    //  It may be useful to paste them into a new line with each iteration of your sort.
    //  [20 17 14 1 6 5 2 3 9 11 16 19 15 4 18 15 13 12 8 7 10]

 import Foundation

func insertionSort(array: [Int]) -> [Int] {
    var sortingArray = array
    var removedNumber: Int
    for number in sortingArray {
        removedNumber = number
        sortingArray.remove(at: sortingArray.firstIndex(of: removedNumber) ?? 0)
        for iteration in sortingArray {
            if removedNumber > iteration {
                sortingArray.insert(removedNumber, at: sortingArray.firstIndex(of: iteration) ?? 0)
                continue
            }
        }
    }
    return sortingArray
}

let myArray = [-5, 4, 0, 64, 11]
print(insertionSort(array: myArray))
