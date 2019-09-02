//
//  ReposViewControllerTests.swift
//  DemoViper Tests
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import XCTest
@testable import DemoViper

final class ReposViewControllerTests: XCTestCase {

    var viewController: ReposViewController!
    
    var output: ReposViewOutputMock!

    override func setUp() {
        super.setUp()
        output = ReposViewOutputMock()
        viewController = ReposViewController()
        viewController.output = output
        viewController.loadViewIfNeeded()
    }

    override func tearDown() {
        output = nil
        viewController = nil
        super.tearDown()
    }

    func testViewDidLoad() { 
        viewController.viewDidLoad()
        XCTAssertTrue(output.viewDidLoadCalled)
    }

    func testShowingEmptyMessage() {
        viewController.showEmptyMessage()
        XCTAssertTrue(viewController.tableView.isHidden)
        XCTAssertFalse(viewController.emptyView.isHidden)
    }
}
