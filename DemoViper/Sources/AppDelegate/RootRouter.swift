//
//  RootRouter.swift
//  DemoViper
//
//  Created by Issarapong Poesua on 8/10/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

final class RootRouter {
    private let reposModule: ReposModule

    init() {
        reposModule = ReposModule()
    }

    func showRepos(on view: UIWindow) -> ReposInput? {
        let controller = UINavigationController(rootViewController: reposModule.view)
        view.rootViewController = controller
        return reposModule.input
    }
}
