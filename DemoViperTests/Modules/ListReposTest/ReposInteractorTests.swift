//
//  ReposInteractorTests.swift
//  DemoViper Tests
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import XCTest
@testable import DemoViper

final class ReposInteractorTests: XCTestCase {

    var interactor: ReposInteractor!
    var output: ReposInteractorOutputMock!
    var service: RepoNetworkProtocolMock!

    override func setUp() {
        super.setUp()
        output = ReposInteractorOutputMock()
        service = RepoNetworkProtocolMock()
        interactor = ReposInteractor(service: service)
        interactor.output = output
    }

    override func tearDown() {
        service = nil
        output = nil
        interactor = nil
        super.tearDown()
    }

    func testGetReposWhenSuccess() {
        interactor.getRepos()
        let completion = service.listCompletionReceivedCompletion
        let repo1 = RepoInstance.repo1
        let repo2 = RepoInstance.repo2
        let repos: [Repo] = [repo1, repo2]
        completion?(.success(repos))
        let reposFullname = output.didSuccessWithReceivedRepos?.map { $0.fullName }
        XCTAssertEqual(repos.map { $0.fullName }, reposFullname)
    }

    func testGetRepoWhenFail() {
        interactor.getRepos()
        let completion = service.listCompletionReceivedCompletion
        let error = NetworkError.json
        completion?(.failure(error))
        XCTAssertEqual(output.didFailWithReceivedError?.localizedDescription, error.localizedDescription)
    }

    func testGetRepoId() {
        interactor.getRepos()
        let completion = service.listCompletionReceivedCompletion
        let repo1 = RepoInstance.repo1
        let repo2 = RepoInstance.repo2
        let repos: [Repo] = [repo1, repo2]
        completion?(.success(repos))

        let repoId = interactor.getRepo(at: 0)?.id
        XCTAssertEqual(repoId, 1)
    }
}
