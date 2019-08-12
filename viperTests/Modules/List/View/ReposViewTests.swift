//
//  ReposViewTests.swift
//  viperTests
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import XCTest
@testable import viper

final class ReposViewTests: XCTestCase {
    var view: ReposViewController!

    override func setUp() {
        super.setUp()
        view = ReposViewController()
        view.loadViewIfNeeded()
    }
    
    func testShowingEmptyMessage() {
        view.showEmptyMessage()
        XCTAssertTrue(view.tableView.isHidden)
        XCTAssertFalse(view.emptyView.isHidden)
    }
    
    func testShowingData() {
        let data: [String] = ["testRepo", "testRepo1"]
        view.showData(data)
        XCTAssertFalse(view.tableView.isHidden)
        XCTAssertTrue(view.emptyView.isHidden)
        XCTAssertEqual(view.tableView.numberOfRows(inSection: 0), data.count)
    }
}
