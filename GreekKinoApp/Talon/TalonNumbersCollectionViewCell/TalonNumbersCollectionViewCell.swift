//
//  TalonNumbersCollectionViewCell.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 11.9.22..
//

import UIKit

class TalonNumbersCollectionViewCell: UICollectionViewCell, XibCollectionViewCellInitializable {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var numberBaseView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // TODO: for setting up background color and themes
    
    private func setup() {
        numberLabel.numberOfLines = 0
    }
    
    func set(with number: Int) {
        numberLabel.text = String(number)
    }
}
