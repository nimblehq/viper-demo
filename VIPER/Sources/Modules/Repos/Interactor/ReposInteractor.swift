//
//  ReposInteractor.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class ReposInteractor {
    weak var output: ReposInteractorOutput!
    private let service: RepoNetworkProtocol
    // Maybe we will need a data manager for that
    private var repos: [Repo] = []
    
    init(service: RepoNetworkProtocol) {
        self.service = service
    }
}

// MARK: - VIPER
extension ReposInteractor: Interactor {}

// MARK: - TodosInteractorInput
extension ReposInteractor: ReposInteractorInput {
    func getRepos() {
        service.list { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success(let repos):
                this.repos = repos
                this.output.didFinish(with: repos.map { $0.fullName })
            case .failure(let error):
                this.output.didFail(with: error)
            }
        }
    }
}
