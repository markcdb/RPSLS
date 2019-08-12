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
    
    override func loadView() {
        super.loadView()
        
        viewModel = ViewModelFactory.createMainMenuVM(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        animator.enqueue(titleLabel,
                         animation: .fromTop)
        animator.enqueue(pvcButton,
                         animation: .fromLeft)
        animator.enqueue(cvcButton,
                         animation: .fromRight)
        
        navigationController?.setNavigationBarHidden(true,
                                                     animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animator.performSequence()
    }
    
    override func push() {
        super.push()
        
        let mode = viewModel?.getGameMode()
        
        if let vc = ViewControllerFactory.createModeMenuVC(gameMode: mode) {
            navigationController?.pushViewController(vc,
                                                     animated: true)
        }
    }
}

//MARK: - IBActions
extension MainMenuViewController {
    @IBAction func didTapPVC(_ sender: UIButton) {
        
        self.viewModel?.setPlayType(.PVC)
    }
    
    @IBAction func didTapCVC(_ sender: UIButton) {
        
        self.viewModel?.setPlayType(.CVC)
    }
}

//MARK: - Custom Methods
extension MainMenuViewController {
    
}

//MARK: - ViewModel Delegate
extension MainMenuViewController: BaseViewModelDelegate {
    
    func didUpdateViewmodel(_ viewModel: BaseViewModel) {
        //Game type selected
        push()
    }
}
