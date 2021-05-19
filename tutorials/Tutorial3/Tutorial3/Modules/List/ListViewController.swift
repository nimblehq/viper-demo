//
//  ListViewController.swift
//  Tutorial3
//
//  Created by Su Van Ho on 19/05/2021.
//  
//

import UIKit

protocol ListViewInput: AnyObject {

    func configure()
    func reloadData()
}

protocol ListViewOutput: AnyObject {

    func viewDidLoad()
    func numberOfItems() -> Int
    func viewModel(at index: Int) -> BeerItemCell.ViewModel
    func didSelectRow(at index: Int)
}

final class ListViewController: UIViewController {

    var output: ListViewOutput?
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

    private func setUpLayouts() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func setUpViews() {
        navigationItem.title = "Beers"
        view.backgroundColor = .systemGroupedBackground

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BeerItemCell.self, forCellReuseIdentifier: "BeerItemCell")
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: - ListViewInput

extension ListViewController: ListViewInput {

    func configure() {
        setUpLayouts()
        setUpViews()
    }

    func reloadData() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output?.numberOfItems() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "BeerItemCell",
                for: indexPath
        ) as? BeerItemCell else {
            return UITableViewCell()
        }
        if let viewModel = output?.viewModel(at: indexPath.row) {
            cell.configure(viewModel: viewModel)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.didSelectRow(at: indexPath.row)
    }
}
