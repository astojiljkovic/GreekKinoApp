//
//  LandingTableViewCell.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 10.9.22..
//

import UIKit

class LandingTableViewCell: UITableViewCell, XibTableCellInitializable {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var gameStartTimeLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(with model: Game) {
        let date = Date(timeIntervalSince1970: Double(model.drawTime/1000))
        gameStartTimeLabel.text = date.parsedTime()
    }
}
