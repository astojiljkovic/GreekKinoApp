//
//  LandingHeaderView.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 10.9.22..
//

import UIKit

class LandingHeaderView: UIView {
    
    // MARK: - Properties

    lazy var gameNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var startingTimeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var timeRemainingLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
        
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray4
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        addSubview(gameNameLabel)
        addSubview(startingTimeLabel)
        addSubview(timeRemainingLabel)
        
        let gameNameLabelConstraints = [
            gameNameLabel.topAnchor.constraint(equalTo:topAnchor, constant: 10),
            gameNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            gameNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(gameNameLabelConstraints)
    }
}
