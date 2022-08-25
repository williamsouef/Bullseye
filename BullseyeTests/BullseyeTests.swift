//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by William Souef on 15/08/2022.
//

import XCTest

@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    
    var game : Game!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        game = nil
    }


    func testScorePositive() {
        
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    func testScoreNegative() {
        
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
   
    func TestNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 100)
        
        
    }
    func testScoreExact() {
        
        let guess = game.target
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    func testScoreClose() {
        
        let guess = game.target + 2
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
    }
    
    func testRestart() {
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
        
        
    }

    func testLeaderboard() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardentries.count, 1)
        XCTAssertEqual(game.leaderboardentries[0].score, 100)
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardentries.count, 2)
        XCTAssertEqual(game.leaderboardentries[0].score, 200)
        XCTAssertEqual(game.leaderboardentries[1].score, 100)
}

}
