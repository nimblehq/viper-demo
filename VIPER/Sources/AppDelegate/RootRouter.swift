//
//  RootRouter.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import UIKit

final class RootRouter {
    private let todosModule: TodosModule
    
    init() {
        todosModule = TodosModule()
    }
    
    func showTodos(on view: UIWindow) {
        guard let todosView = todosModule.router.view else { return }
        let controller = UINavigationController(rootViewController: todosView)
        view.rootViewController = controller
    }
}

