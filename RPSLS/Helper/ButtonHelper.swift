//
//  ButtonHelper.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? backgroundColor?.withAlphaComponent(1.0) : backgroundColor?.withAlphaComponent(0.9)
            
            if isHighlighted == true {
                UIButton.animate(withDuration: 0.13) {
                    self.transform = CGAffineTransform(scaleX: 0.95,
                                                       y: 0.95)
                }
            } else {
                UIButton.animate(withDuration: 0.13) {
                    self.transform = CGAffineTransform(scaleX: 1.0,
                                                       y: 1.0)
                }
            }
        }
    }
}
