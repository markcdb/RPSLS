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
    
    func matchTest(computer: Move?,
                   index: Int,
                   expectedResult: GameManager.GameResult) {
        
        gameManager?.mockMove = computer
        
        viewModel?.setMoveAt(IndexPath(row: index,
                                       section: 0))
        
        XCTAssert(viewModel?.match() == expectedResult, "Should win")
    }
    
    func testRPSRock() {
        createDependency(game: .RPS)
      
        matchTest(computer: gameManager?.createScissors(),
                  index: MoveEnum.Rock.rawValue,
                  expectedResult: .Win)
    }
    
    func testRPSPaper() {
        createDependency(game: .RPS)
       
        matchTest(computer: gameManager?.createRock(),
                  index: MoveEnum.Paper.rawValue,
                  expectedResult: .Win)
    }
    
    func testRPSScissors() {
        createDependency(game: .RPS)
        
        matchTest(computer: gameManager?.createPaper(),
                  index: MoveEnum.Scissors.rawValue,
                  expectedResult: .Win)
    }
    
    func testRPSLSLizard() {
        createDependency(game: .RPSLS)
        
        matchTest(computer: gameManager?.createSpock(),
                  index: MoveEnum.Lizard.rawValue,
                  expectedResult: .Win)
    }
    
    func testRPSLSSpock() {
        createDependency(game: .RPSLS)
        
        matchTest(computer: gameManager?.createScissors(),
                  index: MoveEnum.Spock.rawValue,
                  expectedResult: .Win)
    }
    
    func testRPSRockDraw() {
        createDependency(game: .RPS)
        
        matchTest(computer: gameManager?.createRock(),
                  index: MoveEnum.Rock.rawValue,
                  expectedResult: .Draw)
    }
    
    func testRPSPaperDraw() {
        createDependency(game: .RPS)
        
        matchTest(computer: gameManager?.createPaper(),
                  index: MoveEnum.Paper.rawValue,
                  expectedResult: .Draw)
    }
    
    func testRPSScissorsDraw() {
        createDependency(game: .RPS)
        
        matchTest(computer: gameManager?.createScissors(),
                  index: MoveEnum.Scissors.rawValue,
                  expectedResult: .Draw)
    }
    
    func testRPSLSLizardDraw() {
        createDependency(game: .RPSLS)
        
        matchTest(computer: gameManager?.createLizard(),
                  index: MoveEnum.Lizard.rawValue,
                  expectedResult: .Draw)
    }
    
    func testRPSLSSpockDraw() {
        createDependency(game: .RPSLS)
        
        matchTest(computer: gameManager?.createSpock(),
                  index: MoveEnum.Spock.rawValue,
                  expectedResult: .Draw)
    }
    
    func testRPSRockLose() {
        createDependency(game: .RPS)
        
        matchTest(computer: gameManager?.createPaper(),
                  index: MoveEnum.Rock.rawValue,
                  expectedResult: .Lose)
    }
    
    func testRPSPaperLose() {
        createDependency(game: .RPS)
        
        matchTest(computer: gameManager?.createScissors(),
                  index: MoveEnum.Paper.rawValue,
                  expectedResult: .Lose)
    }
    
    func testRPSScissorsLose() {
        createDependency(game: .RPS)
        
        matchTest(computer: gameManager?.createRock(),
                  index: MoveEnum.Scissors.rawValue,
                  expectedResult: .Lose)
    }
    
    func testRPSLSLizardLose() {
        createDependency(game: .RPSLS)
        
        matchTest(computer: gameManager?.createRock(),
                  index: MoveEnum.Lizard.rawValue,
                  expectedResult: .Lose)
    }
    
    func testRPSLSSpockLose() {
        createDependency(game: .RPSLS)
        
        matchTest(computer: gameManager?.createLizard(),
                  index: MoveEnum.Spock.rawValue,
                  expectedResult: .Lose)
    }
    
    func testRPSLSPaperVsLizard() {
        createDependency(game: .RPSLS)
        
        matchTest(computer: gameManager?.createLizard(),
                  index: MoveEnum.Paper.rawValue,
                  expectedResult: .Lose)
    }
    
    func testRPSLSScissorsVsSpock() {
        createDependency(game: .RPSLS)
        
        matchTest(computer: gameManager?.createSpock(),
                  index: MoveEnum.Scissors.rawValue,
                  expectedResult: .Lose)
    }
    
    func testScoreComputer() {
        createDependency(game: .RPS)
        
        gameManager?.mockMove = gameManager?.createPaper()
        
        viewModel?.setMoveAt(IndexPath(row: MoveEnum.Rock.rawValue,
                                       section: 0))
        
        let match = viewModel?.match()
        
        if match == .Lose {
            XCTAssert(gameManager?.score.computer == 1,
                      "Computer should score 1 after winning")
        } else {
            XCTFail("Should be lose")
        }
    }
}

extension GameViewModelTest: BaseViewModelDelegate {
    func didUpdateViewmodel(_ viewModel: BaseViewModel) {}
}
