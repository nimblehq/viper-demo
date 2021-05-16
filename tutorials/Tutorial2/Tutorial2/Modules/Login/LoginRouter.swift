//
//  LoginRouter.swift
//  Tutorial2
//
//  Created by Su Van Ho on 07/05/2021.
//  
//

import UIKit

protocol LoginRouterInput: AnyObject {

    func show(on window: UIWindow)
    func showHome()
}

final class LoginRouter {

    weak var view: LoginViewInput?
    weak var window: UIWindow?

    private var viewController: UIViewController? {
        view as? UIViewController
    }
}

// MARK: - LoginRouterInput

extension LoginRouter: LoginRouterInput {

    func show(on window: UIWindow) {
        guard let viewController = viewController else { return }
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }

    func showHome() {
        guard let window = viewController?.view.window else { return }
        let module = MyAccountModule()
        module.router.show(on: window)
    }
}
