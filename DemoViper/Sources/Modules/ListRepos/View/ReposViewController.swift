//
//  ReposViewController.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

// sourcery: AutoMockable
protocol ReposViewInput: AnyObject {
    func configure()
    func showEmptyMessage()
    func showData(_ data: [ReposViewItem])
}

// sourcery: AutoMockable
protocol ReposViewOutput: AnyObject {
    func viewDidLoad()
    func detail(at index: Int)
}

final class ReposViewController: UIViewController {

    // MARK: - Views
    let tableView = UITableView()
    let emptyView = UIView()
    let emptyLabel = UILabel()
    
    // MARK: - VIPER
    var output: ReposViewOutput?

    // MARK: - Properties
    private var viewItems: [ReposViewItem] = []

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

    func showData(_ data: [ReposViewItem]) {
        self.viewItems = data
        tableView.isHidden = false
        emptyView.isHidden = true
        tableView.reloadData()
    }
}

// MARK: - Setup UI
extension ReposViewController {
    private func setupUI() {
        setupLayouts()
        setupViews()
    }

    private func setupLayouts() {
        view.addSubview(tableView)
        view.addSubview(emptyView)
        emptyView.addSubview(emptyLabel)

        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
        emptyView.snp.makeConstraints { $0.edges.equalToSuperview() }
        emptyLabel.snp.makeConstraints { $0.center.equalToSuperview() }
    }

    private func setupViews() {
        setupNavigationBar()
        setupTableView()
        setupEmptyView()
    }

    private func setupNavigationBar() {
        navigationItem.title = "viper repos".uppercased()
    }

    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
    }

    private func setupEmptyView() {
        emptyLabel.text = "Your data is empy now!!!"
        emptyView.isHidden = false
        emptyView.backgroundColor = .white
    }
}

// MARK: - UITableViewDataSource
extension ReposViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self)) else {
            fatalError("Cannot file UITableViewCell")
        }
        let item = viewItems[indexPath.row]
        cell.textLabel?.text = item.title
        if item.didBookmark {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ReposViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        output?.detail(at: index)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
