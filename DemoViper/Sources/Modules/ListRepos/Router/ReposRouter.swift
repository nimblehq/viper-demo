//
//  ReposRouter.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

// sourcery: AutoMockable
protocol ReposRouterInput: AnyObject {
    func detail(with id: Int) -> RepoModule
    func showError(_ error: Error)
}

final class ReposRouter {
    
    weak var view: ReposViewInput?

    private var viewController: UIViewController? { 
        return view as? UIViewController
    }
}

// MARK: - ReposRouterInput

extension ReposRouter: ReposRouterInput {
    func detail(with id: Int) -> RepoModule {
        let module = RepoModule()
        viewController?.navigationController?.pushViewController(module.view, animated: true)
        return module
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
