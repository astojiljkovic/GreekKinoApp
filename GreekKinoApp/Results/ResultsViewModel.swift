//
//  ResultsViewModel.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 14.9.22..
//

import UIKit

class ResultsViewModel {
    
    private var dataSource: [GameResult]?
    weak var view: ResultsViewController?
    
    init(view: ResultsViewController){
        self.view = view
    }
    
    func fetchData() {
        APICaller.shared.fetchResults { [weak self] results in
            switch results {
            case .success(let gameResults):
                self?.dataSource = gameResults
                if let dataSource = self?.dataSource {
                    self?.passDataSourceToView(dataSource: dataSource)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func passDataSourceToView(dataSource: [GameResult]) {
        view?.fillDataSource(gameResults: dataSource)
    }
    
}
