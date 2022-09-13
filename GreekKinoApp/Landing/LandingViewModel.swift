//
//  LandingViewModel.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 13.9.22..
//

import UIKit

class LandingViewModel {
    
    private var dataSource: [Game]?
    weak var view: LandingViewController?
    
    init(view: LandingViewController) {
        self.view = view
    }
    
    func fetchData() {
        APICaller.shared.fetchUpcomingGames { [weak self] result in
            switch result {
            case .success(let games):
                self?.dataSource = games
                if let dataSource = self?.dataSource {
                    self?.passDataSourceToView(dataSource: dataSource)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func passDataSourceToView(dataSource: [Game]) {
        view?.fillDataSource(games: dataSource)
    }
}
