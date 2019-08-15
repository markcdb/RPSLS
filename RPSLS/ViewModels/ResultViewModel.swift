
//
//  ResultViewController.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 15/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class ResultViewModel: BaseViewModel {
    
    private var gameManager: GameManager?
    private var gameMode: GameMode?
    private var chosenMove: Move?
    private var computerMove: Move?
    
    init(delegate: BaseViewModelDelegate,
         gameMode: GameMode?,
         gameManager: GameManager?) {
        
        self.gameMode    = gameMode
        self.gameManager = gameManager

        super.init(delegate: delegate)
    }
    
    func setComputerMove(_ move: Move?) {
        
        self.computerMove = move
    }
    
    func setChosenMove(_ move: Move?) {
        
        self.chosenMove   = move
    }
    func getResult() -> GameManager.GameResult? {
        
        return gameManager?.result
    }
    
    func getGameMode() -> GameMode? {
        
        return gameMode
    }

    func getGame() -> GameMode.Game? {
        
        return gameMode?.game
    }
    
    func getGameScore() -> (player: Int, computer: Int) {
        
        return gameManager?.score ?? (0, 0)
    }
    
    func getComputerImage() -> String {
        
        return computerMove?.image ?? blank_
    }
    
    func getPlayerImage() -> String {
        
        return chosenMove?.image ?? blank_
    }
    
    func getResultText() -> String {
        
        switch gameManager?.result {
        case .Win?:
            return Titles.win
        case .Lose?:
            return Titles.lose
        case .Draw?:
            return Titles.draw
        default:
            return blank_
        }
    }
}
