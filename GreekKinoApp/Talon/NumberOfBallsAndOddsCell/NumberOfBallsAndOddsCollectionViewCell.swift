//
//  NumberOfBallsAndOddsCollectionViewCell.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 12.9.22..
//

import UIKit

class NumberOfBallsAndOddsCollectionViewCell: UICollectionViewCell, XibCollectionViewCellInitializable {
    
    @IBOutlet weak var baseView: UIView!
    
    @IBOutlet weak var numberOfBallsLabel: UILabel!
    
    @IBOutlet weak var oddsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        numberOfBallsLabel.textAlignment = .center
        oddsLabel.textAlignment = .center
        
    }
    
    func set(numOfBalls: Int) {
        numberOfBallsLabel.text = String(numOfBalls)
    }
}
