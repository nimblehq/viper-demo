//
//  ReposRouterSpec.swift
//  DemoViper Tests
//
//  Created by Nguyen M. Tam on 4/20/20.
//  Copyright © 2020 Nimble Co. Ltd. All rights reserved.
//

import Quick
import Nimble

@testable import DemoViper

final class ReposRouterSpec: QuickSpec {

    override func spec() { 

        var router: ReposRouter!
        var viewController: ReposViewController!

        describe("a Repos router") { 

            beforeEach { 
                viewController = ReposViewController()
                viewController.output = ReposViewOutputMock()
                let navigationController = SpyNavigationController(rootViewController: viewController)
                UIApplication.shared.keyWindow?.rootViewController = navigationController

                router = ReposRouter()
                router.view = viewController
                _ = viewController.view
            }

            context("when detail() is called") {

                beforeEach {
                    _ = router.detail(with: 0)
                }

                it("checks navigation view controller") {
                    let navigationController = viewController.navigationController as? SpyNavigationController
                    expect(navigationController?.pushedViewControllers.count) == 2
                }
            }

            context("when showError() is called") {

                beforeEach {
                    router.showError(NetworkError.json)
                }

                it("checks presented controller") {
                    expect(viewController.presentedViewController).toNotEventually(
                        beNil(),
                        timeout: 3.0,
                        description: "Wait for animation of presented controller"
                    )
                }
            }
        }
    }
}
