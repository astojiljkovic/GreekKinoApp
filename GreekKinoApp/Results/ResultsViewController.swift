//
//  ResultsViewController.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 12.9.22..
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - Properties
    
    private var dataSource: [GameResult]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var viewModel: ResultsViewModel?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ResultsViewModel(view: self)
        setupCollectionView()
        registerNibs()
        viewModel?.fetchData()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: collectionView.frame.width, height: 30)
        collectionView.collectionViewLayout = layout
    }

    private func registerNibs() {
        collectionView.register(TalonNumbersCollectionViewCell.nib, forCellWithReuseIdentifier: TalonNumbersCollectionViewCell.id)
        collectionView.register(CellHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeaderCollectionReusableView.identifier)
    }
    
    func fillDataSource(gameResults: [GameResult]) {
        DispatchQueue.main.async {
            self.dataSource = gameResults
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ResultsViewController: UICollectionViewDelegate {
    
}

extension ResultsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TalonNumbersCollectionViewCell.id, for: indexPath) as? TalonNumbersCollectionViewCell else { return UICollectionViewCell() }
        if let dataSource = dataSource {
            for gameResult in dataSource {
                for winningNumber in gameResult.winningNumbers.list{
                    cell.set(with: winningNumber)
                    return cell
                }
            }
        }
//        cell.set(with: indexPath.row + 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeaderCollectionReusableView.identifier, for: indexPath) as! CellHeaderCollectionReusableView
        header.configure()
        return header
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let numberOfSections = dataSource?.count else { return 1}
        return numberOfSections
    }
    
}
