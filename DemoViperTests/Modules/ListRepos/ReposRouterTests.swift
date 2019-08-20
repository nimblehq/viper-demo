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
        // TODOs: Write Test when finish push to another viewController
        /*
        router.detail(with: 0)
        XCTAssertEqual(self.viewController.navigationController?.pushedViewControllers.count, 2)
        */
    }

    func testShowError() {
        let expectation = XCTestExpectation(description: "Wait for animation of present controller")
        let error = NetworkError.json
        router.showError(error)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            XCTAssertNotNil(self.viewController.presentedViewController)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
}
