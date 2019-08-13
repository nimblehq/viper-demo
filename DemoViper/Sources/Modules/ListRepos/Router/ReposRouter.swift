//
//  ReposRouter.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

final class ReposRouter {
    
    weak var view: ReposViewInput?

    private var viewController: UIViewController? { 
        return view as? UIViewController
    }
}

// MARK: - ReposRouterInput

extension ReposRouter: ReposRouterInput {
    func detail(with id: Int) {
        // Create a new module
    }

    func showError(_ error: Error) {
        let alert = UIAlertController(title: "viper".uppercased(),
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok".uppercased(),
                                      style: .default))
        viewController?.present(alert, animated: true)
    }
}
