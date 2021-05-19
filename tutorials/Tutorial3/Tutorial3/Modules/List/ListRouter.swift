//
//  ListRouter.swift
//  Tutorial3
//
//  Created by Su Van Ho on 19/05/2021.
//  
//

import UIKit

protocol ListRouterInput: AnyObject {

    func show(on window: UIWindow)
    func showDetailScreen(_ beerId: Int)
}

final class ListRouter {

    weak var view: ListViewInput?

    private var viewController: UIViewController? {
        view as? UIViewController
    }
}

// MARK: - ListRouterInput

extension ListRouter: ListRouterInput {

    func show(on window: UIWindow) {
        guard let viewController = viewController else { return }
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func showDetailScreen(_ beerId: Int) {
        let module = DetailModule(beerId: beerId)
        viewController?.navigationController?.pushViewController(module.view, animated: true)
    }
}
