//
//  TodosViewController.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import UIKit

final class TodosViewController: UIViewController {
    
    // MARK: - Views
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    // MARK: - VIPER
    var output: TodosViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.fetch()
    }
}

// MARK: - VIPER
extension TodosViewController: View {}

// MARK: - Connect to Presenter
extension TodosViewController: TodosViewInput {
    func showEmptyMessage() {
        tableView.isHidden = true
        emptyView.isHidden = false
    }
    
    func showData(_ data: Any) {
        
    }
}

// MARK: - Setup UI
extension TodosViewController {
    private func setupUI() {
        setupNavi()
    }
    
    private func setupNavi() {
        navigationItem.title = "viper todo".uppercased()
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        navigationItem.rightBarButtonItem = addItem
    }
}

// MARK: - Actions
extension TodosViewController {
    @objc func didTapAddButton(_ sender: Any) {
        output?.add()
    }
}
