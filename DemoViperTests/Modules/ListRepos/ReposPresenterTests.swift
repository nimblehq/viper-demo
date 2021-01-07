//
//  ReposPresenterTests.swift
//  DemoViper Tests
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import XCTest
@testable import DemoViper

final class ReposPresenterTests: XCTestCase {

    var presenter: ReposPresenter!

    var router: ReposRouterInputMock!
    var interactor: ReposInteractorInputMock!
    var view: ReposViewInputMock!
    var output: ReposOutputMock!

    override func setUp() {
        super.setUp()

        router = ReposRouterInputMock()
        router.detailWithReturnValue = RepoModule()
        interactor = ReposInteractorInputMock()
        interactor.getRepoAtReturnValue = Repo(id: 8, name: "repoName8", fullName: "repoFullName8")
        view = ReposViewInputMock()
        presenter = ReposPresenter()
        output = ReposOutputMock()
        presenter.output = output

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
    }

    override func tearDown() {
        interactor = nil
        router = nil
        view = nil
        presenter = nil
        super.tearDown()
    }

    func testViewDidLoad() { 
        presenter.viewDidLoad()
        XCTAssertTrue(view.configureCalled)
        XCTAssertTrue(interactor.getReposCalled)
    }

    func testShowDetailRepo() {
        let index: Int = 0
        presenter.detail(at: index)
        XCTAssertEqual(interactor.getRepoAtReceivedIndex, 0)
        XCTAssertEqual(router.detailWithReceivedId, 8)
    }

    func testDidSuccessWithEmptyData() {
        let repos: [Repo] = []
        presenter.didSuccess(with: repos)
        XCTAssertTrue(view.showEmptyMessageCalled)
    }

    func testDidSuccessWithNonEmptyData() {
        let testRepo1 = Repo(id: 1, name: "repoName1", fullName: "repoFullName1")
        let testRepo2 = Repo(id: 2, name: "repoName2", fullName: "repoFullName2")
        let repos: [Repo] = [testRepo1, testRepo2]
        presenter.didSuccess(with: repos)
        XCTAssertEqual(view.showDataReceivedData, repos.map { ReposViewItem(title: "@" + $0.fullName, didBookmark: false) })
    }

    func testDidFailWithError() {
        let error = NetworkError.json
        presenter.didFail(with: error)
        XCTAssertTrue(view.showEmptyMessageCalled)
        XCTAssertEqual(router.showErrorReceivedError?.localizedDescription, error.localizedDescription)
    }
}
