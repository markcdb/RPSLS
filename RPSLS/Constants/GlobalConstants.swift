//
//  GlobalConstants.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation
import UIKit

let blank_ = ""

struct StoryboardIDs {
    
    static let modeMenu        = "ModeMenuViewController"
    static let game            = "GameViewController"
    static let result          = "ResultViewController"
}

struct Storyboard {
    
    static let rpsls    = UIStoryboard(name: "RPSLS", bundle: nil)
}

struct MoveNames {
    
    static let rock     = "Rock"
    static let paper    = "Paper"
    static let scissors = "Scissors"
    static let lizard   = "Lizard"
    static let spock    = "Spock"
}

struct Titles {
    
    static let lose     = "You lose"
    static let win      = "You win"
    static let draw     = "Draw"
}

struct Cells {
    
    static let moveCell = "MoveCell"
}

struct Heights {
    
    static let cvExtendedHeight = (UIScreen.main.bounds.height / 2) - 80
}
