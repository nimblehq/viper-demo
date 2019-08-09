//
//  TodosRouter.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class TodosRouter {
    weak var view: TodosViewController?
}

// MARK: - Interface
extension TodosRouter: TodosRouterInput {}
