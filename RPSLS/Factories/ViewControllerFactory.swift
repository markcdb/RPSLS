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
    
    static func createResultVC(gameMode: GameMode?,
                               gameManager: GameManager?,
                               computerMove: Move?,
                               chosenMove: Move?) -> ResultViewController? {
        let sid = StoryboardIDs.result
        
        let viewController  = Storyboard.rpsls.instantiateViewController(withIdentifier: sid)
        guard let vc = viewController as? ResultViewController else { return nil }
        
        let vm       = ViewModelFactory.createResultViewModel(gameManager: gameManager,
                                                              gameMode: gameMode,
                                                              delegate: vc)
        vm.setChosenMove(chosenMove)
        vm.setComputerMove(computerMove)
        
        vc.viewModel = vm
        
        return vc
    }
}
