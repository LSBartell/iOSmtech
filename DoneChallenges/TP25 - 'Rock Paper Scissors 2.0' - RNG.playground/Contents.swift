//  🏔️ MTECH Code Challenge TP25: "Rock Paper Scissors 2.0"
//  Concept: Add custom randomization to a function. Black Diamond: Parse arrays.

//  Instructions:
    //  Create a function that takes in a string as input. This is the users move (either rock, paper, or scissors).
    //  Randomly decide what the computers choice is.
    //  Return a string which declares the winner.

//  Examples:
    //  Input: "rock"
    //  Output: "I chose paper. You lose!"
    //  Output: "I chose rock. Draw! Go again?"
    //  Output: "I chose scissors. I lose."

//  ⌺ Black Diamond Challenge:
    //  Create another function that instead accepts an array as input. If only one move is entered, generate a random one for the computer; if two are entered, compare them.
    //  If more than two moves are input, the winners are the players who voted for the most popular move.

import Foundation

enum RockPaperScissorsHand: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

func lose(computerHandString: String) -> String {
    "I chose \(computerHandString). I win!"
}

func win(computerHandString: String) -> String {
    "I chose \(computerHandString). You win!"
}

func soloRockPaperScissors(hand: RockPaperScissorsHand) -> String {
    let computerHand = RockPaperScissorsHand.allCases.randomElement()
    let computerHandString = computerHand!.rawValue
    guard hand != computerHand else {
        return "I chose \(computerHandString). Draw! Go again?"
    }
    
    return switch computerHand {
    case .paper:
        if hand == .rock {
            lose(computerHandString: computerHandString)
        } else {
            win(computerHandString: computerHandString)
        }
    case .rock:
        if hand == .paper {
            lose(computerHandString: computerHandString)
        } else {
            win(computerHandString: computerHandString)
        }
    default:
        if hand == .paper {
            lose(computerHandString: computerHandString)
        } else {
            win(computerHandString: computerHandString)
        }
    }
}


print(soloRockPaperScissors(hand: .paper))
