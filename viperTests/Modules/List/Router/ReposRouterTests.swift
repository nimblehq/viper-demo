//
//  ReposRouterTests.swift
//  viperTests
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import XCTest
@testable import viper

final class ReposRouterTests: XCTestCase {
    var router: ReposRouter!
    var view: ReposViewController!

    override func setUp() {
        super.setUp()
        view = ReposViewController()
        let navi = UINavigationController(rootViewController: view)
        UIApplication.shared.keyWindow?.rootViewController = navi

        view.output = MockReposViewOutput()

        router = ReposRouter()
        router.view = view
        view.loadViewIfNeeded()

    }

    override func tearDown() {
        view = nil
        router = nil
        super.tearDown()
    }

    func testShowDetail() {
        let expectation = XCTestExpectation(description: "Wait for animation of push controller")
        router.detail(with: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.router.view?.navigationController?.viewControllers.count, 2)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testShowError() {
        let expectation = XCTestExpectation(description: "Wait for animation of present controller")
        let error = NetworkError.json
        router.showError(error)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            XCTAssertNotNil(self.view.presentedViewController)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
}
