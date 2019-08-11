//
//  TodosPresenter.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class TodosPresenter {
    weak var view: TodosViewInput!
    var router: TodosRouterInput!
    var interactor: TodosInteractorInput!
}

// MARK: - VIPER
extension TodosPresenter: Presenter {}

// MARK: - Connect to View
extension TodosPresenter: TodosViewOutput {
    func add() {
    }
    
    func fetch() {   
    }
}

// MARK: - TodosInteractorOutput
extension TodosPresenter: TodosInteractorOutput {
    
}
