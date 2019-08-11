//
//  ReposRouter.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class ReposRouter {
    weak var view: ReposViewController?
}

// MARK: - VIPER
extension ReposRouter: Router {}

// MARK: - Interface
extension ReposRouter: ReposRouterInput {}
