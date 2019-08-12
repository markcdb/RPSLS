
//
//  GameViewModel.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class GameViewModel: BaseViewModel {
    
    private var gameManager: GameManager?
    private var gameMode: GameMode?
    private var chosenMove: Move?
    
    init(delegate: BaseViewModelDelegate,
         gameMode: GameMode?,
         gameManager: GameManager?) {
        self.gameMode    = gameMode
        self.gameManager = gameManager
        super.init(delegate: delegate)
    }
    
    func getGameMode() -> GameMode? {
        
        return gameMode
    }
    
    func getGame() -> GameMode.Game? {
        
        return gameMode?.game
    }
    
    func setMoveAt(_ indexPath: IndexPath) {
        chosenMove = gameManager?.moves[indexPath.row]
    }
    
    func match() -> Bool {
        guard let manager = gameManager else { return false }
        let player: Move   = chosenMove == nil ? manager.randomized() : chosenMove!
        let computer: Move =  manager.randomized()
        
        return manager.didPlayerWin(player,
                                    rhs: computer)
    }
}
