//
//  MoveCell.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 13/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import UIKit

class MoveCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var maskedView: UIImageView?
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected == true {
                UIImageView.animate(withDuration: 0.13) {
                    self.maskedView?.alpha    = 0
                    self.imageView?.transform = CGAffineTransform(scaleX: 1.2,
                                                                  y: 1.2)
                }
            } else {
                UIImageView.animate(withDuration: 0.13) {
                    self.maskedView?.alpha    = 1
                    self.imageView?.transform = CGAffineTransform(scaleX: 1.0,
                                                                  y: 1.0)
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let radii = (self.imageView?.frame.width ?? 0.0) / 2
        self.imageView?.layer.cornerRadius  = radii
        self.imageView?.layer.masksToBounds = true
        
        self.maskedView?.alpha               = 0
        self.maskedView?.layer.cornerRadius  = radii
        self.maskedView?.layer.masksToBounds = true
    }
}

//MARK: - Custom methods
extension MoveCell {
    
    func setDeselect() {
        guard self.maskedView?.alpha == 0 else { return }
        
        UIView.animate(withDuration: 0.4) {
            self.maskedView?.alpha           = 1
        }
    }
}
