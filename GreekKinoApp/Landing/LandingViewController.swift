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
    
    var viewModel: LandingViewModel?
    
    var headerView: GameHeaderView?
    
    @IBOutlet weak var table: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LandingViewModel(view: self)
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.fetchData()
    }
    
    private func setup() {
        viewModel?.fetchData()
        registerNibs()
        setupTable()
    }
    
    private func setupTable() {
        headerView = GameHeaderView(frame: .zero)
        table.tableHeaderView = headerView
    }
    
    func fillDataSource(games: [Game]) {
        DispatchQueue.main.async {
            self.dataSource = games
        }
    }
    
    private func registerNibs() {
        table.register(LandingTableViewCell.nib, forCellReuseIdentifier: LandingTableViewCell.id)
    }
    
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
