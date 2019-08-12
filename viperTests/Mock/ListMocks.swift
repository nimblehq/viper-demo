//
//  ListMocks.swift
//  viperTests
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation
@testable import viper

final class MockReposView: ReposViewInput {

    var showEmptyMessaageCalled: Bool = false
    var showDataReceivedData: [String]?
    var data: [String] = []

    func showEmptyMessage() {
        showEmptyMessaageCalled = true
    }

    func showData(_ data: [String]) {
        showDataReceivedData = data
    }
}

final class MockReposViewOutput: ReposViewOutput {
    func fetch() {}

    func detail(at index: Int) {}
}

final class MockReposRouter: ReposRouterInput {

    var detailReceivedId: Int = 0
    var showErrorReceivedError: Error?

    func detail(with id: Int) {
        detailReceivedId = id
    }

    func showError(_ error: Error) {
        showErrorReceivedError = error
    }
}

final class MockReposInteractor: ReposInteractorInput {
    var getReposCalled: Bool = false
    var getRepoIdReceivedIndex: Int?
    var getRepoIdReturn: Int?

    func getRepos() {
        getReposCalled = true
    }

    func getRepoId(at index: Int) -> Int? {
        getRepoIdReceivedIndex = index
        return getRepoIdReturn
    }
}

final class MockReposInteractorOutput: ReposInteractorOutput {

    var didSuccessReceivedRepos: [String]?
    var didFailReceivedError: Error?

    func didSuccess(with repos: [String]) {
        didSuccessReceivedRepos = repos
    }

    func didFail(with error: Error) {
        didFailReceivedError = error
    }
}

final class MockRepoNetworkProtocol: RepoNetworkProtocol {
    var listReceivedCompletion: ((Result<[Repo], Error>) -> Void)?
    var infoReceivedArguments: (id: Int, completion: (Result<Info, Error>) -> Void)?
    
    func list(completion: @escaping (Result<[Repo], Error>) -> Void) {
        listReceivedCompletion = completion
    }

    func info(id: Int, completion: @escaping (Result<Info, Error>) -> Void) {
        infoReceivedArguments = (id: id, completion: completion)
    }
}
