//
//  LandingTableViewCell.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 10.9.22..
//

import UIKit

class LandingTableViewCell: UITableViewCell, XibTableCellInitializable {
    
    private var timer = Timer()
    private var seconds = 0.0
    private var isTimerRunning = false
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var gameStartTimeLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(with model: Game) {
        let date = Date(timeIntervalSince1970: Double(model.drawTime/1000))
        let differenceInSeconds = date.timeIntervalSince(Date())
        seconds = differenceInSeconds
        if isTimerRunning == false {
            runTimer()
        }
        gameStartTimeLabel.text = date.parsedTime()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @objc
    func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
        } else {
            seconds -= 1
            remainingTimeLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
}
