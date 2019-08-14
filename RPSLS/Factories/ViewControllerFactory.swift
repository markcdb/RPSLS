//
//  ViewControllerFactory.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

class ViewControllerFactory {
    
    static func createModeMenuVC(gameMode: GameMode?) -> ModeMenuViewController? {
        let sid = StoryboardIDs.modeMenu
        
        let viewController  = Storyboard.rpsls.instantiateViewController(withIdentifier: sid)
        guard let vc = viewController as? ModeMenuViewController else { return nil }
        
        let vm       = ViewModelFactory.createModeMenuVM(gameMode: gameMode,
                                                                delegate: vc)
        vc.viewModel = vm
        
        return vc
    }
    
    static func createGameVC(gameMode: GameMode?) -> GameViewController? {
        let sid = StoryboardIDs.game
        
        let viewController  = Storyboard.rpsls.instantiateViewController(withIdentifier: sid)
        guard let vc = viewController as? GameViewController else { return nil }
        
        let vm       = ViewModelFactory.createGameViewModel(gameManager: GameManager(gameMode: gameMode),
                                                            gameMode: gameMode,
                                                            delegate: vc)
        vc.viewModel = vm
        
        return vc
    }
}
