//
//  ReposPresenterTests.swift
//  viperTests
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import XCTest
@testable import viper

final class ReposPresenterTests: XCTestCase {

    var presenter: ReposPresenter!
    var view: MockReposView!
    var router: MockReposRouter!
    var interactor: MockReposInteractor!

    override func setUp() {
        super.setUp()
        presenter = ReposPresenter()
        view = MockReposView()
        router = MockReposRouter()
        interactor = MockReposInteractor()
        interactor.getRepoIdReturn = 8
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
    }

    override func tearDown() {
        interactor = nil
        router = nil
        view = nil
        presenter = nil
        super.tearDown()
    }

    func testFetchRepos() {
        presenter.fetch()
        XCTAssertTrue(interactor.getReposCalled)
    }

    func testShowDetailRepo() {
        let index: Int = 0
        presenter.detail(at: index)
        XCTAssertEqual(interactor.getRepoIdReceivedIndex, 0)
        XCTAssertEqual(router.detailReceivedId, 8)
    }

    func testDidSuccessWithEmptyData() {
        let repos: [String] = []
        presenter.didSuccess(with: repos)
        XCTAssertTrue(view.showEmptyMessaageCalled)
    }

    func testDidSuccessWithNonEmptyData() {
        let repos: [String] = ["testRepo", "testRepo1"]
        presenter.didSuccess(with: repos)
        XCTAssertEqual(view.showDataReceivedData, repos.map { "@" + $0 })
    }

    func testDidFailWithError() {
        let error = NetworkError.json
        presenter.didFail(with: error)
        XCTAssertTrue(view.showEmptyMessaageCalled)
        XCTAssertEqual(router.showErrorReceivedError?.localizedDescription, error.localizedDescription)
    }
}


