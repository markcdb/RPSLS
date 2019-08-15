//
//  CollectionCellFactory.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 13/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation
import UIKit

class CollectionCellFactory {
    
    static func createMoveCell(collectionView: UICollectionView,
                               indexPath: IndexPath,
                               viewModel: GameViewModel?) -> MoveCell? {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.moveCell,
                                                      for: indexPath) as? MoveCell
        
        cell?.maskedView?.alpha = 0
        
        if let cell = cell {
            cell.imageView?.image = UIImage(named: viewModel?.getMoveImageAt(indexPath) ?? blank_)
        }
        
        return cell
    }
}
