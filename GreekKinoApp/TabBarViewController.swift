//
//  TabBarViewController.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 10.9.22..
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Properties
    
    enum Tabs: Int {
        case talon
        case additionalGame
        case live
        case results
        case quickGame
        
        var localName: String {
            switch self {
            case .talon:
                return "Talon"
            case .additionalGame:
                return "Dodatna igra"
            case .live:
                return "Izvlacenje uzivo"
            case .results:
                return "Rezultati izvlacenja"
            case .quickGame:
                return "Brzi kino"
            }
        }
        
        var localIcon: String {
            switch self {
            case .talon:
                return "talonIcon"
            case .additionalGame:
                return "additionalGameIcon"
            case .live:
                return "liveIcon"
            case .results:
                return "resultsIcon"
            case .quickGame:
                return "quickGameIcon"
            }
        }
    }
    
    private var selectedGame: Game?
    
    let tabNames = [Tabs.talon.localName, Tabs.additionalGame.localName, Tabs.live.localName, Tabs.results.localName, Tabs.quickGame.localName]
    let tabIcons = [Tabs.talon.localIcon, Tabs.additionalGame.localIcon, Tabs.live.localIcon, Tabs.results.localIcon, Tabs.quickGame.localIcon]

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        for (index, tab) in tabBar.items!.enumerated() {
            tab.title = tabNames[index]
            tab.image = UIImage(named: tabIcons[index])
            tab.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        tabBar.tintColor = .systemYellow
        
    }
    
    func setSelectedGame(selectedGame: Game) {
        guard let viewControllers = viewControllers else { return }
        setTalonSelectedGame(selectedGame: selectedGame, viewControllers: viewControllers)
    }
    
    func setTalonSelectedGame(selectedGame: Game, viewControllers: [UIViewController]) {
        for vc in viewControllers {
            if let talonVC = vc as? TalonViewController {
                talonVC.setSelectedGame(selectedGame: selectedGame)
            }
        }
    }
}
