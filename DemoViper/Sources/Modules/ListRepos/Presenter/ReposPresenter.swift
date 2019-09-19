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
        if let id = interactor?.getRepoId(at: index) {
            router?.detail(with: id)
        }
    }
}

// MARK: - ReposInteractorOutput
extension ReposPresenter: ReposInteractorOutput { 
    func didSuccess(with repos: [String]) {
        if repos.isEmpty {
            view?.showEmptyMessage()
        } else {
            view?.showData(repos.map { "@" + $0 })
        }
    }

    func didFail(with error: Error) {
        view?.showEmptyMessage()
        router?.showError(error)
    }
}

// MARK: - ReposInput
extension ReposPresenter: ReposInput {}
