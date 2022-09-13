//
//  Extensions.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 10.9.22..
//

import UIKit

extension Date {
    func parsedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    func parsedTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    func getDayBefore() -> String {
        let date = Calendar.current.date(byAdding: .day, value: -1, to: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = date {
            let dateString = dateFormatter.string(from: date)
            return dateString
        }
       return ""
    }
}

extension UIStoryboard {
    static var main: UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    
    static var tabBarViewController: TabBarViewController {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: Storyboard.tabBarViewControllerID.rawValue) as? TabBarViewController else { fatalError() }
        return vc
    }
    
    static var talonViewController: TalonViewController {
        guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: Storyboard.talonViewControllerID.rawValue) as? TalonViewController else {
            fatalError() }
        return vc
    }
}
