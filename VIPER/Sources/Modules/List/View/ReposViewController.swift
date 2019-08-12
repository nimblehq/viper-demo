//
//  ReposViewController.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import UIKit

final class ReposViewController: UIViewController {
    
    // MARK: - Views
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    // MARK: - VIPER
    var output: ReposViewOutput?
    
    // MARK: - Properties
    private var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}

// MARK: - VIPER
extension ReposViewController: View {}

// MARK: - Connect to Presenter
extension ReposViewController: ReposViewInput {
    func showEmptyMessage() {
        tableView.isHidden = true
        emptyView.isHidden = false
    }
    
    func showData(_ data: [String]) {
        self.data = data
        tableView.isHidden = false
        emptyView.isHidden = true
        tableView.reloadData()
    }
}

// MARK: - Setup UI
extension ReposViewController {
    private func setupUI() {
        setupNavi()
        setupTableView()
    }
    
    private func setupNavi() {
        navigationItem.title = "viper repos".uppercased()
        let refreshItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapRefreshButton))
        navigationItem.rightBarButtonItem = refreshItem
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Actions
extension ReposViewController {
    private func loadData() {
        output?.fetch()
    }
    
    @objc func didTapRefreshButton(_ sender: Any) {
        output?.fetch()
    }
}

// MARK: - UITableViewDataSource
extension ReposViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = data[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ReposViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        output?.detail(at: index)
    }
}
