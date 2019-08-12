//
//  DetailModule.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class DetailModule {
    let view: RepoViewController
    let presenter: RepoPresenter
    let router: RepoRouter
    let interactor: RepoInteractor
    
    init(repoId: Int) {
        view = RepoViewController()
        router = RepoRouter()
        presenter = RepoPresenter()
        let repoService = Services.shared.api().repoNetwork()
        let imageService = Services.shared.api().imageNetwork()
        
        interactor = RepoInteractor(repoId: repoId,
                                    repoService: repoService,
                                    imageService: imageService)
        connectComponents()
    }
    
    private func connectComponents() {
        view.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = view
        
        interactor.output = presenter
    }
}

// MARK: - VIPER
extension DetailModule: Module {}
