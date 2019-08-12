//
//  ReposInteractorTests.swift
//  viperTests
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import XCTest
@testable import viper

final class ReposInteractorTests: XCTestCase {

    var interactor: ReposInteractor!
    var output: MockReposInteractorOutput!
    var service: MockRepoNetworkProtocol!

    override func setUp() {
        super.setUp()
        output = MockReposInteractorOutput()
        service = MockRepoNetworkProtocol()
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
        let completion = service.listReceivedCompletion
        let repo = Repo(id: 1, name: "repoName1", fullName: "repoFullName1")
        let repo1 = Repo(id: 2, name: "repoName2", fullName: "repoFullName2")
        let repos: [Repo] = [repo, repo1]
        completion?(.success(repos))
        XCTAssertEqual(repos.map { $0.fullName }, output.didSuccessReceivedRepos)
    }

    func testGetRepoWhenFail() {
        interactor.getRepos()
        let completion = service.listReceivedCompletion
        let error = NetworkError.json
        completion?(.failure(error))
        XCTAssertEqual(output.didFailReceivedError?.localizedDescription, error.localizedDescription)
    }

    func testGetRepoId() {
        interactor.getRepos()
        let completion = service.listReceivedCompletion
        let repo = Repo(id: 1, name: "repoName1", fullName: "repoFullName1")
        let repo1 = Repo(id: 2, name: "repoName2", fullName: "repoFullName2")
        let repos: [Repo] = [repo, repo1]
        completion?(.success(repos))

        let index = 0
        let repoId = interactor.getRepoId(at: index)
        XCTAssertEqual(repoId, 1)
    }
}
