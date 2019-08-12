//
//  ModeMenuViewModel.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class ModeMenuViewModel: BaseViewModel {
    
    private var gameMode: GameMode? {
        didSet {
            delegate?.didUpdateViewmodel(self)
        }
    }
    
    init(delegate: BaseViewModelDelegate,
                  gameMode: GameMode?) {
        self.gameMode = gameMode
        super.init(delegate: delegate)
    }
    
    func setGame(_ game: GameMode.Game) {
       
        gameMode?.game = game
    }
    
    func getGameMode() -> GameMode? {
        
        return gameMode
    }
    
    func getGame() -> GameMode.Game? {
        
        return gameMode?.game
    }
}
