//
//  ReposModule.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class ReposModule {
    let view: ReposViewController
    let presenter: ReposPresenter
    let router: ReposRouter
    let interactor: ReposInteractor
    
    init() {
        view = ReposViewController()
        router = ReposRouter()
        presenter = ReposPresenter()
        interactor = ReposInteractor()
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
extension ReposModule: Module {}
