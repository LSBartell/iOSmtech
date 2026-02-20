//
//  RandomAPITests.swift
//  RandomAPITests
//
//  Created by Logan Steven Bartell on 1/26/26.
//

import XCTest
@testable import RandomAPI

final class RandomAPITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class USRepFetcherTests: XCTestCase {
    func testFetchData() async {
        let testReps = [USRep(name: "Logan", party: "Da Bomb", state: "Utah", link: "Nah no link brah")]
        let stubNeworkService = await StubMockUSRepAPIController()
        
        do {
            let fetchedReps = try await stubNeworkService.fetchUSReps(zipCode: "Meh")
            XCTAssertEqual(testReps, fetchedReps)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
        
    }
}

