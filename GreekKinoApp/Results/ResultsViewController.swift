//
//  ResultsViewController.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 12.9.22..
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
    }
    
    private func registerNibs() {
        tableView.register(ResultsTableViewCell.nib, forCellReuseIdentifier: ResultsTableViewCell.id)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ResultsViewController: UITableViewDelegate {
    
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultsTableViewCell.id) as? ResultsTableViewCell else { return UITableViewCell() }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
