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
        //print(Date().parsedDate())
//        print(Date().getDayBefore())
        
        guard let url = URL(string: Constants.apiForUpcoming) else { return }
        
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
        guard let url = URL(string: Constants.apiForResults) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(GameResultResponse.self, from: data)
                print(results)
                completion(.success(results.content))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
