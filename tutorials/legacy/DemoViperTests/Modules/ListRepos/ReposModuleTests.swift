//
//  ReposModuleTests.swift
//  DemoViper Tests
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import XCTest
@testable import DemoViper

final class ReposModuleTests: XCTestCase {

    var output: ReposOutput!
    var module: ReposModule!

    override func setUp() {
        super.setUp()

        output = ReposOutputMock()
        module = ReposModule()
        module.output = output
    }

    override func tearDown() {
        output = nil
        module = nil
        super.tearDown()
    }

    func testReposIsCorrect() {
        let view = module.view
        XCTAssertTrue(view.output is ReposPresenter)

        let presenter = module.presenter
        XCTAssertTrue(presenter.view is ReposViewController)
        XCTAssertTrue(presenter.router is ReposRouter)
        XCTAssertTrue(presenter.interactor is ReposInteractor)
        XCTAssertTrue(presenter.output === output)
        XCTAssertTrue(presenter === module.input)

        let interactor = module.interactor
        XCTAssertTrue(interactor.output is ReposPresenter)

        let router = module.router
        XCTAssertTrue(router.view is ReposViewController)
    }
}
