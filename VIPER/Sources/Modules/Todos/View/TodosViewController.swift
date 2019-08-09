//
//  TodosViewController.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import UIKit

final class TodosViewController: UIViewController {
    // MARK: - VIPER
    var output: TodosViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - Connect to Presenter
extension TodosViewController: TodosViewInput {
    func applyViewItem(_ item: TodosViewItem) {
    }
}

// MARK: - Setup UI
extension TodosViewController {
    
}
