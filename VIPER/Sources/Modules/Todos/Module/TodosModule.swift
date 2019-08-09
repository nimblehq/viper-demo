//
//  TodosModule.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class TodosModule {
    let view: TodosViewController
    let presenter: TodosPresenter
    let router: TodosRouter
    let interactor: TodosInteractor
    
    init() {
        view = TodosViewController()
        router = TodosRouter()
        presenter = TodosPresenter()
        interactor = TodosInteractor()
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
