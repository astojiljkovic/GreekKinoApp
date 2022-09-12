//
//  ViewController.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 9.9.22..
//

import UIKit

class LandingViewController: UIViewController {
    
    // MARK: - Properites
    
    private var dataSource: [Game]? {
        didSet {
            table.reloadData()
        }
    }
    
    var headerView: LandingHeaderView?
    
    @IBOutlet weak var table: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    private func setup() {
        fetchData()
        registerNibs()
        setupTable()
    }
    
    private func setupTable() {
        headerView = LandingHeaderView(frame: .zero)
        table.tableHeaderView = headerView
    }
    
    private func fetchData() {
        APICaller.shared.fetchData { [weak self] result in
            switch result {
            case .success(let games):
                DispatchQueue.main.async {
                    self?.dataSource = games
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func registerNibs() {
        table.register(LandingTableViewCell.nib, forCellReuseIdentifier: LandingTableViewCell.id)
    }
    // TODO: Check so it doesn't always push on the stack when clicked on table row
    // TODO: Check if its ok here to push to talonviewcontroller instead of tabbar and whats the diff
    private func transitionToTabBarVC(selectedGame: Game) {
        let vc = UIStoryboard.tabBarViewController
        vc.setSelectedGame(selectedGame: selectedGame)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension LandingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let selectedGame = dataSource?[indexPath.row] {
            transitionToTabBarVC(selectedGame: selectedGame)
        }
    }
}

extension LandingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LandingTableViewCell.id) as? LandingTableViewCell else { return UITableViewCell() }
        if let games = dataSource {
            cell.set(with: games[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
