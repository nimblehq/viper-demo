//
//  RootRouter.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import UIKit

final class RootRouter {
    private let reposModule: ReposModule
    
    init() {
        reposModule = ReposModule()
    }
    
    func showRepos(on view: UIWindow) {
        guard let reposView = reposModule.router.view else { return }
        let controller = UINavigationController(rootViewController: reposView)
        view.rootViewController = controller
    }
}

