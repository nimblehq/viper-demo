//
//  SpyNavigationController.swift
//  DemoViperTests
//
//  Created by Su Van Ho on 20/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

final class SpyNavigationController: UINavigationController {
    var pushedViewControllers: [UIViewController] = []

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushedViewControllers.append(viewController)
    }
}
