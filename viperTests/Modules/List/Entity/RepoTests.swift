//
//  RepoTests.swift
//  viperTests
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import XCTest
@testable import viper

final class RepoTests: XCTestCase {

    var repo: Repo!

    override func setUp() {
        super.setUp()
        repo = Repo(id: 1, name: "testRepo", fullName: "repoFullName")
    }

    override func tearDown() {
        repo = nil
        super.tearDown()
    }

    func testInitialization() {
        XCTAssertEqual(repo.id, 1)
        XCTAssertEqual(repo.name, "testRepo")
        XCTAssertEqual(repo.fullName, "repoFullName")
    }
}
