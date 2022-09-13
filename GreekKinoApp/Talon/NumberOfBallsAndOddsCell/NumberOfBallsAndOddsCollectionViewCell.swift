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
    @IBOutlet weak var separatorView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        baseView.backgroundColor = .systemGray4
        numberOfBallsLabel.textAlignment = .center
        oddsLabel.textAlignment = .center
        separatorView.layer.borderWidth = 1
        separatorView.layer.borderColor = UIColor.systemGray.cgColor
    }
    
    func set(numOfBalls: Int, odd: Double) {
        numberOfBallsLabel.text = String(numOfBalls)
        oddsLabel.text = String(odd)
    }
}
