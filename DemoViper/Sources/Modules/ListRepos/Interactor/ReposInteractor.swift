//
//  ReposInteractor.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

// sourcery: AutoMockable
protocol ReposInteractorInput: AnyObject {
    func getRepos()
    func getRepoId(at index: Int) -> Int?
}

// sourcery: AutoMockable
protocol ReposInteractorOutput: AnyObject {
    func didSuccess(with repos: [String])
    func didFail(with error: Error)
}

final class ReposInteractor {
    weak var output: ReposInteractorOutput?
    private let service: RepoNetworkProtocol

    private var repos: [Repo] = []

    init(service: RepoNetworkProtocol) {
        self.service = service
    }
}

// MARK: - ReposInteractorInput
extension ReposInteractor: ReposInteractorInput {
    func getRepos() {
        service.list { [weak self] result in
            switch result {
            case .success(let repos):
                self?.repos = repos
                self?.output?.didSuccess(with: repos.map { $0.fullName })
            case .failure(let error):
                self?.output?.didFail(with: error)
            }
        }
    }

    func getRepoId(at index: Int) -> Int? {
        guard repos.indices.contains(index) else { return nil }
        let repo = repos[index]
        return repo.id
    }
}
