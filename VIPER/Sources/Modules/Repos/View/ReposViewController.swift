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
extension ReposViewController: View {}

// MARK: - Connect to Presenter
extension ReposViewController: ReposViewInput {
    func showEmptyMessage() {
        tableView.isHidden = true
        emptyView.isHidden = false
    }
    
    func showData(_ data: Any) {
        
    }
}

// MARK: - Setup UI
extension ReposViewController {
    private func setupUI() {
        setupNavi()
    }
    
    private func setupNavi() {
        navigationItem.title = "viper repos".uppercased()
    }
}

// MARK: - Actions
extension ReposViewController {}
