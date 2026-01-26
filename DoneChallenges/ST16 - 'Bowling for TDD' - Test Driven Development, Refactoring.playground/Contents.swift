//  🏔️ MTECH Code Challenge ST16: "Bowling for TDD" 🎳
//  Concept: Practice refactoring code developed under TDD without breaking existing functionality

//  Instructions:
    //  You are a senior developer at a company building a bowling themed iOS game.
    //  You have a junior developer who is enthusiastic and talented, but who sometimes makes odd coding decisions.
    //  They have submitted the code below. You're pleased they have used TDD and their tests all work, but their some of their decisions are strange to say the least:
        //  🤨 They have gone too far in creating functions for simple code
        //  😮‍💨 They have used a bizzare while loop with a switch statement that should probably just be a For loop and an If statement

    //  Even though you should just direct them to go back and refactor their code, you decide to brutally fire them and refactor their code yourself.
    //  Refactor the code below without breaking any of the tests. Fix the above stated problems.

//  Notes:
    //  Make sure you have your console open so you can see the state of your tests.
    //  Do not change any of the testing code.

//  Examples:
    //  Input: [15,5,6,7,2,3,45,12], 3
    //  Output: [15,5,6]

//  ⌺ Black Diamond Challenge:
    //  Change the rolls array to be an array of ten Frame objects that each hold specific rolls. Change each scoring function to accommodate this.

import UIKit
import XCTest

var greeting = "Hello, playground"

class Game {
    private var rolls: [Int] = Array(repeating: 0, count: 21)
    private var currentRoll = 0
    
    let bestScorePossibleForOneFrame = 10
    
    func roll(pins: Int) {
        rolls[currentRoll] = pins
        currentRoll += 1
    }
    
    func score() -> Int {
        var score = 0
        var frameIndex = 0
        

        for i in 0..<10 {
          let currentFrame = frameIndex

            if isStrike(frameIndex) {
                // Player has bowled a strike and should get ten points and go to next frame
                score += bestScorePossibleForOneFrame + strikeBonus(currentFrame)
                frameIndex += 1
            } else if isSpare(frameIndex) {
                // Player has bowled a spare and should get ten points plust their spare bonus and go up two frames
                score += bestScorePossibleForOneFrame + spareBonus(currentFrame)
                frameIndex += 2
            } else {
            // Player has bowled a normal frame and should get however many points they earned for this frame
            score += sumOfBallsInFrame(currentFrame)
            frameIndex += 2
          }
        }
        
        return score
    }
    
    private func goToRollArrayAndFindSpecificRollForGivenFrameIndex(frameIndex: Int) -> Int {
        rolls[frameIndex]
    }
    
    private func isStrike(_ frameIndex: Int) -> Bool {
        return rolls[frameIndex] == bestScorePossibleForOneFrame
    }
    
    private func sumOfBallsInFrame(_ frameIndex: Int) -> Int {
        return rolls[frameIndex] + rolls[frameIndex + 1]
    }
    
    private func spareBonus(_ frameIndex: Int) -> Int {
        return rolls[frameIndex + 2]
    }
    
    private func strikeBonus(_ frameIndex: Int) -> Int {
        return rolls[frameIndex + 1] + rolls[frameIndex + 2]
    }
    
    private func isSpare(_ frameIndex: Int) -> Bool {
        return rolls[frameIndex] + rolls[frameIndex + 1] == bestScorePossibleForOneFrame
    }
}












class BowlingGameTests: XCTestCase {
    private var game = Game()
    
    func testGutterGame() throws {
        for _ in 0..<20 {
            game.roll(pins: 0)
        }
        XCTAssertEqual(0, game.score())
    }
    
    func testAllOnes() throws {
        for _ in 0..<20 {
            game.roll(pins: 1)
        }
        XCTAssertEqual(20, game.score())
    }
    
    func testOneSpare() throws {
        rollSpare()
        game.roll(pins: 3)
        for _ in 0..<17 {
            game.roll(pins: 0)
        }
        XCTAssertEqual(16, game.score())
    }
    
    func testOneStrike() throws {
        rollStrike()
        game.roll(pins: 3)
        game.roll(pins: 4)
        for _ in 0..<16 {
            game.roll(pins: 0)
        }
        XCTAssertEqual(24, game.score())
    }
    
    func testPerfectGame() throws {
        for _ in 0..<12 {
            game.roll(pins: 10)
        }
        XCTAssertEqual(300, game.score())
    }
    
    private func rollSpare() {
        game.roll(pins: 5)
        game.roll(pins: 5)
    }
    
    private func rollStrike() {
        game.roll(pins: 10)
    }
}

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
BowlingGameTests.defaultTestSuite.run()
