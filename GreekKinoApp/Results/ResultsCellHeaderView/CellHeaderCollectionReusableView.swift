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
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    func configure() {
        backgroundColor = .systemGray4
        addSubview(selectedGameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectedGameLabel.frame = bounds
    }
}
