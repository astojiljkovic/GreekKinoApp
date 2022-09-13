//
//  APICaller.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 9.9.22..
//

import UIKit

class APICaller {
    static let shared = APICaller()
    private init() {}
    
    func fetchUpcomingGames(completion: @escaping(Result<[Game], Error>) -> Void) {
        
        guard let url = URL(string: Constats.apiForUpcoming) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode([Game].self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func fetchResults(completion: @escaping(Result<[GameResult],Error>) -> Void) {
        // TODO: need to get 2 dates, yesterday and today so i can put them into url, check notlfix
    }
}
