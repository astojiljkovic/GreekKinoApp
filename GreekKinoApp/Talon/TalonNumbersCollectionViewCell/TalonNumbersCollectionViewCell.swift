//
//  TalonNumbersCollectionViewCell.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 11.9.22..
//

import UIKit

class TalonNumbersCollectionViewCell: UICollectionViewCell, XibCollectionViewCellInitializable {

    private var isCellSelected: Bool = false
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var numberBaseView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        numberLabel.numberOfLines = 0
        numberLabel.textAlignment = .center

        baseView.layer.borderWidth = 1
        baseView.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    func set(with number: Int) {
        numberLabel.text = String(number)
    }
    
    func checkIfCellIsSelected() -> Bool {
        if isCellSelected {
            numberBaseView.layer.borderWidth = 0
            isCellSelected = false
            return true
        } else {
            numberBaseView.layer.borderWidth = 2
            numberBaseView.layer.cornerRadius = numberBaseView.frame.size.width/2
            numberBaseView.layer.borderColor = UIColor.systemBlue.cgColor
            isCellSelected = true
            return false
        }
    }
    func unSelect() {
        numberBaseView.layer.borderWidth = 0
        isCellSelected = false
    }
}
