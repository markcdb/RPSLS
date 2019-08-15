//
//  ViewModelFactory.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class ViewModelFactory {
    
    static func createMainMenuVM(delegate: BaseViewModelDelegate) -> MainMenuViewModel {
        
        return MainMenuViewModel(delegate: delegate)
    }
    
    static func createModeMenuVM(gameMode: GameMode?,
                                 delegate: BaseViewModelDelegate) -> ModeMenuViewModel {
        
        return ModeMenuViewModel(delegate: delegate,
                                 gameMode: gameMode)
    }
    
    static func createGameViewModel(gameManager: GameManager?,
                                    gameMode: GameMode?,
                                    delegate: BaseViewModelDelegate) -> GameViewModel {
        
        return GameViewModel(delegate: delegate,
                             gameMode: gameMode,
                             gameManager: gameManager)
    }
    
    static func createResultViewModel(gameManager: GameManager?,
                                      gameMode: GameMode?,
                                      delegate: BaseViewModelDelegate) -> ResultViewModel {
        
        return ResultViewModel(delegate: delegate,
                               gameMode: gameMode,
                               gameManager: gameManager)
    }
}
