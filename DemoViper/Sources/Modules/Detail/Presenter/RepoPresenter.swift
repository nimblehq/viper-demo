//
//  RepoPresenter.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

final class RepoPresenter {

    weak var view: RepoViewInput?
    var router: RepoRouterInput?
    var interactor: RepoInteractorInput?

    weak var output: RepoOutput?
}

// MARK: - RepoViewOutput
extension RepoPresenter: RepoViewOutput {
    func viewDidLoad() {
        view?.configure()
    }

    func openWebPage() {
        if let path = interactor?.authorPath() {
            router?.openWebPage(at: path)
        }
    }

    func bookmarkRepo() {
        view?.enableRightBarButton(false)
        if let id = interactor?.repoId {
            output?.didBookmarkRepo(with: id)
        }
    }
}

// MARK: - RepoInteractorOutput
extension RepoPresenter: RepoInteractorOutput {
    func didSuccess(with repoInfo: Info) {
        let item = RepoItem(repoName: repoInfo.name,
                            repoFullName: repoInfo.fullName,
                            description: repoInfo.description,
                            authorName: repoInfo.owner.login)
        view?.showViewItem(item)
    }

    func didLoadImage(with data: Data) {
        view?.showAvatar(data)
    }

    func didFail(with error: Error) {
        router?.showError(error)
    }
}

// MARK: - RepoInput
extension RepoPresenter: RepoInput {
    func enableBookmark(_ isEnable: Bool) {
        view?.enableRightBarButton(isEnable)
    }

    func fetchRepository(with repoId: Int) {
        interactor?.fetchRepository(with: repoId)
    }
}
