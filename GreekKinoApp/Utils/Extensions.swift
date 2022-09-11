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
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
    
    func parsedTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.string(from: self)
        return dateString
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
