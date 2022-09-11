//
//  TalonViewController.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 11.9.22..
//

import UIKit

class TalonViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var numbersCollectionView: UICollectionView!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setupNumbersCollectionView()
    }
    private func setupNumbersCollectionView() {
        numbersCollectionView.dataSource = self
        numbersCollectionView.delegate = self
    }
    
    private func registerNibs() {
        numbersCollectionView.register(TalonNumbersCollectionViewCell.nib, forCellWithReuseIdentifier: TalonNumbersCollectionViewCell.id)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension TalonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 80
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = numbersCollectionView.dequeueReusableCell(withReuseIdentifier: TalonNumbersCollectionViewCell.id, for: indexPath) as? TalonNumbersCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.set(with: indexPath.row + 1)
        return cell
    }
}

extension TalonViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("pressed")
    }
}
