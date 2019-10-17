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
    func getRepo(at index: Int) -> Repo?
    func updateBookmark(for repoId: Int)
}

// sourcery: AutoMockable
protocol ReposInteractorOutput: AnyObject {
    func didSuccess(with repos: [Repo])
    func didFail(with error: Error)
    func didUpdateRepos(_ repos: [Repo])
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
                self?.output?.didSuccess(with: repos)
            case .failure(let error):
                self?.output?.didFail(with: error)
            }
        }
    }

    func getRepo(at index: Int) -> Repo? {
        guard repos.indices.contains(index) else { return nil }
        return repos[index]
    }

    func updateBookmark(for repoId: Int) {
        repos.first(where: { $0.id == repoId })?.didBookmark = true
        output?.didUpdateRepos(repos)
    }
}
