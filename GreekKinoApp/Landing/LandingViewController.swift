//
//  ViewController.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 9.9.22..
//

import UIKit

class LandingViewController: UIViewController {
    
    private var dataSource: [Game]? {
        didSet {
            table.reloadData()
        }
    }
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    
    private func fetchData() {
        APICaller.shared.fetchData { [weak self] result in
            switch result {
            case .success(let games):
                print("woo games")
            case .failure(let error):
                print(error)
            }
        
        }
    }
}

extension LandingViewController: UITableViewDelegate {
    
}

extension LandingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
