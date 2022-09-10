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
        label.text = "Test"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var startingTimeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TEST"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var timeRemainingLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " testenina"
        label.numberOfLines = 0
        return label
    }()
        
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        backgroundColor = .systemGray4
        addSubview(gameNameLabel)
        addSubview(startingTimeLabel)
        addSubview(timeRemainingLabel)
        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        
        let gameNameLabelConstraints = [
            gameNameLabel.topAnchor.constraint(equalTo:topAnchor, constant: 10),
            gameNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            gameNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ]
        
        let startingTimeLabelConstraints = [
            startingTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            startingTimeLabel.topAnchor.constraint(equalTo: gameNameLabel.bottomAnchor, constant: 10),
            startingTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ]
        
        let timeRemainingLabelConstraints = [
            timeRemainingLabel.topAnchor.constraint(equalTo: gameNameLabel.bottomAnchor, constant: 10),
            timeRemainingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            timeRemainingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(gameNameLabelConstraints)
        NSLayoutConstraint.activate(startingTimeLabelConstraints)
        NSLayoutConstraint.activate(timeRemainingLabelConstraints)
    }
}
