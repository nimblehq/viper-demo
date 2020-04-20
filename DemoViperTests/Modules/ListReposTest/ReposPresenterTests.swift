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
        interactor.getRepoAtReturnValue = Repo(from: """
                                        {"id": 8, "name": "repoName8", "fullName": "repoFullName8"}
                                        """)!
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
        XCTAssertEqual(router.detailWithReceivedId, 8)
    }

    func testDidSuccessWithEmptyData() {
        let repos: [Repo] = []
        presenter.didSuccess(with: repos)
        XCTAssertTrue(view.showEmptyMessageCalled)
    }

    func testDidSuccessWithNonEmptyData() {
        let repo = Repo(from: """
                        {"id": 1, "name": "repoName1", "fullName": "repoFullName1"}
                        """)!
        let repo1 = Repo(from: """
                        {"id": 2, "name": "repoName2", "fullName": "repoFullName2"}
                        """)!
        let repos: [Repo] = [repo, repo1]
        presenter.didSuccess(with: repos)
        XCTAssertEqual(view.showDataReceivedData?.compactMap {$0.title}, repos.compactMap { "@" + $0.fullName })
    }

    func testDidFailWithError() {
        let error = NetworkError.json
        presenter.didFail(with: error)
        XCTAssertTrue(view.showEmptyMessageCalled)
        XCTAssertEqual(router.showErrorReceivedError?.localizedDescription, error.localizedDescription)
    }
}
