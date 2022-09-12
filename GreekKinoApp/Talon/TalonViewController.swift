//
//  TalonViewController.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 11.9.22..
//

import UIKit

class TalonViewController: UIViewController {
    
    // MARK: - Properties
    
    private var selectedGame: Game?
    
    @IBOutlet weak var selectedGameInfoView: UIView!
    @IBOutlet weak var selectedGameInfoLabel: UILabel!
    
    @IBOutlet weak var numberOfBallsAndOddsView: UIView!
    @IBOutlet weak var numberOfBallsLabel: UILabel!
    @IBOutlet weak var oddsLabel: UILabel!
    
    @IBOutlet weak var numberOfBallsAndOddsCollectionView: UICollectionView!
    
    @IBOutlet weak var numberOfSelectedBallsLabel: UILabel!
    @IBOutlet weak var numberOfSelectedBallsValueLabel: UILabel!
    @IBOutlet weak var timeRemeiningLabel: UILabel!
    @IBOutlet weak var timeRemainingValueLabel: UILabel!
    
    
    @IBOutlet weak var numbersCollectionView: UICollectionView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupSelectedGameInfo()
        registerNibs()
        setupNumbersCollectionView()
        setupNumberOfBallsAndOddsCollectionView()
    }
    
    private func setup() {
        numberOfSelectedBallsLabel.text = "Br. izabranih loptica:"
        timeRemeiningLabel.text = "Preostalo vreme:"
    }
    
    
    private func setupSelectedGameInfo() {
        
        selectedGameInfoView.backgroundColor = .systemGray3
        if let selectedGame = selectedGame {
            selectedGameInfoLabel.text = "Vreme izvlacenja \(Date(timeIntervalSince1970: Double(selectedGame.drawTime/1000)).parsedTime()) | Kolo: \(selectedGame.drawId)"
        }
        numberOfBallsAndOddsView.backgroundColor = .systemGray4
        numberOfBallsLabel.textAlignment = .center
        numberOfBallsLabel.font = UIFont.boldSystemFont(ofSize: 18)
        numberOfBallsLabel.text = "B.K"
        oddsLabel.textAlignment = .center
        oddsLabel.font = UIFont.boldSystemFont(ofSize: 18)
        oddsLabel.text = "Kvota"
    }
    
    private func setupNumberOfBallsAndOddsCollectionView() {
        numberOfBallsAndOddsCollectionView.backgroundColor = .systemGray4
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: numberOfBallsAndOddsCollectionView.bounds.height, height: numberOfBallsAndOddsCollectionView.bounds.height)
        numberOfBallsAndOddsCollectionView.collectionViewLayout = layout
    }
    
    private func setupNumbersCollectionView() {
        numbersCollectionView.dataSource = self
        numbersCollectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        numbersCollectionView.collectionViewLayout = layout
    }
    
    private func registerNibs() {
        numbersCollectionView.register(TalonNumbersCollectionViewCell.nib, forCellWithReuseIdentifier: TalonNumbersCollectionViewCell.id)
        numberOfBallsAndOddsCollectionView.register(NumberOfBallsAndOddsCollectionViewCell.nib, forCellWithReuseIdentifier: NumberOfBallsAndOddsCollectionViewCell.id)
    }
    
    func setSelectedGame(selectedGame: Game) {
        self.selectedGame = selectedGame
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension TalonViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == numberOfBallsAndOddsCollectionView {
            return 15
        }
        return 80
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == numberOfBallsAndOddsCollectionView {
            guard let cell = numberOfBallsAndOddsCollectionView.dequeueReusableCell(withReuseIdentifier: NumberOfBallsAndOddsCollectionViewCell.id, for: indexPath) as? NumberOfBallsAndOddsCollectionViewCell else { return UICollectionViewCell()}
            cell.set(numOfBalls: indexPath.row + 1)
            return cell
        }
        
        guard let cell = numbersCollectionView.dequeueReusableCell(withReuseIdentifier: TalonNumbersCollectionViewCell.id, for: indexPath) as? TalonNumbersCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.set(with: indexPath.row + 1)
        return cell
    }
}

extension TalonViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == numbersCollectionView {
            guard let cell = numbersCollectionView.cellForItem(at: indexPath) as? TalonNumbersCollectionViewCell else { return }
            cell.checkIfCellIsSelected()
        }
    }
}
