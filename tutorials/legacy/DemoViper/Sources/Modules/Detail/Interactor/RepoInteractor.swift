//
//  RepoInteractor.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
protocol RepoInteractorInput: AnyObject {
    var repoId: Int? { get }
    func fetchRepository(with repoId: Int)
    func authorPath() -> String
}

// sourcery: AutoMockable
protocol RepoInteractorOutput: AnyObject {
    func didSuccess(with repoInfo: Info)
    func didLoadImage(with data: Data)
    func didFail(with error: Error)
}

final class RepoInteractor {

    weak var output: RepoInteractorOutput?
    private let repoService: RepoNetworkProtocol
    private let imageService: ImageNetworkProtocol

    private var info: Info?

    var repoId: Int? {
        return info?.id
    }

    init(repoService: RepoNetworkProtocol, imageService: ImageNetworkProtocol) {
        self.repoService = repoService
        self.imageService = imageService
    }
}

// MARK: - RepoInteractorInput
extension RepoInteractor: RepoInteractorInput {
    func fetchRepository(with repoId: Int) {
        repoService.info(id: repoId) { [weak self] result in
            switch result {
            case .success(let info):
                self?.info = info
                self?.downloadAvatar()
                self?.output?.didSuccess(with: info)
            case .failure(let error):
                self?.output?.didFail(with: error)
            }
        }
    }

    func authorPath() -> String {
        guard let info = self.info else { fatalError("Data not found!!") }
        return info.owner.htmlUrl
    }
}

// MARK: - Actions
extension RepoInteractor {
    private func downloadAvatar() {
        guard let info = self.info else { return }
        imageService.download(path: info.owner.avatarUrl) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success(let data):
                this.output?.didLoadImage(with: data)
            case .failure(let error):
                this.output?.didFail(with: error)
            }
        }
    }

}
