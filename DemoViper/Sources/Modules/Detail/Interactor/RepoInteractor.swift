//
//  RepoInteractor.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

final class RepoInteractor {

    weak var output: RepoInteractorOutput?
    private let repoService: RepoNetworkProtocol
    private let imageService: ImageNetworkProtocol

    private var info: Info?
    private var repoId: Int

    init(repoId: Int, repoService: RepoNetworkProtocol, imageService: ImageNetworkProtocol) {
        self.repoId = repoId
        self.repoService = repoService
        self.imageService = imageService
    }
    
}

// MARK: - RepoInteractorInput
extension RepoInteractor: RepoInteractorInput {
    func getInfo() {
        repoService.info(id: repoId) { [weak self] result in
            switch result {
            case .success(let info):
                self?.info = info
                self?.downloadAvatar()
                self?.output?.didSuccess(with: info.repoItem)
            case .failure(let error):
                self?.output?.didFail(with: error)
            }
        }
    }

    func authorPath() -> String {
        guard let info = self.info else { fatalError("Data not found!!") }
        return info.owner.htmlPath
    }
}

// MARK: - Actions
extension RepoInteractor {
    private func downloadAvatar() {
        guard let info = self.info else { return }
        imageService.download(path: info.owner.avatarPath) { [weak self] result in
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
