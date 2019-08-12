//
//  GameMode.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation


struct GameMode {
    enum PlayType {
        case PVC
        case CVC
    }
    
    enum Game {
        case RPS
        case RPSLS
    }
    
    var playType: PlayType
    var game: Game?
    
    init(playType: PlayType) {
        self.playType = playType
    }
}
