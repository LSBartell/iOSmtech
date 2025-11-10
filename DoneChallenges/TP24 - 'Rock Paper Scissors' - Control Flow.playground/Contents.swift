//  🏔️ MTECH Code Challenge TP24: "Rock Paper Scissors"
//  Concept: Practice writing functions with game logic

//  Instructions:
    //  Create a function that takes in two strings. The strings will be either "rock", "paper", or "scissors", with one input for each player respectively.
    //  Determine who wins, and return a string saying which player won.

//  Examples:
    //  Input: "scissors", "paper"
    //  Output: "Player 1 won!"

    //  Input: "scissors", "rock"
    //  Output: "Player 2 won!"
    
    //  Input: "paper", "paper"
    //  Output: "Draw!"

//  ⌺ Black Diamond Challenge:
    //  Expand your game to include Spock and Lizard as weapon options. You can view the matchups here: 🔗https://www.samkass.com/theories/RPSSL.html

import Foundation

enum RockPaperScissorsHand: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"

}

func rockPaperScissors(player1: RockPaperScissorsHand, player2: RockPaperScissorsHand) -> String {
    print("Player1 plays \(player1.rawValue)")
    print("Player2 plays \(player2.rawValue)")
    switch player1 {
    case .paper:
        if player2 == .paper {
            return "Tie"
        } else if player2 == .rock {
            return "Player1 Wins"
        } else {
            return "player2 wins"
        }
    case .rock:
        if player2 == .rock {
            return "Tie"
        } else if player2 == .paper {
            return "Player2 Wins"
        } else {
            return "Player1 Wins"
        }
    case .scissors:
        if player2 == .scissors {
            return "Tie"
        } else if player2 == .paper {
            return "Player1 Wins"
        } else {
            return "Player2 Wins"
        }
    }
}

func playRockPaperScissors() {
    var result = "Tie"
    let hand: [RockPaperScissorsHand] = [.paper, .rock, .scissors]
    while result == "Tie" {
        result = rockPaperScissors(player1: hand.randomElement()!, player2: hand.randomElement()!)
        print(result)
    }
}


playRockPaperScissors()
