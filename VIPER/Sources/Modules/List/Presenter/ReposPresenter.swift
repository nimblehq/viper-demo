//
//  ReposPresenter.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class ReposPresenter {
    weak var view: ReposViewInput?
    var router: ReposRouterInput?
    var interactor: ReposInteractorInput?
}

// MARK: - VIPER
extension ReposPresenter: Presenter {}

// MARK: - Connect to View
extension ReposPresenter: ReposViewOutput {
    func fetch() {
        interactor?.getRepos()
    }
    
    func detail(at index: Int) {
        if let id = interactor?.getRepoId(at: index) {
            router?.detail(with: id)
        }
    }
}

// MARK: - TodosInteractorOutput
extension ReposPresenter: ReposInteractorOutput {
    func didSuccess(with repos: [String]) {
        if repos.count == 0 {
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
