//
//  BaseViewModel.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation

protocol BaseViewModelDelegate: class {
    
    func didUpdateViewmodel(_ viewModel: BaseViewModelDelegate)
}

class BaseViewModel {
    
    weak var delegate: BaseViewModelDelegate?
    
    init(delegate: BaseViewModelDelegate) {
        
        self.delegate = delegate
    }
}
