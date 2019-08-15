//
//  ResultViewController.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 14/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import UIKit

class ResultViewController: BaseViewController<ResultViewModel> {

    
    @IBOutlet weak var computerImageView: UIImageView?
    @IBOutlet weak var computerScore: UILabel?
    @IBOutlet weak var playerImageView: UIImageView?
    @IBOutlet weak var playerScore: UILabel?
    @IBOutlet weak var resultLabel: UILabel?
    
    @IBOutlet weak var retryButton: UIButton?
    @IBOutlet weak var closeButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let pScore               = viewModel?.getGameScore().player ?? 0
        let cScore               = viewModel?.getGameScore().computer ?? 0
        computerImageView?.image = UIImage(named: viewModel?.getComputerImage() ?? blank_)?.rotate(radians: .pi)
        playerImageView?.image   = UIImage(named: viewModel?.getPlayerImage() ?? blank_)
        resultLabel?.text      = viewModel?.getResultText()
        playerScore?.text      = String(pScore)
        computerScore?.text    = String(cScore)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func didTapRetry(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapClose(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension ResultViewController: BaseViewModelDelegate {
    
    func didUpdateViewmodel(_ viewModel: BaseViewModel) {}
}
