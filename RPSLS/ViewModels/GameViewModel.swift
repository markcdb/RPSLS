
//
//  GameViewModel.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class GameViewModel: BaseViewModel {
    
    public var chosenMove: Move?
    public var computerMove: Move?
    
    private var gameManager: GameManager?
    private var gameMode: GameMode?
    
    public var hasSelectedMove: Bool {
        return chosenMove != nil
    }
    
    init(delegate: BaseViewModelDelegate,
         gameMode: GameMode?,
         gameManager: GameManager?) {
        self.gameMode    = gameMode
        self.gameManager = gameManager
        super.init(delegate: delegate)
    }
    
    func resetChosen() {
        chosenMove = nil
    }
    
    func getGameMoveCount() -> Int {
        guard let gm = gameManager else { return 0 }
        
        return gm.moves.count
    }
    
    func getGameManager() -> GameManager? {
        
        return gameManager
    }

    func getGameMode() -> GameMode? {
        
        return gameMode
    }
    
    func getGame() -> GameMode.Game? {
        
        return gameMode?.game
    }
    
    func getGameScore() -> (Int, Int) {
        
        return gameManager?.score ?? (0, 0)
    }
    
    func getMoveImageAt(_ indexPath: IndexPath) -> String {
        guard indexPath.row < (gameManager?.moves.count ?? 0) else { return blank_ }
        return gameManager?.moves[indexPath.row].image ?? blank_
    }
    
    func getMoveNameAt(_ indexPath: IndexPath) -> String {
        guard indexPath.row < (gameManager?.moves.count ?? 0) else { return blank_ }
        return gameManager?.moves[indexPath.row].name ?? blank_
    }

    func setMoveAt(_ indexPath: IndexPath) {
        chosenMove = gameManager?.moves[indexPath.row]
    }
    
    func match() {
        guard let manager = gameManager else { return }
        let player: Move   = chosenMove == nil ? manager.randomized() : chosenMove!
        let computer: Move =  manager.randomized()
        
        self.computerMove = computer
        
        manager.compareMove(player,
                            rhs: computer,
                            completion: {[weak self] in
                                guard let self = self else { return }
                                
                                self.delegate?.didUpdateViewmodel(self)
                                
        })
    }
    
    func getResult() -> GameManager.GameResult? {
        
        return gameManager?.result
    }
}
