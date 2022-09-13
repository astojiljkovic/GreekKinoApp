//
//  ResultsTableViewCell.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 12.9.22..
//

import UIKit

class ResultsTableViewCell: UITableViewCell, XibTableCellInitializable {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        setupCollectionView()
    }
    
    private func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        registerNibs()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: collectionView.frame.size.width, height: UILabel().frame.size.height + 20)
        collectionView.collectionViewLayout = layout
        
    }
    
    private func registerNibs() {
        collectionView.register(TalonNumbersCollectionViewCell.nib, forCellWithReuseIdentifier: TalonNumbersCollectionViewCell.id)
        collectionView.register(CellHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeaderCollectionReusableView.identifier)
    }
    
}

extension ResultsTableViewCell: UICollectionViewDelegate {
    
}

extension ResultsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TalonNumbersCollectionViewCell.id, for: indexPath) as? TalonNumbersCollectionViewCell else { return UICollectionViewCell()}
        cell.set(with: indexPath.row + 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeaderCollectionReusableView.identifier, for: indexPath) as! CellHeaderCollectionReusableView
        header.configure()
        return header
    }
}
