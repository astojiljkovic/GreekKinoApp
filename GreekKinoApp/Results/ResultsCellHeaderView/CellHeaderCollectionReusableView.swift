//
//  CellHeaderCollectionReusableView.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 13.9.22..
//

import UIKit

class CellHeaderCollectionReusableView: UICollectionReusableView {
       
    static let identifier = "CellHeaderCollectionReusableView"
    
    lazy var selectedGameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    func configure(gameResult: GameResult) {
        backgroundColor = .systemGray4
        addSubview(selectedGameLabel)
        applyConstraints()
        selectedGameLabel.text = "Vreme izvlacenja \(Date(timeIntervalSince1970: Double(gameResult.drawTime/1000)).parsedTime()) | Kolo: \(gameResult.drawId)"
    }
    
    private func applyConstraints() {
        let selectedGameLabelConstraints = [
            selectedGameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            selectedGameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            selectedGameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            selectedGameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            
        ]
        NSLayoutConstraint.activate(selectedGameLabelConstraints)
    }
}
