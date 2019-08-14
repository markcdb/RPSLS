//
//  GameViewController.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController<GameViewModel> {

    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var progressContainer: UIView?
    @IBOutlet weak var progressLabel: UILabel?
    
    var circularProgress: CircularProgress?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let flowLayout = CenterAlignedCollectionViewFlowLayout()
        
        collectionView?.collectionViewLayout = flowLayout
        collectionView?.delegate   = self
        collectionView?.dataSource = self
        
        collectionView?.register(UINib(nibName: Cells.moveCell,
                                       bundle: nil),
                                 forCellWithReuseIdentifier: Cells.moveCell)
        /*
        if viewModel?.getGame() == .RPSLS {
            collectionViewHeightConstraint.constant = Heights.cvExtendedHeight
        }
        */
        
        circularProgress = CircularProgress(frame: CGRect(x: 0,
                                                          y: 0,
                                                          width: progressContainer?.frame.width ?? .zero,
                                                          height: progressContainer?.frame.height ?? .zero))
        if let circ = circularProgress {
            progressContainer?.addSubview(circ)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        circularProgress?.animateInSeconds(10,
                                           label: progressLabel,
                                           completion: {[weak self] in
                                            guard let self = self else { return }
                                            self.startRandomSelect()
        })
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

//MARK: - Custom methods
extension GameViewController {
    
    func startRandomSelect() {
        guard let count = viewModel?.getGameMoveCount(),
            count > 0,
            viewModel?.hasSelectedMove == false else { return }
        
        let indexPath = IndexPath(row: Int.random(in: 0..<count),
                                  section: 0)
        
        collectionView?.selectItem(at: indexPath,
                                   animated: true,
                                   scrollPosition: .top)
        if let cv = collectionView {
            collectionView(cv,
                           didSelectItemAt: indexPath)
        }
    }
}
//MARK: - GameViewModel Delegate
extension GameViewController: BaseViewModelDelegate {
    
    func didUpdateViewmodel(_ viewModel: BaseViewModel) {}
}

//MARK: - Collectionview Delegate and Datasource
extension GameViewController: UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let finalSize = CGSize(width: (width / 3) - 20,
                               height: width / 3)
        
        return finalSize
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return viewModel?.getGameMoveCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = CollectionCellFactory.createMoveCell(collectionView: collectionView,
                                                        indexPath: indexPath,
                                                        viewModel: viewModel)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        viewModel?.setMoveAt(indexPath)
        
        let rows = collectionView.numberOfItems(inSection: 0)
        
        for i in 0..<rows {
            guard i != indexPath.row else { continue }
            
            let indexPath = IndexPath(row: i,
                                      section: 0)
            
            if let cell   = collectionView.cellForItem(at: indexPath) as? MoveCell {
                cell.setDeselect()
            }
        }
    }
}
