//
//  ReposModuleTests.swift
//  viperTests
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import XCTest
@testable import viper

final class ReposModuleTests: XCTestCase {

    var module: ReposModule!

    override func setUp() {
        super.setUp()
        module = ReposModule()
    }

    override func tearDown() {
        module = nil
        super.tearDown()
    }

    func testConnectionOfComponents() {
        XCTAssertNotNil(module.view)
        XCTAssertNotNil(module.view.output)
        XCTAssertTrue(module.view.output is ReposPresenter)

        XCTAssertNotNil(module.presenter)
        XCTAssertNotNil(module.presenter.view)
        XCTAssertTrue(module.presenter.view is ReposViewController)
        XCTAssertNotNil(module.presenter.router)
        XCTAssertTrue(module.presenter.router is ReposRouter)
        XCTAssertNotNil(module.presenter.interactor)
        XCTAssertTrue(module.presenter.interactor is ReposInteractor)

        XCTAssertNotNil(module.router)
        XCTAssertNotNil(module.router.view)

        XCTAssertNotNil(module.interactor)
        XCTAssertNotNil(module.interactor.output)
        XCTAssertTrue(module.interactor.output is ReposPresenter)
    }

}
