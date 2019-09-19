//
//  ReposPresenter.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

final class ReposPresenter {

    weak var view: ReposViewInput?
    var router: ReposRouterInput?
    var interactor: ReposInteractorInput?

    weak var output: ReposOutput?

}

// MARK: - ReposViewOutput
extension ReposPresenter: ReposViewOutput {
    func viewDidLoad() {
        interactor?.getRepos()
        view?.configure()
    }

    func detail(at index: Int) {
        if let repo = interactor?.getRepo(at: index) {
            let module = router?.detail(with: repo.id)
            module?.output = self
            module?.input?.fetchRepository(with: repo.id)
            module?.input?.enableBookmark(!(repo.didBookmark ?? false))
        }
    }
}

// MARK: - ReposInteractorOutput
extension ReposPresenter: ReposInteractorOutput {
    func didUpdateRepos(_ repos: [Repo]) {
        let viewItems = repos.map { ReposViewItem(title: "@" + $0.fullName, didBookmark: $0.didBookmark ?? false) }
        view?.showData(viewItems)
    }

    func didSuccess(with repos: [Repo]) {
        if repos.isEmpty {
            view?.showEmptyMessage()
        } else {
            let viewItems = repos.map { ReposViewItem(title: "@" + $0.fullName, didBookmark: $0.didBookmark ?? false) }
            view?.showData(viewItems)
        }
    }

    func didFail(with error: Error) {
        view?.showEmptyMessage()
        router?.showError(error)
    }
}

// MARK: - RepoOutput
extension ReposPresenter: RepoOutput {
    func didBookmarkRepo(with repoId: Int) {
        interactor?.updateBookmark(for: repoId)
    }
}

// MARK: - ReposInput
extension ReposPresenter: ReposInput {}
