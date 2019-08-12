//
//  RepoPresenter.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class RepoPresenter {
    weak var view: RepoViewInput?
    var router: RepoRouterInput?
    var interactor: RepoInteractorInput?
}

// MARK: - VIPER
extension RepoPresenter: Presenter {}

extension RepoPresenter: RepoViewOutput {
    func fetch() {
        interactor?.getInfo()
    }
    
    func openWebPage() {
        if let authorPath = interactor?.authorPath() {
            router?.openWebPage(at: authorPath)
        }
    }
}

extension RepoPresenter: RepoInteractorOutput {
    func didSuccess(with item: RepoItem) {
        view?.showViewItem(item)
    }
    
    func didFail(with error: Error) {
        router?.showError(error)
    }
    
    func didLoadImage(with data: Data) {
        view?.showAvatar(data)
    }
}
