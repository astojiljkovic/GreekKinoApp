//
//  TalonViewModel.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 13.9.22..
//

import UIKit

class TalonViewModel {
    
    private var timer = Timer()
    private var seconds = 0.0
    private var isTimerRunning = false
    
    weak var view: TalonViewController?
    
    init(view: TalonViewController) {
        self.view = view
    }
    
    func getRunTimer(selectedGame: Game) {
        let date = Date(timeIntervalSince1970: Double(selectedGame.drawTime/1000))
        let differenceInSeconds = date.timeIntervalSince(Date())
        seconds = differenceInSeconds
        if isTimerRunning == false {
            runTimer()
        }
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
            let timeString = timeString(time: TimeInterval(seconds))
            view?.setTimeRemainingValue(timeString: timeString)
        }
    }
    
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
}
