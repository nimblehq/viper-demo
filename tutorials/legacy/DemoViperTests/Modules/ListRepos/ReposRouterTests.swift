//
//  ReposRouterTests.swift
//  DemoViper Tests
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import XCTest
@testable import DemoViper

final class ReposRouterTests: XCTestCase {

    var router: ReposRouter!
    
    var viewController: ReposViewController!

    override func setUp() {
        super.setUp()

        viewController = ReposViewController()
        viewController.output = ReposViewOutputMock()
        let navigationController = SpyNavigationController(rootViewController: viewController)
        UIApplication.shared.keyWindow?.rootViewController = navigationController

        router = ReposRouter()
        router.view = viewController
        viewController.loadViewIfNeeded()
    }

    override func tearDown() {
        viewController = nil
        router = nil
        super.tearDown()
    }

    func testShowDetail() {
        router.detail(with: 0)
        let navigationController = viewController.navigationController as? SpyNavigationController
        XCTAssertEqual(navigationController?.pushedViewControllers.count, 2)
    }
}
