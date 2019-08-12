//
//  ViewController.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import UIKit

class MainMenuViewController: BaseViewController<MainMenuViewModel> {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var pvcButton: UIButton?
    @IBOutlet weak var cvcButton: UIButton?
    
    var animator: Animator = Animator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        animator.enqueue(titleLabel,
                         animation: .top)
        animator.enqueue(pvcButton,
                         animation: .left)
        animator.enqueue(cvcButton,
                         animation: .right)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animator.performSequence()
    }
}

