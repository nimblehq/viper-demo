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
        interactor.getRepoAtReturnValue = RepoInstance.repo8
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
        let repo1 = RepoInstance.repo1
        let repo2 = RepoInstance.repo2
        let repos: [Repo] = [repo1, repo2]
        presenter.didSuccess(with: repos)
        XCTAssertEqual(view.showDataReceivedData?.map {$0.title}, repos.map { "@" + $0.fullName })
    }

    func testDidFailWithError() {
        let error = NetworkError.json
        presenter.didFail(with: error)
        XCTAssertTrue(view.showEmptyMessageCalled)
        XCTAssertEqual(router.showErrorReceivedError?.localizedDescription, error.localizedDescription)
    }
}
