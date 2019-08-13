//
//  GameManager.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class GameManager {
    enum GameResult {
        case Win
        case Lose
        case Draw
    }
    
    var gameMode: GameMode?
    var moves: [Move]                       = []
    var score: (player: Int, computer: Int) = (0,0) //lhs is player, rhs is computer
    
    init (gameMode: GameMode?) {
        createMoveSetBasedOn(gameMode?.game)
        self.gameMode = gameMode
    }
    
    func createMoveSetBasedOn(_ game: GameMode.Game?) {
        score = (0,0)
        moves.removeAll()
        
        switch game {
        case .RPS?:
            moves.append(contentsOf: createRPS())
        case .RPSLS?:
            moves.append(contentsOf: createRPSLS())
        default:
            break
        }
    }
    
    func randomized() -> Move {
        return moves[Int.random(in: 0..<moves.count)]
    }
    
    func compareMove(_ lhs: Move, rhs: Move) -> GameResult {
        var move = lhs.winSet?[rhs.name ?? blank_]
        
        if move != nil {
            score.player += 1
            return .Win
        }
        
        move = rhs.winSet?[lhs.name ?? blank_]
        if move != nil {
            score.computer += 1
            return .Lose
        }
        
        return .Draw
    }
    
    func createRock() -> Move {
        let rock                                 = Move(name: MoveNames.rock,
                                                        image: MoveNames.rock.lowercased())
        rock.winSet?[MoveNames.scissors]         = MoveNames.scissors

        switch gameMode?.game {
        case .RPSLS?:
            rock.winSet?[MoveNames.lizard]       = MoveNames.lizard
        default:
            break
        }

        return rock
    }
    
    func createPaper() -> Move {
        let paper                             = Move(name: MoveNames.paper,
                                                     image: MoveNames.paper.lowercased())
        paper.winSet?[MoveNames.rock]         = MoveNames.rock
        
        switch gameMode?.game {
        case .RPSLS?:
            paper.winSet?[MoveNames.spock]    = MoveNames.spock
        default:
            break
        }
        
        return paper
    }
    
    func createScissors() -> Move {
        let scissors                           = Move(name: MoveNames.scissors,
                                                      image: MoveNames.scissors.lowercased())
        scissors.winSet?[MoveNames.paper]      = MoveNames.paper
        
        switch gameMode?.game {
        case .RPSLS?:
            scissors.winSet?[MoveNames.lizard] = MoveNames.lizard
        default:
            break
        }
        
        return scissors
    }
    
    func createLizard() -> Move {
        let lizard                             = Move(name: MoveNames.lizard,
                                                      image: MoveNames.lizard.lowercased())
        lizard.winSet?[MoveNames.paper]        = MoveNames.paper
        lizard.winSet?[MoveNames.spock]        = MoveNames.spock
        
        return lizard
    }
    
    func createSpock() -> Move {
        let spock                             = Move(name: MoveNames.spock,
                                                     image: MoveNames.spock.lowercased())
        spock.winSet?[MoveNames.scissors]     = MoveNames.scissors
        spock.winSet?[MoveNames.rock]         = MoveNames.rock
        
        return spock
    }
}

//MARK: - Privates
extension GameManager {
    private func createRPS() -> [Move] {
        
        return [createRock(),
                createPaper(),
                createScissors()]
    }
    
    private func createRPSLS() -> [Move] {

        return [createRock(),
                createPaper(),
                createScissors(),
                createLizard(),
                createSpock()]
    }
}

class MockGameManager: GameManager {
    
    var mockMove: Move?
    
    override func compareMove(_ lhs: Move, rhs: Move) -> GameResult {
        if let move = mockMove {
            return super.compareMove(lhs,
                                      rhs: move)
        }
        
        return super.compareMove(lhs,
                                  rhs: rhs)
    }
}
