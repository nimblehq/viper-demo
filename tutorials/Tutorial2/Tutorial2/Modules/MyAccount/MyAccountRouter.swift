//
//  MyAccountRouter.swift
//  Tutorial2
//
//  Created by Su Van Ho on 16/05/2021.
//  
//

import UIKit

protocol MyAccountRouterInput: AnyObject {

    func show(on window: UIWindow)
    func showLogin()
}

final class MyAccountRouter {

    weak var view: MyAccountViewInput?

    private var viewController: UIViewController? {
        view as? UIViewController
    }
}

// MARK: - MyAccountRouterInput

extension MyAccountRouter: MyAccountRouterInput {

    func show(on window: UIWindow) {
        guard let viewController = viewController else { return }
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }

    func showLogin() {
        guard let window = viewController?.view.window else { return }
        let module = LoginModule()
        module.router.show(on: window)
    }
}
