//
//  LoginRouter.swift
//  Tutorial1
//
//  Created by Su Van Ho on 07/05/2021.
//  
//

import UIKit

protocol LoginRouterInput: AnyObject {

    func show(on window: UIWindow)
}

final class LoginRouter {

    weak var view: LoginViewInput?

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
}
