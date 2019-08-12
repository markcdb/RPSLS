//
//  MainMenuViewModel.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class MainMenuViewModel: BaseViewModel {
    
    private var gameMode: GameMode? {
        didSet {
            delegate?.didUpdateViewmodel(self)
        }
    }
    
    override init(delegate: BaseViewModelDelegate) {
        super.init(delegate: delegate)
    }
    
    func setPlayType(_ playType: GameMode.PlayType) {
        if gameMode == nil {
            gameMode = GameMode(playType: playType)
        } else {
            gameMode?.playType = playType
        }
    }
    
    func getGameMode() -> GameMode? {
        
        return gameMode
    }
}
