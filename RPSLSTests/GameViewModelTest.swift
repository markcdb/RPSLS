//
//  RPSLSTests.swift
//  RPSLSTests
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import XCTest
@testable import RPSLS

enum MoveEnum: Int {
    case Rock = 0
    case Paper
    case Scissors
    case Lizard
    case Spock
}

class GameViewModelTest: XCTestCase {

    var gameManager: MockGameManager?
    var gameMode: GameMode?
    var viewModel: GameViewModel?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func createDependency(game: GameMode.Game) {
        gameMode              = GameMode(playType: .PVC)
        gameMode?.game        = game
        gameManager           = MockGameManager(gameMode: gameMode)
        viewModel             = ViewModelFactory.createGameViewModel(gameManager: gameManager,
                                                                     gameMode: gameMode,
                                                                     delegate: self)
    }
    
    func matchTest(computer: Move?, indexPath: IndexPath) {
        gameManager?.mockMove = computer
        
        viewModel?.setMoveAt(indexPath)
        
        XCTAssert(viewModel?.match() ?? false, "Should win")
    }
    
    func testRPSRock() {
        createDependency(game: .RPS)
      
        matchTest(computer: gameManager?.createScissors(),
                  indexPath: IndexPath(row: MoveEnum.Rock.rawValue,
                                       section: 0))
    }
    
    func testRPSPaper() {
        createDependency(game: .RPS)
       
        matchTest(computer: gameManager?.createRock(),
                  indexPath: IndexPath(row: MoveEnum.Paper.rawValue,
                                       section: 0))
    }
    
    func testRPSScissors() {
        createDependency(game: .RPS)
        
        matchTest(computer: gameManager?.createPaper(),
                  indexPath: IndexPath(row: MoveEnum.Scissors.rawValue,
                                       section: 0))
    }
    
    func testRPSLSLizard() {
        createDependency(game: .RPSLS)
        
        matchTest(computer: gameManager?.createSpock(),
                  indexPath: IndexPath(row: MoveEnum.Lizard.rawValue,
                                       section: 0))
    }
    
    func testRPSLSSpock() {
        createDependency(game: .RPSLS)
        
        matchTest(computer: gameManager?.createScissors(),
                  indexPath: IndexPath(row: MoveEnum.Spock.rawValue,
                                       section: 0))
    }
    
    
}

extension GameViewModelTest: BaseViewModelDelegate {
    func didUpdateViewmodel(_ viewModel: BaseViewModel) {}
}
