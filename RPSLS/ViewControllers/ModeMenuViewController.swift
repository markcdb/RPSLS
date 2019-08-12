//
//  ModeMenuViewController.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import UIKit

class ModeMenuViewController: BaseViewController<ModeMenuViewModel> {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var classicButton: UIButton?
    @IBOutlet weak var classicDescription: UILabel?
    @IBOutlet weak var rpslsButton: UIButton?
    @IBOutlet weak var rpslsDescription: UILabel?
    
    var animator: Animator = Animator()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animator.duration = 0.7
        animator.option   = .curveEaseIn
        
        animator.enqueue(titleLabel,
                         animation: .fromBottom)
        animator.enqueue(classicDescription,
                         animation: .fromRight)
        animator.enqueue(classicButton,
                         animation: .fromRight)
        animator.enqueue(rpslsButton,
                         animation: .fromLeft)
        animator.enqueue(rpslsDescription,
                         animation: .fromLeft)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animator.performSequence()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ModeMenuViewController: BaseViewModelDelegate {
    
    func didUpdateViewmodel(_ viewModel: BaseViewModel) {
        
    }
}
