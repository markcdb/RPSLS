//
//  Move.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

protocol MoveSet {
    
    var winSet: [String: String]? { get set }
}

class Move: MoveSet {
    
    var id: String = UUID().uuidString
    var name: String?
    var image: String?
    
    //Using hashtable so that searching is constant O(1)
    var winSet: [String : String]? = [:]
    
    init(name: String,
         image: String) {
        self.name   = name
        self.image  = image
    }
    
    deinit {
        print("\(name ?? blank_) has been deinitialized")
    }
}
