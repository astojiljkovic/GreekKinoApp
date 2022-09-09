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
    
    // this could use async await, check it out
    func fetchData(completion: @escaping(Result<[Game], Error>) -> Void) {
        
        guard let url = URL(string: Constats.api) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode([Game].self, from: data)
                print(results)
                
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
