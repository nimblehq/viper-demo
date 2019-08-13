//
//  ReposViewController.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
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
        output?.viewDidLoad()
    }
}

// MARK: - ReposViewInput
extension ReposViewController: ReposViewInput {
    func configure() {
        setupUI()
    }

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
    }

    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension ReposViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else {
            fatalError("Cannot file UITableViewCell")
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
